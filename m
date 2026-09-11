Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4301DC88E42
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnNyIUKsorVAxqnwfpbUZwRMslljnk+vTb4CfKa2qOg=; b=L0xFQfVa2hhn3f+IJr0qIW1zrM
	47t4Vl6eg0Z54efAaw39A93OX4bpBYKAm4iCTSw7IyUoV3SfzB9IeL2S+0xL8ZszWOCaD+JTqPFd2
	91+QOTNrDL6hVM9Omi1IFpE+SvBN0ZZjWV1m7rzfEWkRj3x2/JQ3rnN4pH4kpF15CU4JLeqYyJsI+
	U8nMdgXqZjCdBbS+dKd1vls6GVwf67E+/MNKclCyrrLTlP2mwFPGL+AOsa8h92YapBjCp0Kfu/tQf
	VHQmMrBk1OyN7MyW4/Rr+a3S1SduJjaflqLkeAg5bdsXqtqMJxxVF0mbDET/s7dNsdipRZ9Y6+FuH
	zi7Uw+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4v0T-0000000FxdD-0nE7;
	Fri, 11 Sep 2026 06:45:05 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4v0P-0000000Fxc8-3P3T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:45:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SnNyIUKsorVAxqnwfpbUZwRMslljnk+vTb4CfKa2qOg=;
	b=Qx9AWqzdHat03JckLm3M8BwOru2v7x0iL94Pntu/72z8LkNpVGJ0CuQsvObLbQQZKy7qxI+f7
	POuCv4NaoAy2ApgQCxpmYgcqAwymFuufmDUhl++spML+a+SLlMEmg5rpQS//Ncrukr4XM5cLTau
	hBIxU4k/6aa13wBQtOpnpjM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hh4WT0hVGzRhQs;
	Fri, 11 Sep 2026 14:33:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4382940579;
	Fri, 11 Sep 2026 14:44:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 14:44:48 +0800
Message-ID: <7500ec7f-5e65-408c-a4ed-3f7af161219b@huawei.com>
Date: Fri, 11 Sep 2026 14:44:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/40] arm_mpam: Reset when feature configuration bit
 unset
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-3-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260313144617.3420416-3-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_234502_191342_A6ABB4D2 
X-CRM114-Status: GOOD (  22.91  )
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



在 2026/3/13 22:45, Ben Horgan 写道:
> To indicate that the configuration, of the controls used by resctrl, in a
> RIS need resetting to driver defaults the reset flags in mpam_config are
> set. However, these flags are only ever set temporarily at RIS scope in
> mpam_reset_ris() and hence mpam_cpu_online() will never reset these
> controls to default. As the hardware reset is unknown this leads to unknown
> configuration when the control values haven't been configured away from the
> defaults.
> 
> Use the policy that an unset feature configuration bit means reset. In this
> way the mpam_config in the component can encode that it should be in reset
> state and mpam_reprogram_msc() will reset controls as needed.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> This goes back to the initial feature configuration policy that James
> used in the MPAM base driver rfc but I unfortunately
> suggested him to change it.
> ---
>  drivers/resctrl/mpam_devices.c | 40 ++++++++++------------------------
>  1 file changed, 12 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 0fd6590a9b5c..ff861291bd4e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1364,17 +1364,15 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  		__mpam_intpart_sel(ris->ris_idx, partid, msc);
>  	}
>  
> -	if (mpam_has_feature(mpam_feat_cpor_part, rprops) &&
> -	    mpam_has_feature(mpam_feat_cpor_part, cfg)) {
> -		if (cfg->reset_cpbm)
> -			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
> -		else
> +	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
> +		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
>  			mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
> +		else
> +			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
>  	}
>  
> -	if (mpam_has_feature(mpam_feat_mbw_part, rprops) &&
> -	    mpam_has_feature(mpam_feat_mbw_part, cfg)) {
> -		if (cfg->reset_mbw_pbm)
> +	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
> +		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
>  			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);

This condition is written backwards, but it looks like it has already
been fixed later.

Otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		else
>  			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
> @@ -1384,16 +1382,14 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  	    mpam_has_feature(mpam_feat_mbw_min, cfg))
>  		mpam_write_partsel_reg(msc, MBW_MIN, 0);
>  
> -	if (mpam_has_feature(mpam_feat_mbw_max, rprops) &&
> -	    mpam_has_feature(mpam_feat_mbw_max, cfg)) {
> -		if (cfg->reset_mbw_max)
> -			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
> -		else
> +	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
> +		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
>  			mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
> +		else
> +			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
>  	}
>  
> -	if (mpam_has_feature(mpam_feat_mbw_prop, rprops) &&
> -	    mpam_has_feature(mpam_feat_mbw_prop, cfg))
> +	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
>  		mpam_write_partsel_reg(msc, MBW_PROP, 0);
>  
>  	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops))
> @@ -1491,16 +1487,6 @@ static int mpam_save_mbwu_state(void *arg)
>  	return 0;
>  }
>  
> -static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
> -{
> -	*reset_cfg = (struct mpam_config) {
> -		.reset_cpbm = true,
> -		.reset_mbw_pbm = true,
> -		.reset_mbw_max = true,
> -	};
> -	bitmap_fill(reset_cfg->features, MPAM_FEATURE_LAST);
> -}
> -
>  /*
>   * Called via smp_call_on_cpu() to prevent migration, while still being
>   * pre-emptible. Caller must hold mpam_srcu.
> @@ -1508,14 +1494,12 @@ static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
>  static int mpam_reset_ris(void *arg)
>  {
>  	u16 partid, partid_max;
> -	struct mpam_config reset_cfg;
> +	struct mpam_config reset_cfg = {};
>  	struct mpam_msc_ris *ris = arg;
>  
>  	if (ris->in_reset_state)
>  		return 0;
>  
> -	mpam_init_reset_cfg(&reset_cfg);
> -
>  	spin_lock(&partid_max_lock);
>  	partid_max = mpam_partid_max;
>  	spin_unlock(&partid_max_lock);


