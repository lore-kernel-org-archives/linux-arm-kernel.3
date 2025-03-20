Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7AC36001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=; b=jdZ1TSpkA/VqcNZ81rOhjrgqlJ
	LrB50EZB9ZS2r0LCt7pGnokA4V1mBfbu2Xh9Oki+BaChqKeCqEaYdJUvcqUSIo/awN7BUxFATDZTk
	W9R0VXFEc6wEMt19jW9+9/lNU4C1cCm6s0AwlA8ywV/Q6uzFW6ibB7cb61entkfgg8p7x/zgQo4Iz
	az7p9dzBf4j6vp5S4Tk5Iga63++1K3ch/zRkZENS4TvaypqmDoyH2Rhhd2zTNqJvrOfAru3v6TzUU
	3GfQ8ts6BAfyBWS/YPBmZV3gMshKsN48ZkkjgZIHhfATnaxsa9IRnLj7WL/M6i58s/oX4ZRCZSnnE
	TdiV8J8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMJ-0000000Cc41-10VS;
	Thu, 20 Mar 2025 16:03:03 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvI8r-0000000Ca5V-26hL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:49:11 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kraORVgJFcHbeUtijy6FOOB5J/qnrMaHb0/LK5KMl2uX1eVEPc6VJony7IjwrEodhBAGPKNLVJLZ/vNDxQgRXjTA9j38TcdND9NSrUTOMkPn8wkNSH7Vm0yraH9JwKXoEVz/hBQZJL2C6BZysT+BXb/ne8f350jPFsraOPuxaJyAtRMsi1QcVjMsFGI7Nnps92nZhBWD43+H7iROcGbJteRiupPMSsP1VtjrvqhLKKcRSJ2K9LkQk7miCDzljM5nZQaOycfIZFk0IKsOlgj+sPQSGCEEpcq4JVq3lPfIH7QfPyGH8bPkpfqlLYNCb1E8DHxWJUv6BQazVw+7Xd9J7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=PWGskK4DyJSJk8ih0BPUQXBDo3r1HBEgsL8ukD3XDYkQQlS/zW8ocOVal9J99+b6LlL/dmR6ub3nnVhxlc4MEBxl3pKxVYeSecwhxsuFRLn/TcuPCcio+K2zDmmY9/vtdgW9synoK2qg/r4ba/3C6NLySJ5MuVnMndfu2cfNWs+QiUYi0OHMKihNsUXIpZKnnVlhu6n90/XhVLIyvLawDwM38RJ5Vb911m+7NNUtiEuMgDwBahibzRynmnWooQ9TKh8j/bvk889T/8QPorG/bY/KKHjNL1MlOf0OuT+D97Vpfj0oxxZAhwEzxo8OnomJXsRx6P+cUrtnRFK8oKzrUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=poCV5M731rNmjUaaKbU5iECRtz7o54+WRvR+/7qQ0efN7piGCfCJKz4+4iN62VveJYRkvWjW+f/wLXpzJOX/ciMNS4cvwyiNqVBT8Di81tgJbEQaH0ih7liMFNFJ/17lbRcr/6+oUeuv4x3jE6kAoQGbjapN3au72cMlaitr4sc=
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by AS4PR08MB7904.eurprd08.prod.outlook.com
 (2603:10a6:20b:51f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 15:49:00 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::7a) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 15:48:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 15:49:00 +0000
