Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9152CD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48vD7A36hAnn2ZOOFLdnExg7mLbU+dpobsyh0bd2cNA=; b=fVee+at8BY8ytOsBldGCTrbAdO
	2jKpnFv/pXvrY+CrP9VBtKOY2dAbNbYmJMxH2Os8Ayt5XnKNh6P7Tne/me9C6l/BUeDbRTr4znJKy
	IWcND/8v1DGu3qUsyLhotNNgpPY/k5kk6Upt1mt10W935XqzSkLBvPVzh09cllsX7XCOoFYxnBkig
	Rro/iJyIqo+eFZbTulyzke7ApOMihTpGqgfsQy5cjWSKLrSUGv6VznMGTCv4VC/0SIUBH0KYiAdtd
	2Yr/99BRuZgod0ToRfYTq699TkGtar5DJGdA0FYUuS23Kd5gWBxeq93PJr00sF9/zajxkPRc+vX0p
	qPgLiZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1I2-00000003LUC-3VSH;
	Mon, 01 Dec 2025 10:37:54 +0000
Received: from mail-northeuropeazon11011016.outbound.protection.outlook.com ([52.101.65.16] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Hz-00000003LTd-2dIa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:37:53 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MPGMmrxOdOLSHA4Rj0lclBIpaE4j9DUwO2W9bXLTvg3pmI+zs3Dr5gRbPQdfUzAqgheQR8cmtc1aUUXJK9J7/r229gGKz3L2F8D3QWM73tltIC4wPAHD3+KBFc2Y+6VrwsjVETUwqoN717L2dpnD4cgQ47TtUwUiewd2oHKwL5ZLM6c6xxRN0fvdua011/lN5lIdUPI94KqUq1K/UaDI8OMGi0BbC01VEMg1zmxghChrQhOfhF7w8wUIllYlQLN17cMscQDqqoLsxanvVAGb5z3FKF5SpeixpCara9yeiJe+eHaCGxoj5+veNNCk/smTFX9hEiU45Ub8NO9bkSQeyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48vD7A36hAnn2ZOOFLdnExg7mLbU+dpobsyh0bd2cNA=;
 b=QsVIivz2zPd8xV/Sa2ZRaWpWGePZf93mCkQI035Egl+Uk+5g/dZn8UvrpH/rBeQH400gRsDA6wjCFV93lm2zsxtLcRSbFzLL2rUIoT2ZAUH1cUmuyQmXrHpUuGvZ9pJ8NrWEV1dElaO/drfyy5QZw0u59EkcnkE7vz69QiA6gSPEYfW1DxdP4uH3xQuKx5khF1gihxsGJdCrSgkIKGWMxFLY7xhdALMOSWRj5ibemWZH5Ae45bg2v0DZT+m6nedEIvboXhl/7PWHNwpfKVtUIHQJYi7TX59prY3n1zZAjvkrM9uZkj/RlmCx4xG/ZgiUi/AbePNuubct/97UITEyHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=debian.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48vD7A36hAnn2ZOOFLdnExg7mLbU+dpobsyh0bd2cNA=;
 b=qToFokFrPzYtQIyjv6iNkp2+PhSOhfvqR1bAeNCgnX2MV9XeaoIQMQBb+g0StRDnd7puiqgKx+z1tv++EzWY2cMDJ5R1lAsd41MoUqlKHPvatsWw6IX/2S/9XtGWDU2XiS2nJkwnMG40Dp9pMlVR7fsqCty6NE9UqCw0ggZMpM8=
Received: from DUZPR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::8) by AMDPR08MB11507.eurprd08.prod.outlook.com
 (2603:10a6:20b:71e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:37:46 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::c7) by DUZPR01CA0017.outlook.office365.com
 (2603:10a6:10:46b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 1 Dec 2025 10:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y16dGGU0coMxICM6JDZamO0GYd2rBr3q2T7Vn/f7G8sAOzWF1sc2CUoyMY3SmB5wkZBFIoXcNEqtwguqxRNEXdNO1aldx5TTcgSdBifCQmCNIviu+HPzZcJohNTbvYlXNBfK9c2Wn2D7nYPWcdWIOt1EJeX0CFg3ou6xG1QmL3AJjpCboSaNGMKQNvW9oe9eSf9Bwwpq67mkg8B1nCJK2DBaBE7ZHaGvv86I6jeiK/gPGWfh7Zk2fKLoWmighIlTfnQBoQTu4hlDJTR2SZrMmLt9LkB7J41yRhgudyAd5qtMB8dfWpFNVG2k1yKl+qVJNOa/1ay8uKR615lCqkA4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48vD7A36hAnn2ZOOFLdnExg7mLbU+dpobsyh0bd2cNA=;
 b=nvgDPtlZx6zr/tdwyqT4QGoVpV/Yj94zHDiwX4I3CHl5EamsiW/ao/GFkuWhkNrgQ70k36qeOSdB444PqvBsmEsrWihNMHjTCDQLZsDCBiq+OGI4DEXvIkw3qpbAAQgbAwIkO0zzWD5zaDjhRkc2dyphdOlaG8md5rImiKxxX1WT5HW550V/tH/oWM06z1oXJFq/lW+39XaLL5SUCb8LSNbeFZzjTg7pr3gIiwu9wdf1S0jdiNpsW1gk18nxKfnfByfQZ6+SpI+39O/EgBFXmiGUBXwla8QwvTA36jBr++lh8STRM6ouVOtCZc2lXRXVVCbZbR7CxcN1Nf1j5NZIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48vD7A36hAnn2ZOOFLdnExg7mLbU+dpobsyh0bd2cNA=;
 b=qToFokFrPzYtQIyjv6iNkp2+PhSOhfvqR1bAeNCgnX2MV9XeaoIQMQBb+g0StRDnd7puiqgKx+z1tv++EzWY2cMDJ5R1lAsd41MoUqlKHPvatsWw6IX/2S/9XtGWDU2XiS2nJkwnMG40Dp9pMlVR7fsqCty6NE9UqCw0ggZMpM8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB8787.eurprd08.prod.outlook.com
 (2603:10a6:10:476::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:36:41 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 10:36:41 +0000
Date: Mon, 1 Dec 2025 10:36:37 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, pjw@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, coxu@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bhe@redhat.com
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <aS1vtct8p6+P6GbU@e129823.arm.com>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
 <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
 <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
 <5wel6vqjwwf25hryvg6s7z6aaog7xc3zxjevupt3jn4gntme6d@74wwwmhvvelt>
 <aSmrUGnZp0UeTp1E@J2N7QTR9R3>
 <aS0Ch3hrYPDXomDC@MiWiFi-R3L-srv>
 <j2ilxmuhlgu5dwswl3qk7rbzmbk25qn4s2tidhdy4uy7dzfcnn@6ulgmdw4effw>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j2ilxmuhlgu5dwswl3qk7rbzmbk25qn4s2tidhdy4uy7dzfcnn@6ulgmdw4effw>
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU0PR08MB8787:EE_|DU2PEPF00028D12:EE_|AMDPR08MB11507:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cd2e8e-db33-4822-a0b4-08de30c5aa5a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?vn9P4lNcgEbztiwG6oCgehrNl+vWmIuStRv/dviGo8/nV2Txo+gM4UawZK8E?=
 =?us-ascii?Q?cKDW2P/H0o5pVLNmjNh5MS0OxOcdQghgyHXxiXWk3BgK2EMJ9ULkUkOHLH4E?=
 =?us-ascii?Q?IsbHGhRdYFMqK9FLksoNWiTSAJoVhS3NaRvW3DMtfOLcljkrVHqg/GJ7MRxD?=
 =?us-ascii?Q?LDICwKPQ9xycb7d7TggyQkxgsJUCNMz5ooyOHj8C5J0fItRH48sNxGN7jBNZ?=
 =?us-ascii?Q?/C35EWmQ7enh97/VbNdWw1+gZAzrh/ykr+yJYyCahwnSdJd3d0p2z3ewqymS?=
 =?us-ascii?Q?rTBlaS0qXtIBjBYSKgmI2YbN3W1MmboAIpB1uKba7VwcpcpFe6ZVB7wG67uW?=
 =?us-ascii?Q?wlPWdSQGFjvtRFOw52XjKqr/3G1wFhvDSJFxHazhf3UZxObj/mv7bPL8oCZp?=
 =?us-ascii?Q?y0vhbFy5dktprcm6GgGHeEu0zghPSnsT2sLu3jV6uYE3dI2HfHrvqFR67TJD?=
 =?us-ascii?Q?K1yXXbk/1vgXGnsNEPP7Odss7Mm6NbBmv581ue2lPhmdS+7VULcBmHKfEwy5?=
 =?us-ascii?Q?NywxbIDq7DFESp07y7/pWHrv+9yfj4VStGeITLNVGb6S5EEfcZh78z7FYwzg?=
 =?us-ascii?Q?6IaoKzf7FVdl87+F68jC/y41DjYuoXEg1VgqO9XD/RXKJpmAS5OGQSqSdy+F?=
 =?us-ascii?Q?dtoNKZbxqAbEfsuNeois1isgXZD0miPAv7soYjdq/+dSI3i+rYPmnUkVnj5O?=
 =?us-ascii?Q?bWTil0BPAYdQ/e6wGVWH7VqujnskHPNeUrk/OgphHD4IWHp7JWosh8p1Gntk?=
 =?us-ascii?Q?8IxnFhgGC1a1MYwtgfKYBJ0o4AaeJul+1VHcS9V0GT/7ST2ide4839vGD0q+?=
 =?us-ascii?Q?xbhXO7r7gXNFuY06022J1potPtpCMkIteLls1182OeQJq4ycEfEuxWFK6JZ0?=
 =?us-ascii?Q?XCajtO0AT8GsEBlTnFyDq+RFGRYL30ksnEiPgzHXevSRX/qeRQ4m/9b3phhD?=
 =?us-ascii?Q?Ahewcg4rg/3Uy1F0bDeptMIw5576sxPefP/C2tna6tuMSSfqIGsN+yDSfpIL?=
 =?us-ascii?Q?PEkhARB1rdd8RFjeYCi1pYf1uiWuZE3bRXMXLAYA4j603narpRRrCCr2AxFc?=
 =?us-ascii?Q?ReI3p8aqBWgrDZhUNwt2JoPTCI4ilpze5yc+4DSR98D+c/HAVIT4aeB1OJCx?=
 =?us-ascii?Q?Mk1mnQz4bDfx10LYJplTXkTTwhRAqvu4fpTMnE2JbWhqaRNGByT/CVaNDZSg?=
 =?us-ascii?Q?5j0r4BRRkCByjn8Dijgyuxp7iFmBhjRMcIwgIvMTh/gCbOvmI6KZoylQ6HKr?=
 =?us-ascii?Q?XJnf5ijoX5GcJsgNXUxFJV+J7bAR2WHIaXDDumKyNBXisfx13+GAGpDg1ptH?=
 =?us-ascii?Q?NhU3/8axM9KYU1X/b1rn0mgWppnHlLg5qWgUTW8moGgL+B5VAWZ1ERX87QqH?=
 =?us-ascii?Q?bVg1wrLgmN8mp5kBJbtJqieM0lkD8+hWlzqqoK0RA0YaPOmeSNMnXeK2ureH?=
 =?us-ascii?Q?/2Q2OSsK0k5rbLvWCYAkxKV5W+kzwWZj?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8787
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6b17ac47-da9f-4769-819f-08de30c58394
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|1800799024|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PmiAcYLYPwQGal6P3imHYKBlf65t4lPvVO+iHukgvw5FSPzDXxq5FFE3QpSp?=
 =?us-ascii?Q?t8MXtQSEjAF/dISgKyAOyfSvsvUtEcVUKdMDAG/CWi0RV9MahmkbGbQDG5hy?=
 =?us-ascii?Q?YT0l728A4+1hGzA6Q/BpbwVJin/8u+Sjw1QEFLFZbmuIPJovtbPUlhD8JmhM?=
 =?us-ascii?Q?lNH2IelZlqMXRI32KKnyR/AUbtQHLwNJq7IETApcwJrVbsNVtcLD8CGuP1h0?=
 =?us-ascii?Q?x/w0i9XhTQPc/MVI/xjsvj2DZeZru6a/cBkNQ4dFYLURrlhQxwJOMUOu0LE8?=
 =?us-ascii?Q?YrRuAv3r4go3Ss8iiwSW+6XRUmunDwNp8MbQS7C8SJ12JzhI7UPx7lgiTqOo?=
 =?us-ascii?Q?MuZoVNHK52mXtjrxb/CFeIK4TaJcaGHgJAWKt3PKH6uxO9BQyKKs8com9IUN?=
 =?us-ascii?Q?FqtILU2Xdx150ZVNnRmnIODT7hTqCLxWyJ7ofgTxkhi8fybDM3KBPhcUG2fU?=
 =?us-ascii?Q?j8PME/tHyW/L0eZpkL6fcA4Qkkbw+vu5RDWL84UTxpdXrOjKAKWX63nqf2EL?=
 =?us-ascii?Q?JQmU34Un71477axaitje4mOQHZbq/lx0gG0mpVvc7AZSjjeDY7Np0HXDw0SE?=
 =?us-ascii?Q?TtCbUikZ43gy7Q/Ew/oIXANpwAvfQhgzB2Qw67WobM9TYZLIIYFHroQKo0Kr?=
 =?us-ascii?Q?Z7jbpr7AJ57K8Co0gHX7nNgot5mmg2vJ0gdiuLjaZ2zADWgR0fgjV5Nrp5Pf?=
 =?us-ascii?Q?jIhPWJ1DjSli9Y952mCNs6vQfrAVhcOy8lL77DEBCHa4hMuJzhMOqdrJ/weK?=
 =?us-ascii?Q?PzPi6xofQDmwX+5f2AaKYRaSuyOijehAjsVBEAJ5EBbja4vppBwNMMvC69Hd?=
 =?us-ascii?Q?L4CroMKqcZzNOOG+o+DcpS1H/sYzlK8StzCbYhannZ4wfRDDm0AIoJoDIXCd?=
 =?us-ascii?Q?tw7VYpK8gTn0KeVXK45c6x8oAMtsNnwHidu3L+6e+7BOMuP+kDXGSzkSmtEB?=
 =?us-ascii?Q?R59ZhfBLWuiqZOs6idrduq08Eov13u4gCebRpGAUzC3vSEf36Z9IOAF4Mv9e?=
 =?us-ascii?Q?Ed+q8/vHJlzXDfucA/yg7dSug+9SYsrC+JsSYz3NadtzVdw/tU5SQr3bQcRH?=
 =?us-ascii?Q?nQjlWKRhvAuvXMXpB8vFSZL6lSxSUGHPlxq4gAxF4V/1Pcy5X8b29noyKHLj?=
 =?us-ascii?Q?3+2KLh3IdMcwsQsyxueD1G6ognOUSF0pdoNy2vHzAHS6K71NeWWhb6wDa5PT?=
 =?us-ascii?Q?j4dF6J5af25/H0GygbNmYf/FSD+4H9oHz/+I8gwNF/pBEn2KxVopHf82k/m7?=
 =?us-ascii?Q?d+IUPb+q7WjhQDwP5m4CyyIWB7mlWbZRuSiGSlhTXAC7UXVax1XPQezX09wI?=
 =?us-ascii?Q?RSI5VWCv8V9EZC2f5GBlLma1kiBnFgkkBAi2v7MKf79aJ9SF2XTW3GROrx7/?=
 =?us-ascii?Q?RKPhIS6H6rzouIQ8W/BMhFG8ErUTzydkgvrl7FT5YTEiZfMxTQo547ToOR0L?=
 =?us-ascii?Q?HULwyiltkzhSamx5DByVZ5HKEgJVxGmMYHoQ3HHj5ftBSVtX7O3AGrFNpK2Z?=
 =?us-ascii?Q?uOh6fu6904fySi7eV8cd7x+YJOK+nXippis36y9zXyFmcVH2ErhqFwKON78X?=
 =?us-ascii?Q?4Jx7CEoNbRbuguE0dQk=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:37:45.6924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cd2e8e-db33-4822-a0b4-08de30c5aa5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_023751_796973_74685C01 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Breno,

> On Mon, Dec 01, 2025 at 10:50:47AM +0800, Baoquan He wrote:
> > On 11/28/25 at 02:01pm, Mark Rutland wrote:
> > > FWIW, I completey agree; your proposal is a much better solution.
> >
> > Yes, maybe Yeoreum or Breno can post a new version to fix it on arm64.
>
> Yeoreum, would you be ok doing the patch? If you are busy, I can do it.

Sorry to late answer. and Thanks for pointing this :)
I'll send quickly spin 2 following your suggsetion.

Thanks!

--
Sincerely,
Yeoreum Yun

