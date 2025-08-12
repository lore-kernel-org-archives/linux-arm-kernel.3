Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D31CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoLtpwa+7GE+LiX+6NMBtTDfC9KKIpYmEBEafsed1yc=; b=VkcsyLlJYAEofmOaz42FIjqA7B
	5o0A4OQWB8PoyUtLAM1iuG2x+lXBdjcAR5+fCzUIUcZ3KoJ3F2lmRtgO3Y0DMECxlk839921azOU4
	YnQX8rraGd8/PyQrBa84Nsu5YoQJhPYGfoRxHU8hsf4UNQ+Bu4NJIgFJJRRiGUKoFXjkp5zLPwJ/b
	r/G/JKCwrE2LRguyr0wKcy+TSwMC4Jovlj36vRBkUPSncXvDtqrgGy5QQzfFCQF1jLW0Cicos8e1c
	LUxruiYU67sp3+r6zE9UhzxvnllKtmqk158RL0naS269xY4IRWGcQDLpz3YKclgZttx4HgDKzGSGa
	/KeweFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriO-0000000BIFR-3WCJ;
	Tue, 12 Aug 2025 16:19:08 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmGh-0000000AVq4-2mCu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:30:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BfJC7xh+Il3vtRip/q1Vl+5s1XW4EV1bamJ4YYUtxIbbfmKKBg6nJw6FfAQvKS5WwDWsxTLjtEMtPAt99c52Yu4hNG+Tfbu6Ij1y5JRTijJpzmBAMs9juxmxiz/mjl7yKlFRDrh/HoqgSjmSgLCNqzxNGbkOrqzIuBagYxeHFqEUAcD0bbpUyqiWleqcw6DKk8IjDpiTYPPaJHicTmYQvuO+sz/4p7iehxJVrQRGjDvbQocXw1yfsPB1+p6uM+X27upavOHdKNAt/azS5CxXRNVYktJA4yYigi36myI2mkgj+XZkF/kOkvAxu9EkyyR0zmhp72UShZesGw6NXIVLGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoLtpwa+7GE+LiX+6NMBtTDfC9KKIpYmEBEafsed1yc=;
 b=YKFd3p6ud3pKtcKxIsrTlGJ/gzXDNjbox4K7pXnWf1Pqx+T0NjceiUs/Nh6dTNa6pDcbyIwrCj2DOHsRBUMzEIhZoq6TflTb/f6FgjwiF2lUqooiKPyPEA13RFLImFjhEmX5IOjpelH2QlfovKdjzW2131JSQXbrMLXMiCWB9098kfC0SJOPisfnY2jS7OMEVc6WBuf2Yw7Xgcp4Vt7xsxvlAYKY1yYBu3bYytHgl/8OSEG9Bp9zSmIgILoRAw62xN7Z9Jkz3Ju5SQgHVDXuIJ1OsS14SM5U3DlRabwaXbDRPwAuw7UNCyDf+UGhIe5a9wpHDI4A8s/Wz1kF1XZ+sA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoLtpwa+7GE+LiX+6NMBtTDfC9KKIpYmEBEafsed1yc=;
 b=kzzkBxd/bGIB+yyo6hdvZUy40JJLh66ZXn//Hi0T403kLpJjxJZP3FR6jUX1wrieQLfu8tkCyP8OmkJcqSNxfPz+zExH+aEE1d2Et8l7BHsR1WxKbWpfubFpk/EpyZEDQUOsBKSsfYQ9qwTgiSiM/6bygDlZ0VWjBoTpaJHM2Xk=
