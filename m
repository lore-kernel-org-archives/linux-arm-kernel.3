Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4327CF532D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj+l02fs/8pSOJGRhQFKItCXssbRz0B4Wg+/KENQ0kM=; b=C30DMvHUOXD7YitI+YLtHeqv5P
	xiXwQJGR1+5US27l7X+A5/5eY+tkn+lHA+24UL8zeXiMkuspnMGJX15R/bYpWbzOOpUataEAgSSDK
	nrBRrloAG5aNU60EchwIKJA09LHy7DTy/KGgJsdwemOxCLXUNa2tuenxxtuoP14ifbEs8YwlRnWO7
	1m3UsVrXKTzHutnAkyHOhKVqhg40yDQxlWT0DWWthqgCVtJYSuZx5en8a/lkB1ikpVRxY3kIjnVjO
	oQCKNYjzK9xYD7dy0vFUufPJDXpTthn65TQJLFv5nuV7GnCC5lgdQAbGvl9yQj97mdibx7tufeQo+
	52aAiW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4stN-00000000WHw-3o8b;
	Tue, 24 Mar 2026 03:57:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4stK-00000000WHS-3dYP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774324637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vj+l02fs/8pSOJGRhQFKItCXssbRz0B4Wg+/KENQ0kM=;
	b=IVSlB8hJlesTNGoM3O0GrUdIks+XpEsb9SCRRReS/o1NeRpf6jsfgJVyPhHDlYNNDYF27Z
	8Id1JQnoTiUqbbtx8vXYwOleIYWqYPUj5BsWOP2qS8aQ3UALh1OH17+43ak+sTRm+JRGDZ
	QM/NQ5ksUI3BWVYmyEABS6N5BQUq5MQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-akOaN0IGNCebaW3M8NPUzg-1; Mon, 23 Mar 2026 23:57:14 -0400
X-MC-Unique: akOaN0IGNCebaW3M8NPUzg-1
X-Mimecast-MFC-AGG-ID: akOaN0IGNCebaW3M8NPUzg_1774324633
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec07e8aafso13606885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774324633; x=1774929433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vj+l02fs/8pSOJGRhQFKItCXssbRz0B4Wg+/KENQ0kM=;
        b=W0G/3FLK8bl/9NL5XYBQzLm+crUDRttVXysu7kJSMpeEgPBh9W0NQjc35YL2pTL7WX
         d002EHzJ48DvDzHcqYhgyMGnQxR2KrLNWQ76s5jqJE3xtKLurmEtiFt0pW6CPJ6pKOQK
         uNXATgWqVtKiNb8NPaf7Lfp4G8wsAI9hM6/jg1tXmBA2uGbFBAMZkfe4FW0Psy82HAtq
         Yk8DCRH8hZJmHDRqvym6qG3ruhk5J+6+APJG9hscNL3vOoBgzfGjbtz2aBaOtYVRLp7E
         JF2A0wf/Q3z9clh1yMa9PLUq/WhUtY7EMyWu3aW/FUEhadi9pE9VskA4Eje+4a5rZba+
         qYKw==
X-Forwarded-Encrypted: i=1; AJvYcCVy9KrXQb1KNkCnrIVcFNdnmRiWXKs85FZQPPRmuG2/WGy0fGL+TzOU7sGiWjMBzQAfqaeqgN2RlAqX3QZYhTWN@lists.infradead.org
X-Gm-Message-State: AOJu0YzJWn4s564iWfr7kYBhvU3mE8INkbNqLKhvXvmGRwfLm9w+sDTi
	yrj7FWrNDdCY/pKBuEUj1dO8Dse3WNObcdeCbs8UFbxa2yqhlh0aVqs2B+inw1zA2FORcfeMEI2
	o+XANgSoyydfOnIVlnrMhesf71+fRYSaZ91xS2PJBzm40JVkTMLMnq4cJH7w5h5gEd+u772M8DI
	A8