Received: ("Tessian outbound c541cdb55eba:v597"); Thu, 20 Mar 2025 15:48:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0c55902ceb5e97f
X-TessianGatewayMetadata: oz1CWi7ZcfQC6qehWVMvtKsn26LS38K9qFU8a3MQ5KhgaZcIC9I6fNnBHFgl8BSPXQWPiseievNI1EtFAxxAwYZeQ2xV5nrpxmL1XMwBaSfuAn84+hDWAHgmjPxFjdSdu1U/sWRsS9obxsooO82KEA==
X-CR-MTA-TID: 64aa7808
Received: from Ld278db1a9a7b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FCD19D75-6D54-4344-B331-302CCCB4BECF.1;
	Thu, 20 Mar 2025 15:48:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld278db1a9a7b.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Mar 2025 15:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/JcnD35ZIafdLZfiZYTJqwOMXaxWaBA5EmT9zUHckuphSBpEzktE/U1S5R0+hwMUYYkw393ejogTUR2ZPoLUUdu7xBzf8joz7x6zahyvmZLUQXiKGK9thFocQQgFf0pPyQtAFie9O5JsRq4kT+ApMgUzkb2d0YObmShOZsbmeK060VRBylJfe5JlPrFtSQkehPnLeF1v4iMLLWz/NC9lHfb1GfePTFn3gp8JoWf+tSkGzBx7j6YCVNCRxm07re4A2xoYFNrU6FDasjEjLfT7ybMjiQ1xdiN97rwMesmWP4eXsLMwKmR6E5wtXgjcXgACGBk5B9DdVu7KWiSSlHwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=tJAn9x63BcQRUGyU+0imvKxHwhfhhCcZP9w40JTdg8LkYukwOs9CpP6trnnT4I0YxG8wY9v2Pf4/k1m8+Pdd3lI1It56cXSFku/rAbaNLqyJV7K5gGnZ1VbTLGjVFXt0dxT1/Ed/wBwataG6Bihou1WTTl7roHF0ww3IP51zqNqBolIRGgRHFIqnBwtbrRUyLjmxzVYA656NscXpAWyKJV79NB/AuDjfQH1GmpZUg0gLj/gRpoEKJHoGZqvOM9o11EBSjOVCsPlrUYCFqLxtdQJGG+OOIhrzRlKULFkK2DR1Dp+t0YENnDaGmyQ9qngNvaOsdggWoU3+PfkcYupFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=poCV5M731rNmjUaaKbU5iECRtz7o54+WRvR+/7qQ0efN7piGCfCJKz4+4iN62VveJYRkvWjW+f/wLXpzJOX/ciMNS4cvwyiNqVBT8Di81tgJbEQaH0ih7liMFNFJ/17lbRcr/6+oUeuv4x3jE6kAoQGbjapN3au72cMlaitr4sc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB10670.eurprd08.prod.outlook.com
 (2603:10a6:150:169::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 15:48:52 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 15:48:52 +0000
Date: Thu, 20 Mar 2025 15:48:49 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/7] coresight: Clear self hosted claim tag on probe
Message-ID: <Z9w44Qq7Mo+kTWZ9@e129823.arm.com>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
X-ClientProxiedBy: LO4P123CA0527.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV1PR08MB10670:EE_|DU2PEPF00028D00:EE_|AS4PR08MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 374f5a34-e95f-4dce-9786-08dd67c6bb76
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?+zO5+4oZKyeyBnp4IKpBeONVzqP0x50Xg1JzLhD8CmNy26ta6A2HN4Na400X?=
 =?us-ascii?Q?ToXkvwu5Uq1P647AcgIujI0T8PV5sY87xUpFRGtliJe3qIdavGNMp1CgoF1e?=
 =?us-ascii?Q?Znxguoro9i55a4j9I/FUlb+snL1MJ1VTRK9yr5nfyMilscnJZK9mokprgWqE?=
 =?us-ascii?Q?lnF1pW44uvKKBcaKVbjdc53y5dymfDdkgmi5eA2muxp9DgWvQXam8jH1NOyT?=
 =?us-ascii?Q?aT8v3s4JB7gFsGCiHQQ7C8G0wLPsdHxQlb3dM7AR2BJaI17zt5oDyWBYs80r?=
 =?us-ascii?Q?fRvkfGJHzd6sznFqSnXrYvcDpbAHjt1DlO1O12ki7pyWDJGlD7tUQm+DSvKy?=
 =?us-ascii?Q?vvTn1RJ9Am+/pmRTHWNZAziO4FAOm7hJF41AEuupa1f8/EPRYRQ94EyGUQHI?=
 =?us-ascii?Q?28eBcHo/z8lHFqpJLdkCEEZsbtJuqWR70q2V4hLiNqV+WHtyMZ8IGvsmanjT?=
 =?us-ascii?Q?MQTUMQ7krZ0x+fvJ13NYpUUU8kiS7gFEoB6tx93+86Obgv7uc4JEWnDILtI0?=
 =?us-ascii?Q?Xj73rr2Flh3O5fGoZrYXOZq4956XV9YBkDTI0n5B/kRfV+mLaLKXyBDOzyOo?=
 =?us-ascii?Q?crwpTWt3pnX/exYc6t602DV9zb7Fhbf0Ju5puUwoI5N6nabFP8AS6swaGa5k?=
 =?us-ascii?Q?LT+rAM5GrngPTV9ARvav7rblv8aiTpg8+9vGgRYuEYrpn8UWMcTjfjnVMpqK?=
 =?us-ascii?Q?yev6OBc5tTbeo7KDUru2A91w+AoI1SvD9FSufEE0QG0TyCquJbZ3boAaLmIl?=
 =?us-ascii?Q?Z0S+ciVK2eq+8UBi1HYG59SYZs0m7hkn1qFlbA/wOmj6IY4Lg7GUA9PNKikm?=
 =?us-ascii?Q?A82wZeEqI7rdlwuxWiYNK3j/TDEu9XWAud/bC1WNhebYNJkEWLENkqD/TWej?=
 =?us-ascii?Q?Q22BHTnN+oZ6Sg6sdQ5vrXsmm6iIwkEI8ffDGH4TjTuzvf5HVW1dgyeageEC?=
 =?us-ascii?Q?gtRHUt9vUP4BzNlIGeKvNzpHvC7ULrlARoIzfY4xcIlo11tcDsVnjoL+S7/3?=
 =?us-ascii?Q?2kqVnX6uD20Q635yX5oJPL+/jmTMaf3H7fJhMP3Ag5gbcMu8PelDBvc0zY6H?=
 =?us-ascii?Q?v+gFlO3zx3v3ZuZbp7RDOZ3+YjEb6ltN04RNN9ZuDjk/4rzAVwosuNjoRyQa?=
 =?us-ascii?Q?9tCsIoyFiORhfN/074zeFEq4fo9emOwqvub42rvjt2xuSPZ/2jpYT6C6l/pr?=
 =?us-ascii?Q?CZGmk4FY/8ZdGe/IqBr4M0I5JOTZGRfUG02xpJrg3lHCrqm2ZGH9sNBASuTL?=
 =?us-ascii?Q?EKKPviIZqUBSEPP6bxMK3rHN9DNbMS8DvU0T9Azn3M/alVFY+9brp+NmwvVD?=
 =?us-ascii?Q?y84EhbKSltVzZh3UBAUYzNtUYuU97NcShAChyO6N57hNhw0QlqLBNNL5YUEJ?=
 =?us-ascii?Q?L35sItaUJv2lupZYPD99qm30Xdw1?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8415fb90-3032-4406-d8c2-08dd67c6b66d
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|36860700013|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HPomuvn81+4wgr5bq2o97yIEDqc1ynYuH5U+xO/lscHsHelvB0wRATLDwQge?=
 =?us-ascii?Q?VVE2WfLke4bXXRqXCsCWxjtoXlZS6ou7MM1gPGeAjv16UZSefMqzonDfm37y?=
 =?us-ascii?Q?NS6Pm+8eydxneMHVYiXqtlA4Dab6DnaIXnyYFYNIKWqcJ9mCu6C9DokCoDjs?=
 =?us-ascii?Q?R0i8vNAr7AescKHvASXhvmbRE4vQSTphrhWX4oOT6LlnFehxWhCzSLhKnzZk?=
 =?us-ascii?Q?STFI9ICoPYhmIfUIEp3d3oKv4nSMyJzSAuWO7+XsXLcYju6AecjjGPRDQXPZ?=
 =?us-ascii?Q?ugBOlcAZftj8NkrrGQFnLKc+CWY05s4XoXA+TlC409xq1htN9PJeQOx5T0sv?=
 =?us-ascii?Q?cE5Smh9N9/iR+BQ7/YfsxOnbB839riVpEo15pMpMlkerhLyICZRC3rC48v1K?=
 =?us-ascii?Q?PVXFV1pNVxTLElIrtKxQEu7Dsg1JN84Y54/RcZG3ixt0CyfOZMSLc5ju0OjX?=
 =?us-ascii?Q?wAIToUWgMNP+NBMvv9FZFch5fMmeNTobYIHvjWJLB1OBYR5NFe3CnOqEnMaj?=
 =?us-ascii?Q?dSk+zKxf2sD2vONc2l4RwUoKqQONFIEZ595Ft700faeUz6jxBDhGic4bxQFR?=
 =?us-ascii?Q?JeLHfUvxIgQX5jeSLIvFLsfEIOe8MC4nbyFbJB/y5g8ESMMW0Ni1dePCyvpV?=
 =?us-ascii?Q?y8Xbp6+79wDwWI5lJaU2yi8COhZ6vRZSolpk5+OXGpdT46lcgmccW1sV2W+X?=
 =?us-ascii?Q?rBgNd/s+UCoSZui/6/tjYcSAqJYU1YkMVhG+cbySBSwGqC7tE7QApC5QVbts?=
 =?us-ascii?Q?rvzHULKFBsZzpHbMQzwprc7hl0MrfVpYif7Sqy/q28CLTuSk41sqDH9P9i1U?=
 =?us-ascii?Q?s2Cc5gY2d6yBCk6+rvIoVUCo5vJVn9eNuhIwvjbNNfFLSdoa4hGMNapqKjNC?=
 =?us-ascii?Q?RkrWTwUzLkaJ/KOE6VSthYRjL6TCG3QdCjtV7fRF95gft9EofTg5iYvaaCQN?=
 =?us-ascii?Q?MW5pv5zvWQ5XIfEBInKUC7lbUItALM+hjlwTqEYDha28/AgYARU38Axi/r6O?=
 =?us-ascii?Q?sGGxQeK4PrDzzcTgj32qyY9IwIfihyg35Atn6DILjM0KG10PsaNO7HP9WxAt?=
 =?us-ascii?Q?M9aqAbzHsN/xcr/mecQuGVcfS/4JfKV1/Bejfmnf9r+ZxKRWWiFya1ZofS+o?=
 =?us-ascii?Q?+/T5Fqg0WZFugOtnFtvEMebbp4xXpCeRzsDTg8qFmmRSS9z9KW1uzsh6cowE?=
 =?us-ascii?Q?lByfLY/qeQK9cK4oJEGuAQl6EvMctLBLfBHo7JqtZJYzaAYe/8CwVQdD76O1?=
 =?us-ascii?Q?tRP9izes8C4LSCEo+hWQFGMyP2omzp1TG4PSa0jOxe6y1rEQkhE/BnB8QeHE?=
 =?us-ascii?Q?8Fl5m2UgSI/gEtKgclZ+nIf66YsAOdPoUDCnrYNaoIdH9C2dwCRCrBhsX129?=
 =?us-ascii?Q?9aRqEY8n7GKqJXWR10QYxgV4hXpNFm+W0lwt47qLnCQeiHGVYLP1W2t+TG52?=
 =?us-ascii?Q?7v2rQ/dL372aAlcyitWYowgj98DZUnFOGOC3XuKnxbVq4rufduOlQsjy2kDR?=
 =?us-ascii?Q?h3oo85flfXv+b3A=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:49:00.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 374f5a34-e95f-4dce-9786-08dd67c6bb76
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_084909_686324_BA5B3740 
X-CRM114-Status: GOOD (  21.12  )
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

