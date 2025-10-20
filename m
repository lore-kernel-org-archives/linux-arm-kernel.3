Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522DDCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaJPYdzmdjqE8tfjnQoBnFkN3+gQ9iqo9/ICpUWGNSc=; b=XhpcdSrc5UU+5M+GSrECLGyUzN
	Xd2qcIIiFHmfSiPvZjB8uq3xE98dwUF1lqhj3S43wCZvtDJ65HZtGXqN8skzpC3a8vMGU6CYHFvLb
	fQk31CwR3nALVH0MUODT75MZDhsDnEE0EaIl887ZJYmNuvtEx0S+erzKxGxEXPbuZXf75OyJR0BeJ
	exN4TtYx3x8Tmo6vbdyZfCP2vAahfkDcc1gqZqnor/Z3K6NDNy8J9IqDPmkUaw4zLmvEktjykdUQl
	Nv+yku3ha2srf6ZiVmx4Vp9tkBiC3uNQZHBHWc2oc6op1zd6YpfvD99K0FNjhhVkbgRLeyQzK9haj
	SHiJT+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtVO-0000000ESgs-2qxr;
	Mon, 20 Oct 2025 17:17:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtVL-0000000ESgT-3qwY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E254F1007;
	Mon, 20 Oct 2025 10:16:57 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 564BC3F66E;
	Mon, 20 Oct 2025 10:17:00 -0700 (PDT)
Message-ID: <1e48c5ac-d409-47ba-ab59-78a8710d2d15@arm.com>
Date: Mon, 20 Oct 2025 18:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/29] arm_mpam: Probe and reset the rest of the
 features
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-22-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251017185645.26604-22-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_101708_088885_AD13301B 
X-CRM114-Status: GOOD (  16.37  )
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

Hi James,

On 10/17/25 19:56, James Morse wrote:
> MPAM supports more features than are going to be exposed to resctrl.
> For partid other than 0, the reset values of these controls isn't
> known.
> 
> Discover the rest of the features so they can be reset to avoid any
> side effects when resctrl is in use.
> 
> PARTID narrowing allows MSC/RIS to support less configuration space than
> is usable. If this feature is found on a class of device we are likely
> to use, then reduce the partid_max to make it usable. This allows us
> to map a PARTID to itself.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> CC: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v2:
>  * Moved some enum definitions in here.
>  * Whitespace.
> 
[...]
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 2f2a7369107b..00edee9ebc6c 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -139,16 +139,30 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>  
>  /* Bits for mpam features bitmaps */
>  enum mpam_device_features {
> -	mpam_feat_cpor_part = 0,

Any reason this one doesn't stay first?

> +	mpam_feat_cmax_softlim,
> +	mpam_feat_cmax_cmax,
> +	mpam_feat_cmax_cmin,
> +	mpam_feat_cmax_cassoc,
> +	mpam_feat_cpor_part,
>  	mpam_feat_mbw_part,
>  	mpam_feat_mbw_min,
>  	mpam_feat_mbw_max,
> +	mpam_feat_mbw_prop,
> +	mpam_feat_intpri_part,
> +	mpam_feat_intpri_part_0_low,
> +	mpam_feat_dspri_part,
> +	mpam_feat_dspri_part_0_low,
>  	mpam_feat_msmon,
>  	mpam_feat_msmon_csu,
> +	mpam_feat_msmon_csu_capture,
> +	mpam_feat_msmon_csu_xcl,
>  	mpam_feat_msmon_csu_hw_nrdy,
>  	mpam_feat_msmon_mbwu,
> +	mpam_feat_msmon_mbwu_capture,
> +	mpam_feat_msmon_mbwu_rwbw,
>  	mpam_feat_msmon_mbwu_hw_nrdy,
> -	MPAM_FEATURE_LAST
> +	mpam_feat_partid_nrw,
> +	MPAM_FEATURE_LAST,

nit: drop the trailing , from MPAM_FEATURE_LAST. It confuses the diff.

>  };
>  


-- 
Thanks,

Ben


