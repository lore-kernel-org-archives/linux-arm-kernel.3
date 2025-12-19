Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EC7D78794
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnL+Q6MINJFOz0CWX4mfHr6V7G0RG3B6rRX1pk4+5s8=; b=fsx+O+knIc6Q5su7MucSbS517v
	PVcpAa3lYFXegTU2sbl9gt4ojOCMEftsmdLJNJUDUoGWWqopGvDuWZqjk6EkUX9l5NwdxC5Uy9keZ
	U5s4hV6+IJfXQX9MVHUSl2d5baEAEzoKCLqQfIHxLvxIaYXq3orGliUbCuK9GXVBex6NoN2yV4X7d
	Bn0OKLlC90bWEVIUizUtr9ky/Haazz0XR/fcVUCONdrwspPktH13bf578M2/NznbWSKQ1yMj1bfTO
	vRpIZQditMJ8MRpZb2m0ncqVBJWlwKaoQbfFWppg2nVlB/OGhcZErVr7TLEyxChvC/C2NsVS1m6jX
	oebnWR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcsS-0000000Ab2r-2SsI;
	Fri, 19 Dec 2025 15:58:48 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcsL-0000000AayQ-2KD6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:58:44 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFsVA51526203;
	Fri, 19 Dec 2025 16:58:35 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31bxay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mig93OjyqzcUCgfj91wAxVdmglhEZzipyebHc1Obq19Wt6duWXgAz0ClYsWAdoZe2PGhdCUj7QygWwmdtr+vclQd4iXx+wUhZnF1gRLqF+rlsyhH9ZT6oWAiDGzOTbTZrCMUY8+6PLUhtRGICzKySJvkJzhs+62Mg+RELejMWRWhPQz1lJlpDHguSB3Ax1kgNtbpJptB45UTl4ckHR1s3juzdwtkYJppMCQdlO29nau1IbMUWSQL1gxs14GizoKY4TvVEZdfCFxgDPgjrd3HHYRYViK79uYmPzwu8Ytb01Jxu58a80QRhmyECHvPrBFF434bLWXLi6JgOAR855tCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnL+Q6MINJFOz0CWX4mfHr6V7G0RG3B6rRX1pk4+5s8=;
 b=wp5Z4u1S9WywCCIes6LHzC5SAgFL0gfWiaXV4/4geXE5eHg3cLQPh9NykE2KkhHomny50SsjdowWT2vcBa5pW43/C774nu/BtxO65HQr4BYvWENxz+WdUyfjMDMzABZmcwuuiZZu2E8aj7FJLl3AXjTmJ7Y0FSGLHvM/7ZMTfsIbTsXA9wwhdrq670eBRNPb7q5LTss/A1E2XroWuKl/+R/kavzDUAd9gdvo/AyiT4AQnqyogPKf7btapLV6IHyPViF4vX6vO1tK84fRbMO/Sj+MHvPDPvvB/8HDQyKGoEvM6KImoq/oSQiEcwtK5fa/wQzmmr+wTnYL7RoP5bNflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnL+Q6MINJFOz0CWX4mfHr6V7G0RG3B6rRX1pk4+5s8=;
 b=ekUTg6XeHP6COHsst2oscP6OOh1oFZiWSKz1ciqWADnB5OxNr67onIRSx7GvGTyB8TmATeV074MNJNC2mCwToz+39GUJ+a35x/hVXksENeSL7ie33B3ZGPfwcIxZodsTfb9+q/gXizbc/cJPgOGih1e+3n7CYxSCCiVpdwIt4ebgpAyu+P4lbj2XNR5o25wxB4wkvGOY6Q7QgAXNJ0N5WXjqIjokRBumavLLSDQdTn3+HuWBUK+BzR+8SXGiCaBcF88+U3tIOlItIIa1DFdN0U+Pjl7xTRoeFOPy73jlxwrRycCxTF8aJpBHA7IDlvfh989J8y84BgtAmy1UhOXLuA==
