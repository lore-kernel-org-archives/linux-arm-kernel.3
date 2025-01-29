Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BBFC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 03:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB7bwFdWnORe6bKwIQ/6vJQvYuugxQ4y04Yn/yJKnPc=; b=ViueIJ30KlkNGcDbUnlMTbbodY
	UdWSZPNGYMsF0KCiCV2CwvDffz3hkaePdjJmdaRSukxI8wi5NqV+WwKperrqywqQjunFt2tDx0Niv
	4jouTjXdSwcL0nKIl1hlPwATsXJC2O6O6GF8NsQrF5khJXwa1L1bK+NSApykYXQOZt+rLh/dln9zd
	FYF/W97vk9fYm8ZwCXado5JYFsypnwLwB69pwJapps9v9dN88zCYgMzXgWewlfx1sNoruiHuIymqD
	UXydZ0eBfMMrihxHtnCHDgnX52fG3Wao81/YR/jAahOaM5qC/kGcKd92kwMWTqIdQwVuYSoShaugn
	ZOUBgBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tczEE-00000006HgB-0FTB;
	Wed, 29 Jan 2025 03:59:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tczCs-00000006HbD-3q9I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 03:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738123057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zB7bwFdWnORe6bKwIQ/6vJQvYuugxQ4y04Yn/yJKnPc=;
	b=Aa5/CIV0FODsjRGJBc9JB4YnCCuql+xuad9iEMXw9p8VT/iMMR6OOdLgvcdKa8LQT9KDpx
	AUHprXd1nVcu358D/HgcEGELxXLwQDO/KWRh/YTXsyMimTuA7ci/W2Dgey9pXkUc7u9LzI
	1D67GSf7YEyaS3yx+bD383YMkbKgZmM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-z4LZh4JJOgu0qT4BGK1TIg-1; Tue, 28 Jan 2025 22:57:33 -0500
X-MC-Unique: z4LZh4JJOgu0qT4BGK1TIg-1
X-Mimecast-MFC-AGG-ID: z4LZh4JJOgu0qT4BGK1TIg
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2164fad3792so111748215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 19:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738123052; x=1738727852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB7bwFdWnORe6bKwIQ/6vJQvYuugxQ4y04Yn/yJKnPc=;
        b=VfuFjq0zJy0+3oiycOxRA/eSPY5xhaaIXvt8pl77bMC4W987gi3SghE+lO/vbu9t52
         FfdMxzCmHu/60VG0xvqL8DvlELMwMGygMcpb0yZZEb17OtNVCf800yLlJ0w6jDFTl2SO
         HZ6KHnXmrn0VtvywdHM8R3/K2RwsAsr2xbdRDP2sN4rzOdkp9zVHUoUykkzr20wP5Nli
         3zoqD2PSvBK3NdfNQUf8zZMvQgFCBGWcnaT1eY/8xpFso4QYCAvUfkf1qBxx42lmqbHR
         X7TdOP9qK8RpuVLANEBudIvmpmtcHh9aOwMK1rZRp90W77F3mnWJn0E0QHQB5HtY1np2
         LaPg==
X-Forwarded-Encrypted: i=1; AJvYcCXX6n+DZ82FUKXjS+47GuiWCaUT64T7xZuia0mo/kZCPP4RxCV/oDfb7yr9K2IhwDMci0sEDJbwC9ojuuqcgP9i@lists.infradead.org
X-Gm-Message-State: AOJu0YxYFYTwaXUUsi1q9k8Lt9u53br6+LcYTXENuOBJOqgrvYpDtaEF
	3CihW3h1QgDvt6MNKDDgaUEAC5bFYixzFZo6nTkrNnPzV6b1ECu+U9NVKlfvUrdbTfqrPwixBQe
	eewaUYhLXEbxFlVYYxQPQpD8bw5He/N0kTiu561tSrtTdVutiZrhf5QAbpLQ53HtQ+bEwCBxV
