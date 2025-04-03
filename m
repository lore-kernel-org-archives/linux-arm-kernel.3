Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6D7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnQOfVxxpclbFn6ixd4XJ1kSMQ0EveRyUdNHm2y9RT0=; b=oGREIRyV7UJBec2E9HYdi9g9CT
	xinnOlJ2/qnlKMry/c4euJFSCVrr7a+PwYypgpU8yO8TFlkIU3B/Q4VkfHgqgjPsBcv8A1HVPAeC8
	MOz3Fa7xMeJwISOQRqD81RdSjhJuXp5vrNxXWre1qP4jNYJxKBB0Ti/YsLy3lhlDVsx34PLOGuSN0
	S7GSLtbgnXnqP/Bred8u2IscAsw5tBDfPfoX5IGgkwubWyQoODH7KEuC0hIc2FC3AWDFCMuGWoYzs
	4Phu5DSbxwWsH3xeDt1+jIfbTinaOaPHk9NBooS0xM/nY2A99uM3XpNqrSFD23uv8B6iiv+nEzsZ9
	k6ucmSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OID-00000009RlO-2zhw;
	Thu, 03 Apr 2025 17:23:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OFL-00000009RPP-48PL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 17:20:57 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ybZv52ULRKr9pdc3z+zarA0DBCzObjerGst9rf+Gok1RGkL/bERxWixoG37MubjX92kflV0EYIz5SmnVmy43iL126F/al/PN4AyLypnkHKCqXKDnB8f+eVsSlMaca37ivzXxaqh4jahvOAOAR1ZFviK/8to7J4PH+qOnuN7DltkacybHdxbqY+VSfgUTWk/m0QggDZPmL9UtnA1pzOW2ysV7FNudPO7SGbDynluPQ6v+RVFqDQdVwGN0jWPxIOwdDBr9ZyVfjrXc+1XV9vug3OvximhAPBbvS/42mo7d5NEuJ3AQ3+6sehiCDIWRzAC8B2O58ZPjDJg3KToW5Zl61Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnQOfVxxpclbFn6ixd4XJ1kSMQ0EveRyUdNHm2y9RT0=;
 b=Hb2tuIys9bqrsYJ7mIQf+bp3SB2Rgkl6Wrdh3LH3u/mlAfZRtqJIuK8qxb11VTcruEfhb0JCoFw7FZ4uLrVhVSFKmwFm6qj5W8O8a+2sj/p/QPd0KcPSEnU8KIjJkje2THl0bfpIgNBl2hTM+tfmSKiJ09ylBwgqFWD4yRXq/qiZJ0pbBFWTNRy0CUx/h5FvyNpyRlKEJPkVuBZz2oxv1LhC3XEc9pUG/MeLTzdoxVnXiSLNfFnlcohP9z0WtpCcBF8Ch30UvgJomfdtGH1upQvlLKOI16yA+i0lfFkwQpVde1K+rLJxRgByapyZXnZo4eR/z0AjeNxHR3dqOrgmig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnQOfVxxpclbFn6ixd4XJ1kSMQ0EveRyUdNHm2y9RT0=;
 b=O33wdIAQ16k0RaW2fuEmByZg5lBudFGyuxs3j4taZ4sDJbA7+TpQkhR0y1d/kmGu/vdZvDUstBmCCOLw4tyDebM4nmbLL0KnIw4o0/o59yvzPGMOkO7edlE5UKDGJ48XY5l1NZd9xw9fOItXua3xavxDtVn+MVA5QRtasEe7mUY=
