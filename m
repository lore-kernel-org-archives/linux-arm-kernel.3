Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B85E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UwpPAFj2nynQYsSn9iOw06xQFqiq92YoLtaFHkezBQ=; b=ytRFt3WScg7h/PBFTTj7Iwm1hh
	fIKV6cKl06d610iyK4FZFBQNv1hMloz0ZcU6YrrBiJVpqDL+tFJrUxOSmPq+BCP/d12TYpeFzGUe9
	vdz3dM8A+cyzcM+rkJkW9FrAf6k3RyC+afCstbBmaDyPqek84s8m+esHl5r4ZZK5QFwzb3J1USg6L
	tvImoHaJ2E07YZBdq39VFRnFEsDhyI9N0bAv7zV4eIgGq8+HRfjq/zIwZe/pYLP77TrjDnPjP9SmE
	vxe2/seXYM2pHxRniFB/Dfip+g6VIMOFt8n448Q07uwWmKpHLYSsdjNnZQ9hYLfk3DuwRG/pDD5jP
	GppgjJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4eU-0000000C1Ie-2SBd;
	Tue, 24 Dec 2024 13:08:46 +0000
Received: from mail-vi1eur05on20617.outbound.protection.outlook.com ([2a01:111:f403:2613::617] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4dH-0000000C10d-1oSB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 13:07:33 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OClOmEIICAnLjfgHjYhB9Ori/mjbEStjpI9pK5KTWzXcO/kK37txJDnlRlnLjR2N3wRM7JfJHEhYSICRZNQdlKmbuQKFrRbG7WzZd0LBbToqJKKfEa6BQdsDmq3yWW9A1ChuJ+csXzbaLW8eNFXcEyvzf8AAZPysnlBHyyXgISzEbepYmsswLuyZrQ5Pw1yBt0SNmDEc4P92Y1mWRBr5t7+0e2lwBqIlm0HPhRq1D9QBXoMJtRRxKEfiubhg+i2lG1cLhqW7wR3A1ydkun0YyhucHri1xvmRE8AM6BuerPCNpJZOsCfkfSgLwloOS/oDBd+1R5PlSAZ8+Mpid6RCgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UwpPAFj2nynQYsSn9iOw06xQFqiq92YoLtaFHkezBQ=;
 b=R5OkScRL4gN9p2rKAK5i4ELaD/2mRFyzqnoLEmJW+ukGX2+WzSmachPiS5D56mRtCyZtW9IZXJro//Ptl0qIQUvlCsROzOHOEQoW9/RbH5lvkKyyUj2Ehg7j6WKBFUKamn75gvPTR1E+aoD1Y6CUlbnVYNOGb/+VslrGlS25qyItg4skhYSHFsjX8ng9HsZjMq6t93fMFNp53+Oqy3pyXT5K2Q0jWWMI855GzJbNm26MufyLZNYKpw4/CLGh9Pda2XP2jcp8DYqMGrv6h1n7V4B/OCN/lOwNvRBHWPjGlsdsnhx6CMbBErBt7mdM7y5b+Db+6ZqYhRXnwLP1t1Vctw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UwpPAFj2nynQYsSn9iOw06xQFqiq92YoLtaFHkezBQ=;
 b=D+WprKXHg3P4I1b+6gCTpM7CRzt9YnbKOLMJB8dOyjlxtJw+2Nsxgpf7WegQDKnYGfh+y9Sofe19NZDIDqfMfxq4BJK9W3w5T7uNw21RLDOKyU3mC2g4z+wFbsv/iuV43RH2N/ezLckn2bz+Acv7iw43IIlEL5nGYgWG0cPvKBE=
Received: from AS4P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::15)
 by DB5PR08MB10256.eurprd08.prod.outlook.com (2603:10a6:10:4aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 13:07:19 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::4d) by AS4P191CA0025.outlook.office365.com
 (2603:10a6:20b:5d9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.21 via Frontend Transport; Tue,
 24 Dec 2024 13:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.12
 via Frontend Transport; Tue, 24 Dec 2024 13:07:19 +0000
Received: ("Tessian outbound 7762b28e8285:v528"); Tue, 24 Dec 2024 13:07:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 444f25eff68942a8
X-TessianGatewayMetadata: wf0n/nMiGkV2aX3UZ8yLHPd/FSymWuklM0We0cICwRprFtR3AvqxHOmX4XpZilLEBFYSSb9n4EUrTlezgYewjmpXSclV7rfESyIXgal066NSnRCuh8WI4S3QZ8kGvxWmn8ej1c6MK7/8cfWC0dtQgQ==
X-CR-MTA-TID: 64aa7808
Received: from Lef9af36d66f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D254245B-333C-478A-885F-7E5A433D12AE.1;
	Tue, 24 Dec 2024 13:07:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lef9af36d66f7.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 24 Dec 2024 13:07:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJFaF6a/ALr9/XNIiLpSfzra/qDMtl9zNeXJtjq7MCGhtzqleXDYMlryEBtwEdmkDYgwHkduhs7kHMbDhoJKvI2yP91ZSARusjH1rlTIhhOfsjBa+RDtddzksIIkfBquzW2Rf3mtQniKR1kmSIfvuVVJ96ZQ9lTvxXvjUdHmOttU6X3o1QLK1MmczsUy46hA/MnSTUHCXtgBmKyU8vYDAAtknKwREZMM5lTyPUlx8qK1dUr5ZGKd8HDE/DZUEgE8C6IK1/GHUDKwI9LmGdWTe0jBX9Xgg0fQ8eTsOXg7AhEGOmHPnaT1R4I1sTK9ybBL67A296NGOQ39b2SEHSgWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UwpPAFj2nynQYsSn9iOw06xQFqiq92YoLtaFHkezBQ=;
 b=V5AG9bfDlxZQq3Y/iDASnuP60+f/Db0hQlBCzL8T+it27oIDCAXWWLCG2Mb8lC2d1smQGxTXc1HTxMu/KIho6Wg/oTRjWjTWi+xFQbMW0DJmBdyOXNO81+L6gX/YKVmfLAzhnOHZr2J4Xf3VoOFIrQBSNpkJvg0WgCYvKJNrp3CFTyNZ7WXKecc5OpQ1SxIQYzNGn0B0pYcHHXV8W+GMO3lUOQya2rOxQSTxkS/KrXH64JZlQSid/qSdV2clhBrawqqr0qwHhBBL/gv1C/7NAQyurctLYCS333yuiLvjnpjgDgKYwYLRtNEEJXqtTmRX+1+MA56NgFdy7pxZiklXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UwpPAFj2nynQYsSn9iOw06xQFqiq92YoLtaFHkezBQ=;
 b=D+WprKXHg3P4I1b+6gCTpM7CRzt9YnbKOLMJB8dOyjlxtJw+2Nsxgpf7WegQDKnYGfh+y9Sofe19NZDIDqfMfxq4BJK9W3w5T7uNw21RLDOKyU3mC2g4z+wFbsv/iuV43RH2N/ezLckn2bz+Acv7iw43IIlEL5nGYgWG0cPvKBE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB10584.eurprd08.prod.outlook.com
 (2603:10a6:800:1b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 13:07:03 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 13:07:03 +0000
Date: Tue, 24 Dec 2024 13:07:00 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
Message-ID: <Z2qx9B2v7WC79HyX@e129823.arm.com>
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
 <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
 <Z2qJMGPD8x2npFaX@e129823.arm.com>
 <79e11033-181a-418a-a56f-068b9ca62f56@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e11033-181a-418a-a56f-068b9ca62f56@linaro.org>
X-ClientProxiedBy: LO2P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::14) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|VI0PR08MB10584:EE_|AMS0EPF000001A1:EE_|DB5PR08MB10256:EE_
X-MS-Office365-Filtering-Correlation-Id: 9377a6fd-295c-434a-0ed0-08dd241be5a7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Newf/sOcFj8J5hazWCYfwCS1K9kb0VgWIT3HfdrQDWl8q3zSED/+ho5/W0V+?=
 =?us-ascii?Q?3aeeApyRd81kMnyOaOGfVpwxbY0Q8Rs71MIBphS9voEak6k7g2g//xAL3rAl?=
 =?us-ascii?Q?TeLA2GN/vLB08GU3LsUB1tAel8kaoeGrMzplk0slkTxUfidAJPYsBgJVRr25?=
 =?us-ascii?Q?cfZBou+jqz+KjSF8X2zQ662EbcDz4Dxoa1g2XVu4UlTkbURSIqKFRUUseH+c?=
 =?us-ascii?Q?zefdzb2HpNfIa9IafnMXmJwdYvNTpGu0CHD439rXIu7i+lQGlEOwse22esjh?=
 =?us-ascii?Q?4WPUg8bdOFHYUoK6UarsCVdOFO9UV18Rp4V6keHr9njwKPzafBH/hE9ZFIMG?=
 =?us-ascii?Q?LGWQnShIGmnATyK+LRS/bHmddymdu9rq244Eo+QfB7i6hen+T9UEX5L8nmCK?=
 =?us-ascii?Q?kkAA/B4ujdWBie8o1BEgruGTSkEF43vDAklWzc/Y+T53Fy5B7IjoYN5jcnk9?=
 =?us-ascii?Q?U1NI0FfeJPwwVloXILvMl/vKstCYuVn8EGTbQGrddDfc0NrUGSloZ9m7Tbxq?=
 =?us-ascii?Q?sXrteoeB2NXHmklOyokWomhDPpzgRLKuz/k7Gv505VUSauEgjSK8FtjAZ+FJ?=
 =?us-ascii?Q?Qu0bjN6Fs9kPQ0B+QH7ctiIFD2mYoucbY/NG07PcWgbyUxkjOdhUtNwKDz9F?=
 =?us-ascii?Q?Y7qs1IPx4RlXlvulROAHPq/YntKcR4IvPjPUEUOtyuIdfRFkTRa+dsZNhflm?=
 =?us-ascii?Q?eS2R9Mm69n1WxmoVl37s0IHgo2z03Fc2nnaC6oPeUd48MsHcnsB+zSLSnrXg?=
 =?us-ascii?Q?puxBnvPsPzy599rJYu1N+4LPqIIT9Qj+XQF2L/AGz8Qw+XqTEha8M/cMxsWS?=
 =?us-ascii?Q?4bvecWcUIy4CKBGcg6BtQPpisJqsBhhFNMMFnsA8Bm3YioMPgWWGnoEN5vrA?=
 =?us-ascii?Q?2RwSZgizsWZPLuLtJcK2grRTtaJBaZXXh/STC6Ll/2Wa+SZ4FnuNmVKLmrBh?=
 =?us-ascii?Q?eYLgw1STsJuykPQh6pX5Je+UtcE1TQ9djIeyu5sohkujgIJAwRM7rm0C+Wa7?=
 =?us-ascii?Q?DOL4CjvWDMhWxy5hzNCKN1o+qDOtLXKqnHD0K+ME8eSo6Enn5w+H/4ttcwh7?=
 =?us-ascii?Q?Utusb20VnEskKPRqw5nltXotHP4BuaQYBWXlwivCsFGUUd90dTtzbYR0bz1t?=
 =?us-ascii?Q?TwIQIMFLqpdtlyfhNi7lzuddSQfcBZX4KIsmGniRdOOv8xyhacUUoMjoykBk?=
 =?us-ascii?Q?+nPOgNOXtQxh84Xg4iRS1XbHEmDSbJC3X8KU6JYUg0D0g1rVp2wnEP4IhfOP?=
 =?us-ascii?Q?d5h6UFntil+dyAXK8HJ8+GtX+k3VwhL19xtmOtG01o6PygtbMis2KCbExA2U?=
 =?us-ascii?Q?vGIyff8dvbtOVvple0I/RLudgrbtiDwn4MdnqyrFiRJsRh+ESc6cv3GDNkgt?=
 =?us-ascii?Q?QfZe9vi9xV2oHwsmNl9qy7FAEIB/?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10584
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a020bdfc-a2e2-4612-13bc-08dd241bdc04
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UVsABKkBue3EO0ocDaoNdX6IErmgaTPFt3U+dDgTjCve3UEwRqBDGEckYpyr?=
 =?us-ascii?Q?edSd4jlUcRC3W4eoIUx7B+4HcG6ZsiHGsbpdV8TE88NXDfhJZrmsDlFTExNt?=
 =?us-ascii?Q?O85YoNiYOArNZttlquJYMqiMyRbW/vUcMUpyhfyXJh5tguElw0jngdUe9RSH?=
 =?us-ascii?Q?aaLG27Xt8Cghgn/YutHdvFlVclqcJ38c1szG3V2LqEteAmi54OQ28TO4hcMe?=
 =?us-ascii?Q?cKBbRB+6Rxjtc3dDvVl7LjZyiwiew0mxEVYrHytrU5+VshKKeBNq6tnqhuSy?=
 =?us-ascii?Q?YmF9pP3bAiclsOMNQtkccov7KiCdRz3kRLZVDHxChzeFBGMbPReL8TWVAJsX?=
 =?us-ascii?Q?2K9gAnA0OYaVwDiRNvKtmRvyxOooq/ERo5iqTTSYimDwNahfBjqlXq+TBLL+?=
 =?us-ascii?Q?DyB4OIRtabtBbOmfucQ+ICkSrfG93QVFroK26+0BHQkNLOr7tTtDrSyo8Q5l?=
 =?us-ascii?Q?PwCWzpeFnI6WL8ErztLA+CEJb4U8JP415irb9c1pgEA7EN7oI+ijdlfFEIJX?=
 =?us-ascii?Q?B4QU9noBT7+5gWRCvafp9szNnP23039Cuph3Uui9fI6Pw0J7UtsEr3nyZM2x?=
 =?us-ascii?Q?UoDz0nWh/K+oNaAcgAtnzD7m8EQ+wD9Az6DbeP7ezXIsQn2gCiiw1vUXXc+r?=
 =?us-ascii?Q?8GZssZS/Qd8ZN7oE6CR21ebo7kw7x1gpDn36T3ataamxT9LNyc81rq+usD2u?=
 =?us-ascii?Q?qQ+VJ47abhOb9mDwxrp9i7TNJ1MQCGAjMxNiMtRHhreJlIxPl3jIkvuvamf0?=
 =?us-ascii?Q?rXwaTIAW5sbPR3z9ga6c7c8FfAjOAwvrDLAYkuYZecfmISgRnRyB6KynVMHS?=
 =?us-ascii?Q?wvYk1T1nPyAUQ1GUZnGfR5iBddcQsi25xNnuJQE0JS/oGp2j3SYMOdj6afvz?=
 =?us-ascii?Q?3vgDUXHTzscAEYDHdY5e2eyDuDnZPRtfoMbzDEcWcFquW3nIoXJ633Wc5KJS?=
 =?us-ascii?Q?uAN68N3I/C6GJ8cYlULPUbCCEVc/9tQztYowv6F924pL1YG/toU3MkZSawd+?=
 =?us-ascii?Q?KDsD8cxX3fzvhAD5PBDwEs/zpTYv/oYcV4FnnjIXhH+vmonC2LGfMgSCDCxT?=
 =?us-ascii?Q?TSh+wl8ctaDUJ64kXJky/f/rR3PiDpSaQsgh8dfJicLcWM1i+YA+QhEEVr+6?=
 =?us-ascii?Q?Umec9X4K/8zZk4blOtcC5MaDGBMBOb1ZE9FsMz9Da+nWcAPPxBClC4IJOZt5?=
 =?us-ascii?Q?/MBITzngwZBAH7BLzaPwBk0YAgKC8G0XxoCiGDBSlIr5BJoNDf5r02J7bta6?=
 =?us-ascii?Q?YUV8/q2VBioYaqHPRDR8KxbbtXESXRFI4aQTuKBeq97SQaaGi+Mw9jt3vaLo?=
 =?us-ascii?Q?4ko1CTLpk/OhqNl3WOJCSnl+t8uQSqsp1i4KwxvHUBYG+ceTZN2uS+hvDO/t?=
 =?us-ascii?Q?LNnATbc5BOZLVMqX9rAbUYAk0QOGBUBS+J3vD+kX2ucc3LtyqRXRcGKFtKkS?=
 =?us-ascii?Q?mjs3SP0pJ7EJ5nKo0O+/qvXtVxcEzSGAKa3vO9IN0bo/BwaGM9WDOc5UaBTs?=
 =?us-ascii?Q?+akrKVsbUaWeA8Q=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 13:07:19.1657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9377a6fd-295c-434a-0ed0-08dd241be5a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_050731_701633_06E1CDC6 
X-CRM114-Status: GOOD (  23.62  )
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

Hi James,

> > Hi James.
> > > > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > > index a70c1454b410..dfa7dcbaf25d 100644
> > > > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > > @@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
> > > >    			cscfg_mgr->sysfs_active_config = cfg_hash;
> > > >    	} else {
> > > >    		/* disable if matching current value */
> > > > -		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
> > > > +		if (cscfg_mgr->sysfs_active_config == cfg_hash &&
> > > > +		    !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
> > > >    			_cscfg_deactivate_config(cfg_hash);
> > >
> > > So is sys_enable_cnt a global value? If a fix is needed doesn't it need to
> > > be a per-config refcount?
> > >
> > > Say you have two active configs, sys_enable_cnt is now 2, how do you disable
> > > one without it always skipping here when the other config is enabled?
> >
> > Sorry to miss this one!.
> > Because when one configuration is enabled,
> > cscfg_mgr->sysfs_active_config becomes !NULL, so it wouldn't happen
> > there is no two activate configurations. so sys_enable_cnt wouldn't be
> > 2.
> >
> >
> >
>
> Maybe "sys_enabled" is a better name then. Count implies that it can be more
> than one. And the doc could be updated to say it's only ever 0 or 1.

I think I'm not fully explained. sys_enable_cnt could be more than 2
if it runs with perf and sysfs both.
Because, perf uses cscfg_active_config() to activate configuration.
but, "sysfs" only can activate 1 configuration because it enables with
cscfg_config_sysfs_activate(). so the sys_enable_cnt could be more than
However, sys_enable_cnt can be increased only 1 by sysfs interface.

Maybe It could be hinder to disable by enabled activated by the sysfs.
However, That's wouldn't be critical.

>
> But what about my other point about enabled always being a subset of active?
> Can we not change "sys_active_cnt" to a more generic "refcount", then both
> activation and enabling steps increment that same refcount, because they are
> both technically users of the config. Then you can solve the problem without
> adding another separate counter. I think that's potentially easier to
> understand.

Actually, I think merging this two count (or with module ref too),
seems increasing commplexity right now.
To make clear It would be good However to fix bug for above case,
I think it's enough to add sys_enable_cnt and I think it doesn't loss
its name meaning and it seems more to be backportable.

> Although the easiest is just locking every function with the mutex (or a
> spinlock if it also needs to be used from Perf). Obviously all these atomics
> are harder to get right than that, and this isn't performance sensitive in
> any way.

Agree, That's why there's one option to merge cscfg_mutex with
coresight_mutex. But I think this is too much to fix this problem.

Thanks.