X-Gm-Gg: ATEYQzxlfpwMhL5km26oeCZehQ0ynSWOVKlsWwcSUemtPSvxuObnSM3is4HOzB/jSIa
	2R3Wl5n+I0r2ex5qi1MCJ9R1U8Z68NgPY5tVlJsbAtCmjvFrevAirl6Y7lGWiFaw/6PaI22/NpH
	Qcfw2e7cYiswD3bqufcf3Pt90lw2q9sB7uT0fOVbXs4EvoQbv0sjev2/+rl3bz+f955LEciNFq/
	7kroOoi9lGziXA26262GP6AJaZNHDk7sWwiJs5orMRYeERCqBfFc57x3HdnaFurjvX1VrFOqUdq
	ydtqbGfebDuylELbJVQ+CrxSPMdQwDzWJFzKLkVFjcpW6Tn/l6gX8FqqdD1RZwJgo9PepioLc20
	S93uifacouRddVmy4Lo8jw9vce5sbXGEBXi7pIx1lGRwoW6GZB+3+9stOvbAEvpUT
X-Received: by 2002:a17:903:1b6b:b0:2ae:bf92:5acc with SMTP id d9443c01a7336-2b0826ff359mr136640575ad.3.1774324632867;
        Mon, 23 Mar 2026 20:57:12 -0700 (PDT)
X-Received: by 2002:a17:903:1b6b:b0:2ae:bf92:5acc with SMTP id d9443c01a7336-2b0826ff359mr136640345ad.3.1774324632369;
        Mon, 23 Mar 2026 20:57:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083690346sm126192525ad.70.2026.03.23.20.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:57:11 -0700 (PDT)
Message-ID: <b200eaf9-462e-4844-aaf6-2912b956af6c@redhat.com>
Date: Tue, 24 Mar 2026 13:56:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 35/40] arm_mpam: Add quirk framework
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-36-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-36-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MsMkhxnHt9tToljqdtQ6HW4THK6sAqRFrFBfcNZR8EU_1774324633
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_205718_988013_CCE6E06A 
X-CRM114-Status: GOOD (  34.74  )
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

Hi Ben,

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM specification includes the MPAMF_IIDR, which serves to uniquely
> identify the MSC implementation through a combination of implementer
> details, product ID, variant, and revision. Certain hardware issues/errata
> can be resolved using software workarounds.
> 
> Introduce a quirk framework to allow workarounds to be enabled based on the
> MPAMF_IIDR value.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes by James:
> Stash the IIDR so this doesn't need an IPI, enable quirks only
> once, move the description to the callback so it can be pr_once()d, add an
> enum of workarounds for popular errata. Add macros for making lists of
> product/revision/vendor half readable
> 
> Changes since rfc:
> remove trailing commas in last element of enums
> Make mpam_enable_quirks() in charge of mpam_set_quirk() even if there
> is an enable.
> 
> Changes since v3:
> Brackets in macro
> ---
>   drivers/resctrl/mpam_devices.c  | 32 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h | 25 +++++++++++++++++++++++++
>   2 files changed, 57 insertions(+)
> 