On Thu, Mar 20, 2025 at 02:34:09PM +0000, James Clark wrote:
> I've gotten stuck a few times with unusable Coresight after a warm boot
> due to lingering claim tags, especially when testing the Coresight
> panic patchsets.
>
> This change does some tidy ups, adds some debug messages and clears the
> self hosted claim tag on probe. The last two commits are unrelated
> tidyups but they touch some of the same functions so to avoid extra
> conflicts I'm including them here.
>
> This gets as far as fixing the claim tag issue, but there is some other
> state not being cleared on probe that results in the following error.
> This can be fixed up as a later change:
>
>   coresight tmc_etf0: timeout while waiting for TMC to be Ready
>   coresight tmc_etf0: Failed to enable : TMC is not ready
>
> Changes in v3:
> - Collapse rename and locked/unlocked addition commits of
>   coresight_clear_self_claim_tag() so we don't change the name twice.
> - Make coresight_clear_self_claim_tag() a bit more generic by only
>   doing UNLOCK for MMIO devices (although there is no use of this right
>   now)
> - Link to v2: https://lore.kernel.org/r/20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org
>
> Changes in v2:
>  * Revert most of the interface changes, just call
>    coresight_clear_self_claim_tag() directly. This is possible because
>    we're not doing the read first, so it has fewer knock on effects.
>  * Split out the change to add struct cs_access to etm3x
>  * Add another warning for racing with external debugger
>
> --
> 2.34.1
>
> ---
> James Clark (7):
>       coresight: Convert tag clear function to take a struct cs_access
>       coresight: Only check bottom two claim bits
>       coresight: Add claim tag warnings and debug messages
>       coresight: etm3x: Convert raw base pointer to struct coresight access
>       coresight: Clear self hosted claim tag on probe
>       coresight: Remove inlines from static function definitions
>       coresight: Remove extern from function declarations
>
>  drivers/hwtracing/coresight/coresight-catu.c       | 12 +--
>  drivers/hwtracing/coresight/coresight-core.c       | 87 ++++++++++++++--------
>  drivers/hwtracing/coresight/coresight-cti-core.c   |  2 +
>  drivers/hwtracing/coresight/coresight-etb10.c      |  4 +-
>  drivers/hwtracing/coresight/coresight-etm.h        |  6 +-
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 28 +++----
>  .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++-
>  .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  4 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |  1 +
>  drivers/hwtracing/coresight/coresight-platform.c   | 26 +++----
>  drivers/hwtracing/coresight/coresight-priv.h       | 20 ++---
>  drivers/hwtracing/coresight/coresight-replicator.c |  3 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |  6 +-
>  .../coresight/coresight-syscfg-configfs.c          |  2 +-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  9 ++-
>  drivers/hwtracing/coresight/coresight-tmc-etr.c    | 16 ++--
>  drivers/hwtracing/coresight/coresight-trbe.c       | 18 ++---
>  include/linux/coresight.h                          | 40 +++++-----
>  19 files changed, 168 insertions(+), 134 deletions(-)
> ---
> base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
> change-id: 20250317-james-coresight-claim-tags-ae1461f1f5e0
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>

Look good to me

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

