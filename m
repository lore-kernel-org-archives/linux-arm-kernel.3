Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5461FF60D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afivXW2PTC36kmyMDBN3SIricSfoCKcEeqYymXRdbNI=; b=D/JGx0hgHXKKnTRKCsK/4r/v83
	gZvmUgRnyWEUdqLH+nfVvxWOVJaYDvXVQZnDkFoTYth7IiHJtYtISyilY22CoYVmvzpH+S8B9lHYg
	WhW4UKgz6pwslmOwUyuyByGlnDjrhKT7FXG3p3E52QIkhUTJu+Demrg4NPeO6+jJFmG6WKj3/eETf
	V98jAFDbJIQ3utuInvzHyfD8xr3WKOZN/rWXBO5ifHjNJaDjdDrJf5M6lQVXlKo0ZINJOBrC+Ej3R
	yuy1aJMpljcKuaoQWDdX/Cfxu81ks3Q6VfQc2HV8kd6TR6owooqxHbX9n32fE868R9LoVYhv7/z0+
	aCv1Ks5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7St5-0000000CP99-11SN;
	Tue, 31 Mar 2026 06:47:43 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7St4-0000000CP8w-1Lgd;
	Tue, 31 Mar 2026 06:47:42 +0000
Date: Mon, 30 Mar 2026 23:47:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Demian Shulhan <demyansh@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 5/5] lib/crc: arm: Enable arm64's NEON intrinsics
 implementation of crc64
Message-ID: <actuDkpYbzLj0sI8@infradead.org>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260330144630.33026-12-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330144630.33026-12-ardb@kernel.org>
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

>  	depends on CRC64 && CRC_OPTIMIZATIONS
> +	default y if ARM && KERNEL_MODE_NEON && !(CPU_BIG_ENDIAN && CC_IS_CLANG)

It would be useful to throw in a comment here why it is disabled for
big-endian on clang.

> +#define crc64_be_arch crc64_be_generic
> +
> +static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
> +{
> +	if (len >= 128 && static_branch_likely(&have_pmull) &&
> +	    likely(may_use_simd())) {
> +		do {
> +			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
> +
> +			scoped_ksimd()
> +				crc = crc64_nvme_arm64_c(crc, p, chunk);
> +
> +			p += chunk;
> +			len -= chunk;
> +		} while (len >= 128);
> +	}

From reading the earlier patches, I'll assume arm SIMD code is
non-preemptable and thus you want the chunking here?  Maybe add
a little comment explaining that?


