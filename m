Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A242CE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4l6lcrB3m7XR5pzCXBvCJaO7j25B2XoH92w8UTOK8iA=; b=lBWJqERK63YymPy9QHz37ALljn
	Bk+U4FrJiJAuti38lLpy1mNITJfiB2L/iCw5lxOth5w5hesFE/6rOo2q2z6fxAdIK8wvvETtcT3Ck
	jIWVcw1DV7B+csm6SdOCK02lpH7SKOBflAYUGpXSgNd81jyHq6w+XMKf5wvIKVjQHPA3s3kSHpihX
	0wpWtH+FXDyuRCgaOsob6BejUXTkdlriGkwLy1OEpvIbzkr5j9RMnaGjnxAG8hvG8PjiW1hyDCN8M
	U60PMQzmcNn9dL0FJUPOYhDGynlumCfqGHMF+/9t3+SQHhDBejRf2GAnDG/4oePMkKDeFIIiE82Yb
	B4PSBuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpvt-0000000BtAS-3Rza;
	Fri, 14 Nov 2025 09:17:29 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpvp-0000000Bt9B-1Pdp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:17:27 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9DDW71829054;
	Fri, 14 Nov 2025 10:17:17 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k25sj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 10:17:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnFdV/EShYAFliiaFwydpGEWvwiRciYIDDJTXnm/fCPCsvqiPzLL8336VdXluAqOFBKh93KjJKtgEv4sZ2gzILE4wtq4xCG1cuHNyObAbq7J+fhxis4g9pd0PzilgYRbEw0gpsVVuEK5SncfxgLXTre1QahBGPaijosWHmnB9qaMxTwo66uMJ2Klmu7+AVTfY1908O6kj8MEjJyTRQX8WLDQiMmeE2QD6WzmUDlffs/0MV4XqZ67aeu/eGKhg8B8FNv3X+wN+QSeymgpcvnTbd8dMh8T688ObhrfEcMvbSTtGbeqaefqt2UvbhphURaLAtT0q1qMsSHlaSYsCbakng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l6lcrB3m7XR5pzCXBvCJaO7j25B2XoH92w8UTOK8iA=;
 b=IhAKnV9loraui1v19RZuP6LeDkj/fspWR/B9/Ba+M4DQZV4yfHt/2xMrQgiHywFrHg+s1mprDpEhUk0wIL65ocN/l4ap7SXnV8ummXby2cAZYKzPzAbyzYGYYTERVdUk9BfP8Kk9zQHD3ruL6iB4zuK477uKBVmCBoUm/zIwRk3lQRaGmUCjbj1qBtKRoK8CcyolXdr5AU7XmzDeKJhN3sxHrEUm1jsfHYVTcSYvAh9XtHGrlpQPrDBmRP5fur+FOMZ5Qbmikzl3LUSiDqMbyMfO5w9HzTn9+ad2VdNCYCoKepH/99/QRfwSbzMjvA9+OdMiq/jGCjRva/DRfa7Bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4l6lcrB3m7XR5pzCXBvCJaO7j25B2XoH92w8UTOK8iA=;
 b=j/yQnkOj98oFnwjoqsfj7Ywg7YF6rnsRzmjymIU/Hal59Y/m0+ux0q5okox8vScWJ3gfuw9Scvyi+LSIbP6vafmBv3mVxYkM1FNGTrzJwafb2rGnl7yAYcr9++VWKiAkifDMv6SmkZA+zFmTnUR5IP9/sl/R95J4pwoTd6zjJIpdjsF+rLXeRvWElLnxYkleLMrk03xUhtUqZjVgJN/WC5fNH7yYTZw4yoOzVP6oC1gnRoh7VyetGECPIGv0P/fmvaaaaROXYxSCcspVhM9MHEd/9KmqV85LEH7b6URcxgZa8zUDpCfx/UfTH0Lu9812OL4RJjKz3wH7gJSQrIInpA==
