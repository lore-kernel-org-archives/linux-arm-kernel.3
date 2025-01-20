Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8FEC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HikyuC85c4OtraaH4/n4z+kHD9b1BNSNvuSvTdQjvkI=; b=hRDius6nzTzCtBe0ZJd53sLHUu
	SPOit/sySDRlJYqjDLRjTxoLL06lsVDGkS5OmmhlG9uZ4D+ugWdy5r0uupokBH4yE8V5DRK1K8HMb
	G+auTMnljBwedSuByWWrQAO4Yn2AdIutd3Swbn2W9IG35cjPWr4uTzNe9UR2w22mSkVSUJdKhU0we
	XaYLdupDO9oADUBqttES3gBkuXitUMfRt/wkh7OcBBZmrpC03aqsxDd5Fwitbkiy1VcqPJMu1w0fW
	rdGxbx5QddO540vk+OyUgUtcOtehX3ElJ2kID6FLsxtFCIGLkxn/8jd3pJa9yKzx/Z1PntEhGWXFv
	23CA/g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZm5r-00000004uN7-0vuq;
	Mon, 20 Jan 2025 07:21:07 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZlzh-00000004tWf-2h47
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 07:14:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3b4cwnVJHOCM1fyQQt75gvGB5ScpYgZ3qFqQwY8DWElb6a59h2QnakUmWipgXjVqGCrFO9Ycr8xCcUbZj5sTFDXb/hvVrakC4RrXojkfDodpnG1OqlXVxWPN5wSbtAuz9qEprw7IzyhxGf2Zf39TkB8BQQMsPbekDg43rHCZJE0k+coXgSFjPu9fRTM4fgf17Ek3HE+vEirAcUORrjCnzbRBlPBp3r3PFSMGOIcV4tOX9pDMsTmbHemA6JyOBCvx9xDMRaAbWdwnL2w2iDokOZ35bOdigo4pyyXbxfNKSMmsjArs7yPSfKmOcrT9tsGQSDYnPQvdV/xgc5UtOW/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HikyuC85c4OtraaH4/n4z+kHD9b1BNSNvuSvTdQjvkI=;
 b=hdbbgsKdVKOieERjBFB8vdRkaPCdB5lNZMUqC2J4ZW7JMS8DcbENlWHvFncN/sGr/yh7n+kPnHMKRdz7HrIxAWkwn+EFRVtOW5SjBGnrCvRnhon4cVG5R/rrGOFGhBdFw6thLRnmgS0VKusu8k11LfoM4kC9iL3zYNggIEh+M76jIR+0043CHx9yYQWE9C0MQWHsc18RBLPOqCurKtG2Q9aGzs2IIOcTFp5kDaVdnyftYuRsjpiRZ2rym1tR+aEZ1FPj37pR+AOiuGx1ZAHaKgW9yCaLNFC2JHz5IlkL4HjQWlf6Ym69iOU/L5fkmytSHDhK3dCsajeZLeNOFnSyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HikyuC85c4OtraaH4/n4z+kHD9b1BNSNvuSvTdQjvkI=;
 b=UhS0AXxCuP+8AJ94DdiF+QEpP7PZKAD+wrWBhU3TOcBsZhqmAdbqR6AFEUpZAPrk71pkQhi26U/oR2BAP7fgcbSbo8KDSoZCHABrDTgeRwZ6zIMS8g7UUn8OJZ1yRy+uYVfMi15ZHtHyXFYN7ejR/me4Dyhi9SfK6xMXlaG7IcPmx83XdNkQZBYs6WDEj3hYt75z3RgYjs+pwngRxS5Y2IKpwGyZjaPKnFoMVuLbp0AxppbD3cCoENIwQRqdPB1GXLiZ/0CrKcroWi7+Eh1DXTzqG0qSFY9s+G+MZzxbmJ20O6Qun+5yBimy0K6l0ewLj2d8Osktcm1I+g5ynLT+WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 07:14:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:14:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 15:13:32 +0800
