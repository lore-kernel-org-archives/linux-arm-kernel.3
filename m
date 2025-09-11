Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78169CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHMz6Kp8+8ke0b9ysF+VPQCLrGT1erkZZlyHZ6AOm00=; b=H1GCxdA1wq1tKtyLD0rrug+9hi
	iBP1K+drEWHV/lsf7M5WTzseeEqEPL6+y0rn6dEFNDeN+4S2t16aMOwHC26xhzPdiO1HnSn3S92eE
	wtWZpvPMUOgqRXS7Zjg/DGOUTLhGWJN3g80RcsYPACIp4A4gmy5Wnb4IwcRPKhR4QV3YwofIK2fnV
	XfbuhnhCrXePcpAyq7yIK+ukgl6CVfUyl+2YZMmqp28vk7yhTPn6KX+2Nh/lq2YyXzUzT1SPH0J9O
	WpBthzAyoN8vYCjZtluAIfuulel/170JOD2EbnVAIrB/8qOaSe28vH8PhN9ND8oi7+BeGcjhqWNZK
	3K5I1v7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjFR-00000003u8Y-0Mp7;
	Thu, 11 Sep 2025 15:30:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjFN-00000003u5W-02Vz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:30:07 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cN1bY2hPnz6L5cG;
	Thu, 11 Sep 2025 23:25:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C82E1402FF;
	Thu, 11 Sep 2025 23:29:59 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 11 Sep
 2025 17:29:57 +0200
Date: Thu, 11 Sep 2025 16:29:56 +0100
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
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 13/29] arm_mpam: Probe the hardware features resctrl
 supports
Message-ID: <20250911162956.00005157@huawei.com>
In-Reply-To: <20250910204309.20751-14-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-14-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_083005_353363_B0C793B2 
X-CRM114-Status: GOOD (  17.16  )
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

On Wed, 10 Sep 2025 20:42:53 +0000
James Morse <james.morse@arm.com> wrote:

> Expand the probing support with the control and monitor types
> we can use with resctrl.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>

A few trivial things inline.
LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Out of time for today, fingers crossed I can get to the others tomorrow.

J
>  static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  {
>  	u64 idr;
> @@ -592,6 +736,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  	mutex_lock(&msc->part_sel_lock);
>  	idr = mpam_msc_read_idr(msc);
>  	mutex_unlock(&msc->part_sel_lock);
> +
Stray change  - push it to earlier patch.

>  	msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
>  
>  	/* Use these values so partid/pmg always starts with a valid value */
> @@ -614,6 +759,12 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  		mutex_unlock(&mpam_list_lock);
>  		if (IS_ERR(ris))
>  			return PTR_ERR(ris);
> +		ris->idr = idr;
> +
> +		mutex_lock(&msc->part_sel_lock);
> +		__mpam_part_sel(ris_idx, 0, msc);
> +		mpam_ris_hw_probe(ris);
> +		mutex_unlock(&msc->part_sel_lock);
>  	}
>  
>  	spin_lock(&partid_max_lock);
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 4cc44d4e21c4..5ae5d4eee8ec 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -112,6 +112,55 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>  	raw_spin_lock_init(&msc->_mon_sel_lock);
>  }
>  
> +/*
> + * When we compact the supported features, we don't care what they are.
> + * Storing them as a bitmap makes life easy.
> + */
> +typedef u16 mpam_features_t;

Maybe use a bitmap type and avoid the need to be careful on sizing etc?

> +
> +/* Bits for mpam_features_t */
> +enum mpam_device_features {
> +	mpam_feat_ccap_part = 0,
> +	mpam_feat_cpor_part,
> +	mpam_feat_mbw_part,
> +	mpam_feat_mbw_min,
> +	mpam_feat_mbw_max,
> +	mpam_feat_mbw_prop,
> +	mpam_feat_msmon,
> +	mpam_feat_msmon_csu,
> +	mpam_feat_msmon_csu_capture,
> +	mpam_feat_msmon_csu_hw_nrdy,
> +	mpam_feat_msmon_mbwu,
> +	mpam_feat_msmon_mbwu_capture,
> +	mpam_feat_msmon_mbwu_rwbw,
> +	mpam_feat_msmon_mbwu_hw_nrdy,
> +	mpam_feat_msmon_capt,
> +	MPAM_FEATURE_LAST,

If it's always meant to be LAST, I'd drop the trailing comma.

> +};
> +static_assert(BITS_PER_TYPE(mpam_features_t) >= MPAM_FEATURE_LAST);




