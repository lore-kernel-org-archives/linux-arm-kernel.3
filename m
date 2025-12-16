Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8119D609C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/i4yuWPRNaB87nSLMg+01ui8PpsrLcXHmWjY1b4M4w=; b=ujwjdhl6Gh5UInV17lglbEOA88
	NNgjX3fwSm2CPSmp0jlI3meNRfEdJRq/g6B7AWtiZe6ptD94sSQxNVYG2CWqcra132/iJpuzSqfQn
	UMyzKhSp/q4TCsh2uIXSiOyTNd5AeR5IHzwNK+lehXKT/DOBTx28MCSwl0rUBiF+FpdtUqmvLe2ff
	aslei2SiNFjNh5lzgz4xdhcyYG8JVWmJ411VDlALBeaOEhP76owv2Co9aS5xzhXXIXeus04fxBKN7
	dri+JzgZNP2LVZx/wZBoTd/hzNtSkRdWivgUvbdtDSvkpQlxAaYDjDy98hkQR8kZOUpdYap1OiuCC
	gw9DslaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZEs-00000005dNj-2KUu;
	Tue, 16 Dec 2025 17:53:34 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZEo-00000005dN9-2MoO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:53:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c/i4yuWPRNaB87nSLMg+01ui8PpsrLcXHmWjY1b4M4w=;
	b=I5JAuXPV6pwPgJLEt4N5R3FO1CHuhBIZE2LHGDXqK1TX3P2+BxqrtcuY7NjuJp3HkqVxHE9Kd
	D6FxCs+7KTYjAm+HQ7fJAQBhmoFMW2fc51TiQP1MnlDRdGn+6QAr1c7WEWhBSzTAGOA8wvKo1H+
	4Gd0Mt/hkx1XmoJVrFnTBy8=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dW4HP6jytz1vnwZ;
	Wed, 17 Dec 2025 01:51:29 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dW4Jq4rtxzJ468v;
	Wed, 17 Dec 2025 01:52:43 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B8AE140086;
	Wed, 17 Dec 2025 01:53:11 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 16 Dec
 2025 17:53:10 +0000
Date: Tue, 16 Dec 2025 17:53:09 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Dev Jain
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 01/13] arm64: mm: Re-implement the __tlbi_level macro
 as a C function
Message-ID: <20251216175309.00001935@huawei.com>
In-Reply-To: <20251216144601.2106412-2-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
	<20251216144601.2106412-2-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_095331_613028_7E9308CF 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, 16 Dec 2025 14:45:46 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> As part of efforts to reduce our reliance on complex preprocessor macros
> for TLB invalidation routines, convert the __tlbi_level macro to a C
> function for by-level TLB invalidation.
> 
> Each specific tlbi level op is implemented as a C function and the
> appropriate function pointer is passed to __tlbi_level(). Since
> everything is declared inline and is statically resolvable, the compiler
> will convert the indirect function call to a direct inline execution.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---

> +static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
> +{
> +	u64 arg = addr;
> +
> +	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
> +		u64 ttl = level | (get_trans_granule() << 2);
> +
> +		arg &= ~TLBI_TTL_MASK;
> +		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);

Probably don't care, but I think you could do
		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);
instead of those two lines. Code generation hopefully similar?
So depends on which macros you find more readable.

> +	}
> +
> +	op(arg);
> +}
>  
>  #define __tlbi_user_level(op, arg, level) do {				\
>  	if (arm64_kernel_unmapped_at_el0())				\


