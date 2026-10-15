Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0133CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IC5Ct3FOhi968am1MRf06lj4teeqkFZmOqPC0DoSw2E=; b=jdCTSmhZxy72sI0upppvpVa+e9
	tkZKB5uvfdMen8omS+DSjwxqFcBWlFZ1BHKA3lS5OvEarx/K3LfMhnO51dJc/RnvwIlayeQ5YgQAk
	/kdWZd2e/GePpbaBWmbC2eZKHvOcFwvqvIiiC8v1ut+9x+/JRqMShPNo96EG8k6Lw5ekDvUWEKbzD
	A2bQ4/Bf7nf7L1oLQ50aK+9ihID9XMAT9Nz9M21s86xe5I8sZ8M0gTWD/5kCVx4Ns6gtw4kd76Tws
	e2/6/D0FHVl/Utk9QOHf4gk83OUAtbuo/DHTWTQmoMDxehSj5gNoJdTzsBW2nebENh1V9mFJOfgVd
	JqGkPKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN3W-00000000W4q-00VZ;
	Thu, 15 Oct 2026 15:07:42 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN3S-00000000W3v-2yRu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:07:40 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c31952e5afaso219810166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792076856; x=1792681656; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC5Ct3FOhi968am1MRf06lj4teeqkFZmOqPC0DoSw2E=;
        b=hFqclYPbfgr+ulp6B4qw9NG3gEyUA4e54j3wgtugGMY34oVxuWYl7+zlJnE2TGqXR6
         h+9gBgtKU6Qy5zq0NVdBAMYr7a6tD4vEguVb1Jcofh8aLh4KCd84UzlVOv5aGCaxhMmM
         ZZjKKPI98v6Xw6K353RZVpzZUYIsIInXc/ofJl0jdwC4wqPXkGGkbXPPa44qizKBgqx+
         IXkg5YRzdPTz6lM7Z0CaHFrOaIGTcKYGXpG4vlyYUokKp6WHiZUGuIEEzTEkX5QdY/dZ
         USMLs0N5z+45D3Fh3gQowXUJO/YwwMPOEa8OA18wyIlWxMzn3z25MW5/2swwM2CqoCDo
         0K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076856; x=1792681656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IC5Ct3FOhi968am1MRf06lj4teeqkFZmOqPC0DoSw2E=;
        b=K/vC8I4J9kkwHU6rvflqI10xIwm8EtczYyYPFKj3jG2rbLdEKX+mS8A3XNGlZwAKaa
         DcQLIy9SrDIwddRpNARjNcjma5zEec5T/rsEFVm8YMmhqHe58kPVpEykfykLKwYwNpMT
         +5wIL9Ke4InW+TfTRp87dWQc6PXFXKffEBvd3b3TDJLyPoy+DeIIAjNKxn7LvvFKkbtP
         SStiMCg1tHPNskZKc8qOago7WrtBR3plwwf4ZMuIlcQUzwZ3jwf5m2Rn01YtLuyz8xVs
         g8e1EawnqvbWdO1PJg3Vz53S2aBA85B1XWHKhPcIX4RvZ9B7y/KhLmiNiqLM/kmybTd/
         GrQw==
X-Forwarded-Encrypted: i=1; AKwUvByaI/oRb2aRcK6gp0FWl/sfRGqBU1WnwoOdEvotlaJpTfpfOSTAo0Sr1B+J+XBsZ+a06TAtXy+Ov/3uNf0xr7kZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJKPscQmDtmBox5V4WLqukH+WLiXqG89jcfmzXO3P21JGugkszc
	yDbfFCvUTWme9rbhly6Ltl4djD/Pni1MRSafXt+4D79+GP6X8E4I6TZms/vuBQWe3IwZRxIlvnY
	ES+XigNnFC4cV6RyAfg==
