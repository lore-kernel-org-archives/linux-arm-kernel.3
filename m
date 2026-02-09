Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32439E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PVHUslqYL5WxrL3MYiLng8p3xm8bOvSgI3BKKoEBvc=; b=hFtq5AH8cBa/uGLImZCh1/rk4T
	uu0/HlT2+NwzWpHqZ0ObvlMLCdqBpOw2icmgUqzxC33aCYkcIf2UofdxS8S9APbIdZMkWpyIfvfV4
	HevrfVo0XUC9WHCdVhN9BE3jw3XpUZA8qpc/0I8ngptHAu09UXpk4MAk4ul9n6zRdQ2goIZSIX2wI
	QgK3m8AZsdYJH9dnF5MjAi4FViBEINk8EhIVOhqK4Jxws7RycRCUBN+E9an7Q83It4IlSVuVETOH3
	4n8RXQJpL5PX2sE+/pTmF/LDu/rR6ZgyM4SnlsBPYjZaogH+b3g7UAuniy8RDFLaGsAWlt0bF7QR9
	JVHCvSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSkT-0000000FZB4-10Pd;
	Mon, 09 Feb 2026 15:00:25 +0000
Received: from mail-westeuropeazon11013038.outbound.protection.outlook.com ([52.101.72.38] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSkQ-0000000FZ8Q-3cjE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xThOGqjvMzg/0aF9Oi+McvEao0/YbjQacaz2nn+owLLik9Vs/zu6ESW8ywtYRJE4gY5WLgUDV1e81uQYt1P8AQNVPC2KLpm7IVmtnVhaM1mRAED7cLpAHvbczuVIy1GOGdl73aemS8SWyeTzfQgseeAGnS4ch2DUbrZqUEGEh2g/7yGd3HXcrxQCyZD25Nii8fvN57yqfXzWI7rlqdP0pOmfjmQh0xuIHN2fFHA4IXwYlVrJIiHXRhiZ04ydH7542kwLF78mFToj7yoG8SnrWztf7sg27JXT53ql7OVpOAZUrM6E0NRNMUF/VxUZyPw/tGOv7TRw2GWWZAviXsBkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PVHUslqYL5WxrL3MYiLng8p3xm8bOvSgI3BKKoEBvc=;
 b=yIo6qCbqx0ZwfybmWYQy6brXm4wEwUW2yqL61uUM5RwfmOibIKG4KvqoVfUTMl/39HRNdxoXXEd/xBdC0SFR0euz07kbUa4WE08mRBaxyR9LSkY6u4Sc2eRwpGPU2i3U7fO4nm4iGNUwROB4eKUihhp/YDfe8uCz7gkMwKtZ0XcSwrbTniHTms7d9cRK9vp8ffnDO5DFbOBezP0FjCVdfMRc61JKiARclqIPV6AUzgnPJl4MDLpgx//Mfax8sdGygt7HZOtkFgmrs3DwwFut48sU8qmPtEeyCbHwv4pkyveTSrTvepO+ykEw7JhZz+syVsm7TRfYQfHCBZRF0WYXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PVHUslqYL5WxrL3MYiLng8p3xm8bOvSgI3BKKoEBvc=;
 b=Cif716/q1ROyoR++zThk04svUjJSsifSAYPon7QKwfuYd1K+u0RPF2VIhT5fgVmu0tdZH9qW/aw4Xs5MZDafHf7AZ7IoxFYEpsopNvsJieHBb2rcsaL5RfyaH9BJ+Ci27GnRvMpGEX/+zRzE4f/k8SNCaaacQP44/J//vvclOTIavT/P4XFsbsaOSNfffG0v0PkIzl0g31rEgV4mdAKjudyKfE5BAkDUUiTF871jfqE1z7y7L3w6APBNx/GUm8Syz3PQNUWoWZMSy+mKYoeFTsXkdor+/mBwfwyNnQdTEe3tDtIv/8TVVBF8hshwYeRan8SY4lEdszQtIfs726aLIA==
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by AS1PR10MB5166.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:00:16 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::3c) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 15:00:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:01:56 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:14 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:32 +0100
Subject: [PATCH 2/7] soc: st: add RISAB dump debug driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-stm32_risab-v1-2-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Theo GOUREAU
	<theo.goureau-ext@st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|AS1PR10MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5921138f-8aee-4353-d1bc-08de67ebef1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L05INHFCcFlHU2pjOXVVWWZQd3k5eDNIZ3o1MnhsM0lnU0NEaTlpV1MzR0Vj?=
 =?utf-8?B?MVQ1eSszZ2pjMEdZZE1GMmtYb0U0U0VtNnNHcFUxY0dJbmhjdHpQWVFZZ1J3?=
 =?utf-8?B?dGVJVHlhd0JYTTNkVnBjMC9rM1hJdVYxTjhRWmZXbERqSHZIa0sxVzE1NjJP?=
 =?utf-8?B?MkNZbjArL004TTdFSTdQRGdHT2ZNbFRzZlM0YXE3R0ZmWnUvOFJRUUhHRmhq?=
 =?utf-8?B?MVlBNXlNWGk3dnBQR1JjbVRybXRheS9Bbzg4aFdjdmQ4S1RzS3Nud055VzBK?=
 =?utf-8?B?c2k5dURHODZaVXBvTFgwSXlnN2N4MTgvWHpBOXhqWWFNL0lPZVVlbS9yUU9F?=
 =?utf-8?B?U2piZGRNaCtmWE1RUklOQXJOMkIrS1U0andkQ2dCaFdYZ2poV25kTytrZFND?=
 =?utf-8?B?cFA4NTZYWWQ3bURpRnBFNnZEVU13TTI1RmFPS3FtTHNlSmpycjBSTktsQjZK?=
 =?utf-8?B?aGhXeFUzclRpbURCWm1sVTBuQjFsNFZLdjJWdFVudjMxY0JvV3E4VjZNdkR0?=
 =?utf-8?B?THhUckRqRVM2RjQ5RUZITUJ6VDlnZm55MWk3NG5CakRCcENJRmNZVitVL1I1?=
 =?utf-8?B?WFJmZk4rQmFzV2EvamtVREl2RjdDdFF2Tm1BNkNRdGxvMEx2VUhaMzJ1T2VB?=
 =?utf-8?B?VHAvMVR6dTh6Sm9qSXlPaVZmSjNtQkRORUo1YjJRcTExRCt6WGp1ZngvM2NK?=
 =?utf-8?B?WENaekJaUDdyMHJpK3RyMU9KWXZpTGVySGU2WFZKWFNsUkpQRDROWE1KTlUz?=
 =?utf-8?B?L3EraXBUMHdRcW5LMEMxMXBGOXgzdVZIM0Y2OEY3QlV1S0o4ODlHV2x1cWNH?=
 =?utf-8?B?YUZrb25xRS8rZzZybVY3eU5sSXlOSFVpMnV3QkJ0TlJlT0JGRXlTRm5paElI?=
 =?utf-8?B?eEJES0tsZ0I2WmpBbkFBbWY4c0RBL0FDMjNpMGNuVFd0UjdkY3FBait5a1J3?=
 =?utf-8?B?UXVSZzZyRXdHaDNCenlueEFneHhIa2dKbWVJOVpVTkM4emloQjFndnpSQTdl?=
 =?utf-8?B?SjQ1eXdBSUhNS1BaVUFFb2p4V2h2SDFJNVFYR1RiR2E0MVU1OWpUclJvVU5j?=
 =?utf-8?B?UWVtUFJWUnMvTlBZeVlUUmN4eTlwVHVKMVRRRVl2OEFEMEpBamg5YjluSGt6?=
 =?utf-8?B?cjdXeEFpMjFTa0RQbmhBbTI4L3pBTHpteDNUZDhiWUVHVjgvdkFjZVFiSjRm?=
 =?utf-8?B?eHk3dFQzNTU0Y2JUV3pXb0xoM0gxV3lCb29XN21CVStyUEcrSWxYbGttVDlr?=
 =?utf-8?B?Unkzb1drZlVyMERPeTFnc0cyMnYxbWZiNDN2amFRSmtRa0JMZURTeTV4SE1G?=
 =?utf-8?B?RFJUUDgraHdIdzBQQk1RRTVxcWtoRVM1RWtJN2xSQVNUT2wweXBOd044b3NM?=
 =?utf-8?B?UEJaVkZCZVZkd05kWmw0MkFYSmNpakVUM0tNWGdzUHFGT1NDTTM3OVZiMmZy?=
 =?utf-8?B?ekhoeXBEZ1RGaE9EakQ1Z0xqRHFYTzBNSVBNOWtRNFFNeWFLQTd1Zy9rMHg1?=
 =?utf-8?B?ZExUdU1hZmVXZTVMSUNGYldhZ0l5TDNkZGFWYW9HYzNkRm5zV3RvRUlJVjc5?=
 =?utf-8?B?NWhLM1prU3FSMkVyWEZMbUZOeEY0NDgyaGVwaCthNXMva1NSRE5ZVEljZHhY?=
 =?utf-8?B?Mkthbkp2SG5aS3A0YnRucmxmSTV4Yi80TGRWdThqV1AxbVhGZUdvWmdwdXRH?=
 =?utf-8?B?MVp3N0xTYkRjK0gxejU0Wm4xQlpTLzBWd1pJYjVmbXVua2JTc0JSVmZ6UldZ?=
 =?utf-8?B?SHNrR3ZlYWVYUlVIMFRoUmExOGFUQUhHTnNGckRaUG1Sa1JTTEYxS0FLL0g5?=
 =?utf-8?B?aHozM05qUDdnOStDTjRpTTRUVEZhMnVCeDZnUHBKMjdGQW1sRW5LeUg5NFZz?=
 =?utf-8?B?VmxLRStocjhMaGd6VXZQY3dTcG1pQ1VjTTBjdmtzMVFZNWRLdEpaSS9sVzFZ?=
 =?utf-8?B?QVR5RnlHZThabFN4WkdxalVKR2d2bmY3bURLdkoyY0xNVXJSMlh5KzFBa0tT?=
 =?utf-8?B?UG1FYTBhaXR2eDdYT2VhekxScW9XcVFkYzdXTXVDU1RtNGI1ekxYbGhrUk9j?=
 =?utf-8?B?Z1dDcnVITkc3Nkh4MUZ2MXNiaWhya2xVclFhejA4UUp5ZnIxdFN1UWlHWVUz?=
 =?utf-8?B?cDlhZDFIZndJdzFsazRBR0s5WmRNWFlHMi9XUkpyaUYxdHZ3akVucTFBeTM2?=
 =?utf-8?B?S0lJWEdnK010UjR0Y0t6Z3N2cXZ0YVFERzVEOXNxUjRCVWlHZUpKWW1xM1pW?=
 =?utf-8?B?aFVJMHlNbUZ5K0RMdWRFdUoyVzVRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pphS28FD71uEMCvD10w2HjlMGY+9v/gXC9qa2StdZDwiWK1UgTXpNAgGl1YZBBHWAbkYNFr4rC3q9yVYcJq/7ClL614NZlTSpO+2Hqxg7AyDsj+IxAkd5NOlsB2rArIiaKlYckIkdgARQ1eGYoPYAOjTfPQaq+RBcfWf9VKJswrn4nI6Yq4mIEH1fZhXbYdCIoVtist+Bmv6dcHhyjOjSZzfqzc78nxp+ZG72R8lsBObvvTGGc9qlKyEShFFhnLEPTqX1pxPn//alruVL+I8oFGGdNU2MmwNMm87Kf78FQdDMcyOt3A1mE9unQp7MoWLSDAX3Tto757+ANWQ29sveysz79Vqw0H/ZpTp0IuJo7aa8MznJLfDvCYUaSLI6ShzODHSQqDc5nGJUE9+/JooQUt2GEwUZCBZcwSDPR8yvAId3wH4dG5yzwgwI0819vK5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:15.8628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5921138f-8aee-4353-d1bc-08de67ebef1c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_070023_065423_5951C2E1 
