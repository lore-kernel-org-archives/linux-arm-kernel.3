Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A6C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUlQy+omekyAlQ/UT0+jDTx9lfmxYWK64YNT4WpuUK4=; b=ennzmt04GpnJJlEaLD0zdPStmi
	E6g0VHYbNJF0Cu3yUueIapoOkgKxCz/QD1RZzRMdKkzwWgU8+KRQ/chOXBkIrqPWofaBbnfLJpR/h
	o+HS8VRC+bIjLqs9eEV3PHRIbGdoQcRbY4G4y+RWR0QrD3RNCU6u6GTFY/wdeIIz8IldhWmW+jeY/
	qiYQMYbWVDaxdruVcWdkI4lxaULLeBFC8f8QY5K9ubbZvCpGubiFtZLLo/QqzhCsZyw6gAfM7gwg0
	uC99iwVlODQvGJbKwl63otJUrdKzHCb98MpzGi1So7AISIzp5qJnm/qPjjIvJu28Fanb6jZlHHQnR
	XPCpfSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv920-0000000BHMs-0Hrb;
	Thu, 20 Mar 2025 06:05:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv90H-0000000BHH4-0KoZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 06:03:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223fb0f619dso5530285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742450620; x=1743055420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUlQy+omekyAlQ/UT0+jDTx9lfmxYWK64YNT4WpuUK4=;
        b=i3+gRgq1v3Q/0H2c93GABiOpwP39zoAT8E6aBhT0JgAvzbHytT+mgpsg0xzlLUiJrG
         FMK3zjnXb5WnbAL6FDmS7MHvq85VrRtWQDnL3RdzzeAa0Og4AiaxFmjP/RbS2riWVZkZ
         94yQ5lOFm2VOeIm+4e4wNb/AQx+L6iKQ6FEWFG/mlsIYvDpVGrl5IYjoWa8lTHHTFxPZ
         s9hM1Vsj5RX9pShS5lLiFYd5aeCFUgTtde2vF6euXjXix0hxY1JPqsCOPJ3FvyhAAS7g
         oXqKDoqOnTPwC6h+83v9gTynchjfTMV/4Imj1xlcQvL1AS2FQYjSRplCyvdAN58K3KLi
         jktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742450620; x=1743055420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUlQy+omekyAlQ/UT0+jDTx9lfmxYWK64YNT4WpuUK4=;
        b=l9wabXsSEPZdSIU9SNORO4YwhIaBkON1kVse22aHN+OTycRojz5Bp8kprFneXIgdVS
         81RdUeqtUlqY2wy70u4EDeYMH7ppnshF/LieKwQsaMN1ijuG5HwpksLWBTyT4qCLfDla
         F2HWNB7wmOO7ZOaeM5KVJ++c9wizoH0OFWGZntBocNEpqxZd24HNzQDpAEj7o/fIBni3
         Esb/o1K+4q3OVr/TQi+PnAvEtlGlmiO5ZOsURdRPq/86GBVRXlsgu36aa7u8nvZoAmpG
         0jzgfY9OCndu29vmf4SzqOaiwdoNf6+JAcu4xLzdgXMkr/bqOHWPXztXPhu/FFqImQmd
         2C2A==
X-Forwarded-Encrypted: i=1; AJvYcCX8CRJbGJyKG30T7fSiGIl0mqcD3NK3fYBFTjWus6cSKaqWx5/nRWS6QWow1U+ry0ZPwkfXDi+vxGX7nw30zgwz@lists.infradead.org
X-Gm-Message-State: AOJu0YyRpO+6yHFdTP7h4H0rb6sP28QRVwB3aqnqmGvoQ6FMDONlUy6F
	a3iTIAzb/y6q2xo79cSa+jX6M5DsOCyl8Uq5Ef94M08MD5zuootgRiVc7Ze7t+U=
X-Gm-Gg: ASbGnctyG9n9mjUmkxv0AYpyjPTcvkLT9lfBlRUy+vIO0LzxqgUKmTyaMK+MS7G+4H5
	iudeh4jOqvyvtPcLB2+Pum1vujTbeG7ASBycZbyxUQb9Lq56/Mv96shrikPxwKA9YeQb3xYvPRU
	BZQTHohN1cun8tmfGBgCS+7Z+uv1FPnW+iueRRDiOoLJbF430uvBJL2uzMIIRaA0EebW+K2arKl
	gCspy6LC7cWwuv2uvr4fD5/mfu4r173ruPHvxBwr6y/EIE95igTXJ6Xf6R/kmNYkSeL9ZfaXfbg
	TdBMWJh5ZVALsiKHaf8FkfP5uJWA8wyWscyOQkVuV8A+xx7t5ksOrJRx1w==
