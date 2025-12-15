Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685EDD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+4nhdhc7DGP97lj4YbTwTUwQWOa8pF5rWyMqN7OvBw=; b=iwKYdgjKxZcvdfWaucY83mtle6
	V7b0Y7z9ibfzWZTsB9FLAMP0Zz9K/rfxSYbNapw0KXf4gdB61cyvhfD0+theNU9tDE6TQkIJfX8zv
	stdqdPh/u29V+7hDfIgXmW3x63ReBnDbvaNkGEARKKvx7vyitkW5lj/CMvesHPAz2FKBX68IcVPm5
	+QCPVigSl2GSGl5PsR+OaaZX0z8OX3qrC8YMpkFVzsLQaxANuAO1P4y45ZDx3VvQm1y49tscByJ0g
	DT4YF3zw0IoEfGmOzB4h7KxHYhkxSHjxjWznGLKySX8kn+bTPpaXxzwS/9p5JbxyFXY7ni8/4LWDN
	qseOKfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7fF-00000003c6Q-2oM6;
	Mon, 15 Dec 2025 12:26:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7fC-00000003c59-2f6Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 12:26:56 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCCZmQ2339228;
	Mon, 15 Dec 2025 13:26:49 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1kyq3u4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:26:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hbo5KnFCnR8iG6TuKn2m/KrmG8ks7gERlz0zRX8us0KwM+rmCPZAO/9RWaue4YYV1WgIT3CHt3AK7SqqCQyxevAZAzuvnu8nT+X4fMn2Rs3Gl+ng3/ghD6S88J/MO1Rn0FeR8elOHJMmeGu6i5xX2DU222Pjej8WOIillLa3PFsTJy4eERowteZ1Cao4CTnO4cP8VLGiGpOMObLzVN/HgKclId+BAtbUO0OS5hv9tALI6lCsT81VXXs6dNYB9WMyKAZGaPb2RAjKwVu8OrvXISYU2STruLfIV2oxG6vI+U9CAXMqvdTim9tQ1YPxpbgl1JOixfzolsSVmJGtcIDtcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+4nhdhc7DGP97lj4YbTwTUwQWOa8pF5rWyMqN7OvBw=;
 b=peTConNKyHVHtGyv6v2WbbWq35ITakvOJmT0A96vhRycA7gvgWVHATHrp1CWGyA7wUC+3HmJz39lro2WNQA5zrh/nSWswNWtKx5NDKKUd/HX4+v/xJClYNCQ/KjKAxfVzPKQzVtNSl+SDDdz2edVxYwnH13RSfUFc5zf+A/vFaaO75hLk2XuNsA0wywB6/c9iqdeQL/svqMfqSkQ98wNKxM+FYwz0FfKibeo0F4X6+RUx5paJBwcFOzS2lBqrqXDn46TKJgY3YVYhd4o09opclvRlwFzlCFVPC13M2E+/SJpRxzyzvophRkHeqyOpLH/wBa8kysm0WmTzcgz3g6eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+4nhdhc7DGP97lj4YbTwTUwQWOa8pF5rWyMqN7OvBw=;
 b=YlbW1zqB1cNDxEUUisU4VLc8wszXnEW2FOkKrKSGL5aezZ8OxkghzYENEiGEC04FUC4/ShT8V29XXuo6675CZBdXJpURi5b1iY+xq6BFXM6cx/PJCSzjccyBSDqpEJMASq+YZ3PaQR9tfk6pzN0uSvcwLNKTwltdT7TlEE1ylWsIlcABg1J+0x4PEQQT0/UK9DntR6oZGAV6waL8iX8tzVna2PSdbKL/49sEg5kLtzeVfJejuM4d/1bmEHH6kTb/6tONH4OeG6dYxzoJoxqDR8q6JPtdFVCdh6Q0KCCOgxwyIYdiGFUiK9C0WDswksOmO+Mx/+b4I0q8bs9rtbbSug==
