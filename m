Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C79C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 23:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyHbZ+Pwxh06r8uU1Lo24oDU5q1mx0zS6wBE1H4R6WI=; b=nkSZX0Yg/nIcuxKluM26GOGtZx
	SsQfgVIv5JDP+EuemmMBaqz3TinHmaczsZfiUFvKyzKoMR1tXmlxtZTH2RtlYUG2gpXiShUgFJmtE
	23i87IgwKhOmXEaBggT+Y7DJg5yAHmfDoa0PgRF9Iv1NZBC4lSjSDgPiuGo2fnHHxF2kqST0YRdHY
	GEUJrIW8zpKsLbZzQmg6N0H7TdCkRNc5G0CXLMxpDWg1BHgCzD7krY5n8uLAuct5zAdXnUmRJne4M
	cBfk51q7/viyrHi5lI5hCfcmRxvqG1A+r1nZdWJVHEe9B+ucc+U1Y/vzsWSnfYKO4GHigRH/GNPRZ
	70GI7wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHAW-00000007vkv-1Gjg;
	Wed, 29 Jan 2025 23:08:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdH9B-00000007vf5-1MVm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 23:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738192018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyHbZ+Pwxh06r8uU1Lo24oDU5q1mx0zS6wBE1H4R6WI=;
	b=W67kCPEP/yZdGQkg2Gmrl9fEB9XzKOwBLbXJIhk9Os0f8qMBtek1zkD+XA3iOhMuAILlXy
	h5sFNKx82O7x8WknJ+ZIrHqIybOeMf/bWPFVfaUdNZITyiXPkFAhrnVPlzBVWZev9OrVq7
	wApN7rU+ttxP4aRYg4qNTUcvfbOqfEk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Tnv1Bs2xOHSb9j2H3FXpAA-1; Wed, 29 Jan 2025 18:06:57 -0500
X-MC-Unique: Tnv1Bs2xOHSb9j2H3FXpAA-1
X-Mimecast-MFC-AGG-ID: Tnv1Bs2xOHSb9j2H3FXpAA
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so255810a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 15:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192016; x=1738796816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyHbZ+Pwxh06r8uU1Lo24oDU5q1mx0zS6wBE1H4R6WI=;
        b=MqZrnfkc7QVOjcLODqPvQAGQ9D45nZodKAUb2wPnt4IQcD5iYaLjkQB/M5DYcrOiB5
         GjMWZTk8uleIYVOoRJpmaVbGBXOJr4ehJELOwMDhH5jts1as6q0fu4ghDDxvNKZNV/mg
         ruwtU3VckS4mx0o760qscqMoCYeWMgOXGRuZrooGKcpkd+j5kQcWp2tHEWyYag8Zo5+p
         znFMuw+9UsVDthsSITqRxsuQgNoWD/SaLRtnNyINrO3jrG1kjH0a/Bx3awpnqjSiJAwy
         poaRc/nXFp+uA7Xz5eycBS/rh9N6tW1AZ0bx+vCrMXq4xxWKqNklZcDkURNVXD01qZwu
         mT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbiAJCTCf8MAnqUyypFH+NXdkWTtFY1U9BPhdwJI3IOv+Gb9Yyj6jHjxEaiOoyDkT5tgwypiEbFHybZKRoO6RP@lists.infradead.org
X-Gm-Message-State: AOJu0YxZlh5+ovQGZObHojLHyoAKhtadavSc1jfGgFq6XNzDuvuCttZI
	Utfz3AEsyS4sTzFguz4xnv3E4h+2Zv13pdRiEfmTiQ1Tk48V4JW2DWE+uxONQzEpm5rZvzB8afb
	bjZKs8lA0tuPoZH5K6kQkS0FXak6zLIdMkq7ZbZFLLJuDWgsCvU1iW25kkfKQ+jFz3KFnbXVJ