X-Gm-Gg: ASbGnctVYoAcP+CztcsE8ZHGO9cS52elcbMJ4lkLvw/eTzGKWBc9Gktq2HlvP+NZDKW
	81AjKy0A9R8buqhCh2E6GCBIT50SwQqAxQdhZrKEWTyDqFhMJ2xvu0wwTIOM2jshEIkCz6JqW9z
	VU7HwNOc4RQ+qtv/TS/1ZBqEQVYOtbSqv8dNx+KnjY4OsJbcwSyHhNI/BE3+cGdzvOcgqaX7yN3
	vqHdFFPMxg3WvzB8tgiNjq2oJQVBADX2Or7gaATGo0cEQrHyemvkfRlmrBLTfG80RfPKZxoBV5l
	0LZH8A==
X-Received: by 2002:a17:902:ce8f:b0:215:9d29:9724 with SMTP id d9443c01a7336-21dd7ddfdc9mr26688205ad.38.1738123052538;
        Tue, 28 Jan 2025 19:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdY9KvQ422zqadztWkjkXDL2LuY//Pm08gZwRPHxwWf8KuGeFvCcuuj/IQ8VEC/M+7z5zZXw==
X-Received: by 2002:a17:902:ce8f:b0:215:9d29:9724 with SMTP id d9443c01a7336-21dd7ddfdc9mr26687925ad.38.1738123052171;
        Tue, 28 Jan 2025 19:57:32 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9cac3sm89760675ad.38.2025.01.28.19.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 19:57:31 -0800 (PST)
Message-ID: <7271b3ff-8665-4a98-b3dd-77417f85d5e3@redhat.com>
Date: Wed, 29 Jan 2025 13:57:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/43] arm64: RME: Check for RME support at KVM init
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
 <20241212155610.76522-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EbuU7SYXxfD8mMXplgzWU2zt-K6zYNqJG60fVgK3P80_1738123052
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_195739_042661_C3318C03 
X-CRM114-Status: GOOD (  18.61  )
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
> Query the RMI version number and check if it is a compatible version. A
> static key is also provided to signal that a supported RMM is available.
> 
> Functions are provided to query if a VM or VCPU is a realm (or rec)
> which currently will always return false.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Reword "unsupported" message from "host supports" to "we want" to
>     clarify that 'we' are the 'host'.
> Changes since v2:
>   * Drop return value from kvm_init_rme(), it was always 0.
>   * Rely on the RMM return value to identify whether the RSI ABI is
>     compatible.
> ---
>   arch/arm64/include/asm/kvm_emulate.h | 18 +++++++++
>   arch/arm64/include/asm/kvm_host.h    |  4 ++
>   arch/arm64/include/asm/kvm_rme.h     | 56 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/virt.h        |  1 +
>   arch/arm64/kvm/Makefile              |  3 +-
>   arch/arm64/kvm/arm.c                 |  6 +++
>   arch/arm64/kvm/rme.c                 | 50 +++++++++++++++++++++++++
>   7 files changed, 137 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/include/asm/kvm_rme.h
>   create mode 100644 arch/arm64/kvm/rme.c
> 

[...]

> +
> +static inline bool kvm_is_realm(struct kvm *kvm)
> +{
> +	if (static_branch_unlikely(&kvm_rme_is_available) && kvm)
> +		return kvm->arch.is_realm;
> +	return false;
> +}
> +

kvm->arch.is_realm won't be true when kvm_rme_is_available is false. It's set
in kvm_arch_init_vm() of PATCH[10]. So it's safe to be simplified as below if
the changes to kvm_arch_init_vm() is slightly modified, more details can be
found from the comments to PATCH[10]

With the changes, we don't have to check kvm_rme_is_available every time.

static inline bool kvm_is_realm(struct kvm *kvm)
{
	return (kvm && kvm->arch.is_realm);
}

Thanks,
Gavin


