Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6DFCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPtR9rwMQmdKENXSjfV1I/Nk66rIVGFYYRT1LbE9K00=; b=H1rt813qq8UKvVCRHw5G/mbGvc
	PMx239RUjH3N+ajrL15vqhUPSPDOUk+2LzQUpnzLm9Vx4v5co90enFTZmcxXOYeGjiUcoFQxm+PSe
	NW+Or4x/aSKqbE8mGemPfVzs4lBcJoSyVjxYq8eRnDPyX2JJg5pOgLRHV0zAIuflnrtBkUWSgUxwC
	KxFpnoSWw00bJu0/lQeyoQhY3a76WNCCgKk+XfxMKSXJXkmueNrVk0BsRxtOAs5DsUwjWNgmulciW
	FqWDzb4FARlrZAtEeBPCETnoyEewU+lhjXWaiUwnJ6bACuKy0xxYCJ032td+u1FbR0YfPrMJbp4VS
	v+PUPnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC2B-00000008xhV-2bA2;
	Wed, 12 Nov 2025 14:41:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC1j-00000008xAt-233Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:40:52 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACELKtI946375;
	Wed, 12 Nov 2025 15:40:45 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acq20hfjb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 15:40:45 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCemgP7g8dV55G08ogUOCtcKHKsQ/3xywiY8XlwWKdSRxcntSkRjsIV8jYvXRtPdl7XmG09IRIMErzJD5TkrbVqStnpI6sdgswB0Pb/RhOpemuL6rGxETE9EoP5KSPudvRgjXoSjKMBjQGphJd/HJBjmaRVfiShVstoTOTnV1AFFTN27VX06uo6EJsQaqFSItt/rIGHX8fl3fCBIxFZTaoGMU5BJO/3cY59iwC3D4iR+DkTrQ2PQy+JamBrah/J+ZRu+6iaZIirE6a11iywK8KTbhWQT8JVcmMAVfLE/mJ0RsQ6jHm+KglBKoLkLPPIn7MpPxng1IA1H758qEiZUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPtR9rwMQmdKENXSjfV1I/Nk66rIVGFYYRT1LbE9K00=;
 b=vBD0Y9OZwDSW181XWU7UEGRso+3CgV9eJBzlFDa0Choijpr9eiGKRCbZfSUl8ZAA2/4lDPoRwmeAbV/uJ5M/BeDCoTEd1Ds0Da0UI8zXwBxSs2S3A4trUO5BE+u50ThBk5QQladj1I8hn6V4fSF530wehmW7fmyLArVAr3s3YEtZ6VWw2DIl6AJrg9W2oAepbiOB2glkB1fWHcHnpRsG+WkgqGWx38+qwS7uQ0U/zwdVwyshKNcppHXl4b4l157YmnT/Xw9RFn/qLtRT6JZ/0TN+XBelvfzmj1ft4ihbcYIACjkzJPDc72euNklnZxDNIpHb8qxXTeb4NBmtcrRrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPtR9rwMQmdKENXSjfV1I/Nk66rIVGFYYRT1LbE9K00=;
 b=ofh3TX4FjJbJ12pnxoMApW0jtBKfnAnqsi+67bd8BRiL1vvtECSEKX/4UbtjeGuKTjHHDj33Rf0cNFsmG72a451PHecKjvYGrFFsdczWkDMQVcxtlfrCnsZn1uBpukcGu166eTXqwDIXBJlg3/OUC5/qcKyT7E3bh4jkNAPHGh0Kt1xMBbRA8v1SLKduK3+4MDT9JlSklo9xGjwseVUHFaa+J4JqJjNNpVuWasOQ14w1FNoQrhUTPR7AlrFSFfD4T7F4Ss3q1G+c/3Y7FAog3x7xgyG9FYoV+3j/+Ri4WQLi3R33meB5hOOX9oHbIp2ZwpVccAPU3xs0b+Hbm8F0Yg==
