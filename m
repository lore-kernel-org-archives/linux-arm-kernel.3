Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F49C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szUhRzEc3gD/KXfeBaNWZbbt2DelRUyv9Ye2MPiDleo=; b=yzTGBebAdQFh7FyGZiYvBUB4RI
	W0wOf8iRM3GRNdCAUNLsLo9Rh3EHNTZWXo/LeXdBREseHBTHuvlJkq21i86JGqhppjAfkY7AaS7+q
	0JkJxQfN9g81ZcM4C/jIimyzEU+WfAbMl+XcjOXbrDFSBS28rG06eubpGvmkGvpvgDhXuDijTB3xq
	djsKgXgKyOHIv8EHACpGS9TDprdPsgL7cYocnSU3GlHymxpudMa0v11TIHmRDxRFDNWocUPNG6+b5
	xf5NFYv/LUkqIQ38EVdFD0H+NLgV9BF6+GJureHtONrHFzgErlJnyCZA4fYufuAXEaEv0fGx050JI
	JkGziKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxmQ-0000000HBaJ-2Hiz;
	Mon, 03 Mar 2025 04:51:50 +0000
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxjh-0000000HBDo-3PX8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740977340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szUhRzEc3gD/KXfeBaNWZbbt2DelRUyv9Ye2MPiDleo=;
	b=Pd8WU4VfkXZT8kkeBdjo2oUhP1ysSHJVj8iMSA6EcuDY02Zvl8v+cRrZrBHbF0qsHoEfla
	YnAiTiiF1b52rB/PotSjJ16f5RpsgAsFxqs1hRp8MYJpjVVx3z9StQyY9lAkO+e4lrgd2X
	baX2LHZ6/f4pJaidg6nkRqLd0ZlMVd0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-bBf1ePE0NSuUd_8Jznxf6g-1; Sun, 02 Mar 2025 23:48:54 -0500
X-MC-Unique: bBf1ePE0NSuUd_8Jznxf6g-1
X-Mimecast-MFC-AGG-ID: bBf1ePE0NSuUd_8Jznxf6g_1740977333
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2feb5cd04a0so5959093a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 20:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740977333; x=1741582133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szUhRzEc3gD/KXfeBaNWZbbt2DelRUyv9Ye2MPiDleo=;
        b=pTJl5odSln4UgS6vWW0pKVr7p3OHgxaU6nrD8MsSBoehrZ0lxYv5msIX+m0gpgdmto
         UEgOTf2XwLs146HUqwweC6hfPLNwdWMD+RSK0T29JO7LoA7zj1qblAfKepVW6Mpy9hNw
         By7eQUlgQVQOLGQdAxd+k9xDv9C1GNLyzewRefXQL/vMf7a37qs+97zTSl7RdInObMbi
         jGltzi9SOkC6qtXHFzsnn+64BQZKidEc7gE921J4hILcFnnRxPQ3n0LKd4KQU+0aQIYM
         lIb96QzyT50cCWtbJLGI+RpfTfZ5SFkc0XOptBZgnbdAA9cZel8ILe//ogMk71GpXnhd
         fI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUc89grkgRWdxlz4v4rlP1z0h8jFS0r8fu5kJnTfcfj0BnykutrcxTZIizlMsJsbV/JpDtonfm17z+4hJK23OIK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzer0N84NmMo9oXVEeUnMw9Gch+dLT1hlhTz4Ai+mTSWv0qmly
	+R+ZUJE6q/wBix7VHdYBGmhRzSlhl3Xi5+yTMh+kfnq9fOmbPd3xOrjAuREHM9XvjMJY+z/h5QW
	F8P2HM5op8XKBV2nlUjtHKa/i9A+7Zha+49bCs5CVX1xDf3agWZTRBOrWKh9q/xKprqaKjF0l
X-Gm-Gg: ASbGnctCPUbxyOY3VTdy5yn+5lCRIyB0/KIb0ecT9D3gMYDeX2Cuvu8LbNwdYHdKFFD
	oz0o2yWR+HzU9JlVJtdSI/bQb8BDNF0EH98MluaAF23QoMru+toqN0/zbGMYiSgKpmK1x/bRHoC
	aTYBuUk6BtNSCwnuWujUH2ZECcaL+M5IEimU6tA7r4nDxUz4aXsoJR7LnB3iSRWLEGHsbZKUqCj
	lYFo3/W/FUIl5aYcHJB99ApxdUgB95yFGD06hGCj60WtQ04/4UsY1udItRtFw+1oldEI3nn7Y55
	zF8PnlJuNx+qPiG+Ag==