Subject: [PATCH v2 4/4] pinctrl: scmi: Switch to use machine_blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737357232; l=1588;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=y7Jz62QD/LOAhaSVNi4OjY5Sw5Y/G32ouDnOiFpe8Ls=;
 b=fG648whABDouqN4JkTlzP9apGuFyMly2VDnFJtrGI9WX5yafoZQaDqiJZbEzSCKOIu1qgNFnJ
 Qx8k6znkT/qD7ymvWCrjSw/CjPNoHiE3oPFHrbHqhOPxK1Pg12V9w/7
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 4530a3ca-ce49-4ef2-e484-08dd39221d1b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUwxWWVReklrZ2wvRzFJRFZqa1BrOEZGZlN6N1oyMFlJOFlFQWltb3FIZGRa?=
 =?utf-8?B?c1BSVlFybGtzRTBoTVZ3a0hzaTZiNllXcjMrbkRwU09wUm5ic3RmZ2JYMmNG?=
 =?utf-8?B?N2VHU2ViY3AydkFNeUx5SUZCYWR0M0xmWWRZbkc0QjhPaTk4dWE4MXJnTjB0?=
 =?utf-8?B?UDhvS1Azbk9zWDQ2QUo2TmxOV0tVMmRKZ0lKVDQveXNZaTBnczR0MSs0VHla?=
 =?utf-8?B?K1FmNWtqTzBFVkFab0h6N3F5TWVPSFFCVkxIVDdXUFk0YUI3RDRrdXdaNzJy?=
 =?utf-8?B?VTB4aUs2SE9LaE5ES2FSR25qWjBVMGFCb1VLVWo5T1JNTnltZ1BmYkVzRmVY?=
 =?utf-8?B?Y2x1U2JGM1ZCU3BwVHE2djRIR3J3NVRyWWFCUzlCVEJpT0l5STd6MUVkbE5L?=
 =?utf-8?B?ZVN3cTNtaWd5S0hXa01sU1dsNWsvWTI3ZkRJNVcweUZxVjE4bXlwVWNoK0xQ?=
 =?utf-8?B?YXg1dWxtQmJQVjk4a2pYVGdxdzBpci9iNnVaWGN5RHFaYW5NQnZyUkdNTkdZ?=
 =?utf-8?B?ekFPdnE3aUpobU8zYXpwRzB3THZQOHJ6OUpvMjJrSmMrZHFjUFNIVUNSbDlX?=
 =?utf-8?B?bmM0b1BycWJNeXlHRjd2TjgvbGowcVZobmNzc2dBdDM2MFAyd050V1g2MzBV?=
 =?utf-8?B?QXpYaEtJU3dCaUcrcG1sa1NrcG5za3Rhc0M4Z0xmVzlJS1l5NEwrc2V3RWNv?=
 =?utf-8?B?ZFFOTis5NHlZMmtvT0svcE4zQ01QVmJiSDZJQVBJemNmV2V1di9EWXFsSFlh?=
 =?utf-8?B?TWx4SDlQK1dCL1ZOV1p6UG1jNUlvV3ZOYUVocGx3SXd1NXpCZ1NtSXp0WnJD?=
 =?utf-8?B?dHk0Q3FRb0lscGFsUFAwd1dOVDd2UHpyZ2pxZkhheDQ5MXh5MlJCRmF0THBY?=
 =?utf-8?B?RlZpR056cXhoMHl0aTJmQk9uZWFIS3ArRWhnUEpIMTAwMmQyemRhVnBaTnN4?=
 =?utf-8?B?SjIzdFhtQWl2c2NobkZYNXp0R3M3VmVMa3ZoT1d5MDY2ZzBqaUI0UGxRM3dl?=
 =?utf-8?B?RHEvdElwS0dqaU9ocEVIYnEwc01tcy9VMEhGRmZsM2IxRSt0TTRGWXNhUFpS?=
 =?utf-8?B?M1ZaempZcmloM2psdFBmU1pVbWliMFVXYm0yWXhHM2tOT1NhcHBJdVVJTEQv?=
 =?utf-8?B?Nzd3b0lBblloeU4vQk9EdUJkZW13eEkzbFZyMDE3dWh1MGJyZDMxVCtIUzZo?=
 =?utf-8?B?MHowSFBScVROd3FSYk1UdWJYWjdDT1EvNnl6Z2lZdVRoY1RPcDRSalJlTlNX?=
 =?utf-8?B?TWw5NEVmNDNJYjhLTmlCSk5Cc3dWSWsvcGk2RXlSbWxHbjhFNmljMEI3Qmwx?=
 =?utf-8?B?UHVrZGE3OUtMM2RINUViZElIN1p1NzIvN055em1qWEZOcUtSTEhTRjhUUGlS?=
 =?utf-8?B?MkJMai9NdHdTdTEvM1FqSDBIb1dkTHBlRG9HdGVyd0pQeWZLQWMraVNNaUxV?=
 =?utf-8?B?cTYwV2RZeFVkNUpLYzV6WThaaDBrbm0yY0UvZUVOMDgvU1FkZ0pIM2QzY3Bi?=
 =?utf-8?B?cDArN0hyL2lQOWZzTjl3VjFnbm9FVmVWNU9vOGI0T3d5SUc1UndSRE02Mmg0?=
 =?utf-8?B?U1JSUUU2RlkxNmRQc3RJWnZmbTNicGtzUGVjcUNLa0ZXTG9vVER4S3hNOTlE?=
 =?utf-8?B?VnlQOGN6YlFQNzBCR3VPc0g4eERYOFA4L1UyOWlQQVg1bkZWY0ZqaVZ4eW5U?=
 =?utf-8?B?T2k4V3U5aU5vQ2xkWGQva1JXVVR4T0tZd2s5RC9zU0ZXOGFZSC9iY3RVOFNY?=
 =?utf-8?B?L2psNGIwMDcrR1J2WXZkMWpWeE1xbTYyQllWWFhUV3NTZXpGeHdWYnJ0dEhl?=
 =?utf-8?B?L0NsMHhiMUhKNWVUZXJxN0xaM0hUOWRjUVQweTBaTTJKRkdjMFZJWjU2SFVw?=
 =?utf-8?B?RWhXVDNyVmxqQTNNVlk4V3NKeDhSc3FzQzhtclkwaTZEN01kcUwxUjk2NXNQ?=
 =?utf-8?Q?0cpqviJ21Ocxr0FsJbGh5KjbhkfEywlF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0RtT2VVcWo1cjJZaGdiK2xDTWNmUllXNDlFeExjc1FFV1JiMG5hY1VPYnRL?=
 =?utf-8?B?bGNZcjhjbGdhNTRpODFJbkczNTVZY3JRMUxFOFhJNVlaRjZZc2dURkxTU2pr?=
 =?utf-8?B?aFNSTlhvNmhFRzV0T0RKOHVHMlExZ0JGaFY0c055dzlZVXV1aHVJTTMrVFh6?=
 =?utf-8?B?QmxQQzFaS0kwc0NwY2pEMWZ4cTRmK0NSMzJBckZpMG5jUGVLMG5HeTlKVEJ4?=
 =?utf-8?B?S3lkekFrQWxncGpsQ1B6Tk5HUG53bVJ4L0ljZmg0ZGtCMGlpdUpzRWQyYXVn?=
 =?utf-8?B?UVNhcWE3aU1YQkF0dElMaHZNMCtHRThKZ1RhdlJJRnN6REt3L01QZVJ6YnRT?=
 =?utf-8?B?RlN1c2NSR3FVK3pEVktNblRyaTVjejhiTWVSV2pqT3A5UWgwcUNxMmxWcGN3?=
 =?utf-8?B?QXgvNGE5aUJFcDZZK3ptcnFad3VRRFJPM0Z2UkZnMW5EZ3JEOU1jWkw1QjFV?=
 =?utf-8?B?WitoRnlYWXlnVElhVzFHOFYrZUZkRzR4ZTlPbk1CeEdIQ1dwMXAxWklPRmow?=
 =?utf-8?B?a3hsZ3pONGtITEV5eGxhRjFnQ1VrVUYzb0ZyaVN5MW5tUmRhQ3krMldaTllz?=
 =?utf-8?B?SzVPZWgwU0pkbFdxQnhBaDArNUFYWEVxaHJWRzI4NVYveEpIYVF5citBS2M2?=
 =?utf-8?B?bE1hbENPcVlGUWRHVDgvZFdGRnE0M3V1WVl3SkczNkVGYXhzcEJGZVhYdDhw?=
 =?utf-8?B?aXBja3FKT292Y3pXclREL2s2aW01S3RlK0hjVkRxbVI3bFVtZjQ0clQvU2NT?=
 =?utf-8?B?Ris1Umx6NXFGTlJHT1pNUTdqc2N4SVFwc21jNWMzajNMYTZ5ekZ4VHFHbS93?=
 =?utf-8?B?c0NjWXhMUUU5VHM0VmszQ1o1UWhhRWswdkQwVklUMG1kSVQvK2xOclBIRlhn?=
 =?utf-8?B?MndMTXVWZVZSSWVlMVhxeFZxUU53eDlzRnpTVjIyY0VMeVpYeTlGMjR1cU1h?=
 =?utf-8?B?Y1hjcmI4QWpSeUE1T1RsOFJIWWdnMmJDdWxvNXpJR3ArNkxXb1NLV3p6WGR3?=
 =?utf-8?B?MkZobzdNSmY3UC9Fb3ZsV04yblRFQWJsVXdSTmZ5NVVGMnd5V21INDVtM2ZI?=
 =?utf-8?B?UmIyR3ZHSTRvenQ4cmtBdENTNmJrcjFvUGRsRmxuOU8zaUJiS294M1QybFdm?=
 =?utf-8?B?cERPQ0ZKakJYYzVGM1Mwc3phMlhpdnhlODBHcFdaM3cyMGNkWVZXWitYNXhX?=
 =?utf-8?B?RlVFWHRkZ3NBeHlUZ1lSYkNOOUU1UGhOL0FDZUtoeDBkd1UreU9mUFJYMURV?=
 =?utf-8?B?WjZuS1p5VGpOOWg4a0hNS0VWM29NVUhSRHNBYkNlVmNXMVdRQjd0SEVxeXl2?=
 =?utf-8?B?YkhDemc1dURzeWlReVVLeDI0R0dFYmlKTGVnRnJiTnZtdG1JbUg1NW1kMnp5?=
 =?utf-8?B?aUx6MU9SNEtYTkIrakJhUEYzeWhPRzdNMkcvc3N6MmtWOWkxQmNDZUd6dHgz?=
 =?utf-8?B?SVlLYWZ4WjMyVXd2YldiV09yRnRxVTRtcTk2UC9OTWRURzR1Z3Z0OGp4WnVy?=
 =?utf-8?B?YkFMOGkrbkRFUEZkaGxYcExKV2hBL2R2czh5YjRBWmlBRi9FaHlKaFdSaGRi?=
 =?utf-8?B?a0kyUmlocFY5WCtoaStJSk12TVJESlZaVGtQR0ROb1l3d211MitrWHJrMU5N?=
 =?utf-8?B?K3JVUVl0TVVnbjFKaFFBS0thbnpoZjlqYUJNRUlvWjR1bEtrbEJqVDVRc1pt?=
 =?utf-8?B?UmxxNFU4alphKzBpa0p6T1Z2Y0l0aFRRTnVxQ0VDaHcyc0pJUUNhS0VpdTEr?=
 =?utf-8?B?TUVhNmFsNUVyN0xWY0NmV0FkQ2NzcmcxYVhLUUtGaVA2a1VCYmZmNkw1NmNs?=
 =?utf-8?B?Vlo5R0UyMms4aGQ3dXFSSlJkSXlodXRyNXl0alhPSThPRHp6dEdBR3ZISnhr?=
 =?utf-8?B?UWZPd0tOZkE5M2sySlYwcVd2MjlPbm5pd1V0WmxaeWlFV2I0VmwvTENETWFY?=
 =?utf-8?B?aXlBMUVoZ0F3Y2VtWWxRM0pKajJCWGp1bGJNL2JiSFlEWERSeWpXVFdjd2J0?=
 =?utf-8?B?Z09HcTZueTZEb0ZodjBJclB1T1RoUGJSMEExeWx4cHBuaWtpN2szV3l3RkZX?=
 =?utf-8?B?ZHBGbUczKzI3ZGVkTmZOYmsyY3d1aWpkbCt6bU1taDZkUjhuWGhpTFJLWFc5?=
 =?utf-8?Q?9MX/OQ2tmAIxim/iCOf95jyt2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4530a3ca-ce49-4ef2-e484-08dd39221d1b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:14:43.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbepuf5AUcIyZqx36fN3xfH4qvz6q0ewqZDC4tAOmm9c67LeMKBxjlFHXedr7nMNOISh7+3J8fswAsrF2shgPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_231445_713827_AA1771D6 
X-CRM114-Status: GOOD (  10.71  )
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

From: Peng Fan <peng.fan@nxp.com>

With machine_blocklist, the blocked machines will not have pinctrl scmi
devices created. The fw_devlink will link consumer and supplier
correctly.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..f041478758b50e85d99214f4fe42208d0c8c808f 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
-static const char * const scmi_pinctrl_blocklist[] = {
-	"fsl,imx95",
-	NULL
-};
-
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -521,9 +516,6 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!sdev->handle)
 		return -EINVAL;
 
-	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
-		return -ENODEV;
-
 	handle = sdev->handle;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
@@ -561,8 +553,13 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	return pinctrl_enable(pmx->pctldev);
 }
 
+static const char * const scmi_pinctrl_blocklist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static const struct scmi_device_id scmi_id_table[] = {
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl", scmi_pinctrl_blocklist, NULL },
 	{ }
 };
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);

-- 
2.37.1