X-Gm-Gg: ASbGncsoHEOZOfu1OedCwutQzlrKyjicbeugCHfZQg5xB4+9TxcAj3zqWD1ibyNlE/S
	K1NIcxc6rIw+/RjtEKZCNQykkupUamKFnW+CwGhQO291hk9MHfykCxaOU2WPB48mUwyhROi/MFZ
	qAymd6Ng7dKj6H79sr1Ns4rHwGkHt2PouuOfoVG+G8xulu91Yl1W7V4FJFpyuLaDlLjkeo/ebJG
	4sw8O1NXETHLVkMCvAPzF+tYEWt0liCnoyWQ6c4TLBf3N4WXvnof3TS6ME6mJ1gJbE3rtd334rH
	G7lnQw==
X-Received: by 2002:a05:6a00:1396:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-72fd0c7c6c5mr7442937b3a.23.1738192016165;
        Wed, 29 Jan 2025 15:06:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK+GFtKGuVAzhj66wtlYDvlWWvG3WVubkOllbBq8t3Ltf+GMVUhA51a8pFaMKDNQBYDvAy4Q==
X-Received: by 2002:a05:6a00:1396:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-72fd0c7c6c5mr7442904b3a.23.1738192015836;
        Wed, 29 Jan 2025 15:06:55 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bfb0sm30521b3a.23.2025.01.29.15.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 15:06:55 -0800 (PST)
Message-ID: <dcb08082-4048-4573-9dd4-bf3b81a06bb9@redhat.com>
Date: Thu, 30 Jan 2025 09:06:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/43] arm64: RME: RTT tear down
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
 <20241212155610.76522-12-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-12-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DhX2q4glliBP6Llg6lFz1g14DeMi_qkNa9-wK_62fFw_1738192016
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_150701_439415_6C4D763B 
X-CRM114-Status: GOOD (  22.41  )
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
> The RMM owns the stage 2 page tables for a realm, and KVM must request
> that the RMM creates/destroys entries as necessary. The physical pages
> to store the page tables are delegated to the realm as required, and can
> be undelegated when no longer used.
> 
> Creating new RTTs is the easy part, tearing down is a little more
> tricky. The result of realm_rtt_destroy() can be used to effectively
> walk the tree and destroy the entries (undelegating pages that were
> given to the realm).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v5:
>   * Rename some RME_xxx defines to do with page sizes as RMM_xxx - they are
>     a property of the RMM specification not the RME architecture.
> Changes since v2:
>   * Moved {alloc,free}_delegated_page() and ensure_spare_page() to a
>     later patch when they are actually used.
>   * Some simplifications now rmi_xxx() functions allow NULL as an output
>     parameter.
>   * Improved comments and code layout.
> ---
>   arch/arm64/include/asm/kvm_rme.h |  19 ++++++
>   arch/arm64/kvm/mmu.c             |   6 +-
>   arch/arm64/kvm/rme.c             | 112 +++++++++++++++++++++++++++++++
>   3 files changed, 134 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 209cd99f03dd..32bdedf1d866 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -71,5 +71,24 @@ u32 kvm_realm_ipa_limit(void);
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>   int kvm_init_realm_vm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
> +void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits);
> +
> +#define RMM_RTT_BLOCK_LEVEL	2
> +#define RMM_RTT_MAX_LEVEL	3
> +
> +#define RMM_PAGE_SHIFT		12
> +#define RMM_PAGE_SIZE		BIT(RMM_PAGE_SHIFT)
> +/* See ARM64_HW_PGTABLE_LEVEL_SHIFT() */
> +#define RMM_RTT_LEVEL_SHIFT(l)	\
> +	((RMM_PAGE_SHIFT - 3) * (4 - (l)) + 3)
> +#define RMM_L2_BLOCK_SIZE	BIT(RMM_RTT_LEVEL_SHIFT(2))
> +
> +static inline unsigned long rme_rtt_level_mapsize(int level)
> +{
> +	if (WARN_ON(level > RMM_RTT_MAX_LEVEL))
> +		return RMM_PAGE_SIZE;
> +
> +	return (1UL << RMM_RTT_LEVEL_SHIFT(level));
> +}
>   
>   #endif

All those definitions can be moved to rme.c since they're only used in rme.c

Thanks,
Gavin


