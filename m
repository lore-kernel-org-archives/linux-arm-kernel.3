Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AADFCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzMWaxY3+xdB7M/N9E6Bz6G/YiCyCQxLEc4ORzcnXCg=; b=Js+O+wCOlN0Aqix/ca5rj+xVYP
	lZtDHzh9+TJ8ZS14OGzdcXaEINtLgANfG4zrXIto2Nmnb4wbPtL+Roa7VcxpWT6X3u55C5iJlynOY
	8GrusJGHj/xcW7QLw06V/EPBVa/AXFjSbxrlXivtIUqH8NG01fbYBk0YRkNVNU6x6cKc3kghskNQA
	5wumLbTMtNSNT5VxWZdT6P0PADM1Tkf79+ImbEOUadF1OlzNF7I9PUCjoqu5VY3AJjuwL6QtzwMfX
	3XH/rLawLrmQoauYxxxpERMJEB7At1IpDpUh9nn8J6AuWzZmUVH7JwSiWzTcrwSl2mxvYHF4GBWNl
	2bd2R3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURjF-0000000DPh9-1zMi;
	Tue, 02 Jun 2026 16:12:33 +0000
Received: from mail-westus2azon11010050.outbound.protection.outlook.com ([52.101.46.50] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURjC-0000000DPgV-2c3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozhL5IYSD/simmzgi9cQAdURutKfMfAJGAzCV9VMAboL2PymvQQBPuefeltiqQHfYSwkCTpAZGp/kLbFYGzPscvBfGILoLpMU0amEsOgyH9SB2rzrG2Rgcvgj6o+/85bNv3ZxpcKx+ye/8z8VACLMcppBrbF6o1owqLOSGzBIcu3pHvht+9p/sM1MVND4EmuIG3Jv6pjw6JySyskZf4hcmifGDTwwxzc284y1dc4xse7p1U3x2f6LJQw2WvRaItIqTPFu+4w716aN79qAV9NYXoJ2/S4UmujazK+uonpc9WFXyuaYDbH34asUtLJDaWJPTzqn5PUuTUVsL2v5CKgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzMWaxY3+xdB7M/N9E6Bz6G/YiCyCQxLEc4ORzcnXCg=;
 b=wfZSi5wbwcBh8O0EkaBjyPY5dYdI1BGBThTLRkABVTVHwpI0JEkMZ5LU6i9kftiQa1YiKG32K64O5RWkVxDDDqI1GOSx4wsQR1pFFVQV6WaCdzeM9RizM9FVvjV1X1hZRhz3R9KUCVT7f/tfQIN4zuFxu8HyutxqMnQpu7UX2Q9BTuaRXfv75ThY7NqIaB/x7XEckg57Mfo3rA5ofk5cbmJpw5ySPMeXScoi+WoP0BDWQOzzZyymdWQ1oj/gGY3dpYsPLf4ygxjOo3TKcVKo45EEvVat4Z1wMsEgCVpCzvPiphhj2mLRTxocWC9/SVFNKDwRnuLRlkjtpHqQ1d2C0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzMWaxY3+xdB7M/N9E6Bz6G/YiCyCQxLEc4ORzcnXCg=;
 b=aDzNZ/fp1lHl7u5Jwy8Q6lXdwXscMGvHpskW6u59TH4fpvUh+OArWB7u1Pm+u3U5YS/hNG+Os+DYuWrIshZgqW8cXKy8bV83gqVL8ThpxiKWQ03Vd7C0//xcGsQn8ny7lrTnaUoehn18IDjlFZIVoyVbXp4hpRt4yzsTj0pHN6VgtwLiN5P/8SxZrlwcCnLSgMp3udt8w8dIr2u+FHhyxQVgLuZvCI3GRV/zxqwppartUu38EzZiBxP8Ttw852QxHEw3GobBwDweE4hiFESSIQu4/xKAvvG+WOWWsiH2Pio4C5xk7jzLGMgMR1jWOh52iOfKx/emqa3TqFFuHaNBfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by BN5PR12MB9485.namprd12.prod.outlook.com (2603:10b6:408:2a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:12:24 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 16:12:24 +0000
Date: Tue, 2 Jun 2026 11:12:03 -0500
From: Seth Forshee <sforshee@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Honor maximum RX/TX buffer size
Message-ID: <ah8A05Mt9W1yZjFW@omni-lfn-logwh>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
 <20260602-grateful-elfish-elk-413154@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-grateful-elfish-elk-413154@sudeepholla>
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|BN5PR12MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e794cb8-bfac-4c1d-7ca3-08dec0c1bb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|5023799004|4143699003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Yg2zp3JkoB7CRLTHFBiq4C3bZH6GspOccOMahcDE6Q+2ml2Qm8EXMKEjcrQ5VxnSqmCV/oC4WKrVrePbgABOys8G2C9NhHjfkoJxsrXEyARuwX3/BKs7Eh4kl4wLlzFZB1ByR62n3CGH1qnVdmmgjV5W/W66Z514gkJqSszGgAb2r8XNoTtys68FDYjI3ALaKlLeHddSdygB3r8AEEiIkgaYj3I9Ududqe1E3hPpNH9cV1SbTK3Akk1XiL9L69xnOtPPnkVBCoYsZGhWimHi7ELoAUyx23fBI0F0wNftcUmjyCiLNCJREAZEI7iGgH1aD5jbTxUfdHKY6INOTBQHg0pVTBHe4rsCvB5i31w0pTc3NpWKTIH4bpFKIsgUApxNLQl4ic2MCAsbbmJZq5dEZoJzIZ0X0Tvzy2vlEKlG/nthFFB0q83FJvG0BLhp/kZlUWAbA0JY8TGEEORCBl8CIT/oJWrlF63fqZBNa+PmT1AvnhO9/iqwRmtVOMolEGDaJJY2E6nPNbkOt/5UIwFWhCu6itMeMZrXvmYTeSlV+7YxLr2vxgWUai8cTuTSUkqJ6cZa7a97z/YuZJ9/GVGbufsjJSEUpTHUZFUEOdXMnuIadSJUvvykIH6ccSSeNCXv/bl/XdalYSA814S+K/lSjrV1U5RInFg2wwXQ7E0fHztHtM0AzN1Dl+O3leLRYAKP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(5023799004)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UIuhOaQU1wvT1s3AhlGbhKSU2BJH5Do0ocUBZQRkK5jiCId21/NiQoGyoEBm?=
 =?us-ascii?Q?aHWg5HhXQxqS4tYBHlj59Xy7KrEVga1cILfysv2fP9CrQds1KMZA3vDYrjCl?=
 =?us-ascii?Q?/RF8MjEgrTVD2bVDvJGYZF1BCfqhx2MxI5tJUXf8x+map56aB7oRQZGOPNkB?=
 =?us-ascii?Q?bG0lGChtwR114dG+RN6KboQBcps4Jg820QrUjIAiyXi64eg9LDrjEvdDjYoQ?=
 =?us-ascii?Q?2U5uyNGT4zBIYQdctvj/Bk7U5Lpxcc8eClM8ZZekUBQfmYNsx7WY2niT3DBc?=
 =?us-ascii?Q?9bg0gvFAIIzTGPquC1zjlEEqyC3xYeZpVOGjqWnTbOwLKzSHR3bEsd/9bFP3?=
 =?us-ascii?Q?7kiBuV1499RVWIZ7C536Dj4Yek8acHV7sqsOr+yc/ULExgnHJkp750wBsTrl?=
 =?us-ascii?Q?iUDLzWZiFRFAgho3Lm4KMPzihFCtBGH9uykRIOC3XcB33tPYzOI+4s9hhGO9?=
 =?us-ascii?Q?4yIpPyCCdU9dEtRc9CoKUkkiXrPJ7wJotvQ7E/b9W3tdKzvROhLLgd+o65eu?=
 =?us-ascii?Q?jCXRhYdZ3VZozDwVWeTWRzYw+jNRdXeXFHUMPinNvdO2y56kbLVEA0G1F143?=
 =?us-ascii?Q?lda99XgudyoF2FW8be/h6ml25DOOsblNxDFe+KYlkMukXWACrT/2Di5oLnfO?=
 =?us-ascii?Q?65syUwz0Yym/WdI6fs9+mM2+N79BdtezPP/KhTa6MpFX87qOUIEty22DplyR?=
 =?us-ascii?Q?kUaOfF5J9AC9xemik5mEO/zQEETEYRraINTn44kBIMRJ/2BkJtwvUK6CKUK1?=
 =?us-ascii?Q?uI6pqVmf3hqJPFZTORXn9Zk/LY/mM3MY8Nw0i7C7EBd8twlNtFCuwwTAg0RE?=
 =?us-ascii?Q?5Lp4Mzh3psqr1Gt0NsCnqriWyUD9Ln62T1XiHbu095vsHknsgTh22T/g0RsP?=
 =?us-ascii?Q?6Uv0CrT6ixCNdt0Cgi/laLQ4ozyTcYSiqU/QV1CgrJg/GqvhBfWs62Ktn3zL?=
 =?us-ascii?Q?cc76ql2Fw/VkxP0xiZhZchAJuYUJ3UNa8hfTxEuIRbNC2b0M/3cYCTpl4yzT?=
 =?us-ascii?Q?5/YUpfNEFUisF6fG84LR1Er/0sXfRvpocBxz90aZTI0Y87DDx/GuP3ldlmEt?=
 =?us-ascii?Q?TKVyxTKKiRJf8OzD/BfAFiIsjaTBX1ceZJpm8P6ckc0UBilhVv4yq0XOEaS9?=
 =?us-ascii?Q?1dur24aNAsyfpS6d+iC+EZVuj8gJ4mGrY/uPCnbKX+6sG2GnE4rO8vJqPe/c?=
 =?us-ascii?Q?6IrcAc/Rm7NnpQHYqtZwQWlc/7g9GBV8m6O4NnCN4rycTcM5QLie6E50cVyw?=
 =?us-ascii?Q?dhu6ZkLP+AkIVfVzyeHbeaWbGkTSIOaTcuF23G47PuaaFsWBg8f0qdKizH3d?=
 =?us-ascii?Q?cS9Wd3j4tXpGyD4ZHKevSSdh/AoVmwf8nefpklEe78VPUu8nIP1kOnBZHf7u?=
 =?us-ascii?Q?ruzd4qBBr0PTyOidP9G0SNnhZ1XnPviY7TSFsCsExVg7Cmd8mTmVmkGz6g0N?=
 =?us-ascii?Q?hgxu4/vzDqa+jrxDPkBlH5JZZ3tJVWoOgDhiupIv47by0x2OpFAPDfaSR+35?=
 =?us-ascii?Q?yAh/K4M1+7hYkgsFdJpLq32K+t5IPHWSyowi6AwaqESKRgtzcVPsZC7bpQYz?=
 =?us-ascii?Q?CSL54UroRgmZMvbbPjhpQ6F4wvPPDhOw7GgXFyp63MjkWI9UO+NP2jIweoM2?=
 =?us-ascii?Q?1hIOVZP7+GJTub7XKoXX30X32lVepbEew23DZpLcrYjCAenAf17mz0vfv2cB?=
 =?us-ascii?Q?TDWvgdvShfvkmgYrpQSBPBZMRiU7DlNFnhaVz97NM28TFlaaXER+C9chD6ko?=
 =?us-ascii?Q?tACTs6HYcA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e794cb8-bfac-4c1d-7ca3-08dec0c1bb88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:12:24.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loUD/4nVL01ZAzxYoarbOzheIrv6HDPiIF9zIhECmQ797rl8a0ZxFlDEnbAsWNpW0eilqdc793slCPLw2oTr6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_091230_671138_5F30AE6A 
X-CRM114-Status: GOOD (  33.77  )
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

On Tue, Jun 02, 2026 at 04:56:48PM +0100, Sudeep Holla wrote:
> On Mon, Jun 01, 2026 at 03:45:11PM -0500, Seth Forshee wrote:
> > FFA_FEATURES in v1.2+ supports a maximum RXTX_MAP size. This maximum
> > size is not checked when page-aligning the RX/TX buffer size, and
> > FFA_RXTX_MAP may fail when passed a size greater than the maximum.
> > 
> > Decode the maximum buffer size returned from FFA_FEATURES and limit the
> > buffer size based on this value if it is non-zero (zero indicates no
> > maximum). Include verification that the max returned by the SPMC is
> > larger than the minimum, otherwise use the minimum.
> > 
> > While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
> > consistency.
> > 
> > Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> > ---
> >  drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index b9f17fda7243..dc45724a29ba 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/mm.h>
> >  #include <linux/mutex.h>
> > @@ -55,7 +56,9 @@
> >  	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
> >  
> >  #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
> > -#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
> > +#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
> > +#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
> > +#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
> >  
> >  #define FFA_MAX_NOTIFICATIONS		64
> >  
> > @@ -2086,11 +2089,13 @@ static void ffa_notifications_setup(void)
> >  	ffa_notifications_cleanup();
> >  }
> >  
> > +#define FFA_SUPPORTS_RXTX_MAX_BUFSZ(version)	((version) > FFA_VERSION_1_1)
> > +
> >  static int __init ffa_init(void)
> >  {
> >  	int ret;
> >  	u32 buf_sz;
> > -	size_t rxtx_bufsz = SZ_4K;
> > +	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
> >  
> >  	ret = ffa_transport_init(&invoke_ffa_fn);
> >  	if (ret)
> > @@ -2118,9 +2123,29 @@ static int __init ffa_init(void)
> >  			rxtx_bufsz = SZ_16K;
> >  		else
> >  			rxtx_bufsz = SZ_4K;
> > +
> > +		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {
> 
> This is not even compile tested ? I don't think this is defined anyway.
> Anyways I don't think we need this condition as v1.1 or below had it
> MBZ, so it is fine to drop it.

It is added just above ffa_init(). The code as been compile and run
tested on multiple platforms, as noted in the cover letter.

I hadn't checked older spec versions, so if they have it as MBZ then I
agree we can drop the check.

> 
> > +			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
> 
> The cast is unnecessary, its is 16 bit, so max 0xFFFF << 12.

Correct, though linters complain about it which is why I added it. I can
drop it though if you prefer.

> 
> 
> > +			if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_bufsz) {
> > +				/*
> > +				 * Per spec the maximum must be >= the minimum, or
> > +				 * else zero if there is no size limit. If the SPMC
> > +				 * violates this constraint, use the minimum as the
> > +				 * effective maximum.
> > +				 */
> 
> I don't see any text implying the above from the spec, drop it. Please point
> it to me if you find. Even otherwise it seems obvious here and doesn't need
> the note.

I found it in v1.3 of the spec in Table 13.15: "Size must be greater or
equal to the minimum buffer size, else MBZ if there is no size limit." I
will remove the comment.

Thanks,
Seth

