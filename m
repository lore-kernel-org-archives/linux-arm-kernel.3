Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901FDCCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9IZpZgGUVeogte82A4ejnIOQXjpIY+s125+5iF6akQ=; b=MEN1jUmQWMGBQKAygSgYObtFkV
	Eg24EC5Yr4yP2uVP8rQdTuCNA31LPYTWuvXp2/7yVMhyfN3crePjBROIu0vZVu/Tl1udiP4a2VZm3
	xXsnY/oFbkVW0c0LQeMFuIibb5d9M+ynK69VlGLUGGVAtG7CP8/XhjD0SVEFhTorp8CYCjrVflNG/
	QBXTtQIxW2gZLy0FUXmbCQG6Vhq+bzI4aXKpK2wGgB23sQ6TR3AIL4ckT/npnIDAq+H46V7eMndrt
	EOIgEsd5dOxbOgYoYZqdRHACysh9gn3TQ0DGNDGOmUaUf6NrfYP3Xi91gyipdDQ6jM3NOtgKUrerA
	j8DWXY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhntS-00000001w2I-2GNy;
	Mon, 19 Jan 2026 11:58:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhntK-00000001w1W-2SyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768823873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9IZpZgGUVeogte82A4ejnIOQXjpIY+s125+5iF6akQ=;
	b=CWEKlQPPMNXO3vJLXCOc6pGq1Nid1nyuix338NXlcwkaUTnj+c4mYpci9pdXZziD5c7vKT
	kgLvNdixZpw5ovxERTr9xR7Q+qbbPFD4HzxJDm0HyN6QbraKZH6OZTGCs0t0dJzdi5FYyB
	QQ/EqGTu1kRNng5Ag8PiZDIarVvOLxs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-uawqkRiAPku88hVhTlau7Q-1; Mon, 19 Jan 2026 06:57:52 -0500
X-MC-Unique: uawqkRiAPku88hVhTlau7Q-1
X-Mimecast-MFC-AGG-ID: uawqkRiAPku88hVhTlau7Q_1768823872
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so6764598b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823871; x=1769428671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9IZpZgGUVeogte82A4ejnIOQXjpIY+s125+5iF6akQ=;
        b=fuTEzF0eN8H+wgZzc095JBxR9Sw/vWxZDLZjF9Ym1gbHGVuKC1+yiZRrujmDwEFo8A
         qlrbNSThFFbi9lagU6zRaT/cPMxLsSkMMOHXaPDoCqayi8QyKCI/47cJMwMF1+19CjbP
         wivB5usN83UAsdwvy66tEtOEE9HKLQau2/ZJtzioCMOguKVUjkVT9b2j54XDU3OWCTiU
         h5tUrOd4Ha5B9WTLOw2L2mpbEZS1kJqdJ9+kNMtassN7fIiCQOr23h4UFbbVTl3pFmDy
         v/9Ss3OWnZCgyOyHBCwW4QxzHflXl1k+rThVLXYN3pOPrNKA7CXNKpULihVusHk2beJb
         NbZg==
X-Forwarded-Encrypted: i=1; AJvYcCUu+uM1fYMklX3nV0a3ywpyaCNsQRj3yqzG/MOKKtgG/4x3UjLKc5WoJx0zAYtRAPHPdC2+d86dID0ILqYIuoCT@lists.infradead.org
X-Gm-Message-State: AOJu0Yye/4aE0K6Hrd55YI62wOE3gu5Nvrbdbn6ANDYHauiVi9nxKPYd
	0upnE3nykkMxKJHLutTXQEIEMCY4jDr7zc0TQE8TTpv9FFXCkBOeOU1q529PAa4DjFLF3JHFITj
	Sb2N7E7FJNC4j2okmNV+wzTeLFpcpkv0r0zyFrchPh4ZbiIJZK9dobC4rjqqPgvejkrf58yGtaX
	iK
X-Gm-Gg: AY/fxX4LCH8Dec88c34rcstPq0g49p8uH93gnt1qmV4nMs0CdgFoq7ZMi5aw/++M57/
	BZmwhz38BZFeoVf6lkgtCzUxA6n0ayG6gJv4QrBSHjFewEQ+Fhw633a/t6xWaCZDQaXSw2D8UXg
	6XHenybSrcskfuu9HUdY3Id39+wuuoTZZuZbgULlFWEWa3E1UfnFTNYhcDkv85kPNneV+lqDJqq
	oxXDiTMEf1dyhUvNsLLKWZ0qr8cmqhakdy429RhBr4lCvU0ng9s5VT5vn+Or1S4r8iUVBa7wpyK
	IOUDolTGGL79b5so9PUSdCVzIze9oJdIdiUdJdbqiuoMCAVVZ2BSa76hpE9wVrmJl7AEZoRWTxy
	7CWkS5OuRANk=
X-Received: by 2002:a05:6a00:6b92:10b0:81f:a860:d665 with SMTP id d2e1a72fcca58-81fa860d831mr6529800b3a.66.1768823871543;
        Mon, 19 Jan 2026 03:57:51 -0800 (PST)
X-Received: by 2002:a05:6a00:6b92:10b0:81f:a860:d665 with SMTP id d2e1a72fcca58-81fa860d831mr6529784b3a.66.1768823871172;
        Mon, 19 Jan 2026 03:57:51 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm9100204b3a.65.2026.01.19.03.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:57:50 -0800 (PST)