X-Google-Smtp-Source: AGHT+IFenEJO6TI9Hsl5cc1hX2SStJer0wmUMMpctF1K7VqnKKB8w0l0InlYXp+IwtSylHw5lHcLYg==
X-Received: by 2002:a17:902:d2cc:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-2264981b59bmr83265325ad.9.1742450620129;
        Wed, 19 Mar 2025 23:03:40 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711557e9fsm13269592b3a.51.2025.03.19.23.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 23:03:39 -0700 (PDT)
Message-ID: <0d84bc94-1c65-4737-a2eb-aa7f96a7d1e0@daynix.com>
Date: Thu, 20 Mar 2025 15:03:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devel@daynix.com
References: <20250319-hybrid-v1-1-4d1ada10e705@daynix.com>
 <Z9pze3J2_zrTk_yC@linux.dev>
 <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
 <86plidmjwh.wl-maz@kernel.org>
 <bd681ec6-0b4c-47d9-8a4a-b7324c0883a6@daynix.com>
 <86o6xxmg87.wl-maz@kernel.org>
 <aabd71eb-286b-475c-a30e-d5cf5c4f2769@daynix.com>
 <86msdhmemw.wl-maz@kernel.org>
 <cd7b4528-34a3-4d87-9711-acc2c2e6f6e1@daynix.com>
 <86ldt0n9w1.wl-maz@kernel.org> <Z9sSMJAlf7cQ5viu@linux.dev>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <Z9sSMJAlf7cQ5viu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_230341_128682_72AA50AE 
X-CRM114-Status: GOOD (  28.35  )
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

On 2025/03/20 3:51, Oliver Upton wrote:
> On Wed, Mar 19, 2025 at 06:38:38PM +0000, Marc Zyngier wrote:
>> On Wed, 19 Mar 2025 11:51:21 +0000, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>> What about setting the flag automatically when a user fails to pin
>>> vCPUs to CPUs that are covered by one PMU? There would be no change if
>>> a user correctly pins vCPUs as it is. Otherwise, they will see a
>>> correct feature set advertised to the guest and the cycle counter
>>> working.
>>
>> How do you know that the affinity is "correct"? VCPU affinity can be
>> changed at any time. I, for one, do not want my VMs to change
>> behaviour because I let the vcpus bounce around as the scheduler sees
>> fit.

Checking the affinity when picking the default PMU; the vCPU affinity is 
the only thing that rules the choice of the default PMU even now.

Perhaps we may model the API as follows: introduce another "composite" 
PMU that works on any core but only exposes the cycle counter. Robust 
VMMs will choose it or one of hardware PMUs with 
KVM_ARM_VCPU_PMU_V3_SET_PMU. KVM will choose the default PMU according 
to the vCPU affinity at the point of KVM_ARM_VCPU_INIT otherwise. If the 
affinity is covered by one hardware PMU, that PMU will be chosen as the 
default. The "composite" PMU will be the default otherwise.

Regards,
Akihiko Odaki

>>
>> Honestly, this is not a can of worm I want to open. We already have a
>> pretty terrible userspace API for the PMU, let's not add to the
>> confusion. *If* we are going down the road of presenting a dumbed-down
>> PMU to the guest, it has to be an explicit buy-in from userspace.
> 
> I also have a very strong distaste for the crappy UAPI we have around a
> 'default' PMU. At the same time I do recognize this hurts practical
> usecases since some VMMs can't be bothered to configure the vPMU / vCPU
> pinning correctly.
> 
> I'm at least willing to plug my nose and do the following:
> 
>   1) When the VMM does not specify a vPMU type:
> 
>     - We continue to present the 'default' PMU (including event counters)
>       to the VM
> 
>     - KVM ensures that the fixed CPU cycle counter works on any PMUv3
>       implementation in the system, even if it is different from the
>       default
> 
>     - Otherwise, event counters will only count on the default
>       implementation and will not count on different PMUs
> 
>   2) Implement your suggestion of a UAPI where the VMM can select a PMU
>      that only has the CPU cycle counter and works on any PMUv3
>      implementation.
> 
> Either way KVM will need to have some special case handling of the fixed
> CPU cycle counter. That'd allow users to actually run Windows *now* and
> provide a clear mechanism for userspace to present a less-broken vPMU if
> it cares.
> 
> Thanks,
> Oliver


