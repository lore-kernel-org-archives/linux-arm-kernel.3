Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8010C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ova+vNI28FPI82CeUH4i8eEwaxh8Bm7iD+PyNauGWGA=; b=c1Lbqr2lutvnbvEf7yDqiA3dkX
	x+ESpypGOt1Y8chMl7Lc0hxfnVc/lJbOdut3r8LhykFTGqS4qXEXOI5QTe7lELVSVPS++GTinEh6z
	m6nZE0CWBPjrBolLj/AtC12SGFNGpEyk4pT/tS221dCze5CMVMZDY1T6ifvcXmm1Ji/D15RRl/4MA
	EY+m+bF5Fz2FA81Kq1K8gP4AA+l9ErRNTBrtMYKQw55AK+5gXRm03wtcqqkbQnz3F1aXORtLDCHqp
	hU7Ynn+lI3MAnSpNAInTr07pFcqyAVTvBA/i/05vg1yxEPQXEZ5AZHZs4H+gaUU4KKJenRK8ePF+r
	v25s+vZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhmIY-00000005OSl-2UCK;
	Fri, 01 Aug 2025 09:43:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhm4o-00000005MwC-1lT7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 09:29:23 +0000
Date: Fri, 1 Aug 2025 11:29:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754040556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ova+vNI28FPI82CeUH4i8eEwaxh8Bm7iD+PyNauGWGA=;
	b=nJjz5eXA3X2ChMFpvoQzS3IZ2f6/shakOjreJFg1B91MTBn0QBf3PmDM/Cbx+/lEx/Bqwa
	Xf7OsqF4T2FdJ10xKGDxVzRhKYThHWHIZUiqiMIuxQmwKsdLBeAg8PoWCdxm4RhDzPouIH
	+mKqwC4I+K4uuc10vt37nSznSRv+o1twaQWPxKHLyKTW6Oob+oDztMMfjbrqbMz4Z/5fNq
	48hYnr0qLdpu4lvZWgNsNAmGZmKvognSMAf+yhlIFNQLHcTB0SETrNvwMLpDrSlKaWzwm2
	bwVgMm3/saJzeWaSgZxDdhRbWOITnivatH4ehQlVg6zbEfA56gbFrJxuTOHZZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754040556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ova+vNI28FPI82CeUH4i8eEwaxh8Bm7iD+PyNauGWGA=;
	b=327q2dIM7AHakBddR0i7X0tidlD4HhV2QL29/7LGORZKj1I3BhEhcMGrjfMqsYOIs6rpEc
	HgPIZkqQYxSVpvDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
Message-ID: <20250801111922-3af19987-9141-47a7-b67a-d10ac091ce2e@linutronix.de>
References: <20250627123854.921704-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_022922_601948_B012BED0 
X-CRM114-Status: GOOD (  23.45  )
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

On Fri, Jun 27, 2025 at 02:38:19PM +0200, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..774a17de4f2f 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,26 @@ struct DecFifo {
>      len: usize,
>  }
>  
> +// On arm32 architecture, dividing an `u64` by a constant will generate a call
> +// to `__aeabi_uldivmod` which is not present in the kernel.
> +// So use the multiply by inverse method for this architecture.

I think the problem here is the u64 by u64 division. u64 by u32 should work.
Unfortunately Rust doesn't seem to have a way to perform a mixed-type division.
We already have optimized C/ASM helpers for u64 divisions. For example
div_u64() does such an u64 by u32 division.
While it may be slower than the inverse multiplication, it is less code, easier
to understand and will work for all architectures automatically.

> +fn div10(val: u64) -> u64 {
> +    if cfg!(target_arch = "arm") {
> +        let val_h = val >> 32;
> +        let val_l = val & 0xFFFFFFFF;
> +        let b_h: u64 = 0x66666666;
> +        let b_l: u64 = 0x66666667;
> +
> +        let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +        let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +        let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +        tmp3 >> 2
> +    } else {
> +        val / 10
> +    }
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk = data;
> @@ -389,7 +409,7 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>          }
>          self.len += len;
>      }
> 
> base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38
> -- 
> 2.49.0
> 