Received: from AS4P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::19)
 by AS8PR10MB5831.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:524::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:17:16 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::5e) by AS4P189CA0015.outlook.office365.com
 (2603:10a6:20b:5d7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 09:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 09:17:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:51:29 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:51:16 +0100
Message-ID: <01dbb151-148f-46af-b843-f96f99910ea6@foss.st.com>
Date: Fri, 14 Nov 2025 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] bus: rifsc: add stm32mp21 support and config dump
 debug entry
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Conor Dooley" <conor.dooley@microchip.com>
References: <20251106-rifsc_debugfs-v2-0-f90e94ae756d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251106-rifsc_debugfs-v2-0-f90e94ae756d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|AS8PR10MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad6fd85-a9ee-403a-64ec-08de235e9a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWdvQnE5Q1l2RWVsWURhWFF1VG1hYU5WV1FnaXNXQUNhUEkxTk9TOEJ4Sjg0?=
 =?utf-8?B?Z1A3TVFkTzE4NnF1R1ZxMmNvRUNiUWJSQUlSVks4cGRoRVA0bjFrNU96SjNS?=
 =?utf-8?B?VVZrU05OSlp1aTE2MWFWcitKWWtkTFFQNzNyOSt6Y1h2dVlyVmNYUW9DdFZN?=
 =?utf-8?B?eXlnb1l4Z1ZqNm14Z3Fqd1AycTVTaTFvdHYyTlJTdCtSaHFhUkNXdFJ0TEZp?=
 =?utf-8?B?QWN5eHUwcWJ3YWRaN09lVkxXSjUxdUhkZ3BiNGQzeEYzdXl0MlM4bEhEUDJU?=
 =?utf-8?B?UWVHR3pXR2l6ay9CVGZCckhhU1pyNFNURDJSNjhQaVRJZEhQNkc2VjdQK3R0?=
 =?utf-8?B?WXJBaVk0TVYvV0h5dGZtOUhuSk1MZ1J6UVRZSjJQTHo0QThHa3BlOTJsbFZK?=
 =?utf-8?B?blBZV0J0cUdUc2hiNVZZQ2wvZTRaUzVNb2JvZUVFQys0SVRUQysrQ3RkSDc4?=
 =?utf-8?B?elNjT2R0VTJxcDEzVFJzYXk1bGtCcEcyTUlqQ0dPVnh1RXVjRUNPUzV4QW9q?=
 =?utf-8?B?QzJPY09NL0ovWXEzWklaVUlhYjFkYkRVdEhEcE1rRXpNTGZNYy8xaFQrQXhG?=
 =?utf-8?B?TlhZaHhtWUJlWjlpQWtCY3loZi8waTBsQkh3ck9MNERjM0gva2p0STh1cFFn?=
 =?utf-8?B?Q09KajFsR0drVGc0eWZEa0VOdW1vV21lK2RGcjFTTVloanlqZUpidXI5bWZ1?=
 =?utf-8?B?R09EVjJmZXZRUHhxRGJrb21mWEYwUU00TDZGZ0s5RFFOMnlUbm5RN2pyNVl6?=
 =?utf-8?B?TnkyTWVuMGpkYmJqT1JEY2V2TjhYdS9lRE42QkwyVkZBbHl6ZVJ5VlNxb3V0?=
 =?utf-8?B?Yk43Mk03MlJqa3VOQW9hR1hUaW9uQWFqakxueFpoL1RLSUpveTdJTExsQVB3?=
 =?utf-8?B?RmFmWDNjYzlVdXA4SkR4S0NtMTYvejgwM0NnZ0VvZXNqQnltNkxsWGV6SlRx?=
 =?utf-8?B?L0x6ZlQwVnJhMysrUEV4d05idURvbXJDdkhWbnoveHRFMk5uOUNjQjh2MDNr?=
 =?utf-8?B?WHFLK3BPWmxkYTZiRERHTndSTHdkV2VvMWlVMnNNRnRsbUJOVEJZYVlLaHRO?=
 =?utf-8?B?RzkrcTRLNkwwb0VwbFNHdUlaWlAydk9VY1hROXMvZ3hTMzhrRlhrL2J4K0ZB?=
 =?utf-8?B?RnN3Rnd6Nno1emEvbmllby9oNDZ4RHY5VTlnOFgvdXQ1NmNNMzluV0EzMk1h?=
 =?utf-8?B?Yy9Ba1krbjF1RitTaFgxcWF5d0R4ZHBwZzg2aHFsVnh5UEMyNDZmTTNZN0h3?=
 =?utf-8?B?bTU4RHVUN3UveG0wbGcyZ1RmdVlRaG96RUdnaGRxRG56L0pCSkhDZXNwSlRP?=
 =?utf-8?B?RW14Z0N5NWt1alZDdG9LQWRPU2JuZUdiRW1CbldEU05tSFpBbVZHUnRzK29s?=
 =?utf-8?B?ZGU5am45dzVQWnJpeW1oWHBGbFlRU1lvNVA0L084eU5PUGlJRHJQRHJhb2JJ?=
 =?utf-8?B?R3VydjlJaWY5N1U3dVhDZHQ2aDlhTWNSWXVIVlJmakc5anNObk15L2JYSWlW?=
 =?utf-8?B?V3BVdDZqYUhhVDU0WUZXbW8xOFFXSzNJcG9PWS9RMXBrbXZuc1dTTzV0aGhQ?=
 =?utf-8?B?S2tXTFNwdzdLMG9rNm5Wd3pLNUVwdVRxeXdJdENhQjlHR2txN1c2QkpmZVdj?=
 =?utf-8?B?U3d2NnJvYTRQRy9rWFBnVnUxK1pXRVI0dU5rV1lPemNMU3NQN2w0eTVkc2tT?=
 =?utf-8?B?K0lEYXJaYlY3TThxNnMyWXJhZHBNWHJXNmVsNHQ5RDVzRGdpaUlDeEc2anlK?=
 =?utf-8?B?YitVdWVMZHh4NUxsOWlweWNkeDRPeEFJV1JPMTZRdnRaTXkvRDFYUERVcyta?=
 =?utf-8?B?N0J1enJ3c05sdStEYkpZanlld3R6L0EyaUVWUndwUzlMczErZy9jZzl4UGZS?=
 =?utf-8?B?TUxycjVrenpCUHVBOUF6TUFKejRLOVJpanU1QW5BaGdBM2RLMHFZN0cyY2l5?=
 =?utf-8?B?MGxnay9pUEJJd1dROXJWUi8zejJ2TzNBTFBiRTJhU1NkaUxPbWNDL2dXenZ2?=
 =?utf-8?B?dUdJYnpNWXFSQ1dOcG5hRjIyNW5JMGxLTDk4V01obm9BRDhFSVJYeUFuV0JN?=
 =?utf-8?B?TzFHdm9yR3Y4bG5PcCt3T0NpdGRTcmdEMk5JTzc5WGt0L2k5RFNaaG5jK21T?=
 =?utf-8?Q?Jec4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 09:17:15.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad6fd85-a9ee-403a-64ec-08de235e9a17
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5831
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=6916f39d cx=c_pps
 a=JbfknYpaHg+7S6z5Esqmrw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=n2zXhBmsAd_17serdwMA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3MiBTYWx0ZWRfX5mG9zKJvR8FN
 kdXly16lZbBWAW1uPVblb2D3dNkhj0BzPNjprFLo7rXVD0QgF6ENdiw3bBA45DuIMzmtwlaiwcU
 fQ7z0mNCWcyJLJ28UXG70eiPT3cNfJZKii7/XLwt5p9LZ9FwR2XysmaDZVBS8yM5eWZt1gy5wF3
 PQ3Lrm/KlcyBtlACLGLNjIV1u2mpfCpg1pCaIBYcDB+4FCgcX/EhHG3j6gxkMlU/VcnmMHwDtTt
 yup4YJR9wUIKQzY63RNy2PHcFyGTE1HQM/bPIUlg4Okh2TOK47X1h6Yol6V+m0Eu12BR6RRUWuL
 d3bIgkN3zx2xHVR5IGgjB9Ae0d3G684E86iRPFbRZOdubKL3ZcEUBomr1pQxlHzzccpo0VuN3TE
 c8i/v5ootTekknKfV98gObch6+s1BA==