Received: from DB3PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:8:1::44) by
 AM7PR10MB3622.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:131::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:40:41 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::19) by DB3PR06CA0031.outlook.office365.com
 (2603:10a6:8:1::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 14:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 14:40:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 15:40:49 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 15:40:40 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 15:40:30 +0100
Subject: [PATCH 13/16] ARM: dts: stm32: Update LED node for stm32mp15xx-dkx
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-upstream_update_led_nodes-v1-13-f6c77739113c@foss.st.com>
References: <20251112-upstream_update_led_nodes-v1-0-f6c77739113c@foss.st.com>
In-Reply-To: <20251112-upstream_update_led_nodes-v1-0-f6c77739113c@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|AM7PR10MB3622:EE_
X-MS-Office365-Filtering-Correlation-Id: f94d1a42-90d9-4f03-7dac-08de21f973fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUZ4ck5Dbkt1ZDVUVkxMek1hektOelhiUTB4RmdNczRVVnJyVC9GeXByRHha?=
 =?utf-8?B?WmFRNkFXL0NFYW5TUGhPRmpnMGNrTDd5REJDdVNlK3RyZkZDQ1pYN2hDcFRQ?=
 =?utf-8?B?UUh3WGJZd2JVNWZLcm0xU2M0ZmpWeHMyenBwYWtmVHpONDJobDcvZ1ZVdXNk?=
 =?utf-8?B?YlVFUllzeklSWTlaNEpVZFlXa3RhSE8ybW8yVFBPc3JFQWgzUFJsTi9nS0VQ?=
 =?utf-8?B?QnNORmdDL2dUdHVsTTl6V3FCZGtGTFNXTjB3STY1Slh4QzZrNlVERkluZDV2?=
 =?utf-8?B?RHN1dHVoZS9MNHVmaWRLRVJadW5aR3BJWmtHSUpNY0NOMWVOUkhuMUhtOU81?=
 =?utf-8?B?djNzTkF1YmNGaDNreDZaRTJvWUNrTTM4UFZSMFZRbFoxWWhzbHhqSElMYXBD?=
 =?utf-8?B?UkFybC9TZXZZODNwVGdPdkxpY2lWUnNSVnRDTGpHbFRpQ0tXbkhUNmVuMndh?=
 =?utf-8?B?ajA2aURvN2RJOG5lTWhLSks1cXF1VDVJQmd3S3RkbGRIQVNYeE1rb1FQM2tp?=
 =?utf-8?B?Y253bXVwMXdqZGdJaldtWmFoTUczMG4yc295REZKdFBaZTQzazdFVXcwNDVM?=
 =?utf-8?B?ZlowaTgrN2RKQjZiWWNQQm5pb1F1T3QrL0N1eDlKN29PU3diTHBOL3ZqUFRh?=
 =?utf-8?B?a2VRMG4xbk9jWU9HQ1JNcnBacklJNUtoWU1PRjhOVmltV0ZaNjY4U2RLQkxO?=
 =?utf-8?B?ZGQzMUNUM0lZZVNSZ0dWRjRLV0FGY2prZEJ6UjZuclVoZnV5R3g3aXl3UTlx?=
 =?utf-8?B?aGxzd0IrSGttcWhCUHNPdEhJVnRaOHVWNEtVMU9EcGJtcC9sWnlEZWRUcCtn?=
 =?utf-8?B?MXdJVWtIa29ROHVqRUtEZWtxQlFnYnFEK1RJRWVvVkU4TEJkMkp6NTlHZ2po?=
 =?utf-8?B?RG5rUkZoR2V2SkVxY1hPbmVHdFlTMjVoSFVycUprTWhwRlR6MTJSb3k4WGdu?=
 =?utf-8?B?ZHZ4UzhETngzeUFXSmxqemdKVEh4Q29qL00zYlJWckxScHByZWl6bUpTTitK?=
 =?utf-8?B?OW5XZ2I4OFd0NVZxRXlkWHlyMmRUblFWcjNFL0VHWTVHLzhxMWgzaEJyOXJN?=
 =?utf-8?B?a0JVQVV5eEFtb3dQeTNMaFl3dHdoNjFTTHpxMnBpYXN3VFMzYWg3Vml5YlF3?=
 =?utf-8?B?QTVncUVvTVN3OVhhamtuU1ZUcnUxczI5YUVYSndTQXV2Qm9qbnhVaXpab3dy?=
 =?utf-8?B?eVJpc3R1bkxQcFR2UHNzTzdzT2tDaTNValN0bDlQYXVTOXJKMzkySTBqSnZP?=
 =?utf-8?B?QnFXb1owS3RmRTRQQmZmY01NajNDQWFMOGl3dGovN1JXWDM3SVhXNmNia3ZG?=
 =?utf-8?B?SE92Z0QveHdSQkdqMFVUU0xlSE5kckMxNnA3Z3RxV2w5RjF4VHF2dkdnLzcz?=
 =?utf-8?B?ekNxYnBodE5ZV1doNjhPZVpUWmRZQU9mdDZ4VVYzaWJwQmdGMXVFZjhNTnBB?=
 =?utf-8?B?RlJCdDluVWg1T3g3OCtCU1hDbUkwcXRKU2ZvRVFGak1pSDFZVTBOL1h6UUJp?=
 =?utf-8?B?Vk13TGs4b1gxZlpWVmNGRWNpTVNiOTRYVU5oMFRKMXVVSHBLQ1RSYVVUU0lo?=
 =?utf-8?B?RjVYZ0h5ZzR6Z0ZFZUFDVUNkbE5GdlFhOUdIU2JLazhOOWRqR2YxeXVkc0Jr?=
 =?utf-8?B?QTV4bVRDZVFLZllmVmNhdVd4NnNvRkpuRXpUY0tzN1R5U1dnVFg1VVlWYWYx?=
 =?utf-8?B?MG4xOHNYeHJlS0VQams1RkptM0hWaGoyMURFa1E1YUNZL0l0U2NmU0VyVEJH?=
 =?utf-8?B?Y0tHSDZKSlNqc1B2eDVyTHRMTkMwT1dja3NiRk5nREpDQzZGeW5wNERheWhO?=
 =?utf-8?B?MDlrUlgyVWZPMC9ra1Y4bzhlRDBuTG9JajhqY2g5dE9BYUZhcS9pNjlDbEw3?=
 =?utf-8?B?akxlR3VzYnl5SFBpRXJiankxR2hRQjJlQy9KbUc5Y2FPR0dSUGhSLzhUOWNr?=
 =?utf-8?B?S2Y4dDZQRE0vZU5Zd0N2UUd4d0ZlM3lVTmxnSFlIbzZYbFNpNGQ5Z0k4ZStL?=
 =?utf-8?B?b3M2RVdqWDltaitONU5OZTFCVDNIWnRJQkpRY1ZEZUY4aGZCRE43aEYwNmFM?=
 =?utf-8?B?Z2NYcGlBUzNlUUJRMnFVaGJlemlwM2ZqbWxtM2ZBT2pNY2tvMmE4MGdpNUJp?=
 =?utf-8?Q?Zybw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:40:40.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f94d1a42-90d9-4f03-7dac-08de21f973fb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3622
X-Proofpoint-GUID: ppK6Fq5oVv2725fZmn0CjcZ4QQggF3uf
X-Authority-Analysis: v=2.4 cv=LaQxKzfi c=1 sm=1 tr=0 ts=69149c6d cx=c_pps
 a=2bV5NZVPMaqQr+u7UHLVrA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WzzFcJAODjsVfCo3KYEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: ppK6Fq5oVv2725fZmn0CjcZ4QQggF3uf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExOCBTYWx0ZWRfX+uzcBxMBuc95
 ZJM8Lb3okqMl0woB9bYwynVOhk9OyTsxxsBcpPA6wY3uzlUuOxO/bnLw3JtE9VKlnJNchlJcEmT
 Vx1IWAgdRvks4njuliMFGgyx8zcoz/6rXimc5F1L4yd0FxYbtPVm3OIiSww6+HSQ7SeV6pDn3Xz
 JBf1dJoLolp5dflL0K6v/IWbBqUH3/IiZyZSJ1A/lHE8ZSNilm3+evKKrzZiJLDpS2+6blZGkic
 10oHPaNfGVYQVdZ9dFXcEx0lcKx1Uy/1UfH98zKeA0uHpdJFHFJYUv83woFZzjbSFTxSdzPtkf+
 5YZj13t52gX/FJpY872xHToeO2hg9QZ+G5uLq0najbhb5sDYHY1YUEDYQTcL9Dn332sFokxge+k
 QP85Z8p7pz8SXTWlOXRaCtIu0uY/rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_064051_803271_AD99F11C 
X-CRM114-Status: GOOD (  12.31  )
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

Add led-red node for stm32mp15xx-dkx, this LED is used as status
LED in U-Boot.
Update led-blue node by adding color property and replacing obsolete
label property by function property.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 8cea6facd27b..fc0ff818e1fa 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 / {
@@ -64,11 +65,18 @@ retram: retram@38000000 {
 	led {
 		compatible = "gpio-leds";
 		led-blue {
-			label = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 			default-state = "off";
 		};
+
+		led-red {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	sound {

-- 
2.43.0


