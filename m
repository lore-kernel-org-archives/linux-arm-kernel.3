Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B48C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I5yDc+vjNEcqE9R+YmZ5CGoORcg69x/77QunGRnchU=; b=aN+RfdmDvQzn0iDkR8KMpmnwM4
	sqpBP5blUwixNq64m2SfSHtC5CBaDBnGPXU5MXOvXus1bPN0GbDuqHmiAMzXLYhsJhAVcyNyo1248
	kGx2iIptif1m2MVjJ8eOlkHw0XgwEHygJj7cx56ZuXdTOpzrP8lQKb5ekU/a+GKHczj1hgoOmGkk3
	idKrBdTw+L8JoMCOQynYpQQH/LvBE8ufFZKSyIiSpSnClVErR/6Kcpw77amdLrFYzN95ugZ1R8sYS
	R7Q6hAuZaNP0BMnHZxip9FwNlXz3hCC0I+RoFTrih8YBppL61PC2De5tS4wzsnuPwMANP5f5DD/xg
	rdSxLakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0ON-0000000BnnQ-3VIa;
	Wed, 30 Apr 2025 05:53:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0DA-0000000BmeX-3oUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745991743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7I5yDc+vjNEcqE9R+YmZ5CGoORcg69x/77QunGRnchU=;
	b=NWxczcFleEqLWof7rKJwd1S26k05poN15hlRTRwnQiAlhjU2uFGQcUTGu9fVcgZ6390Dyp
	yTmB5LAlOPY93NJfp9EgEjN8WARE/Rvk7NgJOOpCr4UdOrC9V9sl3gKR5weMmQmxnU1Qmt
	uwVCCQ1V6D3Ksa5mKeBbWkjubLFRCtA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-xubEDDLbNdeAcMo0pxygSw-1; Wed, 30 Apr 2025 01:42:20 -0400
X-MC-Unique: xubEDDLbNdeAcMo0pxygSw-1
X-Mimecast-MFC-AGG-ID: xubEDDLbNdeAcMo0pxygSw_1745991739
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so5755972a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 22:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745991739; x=1746596539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7I5yDc+vjNEcqE9R+YmZ5CGoORcg69x/77QunGRnchU=;
        b=RsNhbObV1zD4RsVnAIoTxvEiHwn81liuRLJHpLjp5G/F88hidIPZTTpJjBiXj9fxJ6
         C86U4PW5QagT/DgxxFoa+1ra1ElH/HBEY+buDYuiGKoZfv/x2Q+W3r+2hu6QbLbD/bpI
         YREyn85bnMDQKcmheJ8kuHDhI7ad2c8mph+cM2UXnjMOoE3I8eNTjmmB2e9oR6I07BPp
         oYmfxXotykxV2CHXLxPvmdiWryOTV8VBth93ljSYeIxZz2V64McmVHbdnsf3tWKzq+kP
         CihsEj9FWLfSW5sisEVy5nCIKxiwCg9g8dLZSDYJx8weXvcUmMn4UpJrHfn2jPPlQfms
         nGuw==
X-Forwarded-Encrypted: i=1; AJvYcCWpFVv675xBD7Opa36oSFnuGho6+04T86XaFRXNfbb8GvCggTb7dD6lznvq59cmvIT/zQf+jdjX6/4qxCbthVOo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+g8su7LJUnzh5+D1nvLz9FSNJqpG90xNef7+asznm2tbIM2Td
	kbL2BTew4oTKDASg3A8Du8v7ANu7FCOeVHrNtSblzVH+6a/Om2cjHFrCx+4olE6SNH2yCLWSKgO
	/azU9JwB5YhE65NJPg7G7TOwC/N/la7QdoINnf8koIKlBsW2StWvg5ItyTeGxX9PjHCDfhs6j
X-Gm-Gg: ASbGncsNTRtTwOXHQBMXGW/4vdZPkssgXoH1U2OXhdem48xj4wQHGnig5rLM0O7n5ij
	SM4ayr9eOSmAvovoZepO0RgBGpA+lxOulAvFjNv4x8EqxonuvEWBYC5LU8HHO4GY1z+gmeeeiII
	Q8DQxN2vmSBg1efAbRSlsBGi86/F5xeHkAHv+rnZxbjd0Kpho5pmlCPg3GdsYbC4zWcDHVBgJgs
	UgnpknSBO+6IrB1srX6zQmZZx0avqzskFCc+IKQOq8CDhOX1ZKYEM5nO3bvgF6RlRfqlRpGPFVq
	V/+mgfOmehWY
X-Received: by 2002:a17:90b:3d84:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a34450c14mr2039774a91.25.1745991739016;
        Tue, 29 Apr 2025 22:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/2rRziMqV7exhtrwhKlwQtmufkCV9nFsAwejZ6czk2oG8bIJh878e13vez0tndZIUCamZFg==
X-Received: by 2002:a17:90b:3d84:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a34450c14mr2039752a91.25.1745991738750;
        Tue, 29 Apr 2025 22:42:18 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a60882sm624669a91.45.2025.04.29.22.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 22:42:18 -0700 (PDT)
Message-ID: <a045f5a3-d637-45b0-b109-394e8ad0f409@redhat.com>
Date: Wed, 30 Apr 2025 15:42:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/43] kvm: arm64: Don't expose debug capabilities for
 realm guests
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-9-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-9-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TTLuPN_h9IiSWTimHApyXCjvH7QBczMdq5aMGgtJ4fA_1745991739
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_224225_028964_72DEB1F8 
X-CRM114-Status: GOOD (  11.61  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> RMM v1.0 provides no mechanism for the host to perform debug operations
> on the guest. So don't expose KVM_CAP_SET_GUEST_DEBUG and report 0
> breakpoints and 0 watch points.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Remove the helper functions and inline the kvm_is_realm() check with
>     a ternary operator.
>   * Rewrite the commit message to explain this patch.
> ---
>   arch/arm64/kvm/arm.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