X-Proofpoint-ORIG-GUID: sRiOjl7rVeOMQyF_hKYn1Jf9PNG2GiY7
X-Proofpoint-GUID: sRiOjl7rVeOMQyF_hKYn1Jf9PNG2GiY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_011725_682654_39BE5701 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Gatien

On 11/6/25 10:31, Gatien Chevallier wrote:
> The STM32MP21x platforms have a slightly different RIFSC. Add support
> for these platforms.
> 
> Also, the RIF is a complex firewall framework which can be tricky
> to debug. To facilitate the latter, add a debugfs entry that can
> be used to display the whole RIFSC firewall configuration at runtime.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in v2:
> - Added Conor tag on bindings
> - Fixed coccinelle warning by using str_enabled_disabled() when
>    applicable
> - Link to v1: https://lore.kernel.org/r/20251104-rifsc_debugfs-v1-0-7ebdfbf8d33f@foss.st.com
> 
> ---
> Gatien Chevallier (3):
>        dt-bindings: bus: add stm32mp21 RIFSC compatible
>        arm64: dts: st: set RIFSC as an access controller on stm32mp21x platforms
>        bus: rifsc: add debugfs entry to dump the firewall configuration
> 
>   .../bindings/bus/st,stm32mp25-rifsc.yaml           |   8 +-
>   arch/arm64/boot/dts/st/stm32mp211.dtsi             |   4 +-
>   drivers/bus/stm32_rifsc.c                          | 597 ++++++++++++++++++++-
>   3 files changed, 602 insertions(+), 7 deletions(-)
> ---
> base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
> change-id: 20251104-rifsc_debugfs-5053ea033ce3
> 
> Best regards,

DT patch applied on stm32-next.

I'll send a dedicated PR for other patches to arm-soc tree.

regards
Alex


