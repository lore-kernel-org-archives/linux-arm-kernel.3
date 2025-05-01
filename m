Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BBDC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=; b=0Azdh3lMWILPw165Wc52b+hbig
	wltGPcAqe4T1uDYyFtSfBHNPymWSAThnjHN2dCcGfAHcL/2GpfhdxQAGP+8nfqwiSlU1i2NzoYXtr
	bnSzv99lDE4qqn8o4xCZopdZTYyjznGGAs4oj5kgfPyjU+FVBqOy8Cplh1Y7Rgy73MJKfvnI4jRf8
	k/uUxw1mM2Erjr38gXpV0WaxkMIfM8CMfUECOUUWCbvU33pYwMSVAGWVrC1Z0gKVbiCE789sVsL2w
	/9muUr17XsfEg/CA5ew+iRuAWW4L1MKzOcZ6rzWVSAFtfNMy3X0qGlkVGsGlC1h1xBed7Z4+acqgT
	h8IaLp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKFs-0000000Eads-203F;
	Thu, 01 May 2025 03:06:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKDw-0000000EaQO-2Pzj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=;
	b=DX2TzWsdWKQu2ieuKDdj8hFhtvNEMdxPl8fH8WTcJv2SWmxy7gmnqGw4XMWKH0lDtav6WU
	kcbqxR9j0+UfEn6dPjhwt+jHaRsDvLNZkgM3r4tOpxCm0W0BpEdUb/tNQyNbtFNZRc2uiQ
	vJIJRg/HIs8ogMCFVRh8sLuz8D3hNHM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-6iS-EbtYOgKVWYWhhEJcFA-1; Wed, 30 Apr 2025 23:04:30 -0400
X-MC-Unique: 6iS-EbtYOgKVWYWhhEJcFA-1
X-Mimecast-MFC-AGG-ID: 6iS-EbtYOgKVWYWhhEJcFA_1746068669
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227ea16b03dso7431795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068669; x=1746673469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=;
        b=vKMHpSA/er/y0BnDluwb6EZAsmmJRLdiVdEN9ZY5biKOSYnVkN5pUIKfPfWtUuRPAr
         1MlB+eRMpO5XiYwttycFuYZBVHP2tOqtoFxbG3bZV9OidU/2OboMhkSNm6A3y6/d6bgK
         acLwzfO+cvFuEvz5HtjSCOLj8ijqUe9X6Q3HFHd+B0PXWJoyF9FWTuB/UEEc4+cyO1/u
         M+IGcxVHoVfOGGvrMKITIjXncf10712cSv9l6ifAc6dYexxcR6VgVNGiirvu2T+Nl+Xx
         i5+0VrhczKXPwb6s74t/x5Rf0crXXuxYilkA5qTMlgLmOX2y/OcBrgjHsEHsOaolZx9P
         uqqg==
X-Forwarded-Encrypted: i=1; AJvYcCUn6lB8icDi+D+wa7RrjP07NwUCkmJNx1gRXsFNGFdeH/5zVQHgznbCAf9XtizOb/qWjqhL5CQxdEei0/BH4dZy@lists.infradead.org
X-Gm-Message-State: AOJu0YwgV0nsoBEEclFKTi3IttLCt1AwpOZZw9BOiFNLF7B/x2yJSDpp
	SLUF8lAOEAd9s9DYjOvvcbSmgQnL54L1ztEmbTQ2NH0FrEKsmxiEWgsFM+RVDCyBh4XjYKABDtC
	MAKazunDPqOqHP5vxgbVGLtW7/4xm/QLhPF47pEdFags8P25yA9Ve20fvnixEEjqLdwiEGQwl
X-Gm-Gg: ASbGncvi2ELjL+UJRKmlnmvgtcZZp9G2VblXTVmQuJ1ie6tL5MY++YHlhobM0tYQpx4
	9Ov9BFeCpVei0gyp0qgd397zr7AxtXcvEuQ/R65cjSh1ETdHE+NTrJVPUGWq7FCPLRM70q0REui
	Kl9gv/VAAnhd5bjLnkxjYnAm5dyEcX3pj61hB+FI8yHmyaTUjxe/epF/6JGL00RvOhGwMbFnjt7
	Rbk9A/mv4TmqPQMxJkSe5uoMCSExf/1BknNgx1tw/vpMp7o2zFLHPwCPljeT6+dAMnxbzV0YSxl
	c5svg6jEOcPb
X-Received: by 2002:a17:902:ce92:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22df5837638mr79119435ad.48.1746068669220;
        Wed, 30 Apr 2025 20:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBHru6AxoF/0GFxqHSMv5iJLveZy61hLLoLevsQlDtlaYL5OE3bmqNgmfr/Tilhp0TcTxL9w==
X-Received: by 2002:a17:902:ce92:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22df5837638mr79119055ad.48.1746068668908;
        Wed, 30 Apr 2025 20:04:28 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a1dsm130579985ad.140.2025.04.30.20.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:04:28 -0700 (PDT)
Message-ID: <b1ac33d6-13ed-4870-aa60-36393516d593@redhat.com>
Date: Thu, 1 May 2025 13:04:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 41/43] KVM: arm64: Expose support for private memory
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-42-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-42-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P7PY7-OaAs3DIxjnU5MuWMRoXKA_HlxrVEnu8sI_hVA_1746068669
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_200432_697484_5327DCAE 
X-CRM114-Status: GOOD (  10.44  )
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

On 4/16/25 11:42 PM, Steven Price wrote:
> Select KVM_GENERIC_PRIVATE_MEM and provide the necessary support
> functions.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
>     function call.
>   * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
>     #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
>   * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
>     should trigger.
> ---
>   arch/arm64/include/asm/kvm_host.h |  6 ++++++
>   arch/arm64/kvm/Kconfig            |  1 +
>   arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
>   3 files changed, 31 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


