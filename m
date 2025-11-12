Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF794CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gdb53Ag16MHo/leSG267HVNbC31fAGXlaO3qpso5zbU=; b=eUw7ITWgzJe6pqMaS1jxNcj0GX
	gOw53QpEkzjMkCnlsSS8/rcsjKtqdGW9DSbSYPV8ATLVb03FFvLjmTKvediWWBsjS1lid6DENBWmV
	hnbu4tPQu9tGp3xlMI0fXzastPZZB2DoK4k4F7oEY6ffpw/0LYAJCqcIMtsOQ/6/s8TQ+RjmdesJR
	qPnn7meMg6j7oPJayfnob891M+J3g01SnftWskIZyFwF1GlmTiQtsKfdML81iiAQOBJZR/ThI9yZz
	nha19+WpmSXLRSSJLairCYBI7yJFPJMVvBFJJhRh23TnlZLfjoiMzemC86xTnboB6r5vKtxeLx+jK
	rOPxmVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9xK-00000008lw6-2LGp;
	Wed, 12 Nov 2025 12:28:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9xH-00000008lvd-3gzO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:28:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7391D1515;
	Wed, 12 Nov 2025 04:27:58 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F9FE3F5A1;
	Wed, 12 Nov 2025 04:28:03 -0800 (PST)
Date: Wed, 12 Nov 2025 12:28:01 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
	akpm@linux-foundation.org, anshuman.khandual@arm.com,
	ryan.roberts@arm.com, andriy.shevchenko@linux.intel.com,
	herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-api@vger.kernel.org,
	fanghao11@huawei.com, shenyang39@huawei.com, liulongfang@huawei.com,
	qianweili@huawei.com
Subject: Re: [PATCH RFC 4/4] arm64/io: Add {__raw_read|__raw_write}128 support
Message-ID: <aRR9UesvUCFLdVoW@J2N7QTR9R3>
References: <20251112015846.1842207-1-huangchenghai2@huawei.com>
 <20251112015846.1842207-5-huangchenghai2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112015846.1842207-5-huangchenghai2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_042807_961230_6DA44F3F 
X-CRM114-Status: GOOD (  18.26  )
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

On Wed, Nov 12, 2025 at 09:58:46AM +0800, Chenghai Huang wrote:
> From: Weili Qian <qianweili@huawei.com>
> 
> Starting from ARMv8.4, stp and ldp instructions become atomic.

That's not true for accesses to Device memory types.

Per ARM DDI 0487, L.b, section B2.2.1.1 ("Changes to single-copy atomicity in
Armv8.4"):

  If FEAT_LSE2 is implemented, LDP, LDNP, and STP instructions that load
  or store two 64-bit registers are single-copy atomic when all of the
  following conditions are true:
  • The overall memory access is aligned to 16 bytes.
  • Accesses are to Inner Write-Back, Outer Write-Back Normal cacheable memory.

IIUC when used for Device memory types, those can be split, and a part
of the access could be replayed multiple times (e.g. due to an
intetrupt).

I don't think we can add this generally. It is not atomic, and not
generally safe.

Mark.

> Currently, device drivers depend on 128-bit atomic memory IO access,
> but these are implemented within the drivers. Therefore, this introduces
> generic {__raw_read|__raw_write}128 function for 128-bit memory access.
> 
> Signed-off-by: Weili Qian <qianweili@huawei.com>
> Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
> ---
>  arch/arm64/include/asm/io.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 83e03abbb2ca..80430750a28c 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -50,6 +50,17 @@ static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
>  	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
>  }
>  
> +#define __raw_write128 __raw_write128
> +static __always_inline void __raw_write128(u128 val, volatile void __iomem *addr)
> +{
> +	u64 low, high;
> +
> +	low = val;
> +	high = (u64)(val >> 64);
> +
> +	asm volatile ("stp %x0, %x1, [%2]\n" :: "rZ"(low), "rZ"(high), "r"(addr));
> +}
> +
>  #define __raw_readb __raw_readb
>  static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
>  {
> @@ -95,6 +106,16 @@ static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
>  	return val;
>  }
>  
> +#define __raw_read128 __raw_read128
> +static __always_inline u128 __raw_read128(const volatile void __iomem *addr)
> +{
> +	u64 high, low;
> +
> +	asm volatile("ldp %0, %1, [%2]" : "=r" (low), "=r" (high) : "r" (addr));
> +
> +	return (((u128)high << 64) | (u128)low);
> +}
> +
>  /* IO barriers */
>  #define __io_ar(v)							\
>  ({									\
> -- 
> 2.33.0
> 
> 

