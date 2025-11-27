Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A6AD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnkmBTHe5A+63RxAC5xy8ww+MylUyAg/x2AtpzBuqc0=; b=3dtMku0U5JO3cHtTjQOin4IUrF
	rC7R8th2OgPpLILxv0aGZBlhh4VxQd7gLm06otvGbaU8KtgYpWgblUb81IdadqLGFLoIwnH1ht4Tz
	DBPiSGKezWRuSCbdzSohWAlNomQlmZLtWE9a214Nl2eG3U80idD0Rc4aB3AB9mjbJXGvpMk5B2ylg
	OOc+9e0Q9lh0KxheaNNcz6XLOSB98aVfxp8SUs1QlcmeRTMaHoHBzWLhv+jXgmfxmGTHTPXetZKKO
	xo1e1HJh9LikAg3yiyjDbJAWyX3/k07z6KLFHZfi+W4mdyY1l/0a/QN9rTlaAzTL3f3WQjBYFooGa
	yTDmVc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdZl-0000000Gox0-3GId;
	Thu, 27 Nov 2025 15:06:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdZj-0000000GowR-2JBe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:06:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84211063;
	Thu, 27 Nov 2025 07:06:15 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3461F3F66E;
	Thu, 27 Nov 2025 07:06:21 -0800 (PST)
Date: Thu, 27 Nov 2025 15:06:14 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC/RFT PATCH 2/6] arc: Wire up cmpxchg64_local() to generic
 implementation
Message-ID: <20251127150614.GA3271003@e124191.cambridge.arm.com>
References: <20251127092226.1439196-8-ardb+git@google.com>
 <20251127092226.1439196-10-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127092226.1439196-10-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_070627_634420_AD8941CE 
X-CRM114-Status: GOOD (  15.12  )
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

On Thu, Nov 27, 2025 at 10:22:29AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Provide cmpxchg64_local() for hexagon so we can start using it in
> generic code.

nit: this is for arc, not hexagon.

Thanks,
Joey

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arc/include/asm/cmpxchg.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index 76f43db0890f..f2d55823645c 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -12,6 +12,7 @@
>  
>  #include <asm/barrier.h>
>  #include <asm/smp.h>
> +#include <asm-generic/cmpxchg-local.h>
>  
>  #ifdef CONFIG_ARC_HAS_LLSC
>  
> @@ -142,4 +143,6 @@
>  
>  #endif
>  
> +#define arch_cmpxchg64_local __generic_cmpxchg64_local
> +
>  #endif
> -- 
> 2.52.0.107.ga0afd4fd5b-goog
> 
> 