Received: from DU6P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::28)
 by PA3PR10MB9331.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:58:33 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::2c) by DU6P191CA0029.outlook.office365.com
 (2603:10a6:10:53f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:18 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 16:58:08 +0100
Subject: [PATCH 6/6] arm64: dts: st: add power-domain of dcmipp in
 stm32mp231.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-6-a6edb2aa8154@foss.st.com>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|PA3PR10MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 89dfb8c3-1361-4c16-c314-08de3f17762e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFoS2pBZ1ZIbWFGbEsyemVzS1puT2JWNjUxUFF4K1JPZjVjN0lkZ3ZxRWln?=
 =?utf-8?B?d3hEZDAzOExnWWVyczQ5eW1qcFRzRDVjT2I4elRBeVo2OVVGWXFrUVkreFNF?=
 =?utf-8?B?ZVJZVWVGSEhWcktXQjcxMTdPeWh1QXJqc1RDTVduNGU4M1lBbzhDaTdlcWJG?=
 =?utf-8?B?bWhhR3l4WlA1am9JQWxFVW5MRzhJbXpXOEhRREgzdzk5UllhVFV4WE1nRE4x?=
 =?utf-8?B?UWlvN1FkTzY5UnFHR0FnTzJCaVhIbjYzU21OR1FRSXhtMDhISXlJem1Cd3p4?=
 =?utf-8?B?NTVzSEw1REQ3dVhiTVRBZHlDSGgwVlhhODNvcVR1T25xekkvWkhsVW8yMTRv?=
 =?utf-8?B?Qk83SDloTXM2YitaenJYUzY4VGZvckNrOXJqQnpaMFJ5NjJXK1hQR1hIejN4?=
 =?utf-8?B?YlJGZFZ0YmNBbzduWjVpR0VpMlZiQU81bklLaEozK1NqTW5oRzBTTC9iZVFC?=
 =?utf-8?B?YUo5SmkwZXM2QmpVbDJ6eTFJdGM5S0JNMTZKV3BoRE1iOHhDMlFFWVlqYUcw?=
 =?utf-8?B?UktzWUpXMVNFaWI4VllBR0Yyd2tPNFhOUW5OQVE4Zm5hZVQ5NUNpVVN4eUNT?=
 =?utf-8?B?R0Iyd3VJY0QzaCt0dUxxN1NRUnZ5ek9pL3dKMi9HZzRFY0phd0tCeDY4eUl0?=
 =?utf-8?B?M2R3Z3lreGhJMWpHM1BaY0swY2VaZnNlMkZjNkplQ0FydVpnVGNlSGVQMVcx?=
 =?utf-8?B?N2lsS2FUTHBKUkxuL2Q0bnAxTUNESEhiZzh3NHpKYkVnNStsTFZHbWMrZ005?=
 =?utf-8?B?K0FlZUhBZFNEVUlHVDVtUEpQRks0dVVhRlgzZVNWblBIeXFHUndoQzB6enNr?=
 =?utf-8?B?K3BibUNTY1M0M2FFSkNaRmRhcE1EUmIzQ0drOWlQT1hGcGY5SDZhUHlqK2Z6?=
 =?utf-8?B?TU4wVEVVTE1ZdVBrWFVBVE01blRkZ0hmYi96ZFFuSkt0SG1CdEtzanNXdTFw?=
 =?utf-8?B?MDROV3RpNktlKzBLQXNlUWMwbzZla1RCQXNwa2twcUJCNjdmZGtQVDJqbUNE?=
 =?utf-8?B?L3BLb1Z3YVlDTnBOZUFIQXVVbCtnU3lDR1NSamcraEwvMHRZODlTU1FIcHJt?=
 =?utf-8?B?eVRSOVltRWdIcW1qU2NOOEkxNzdVUEI2UlZvdHNZUkxQODBLT3BjbHVRMU53?=
 =?utf-8?B?QnVQUHpwSks0NzVuQWpMc3FiakxnamZ1cDAxenRXZ0UzN21Wd25ncSt5TUxV?=
 =?utf-8?B?U20xaU1uMTBqTzJqVG13RFk1dmZvUzVjN05Hb0EvcHBib2NrZXB0ZUMrNjZJ?=
 =?utf-8?B?TFhQU0VnV2VCKzVPZm51THp4S0piaTVoTEZCWGtYVDVzNnFsZm9qOVZFaDJi?=
 =?utf-8?B?RVlnTEYxVDhVTXRtb2puQXh2TkhucThSRHcvWGd1Nno0Vmo4YXl6NU94L0Ny?=
 =?utf-8?B?aEIyL2ZyMXAyTm94Z0pMdWJnQitvZXE0cm1Wc1NEWGEzUXBzWTd1WExNcklX?=
 =?utf-8?B?aUpNbHQzVzl5dys4SmdxN1o5dXBiR0FDaWRodVhBam9KUVFkSHBqVE83VTZZ?=
 =?utf-8?B?SHpCODVJSzZZN0VZemFaOHlKdWIvN2FGbEJrS3dZVEVEaStUbzdyeTJXK1B2?=
 =?utf-8?B?MEdnTnFQeGpPYllaRkFaZnJNN2ZSY21vZ2RjdnpSTDFNVnRXR2Zaa3U0d0s0?=
 =?utf-8?B?Q1BMaVFkL1llSHNDSzN3Zmh6Q3FXd2tHSUJ1RlBFcFk0Z214eGh6djdtUG1Y?=
 =?utf-8?B?RURtK2ZNK0lRMzZiak5DQ1lYR3ZtMUVkdGZHSmVneGxvSnZKcFo2c3VoaFl3?=
 =?utf-8?B?NnZ5d0JZZ1JGWGMyeWxiWFNsSG1YTlJ2QkJMeWRCckxxbkRtaWU3ODR4YXox?=
 =?utf-8?B?M0lLems3NlVBM2hEbWdxOTE0ckFxMXJGUzhDNWN3Vkx0YTJZV2dzeUFnY3FJ?=
 =?utf-8?B?QmhMQnhJRmhhMGZ5TXBPaVdabEg4TFBZU2s4Q05qQmhHTytiWXE0a1ZQZ05F?=
 =?utf-8?B?SFdabVRkVTlRa0xqcHFxWHMwRUx0QXFvQ05veUlMY2pNVnUydHZjWnMrTTdh?=
 =?utf-8?B?WFlkRS9Gd0JkUHduSytKRkJ5cDZsTGlFN2paRXBZUkRTQ29ydWZsQzZVR0l0?=
 =?utf-8?B?RXhEYTZwQnFocy96eHNuNHpuTmNBOXAzNVpiTEhrWDR3MmpnNDFDU0loTHFw?=
 =?utf-8?Q?b8zQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:33.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dfb8c3-1361-4c16-c314-08de3f17762e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9331
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfX2bEbNfXgkNad
 ZpZDAf4pu+vzGUaxubff6isrY2eihhTY1dhlqlQ8VAgHNIFnBc71cP7Cohiek+BpzrHEXsjd0dj
 bjr4m8XIFH1djXKZxOnViIz/YzsUPvT1WnP1WQeBGPpyJJzRmX9IHkU/NP60DQdmMz4wtnX2Fq1
 m1PxtZJux3KCuwCP4Yni9uJeaIXP43LQa1W88zbSv/8WWoSMfi78MXQ4SdmO2MLZsOatsU1OdE1
 1MRv+DUV1OmkvArxPiWVoEOtGoMI/5c1uAydgIgXq2T67IgHW+ZwXwAVKpfOkZ0xrya4FUHgsvx
 bugxe1M9FEjEn4FTmwuLxVEZ6ESZC1t3csEUOK75U3tGGR5LqGGcEl3GrrS6Qj/LoG6hIsoiQaZ
 kK1NS2KOZHaltg2LKpz63OqoSymWk1/8YQ0JgRqulcLymEsyMyXs8N8ODurffYcYTTm+zmfQw51
 6eiz235H14YbRFtY8QQ==
X-Proofpoint-GUID: _-oqZiOc78_y3-ALCuoaqYBpoBzrZI7p
X-Proofpoint-ORIG-GUID: _-oqZiOc78_y3-ALCuoaqYBpoBzrZI7p
X-Authority-Analysis: v=2.4 cv=F9tat6hN c=1 sm=1 tr=0 ts=6945762b cx=c_pps
 a=lIzsjUKTVOgKc6wzfUjmfQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=XrqsXFDlhBwf-vlXZicA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_075841_873621_5F4AD4A2 
X-CRM114-Status: UNSURE (   8.50  )
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

Add the power-domain property in the dcmipp node of stm32mp231.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index be9dd882ce79..577cd5b4cbb6 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -688,6 +688,7 @@ dcmipp: dcmipp@48030000 {
 				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
 				clock-names = "kclk", "mclk";
 				access-controllers = <&rifsc 87>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 

-- 
2.34.1


