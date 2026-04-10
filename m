Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDC5E99062
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHf4ySEs+zzGoKuce1dDBNHANpVZnox9rbmC/G6rDsc=; b=pdP68briUSxOg/Or3V591lEWad
	i5XmJ18M6ypz1hWuu0DU+YLNBoBW6vBzHkdaGDmG/SHEAUHnd+JJuAS25zfAiqCT640IYsndkG6kn
	LoWnmqNG2qlWLB0myL8pXlsWsDxwMFcNkdMWebhUxx0CBRd6o41AWO9JOICVVAep1OOq+TFYvxXKg
	wqFO+dSVHEngr1zrTKCVCB9/bMRM/9L15nHSsmI/lvTphPDe5k2M7iZpUPW5H4i7WEExXEHZJpQCf
	c39yroh1uU9jNXB9i6YIyVP5gyUg/cTkc8tH68yTaOkBcwsQy95y4a6P3In+6PhDPZAbNWYiK1WP3
	nt5n7KFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8JK-0000000Bvmi-0XAr;
	Fri, 10 Apr 2026 09:37:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8JH-0000000BvmG-0kcM;
	Fri, 10 Apr 2026 09:37:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 425421D13;
	Fri, 10 Apr 2026 02:37:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0DF23F632;
	Fri, 10 Apr 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775813873; bh=SmJwPkp0nb0Ve3Bz5iCXglHNYcVEz5wLti0b0rFKeWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUJ88Z+upicQXln8DFiBGfr96f2uBf2ASbYsH8rM72E+kuoFdvMKH8bmio9mMf+wb
	 j+mfu+vJDOcyJELgIoXve3XDH3vaB3z32C0emUTZgdFAbaHMq8yuRQbb8rDHnpvndX
	 V6i42ghipdzWWaTAT1RnY+E1nPwJ++8YUgVHWHM4=
Date: Fri, 10 Apr 2026 10:37:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 2/7] arm64/runtime-const: Use
 aarch64_insn_patch_text_nosync() for patching
Message-ID: <adjE6WzFM7NogzlU@arm.com>
References: <20260402112250.2138-1-kprateek.nayak@amd.com>
 <20260402112250.2138-3-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402112250.2138-3-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_023755_352255_4CE8D1D7 
X-CRM114-Status: GOOD (  12.71  )
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

On Thu, Apr 02, 2026 at 11:22:45AM +0000, K Prateek Nayak wrote:
> diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> index c3dbd3ae68f6..a3106f80912b 100644
> --- a/arch/arm64/include/asm/runtime-const.h
> +++ b/arch/arm64/include/asm/runtime-const.h
> @@ -7,6 +7,7 @@
>  #endif
>  
>  #include <asm/cacheflush.h>
> +#include <asm/text-patching.h>
>  
>  /* Sigh. You can still run arm64 in BE mode */
>  #include <asm/byteorder.h>
> @@ -50,13 +51,7 @@ static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
>  	u32 insn = le32_to_cpu(*p);
>  	insn &= 0xffe0001f;
>  	insn |= (val & 0xffff) << 5;
> -	*p = cpu_to_le32(insn);
> -}
> -
> -static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> -{
> -	unsigned long va = (unsigned long)where;
> -	caches_clean_inval_pou(va, va + 4*insns);
> +	aarch64_insn_patch_text_nosync(p, insn);
>  }

Sashiko has some good points here:

https://sashiko.dev/#/patchset/20260402112250.2138-1-kprateek.nayak@amd.com

In short, aarch64_insn_patch_text_nosync() does not expect a linear map
address but rather a kernel text one (or vmalloc/modules). The other
valid point is on aliasing I-caches.

I think dropping the lm_alias() and just use 'where' directly would do
but I haven't tried.

-- 
Catalin