Received: from DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) by DU0PR10MB6203.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3eb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:26:45 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::94) by DUZPR01CA0097.outlook.office365.com
 (2603:10a6:10:4bb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:26:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:27:28 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:26:44 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:26:22 +0100
Subject: [PATCH 3/3] arm64: dts: st: add power-domains in all spi of
 stm32mp231.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-spi-mp2x-dt-updates-v1-3-464a5fd20f13@foss.st.com>
References: <20251215-stm32-spi-mp2x-dt-updates-v1-0-464a5fd20f13@foss.st.com>
In-Reply-To: <20251215-stm32-spi-mp2x-dt-updates-v1-0-464a5fd20f13@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|DU0PR10MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: ce447c6a-674d-4239-f0c6-08de3bd535ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dldjem9JVEV2MnMrb1J0YmF1cHpvS1N6TEErdG5jUTg2dWk3b3FISytvUEV1?=
 =?utf-8?B?cjVKUVhuZDN4UG1zbXFJekg1b2RRcGI5WmgyY2hLTFA3VWFxczBxMEdOUy9o?=
 =?utf-8?B?dDVYZ3Y1U29QV0RpcVE3cElLd00xQStyL1lBRXpGcjRZd3FjeHZRS1BKdDBo?=
 =?utf-8?B?MVNnMkVveTFISjVMQ0lIQVNmMHhtczllQzdId2R6SzdzUW82dVNVNjhjYWp1?=
 =?utf-8?B?RGtjY3JpMllOcTNWZzd0ZTNYVjMrUGxKMjBUVGRXdDR1VExVNWJ6UE5QWDg2?=
 =?utf-8?B?UkF3ZEhkQzBoT2hZWXFRRzl4aURjRnltbDFJU1RmcHZIRUdBODhKS3E2NTcx?=
 =?utf-8?B?eE9pSVdZRlRNNTQvblpvaFhWZnZVT0MwT1NrVlV3MFZsVzVZcFA4bUxvZkpE?=
 =?utf-8?B?QkpuRjZnWmk3L3pWWWttYXUzNXVGUHJUeFhhbEFZQmo5YXVpUFZUVlpDQ3BR?=
 =?utf-8?B?WmZXQ3FYNFQrQnVrdk9kK2l6YkVxUWVRWWpGOEluTlhVQ0E1dVgrNWJWdXJO?=
 =?utf-8?B?eWNSME1uYUFna1NucVNLTzdHa212VEpIa0hqVEExejVCajNPK2c1UG5LaGRI?=
 =?utf-8?B?Mzd3V0E2Y0xzNU1Jak9mVzFQRGwrUVl3SzRBT3lNT1JRR2M0VXdFSGhxaEJz?=
 =?utf-8?B?SDNVcWp1VmxJbFVYbDVGZ3hiYi9la29WeHBFcTh2RWlEYlFXUU1CdlFXMlQy?=
 =?utf-8?B?YXFHNktDMWsvdGcxSDIxcXIzdWZXcmxNaUVyV0cwRTlEZU5iRGlDSG8zNXZO?=
 =?utf-8?B?V20vQlQ2YzJ2K1Y5c0xTd3JEN2VlQ3RFdEhpVkdobVJuNTlCZUZROWd2b3NC?=
 =?utf-8?B?Zk51RE50cFozZVB3RFVsc3NORDJreGMvUkVocXplejB4dWN0b1kxQzdNWFc1?=
 =?utf-8?B?RmprQlA1OXJ1T0JBWnk2TFRFRU9LaGJISTdiNUUzWlY1aHZscmkrSm50VERm?=
 =?utf-8?B?WmxLTEo1SUsybzhYMU9tQ0lYSC9TNlVVY0xwSXh3SjE0c29PaDFjM21LelZ4?=
 =?utf-8?B?eVczWERFRkdVRE1odHJxN3ZreXcyeDFJdy9HTktlTFBENlpZY3lneVRVMHVU?=
 =?utf-8?B?TnBqR21LRkRLcmRZTGF2ZWlHUlByQzBLOURIOXN3eHNucFVYVjBySUNkSlFB?=
 =?utf-8?B?Q0ZFVkM0VmdsUDdPUXpteVkwSEg1RTYrdUJIWkFndTdXUUJSN1FLbWJldXNh?=
 =?utf-8?B?ZkVLUDFjdzZDN1YxcXJ2RTFpRVNZRGVRNlBZUU9yQ1B1dnV5aFpEQWhVd0dF?=
 =?utf-8?B?QVMwUmJkYSs2NzF3N0laS3FGZ3NFZ0QvVGd3bThOb1M1a25HMWVIcWh5QmdL?=
 =?utf-8?B?Z2Z3YnR3dWhHMzlBYUtqTi91SEVRVTFVdkxiWmpSUTQ3OWhTbC9XY0t2OHIy?=
 =?utf-8?B?L1o1WG1vUzEzNDMyRFZEbU01OG5iWTVzUU9oN3MvLzhPaUhOaFJGYW5sL1RO?=
 =?utf-8?B?MWppeWQ5MWhseThNY0t6LzhKSFJVZHo2QnoyUkNpSmJZTzAvMmVhMlZPTHd3?=
 =?utf-8?B?OWVGVkVwVFBGa0cvdlhUTWtvT1o4Z1dXOXRRSDZlU1pzV2lWOHQxYnlJckpI?=
 =?utf-8?B?MjNTSlB6NU9wSUVaMHlkcGM1MkZXZmNubXVCU2xXaFNOcnNYdVFxYjZQWHZP?=
 =?utf-8?B?WEFMUlBab2VERzk3aXBpNHM0UWFxWkthNmRnZVExM09LY2gydzhnNkNia1FC?=
 =?utf-8?B?YUlCVUhTWjZqaEpzNVR6MmwveEVWU0xRMEZNczhVclgraVZHcjJzaC9Lelcv?=
 =?utf-8?B?UHdCbityMzJlVUJUTENXd1RtYlAyRnlzMG1yQmw2NWNodlNZSTlJZjBiUGpk?=
 =?utf-8?B?UEM1MUZnZ2MxRkcrcGxTbGp6ZkdJNkxrN2kvSExYWUFGeWg1MXVJL3VPSGUv?=
 =?utf-8?B?UVk2SnlXR3J2UDhZUHJJaGtKVnZlbnF5Q1htc1d3QkFEcDFwQ2lLSEpWMURE?=
 =?utf-8?B?Z0FIdXBBZUI0T3lrSlVMV2RocXFlRkxUcmZkTFc5NXJlY25pdTZwRHRVUkto?=
 =?utf-8?B?N1BsRCttVXdkZENZcjlkVjlQYkFrMFp3NnVpS1lQaFk5SWtuN3hnem9wTWFL?=
 =?utf-8?B?U1Z6M2tOeVdHWTJJeG1saVFDUXFva0FYdkJPbysrTWlmT3JvaTZMT1dqbjBp?=
 =?utf-8?Q?e9nQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:26:45.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce447c6a-674d-4239-f0c6-08de3bd535ff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6203
X-Authority-Analysis: v=2.4 cv=DtJbOW/+ c=1 sm=1 tr=0 ts=693ffe88 cx=c_pps
 a=hVkbKOSgbXxpVlUS3DC2SA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=hNtAVtyWxvtx-I5h3M0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: bj12gMz3a9BefcW2oiP8Yt23PQrcc8Dw
X-Proofpoint-ORIG-GUID: bj12gMz3a9BefcW2oiP8Yt23PQrcc8Dw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNyBTYWx0ZWRfX7V8tMp2oroyC
 cz+63YJ0DwwXDTcOz/gZzZvWGeKlFnyM24WOAFAw+sXN+krgs5SX5sshDgrQepuqJI+N/T/lHy/
 VSLbVBGRGT3kkwjzkp9Jbiep9xf8TudGVMRZSut3xzZkkOgehptqelCFwDLu/MTFCKbUdcditqj
 xiF4oQjocZb9sWbsX2ljYrMfuhJDcUk3uEElZIuEgErRg0i6iKCR/uB0o7O62FDchzKn5tro6Jv
 vx4DkrpajYJ4OT0IZWp3fxsozoj4hrGJzJiSajOSAyPePKXeZ58dLbeqG3uOLjn9CN179mwPjzb
 fzwGCUGTpYBIP+YmxxxBQOvWjagQV5TLJXFgzIBVcH1AZTvJHfBRdlNRXZbxGyav/s2Flv19fGD
 ySjuz2xevoBlL8Ha9V/XAkWQf3k65g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_042655_063339_A9F0EAE5 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the power-domains property in all spi instances available
on the stm32mp231.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..6b1cd5cd2cfb 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -251,6 +251,7 @@ spi2: spi@400b0000 {
 				       <&hpdma 52 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 23>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -281,6 +282,7 @@ spi3: spi@400c0000 {
 				       <&hpdma 54 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 24>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -433,6 +435,7 @@ spi1: spi@40230000 {
 				       <&hpdma 50 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 22>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -448,6 +451,7 @@ spi4: spi@40240000 {
 				       <&hpdma 56 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 25>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -463,6 +467,7 @@ spi5: spi@40280000 {
 				       <&hpdma 58 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 26>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 

-- 
2.34.1


