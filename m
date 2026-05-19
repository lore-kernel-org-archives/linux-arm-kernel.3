Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E86CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS2dIVjCN4rsLbtzA8+v0rhcj6IymxrZeXALoVnbIv0=; b=oTXMMcX4GIvQb1NymCGgC9Pqh1
	J3YB1nt04MCPRG1HXk2NEVog6Me1IFJk3fDkWl0s+zGLFPNN26dWT/YMA/VZ9fA9Yvf/j7cc5j0Yn
	zoKZ8ftAIpZvENZixk/IgI6JyNCTFv67WpLb0vkCm7AaY6Cr/f8KZC62lH7Hb7WdGHF+k1CnWxDWL
	eHw0b2XpvN3FxrryufKEvLRSOis7kGtMMHam0o6r1PH5fTsdIoutsiVCkxBdsaoLljILEkBWC5iWL
	7CTEtWsnjCmschhVjq+FjWpg5EU1cZPoWUVRiNjlXgi3eCmu/PhBaisSblC20MriKtn53iLEDAfGm
	ea/X8R1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGU9-00000000rtC-2Uom;
	Tue, 19 May 2026 09:11:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGU6-00000000rsX-34Rb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4BEA418B8;
	Tue, 19 May 2026 09:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CACCC2BCC6;
	Tue, 19 May 2026 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181889;
	bh=GA/ws2LYv6piWac5ud42DGFv9hbkBVI/O7uf0WPkcHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8pO5iWXD7wstIaOm88fc3dpYMmginT3MjYyVFjpzR0bthityzXSo6FXg/NY5f5Fy
	 18+YpnLIUeJh9n2F8ncJGMuK8X5ZyjTnxBRPJtN2MZNDTbfwQ7jqu/Fr1s1kRHkUMl
	 A+p3BCbRqc4GC2i3zOlDF8ji+Jjk8ZjZuVv/6cE+QOPnR29kwmFrcd/2S5UJ+ijVjQ
	 AKLwSeHntG+7nbkr/YFHefC3/Q29CkZq7oKA2i1bmHQmrJdWJ3cHMfXgsHc7h+OwKW
	 d8ej1Ut3ugQHcznZqEzDNy1zm/TqjFFkbs5Cojq0V9fD7MHaze6dwAnxoCRXVNYPGC
	 w/5+M9GTHVqUg==
Date: Tue, 19 May 2026 11:11:24 +0200
From: Helge Deller <deller@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: mach-rpc: fix zImage build after recent
 font-related changes
Message-ID: <agwpPFGkN3zHKdCj@carbonx1>
References: <20260510023941.190396-1-enelsonmoore@gmail.com>
 <d0bb399f-1285-495b-babe-8bae608729e8@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0bb399f-1285-495b-babe-8bae608729e8@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_021130_821919_75950729 
X-CRM114-Status: GOOD (  23.07  )
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

* Helge Deller <deller@gmx.de>:
> On 5/10/26 04:39, Ethan Nelson-Moore wrote:
> > The text display code used in the Risc PC kernel image decompression
> > code uses arch/arm/boot/compressed/font.c, which includes
> > lib/fonts/font_acorn_8x8.c, which further includes <linux/font.h>.
> > 
> > Since commit 97df8960240a ("lib/fonts: Provide helpers for calculating
> > glyph pitch and size") <linux/font.h> contains inline functions that
> > require __do_div64, which is not linked into the ARM kernel
> > decompressor. This makes Risc PC zImages fail to build.
> > 
> > Resolve this issue in the least intrusive way possible by preventing
> > the inclusion of <linux/font.h> (and the definition of a struct that
> > relies on it) when the decompressor is being built.
> 
> I don't think we really require 64-bit integer support/division in the
> font code, as 32-bit should be sufficient.
> Can't you try to find out where this 64-bit division is done, and fix
> this instead?

Ethan, does this compile-only-tested patch fix the issue?
Maybe only the first hunk is necessary.

Helge


diff --git a/include/linux/font.h b/include/linux/font.h
index 6845f02d739a..c8f3d6ef54c8 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -35,7 +35,7 @@ struct console_font;
  */
 static inline unsigned int font_glyph_pitch(unsigned int width)
 {
-	return DIV_ROUND_UP(width, 8);
+	return (width + 7) >> 3;
 }
 
 /**
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index f5d5333450a0..5bd7af5f2111 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -71,24 +71,24 @@ static void font_data_free(font_data_t *fd)
 font_data_t *font_data_import(const struct console_font *font, unsigned int vpitch,
 			      u32 (*calc_csum)(u32, const void *, size_t))
 {
-	unsigned int pitch = console_font_pitch(font);
-	unsigned int h = font->height;
-	unsigned int charcount = font->charcount;
+	uint8_t pitch = console_font_pitch(font);
+	uint8_t h = font->height;
+	uint16_t charcount = font->charcount;
 	const unsigned char *data = font->data;
 	u32 csum = 0;
 	struct font_data *font_data;
-	int size, alloc_size;
+	unsigned long size, alloc_size;
 	unsigned int i;
 	font_data_t *fd;
 
-	/* Check for integer overflow in font-size calculation */
-	if (check_mul_overflow(h, pitch, &size) ||
-	    check_mul_overflow(size, charcount, &size))
+	/* size-check user provided font values */
+	if ((pitch != console_font_pitch(font)) ||
+	    (h != font->height) ||
+	    (charcount != font->charcount))
 		return ERR_PTR(-EINVAL);
 
-	/* Check for overflow in allocation size calculation */
-	if (check_add_overflow(sizeof(*font_data), size, &alloc_size))
-		return ERR_PTR(-EINVAL);
+	size = h * pitch;
+	alloc_size = size + sizeof(*font_data);
 
 	font_data = kmalloc(alloc_size, GFP_USER);
 	if (!font_data)

