Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE932CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c5qHTXgg7Sn1wFrBVPvLVLqtoJr9dhCVhFvVuWKESE=; b=xiQjPzQerR5mqDQ5lsKaeD6RpJ
	3cSFcPEJzgw3LJgaK4vR8d/iJLm/ffw9Q2Nz5IgSasmFltMLXHg598ROAsRoBN/L4jMh5a5P3rjsi
	2gMFpfJ6KajlGBFXQzckJxG89kIThO03dCNNluftoPt11iTAqpoU2uF7glNEcBZquwaao4EZR7KGK
	hJV6SM/prOtEgdMUtJvf1E6o08THeZ0oQsu3fQZmOCX2B8NODhTO+UQ/wLhG/V5pHcsi5ZEQLU/UG
	GMDyi7/9eigQpv8To1Az/XC2BztCYHayTNtj2D667HEezNTDi3/4v0vwBzeoCKLwLuWypJnP5/vsS
	bgG1B0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0nJ-00000006JL9-36kw;
	Tue, 23 Jun 2026 13:04:01 +0000
Received: from mail-northcentralusazon11023094.outbound.protection.outlook.com ([40.107.201.94] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0nG-00000006JJa-1QYW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJohMzuSTD9PXZlEa1A1k/lNmchvEm9XpCjXzCh3eYqBjXtdsInQQRmSRvoJef396zZXtGDGCpkY14eRhDJlLA1uR3V7GZYeJf4+loTJvBkvK5aCp/b82s6YXcFmN4No5JGC2pSeseowzRYs3RT6qIh8Ea5EX6V4MPrpLlYF4nOrB9ki8U+GlcpkeMN1Y+eKw8oEwPEG1XpiQ/nRhq/SYwj50lkxJStEXBJsokUVhi6aRPmERIg457p9Q63r44vEAtHS4KAhdxhgWWZF/mC6n97Js8nyT3FbrSYq+JpuU7oHorKTCtQE2ZeTDrkD2A2qNywjrwxXihFLGii1AWNSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c5qHTXgg7Sn1wFrBVPvLVLqtoJr9dhCVhFvVuWKESE=;
 b=xx7qY2ZQVAqUWh68X2Vv6WObnly2oK4llno1qCMZDQSjPe4Z3xSOlsXmZvKvsmut0Xv8PxnGn1cj+8rwxXZbWfRvDKFuww4bw6w4XM6dU9OBaGpwuKXpCpzYofgu6HAP7cSWK3aieJZi6FT9IqPySCeNkdszohuTxjC7i1mhn+OZmq5Z2MrqiKU4r0/NPBTtkYyicO4dciz+1kABN8Wu9K9UtRtUfA1bPsKzeR2+R8TnS1KouVpPyiti5Y3sZd7B1Tz1zjsZzn4djwNMriVWkoQZkimiCbQBf+s5fesloatx/3louFBLXYCVjGlmJimQQToUoRaZGGTRUtwBk7PWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c5qHTXgg7Sn1wFrBVPvLVLqtoJr9dhCVhFvVuWKESE=;
 b=HqsYBZZnoreV6oSfqg6N/gjvO3n81TMNIg0u6IW8iGEf9eK++oCuCHyZOFqPv8Wwrqr6hT0x4Xhta69txeg8W3gvmQ/6YlmkQPc5oCRjD09zr2OV8/t2jdx0hBT4pESk6tWr9TtkgKBZuvviHp7E/K++77G58Yb9ZSc9m3bz4es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 13:03:49 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:03:48 +0000
Date: Tue, 23 Jun 2026 08:03:45 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: "Datta, Shubhrajyoti" <shubhraj@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 0/3] clock-wizard fixups
Message-ID: <ajqEMXmTnpOA7tVs@colin-ia-desktop>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
 <65e8c879-fec5-4be9-8211-8e92cf1a0833@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e8c879-fec5-4be9-8211-8e92cf1a0833@amd.com>
