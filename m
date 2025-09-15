Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6376FCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9E+C+lc3L/TJoPVZdrI05WZLsh9SZ+aw/KVObz2JnCg=; b=rQ+pwMRn/S6hpIIdGcUWns1/sL
	QBV0UhUZa4od4oor3fS5q0+XyZsdCKmc9qLHxm/50A7jSVQlHqHXCcanx/ZrFuj2lRmQdQbc9rNWh
	T7b0e5+NTaOvUDGCYzAbbk2gjjUNmYu66Tidi5BPggXrWwTF/VkFvbDiyeRUrqsebBgpQzEfv/r4W
	WCI/aEGuar8ecJXY9dSOMPfIMAO6HqwelhLBj+tTKE8p3tZ3TfmVViP536DpAqW6ds+MpEHruQVUL
	DGiqpOpJMnG/Lo+abxq5RPyg9jhlQwxZDCWf8MO/zMYAue7JtUNcoNflgT3yQCcE+j6MoNtgDo/Or
	hz7wAg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6WZ-00000003fC8-2mrh;
	Mon, 15 Sep 2025 10:33:31 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6WW-00000003f9A-1sHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:30 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E9KDr8xs4Gw/ggigbwuCUeQ5g5hYA9NkaSPcdMwZhYZkAn31MMrsVzlbjeAV29dOPYJ22/Ao3f1TxzljXR8b1KZgWxpPMqqIToY8NsrbnNS2SBPffkL5+dGixMmhKfbPb/HzBfl1x7dP0rnvFVA6FQHJ7kT6Kr9mA7Qmolgc5IIzyZVDxnrXk42IgBKpEM5zWFEj4ag1tUK5Bcf8ewBud7qoRBcPNAWpmauUBxMbAxSFgkKit+EyxqS9slMvTf0oKJ2d0SOgjnv4+CtZgMv+m6fe/nak+55+oeVesaXEIjwt/Xhs2adEjS0KEllPCPqy46N/R/0uP8qer0aD/7uaDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E+C+lc3L/TJoPVZdrI05WZLsh9SZ+aw/KVObz2JnCg=;
 b=wvv+smDrFAXk3CZ6O6np4BT/cNFVWwua9w06mu3nOlL42ttmrlYS5nK2ox2qDM74Xdg7gTbfcYolzFjVZcDdHMIXRQUD5uGNdbfTKqAp+Ty7BiWSR1BJTjOCUoyz3jtEHf/O7QvsOzGCr0rpyCjx0swRP7EEtei4pK1qBWES1rtaq0qYPpvtS5EYm1SROY/63S/G6JkGh3OU147wTspjujVir9pL5jJ2ToktYV+uT4ooLXn0kJz664pSumM7rD7DqDoNgaNW2J+wyCR1dBF4K4jxaQenla/2+JSA74E7AYoiSRsdNWXyh4FjLmcw7Mh7PQatspibh+zLdzjtAobTkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E+C+lc3L/TJoPVZdrI05WZLsh9SZ+aw/KVObz2JnCg=;
 b=bwdwt8U4wW+spN3ZviVYxeq/1Tl0rjcj91onHaRAUBf6x4NUsc3s+4v9Lt51AIp4N7Knt/IeOiQTQAw6YbKgi7rmeBUdwO/Af//Y+dD8hHAOPtjOsj+bKOe2JFGmrXqb4k8sL+RDG18NS/jm+Tme7xeIz7X4Ul0rrZMNUM7ZNus=