X-Received: by 2002:a17:90b:3e84:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2febac046a6mr14181186a91.23.1740977333509;
        Sun, 02 Mar 2025 20:48:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0bFqBHp5vrV5kno/u9pdc5LbTz/krk4wxyP++znTwdfie+ZMz0iB8kF9GwoMI70Qf1wWKBg==
X-Received: by 2002:a17:90b:3e84:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2febac046a6mr14181169a91.23.1740977333178;
        Sun, 02 Mar 2025 20:48:53 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050d7c1sm68704355ad.198.2025.03.02.20.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 20:48:52 -0800 (PST)
Message-ID: <cec600f2-2ddc-4c71-9bab-0a0403132b43@redhat.com>
Date: Mon, 3 Mar 2025 14:48:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/45] kvm: arm64: Expose debug HW register numbers for
 Realm
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-10-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-10-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7_7G7VonKtjSsNDAut_fgMd3ZnC6zIbzLikETPBU0IM_1740977333
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_204901_929187_E87E8398 
X-CRM114-Status: GOOD (  18.18  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Expose VM specific Debug HW register numbers.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
> 

Documentation/virt/kvm/api.rst needs to be updated accordingly.

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index b8fa82be251c..df6eb5e9ca96 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -78,6 +78,22 @@ bool is_kvm_arm_initialised(void)
>   	return kvm_arm_initialised;
>   }
>   
> +static u32 kvm_arm_get_num_brps(struct kvm *kvm)
> +{
> +	if (!kvm_is_realm(kvm))
> +		return get_num_brps();
> +	/* Realm guest is not debuggable. */
> +	return 0;
> +}
> +
> +static u32 kvm_arm_get_num_wrps(struct kvm *kvm)
> +{
> +	if (!kvm_is_realm(kvm))
> +		return get_num_wrps();
> +	/* Realm guest is not debuggable. */
> +	return 0;
> +}
> +

The above two comments "Realm guest is not debuggable." can be dropped since
the code is self-explanatory, and those two functions are unnecessary to be
kept in that way, for example:

	case KVM_CAP_GUEST_DEBUG_HW_BPS:
		return kvm_is_realm(kvm) ? 0 : get_num_brps();
	case KVM_CAP_GUEST_DEBUG_HW_WRPS:
		return kvm_is_realm(kvm) ? 0 : get_num_wrps();


>   int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>   {
>   	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
> @@ -323,7 +339,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
>   	case KVM_CAP_ARM_NISV_TO_USER:
>   	case KVM_CAP_ARM_INJECT_EXT_DABT:
> -	case KVM_CAP_SET_GUEST_DEBUG:
>   	case KVM_CAP_VCPU_ATTRIBUTES:
>   	case KVM_CAP_PTP_KVM:
>   	case KVM_CAP_ARM_SYSTEM_SUSPEND:
> @@ -331,6 +346,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_COUNTER_OFFSET:
>   		r = 1;
>   		break;
> +	case KVM_CAP_SET_GUEST_DEBUG:
> +		r = !kvm_is_realm(kvm);
> +		break;
>   	case KVM_CAP_SET_GUEST_DEBUG2:
>   		return KVM_GUESTDBG_VALID_MASK;
>   	case KVM_CAP_ARM_SET_DEVICE_ADDR:
> @@ -376,10 +394,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
>   		break;
>   	case KVM_CAP_GUEST_DEBUG_HW_BPS:
> -		r = get_num_brps();
> +		r = kvm_arm_get_num_brps(kvm);
>   		break;
>   	case KVM_CAP_GUEST_DEBUG_HW_WPS:
> -		r = get_num_wrps();
> +		r = kvm_arm_get_num_wrps(kvm);
>   		break;
>   	case KVM_CAP_ARM_PMU_V3:
>   		r = kvm_arm_support_pmu_v3();

Thanks,
Gavin