Message-ID: <5e20890a-f1f0-4a54-894b-a0e170a8a5f8@redhat.com>
Date: Mon, 19 Jan 2026 19:57:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/47] arm_mpam: resctrl: Pre-allocate free running
 monitors
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-31-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-31-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b4j5SRn8FKt81cUCs0bw3hv--pFGuvge_hCQ5FPJuVo_1768823872
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035756_573395_D524FC12 
X-CRM114-Status: GOOD (  30.62  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> When there are enough monitors, the resctrl mbm local and total files can
> be exposed. These need all the monitors that resctrl may use to be
> allocated up front.
> 
> Add helpers to do this.
> 
> If a different candidate class is discovered, the old array should be
> free'd and the allocated monitors returned to the driver.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Code flow tidying (Jonathan)
> ---
>   drivers/resctrl/mpam_internal.h |  8 +++-
>   drivers/resctrl/mpam_resctrl.c  | 81 ++++++++++++++++++++++++++++++++-
>   2 files changed, 86 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1c5492008fe8..89f9d374ded0 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -360,7 +360,13 @@ struct mpam_resctrl_res {
>   struct mpam_resctrl_mon {
>   	struct mpam_class	*class;
>   
> -	/* per-class data that resctrl needs will live here */
> +	/*
> +	 * Array of allocated MBWU monitors, indexed by (closid, rmid).
> +	 * When ABMC is not in use, this array directly maps (closid, rmid)
> +	 * to the allocated monitor. Otherwise this array is sparse, and
> +	 * un-assigned (closid, rmid) are -1.
> +	 */
> +	int			*mbwu_idx_to_mon;
>   };
>   
>   static inline int mpam_alloc_csu_mon(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 14a8dcaf1366..3af12ad77fba 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -572,10 +572,58 @@ static void mpam_resctrl_pick_mba(void)
>   	}
>   }
>   
> +static void __free_mbwu_mon(struct mpam_class *class, int *array,
> +			    u16 num_mbwu_mon)
> +{
> +	for (int i = 0; i < num_mbwu_mon; i++) {
> +		if (array[i] < 0)
> +			continue;
> +
> +		mpam_free_mbwu_mon(class, array[i]);
> +		array[i] = ~0;
> +	}
> +}
> +
> +static int __alloc_mbwu_mon(struct mpam_class *class, int *array,
> +			    u16 num_mbwu_mon)
> +{
> +	for (int i = 0; i < num_mbwu_mon; i++) {
> +		int mbwu_mon = mpam_alloc_mbwu_mon(class);
> +
> +		if (mbwu_mon < 0) {
> +			__free_mbwu_mon(class, array, num_mbwu_mon);
> +			return mbwu_mon;
> +		}
> +		array[i] = mbwu_mon;
> +	}
> +
> +	return 0;
> +}
> +
> +static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
> +{
> +	int err;
> +	size_t array_size = num_mbwu_mon * sizeof(int);
> +	int *array __free(kfree) = kmalloc(array_size, GFP_KERNEL);
> +

A warning reported by checkpatch.pl as below.

WARNING: Missing a blank line after declarations
#84: FILE: drivers/resctrl/mpam_resctrl.c:607:
+	size_t array_size = num_mbwu_mon * sizeof(int);
+	int *array __free(kfree) = kmalloc(array_size, GFP_KERNEL);


> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	memset(array, -1, array_size);
> +
> +	err = __alloc_mbwu_mon(class, array, num_mbwu_mon);
> +	if (err)
> +		return ERR_PTR(err);
> +	return_ptr(array);
> +}
> +
>   static void counter_update_class(enum resctrl_event_id evt_id,
>   				 struct mpam_class *class)
>   {
> -	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
> +	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evt_id];
> +	struct mpam_class *existing_class = mon->class;
> +	u16 num_mbwu_mon = class->props.num_mbwu_mon;
> +	int *new_array, *existing_array = mon->mbwu_idx_to_mon;
>   
>   	if (existing_class) {
>   		if (class->level == 3) {
> @@ -590,8 +638,37 @@ static void counter_update_class(enum resctrl_event_id evt_id,
>   		}
>   	}
>   
> -	mpam_resctrl_counters[evt_id].class = class;
> +	pr_debug("Updating event %u to use class %u\n", evt_id, class->level);
> +
> +	/* Might not need all the monitors */
> +	num_mbwu_mon = __mpam_monitors_free_running(num_mbwu_mon);
> +
> +	if ((evt_id != QOS_L3_OCCUP_EVENT_ID) && num_mbwu_mon) {
> +		/*
> +		 * This is the pre-allocated free-running monitors path. It always
> +		 * allocates one monitor per PARTID * PMG.
> +		 */
> +		WARN_ON_ONCE(num_mbwu_mon != resctrl_arch_system_num_rmid_idx());
> +
> +		new_array = __alloc_mbwu_array(class, num_mbwu_mon);
> +		if (IS_ERR(new_array)) {
> +			pr_debug("Failed to allocate MBWU array\n");
> +			return;
> +		}
> +		mon->mbwu_idx_to_mon = new_array;
> +
> +		if (existing_array) {
> +			pr_debug("Releasing previous class %u's monitors\n",
> +				 existing_class->level);
> +			__free_mbwu_mon(existing_class, existing_array, num_mbwu_mon);
> +			kfree(existing_array);
> +		}
> +	} else if (evt_id != QOS_L3_OCCUP_EVENT_ID) {
> +		pr_debug("Not pre-allocating free-running counters\n");
> +	}
> +
>   	exposed_mon_capable = true;
> +	mon->class = class;
>   }
>   
>   static void mpam_resctrl_pick_counters(void)

Thanks,
Gavin