Received: from DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) by VI1PR08MB5390.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 10:30:02 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::f9) by DUZPR01CA0314.outlook.office365.com
 (2603:10a6:10:4ba::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.13 via Frontend Transport; Tue,
 12 Aug 2025 10:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Tue, 12 Aug 2025 10:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBCdFVlRLyFmBFOLCYMj8XK3YozuKu0sMLCJwlPUhk08D4EUqrSjSccorxI0CKe5oHHz5P+2wx41KZ3h6Hv5bQX2wl7r0Y/DdWeQH6ExmeYTPkqwzL8VzMDJoRtCkRv/l+9s0BnEDT3696ADDy6q1xEuOELrlvFQCBfKpRFBCNxSW5mfmPegXTSBOIBd+Et0fmoGiF+1V8WQ0Jfv3gb0hw/D7CJE6JVkiTZbE4WCzNPL4hWngaycvKhM1FQAJBt9H0mGkhqMWvl6wT8wScc2sGBxxB2BKi1ZAHErcYzKUOlxaCOAe8kbW58ZDiuAuAYAzbVi9RXLVur2K0ktP4MiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoLtpwa+7GE+LiX+6NMBtTDfC9KKIpYmEBEafsed1yc=;
 b=OC4KMwN7dsCuR/Z4SIjRVKQPWr/IUwLe4NUURiSHPSmOeMpgRNsaQlPgJ06ty01E8f3cxbLbyvCs950c+qUGKe+xqWHpw1qZ+0W9uLm6tQS5NIG1bdZH+oEww90dhhu/vLK2V5XY+lyaW0B0X5TQe4MNcVgvuagfPy1AkP42YGdFRiYmwOR/alQIXLvIRn9UC9d316TP4OIbgC5yIhgqiF64jRpyCo6QVvU3JQ78wHykh3bNQ6wmcu4Iarb/JSyV4OipKGatsdWl1dbD+lZL1RYsHtlFKsa13HSz2dvlFeAGa1GmUm5M9R7GAJxu/Kiw3tf1UAyNzqzg0+HBR6ZAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoLtpwa+7GE+LiX+6NMBtTDfC9KKIpYmEBEafsed1yc=;
 b=kzzkBxd/bGIB+yyo6hdvZUy40JJLh66ZXn//Hi0T403kLpJjxJZP3FR6jUX1wrieQLfu8tkCyP8OmkJcqSNxfPz+zExH+aEE1d2Et8l7BHsR1WxKbWpfubFpk/EpyZEDQUOsBKSsfYQ9qwTgiSiM/6bygDlZ0VWjBoTpaJHM2Xk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS2PR08MB8880.eurprd08.prod.outlook.com
 (2603:10a6:20b:5f7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 12 Aug
 2025 10:29:29 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 10:29:29 +0000
Date: Tue, 12 Aug 2025 11:29:26 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ry111@xry111.site, Dave.Martin@arm.com, ahmed.genidi@arm.com,
	kevin.brodsky@arm.com, scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 6/6] KVM: arm64: initialise SCTLR2_EL1 at
 __kvm_host_psci_cpu_entry()
Message-ID: <aJsXhhe2iRrtfkTQ@e129823.arm.com>
References: <20250811163340.1561893-1-yeoreum.yun@arm.com>
 <20250811163340.1561893-7-yeoreum.yun@arm.com>
 <86qzxh927n.wl-maz@kernel.org>
 <aJpHxLgmy5A/YD7V@e129823.arm.com>
 <86o6sk97mr.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86o6sk97mr.wl-maz@kernel.org>
X-ClientProxiedBy: LO2P265CA0352.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::28) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS2PR08MB8880:EE_|DU6PEPF0000B620:EE_|VI1PR08MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cb34d1-1609-4d2e-c67f-08ddd98b31e6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ncpiGdiZjeuFiXoAh1THshBUi35yn6gpxzHoGW8nQ+lcm5CCaqp8Bof3BPEG?=
 =?us-ascii?Q?jR7zK0og6ujBQUcfJhE8M6GuqOu0eCWPyZBSRHGkaYC8unPQIFwXyo9vh3YS?=
 =?us-ascii?Q?LN6g9qBl/xh+tG4X5sYZdRLXM7X7PXXMquAxEFicVtYgNClKQlLVghQntLDg?=
 =?us-ascii?Q?PkWmkiVFVfGXtYfPd+FsAxBEJpOEqX/ztvMh6jsuSDKWCKZsODvWj0p+XYEF?=
 =?us-ascii?Q?xYMUBYtYqNsyjzeU9smZDoNAv19FhquW8Vo2Ty4IMvBvzCvkoOpjBmDnQUHH?=
 =?us-ascii?Q?cXSIAUqXVUYcFWeBLvlTaTgl/w2GErKDvVwzpLm2UKiX0dxF8whIzKOlZzZB?=
 =?us-ascii?Q?rZknrB1mv0WcR7QAgR4yUJxUsVgltxXR7zdk6OSthXyOKwPlU2uCsqDY5jg0?=
 =?us-ascii?Q?cIUHaRskDY/0mk3Pr6nsZUzHMdT/k2VvRXvo7hPvI5nf+NvkGCDJRGwmSC1t?=
 =?us-ascii?Q?8UqGMYEUHp5r/ddzSWa1Hf/GZybvXau5dW3FTofTVz/B1RKfg1bRZcapdcu0?=
 =?us-ascii?Q?kEFDX31Z60/q8705diACocSXLr41BCjNtoskWbrp/4hkm86mneaWYC84NJR5?=
 =?us-ascii?Q?qn0bcLBAvCmOv2lRd4ViG4jE8dI0+OIcCLW1ka/UfSXVxP5lnTh2SiDHOJ73?=
 =?us-ascii?Q?s2VbqEcH3FK0Z1zD30fMC4ZiXylUTtnThEicM5ugoxIPEyxE8IJkSDLXODIi?=
 =?us-ascii?Q?7aMeHKnt4jYPFRzeDtcK6744vBhonB1CV9oZsshgiTBbIvq0MwoZlfsll5f6?=
 =?us-ascii?Q?NZ4F7DWx/xKNxWhg0Pvgiwai4afxDW2Uh/ICVf5XystpUJ7Cse3mtDMLKJod?=
 =?us-ascii?Q?aQC/wZs0SOeTZ8ydR1n6cQ4KMxmdN5JtpSRXq64l0mFw+HrYyCJB+KQ3Nh2z?=
 =?us-ascii?Q?UFMi7AEHHT/pUIxZ8VjgVbtjyiqfvBmVXvFqFuQ89uMhXMKv4JL+h/GGqWkx?=
 =?us-ascii?Q?XWjRNgWlVu3atzTAQi0L92vwFKzNY66lLtWxEKCfZGzQ/Jj8UobIQnd/vJLF?=
 =?us-ascii?Q?BtiDiO9nZUO1vQGviJqVN8/webeKqK4xiEOfghy50+Uqof9EMpHUbHD40p80?=
 =?us-ascii?Q?rUlAfQ0A1SZsEe/zFe84uYRxaS5m/mDB6UfpINc68uEF1L2gXM/+yOCyG/gS?=
 =?us-ascii?Q?txcaMTjS2+tDHTnNkWhZqX0cpnzfj6dszEuQcrnapLor47dHQ4bZf1PvFgcr?=
 =?us-ascii?Q?dtkYazOLbmNjNlV6sWLCStImG/qxxrjgUUqHg6DjhA85IFJkV9ANv+FG8nDj?=
 =?us-ascii?Q?TfcBSMYVPws0UOW+SbLww70JGVJLeOCmHUieUawzfLsMQ51OF9LFaTeo+JsM?=
 =?us-ascii?Q?kJaiKl6opKQ7nYl98qtxrCf8Yqu3h5k4xj5NdBFp4rhyJ+ss0ViYRsLY407j?=
 =?us-ascii?Q?OE0MVVbHWFrCX0ZqjunNmNTTxA/bsNdyxKbTBHX/esuizsgRuFucWtCuqqtK?=
 =?us-ascii?Q?rdRLDhXHHOo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8880
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b54f62a1-dbff-4255-9765-08ddd98b1eb6
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|14060799003|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v5PRpADNs8/2SXQAiLReRFQUlQv4JTVimuCT/cLmjCBvHZXE/+wjWRvdT0yo?=
 =?us-ascii?Q?ycjvGksCOshj5X3z+Vku2bFruvAVzuST6h5aynE40haW2LGx0KJJYDv4Hqid?=
 =?us-ascii?Q?ceoh+aD/yMnAktMvS40F27MEZFkwOKhme156TY/2jeyQRiOB9ZCMOpHY/40w?=
 =?us-ascii?Q?lOM2OjBrdzPlfp8sTbc0RponA9KirhAbQc5ap8qJUFhAzpwiJDY2NYZPA7yb?=
 =?us-ascii?Q?vd8JrxRiRkwRwPW9lVC0XpHup2TQSTwqDZWChobjWCWzLVmBGDiFQiBU15zp?=
 =?us-ascii?Q?BbgDUNOAlQ+zMMNKse1OsZKNVZ8mTS5fKOfRTxlibabmwYPa1lCv94dTFGOw?=
 =?us-ascii?Q?/5Qd5sagwmYlxKJ5dTv+/+i9vVLzp1YqFXOTMzujuHAB23MmmZdfCk/lkINv?=
 =?us-ascii?Q?92HWJ6fdkNZ21qVWptVv0FMNfLpWxDoK31i9aIV3w37kxZUhSyeSfXEzHAcL?=
 =?us-ascii?Q?wK99Rgn72Jo/8TLdF59MtS3ikS569NSuWUbHnZIVnkVi1dLOeOx+j9ETXMp2?=
 =?us-ascii?Q?lG0AnwPTvRgDEVODyJ9JJc/FM8cqe+n1mLlbBT9pZM3zl7D7FlZRK3PlzIRW?=
 =?us-ascii?Q?IM4UkxdKGkQx8bBVjkq3NghFKYFAG/qpT7h1/N/LoDbx8LvPFBuzwLVY/re+?=
 =?us-ascii?Q?3moUhezzP99/JRKo1nTPVS8ymGO8CJ5O1P+r8dzKxS9t/iKyxDHW8S6wLocA?=
 =?us-ascii?Q?XaXoiJO+SN1pw63iLX1VJSXAmcxBoQpZyohhKVxh0Kq3sEHGlrfXNSdmLPat?=
 =?us-ascii?Q?G3wEb7iNdbjKaSpgWpOWvB++1lbfJbffzYhfrKHJFDXclcRBtHkDlV4jLJKo?=
 =?us-ascii?Q?W+HJlM7c8UOrzo96pyqx0mMeoo6a0U/dV89hb/5fDlPAu6/hALsqb+WvdkIf?=
 =?us-ascii?Q?qXGP8NzyIAQlI+6oItrYC/5zD6q8YVCEHN0eP4ncpa8IBZWAategSr7MEcgO?=
 =?us-ascii?Q?shfgaMUc/MejDDU86kMK4CixuDB/D67JiNZFiXBS4Q7BA272kI19tqyXfWKt?=
 =?us-ascii?Q?8AFzVnVTu9c+f982sUIz5C0bCuAuLMHxpe32LaBFg3qbgWVgxDvFrmEJSGhz?=
 =?us-ascii?Q?0pIeU22GTsx7kcmSw4juxDkgobFPlpm4WTRUGOXB+qoyJhAmgwWBlEHrqOIo?=
 =?us-ascii?Q?XIet4DSuaKsbZ++jb+nfzysyT6a+1FVZbnmiQMfsIXIYDBigHU0RrNkrZsac?=
 =?us-ascii?Q?UDfEnp+2mIrVfG0lCXPiwWK7o3uHZOp6x3HUfsO0kSJHXxf8fBabD5FX61iV?=
 =?us-ascii?Q?z8Hr2+gmyBGYIDNt8kqPx8bcITOsB//LqO1MiVHRc9l1IrBEX2BZ6CtLu0Pk?=
 =?us-ascii?Q?p3ly3vzpsmYtSm0rAUsLFSW3tZnur5wnt1DErGpkqvsPa64z7xk8RBxvODgK?=
 =?us-ascii?Q?NVQGO989qGPwezInVXSw3gC5vWHJ7lKTAW1QiJwq9YPe0fKO+sliwH7axUxQ?=
 =?us-ascii?Q?4PLiCiQolBs0k1UpcexaZBGWQ0k+UsgEaky0VtJzRulbviQjRaV3NNYAeggM?=
 =?us-ascii?Q?L9kwhap50M0PVLT36FC2Y3IzKKg6QFEcMQ8B?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 10:30:01.6403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cb34d1-1609-4d2e-c67f-08ddd98b31e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_033011_854910_C71840E9 
X-CRM114-Status: GOOD (  12.94  )
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

Hi Marc,

[...]
> > > > @@ -219,6 +220,8 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
> > > >  		release_boot_args(boot_args);
> > > >
> > > >  	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
> > > > +	if (alternative_has_cap_unlikely(ARM64_HAS_SCTLR2))
> > > > +		write_sysreg_el1(INIT_SCTLR2_EL1, SYS_SCTLR2);
> > > >  	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
> > > >
> > > >  	__host_enter(host_ctxt);
> > >
> > > This needs to be folded into patch #1.
> > >
> > > Otherwise, there is a window of patches where the kernel will not
> > > survive CPU hotplug when booted in protected mode.
> >
> > Do you mean fold this patch into patch #2 where initialise
> > SCTLR2_ELx?
>
> Yes, sorry, I got it mixed with HCRX_EL2. Patch #2 is where it should
> land indeed.
>
> 	M.

Thanks for confirmation :D.
I'll fold it into patch #2 in next series.

--
Sincerely,
Yeoreum Yun