X-ClientProxiedBy: CH2PR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:610:5b::32) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|SJ0PR10MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aea9783-d006-4b1f-5e97-08ded127dd0c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|55112099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: M74k5XDotk/GQTAOep6RmwEfQqBQ+stX8dOESgqThMpg2M8caDJKIW0JR1v3OLVNPs2NpNqk6o4wZtYNnGOSPm6SVBekG95eIsB1NwWuBca2+dL2mNI+d5nPEsGlhlb3AJlvtqeyq21HShaZiYS4C2/XQcbwhdP0c/d9EHXp50fOFEenEpctaiEOmcRUPduYrLuLoC5VhfT4KtjF/S0wlE0+BKBc0ru9k7fsjTewCqgPiRFp/RM61IoXajYVyG7dFwK8q70BUujBI7nuuYNUco1jML/7se8TzHhr/JdVZBfDBR8UKLom5niJ8vqwyLCj78M+hjk7CMeRxbcqQmnmTHkzsb8M53RqtCDkV6A2AC3fzaAR03YTn79Ung4Z0hFp+8GjRTq2j3QdsDdzGahRs8s9qyilOr+mgQTKPz83gozk3nM1vjw2+SaSt2RecXIw64VzObeI3e7CYv1K7uVxVcSG0cLOAQTkJJrIdGDgzadwvjsQZrRVNLrBmUbiaGrrnPhtpKUcX3Dg+kDkDsf70Ma+bGHipKa4VhN9Hk0rJBHQsoxctu8+zTjfi4mqqiKGfCxp4Q7pyjZy/PFqXzlDm0cVZZUl2tEfeJWUn1pQ69o0phoyEeaEpqfwgVIbq9cGOtKx6vExX3T99DJHXyVZdBa579o6FlEkdh4eexLjf3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(55112099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pOSFE21ah9O17ZNN+m9eqjZacGFnVSMXWoFe+fqipe5WcEh2RMtUmoE34pT0?=
 =?us-ascii?Q?s+wpV/+LqhgpWsa+8aGZVinG9eEYFi8qI9uQmGFgDAb7Bru+Oy+AQ1B/cZOZ?=
 =?us-ascii?Q?bpxKKGo9O8i3BgH2cfWjoz63R5yAW1lqhyndEdVqgTZ9VMhX3ajr9K+mIJxV?=
 =?us-ascii?Q?KFiHkGexutu0D9Hw3EIzRxvLWv/E5Xv5r7kkqaBYbUUQkGGf28Ymgwz6ve1p?=
 =?us-ascii?Q?1GQ+PmfgYYOV8iZ4ei+YP+tfcHePaBs2EED3iEFui4WoRrH1dxRqj3lLefZJ?=
 =?us-ascii?Q?91mIvULMFrOVg6JtlspX7UdpRxcwq36EugpuDJrI7r+RIulxZPNFbIz/kk8e?=
 =?us-ascii?Q?IP+LploO41IVtwXyVh7LF3hjQyvkDGO+2CJigQcGSelfkLCd1PyrRoTgkjdk?=
 =?us-ascii?Q?wNuljoi9JIyeJ72a4YzNAK4b2gkDXbJ+gxopWnd9Zec1AiJqXwULXo9i1v27?=
 =?us-ascii?Q?XyEAHbB5H+KBNdRO2fe625tKOindcUuXjphAou3u+md22eLvbQ3zTooKiFVd?=
 =?us-ascii?Q?gSfu33Wt8thk/u1cKtHpBrOXpq9pGxUNWMgyZ3McvyKMTU0vwr+DQZrom8A5?=
 =?us-ascii?Q?AYYCBemu3vT7Be5p6niCgp/fAA6RmWj5IsRstw41VkR4DKcqloki+4USsDiK?=
 =?us-ascii?Q?SO+oFJfR9u+U1pNuraqvJDXiQyvwT9Pr212Z4rOanMuMwQP8epULkheUt43H?=
 =?us-ascii?Q?7Iq6dAPvUy/n8aAituS3/r+ulaPsF0P9gFcpa26xLPMqP4ZRrbzq6VUqiHdo?=
 =?us-ascii?Q?MYBGhzACGX6L3mUWa1PjmOPYtAPXdp/Mz+Dl28rLuQcQDfw5/dZ46uPUZmZJ?=
 =?us-ascii?Q?yNtyc/V/qE6Bx5/73ydiW4AN442yImJcHL9qkQCEvRuE/N6i6yWC6qsNAO7k?=
 =?us-ascii?Q?po1ka5fdF8FuT67uLQ3RLD9uh/PvJGmQQ4Bfjx17HcP4k0GssAtP9qQeJ7Kz?=
 =?us-ascii?Q?LSTzNQJ9DYNeRi8y2J0X2woqiiI7YuscUzshGbXcMa8fy+mgqNfkw6FT6Yo7?=
 =?us-ascii?Q?4EP6RwsoWN8eOxvUDy1tsPjL+gXHhtU60R5y+ODan0EjAPzaqdmavqWCtlRD?=
 =?us-ascii?Q?XG2qE1byTuF8dPPp1RuVi6aAV9zg7cDVjmLgt6igQ5NCY4qxHJAQHA1amUOp?=
 =?us-ascii?Q?yl4U+hK4+GfQf/fET79F75JmGq+arnnrNxnsZGNVvFtliyTZ3ur3fueGHSGn?=
 =?us-ascii?Q?1XQ60WM7JMHxvjgsiZ3nHC1FxQJmgd+QKAwYWTe4BaAgPQkzQskolU5GmAXg?=
 =?us-ascii?Q?u6Eyjxnht2axeE+NcK8kq+jCg5hOx1nlMK4f0LiAiIQbJhRdJEZIlaC1PL3L?=
 =?us-ascii?Q?x+d9G10jrfvDk7mrHpo8trqVFGfOTIiXapqGmDewWuNs+zqPqzLgOr21Tiw+?=
 =?us-ascii?Q?MS3laXgsaS4bcAtZpG6vDlewT4KmFwowPFN2ROaQKN+KMdlPV0mZoOHcHtCu?=
 =?us-ascii?Q?J9vv4kdszKFmzidAlcPKROSXAeT4RDLmZOz8RgKI8zGYxQ/XqDuzHsEt5l4R?=
 =?us-ascii?Q?65uXN9T+3lEihK9rUX9Bn6z9mwsNEBQlrFt3/x/wfdLZfky4c/uYxFIpfbuj?=
 =?us-ascii?Q?1ytW0kU1Ez0/qUqEV4sm5VyXdZcmPM5T6x3w7l9yeqdJDtw6A8hEaLHPl5P0?=
 =?us-ascii?Q?bZqoisMjr3i7MGsf2wpxc3cP6LkIFU+BK9H3ULBLoKEmSBEz+DhFv1TAuc6K?=
 =?us-ascii?Q?CG54fpeCsGLX7CXqB5aYqrLLUyHSpHk4cqULvDf6q65DTCz9/XdAYz/Ch3dV?=
 =?us-ascii?Q?D0pFc/utIX1sFTpMOfKUR6li7gQODK4=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aea9783-d006-4b1f-5e97-08ded127dd0c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:03:48.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ib3xOeRRa22FvJi2U2HjK9NOzQFhMcjjyMzucX43IP6uOqCAXAXCwkwabbPqZghWAlv26VenLO+3T268nXTMee8aFJQsHqm+7tuqx4uup8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_060358_458121_CCC937F6 
X-CRM114-Status: GOOD (  14.99  )
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

Hello,

On Thu, May 07, 2026 at 05:29:41PM +0530, Datta, Shubhrajyoti wrote:
> [You don't often get email from shubhraj@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 5/7/2026 1:35 AM, Colin Foster wrote:
> > The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
> > led to out-of-tree drivers silently failing to set clock rates instead
> > of dealing with the best-effort.
> > 
> > Remove this 20KHz restriction to match the Versal clock wizard driver.
> > There also was a bug in the difference calculation that is addressed in
> > the first patch.
> > 
> > The second patch optimizes the search if an exact match is found.
> > 
> > The third removes the restriction.
> 
> LGTM
> 
> 
> Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Are there any actions required from me? Hoping this doesn't slip through
the cracks.

Thanks,

Colin Foster

