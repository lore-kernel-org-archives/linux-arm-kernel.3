Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A4EC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6EHKP8IMf41CnMw8MbfWQc4SNnrbtpA2MJtfflzP38=; b=fiDvuSINmiASeiddog2uRmC09P
	pRwxsXUj+0en9rfL9++GQfdS6PMhfb4csAU2nR9+gQRfS+rIZy7s3U6O2VL9iReqT8Og7fLiYsq57
	6G+p6e0AsXoenp/JTld5s25Kb6pyr77ntm/WMoDsAGinaqxM/F+8TfaX87m11yQ1C3OsObdJEHsf/
	iNWD0aIQbaDJqOSURz9mPDWVTzG4/2d3mrNFQNmef5wdEQ2CToYo5XfeqDTijLOZ+JDZj9bsWRHKL
	GgydqKBELllqC6wmzTvXRG85/KBLL7H4R2NmqNSKIX6HtIXHC5klMcEfOfn/19BNstb2uSke8Jk2s
	/bqMA86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKHj-0000000EamW-0VCD;
	Thu, 01 May 2025 03:08:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKEH-0000000EaUV-1cX2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6EHKP8IMf41CnMw8MbfWQc4SNnrbtpA2MJtfflzP38=;
	b=ac6wenrQLCWsbTg4QnkJwU756IuMt/GSbbl/k1wASDfXrqFn5CMp5yPK90us2N6ezyHqo4
	V3FIjb/R0SbOx6JQrOPx/eign0G+TliUBSZD58WhmjCfJAFdvUgVeXeTMzkdmF3psC2qFf
	HSaJTy3LuuSBZMks+PMbP2ucITEvcHY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-cfl1pKuhO52FzM3qAH4GAg-1; Wed, 30 Apr 2025 23:04:50 -0400
X-MC-Unique: cfl1pKuhO52FzM3qAH4GAg-1
X-Mimecast-MFC-AGG-ID: cfl1pKuhO52FzM3qAH4GAg_1746068689
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227e2faab6dso4358305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068689; x=1746673489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6EHKP8IMf41CnMw8MbfWQc4SNnrbtpA2MJtfflzP38=;
        b=EhDMq/h62Ju+4LxYRp+NXEuVETJaG0NXWKknkau8uEvqyiKg9jlItHzIi2iVdy1Onk
         1TPiDvbBPK/dRqOGzK+wd7+zrYoyA2TSdZt2X18/qokh6TtenOr0WWmjTtvyV+PzPRhT
         Mgr0TqQB22lg+7w09QFVJDqL2C2tYye5BZ3+eN3/ZwFEFVoXA47BXTyhilwexCTi/Vip
         eJwe2FqPUiSdbpnqmZLdXlOf45Ieddc5esSPU0FGRu8RDuZhhK3irJorkiWawEsvR5DF
         wkvmBbmMy0kN2acfZ8JaU7eBeVcc2229YKZrOZpzYj5gxszgxMC52xCP6Z+BJGapnOK5
         swIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVycM/yvGYfAqoMQLKD6uXvNE7bA+eBGT8SeorSLjsWR14Mzc/gRKOx6VuYPxTYBbpiMDbkqJY8cA9TO/n6vys/@lists.infradead.org
X-Gm-Message-State: AOJu0YwzDkODCdnTzgMV2EikZPZNDit2rOqkXv5fvZwN77YCXcvCeZZL
	D7kkCLeJDjAj8EO9jo+k/5hx6/vNcsnDpw5jNo0gogObTVEzt+ryxDMnQrIoGCcXJGTLcPk0ACd
	8p8Dh6wxd4W1fEZcoKxc/EO+VxFyLI/0R5QVZ7w0Nf6qQaznV5f5HDXHOrev9Um06eHmffwZd
X-Gm-Gg: ASbGnctEC6eoqchScTFwiyf71vlEaERvf7pFWhedD1SblY7N8u+12DapI8fsCmgL5TH
	/waTw0/OJkx081x4U6l32VhsvXVuTeUJS1iXzarmNXwB1iiG6LGn/JI7gRULfpHfshdtZYrTqQj
	hvcox6aljLLGX2iBmlsPmRcw25VpEJI63m4XpH70rbQGpvbeUzpuNMIdYZT+Niu/mz9d77h7v4f
	X+bS7kydlAo4LePiBr5kL4wlPsfbf7fTTIbXzmBwuCUG80yOTDI1vA4a4Xt3t8ZCjDzAzSoqIJu
	AP1K82qkhYK5
X-Received: by 2002:a17:902:ecc3:b0:224:76f:9e59 with SMTP id d9443c01a7336-22e040b0136mr23366975ad.10.1746068689281;
        Wed, 30 Apr 2025 20:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1HYZaymy6EVaTH4wKRIzEm7W7NnVNI2iwuZwa7SP72F5l7R9CUpKQ6EYxkWw1HKHA9Whnjg==
X-Received: by 2002:a17:902:ecc3:b0:224:76f:9e59 with SMTP id d9443c01a7336-22e040b0136mr23366505ad.10.1746068688970;
        Wed, 30 Apr 2025 20:04:48 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a244bd4e2sm3593226a91.0.2025.04.30.20.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:04:48 -0700 (PDT)
Message-ID: <e26e4225-e9a8-40b6-bafb-9a007b20db96@redhat.com>
Date: Thu, 1 May 2025 13:04:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 42/43] KVM: arm64: Expose KVM_ARM_VCPU_REC to user
 space
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
 <20250416134208.383984-43-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-43-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2phSR8-fA1mCNViBBOReTc7KC0UDTEY-lDCVyDUcrTs_1746068689
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_200453_501019_9BB7E543 
X-CRM114-Status: GOOD (  11.99  )
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
> Increment KVM_VCPU_MAX_FEATURES to expose the new capability to user
> space.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> *NOTE*: This also exposes KVM_ARM_VCPU_HAS_EL2/KVM_ARM_VCPU_HAS_EL2_E2H0
> (as they are both less than KVM_ARM_VCPU_REC) - so this currently
> depends on nested virt being 'finished' before merging.
> 
> So this should be merged after: "KVM: arm64: Allow userspace to request
> KVM_ARM_VCPU_EL2*":
> https://lore.kernel.org/r/20250408105225.4002637-17-maz%40kernel.org
> ---
>   arch/arm64/include/asm/kvm_host.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


