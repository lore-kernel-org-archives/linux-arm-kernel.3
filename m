Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD750C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 02:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=; b=48x07mn6h/I03Oep02kkKDNYh9
	ARygeD3/CGd+eIZAs/KQRyV+yA2Fh62haoUkCCqFSk/noN8HfnNFMc3byS57XyFwHjOpRQwu9jpcp
	dVtqw04cskwJsUvoAn2WFf6bhubW1YYMl38SeswyZe3v/cjdPNVQN7KW/YZvUuEx6otTQ27IwwdKD
	EP7uefo/TG6S1JF94e80ADHZEXEpYc6Fp+0mUDZ6huE4pjPodRPVsnFj5ZcTyywgi/hARF6ye+92K
	170XscebDZrT5CYq7xIeD3UTPHdm3lX28ktNDi18Ve9Mi82tckaEgjOA9L/PatarcHP7VeLD9U4mR
	Uu6Ra9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tePY8-0000000DIYA-1gcJ;
	Sun, 02 Feb 2025 02:17:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tePWl-0000000DISO-0cq1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 02:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=;
	b=gVEvRfV17ojupf5R1QFOTIrTnwclolxQO+Ez12tEk8kmFU7+fVlqz4BzDXTPEOqDedYYb1
	iRmkmqF1Q20WYwegCTZLr2GJ+Y4txeH4+Ji3FSWjJ0N5CfRJb+IU23gwz1dAJmq35TDAmv
	lGWNKL5Al84GnWUpAtcBTclNwmKvCkw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-6W3jXJbTP2WkhYen0f7wxw-1; Sat, 01 Feb 2025 21:16:00 -0500
X-MC-Unique: 6W3jXJbTP2WkhYen0f7wxw-1
X-Mimecast-MFC-AGG-ID: 6W3jXJbTP2WkhYen0f7wxw
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef6ef86607so8142746a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 18:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462560; x=1739067360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=;
        b=q8lfB8MdhNhPuFVMIm8Ony4hGDROGEK3cQcNYIJCg34JqHakwd62jAAbyIRRNZKmMK
         1wu9MkChaQkRrpo5yvOaYTNjsad+8LeJtsNWm8Ydscn9IEMEIPenpO+iSQp93jk7iXas
         IxCAY2muKiXwP00Lfe0Dkfr52nxpRXSVjzwylhJybD5GrC+7uvwc3Y3S3vM0Q6xHE6XH
         fkkXqeKvPPct7W+PEz+r5YLNiaLvgBq8JFU/YnbSIdO8JpSCI8+J10DxUa5BqzRMS6VJ
         B/otxCxxnoYtKMqOm8BEKipX4de9Sys+hnrzY6GaxmxYnJPHt4IL2HXNavm8lRu4oHH7
         iGCw==
X-Forwarded-Encrypted: i=1; AJvYcCUz72ld50errreUKaQK3SAnOflcoEo9XjWRg1xK+MFFhc4P1meuB7Z/l5GRwt9tMZn1Hub8oH10ZhH/FQvgb2La@lists.infradead.org
X-Gm-Message-State: AOJu0YxGi2vPs6mNe83+0sn/bZRGNPv3xjE7Hzd4psvcn5nRvs1FD5tn
	ZN+uOA/HdQ821VAF9JDJ8QJ47udGghyOMsJ/svlxoitC2qeGgZsFjqUFLypY886DfcL9Z9GFOsG
	4ZqWu4SDmQ9UgQm3/KJ9HhjH5aBQTmRE2Zgc2WLwGiiR0Ej5FhL0eqHIazOJRPByIavSOvQcj
X-Gm-Gg: ASbGncu46DrzqxrbrPkOrPROCZnvwo/UcSPtNZUt3qtaRK76IKufGJmDvBw5rBqup7D
	c32tyTjkKTCodsemrE6aFowH/Ia9bClrOIXY0TzegwMHWgLL4SeRXfpKrwiKOBFwmsfPWTFU9DW
	qt8880LekBfTU44wtcohmrKStwZKsvqr0O1Xd/C+9IThSf6uLaPc3riaeNnkZ8yjMKRYwI06r2V
	/0eUcSEQgMeaWJEhHOUJg4t6hUK7UpHm4LArfGI6qzB9iB7MWsEDLMRj562dBcg8Uawr2UvXiKM
	WwG77Q==
X-Received: by 2002:aa7:8c43:0:b0:72f:f86d:c543 with SMTP id d2e1a72fcca58-72ff86dc5cfmr9769162b3a.9.1738462559695;
        Sat, 01 Feb 2025 18:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwN4JpbwAKVJUbVg+/34hGwQp5HKYXpKcr/Eo2PO+gIzPd+r9+tV930pBIODwVO11f1VYIuw==
X-Received: by 2002:aa7:8c43:0:b0:72f:f86d:c543 with SMTP id d2e1a72fcca58-72ff86dc5cfmr9769126b3a.9.1738462559318;
        Sat, 01 Feb 2025 18:15:59 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba47esm5834225b3a.96.2025.02.01.18.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:15:58 -0800 (PST)
Message-ID: <ae13e762-bd0d-4525-8919-f6b1bcfc8fee@redhat.com>
Date: Sun, 2 Feb 2025 12:15:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/43] arm64: Don't expose stolen time for realm guests
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-26-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-26-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8MfXJQT2wyMSibzqXrzQpl_2Qt5ic8ARaZfwlViJau4_1738462560
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_181603_364234_7998F232 
X-CRM114-Status: GOOD (  16.61  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> It doesn't make much sense as a realm guest wouldn't want to trust the
> host. It will also need some extra work to ensure that KVM will only
> attempt to write into a shared memory region. So for now just disable
> it.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eff1a4ec892b..134acb4ee26f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -432,7 +432,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = system_supports_mte();
>   		break;
>   	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		if (kvm_is_realm(kvm))
> +			r = 0;
> +		else
> +			r = kvm_arm_pvtime_supported();
>   		break;

kvm_vm_ioctl_check_extension() can be called on the file descriptor of "/dev/kvm".
'kvm' is NULL and kvm_is_realm() returns false, which is the missed corner case.

>   	case KVM_CAP_ARM_EL1_32BIT:
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);

Thanks,
Gavin