X-Received: from ejbbq18.prod.google.com ([2002:a17:906:d0d2:b0:c2e:1f38:d81a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9615:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c31a9a28825mr1772701566b.1.1792076855746;
 Thu, 15 Oct 2026 08:07:35 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:07:34 +0000
In-Reply-To: <2vxzzewfgno2.fsf@kernel.org>
Mime-Version: 1.0
References: <20260903023452.721732-1-loganodell@google.com>
 <20260903023452.721732-2-loganodell@google.com> <2vxzzewfgno2.fsf@kernel.org>
Message-ID: <9huzqzhrhuix.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH 1/3] luo: Move to feature flags instead of
 compatibility strings
From: tarunsahu@google.com
To: Pratyush Yadav <pratyush@kernel.org>, Logan Odell <loganodell@google.com>
Cc: arnd@arndb.de, pasha.tatashin@soleen.com, rppt@kernel.org, 
	pratyush@kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	pbonzini@redhat.com, maz@kernel.org, oupton@kernel.org, seanjc@google.com, 
	bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_080738_803098_9C00FCA2 
X-CRM114-Status: GOOD (  49.46  )
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

Pratyush Yadav <pratyush@kernel.org> writes:

> Hi Logan,
>
> On Wed, Sep 02 2026, Logan Odell wrote:
>
>> Define a 128 byte header that can be used by all live update serialized
>> structures. In this header, we reserve room for 64 features with
>> supported, active, and required bits. Update the top level luo struct to
>> use this instead of compatibility strings. Previous versions of the
>> struct had smaller sizes, so add a minimum size check to avoid
>> collisions with older kernels.
>>
>> Signed-off-by: Logan Odell <loganodell@google.com>
>> ---
>>  include/linux/kho/abi/luo.h  | 74 +++++++++++++++++++++++++++++-------
>>  kernel/liveupdate/luo_core.c | 44 +++++++++++++--------
>>  2 files changed, 90 insertions(+), 28 deletions(-)
>>
>> diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
>> index 288076de6d4a..0a7662a0cf9a 100644
>> --- a/include/linux/kho/abi/luo.h
>> +++ b/include/linux/kho/abi/luo.h
>> @@ -13,15 +13,17 @@
>>   * kernel. The ABI is built upon the Kexec HandOver framework and registers
>>   * the central `struct luo_ser` via the KHO raw subtree API.
>>   *
>> - * This interface is a contract. Any modification to the structure fields,
>> - * compatible strings, or the layout of the `__packed` serialization
>> - * structures defined here constitutes a breaking change. Such changes require
>> - * incrementing the version number in the relevant `_COMPATIBLE` string to
>> - * prevent a new kernel from misinterpreting data from an old kernel.
>> + * This interface is a contract. To ensure the stability of moving between
>> + * kernel versions, any changes to the structures should only be additive
>> + * and should utilize the feature flags to denote the supported, active, and
>> + * required status of the feature.
>> + *
>> + * Features that are entirely optional can be added with the supported and
>> + * active flags both asserted, and the required flag cleared. Features that
>> + * require that the next kernel supports the feature should only be added as
>> + * supported to allow compatible transition kernels. At a later time, the
>> + * active and required flag should be asserted.
>>   *
>> - * Changes are allowed provided the compatibility version is incremented;
>> - * however, backward/forward compatibility is only guaranteed for kernels
>> - * supporting the same ABI version.
>>   *
>>   * KHO Structure Overview:
>>   *   The entire LUO state is encapsulated within a single KHO entry named "LUO".
>> @@ -30,7 +32,7 @@
>>   * Serialization Structures:
>>   *   - struct luo_ser:
>>   *     The central ABI structure that contains the overall state of the LUO.
>> - *     It includes the compatibility string, the liveupdate-number, and pointers
>> + *     It includes the feature flags, the liveupdate-number, and pointers
>>   *     to sessions and FLBs.
>>   *
>>   *   - struct luo_session_ser:
>> @@ -58,19 +60,65 @@
>>  #define _LINUX_KHO_ABI_LUO_H
>>  
>>  #include <linux/align.h>
>> +#include <linux/bits.h>
>>  #include <linux/kho/abi/block.h>
>>  #include <uapi/linux/liveupdate.h>
>>  
>> +/**
>> + * struct luo_feature_hdr - Feature negotiation and versioning header.
>> + * @supp:     Bitmask of features supported by the producing subsystem.
>> + * @req:      Bitmask of features required for safe deserialization by the
>> + *            receiving subsystem.
>
> I think you are mixing two things here: description of the payload and
> description of the file handler capability.
>
> The payload that is handed over via KHO should have the active and
> required bitmasks only. It doesn't need the supported bitmask, because
> it doesn't matter what the handler that produced the payload supports.
> It only matters what fields it populated and which ones are mandatory to
> understand.
>
> Similarly, the description of the file handler can't really describe
> "active". Because the capabilities are static and the active bits will
> depend on a specific file.
>
> So I reckon we should separate these two. These should be the same bits
> of course, but expressed in two ways in two different places.
>
>> + * @active:   Bitmask of features actually active/used in the serialized payload.
>> + * @reserved: Reserved for future use.
>> + *
>> + * This header can be embedded at the beginning of any serialized structure to
>> + * provide forward and backward compatibility via feature negotiation across
>> + * live update.
>> + */
>> +struct luo_feature_hdr {
>> +	u64 supp;
>> +	u64 req;
>> +	u64 active;
>> +	u64 reserved[13];
>
> How do you plan to ever use this? Say I want to extend my bitmaps so I do:
>
>     struct luo_feature_hdr {
>     	u64 supp;
>     	u64 req;
>     	u64 active;
>     	u64 supp2;
>     	u64 req2;
>     	u64 active2;
>     	u64 reserved[10];

I thinking this is too spreaded.

We can do somthing like:

struct ABI {
       u64 size;
       u64 flags;
       u64 flags2;
}

where flags is extended to flags2 if flags MSB bits is 11.

and each flags is formatted like 0b 00 01 11 00 11 10 11 11 00 00 11 ...

each pair represents 0b 1 (required) 1 (active)
Getting the details of the feature is just bit manipulation, so
proper macro definition similar to the one this patch has implemented.


~Tarun



>
> But when I go back to a kernel that doesn't know about supp2, req2,
> etc., how does it know how to interpret these? How does it know what the
> values mean?
>
> Is your goal only to be able to extend the three types of flags we have?
> If so, perhaps something like "if bit 63 is set, the flags continue to
> the next u64"? It is certainly harder for the parser, but seems to at
> least be extensible. What do you think?
>
>> +} __packed;
>> +
>> +#define LUO_FEATURE_ACTIVE(s, f)		\
>> +	do {					\
>> +		(s)->features.supp |= (u64)(f);	\
>> +		(s)->features.active |= (u64)(f);	\
>> +	} while (0)
>> +#define LUO_FEATURE_SUPPORTED(s, f)	((s)->features.supp |= (u64)(f))
>> +#define LUO_FEATURE_REQUIRED(s, f)	((s)->features.req |= (u64)(f))
>> +#define LUO_FEATURE_IS_ACTIVE(s, f)	(!!((s)->features.active & (u64)(f)))
>> +#define LUO_FEATURE_IS_SUPPORTED(s, f)	(!!((s)->features.supp & (u64)(f)))
>> +#define LUO_FEATURE_IS_REQUIRED(s, f)	(!!((s)->features.req & (u64)(f)))
>> +
>>  /*
>>   * The LUO state is registered under this KHO entry name.
>>   */
>>  #define LUO_KHO_ENTRY_NAME	"LUO"
>> -#define LUO_ABI_COMPATIBLE	"luo-v5"
>> -#define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
>> +
>> +/*
>> + * Bits associated with the luo_feature_hdr values.
>> + */
>> +#define LUO_FEATURE_NUMBER    BIT_ULL(0)
>> +#define LUO_FEATURE_SESSIONS  BIT_ULL(1)
>> +#define LUO_FEATURE_FLBS      BIT_ULL(2)
>
> Nit: please give the flags full documentation on their semantics.
>
>> +
>> +#define LUO_CORE_FEATURES_SUPP		(LUO_FEATURE_NUMBER | \
>> +					 LUO_FEATURE_SESSIONS | \
>> +					 LUO_FEATURE_FLBS)
>> +#define LUO_CORE_FEATURES_REQ		(LUO_FEATURE_NUMBER | \
>> +					 LUO_FEATURE_SESSIONS | \
>> +					 LUO_FEATURE_FLBS)
>> +#define LUO_CORE_FEATURES_ACTIVE	(LUO_FEATURE_NUMBER | \
>> +					 LUO_FEATURE_SESSIONS | \
>> +					 LUO_FEATURE_FLBS)
>>  
>>  /**
>>   * struct luo_ser - Centralized LUO ABI header.
>> - * @compatible:     Compatibility string identifying the LUO ABI version.
>> + * @features:       Bit mask of supported and active features.
>>   * @liveupdate_num: A counter tracking the number of successful live updates.
>>   * @sessions_pa:    Physical address of the first session block header.
>>   * @flbs_pa:        Physical address of the FLB header.
>> @@ -78,7 +126,7 @@
>>   * This structure is the root of all preserved LUO state.
>>   */
>>  struct luo_ser {
>> -	char compatible[LUO_ABI_COMPAT_LEN];
>> +	struct luo_feature_hdr features;
>
> Do we still need compatible here? How will we ever do breaking changes
> if we really need to?
>
>>  	u64 liveupdate_num;
>>  	u64 sessions_pa;
>>  	u64 flbs_pa;
>> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
>> index 1b2bda22902d..6add1ecc463f 100644
>> --- a/kernel/liveupdate/luo_core.c
>> +++ b/kernel/liveupdate/luo_core.c
>> @@ -107,26 +107,37 @@ static int __init luo_early_startup(void)
>>  		return 0;
>>  	}
>>  
>> -	if (len < sizeof(*luo_ser)) {
>> -		pr_err("LUO state is too small (%zu < %zu)\n", len, sizeof(*luo_ser));
>> -		return -EINVAL;
>> +	luo_ser = phys_to_virt(luo_ser_phys);
>> +
>> +	if (len < sizeof(struct luo_feature_hdr)) {
>> +		pr_err("LUO state is too small (%zu < %zu)\n",
>> +		       len, sizeof(struct luo_feature_hdr));
>> +		err = -EINVAL;
>> +		goto out_free_ser;
>>  	}
>>  
>> -	luo_ser = phys_to_virt(luo_ser_phys);
>> -	if (strncmp(luo_ser->compatible, LUO_ABI_COMPATIBLE, LUO_ABI_COMPAT_LEN)) {
>> -		pr_err("LUO state is incompatible with '%s'\n", LUO_ABI_COMPATIBLE);
>> -		return -EINVAL;
>> +	if (luo_ser->features.req & ~LUO_CORE_FEATURES_SUPP) {
>> +		pr_err("Unsupported required LUO feature (req: 0x%llx, supp: 0x%llx)\n",
>> +		       luo_ser->features.req, (u64)LUO_CORE_FEATURES_SUPP);
>> +		err = -EOPNOTSUPP;
>> +		goto out_free_ser;
>>  	}
>>  
>> -	luo_global.liveupdate_num = luo_ser->liveupdate_num;
>> -	pr_info("Retrieved live update data, liveupdate number: %lld\n",
>> -		luo_global.liveupdate_num);
>> +	if (LUO_FEATURE_IS_ACTIVE(luo_ser, LUO_FEATURE_NUMBER)) {
>> +		luo_global.liveupdate_num = luo_ser->liveupdate_num;
>> +		pr_info("Retrieved live update data, liveupdate number: %lld\n",
>> +			luo_global.liveupdate_num);
>> +	}
>>  
>> -	err = luo_session_setup_incoming(luo_ser->sessions_pa);
>> -	if (err)
>> -		goto out_free_ser;
>>  
>> -	luo_flb_setup_incoming(luo_ser->flbs_pa);
>> +	if (LUO_FEATURE_IS_ACTIVE(luo_ser, LUO_FEATURE_SESSIONS)) {
>> +		err = luo_session_setup_incoming(luo_ser->sessions_pa);
>> +		if (err)
>> +			goto out_free_ser;
>> +	}
>> +
>> +	if (LUO_FEATURE_IS_ACTIVE(luo_ser, LUO_FEATURE_FLBS))
>> +		luo_flb_setup_incoming(luo_ser->flbs_pa);
>>  
>>  	err = 0;
>>  
>> @@ -162,7 +173,10 @@ static int __init luo_state_setup(void)
>>  		return PTR_ERR(luo_ser);
>>  	}
>>  
>> -	strscpy(luo_ser->compatible, LUO_ABI_COMPATIBLE, sizeof(luo_ser->compatible));
>> +	luo_ser->features.supp = LUO_CORE_FEATURES_SUPP;
>> +	luo_ser->features.req = LUO_CORE_FEATURES_REQ;
>> +	luo_ser->features.active = LUO_CORE_FEATURES_ACTIVE;
>> +
>>  	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
>>  
>>  	luo_session_setup_outgoing(&luo_ser->sessions_pa);
>
> -- 
> Regards,
> Pratyush Yadav