Received: from DU2PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:10:3b::27)
 by PAVPR08MB9089.eurprd08.prod.outlook.com (2603:10a6:102:322::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 17:20:38 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::f0) by DU2PR04CA0022.outlook.office365.com
 (2603:10a6:10:3b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Thu,
 3 Apr 2025 17:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Thu, 3 Apr 2025 17:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUe7KrMmw/V1bGPD393lSLmZIOIXkm2pfFBjLvwJOk6CvTikPQq2SdiGbWDt4h0EhwIKYpk9Yld6ZnZlxoafuLZH3o/qrPGW+5rPJil9j3RUcUT3KfJcK59tRIVFwQcU6IuL6tw49ZvblGc1ezCNtFY46yyBfJmtc/WoIrIKH0hVsExTC/cUN/PAb5uNX6Urek0ZIe6FmbTQm6KP05OEPu8p60AsreDbKOnVODkFufyTUPADvFAr6IJJ7kJx0hN2DcqDHNxLIp5sLnzGXRNAfOE8gd4ZMyHWQpXHbRB5mw8ON+cGNC/+PjxCtxsYlaCHusJ15joow8YQklluDnBAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnQOfVxxpclbFn6ixd4XJ1kSMQ0EveRyUdNHm2y9RT0=;
 b=m8b46baMd7PDai1Ef9HJmnphz59+ebFISxUk3cZ307Jovy7zTHfHxVNGpf230yNbMQ3N1I5ut0AuHNzfOWymXfRxysSytjFevvTxyaqjvZ1yOTnTlmizyXEDxG0LxNjLNieBlKue+dx/Fs2rTaclb1nHlwXom1IkJQTHPw/dsEwlZHekjnjWlyC0hp5pHR7r4OcsmqP9fc7GmCb0lhboFZWMKwYuLGOLY3Ni5Sb7OvsxQWPpYXIsgoieX5ej9JSoI3kRR/3Nj+QsRRkHYwbzUZJ/mfjfJw4xbE4a3QPdWBBx3ZKtwSmXxm8KniP/KOnVh0NYNQ/opsSgz0elzN+R/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnQOfVxxpclbFn6ixd4XJ1kSMQ0EveRyUdNHm2y9RT0=;
 b=O33wdIAQ16k0RaW2fuEmByZg5lBudFGyuxs3j4taZ4sDJbA7+TpQkhR0y1d/kmGu/vdZvDUstBmCCOLw4tyDebM4nmbLL0KnIw4o0/o59yvzPGMOkO7edlE5UKDGJ48XY5l1NZd9xw9fOItXua3xavxDtVn+MVA5QRtasEe7mUY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM9PR08MB6724.eurprd08.prod.outlook.com
 (2603:10a6:20b:30b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 17:20:05 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 17:20:05 +0000
Date: Thu, 3 Apr 2025 18:20:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation/arm64: reflects FEAT_MTE_TAGGED_FAR
 description
Message-ID: <Z+7DQnBMc4v6rpm1@e129823.arm.com>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
 <20250403141535.23496-4-yeoreum.yun@arm.com>
 <93497fc3-3da9-43f1-8b22-cf0d3f3e7de2@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93497fc3-3da9-43f1-8b22-cf0d3f3e7de2@sirena.org.uk>
X-ClientProxiedBy: LO2P265CA0483.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AM9PR08MB6724:EE_|DU2PEPF00028CFC:EE_|PAVPR08MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b918165-0de4-4e5f-f829-08dd72d3da25
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?FticX9zELln+ps68qEiTzjKExIvLj2ga5QX9y9T6tcyMUzMaQa1+/uXECeav?=
 =?us-ascii?Q?GcfuV1Zm0inokmjRDHR6HxzHd0/gbGMd/phEzIxQGgORsrkNkGhuQM3F46T6?=
 =?us-ascii?Q?o0FGsPDtTBsPEa8iZAsOrgbGlmr1kmo2N3QryddPFfhPOVqYopZ/EjgMm6M+?=
 =?us-ascii?Q?px4rhm2MICYuTUAEa0im9Mz1yaksXg/Y4kAsvm8/t1WHvrc0vFSiUE611K8Y?=
 =?us-ascii?Q?Om6TqTmz4eTAY1vSy3pYIg87fhatxxbaP4dpzPNCXojP5d4SRxcOC08PxxEj?=
 =?us-ascii?Q?qUxR9Z935oP1vwvolC6vXP8suNb9ToljKN+w3pQyH8BQnmz0tHkjWTCVzN9D?=
 =?us-ascii?Q?KWXMSF1QSvJsNVWIJ97QCjsNevjPugfQc/ypTqe28yHV9iIMo+fyfdkUiGDa?=
 =?us-ascii?Q?DeLeV3kAwI8TzMxP9474HGMujz88rDYlmHQ6cJxxRHErHMUdgxg+wkb3BvbQ?=
 =?us-ascii?Q?4uraIyMzAR8cT/FV4HT6rV4nthVeGozE7c2mU1w1V19tpVtwCI+UcSCGNtqn?=
 =?us-ascii?Q?rHKOu2HAGgqzeWlX7WecyyVrfND++S4F9rVXHxWEo01DooXpG1Wc6rs4hyqr?=
 =?us-ascii?Q?XSntvzPUUvQbCKgs8FreVk1cUbhFjWqiMci03vEE4fKtnZ7o74m4Z+Wp4TtK?=
 =?us-ascii?Q?/GgP335XTESZ88zbK5AVQnRUE9+YE7XllSI0eyzFuS7wSjAKVsO4kejecFoz?=
 =?us-ascii?Q?htmhC74YlGa5zLgV/qKFO4H9my9mV9vH5qESoblSJYXXwk3hl4fHQ++bu4E2?=
 =?us-ascii?Q?6xmhINo5B+QLOfQYMz1gLC2EABppOJEorL5ZJeOK9ezEjpkM8Z3H9QphRuXU?=
 =?us-ascii?Q?uYQtxyCi5S3fecwV+BKk+9lmjQRRQmW+k9ksvSIqj9sr3f0PeYeOp5ldan0Z?=
 =?us-ascii?Q?kWwY3fxYlkL4yk7f1yX1M1tSrEyGv8lqqASCGkF1ORVfwDoWfPfa493hctSW?=
 =?us-ascii?Q?fJyyZNBLwR3nJp9A++9AZGcS8kiq52djkFk8aYDDW+Ycy4y3LQGdIO5MiH3x?=
 =?us-ascii?Q?JIaWJUoe8RzUL5bqVPxhiz7xJ4QXVYMS5yf0P7T44cq+SKjqCrgqlJW9b98/?=
 =?us-ascii?Q?00HeUSUjml23cBMT5+POaJyATjnDSXzGLkd8kMgDgAGBS10O3fXFUi9Nih3P?=
 =?us-ascii?Q?wb7zBfOaVA6iKgAyu6NdMW3dvi+mZASPKCKCfbOJ3ByZVqrOAnWu08ORVx4W?=
 =?us-ascii?Q?b4DT01it+dXQ/AHJQEDWJikkBsNnj8VCMhG1Gb4Yc1pd+gGKa8OfKP292bhq?=
 =?us-ascii?Q?x6zJfGYuwoFaofMQ4F4Kf80Djz3LvetLB5Sy3qgOLNaiF4HxCGB+5PoWDMEI?=
 =?us-ascii?Q?ZL1DJqvniGVEoo1ks5SCN7QnoUyvP49Tcsb0u8y3c2Wt16z+zELnmWTntC8r?=
 =?us-ascii?Q?MixnNYW+7K8FrzlGfNIZrs8dzCLS?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6724
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 180fc332-5586-435c-4222-08dd72d3c67f
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700013|7416014|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RGhHuyXVoABIBaDu6sfuaImEm2NCucZSARccLPcHEm7PUspTxlTkyEq3UrIE?=
 =?us-ascii?Q?ADDpKMgbAJAf1RDjXvtfPlZL3Nz8a358yLzKjWAI1Gz0QSP2uJOsRoNFqKmO?=
 =?us-ascii?Q?ZNf3YomXfABZAGcaJ1xnaA9bRqlQ5jOTraT2weRXdLUqEbe2t/x3xNyBaMQt?=
 =?us-ascii?Q?NzFr6NCDdw1zyEVX0a89i83KpKdxyojDNgZq0fj8kN8ySeDr1hYJOwA8oA7a?=
 =?us-ascii?Q?Uw7r10bi5566I6QSfsmCQai1o750cSZxAoxfkX+CEr/kq7HT8LFrrgmpxE8m?=
 =?us-ascii?Q?BDinor7dV/TQbESkYlkJTgvUBRS8XTz5MMoGRmDo0BJXcQFFdYgMDxxCUgly?=
 =?us-ascii?Q?vzQsGV9WbC6wlYCvKVW3Y2hWnnA30nH1pFF1+NEpHRr33mpMATv2PDZw5wa3?=
 =?us-ascii?Q?SwWO+/pZ9oAeM9ETJKlY61rOTUCddy/t74I7lQ0bvFb9PU1DZH7g8wMKL8Hp?=
 =?us-ascii?Q?DLiUG7+jGbqFKf9pghZfm9Av2b0zPWuL9mCiB6WL0asHqVHOTfINg2MZKsnq?=
 =?us-ascii?Q?Yiv4ySGHpl0SG714kHv6G4XrBEH+pN7PumyLY1i9CfOeqFpoQ/7wel5fOuoP?=
 =?us-ascii?Q?SK7wBRarRmmO/sPjCTCJdMj5szbO8BKnA8Mm18SW6kb3DEjt8XLpo2NdmBml?=
 =?us-ascii?Q?Rqg5roZPzTxQ7wGq7FoNXmu9mWmmDJ1X6pEMZJc561R6kl8cH+0hQ98SnvmO?=
 =?us-ascii?Q?SB1mCEBsCaTIz/+TsnJvQA2WY+bggq+8GTQuqpAfk9ViFzMCCk0sFDjEe1Q0?=
 =?us-ascii?Q?1QoExzyVCCAV9W8wIGoxhzgFd3PsxGnHLQmIl3xH758MK+iQd6xKpmY+FJow?=
 =?us-ascii?Q?JkN7FoTNmUI1GrtUiBrHCaguU9YU44EVZB7dPya9hPEPjXlBajgJjuWvP3jN?=
 =?us-ascii?Q?QScr4QTNC/EFG4k58m9OpiQtBPcLy699uojtNubmkGzPF5xLLZsDN/nnyi73?=
 =?us-ascii?Q?MOse1Mj0fB9hGNWZfijXszEhhzE7AXTdDAm5qYL+URoutREQFeIKhK9lRmaH?=
 =?us-ascii?Q?bfXwg+v74SPtiVd/0hudotebEl1/zfelBOZgjYMtQRngYkKBdWqvXEsnolGn?=
 =?us-ascii?Q?7ikvD+t9fitStGtdrq9ikxurOzZBr5CD8Q7oVRvmVoDOuZFSPJh/cPW76OZU?=
 =?us-ascii?Q?Dn1JXVfRuC+AIGLthmfGcevTTmduLt/JtPSD6DmNPsO5ONTkYCKUDIgn3M2W?=
 =?us-ascii?Q?ZTSMpYxOBPiPq4tnRsxC8UoQAxQWOykSjSx3ia/+eviVXKbbo25BEatOEZRS?=
 =?us-ascii?Q?vzTz90IrdGWFH612w6O8VmsSFjWB04+GvpoQYdY9IZBBEp2qlaCJ+HpbhGh3?=
 =?us-ascii?Q?gC9LcXgOHpkc/loyKkYTHNA8JuS0LbXl0hRzz2f0kYsVEkaF1EdvQvXzaGcw?=
 =?us-ascii?Q?wZ7nS/5oMQznwQKB6xStRAPkB+I0+ETvC+RULfjO40r7Un+OuiF0PK76oivC?=
 =?us-ascii?Q?uKr51wWTQGOfosI/ilTrEwVe0/ns6nYWkJ0KmN5ui4poPA4GF7C94A=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(7416014)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:20:37.9128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b918165-0de4-4e5f-f829-08dd72d3da25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_102056_054757_DC163195 
X-CRM114-Status: GOOD (  13.62  )
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

Hi Mark,

> On Thu, Apr 03, 2025 at 03:15:35PM +0100, Yeoreum Yun wrote:
> > When FEAT_MTE_TAGGED_FAR feature is supported, the value of address bits
> > [63:60] is preserved on synchronous tag check fault.
> >
> > This patch reflects the above feature in the documentation.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
>
> I saw the subject line and was looking for the elf_hwcaps.rst update in
> this patch, though really it should be in patch 1.

Thanks to let me know. I'll squash it to patch 1.

--
Sincerely,
Yeoreum Yun