X-CRM114-Status: GOOD (  13.98  )
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

This driver creates an entry in the debugfs to dump RISAB memory
regions configurations.

Signed-off-by: Theo GOUREAU <theo.goureau-ext@st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS                  |   1 +
 drivers/soc/Kconfig          |   1 +
 drivers/soc/Makefile         |   1 +
 drivers/soc/st/Kconfig       |  11 ++
 drivers/soc/st/Makefile      |   1 +
 drivers/soc/st/stm32_risab.c | 329 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 344 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9a1276e94a9..64a5b894c6b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25096,6 +25096,7 @@ STM32 SoC FIREWALL DRIVERS
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/st/*risa*
+F:	drivers/soc/st/*risa*
 
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..dfe5cec59262 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/st/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..894bd6ebaaa4 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= st/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
new file mode 100644
index 000000000000..6c293af58f2a
--- /dev/null
+++ b/drivers/soc/st/Kconfig
@@ -0,0 +1,11 @@
+if ARCH_STM32 || COMPILE_TEST
+
+config STM32_RISAB
+	tristate "STM32 RISAB"
+	depends on (ARM64  || COMPILE_TEST) && DEBUG_FS
+	default y
+	help
+	  Say y to enable RISAB dump debug helper driver. This creates an entry
+	  in the debugfs to dump RISAB pages and blocks RIF configurations.
+
+endif # ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
new file mode 100644
index 000000000000..6b53f3eda801
--- /dev/null
+++ b/drivers/soc/st/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_STM32_RISAB) += stm32_risab.o
diff --git a/drivers/soc/st/stm32_risab.c b/drivers/soc/st/stm32_risab.c
new file mode 100644
index 000000000000..f1f0300817e2
--- /dev/null
+++ b/drivers/soc/st/stm32_risab.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+/*
+ * RISAB constants
+ */
+#define RISAB_NUMBER_OF_PAGES_MAX	32
+#define RISAB_BLOCKS_PER_PAGES		8
+#define RISAB_NUMBER_OF_CID		7
+#define RISAB_PAGE_SIZE			0x1000
+
+/*
+ * RISAB configuration register
+ */
+#define RISAB_CR	0x000
+#define RISAB_CR_SRWIAD	BIT(31)
+#define RISAB_CR_GLOCK	BIT(0)
+
+/*
+ * RISAB configuration lock register
+ */
+#define RISAB_RCFGLOCKR	0x010
+
+/*
+ * RISAB page y=0..31 security and privileged configuration registers
+ */
+#define RISAB_PG_SECCFGR(y)	(0x100 + 0x4 * (y))
+#define RISAB_PG_PRIVCFGR(y)	(0x200 + 0x4 * (y))
+#define RISAB_PG_C2PRIVCFGR(y)	(0x600 + 0x4 * (y))
+
+/*
+ * RISAB compartment x=0..6 privilege, read and write configuration registers
+ */
+#define RISAB_CIDPRIVCFGR(x)	(0x800 + 0x20 * (x))
+#define RISAB_CIDRDCFGR(x)	(0x808 + 0x20 * (x))
+#define RISAB_CIDWRCFGR(x)	(0x810 + 0x20 * (x))
+
+/*
+ * RISAB page y=0..31 CID configuration registers
+ */
+#define RISAB_PG_CIDCFGR(y)		(0xA00 + 0x4 * (y))
+#define RISAB_PG_CIDCFGR_DCCID_MASK	GENMASK(6, 4)
+#define RISAB_PG_CIDCFGR_DCEN		BIT(2)
+#define RISAB_PG_CIDCFGR_CFEN		BIT(0)
+
+/*
+ * RISAB hardware configuration registers
+ */
+#define RISAB_HWCFGR1				0xFF0
+#define RISAB_HWCFGR1_LOG_NUM_PAGE_MASK		GENMASK(27, 24)
+#define RISAB_HWCFGR1_LOG_NUM_PAGE_SHIFT	24
+
+struct risab_debug_data {
+	bool sec[RISAB_BLOCKS_PER_PAGES];
+	bool priv[RISAB_BLOCKS_PER_PAGES];
+	bool c2priv[RISAB_BLOCKS_PER_PAGES];
+	u8 dccid;
+	bool dcen;
+	bool cfen;
+};
+
+struct risab_generic_debug_data {
+	bool srwiad;
+	bool glock;
+	bool rlock[RISAB_NUMBER_OF_PAGES_MAX];
+	bool ppriv[RISAB_NUMBER_OF_CID][RISAB_NUMBER_OF_PAGES_MAX];
+	bool prden[RISAB_NUMBER_OF_CID][RISAB_NUMBER_OF_PAGES_MAX];
+	bool pwren[RISAB_NUMBER_OF_CID][RISAB_NUMBER_OF_PAGES_MAX];
+};
+
+struct risab_pdata {
+	void __iomem *base;
+	struct device *dev;
+	struct dentry *dbg_entry;
+	u32 risab_map_base;
+	struct clk *clk;
+	u32 nb_pages;
+};
+
+static void stm32_risab_fill_dev_dbg_entry(struct risab_pdata *pdata,
+					   struct risab_debug_data *dbg_entry, int page)
+{
+	u32 risab_pg_c2privcfgr = readl_relaxed(pdata->base + RISAB_PG_C2PRIVCFGR(page));
+	u32 risab_pg_privcfgr = readl_relaxed(pdata->base + RISAB_PG_PRIVCFGR(page));
+	u32 risab_pg_seccfgr = readl_relaxed(pdata->base + RISAB_PG_SECCFGR(page));
+	u32 risab_pg_cidcfgr = readl_relaxed(pdata->base + RISAB_PG_CIDCFGR(page));
+	int block;
+
+	for (block = 0; block < RISAB_BLOCKS_PER_PAGES; block++) {
+		dbg_entry->sec[block] = risab_pg_seccfgr & BIT(block);
+		dbg_entry->priv[block] = risab_pg_privcfgr & BIT(block);
+		dbg_entry->c2priv[block] = risab_pg_c2privcfgr & BIT(block);
+	}
+
+	dbg_entry->dccid = FIELD_GET(RISAB_PG_CIDCFGR_DCCID_MASK, risab_pg_cidcfgr);
+	dbg_entry->dcen = risab_pg_cidcfgr & RISAB_PG_CIDCFGR_DCEN;
+	dbg_entry->cfen = risab_pg_cidcfgr & RISAB_PG_CIDCFGR_CFEN;
+}
+
+static void stm32_risab_fill_dev_generic_dbg_entry(struct risab_pdata *pdata,
+						   struct risab_generic_debug_data *dbg_entry)
+{
+	u32 risab_rcfglockr = readl_relaxed(pdata->base + RISAB_RCFGLOCKR);
+	u32 risab_cr = readl_relaxed(pdata->base + RISAB_CR);
+	int page, compartment;
+
+	dbg_entry->srwiad = risab_cr & RISAB_CR_SRWIAD;
+	dbg_entry->glock = risab_cr & RISAB_CR_GLOCK;
+
+	for (page = 0; page < pdata->nb_pages; page++)
+		dbg_entry->rlock[page] = risab_rcfglockr & BIT(page);
+
+	for (compartment = 0; compartment < RISAB_NUMBER_OF_CID; compartment++) {
+		u32 risab_cidprivcfgr = readl_relaxed(pdata->base + RISAB_CIDPRIVCFGR(compartment));
+		u32 risab_cidrdcfgr = readl_relaxed(pdata->base + RISAB_CIDRDCFGR(compartment));
+		u32 risab_cidwrcfgr = readl_relaxed(pdata->base + RISAB_CIDWRCFGR(compartment));
+
+		for (page = 0; page < pdata->nb_pages; page++) {
+			dbg_entry->ppriv[compartment][page] = risab_cidprivcfgr & BIT(page);
+			dbg_entry->prden[compartment][page] = risab_cidrdcfgr & BIT(page);
+			dbg_entry->pwren[compartment][page] = risab_cidwrcfgr & BIT(page);
+		}
+	}
+}
+
+static int stm32_risab_conf_dump_show(struct seq_file *s, void *data)
+{
+	struct risab_pdata *pdata = (struct risab_pdata *)s->private;
+	struct risab_generic_debug_data generic_dbg_entry;
+	struct risab_debug_data dbg_entry;
+	int ret, page, compartment, block;
+
+	ret = clk_prepare_enable(pdata->clk);
+	if (ret) {
+		dev_err(pdata->dev, "Couldn't enable RISAB clock");
+		return ret;
+	}
+
+	stm32_risab_fill_dev_generic_dbg_entry(pdata, &generic_dbg_entry);
+
+	seq_puts(s, "=============================================\n");
+	seq_printf(s, "        RISAB dump (%s)\n", pdata->dev->of_node->full_name);
+	seq_puts(s, "=============================================\n");
+
+	seq_printf(s, "Secure read/write illegal access disable (SRWIAD): %d.\n",
+		   generic_dbg_entry.srwiad);
+	seq_printf(s, "Global lock (GLOCK): %d.\n", generic_dbg_entry.glock);
+
+	seq_puts(s, "| Page                       |");
+	seq_puts(s, "| Res. |");
+	seq_puts(s, "|     priv. (p) read (r) write (w) per compartment      |");
+	seq_puts(s, "| Delegated |");
+	seq_puts(s, "|    CID    |");
+	seq_puts(s, "| secure (s) default priv. (p) compartment2 priv. (P) per block |\n");
+
+	seq_puts(s, "|     start add.  end add.   |");
+	seq_puts(s, "| lock |");
+	seq_puts(s, "| CID0  | CID1  | CID2  | CID3  | CID4  | CID5  | CID6  |");
+	seq_puts(s, "| conf. CID |");
+	seq_puts(s, "| filtering |");
+	seq_puts(s, "| blck0 | blck1 | blck2 | blck3 | blck4 | blck5 | blck6 | blck7 |\n");
+
+	for (page = 0; page < pdata->nb_pages; page++) {
+		stm32_risab_fill_dev_dbg_entry(pdata, &dbg_entry, page);
+		seq_printf(s, "| %2d  0x%08x  0x%08x |",
+			   page,
+			   pdata->risab_map_base + page * RISAB_PAGE_SIZE,
+			   pdata->risab_map_base + (page + 1) * RISAB_PAGE_SIZE - 1
+		);
+		seq_printf(s, "| %3s  |", generic_dbg_entry.rlock[page] ? "Yes" : "No");
+		for (compartment = 0; compartment < RISAB_NUMBER_OF_CID; compartment++) {
+			seq_printf(s, "| %1s %1s %1s ",
+				   generic_dbg_entry.ppriv[compartment][page] ? "p" : " ",
+				   generic_dbg_entry.prden[compartment][page] ? "r" : " ",
+				   generic_dbg_entry.pwren[compartment][page] ? "w" : " "
+			);
+		}
+
+		if (dbg_entry.dcen)
+			seq_printf(s, "||  0x%04x   |", dbg_entry.dccid);
+		else
+			seq_puts(s, "|| disabled  |");
+
+		seq_printf(s, "| %-9s |", dbg_entry.cfen ? "enabled" : "disabled");
+		for (block = 0; block < RISAB_BLOCKS_PER_PAGES; block++) {
+			seq_printf(s, "| %1s %1s %1s ",
+				   dbg_entry.sec[block] ? "s" : " ",
+				   dbg_entry.priv[block] && !dbg_entry.cfen ? "p" : " ",
+				   dbg_entry.c2priv[block] ? "P" : " "
+			);
+		}
+		seq_puts(s, "|\n");
+	}
+
+	clk_disable_unprepare(pdata->clk);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(stm32_risab_conf_dump);
+
+static int stm32_risab_register_debugfs(struct risab_pdata *pdata)
+{
+	struct dentry *root = NULL;
+
+	root = debugfs_lookup("stm32_firewall", NULL);
+	if (!root)
+		root = debugfs_create_dir("stm32_firewall", NULL);
+
+	if (IS_ERR(root))
+		return PTR_ERR(root);
+
+	pdata->dbg_entry = debugfs_create_file(dev_name(pdata->dev), 0444,
+					       root, pdata, &stm32_risab_conf_dump_fops);
+
+	return 0;
+}
+
+static int stm32_risab_get_nb_pages(struct risab_pdata *pdata)
+{
+	u32 risab_hwcfgr1, nb_pages_shift;
+	int ret, nb_page;
+
+	ret = clk_prepare_enable(pdata->clk);
+	if (ret) {
+		dev_err(pdata->dev, "Failed to enable clk: %d\n", ret);
+		return ret;
+	}
+
+	risab_hwcfgr1 = readl_relaxed(pdata->base + RISAB_HWCFGR1);
+	nb_pages_shift = FIELD_GET(RISAB_HWCFGR1_LOG_NUM_PAGE_MASK,
+				   risab_hwcfgr1);
+	nb_page = BIT(nb_pages_shift);
+
+	if (nb_page > RISAB_NUMBER_OF_PAGES_MAX) {
+		dev_err(pdata->dev, "RISAB number of pages is greater than %d",
+			RISAB_NUMBER_OF_PAGES_MAX);
+		ret = -EINVAL;
+		goto err_clk_disable;
+	}
+
+	ret = nb_page;
+
+err_clk_disable:
+	clk_disable_unprepare(pdata->clk);
+
+	return ret;
+}
+
+static int stm32_risab_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct risab_pdata *pdata;
+	void __iomem *mmio;
+	int err, nb_pages;
+	struct clk *clk;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	mmio =  devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clk\n");
+
+	pdata->base = mmio;
+	pdata->clk = clk;
+	pdata->dev = &pdev->dev;
+
+	err = of_property_read_u32(np, "st,mem-map", &pdata->risab_map_base);
+	if (err) {
+		return dev_err_probe(&pdev->dev, err,
+				     "Couldn't read the memory range covered by the RISAB\n");
+	}
+
+	nb_pages = stm32_risab_get_nb_pages(pdata);
+	if (nb_pages < 0)
+		return dev_err_probe(&pdev->dev, nb_pages, "Couldn't read RISAB number of pages\n");
+
+	pdata->nb_pages = nb_pages;
+
+	platform_set_drvdata(pdev, pdata);
+
+	return stm32_risab_register_debugfs(pdata);
+}
+
+static void stm32_risab_remove(struct platform_device *pdev)
+{
+	struct risab_pdata *pdata = platform_get_drvdata(pdev);
+
+	debugfs_remove(pdata->dbg_entry);
+}
+
+static const struct of_device_id stm32_risab_match[] = {
+	{ .compatible = "st,stm32mp25-risab", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_risab_match);
+
+static struct platform_driver stm32_risab_driver = {
+	.probe  = stm32_risab_probe,
+	.remove = stm32_risab_remove,
+	.driver = {
+		.name = "stm32-risab",
+		.of_match_table = stm32_risab_match,
+	},
+};
+module_platform_driver(stm32_risab_driver);
+
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0


