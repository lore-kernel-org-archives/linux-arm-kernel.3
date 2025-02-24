Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C692BC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29NxK63rs0vMCdxoDz3JRWeoz7a52gVEWHhjTf6BXnQ=; b=Nadpq3WhNS4Jv03HEqwnn7Y2HI
	XNm9GCJgm/BIvhcFc7+q/V2A+yjuJ6vSabxKT+uInQMnfQFEoMfa1EU8+2fUyqosLtSAGwT0wMNga
	fb37ENUEJPt1+oBfM3HaLHNYS3ARqen9xZGRWaVu+84RT6rPZXxrFjfBOBIR2YsrktkH8r0eUF8WI
	C7JP2LFmg/TxP0Z4slDe9jTW0C8v1wvWQqKGOevKiGc8jJQq6hZiMOMmgODLhIjt6eKHCInvavtCq
	EaK379w2TkiIfInXMv0dQTaxW3Q1iqMd94YcnXzdxUuis/bu/FxdHUNtihrIUBK0vUUOOGPo8aLJz
	Qc+ZaspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZd2-0000000E8RS-0YVn;
	Mon, 24 Feb 2025 14:40:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZCa-0000000E2mN-2mbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:12:58 +0000
Date: Mon, 24 Feb 2025 15:12:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740406375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29NxK63rs0vMCdxoDz3JRWeoz7a52gVEWHhjTf6BXnQ=;
	b=Rp3uGpP4TJgkra1Hw5zuh0HdpXPR3bzzrQoZusnMrC4+qj+NUfdA0GoSH5w8Rk0WiBC1WN
	p4Vcx1JudPupoRohDZPisYqct8LnzsKjpXzgFu1u8mm5k5TIyPbhuAVEZul8IAH8Lap4dA
	ErZI4Ohw7VdqoQoDFB7onu6HEeJz+KtyUiKEC+ARVmnbI6/defzC3hIpF+bFXU9eJGlwQ8
	pHgxjQtZiU4wMWCtBn9n+5xxDYB+ArWA3aj47d6ZLNlqK6BoZAyjL6MRhmU+CsQXtTnmOw
	doSXuCi7Fu6w3Q3s9+CIJxjrmc6/+0RCoihRxN9U54elkJpUfO5wxRWtLecorQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740406375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29NxK63rs0vMCdxoDz3JRWeoz7a52gVEWHhjTf6BXnQ=;
	b=lQ8lmCKx7D+DydNZoRCAS2U3HhOw3r8Vh4nLz5r+lWPOOGxUcYK0G0Epqhhh5UnTy85HVM
	2e7QAc96aFU+ftBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Don't use %pK through printk
Message-ID: <20250224150920-87b1bf56-9520-4cd1-ab51-93da2eece162@linutronix.de>
References: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
 <20250221145513.GA20567@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221145513.GA20567@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_061256_843148_E4F10F12 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, Feb 21, 2025 at 02:55:14PM +0000, Will Deacon wrote:
> On Mon, Feb 17, 2025 at 08:39:06AM +0100, Thomas Weiﬂschuh wrote:
> > Restricted pointers ("%pK") are not meant to be used through printk().
> > It can unintentionally expose security sensitive, raw pointer values.
> > 
> > Use regular pointer formatting instead.
> > 
> > Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/arm64/mm/physaddr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
> > index cde44c13dda1bc0924d2d50369ad87f544a0a802..7d94e09b01b35094e883875a46b979666549095c 100644
> > --- a/arch/arm64/mm/physaddr.c
> > +++ b/arch/arm64/mm/physaddr.c
> > @@ -10,7 +10,7 @@
> >  phys_addr_t __virt_to_phys(unsigned long x)
> >  {
> >  	WARN(!__is_lm_address(__tag_reset(x)),
> > -	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
> > +	     "virt_to_phys used for non-linear address: %p (%pS)\n",
> >  	      (void *)x,
> >  	      (void *)x);
> 
> This is part of a WARN() and knowing the actual address may well be
> useful in debugging. I suspect it also ends up being dumped as part of
> the register dump _anyway_.

That makes sense, especially the value being part of the register dump.
OTOH in the default kernel configuration (kptr_restrict==0), %pK is an alias to
%p and also hashing the pointers. And so far nobody seems to have cared.

If you prefer I can also change it to %px, to specifically show the value.
My main goal is to remove %pK, as it's prone to misuse.


Thomas

