Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AD6E68948
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTKGoVCMzkDuH8fl/VeiFRqT8A+kvrBX0o55Pxkty9A=; b=Jlv/Pa1Xg8Ksm2/lpm1YITgsKc
	fyj/RKu5GyDJrgW1E3g93aiwKM1DI7kF9Cyd1pYbHPOYZkq0YiMXVJYvpJu7k17A2J3QqK3fegZ+H
	eFI3TQepr7nYQw4oXDhDVTXo9HbOa99HI5w9hWLoKTo+AkVI4vvM6sayzOqq5GpzLeLtBUEMSl5aU
	IZkkQ+SxqHCmYUdqUgFHXqX6OnGBBgeb6+1TocJsR+zbV538XNcfghUv/lxDZmAXKsflNmuMss5NO
	lVrTxlTEiBkk+DwQjwGmDqCOkw1W6cinOe5BSvSDs2aONIND4UPRbx8byuLAPd+VHIozsumSCQ9J9
	Nz/v+pCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6LfG-00000002Pfa-1Xb7;
	Thu, 31 Oct 2024 03:16:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6LdM-00000002PSy-2oC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 03:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730344443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTKGoVCMzkDuH8fl/VeiFRqT8A+kvrBX0o55Pxkty9A=;
	b=BKYfvaOhZtp+EOzDCvNLxXqP0k6Zjoz0gjAXqiBov4xDbvgE+0merfmCEESxbSuf3pcZWO
	mf45SNVj2VVd0wjomIxJRe4P6iNrEzwgff2Q26jBImVb8KdXqRMSbtTAFMQIQsO4HoCZEb
	78jUdUk7S6FNB6cSQMiwQbePCvOAcPU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-9lq04kVyMQe0-5V-fkU3RQ-1; Wed, 30 Oct 2024 23:14:01 -0400
X-MC-Unique: 9lq04kVyMQe0-5V-fkU3RQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-71e55c9d23cso428171b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 20:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730344441; x=1730949241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTKGoVCMzkDuH8fl/VeiFRqT8A+kvrBX0o55Pxkty9A=;
        b=pJPJrGTMbF2kZkIrW+C2qZxSkEmKQEGLLrO2lR3aeDPASBSgkEepeCYyxzTFDqUB+t
         VsyEWZSzRQ53wg/DLutEd66qpIg4DQIB1djxPXmr1TOpYtpAHcj9O0DF5v3JJQq9XEh8
         Lg7l91Bs4fvTHvX4ZfP877DkrUKCQrMGfNh6qOvekor88ARdsK9ei6589UzuCv8u+//J
         lcWsZzRbu6SPMhwXX/WJ/uhP85MIvF8j25buYxYmWpuOnRdv6xamiVP8lbHRh8eNVbjB
         XpWwj1RV6gwngDrKtXxCkBGMu7KC5+gdtYR4+Tc44Oy12dxsUzlW2if8Rp8OII548233
         PiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbZ3t6QiY5kg+OqoxLExfIHdR4ekzgkyvnZiQCz30hFPI6oCAqclphfQa/A4aUBTya7Ap1pJClnPxSMs5xHwlw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0NRkkGdvWkfEsFhkznDn91X6b7DiDaxZELKX/0ZWdJEaUhkYd
	43qG3FZtXNvvHEJUjtodrSx9Yqh0YQd2QvKWDnp3nqZklCdg7lXMykhZQG5GGv7xAktJXtC/Maz
	d8px9+ocRh8SfsMilSomwj/clobYZCIyN4VM0P8jObb6jVYCSpUhai1SQM+7KZfju7OjwWIyF
X-Received: by 2002:a05:6a00:3cce:b0:71e:6f09:c0a8 with SMTP id d2e1a72fcca58-720bcf7cd87mr1439883b3a.10.1730344440764;
        Wed, 30 Oct 2024 20:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIm6yUfoX4+vV2bezpidPQJuqYiQkZymlRrV7eXlScNtQU40n2VYP2jaFihtlrXexOAiLh+A==
X-Received: by 2002:a05:6a00:3cce:b0:71e:6f09:c0a8 with SMTP id d2e1a72fcca58-720bcf7cd87mr1439851b3a.10.1730344440367;
        Wed, 30 Oct 2024 20:14:00 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a7f5bsm315261a12.24.2024.10.30.20.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 20:13:59 -0700 (PDT)
Message-ID: <1d96caa1-db0c-44c1-9f10-e7d94f80ad90@redhat.com>
Date: Thu, 31 Oct 2024 13:13:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] KVM: arm64: selftests: Test ID_AA64PFR0.MPAM isn't
 completely ignored
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com, james.morse@arm.com,
 shameerali.kolothum.thodi@huawei.com, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Jing Zhang <jingzhangos@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
 <20241030160317.2528209-8-joey.gouly@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241030160317.2528209-8-joey.gouly@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_201404_811868_616FCBEF 
X-CRM114-Status: GOOD (  12.87  )
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

On 10/31/24 2:03 AM, Joey Gouly wrote:
> From: James Morse <james.morse@arm.com>
> 
> The ID_AA64PFR0.MPAM bit was previously accidentally exposed to guests,
> and is ignored by KVM. KVM will always present the guest with 0 here,
> and trap the MPAM system registers to inject an undef.
> 
> But, this value is still needed to prevent migration when the value
> is incompatible with the target hardware. Add a kvm unit test to try
> and write multiple values to ID_AA64PFR0.MPAM. Only the hardware value
> previously exposed should be ignored, all other values should be
> rejected.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   .../selftests/kvm/aarch64/set_id_regs.c       | 99 ++++++++++++++++++-
>   1 file changed, 98 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


