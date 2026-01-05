Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9D7C79FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWbFandwhjtSbyvtocIFtukbfCRsS2znyNekCCFMmE8=; b=DDkv/ym2mHWYKCrrj7uS0kC5C6
	HXFMcHBUlPapGlhI+4rN9Vkvtq1vPagjBoAxg78/KpJe0V6ROaY7Cb51FEfltfZF1+PUt5kSTsjum
	N9GW1+dVcJN6YUcy65VH3tPNYL9LPnBtYM4d6yeihu0e08GZuSEKtNVqakv0rfcSyVMnViYmoxaWw
	bXvT0onc0P+xCIO5TyUpcl1ufZ94Di9u+qEe2pc6bga/N+GgSqLYlkF315ZdnwE0GxmYGfvlZEDGn
	7KtFKCI4aWYNLeNJj4Pt5kIcQ8DGcdcmNr8F1tXVLy79mAXLWnYbWAtJABHwW7ViKm/V9SMRvOqel
	BWd+Ihgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcofA-0000000Bron-2713;
	Mon, 05 Jan 2026 17:46:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcof7-0000000Brny-2vOv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:46:38 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlMDV6BWjzJ46CZ;
	Tue,  6 Jan 2026 01:46:34 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2405D40086;
	Tue,  6 Jan 2026 01:46:35 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 17:46:33 +0000
Date: Mon, 5 Jan 2026 17:46:31 +0000
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
Subject: Re: [PATCH v2 17/45] arm_mpam: resctrl: Pick the caches we will use
 as resctrl resources
Message-ID: <20260105174631.000043f3@huawei.com>
In-Reply-To: <20251219181147.3404071-18-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-18-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_094637_910280_72A15862 
X-CRM114-Status: GOOD (  15.73  )
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

On Fri, 19 Dec 2025 18:11:19 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> Systems with MPAM support may have a variety of control types at any point
> of their system layout. We can only expose certain types of control, and
> only if they exist at particular locations.
> 
> Start with the well-known caches. These have to be depth 2 or 3 and support
> MPAM's cache portion bitmap controls, with a number of portions fewer than
> resctrl's limit.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Note that I'm far from familiar with all the details of the resctl side
of things so assuming that will be well covered by other reviewers!

Jonathan

> ---
> Changes since rfc:
> Jonathan:
> Remove brackets
> Compress debug message
> Use temp var, r
> ---
>  drivers/resctrl/mpam_resctrl.c | 90 +++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5481d9cc69d9..bc4f1c80eab5 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -60,10 +60,95 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
>  	return &mpam_resctrl_controls[l].resctrl_res;
>  }
>  
> +static bool cache_has_usable_cpor(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_cpor_part, cprops))
> +		return false;
> +
> +	/* resctrl uses u32 for all bitmap configurations */
> +	return class->props.cpbm_wd <= 32;
> +}