Received: from DUZPR01CA0173.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::27) by VI0PR08MB11224.eurprd08.prod.outlook.com
 (2603:10a6:800:251::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 10:33:18 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::37) by DUZPR01CA0173.outlook.office365.com
 (2603:10a6:10:4b3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 10:33:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 15 Sep 2025 10:33:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2GLTNArDsS0UQtwO3KNQs4NBC+iM/CUsZqRkKXy3JUcEWLclwlWrmB73IoAtpKivCsZ3CpIvnZKYt8Vz81xz6DfYkNCdbO9V1T7npEF2+p2iQNJ/i8pA2rX4bOZrW2vTGrpdsXvK+OGi77A8h5CGynrtDuzsYDW38uLAiEUoDC6VY6MUGLJnDeGtNpQ6XpsPWSKbBuKI8pG1jETkMzIzhR54O/+TIClkC/832PPUNXSKvhItjQc8tk0+2YZa+lZA87QgeaUhVgdmoqH8m9LUFZ77pt6OyKOdbtROMp3ElK689TiIvKwBRuYy8qxJ68M1buc+iHQjzMiOauzkaGZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E+C+lc3L/TJoPVZdrI05WZLsh9SZ+aw/KVObz2JnCg=;
 b=eZ1CCTN0Mmtd0bXU+g3kdsPrSSEpkd+YFHTDJlYs7B+aRNkI8wvFpuv2jiWT45H4FU+LoQ9kIMg0RsSZybrj25u9o0mfhetu0rJL/ySCV1AOb7yfmSdTibrCJ7AGKyh4eXEwYocLEUlec3Rj4Vgm0ffDEw1Ga97WmzsdxG8kJBhPLNbtZ7HcIllUtEOnqDkhqTgXbdF8eBE3Q3yAwBr/3rJlWEtrpGdfJ1HO64kd6FX/DutEQU4QKvMmKYqEgB38mFuFwt+oPHRldk4kaiRhZWbEG2HXwJ7WcvGcHAbFO50YEQw7sL++nLp5zm2oAVCSU5kKwl9qVkPa80DuEH/9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E+C+lc3L/TJoPVZdrI05WZLsh9SZ+aw/KVObz2JnCg=;
 b=bwdwt8U4wW+spN3ZviVYxeq/1Tl0rjcj91onHaRAUBf6x4NUsc3s+4v9Lt51AIp4N7Knt/IeOiQTQAw6YbKgi7rmeBUdwO/Af//Y+dD8hHAOPtjOsj+bKOe2JFGmrXqb4k8sL+RDG18NS/jm+Tme7xeIz7X4Ul0rrZMNUM7ZNus=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB8069.eurprd08.prod.outlook.com
 (2603:10a6:20b:588::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 10:32:42 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 10:32:42 +0000
Date: Mon, 15 Sep 2025 11:32:39 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMfrR0vserl/hfZ3@e129823.arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRQIeIdyiWVR8a0@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMRQIeIdyiWVR8a0@arm.com>
X-ClientProxiedBy: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS4PR08MB8069:EE_|DB5PEPF00014B89:EE_|VI0PR08MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: e7182aad-df78-4ead-4283-08ddf44348f1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ILPGdjIGLzaomPV/4+kWagdcGfNuPHp+EydOpqIDs0wHQKMlRy23mElvYZYO?=
 =?us-ascii?Q?upzMPDEfacpO1nriajcCQIbW3w0lHgx2j6nlvOGLQrmQ3YODzRL5b47SGQQm?=
 =?us-ascii?Q?n3wuM7htPg0OB1ZOQrio+YUa1ouyzVCF1BOC6lHXUtU2anKWKtLUFzeEQLRk?=
 =?us-ascii?Q?cICmq6NZbmwCeVTnjB78mFEsBYod4DYOHueaHkhP3A/4v3Uq84jnfQYrvUh+?=
 =?us-ascii?Q?XqCh/W7L4R8QmklQH1s03XC+Ha0N1XFOwo5A4tbHe6VBCpwZwdjmEWcAibT9?=
 =?us-ascii?Q?k5xxpz9/VlgObWDQZX3/At8sKOYt/NRIouoky7kkF9e1l4WnNzsMvTgY5yve?=
 =?us-ascii?Q?6QHVMrl9ZI6ahDo+kGTBrSnBVVnFxMwOt/yYtTQb1RX84Dlj4ir+2so462vE?=
 =?us-ascii?Q?11+MSpP/pQmFWCHKGpFwD4bTS0Zzd52GCH2MA5kvchtQz5h0mv9YcL9wCK0V?=
 =?us-ascii?Q?38UfQwmngU5qrwkEWSo+1unhuRQYLWrXUeI24ygVD87QqJrEqqzVrA7t9oiQ?=
 =?us-ascii?Q?6IUcFjX1YaSxikXoU+k0ShNxfCydLi7wu+d4JQg3yDHChX7aKQQBLbVAXcEF?=
 =?us-ascii?Q?U7xUFw/x7tfsQQPKqt5hxLYb1lpDr/T6h/rYGJv50u72oZuOFEKuYnz+Mynf?=
 =?us-ascii?Q?QAcsUx447wXfyJxKi9EMb1CJ9HPc+itFT1x8TxDEPLq4i0Z3vk9zNFDvzLir?=
 =?us-ascii?Q?x3gs8wSw7LRyn4T+zgfZso5YeFHuvgHRWK8oIQoUusFrzomh/Rvm1517M1gl?=
 =?us-ascii?Q?HOwz/FVyYSUbeSBpbw9O1CzBYCQeQ6tjwZuXfS5+2yA1oP/MVZQV4fZEtayl?=
 =?us-ascii?Q?sO/iUNHbzDEHdUpr8uFIiPjP3WpT6UajAEnOtO8kLxjb9sZhMGWV+BbeTl9o?=
 =?us-ascii?Q?hpm7/Oy8RvK1f01TLNVq3wlDZvQdmeURu2F5UW/HlXeY7xtziWfV5/qnTKd4?=
 =?us-ascii?Q?9mrIxs4nBY8wP9ckpSHjB7lzDTHCdkvSh9F3hUWs6d0fzGmfPRJSAnwFJeGa?=
 =?us-ascii?Q?g/j5Fgu+nWtULZjdME8c4vLZYRU3yp95pP/sOxxMiDfgYSMiLxjbLtrtgBHz?=
 =?us-ascii?Q?IY8+D+vmmerHxp4ntjxLlKwE21eNELl/U3Q4DgdBtkdkQ5vCxU6E304hkQNN?=
 =?us-ascii?Q?wuQq3O/jSWHsnhEKvG0fNvkjdETj/6hNGRrINiFoedFKZH8lPd5Ksv/OKWzL?=
 =?us-ascii?Q?tvn/njX49WoVQi2oyWZT8WoohCTjAB1fxeh/VH/qI6zzrNeGJGl5TYdMFv5h?=
 =?us-ascii?Q?orTBhBa1/racwh6WCr1ogFL9FicY2wE9f3lO+CrlF9DtMvzW2xObpWQo0i4D?=
 =?us-ascii?Q?MPy5C982YLWR4u/kFkxlPojL3EAhd2vdU1Gl6ZcWKu3LBTOiOuuTa/elipJy?=
 =?us-ascii?Q?g3Eg6tIUnHCAD864Nf3TU//uKkWzzxlIuHmI9yoUsyxCK7bGXYRvH9XotRTz?=
 =?us-ascii?Q?Z1LsZC2Khwc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8069
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 977ea922-0bf0-4e51-ba9f-08ddf4433380
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|14060799003|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w6wMzjcKZDxoACUwEtI22nmR5CUWdbD2xOcc377O9tyWbhNS7nOoJUp8+1wv?=
 =?us-ascii?Q?psemBmRKVgFoHvwAgyGfv6vkzLhgQ03eezB/NtTcQ0w2TA9XMEWOcQQTsL6l?=
 =?us-ascii?Q?+rfysIcWkgjAROw7arW/IDcBTj17M3hOKBcxQ+YYRfpe0eYe/morB3kmVaZS?=
 =?us-ascii?Q?VVBwB3yq7XjhnYwnVptGda0i0UGdKyCcXzODzyqQmI6Ru7pGPAXqSpdidii4?=
 =?us-ascii?Q?80At7iBWNucF8mVAVQ+dBiC4PePhjdpHmgGyjbmvvXV7HKR1nREPZu8RXldN?=
 =?us-ascii?Q?/ak3VtdoiDOVE5NKuN2+KkX0EdP+V1ey6955BFggabfeFUccDiImfMGnoroy?=
 =?us-ascii?Q?ZMtYuzyjBHxP9lVuh1iyaA3l7gH2gG4Te2vtx5uxB7ZoOvsqJehjO6J/y/8v?=
 =?us-ascii?Q?E99GDDCtGI+mtWGdKaNIYa2qtpNYhI6GQb6EqAgUput6keon5OWnW3by5+Q2?=
 =?us-ascii?Q?9DCh8UWeN01zZD7aQimbMgRv/mP/gYP6EARwZlsdNm6Drur/az7f/K5L96nS?=
 =?us-ascii?Q?RlxsVTDoZMeXcEVG+20SYNPnyq6Z+f+vYwdFsAvtkSZWeguWMRTx2TSmsWCx?=
 =?us-ascii?Q?QgXKzRn4o4L+yiKy+gPOdYVjESD8AdXA6gl1wZB2bJNkWvRQdTU33IxTUSZf?=
 =?us-ascii?Q?H5dHRxUEoK8fNGMRa3VYVelNWx60Hs+obSnT4UZdXRL7zeb+KszMfxYZonS+?=
 =?us-ascii?Q?AiFloU1V+f3Mu/RVsscyKyp2G/f0y6B4lhHDSxeTR4bbJX5NnPLYocS4Y8DV?=
 =?us-ascii?Q?8Q7HZQ+y9lxG09ewTvq0MyJYmbylnUlQ41TCzvDhmGXzMDII8P1v2uu3hWmD?=
 =?us-ascii?Q?8bdjZIS3xJrVhujhBTKxbfLHSfhhP5/MZkF07E5/T7axxFRCxk0JrMdRhouw?=
 =?us-ascii?Q?NA2Hww2ufNzkop0xZapLyalGAVdBhiSDc6E2hArQ4PUVO9VacsbgAVJWqgsp?=
 =?us-ascii?Q?WxOBisqJ7iPPfP8b1LJx7HJexpnyAb/0H6nlRr/UI6RD2FVzAmtwOE7XuX//?=
 =?us-ascii?Q?qbXA4wRL/EK4u5jnKoMhHDWqhNgyqUkRIux11azjehEMCSY5jUftquuUvFE+?=
 =?us-ascii?Q?2Z4mAzZrub9SwiJsfqN6lu/Tm6EtuoZET080S/4C+FcY6jR1qF+l24+q7/96?=
 =?us-ascii?Q?CpOb+XNJOb9PbtQhHzgf/zGFWxltJK/4sMuEOhXq0x+w9SIn4UAjp1j3v1tg?=
 =?us-ascii?Q?3cqRpFGOs7nK72mlL/8xzYdqzqm1C4deShaMeYFvWKfrfovsVIiwSvHeM9nB?=
 =?us-ascii?Q?K3nPZB7FpV/Q0Lsp1mFaMC9v1hh0ptfPsiMWjWryfsVuwZz38eYl7ltHvG0d?=
 =?us-ascii?Q?Zgd91eLHcAmxnqL5c8TVGOlm73395R3oj6vRqr+C6++JXfKHwQ+dHil+oypC?=
 =?us-ascii?Q?Q+LUcY+V1IBPq2Mrki/soFdOvqMVQ+QQiABTyZuqLSwaI0O13BaB32s2C9SC?=
 =?us-ascii?Q?rDdBDKj/dn5NsDpx1EKfAFEXemwds8Y51Yrubr+rvI0k43/OYQNyA6uEN7iG?=
 =?us-ascii?Q?RFNtR+mdSFsxNsr9FrVJXJ5PEE+BZYCTC/zh?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(14060799003)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:33:17.9195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7182aad-df78-4ead-4283-08ddf44348f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033328_583417_ED039E0D 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Catalin,

> On Sat, Aug 16, 2025 at 04:19:27PM +0100, Yeoreum Yun wrote:
> > diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> > index bc06691d2062..ab7003cb4724 100644
> > --- a/arch/arm64/include/asm/futex.h
> > +++ b/arch/arm64/include/asm/futex.h
> > @@ -7,17 +7,21 @@
> >
> >  #include <linux/futex.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/stringify.h>
> >
> >  #include <asm/errno.h>
> >
> > -#define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> > +#define LLSC_MAX_LOOPS	128 /* What's the largest number you can think of? */
>
> I just noticed - you might as well leave the name as is here, especially
> if in patch 6 you align down address and use CAS on a 64-bit value as
> per Will's comment (and it's no longer LLSC). I think renaming this is
> unnecessary.

Okay. I'll restore to use origin name.
But I think LSUI wouldn't be used with CAS according to patch 6's
comments from you and additionally i think
chaning the CAS would make a failure because of
change of unrelated field. i.e)

struct user_structure{
  uint32 futex;
  uint32 some_value;
};

In this case, the change of some_value from user side could make a
failure of futex atomic operation.

So I think it would be better to keep the current LLSC implementation
in LSUI.

Thanks.

--
Sincerely,
Yeoreum Yun

