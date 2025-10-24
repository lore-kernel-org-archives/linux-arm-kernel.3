Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CECCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eFh/avHhstYhgrnUCtrqBEG0Y1fzzQrwFde9zNZ83k=; b=FQB59Oulmjf5IgXzODCZ9I6+nJ
	fsekwBuc6IM5JPTs37teAdhR1am5kzk/GEOcf0i6z7+5/XaaVONultUPBBc/FxmsHCyUDf5KH3sqJ
	HzoSJcEp8m8eRI2uPoZCH/Ea+ZeDhOaX7XkB8bRZqjthZ5f56XsZgBm9CHtvC0qWATybEPC974BW3
	tnSre2sREzeEM/JPFpad+OKqJs+3TFgjpC4fte2MKS4linvT4/SrNzWNSVmVC7/+SaGZX4Dz+zm3T
	xBs78ZSLq3F+CVE/Z46rqTIA854gjs+1cPFpPPgVhmassXQiAxinIfr5sjji6S2EEaiAQvL5DxMdL
	oEl/f6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMYB-0000000AH3z-2lSb;
	Fri, 24 Oct 2025 18:30:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMY9-0000000AH3W-0QQO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:30:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctWZT4jLXz6GD6Y;
	Sat, 25 Oct 2025 02:26:41 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 982EB140276;
	Sat, 25 Oct 2025 02:30:00 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 19:29:59 +0100
Date: Fri, 24 Oct 2025 19:29:57 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 26/29] arm_mpam: Use long MBWU counters if supported
Message-ID: <20251024192957.00000d55@huawei.com>
In-Reply-To: <20251017185645.26604-27-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-27-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_113005_433055_CC463AE4 
X-CRM114-Status: GOOD (  19.09  )
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

On Fri, 17 Oct 2025 18:56:42 +0000
James Morse <james.morse@arm.com> wrote:

> From: Rohit Mathew <rohit.mathew@arm.com>
> 
> Now that the larger counter sizes are probed, make use of them.
> 
> Callers of mpam_msmon_read() may not know (or care!) about the different
> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
> driver pick the counter to use.
> 
> Only 32bit accesses to the MSC are required to be supported by the
> spec, but these registers are 64bits. The lower half may overflow
> into the higher half between two 32bit reads. To avoid this, use
> a helper that reads the top half multiple times to check for overflow.
> 
> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> [morse: merged multiple patches from Rohit, added explicit counter selection ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>

A few tiny things on a fresh look.

> +static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
> +{
> +	int retry = 3;
> +	u32 mbwu_l_low;
> +	u64 mbwu_l_high1, mbwu_l_high2;
> +
> +	mpam_mon_sel_lock_held(msc);
> +
> +	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> +	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> +
> +	mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
> +	do {
> +		mbwu_l_high1 = mbwu_l_high2;
> +		mbwu_l_low = __mpam_read_reg(msc, MSMON_MBWU_L);
> +		mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
> +
> +		retry--;
> +	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);

Just carrying on if it tore repeatedly without screaming seems unwise...
I can't see it actually happening more than once but still seems like
we'd want to know if it did.

> +
> +	if (mbwu_l_high1 == mbwu_l_high2)
> +		return (mbwu_l_high1 << 32) | mbwu_l_low;
> +	return MSMON___NRDY_L;
> +}

>  static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
> @@ -978,10 +1027,15 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>  		mpam_write_monsel_reg(msc, CSU, 0);
>  		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>  		break;
> -	case mpam_feat_msmon_mbwu:
> +	case mpam_feat_msmon_mbwu_44counter:
> +	case mpam_feat_msmon_mbwu_63counter:
> +		mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
> +		fallthrough;
> +	case mpam_feat_msmon_mbwu_31counter:
>  		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>  		mpam_write_monsel_reg(msc, MBWU, 0);
> +
Stray change to clean up (push to original patch).
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>  
>  		mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
> @@ -993,10 +1047,19 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>  	}
>  }


