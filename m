Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B4ACDC167
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fKVAQBERFOA//PZ4aLCRRcuxr+1+EQ7RSZ5IAh/cmM=; b=G2SbzaCAuXKcd93LuIxtLlyJpB
	qU7La/xkEF/5Pf6Kiog40kmBzQu8kCblLhRxV0BXMwCgHv3WO3zQevkiZICmwVs7thOlniVfIkUm8
	Wtrtq7PW7V3dnLr4kaeAWoxUnopq1lagtcqByBBiGIYpnBRXRHEggTsfeG87gHG/MrFejlvIJVxuw
	iYoXlZiJTKwhw4mChjlkKfVPBNtcAqR0/6sVqzFqwU+b5xE9cZMkElW2Y09xVXnZrgX7casxWoG8X
	BwWlVHpD27C0eEEMOB2b/36zLbtnXt0LQAxN3tCsjjcPfbvG1uEB99VmutYN1UlG48ZfEVrfHmdlW
	YKGXeG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5f3-0000000CveQ-1l24;
	Tue, 06 Jan 2026 11:55:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5ex-0000000Cvdw-1Kgn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:55:38 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlqNp3LmBzHnHBb;
	Tue,  6 Jan 2026 19:55:22 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8ED2040539;
	Tue,  6 Jan 2026 19:55:26 +0800 (CST)
Received: from localhost (10.48.155.65) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 11:55:25 +0000
Date: Tue, 6 Jan 2026 11:55:23 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 24/45] arm_mpam: resctrl: Convert to/from MPAMs
 fixed-point formats
Message-ID: <20260106115523.00003a86@huawei.com>
In-Reply-To: <20251219181147.3404071-25-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-25-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.155.65]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035536_345682_C17DDC02 
X-CRM114-Status: GOOD (  25.35  )
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

On Fri, 19 Dec 2025 18:11:26 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: Dave Martin <Dave.Martin@arm.com>
> 
> MPAM uses a fixed-point formats for some hardware controls.  Resctrl
> provides the bandwidth controls as a percentage. Add helpers to convert
> between these.
> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Perhaps it's just me, but I found this hard to check mostly because
of the spec being very light when describing this (that I could
find, maybe there is more somewhere else).

So whilst I'll give a tag, I'd like ideally a little more documentation,
particularly around the oddity of the left aligned field and max value
of bwa_wd being 16.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/resctrl/mpam_resctrl.c | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index bdbc5504964b..a20656e49edc 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -10,6 +10,7 @@
>  #include <linux/errno.h>
>  #include <linux/limits.h>
>  #include <linux/list.h>
> +#include <linux/math.h>
>  #include <linux/printk.h>
>  #include <linux/rculist.h>
>  #include <linux/resctrl.h>
> @@ -246,6 +247,46 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
>  	return class->props.cpbm_wd <= 32;
>  }
>  
> +/*
> + * Each fixed-point hardware value architecturally represents a range
> + * of values: the full range 0% - 100% is split contiguously into
> + * (1 << cprops->bwa_wd) equal bands.

This bit of the spec is really confusing.  I particularly like
BWA_WD being 6 bits but only allowed to take values up to 16. That took
me a while to spot as I couldn't work out what this was supposed to do if that
was 32.

Anyhow this is a request for a bit more documentation for this function such
as explaining the field is left aligned to bit 16.


> + * Find the nearest percentage value to the upper bound of the selected band:
> + */
> +static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
> +{
> +	u32 val = mbw_max;
> +
> +	val >>= 16 - cprops->bwa_wd;
> +	val += 1;
> +	val *= MAX_MBA_BW;
> +	val = DIV_ROUND_CLOSEST(val, 1 << cprops->bwa_wd);
> +
> +	return val;
> +}
> +
> +/*
> + * Find the band whose upper bound is closest to the specified percentage.
> + *
> + * A round-to-nearest policy is followed here as a balanced compromise
> + * between unexpected under-commit of the resource (where the total of
> + * a set of resource allocations after conversion is less than the
> + * expected total, due to rounding of the individual converted
> + * percentages) and over-commit (where the total of the converted
> + * allocations is greater than expected).
> + */
> +static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
> +{
> +	u32 val = pc;
> +
> +	val <<= cprops->bwa_wd;
> +	val = DIV_ROUND_CLOSEST(val, MAX_MBA_BW);
> +	val = max(val, 1) - 1;
> +	val <<= 16 - cprops->bwa_wd;
> +
> +	return val;
> +}
> +
>  /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>  static void mpam_resctrl_pick_caches(void)
>  {