With the following nitpicks addressed if another respin is needed. This
looks good to me in either way.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 37b31a1cf376..e66631f3f732 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -630,6 +630,30 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>   	return ERR_PTR(-ENOENT);
>   }
>   
> +static const struct mpam_quirk mpam_quirks[] = {
> +	{ NULL } /* Sentinel */
> +};
> +
> +static void mpam_enable_quirks(struct mpam_msc *msc)
> +{
> +	const struct mpam_quirk *quirk;
> +
> +	for (quirk = &mpam_quirks[0]; quirk->iidr_mask; quirk++) {
> +		int err = 0;

The initialization on @err is unnecessary if it's checked only when it's
updated (see below). The variable can be avoided.

> +
> +		if (quirk->iidr != (msc->iidr & quirk->iidr_mask))
> +			continue;
> +
> +		if (quirk->init)
> +			err = quirk->init(msc, quirk);
> +
> +		if (err)
> +			continue;

Since @err is only updated by quirk->init(), the following check would be done
only when it's updated. Something like below, @err isn't needed.

		if (quirk->init && quirk->init(msc, quirk)
			continue;

> +
> +		mpam_set_quirk(quirk->workaround, msc);
> +	}
> +}
> +
>   /*
>    * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
>    * of NRDY, software can use this bit for any purpose" - so hardware might not
> @@ -864,8 +888,11 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>   	/* Grab an IDR value to find out how many RIS there are */
>   	mutex_lock(&msc->part_sel_lock);
>   	idr = mpam_msc_read_idr(msc);
> +	msc->iidr = mpam_read_partsel_reg(msc, IIDR);
>   	mutex_unlock(&msc->part_sel_lock);
>   
> +	mpam_enable_quirks(msc);
> +
>   	msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
>   
>   	/* Use these values so partid/pmg always starts with a valid value */
> @@ -1972,6 +1999,7 @@ static bool mpam_has_cmax_wd_feature(struct mpam_props *props)
>    * resulting safe value must be compatible with both. When merging values in
>    * the tree, all the aliasing resources must be handled first.
>    * On mismatch, parent is modified.
> + * Quirks on an MSC will apply to all MSC in that class.
>    */
>   static void __props_mismatch(struct mpam_props *parent,
>   			     struct mpam_props *child, bool alias)
> @@ -2091,6 +2119,7 @@ static void __props_mismatch(struct mpam_props *parent,
>    * nobble the class feature, as we can't configure all the resources.
>    * e.g. The L3 cache is composed of two resources with 13 and 17 portion
>    * bitmaps respectively.
> + * Quirks on an MSC will apply to all MSC in that class.
>    */
>   static void
>   __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
> @@ -2104,6 +2133,9 @@ __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
>   	dev_dbg(dev, "Merging features for class:0x%lx &= vmsc:0x%lx\n",
>   		(long)cprops->features, (long)vprops->features);
>   
> +	/* Merge quirks */
> +	class->quirks |= vmsc->msc->quirks;
> +
>   	/* Take the safe value for any common features */
>   	__props_mismatch(cprops, vprops, false);
>   }
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index ce9e0e0483fb..e28a168419d4 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -85,6 +85,8 @@ struct mpam_msc {
>   	u8			pmg_max;
>   	unsigned long		ris_idxs;
>   	u32			ris_max;
> +	u32			iidr;
> +	u16			quirks;
>  

It maybe reasonable to have 'u32 quirks' so that 32 instead of 16 quirks can be
supported to the maximal degree. It's known 16 quirks are enough at the moment,
but it's likely to be extended for more space.
  
>   	/*
>   	 * error_irq_lock is taken when registering/unregistering the error
> @@ -216,6 +218,28 @@ struct mpam_props {
>   #define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
>   #define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
>   
> +/* Workaround bits for msc->quirks */
> +enum mpam_device_quirks {
> +	MPAM_QUIRK_LAST
> +};
> +
> +#define mpam_has_quirk(_quirk, x)	((1 << (_quirk) & (x)->quirks))
> +#define mpam_set_quirk(_quirk, x)	((x)->quirks |= (1 << (_quirk)))
> +
> +struct mpam_quirk {
> +	int (*init)(struct mpam_msc *msc, const struct mpam_quirk *quirk);
> +
> +	u32 iidr;
> +	u32 iidr_mask;
> +
> +	enum mpam_device_quirks workaround;
> +};
> +
> +#define MPAM_IIDR_MATCH_ONE	(FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0xfff) | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0xf)	 | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf)	 | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff))
> +
>   /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>   enum mon_filter_options {
>   	COUNT_BOTH	= 0,
> @@ -259,6 +283,7 @@ struct mpam_class {
>   
>   	struct mpam_props	props;
>   	u32			nrdy_usec;
> +	u16			quirks;

As above, it would be "u32 quirks".

>   	u8			level;
>   	enum mpam_class_types	type;
>   

Thanks,
Gavin


