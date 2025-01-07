Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CABE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pea+14y9JLKkgPoqIh6I+d3Btl69n/H/3C2X9TbcnL0=; b=bmuZGmrTinHBvhXEyMYmh/SYjH
	+GCP/DAH7bZGVtyKcLybailNyotKuFUAcbJBnAlBG2PenbcznG1sd7NeonRuvD3cdLrb8pEiNiK8T
	JvIODo2h2U3ID1SumsNE21fxD9FMWo4PL9BtK9KYmpv5QnIYj53hW6CMTSPXeZfHLh4SKYMPbe0zc
	dYy+z3p/vao++bQmnela2NdbfvQEJv91nHt4yPgjbAVU9Jrm+Q0e06LV/nGbANdUoc6EncLhxxBtu
	OIIjzBFS90pvECvxnxHmNxZ+zunLYGAPUVuDrojTF2qPYCCU8jLEeUWzDf73BWkXAatH47nmQmIAU
	L13q4WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Hi-00000004v3G-0FP7;
	Tue, 07 Jan 2025 13:06:14 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Dh-00000004tIl-3nca
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChOqjUG0O5fLd3FbNvdDbO02o2EU/JG1jPcoj/eGIl+4NKKE2X3zb1fbetuI4FP9dh53CYWrr8q15SIch+LA9AlsJmWGt5FC50ysrgGFfhgqi4OwXxpZ+nLHpP28F/+T0BuDfpC56CdVEep4ycwt8RsFm2ek2QmhvT4inw7VIusSTZearZBiK44FrV5IG+4zuVZDx0KMS03oqC1+d3PIfzpupzeIGqWQsfxXHQkLrokuA33ZeQEjnHwY/oMV9AaRfktEIM1Ujqp7kfVV6YXEC3WwAMhaDj4KApySroyIKirw8bIE+dWAr+CBxyHFeMCLgIKPiQJcrdxFaPLVKQrbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pea+14y9JLKkgPoqIh6I+d3Btl69n/H/3C2X9TbcnL0=;
 b=M3N9wXONE7Qb/dU/7MWspWmD/4/mEj4dKJrrao1JRDh4x8wnJmKH+dI4xIVcGfxRXxxR/Xo3ofhHpWoG6i1uk2Cfa4PXXUiIe9sl6vSa2PFsng/0keHSb8BVby2T7sre8r0C+RLHZYmfm6qYZUKYvOtXyR/yoN3+oY/hsI+pdDSYrxYd0pqaKRVnrDtZB4BXeF1MIAo2DP+c60BLjz6l2U4MEbrKOTTBl0w7e0a3ABZff3zQxz5X/vnDpyEqMjY8jjM7rWOh+HFdOU9Emnh5QFUGHDE0ODuLVlzvmwsfVXjAz1N96Z8HIniLNsZLSLN++sCwGjDKdq9ghin3z8tozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pea+14y9JLKkgPoqIh6I+d3Btl69n/H/3C2X9TbcnL0=;
 b=UP0hj2874T8jwQcDFg4TckT6RqD9bBb3T9E7W/3AOfpJOs+hlxJS7GHMHZxf/AXh5/TIpNlqD8dN+ek78hbtf1jLPiVtBRv7fybG9TbCE9ag/cx0WTaf2G/bM6CAkL4x2/H3JdHBaeW5rpbq2tPveh4GlOpFOvhZokcT/RjrrbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB11016.eurprd08.prod.outlook.com
 (2603:10a6:102:46d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 13:01:45 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 13:01:44 +0000
Date: Tue, 7 Jan 2025 13:01:42 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: prevent deactivate active config while
 enable the config
Message-ID: <Z30ltrwxpbVjIaVF@e129823.arm.com>
References: <20241223185328.1339616-1-yeoreum.yun@arm.com>
 <065330b5-992e-47ae-9c49-e496d03c20de@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <065330b5-992e-47ae-9c49-e496d03c20de@arm.com>
X-ClientProxiedBy: LO4P302CA0027.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PAWPR08MB11016:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eca3983-d8a2-45fe-c0e6-08dd2f1b7003
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TyjlFabK7rtvrq8tGA1YPpEPXQ4Vkv0eEU/I8Njro2UK6I+gztG8XbRkhFW2?=
 =?us-ascii?Q?ufEZTauTgav/CxkjoQLpBiki3eah0yB/AltnPkoSJSypNbQpMf5TwllwBJ73?=
 =?us-ascii?Q?8GpYsxmXpyRcEbIytw+MWAjRQBfxpqFudkGJh67lOrtAPPokphBlCq/wT5dO?=
 =?us-ascii?Q?Vs+v6PiwDZmcTCIJzwj3RZF8duN1zxeF8cZZwbNn50Ev5CMTQJeb3TN98ggR?=
 =?us-ascii?Q?uBxkkNQRWlD26+7JP/mACJVGKEgQXqi24lFkCz93kJ60WLWW0mEZcrgK4nQv?=
 =?us-ascii?Q?CUjxdvZ5TDeGKQS+XQ9tZT653QdeZHYzdtBrm/kn6b04Op0Rxq+qTU1rEw3B?=
 =?us-ascii?Q?pCSy3u+t7XfalppeOPxqGfI4FoGoMzlxgJQzLKdSK+uiPycQRh1iIZHBL96U?=
 =?us-ascii?Q?++frBbra/cV5SBZcvEaFu40bCHXvyCI6VQAXwrL4USZQIbEJpPKPkFmB0DHG?=
 =?us-ascii?Q?3MpcRZni+61iL2rbwqCGeVxxrRwCx9d+ioQmRuYVXdWNxoAkdoObyFRzfqKz?=
 =?us-ascii?Q?K5q6f/XUXqKIIIP3Brd/ew6PVOirzmyNZRO7z5x4Nk64C+UwOvQmbSHbtJLc?=
 =?us-ascii?Q?1KpMyM+pewysfxyuHgOPZBDakJ06wARqNqTAlo5OVm6J8vEuVkTkYDU9DhU+?=
 =?us-ascii?Q?jTgWRMAotHsxh/zhmCD7zOrrpwgD+tRkM5tkxNcrSYNup9n5jkUk3PPl02f/?=
 =?us-ascii?Q?W95s++pffq4ri2nWbZIIo7QnCbV3BFci3NGlKSJb43QzYYgDr7P+NAmgKyGT?=
 =?us-ascii?Q?QLFO1BaVlq4jO8bEch/tvqCy1E6bx7uQLMUncbcaMTpVfiqgDpuMsZfLbEoD?=
 =?us-ascii?Q?MyI69C6IpSJsXBiWjNOXHtOuEuOfqZdcKJO2YYeD+Kzl2/9bFKVBlmVAczhu?=
 =?us-ascii?Q?4/pNp9ugSuQcTMEB5OACK5PQaCq6rCnYp5z8v5YoRhSx3YZq7K6dD2E+tTP/?=
 =?us-ascii?Q?9toVU5x6u3V4CUQvMlsmh09rz8Kmjbr7kG76OraQCZtkF1vA3wzdl/98aE3u?=
 =?us-ascii?Q?PAThQlo75SP+x3BWyhCDlzzVKqayeujYij6uEXidj8chmek49dQ7z237qdne?=
 =?us-ascii?Q?A3mdYaFP0f/nvMUNnLtNevYLW4yTjMyr6I3GU8h2asGprwElEVR857niac8B?=
 =?us-ascii?Q?6ug1MguDpa2/JfaSfIdRMJ5V0wFGh4UCHkUU0e57Im6LQcSCVPW/SEfDXPv+?=
 =?us-ascii?Q?aXShIhS4H17Xplrg0UY1aLu6q+EUGlOV13vZ3oa/ncuJyj2Sj+0p7DYNe5t7?=
 =?us-ascii?Q?SVBrdhGUKSuQbefhLIjvbJ7fy0sXPuglBum5HhBi/qeUJNXcoB382yAM1Th1?=
 =?us-ascii?Q?6Ierrz0fTCtxrwORcHgepzvdX4eoFvEoldZikWHuX+xZ6Ou2satmTSW7g2Bd?=
 =?us-ascii?Q?eakg+y7ddqkAJn6xPU6ksf6Nxq5U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJJqJnQc1/KWPqh3/BwPrs1Qn6TCQDqEsSAxZrHHUGcidM4m6VQ3YMuCzXGA?=
 =?us-ascii?Q?qjc8jbzRxN3c1OtWbKETRgFgIaweqAmUmg+TV0Cp6INsN6KSs2VkhQwS1ajh?=
 =?us-ascii?Q?p/Y3g4/hSX+WAQ4MR+DsND+UjkpSYVBSx3FCv9uDeqbhvKIjL8E955uYmGxL?=
 =?us-ascii?Q?tZ8RFw0ph9uPnDA+WUlsoSnV+dbnzvcI4dOedPqFDLH/YRCvelLQeGtLqs03?=
 =?us-ascii?Q?edAi9msP9x7ksGix8cgcf4dmX9qjzNUrFV1RBPhggkGpD4ILSuy33pHuoiA8?=
 =?us-ascii?Q?cWUX+WQABtSC9scpaMdHpIAWaIOs/n1IVMELdjDL8Jgd/s2x9GLZ7le9nvCe?=
 =?us-ascii?Q?QiqKybvFFSIefCjzVKEJfaayqah3W/4xJwRG7LDbKitiBpL7ifXmRbGwDbqM?=
 =?us-ascii?Q?jBjNy5XjyoWHjVQ4tHKBZ3aRxCnLhLOVLKXaFg0fw9fwGceB22MAh6yf7f4N?=
 =?us-ascii?Q?T4OleQ+01WSD2QtlEn3f1Rj1K3nxkKOuXq4SsZTwqV4DXx3A23aSY5LYxf7l?=
 =?us-ascii?Q?/iMStPm2UDw/FDHVPPZBBKfrb2n4SCtNTJxyJn6Zmt5fhpqvCCSRi/V04UvE?=
 =?us-ascii?Q?T/BakZ0eTxDoYw4BK+N3w5pNrFmvQD07dTufjoCu9OFig8zrILnbftHCzmni?=
 =?us-ascii?Q?ysGYQP9zZ5AOUKgz77F45jGx25WFQI+hF7cW8NsrtAlPDcB4NPvQy4Qs/bwz?=
 =?us-ascii?Q?zedJp6f9gWGv7gvz1y+1RJOe8cjQEoJhv+wAcJawrPNx2SriS0fFgG8uSGYz?=
 =?us-ascii?Q?K3fzi3BO6haA5ym4ATxTWVpmUfD5ZkB0+2PhE26AjcHwGGjSiNCJvBmT2Uti?=
 =?us-ascii?Q?qMDdSAxh0plv+iUYtO2Wz4rACjt218YQTbyKh2sgRedOM4yUkieVeblVdWrw?=
 =?us-ascii?Q?J+icnlIlTVEEXHntdW/ull4l10XeBorY3MJ3QuxBwGOjpPEVzgSH+ZTVoiSe?=
 =?us-ascii?Q?VUU4/9exrXcoaAL3cJcPbhd+9xw1fbygi6h5THTj8qobMebSxaYMAT1JsVxk?=
 =?us-ascii?Q?0qwCmb5T0cWgseYRxCC56X2Bx3gVHdnmLaxAE1pHGnCVxZs7TFD7qkXsqi2U?=
 =?us-ascii?Q?aqG1yQGJjHRvpucK8h3aJl0EALz+XtE+CN32+/Zn5GxUFDhEhhta5wPCrRsc?=
 =?us-ascii?Q?Yb/Rk9JFTCrrONq75Ma+ZaHH2G1O/fnfUrlr34oYaw/G5liUUNU0z9ShalUE?=
 =?us-ascii?Q?ZgfoVliWILha35QY+vx/81rhsUsEF+/0WYViTmyEKoug0CcZDqs/tuV9MfWC?=
 =?us-ascii?Q?orVEVAfaArWm6D+GVr60BosZt0oR6lvOHvIuJsidQmi4M9btwX0XhjpCCR7D?=
 =?us-ascii?Q?3VMzJ09Hs/5EqfT1Egla+4QKsZDuASn2HWAbnSupijF7If8yBCQSZ0/7ZqHD?=
 =?us-ascii?Q?jww+TKSiVl6QrRtwpcbcDKQaLba4/pgiEnLzvOOowCXfyqPZTrdbP6x3o/eC?=
 =?us-ascii?Q?8icskju3Ea0j3HqPioCOy4rm6e7rGiQYCl3+3KfDKg/C2IriNbimNlU1Yi75?=
 =?us-ascii?Q?R9ZPO5atdScoZ2C1f8u6S4C/uBlbVxjkHgWpyK7c16gjF3s5YDIzNvAC+W0f?=
 =?us-ascii?Q?snasOlLeMieR2W827oUGaAyB/c5TfbgT55Pbat76?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eca3983-d8a2-45fe-c0e6-08dd2f1b7003
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 13:01:44.8265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3Y4FWASs82xQhnXmxMPcs621FuiR/JUb/ZtKpTmOCZyarL3Dld93sQvfrJ+ohAeZnJcV2bD6pM1VwTk53AbDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_050205_947079_CA92D11F 
X-CRM114-Status: GOOD (  30.74  )
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

Hi Suzuki,

> Hi Levi
>
> On 23/12/2024 18:53, Yeoreum Yun wrote:
> > While enable active config via cscfg_csdev_enable_active_config(),
> > active config could be deactivated via configfs' sysfs interface.
> > This could make UAF issue in below scenario:
> >
> > CPU0                                          CPU1
> > (sysfs enable)                                load module
> >                                                cscfg_load_config_sets()
> >                                                activate config. // sysfs
> >                                                (sys_active_cnt == 1)
> > ...
> > cscfg_csdev_enable_active_config()
> >    lock(csdev->cscfg_csdev_lock)
> >    // here load config activate by CPU1
> >    unlock(csdev->cscfg_csdev_lock)
> >
> >                                                deactivate config // sysfs
> >                                                (sys_activec_cnt == 0)
> >                                                cscfg_unload_config_sets()
> >                                                unload module
> >
> >    // access to config_desc which freed
> >    // while unloading module.
> >    cfs_csdev_enable_config
> >
> > To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
> > deactivate while there is enabled configuration.
>
> Thanks for the finding the problem and the detailed description + patch. I
> have some concerns on the fix, please find it below.
>
> >
>
>
> So we have 3 atomic counters now !
> cscfg_mgr->sys_active_cnt  // Global count
> config->active_cnt	   // Per config count,
>
> And another one which this one introduces.
>
> cscfg_mgr->sys_enable_cnt  // ?
>
>
> And config->active_cnt is always ever 0 or 1. i.e., it is not really a
> reference counter at the moment but it indicates whether it is active or
> not. Could  we not use that for tracking the references on the specific
> config ?
>
> i.e., every time we "enable_active_config" atomic_inc(config->active_cnt)
>
> and disable_active_config() always decrements the config. These could be
> wrapped in cscfg_get() cscfg_put() which would, inc/dec the refcounts
> and also drop the "module" reference when the active_cnt == 0

This action is done via _cscfg_activate_config() already but its
activation is done via "sysfs".
and the checking active_cnt, I think it would increase lots of complex.
because, if so, it should iterate all config in each csdev.
So, I believe it is the reason why the activation and module_cnt get via "sysfs"
to prevent iterating every config in csdev when config unload.

although, active_cnt in each config added to list in csdev be 0 or 1,
the module could be >= 1 (by sum of active_cnt which have the same
module owner). So I'm skeptical to use active_cnt like "reference cnt"
and That's why I decide to use "sys_enable_cnt"
>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> > from v1 to v2:
> >      - modify commit message.
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
> >   drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
> >   drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
> >   3 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 86893115df17..6218ef40acbc 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> >   	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> >
> >   	raw_spin_unlock(&drvdata->spinlock);
> > +
> > +	cscfg_csdev_disable_active_config(csdev);
>
> This looks like a separate "fix" from what you are trying to address. Please
> could split this ?

I don't think so, because without this calling, the "sys_enable_cnt"
never down, It makes error.

> Also, would like to hear what Mike has to say about this change.

IIRC, I followed his suggestion.

Thanks!


