Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47410C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sj9IC/ITgYzbYCPda8r17Blt5shGufVre2k2P1fl+Zg=; b=jaRcAQyd/qARUJ7m0u99oTdEC0
	uh34B6r0ULaDItgnRVxoTOueOkzcPCs2MhyHURFVYpsU8JhoadiVyJeHfA2pnHqu7Pv3wjAKhGlTX
	iEcexct7z5eDGxIkBd2y31B9DjUcVehexX1wsV/RCNaz35NLUACpjj7MK1mUpwiOcRY21XlLrI1O0
	Lpu/qpi8KUp4KantIMV6XiOvlN+09wjomPs8nJFG8BdD8FgbbOGlH2nYx/jsIEHS3cFHkB9uw9uVn
	KZ4R0adfBFaesMvFWRNlWKtaFolCDqyVN+GxkBUdJeLb9GihTYokXaOR0wi5NjWOoX2V52OPTcvON
	P7gD25lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOHy-00000008GtZ-3UEj;
	Wed, 26 Mar 2025 10:47:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOGF-00000008Gb9-3iGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 10:45:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so64407585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742985926; x=1743590726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj9IC/ITgYzbYCPda8r17Blt5shGufVre2k2P1fl+Zg=;
        b=1uNT5AR20kg1rEua8UO/GQ13gmJTbCJSSSPMERIuRFeYTi9qTmwluChq98KQBea2SS
         5KsIVqxLRf7Uyx2ua6PEhZOOWLWDUlIgbm+JDVP49NZG4+dpu9uE8mfBQ3ySjCBrgzbZ
         j6Cjt7cgMwpzcKDI1C3jHXxmR494p+EGwmkLnF8ssTlddJ4DqjNtrzusXeJA6W26pqBH
         aS7UdaD+BJpY5XHEa79NuYXL1sOdP71jc/6IKYdTqG2VlT2ou1ANKD3DqodSPSAgw1lc
         VyPJk2IXuolzWEIG51vI6XJ3W1fwhpFBM/NRAaj/55+dXnyjFYJQv6Dhtc59d6LhPLUw
         ujwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742985926; x=1743590726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj9IC/ITgYzbYCPda8r17Blt5shGufVre2k2P1fl+Zg=;
        b=hrHzf4bq45IAIOabrEzV8g9MTUaTOCfSbUhgsdRjfH0Xy1j22XAICjlNf5Zokn7MFz
         J1QruoFrtvcWRVylotW6A2h+Zy1j6v0mDmvsHiYmRYjqppRsfntwBCkKV33capSjOlJD
         Oblvie2QAXipOqQkrJvrdrO/qaU+p69UayEICCSbUjeXiCpY1G6pe6eAQHQ5yhHazL/k
         vm8N4Jo7U3KZ4hzM2v08xGw8UN5k4ubOuxK+BgRPDMANYphwfOrVuR1tUP63v0KIj3u9
         DuujbwMngGdO0brIB86rD1pGyLNkdgQ+cRQjhe2t9fK5voWEKTeeaFCxj+EfmBiIyy9D
         Uduw==
X-Gm-Message-State: AOJu0Yx3N6zW2w0scaXIEmMg1xLYsAV3OvFLM5pyT6tdz7y1ECdeTeZW
	1bpAOzzWm1lUexhFC9RNuvl29epdNzr4j/fI0fq9KCbyr2V5ohZhl/nOkCEDPFdXbRbcghmshw7
	2sw==
X-Gm-Gg: ASbGnctMyJz1zYtzirIr/SuO5WwbSliOBZKa3JwesxFKX8uLiTmnvsuWftH+nnUZA5a
	GAmgZ1nep4MgBxHJwD2LoqnBZ0sa19iv1f+sw6/cyQpUlV67RVXyHWEDJH7ki8HV3kLCJXnbVXv
	0WLwuHvW12nOvxJewxm96Focmqi+2dBcY4ZU8T9yxMC3Z5SMNtzprMURWnz8ArppYF/wWNfie0H
	XebY43FhNtLk7eOpMHjhpd/7Iy/rs+r4XQmyi6WcK/byZXgFkX8ND8jPl8uhxaG1bxRbjVzJuOb
	TzBpQ32GN6eJldIrV8rHTqxZMmbhaLtWqeIqNHultYdyHDZl9R4db92OQcQWHEzGhYMSaW0Qy7b
	+4PM=
X-Google-Smtp-Source: AGHT+IFBLSf5Cc3mFyYZdvuynNJIpSKOy4KRKa6vJr8hwGbWkLycXjgd1M0s6yReqROa/HVWBrx5NA==
X-Received: by 2002:a05:600c:34cc:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43d5f8b9236mr144487305e9.3.1742985925530;
        Wed, 26 Mar 2025 03:45:25 -0700 (PDT)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995611sm16697147f8f.15.2025.03.26.03.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 03:45:24 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:45:20 +0000
From: Keir Fraser <keirf@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: mops: Do not dereference src reg for a set
 operation
Message-ID: <Z-PawJpGJRcSTMnc@google.com>
References: <20250326070255.2567981-1-keirf@google.com>
 <Z-PWZ98oNna6nVu1@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-PWZ98oNna6nVu1@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_034527_944146_D90A1854 
X-CRM114-Status: GOOD (  32.22  )
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

On Wed, Mar 26, 2025 at 10:26:47AM +0000, Mark Rutland wrote:
> On Wed, Mar 26, 2025 at 07:02:55AM +0000, Keir Fraser wrote:
> > The register is not defined and reading it can result in a UBSAN
> > out-of-bounds array access error, specifically when the srcreg field
> > value is 31.
> 
> I'm assuming this is for a MOPS exception taken from a SET* sequence
> with XZR as the source?

Yes.

> It'd be nice to say that explicitly, as this is the only case where any
> of the src/dst/size fields in the ESR can be reported as 31. In all
> other cases where a CPY* or SET* instruction takes register 31 as an
> argument, the behaviour is CONSTRAINED UNPREDICTABLE and cannot generate
> a MOPS exception.

Okay, will do.

> Note that in ARM DDI 0487 L.a there's a bug where:
> 
> * The prose says that SET* taking XZR as a src is CONSTRAINED
>   UNPREDICTABLE, per K1.2.17.1.1 linked from C6.2.332.
> 
>   The title for the K1.2.17.1.1 is "Memory Copy and Memory Set CPY*",
>   which looks like an editing error.
> 
> * The pseudocode is explicit that the CONSTRAINED UNPREDICTABLE
>   behaviours differ for CPY* and SET* per J1.1.3.121
>   CheckCPYConstrainedUnpredictable() and J1.1.3.125
>   CheckSETConstrainedUnpredictable().
> 
> ... and I'll go file a ticket about that soon if someone doesn't beat me
> to it.
> 
> > Cc: Kristina Martsenko <kristina.martsenko@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: stable@vger.kernel.org
> 
> Looks like this should have:
> 
> Fixes: 2de451a329cf662b ("KVM: arm64: Add handler for MOPS exceptions")
> 
> Prior to that, the code in do_el0_mops() was benign as the use of
> pt_regs_read_reg() prevented the out-of-bounds access. It'd also be nice
> to note that in the commit message.

I will add this too. And Marc's reviewed-by. And re-send as v2. Thanks!

 Keir

> Mark.
> 
> > Signed-off-by: Keir Fraser <keirf@google.com>
> > ---
> >  arch/arm64/include/asm/traps.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> > index d780d1bd2eac..82cf1f879c61 100644
> > --- a/arch/arm64/include/asm/traps.h
> > +++ b/arch/arm64/include/asm/traps.h
> > @@ -109,10 +109,9 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
> >  	int dstreg = ESR_ELx_MOPS_ISS_DESTREG(esr);
> >  	int srcreg = ESR_ELx_MOPS_ISS_SRCREG(esr);
> >  	int sizereg = ESR_ELx_MOPS_ISS_SIZEREG(esr);
> > -	unsigned long dst, src, size;
> > +	unsigned long dst, size;
> >  
> >  	dst = regs->regs[dstreg];
> > -	src = regs->regs[srcreg];
> >  	size = regs->regs[sizereg];
> >  
> >  	/*
> > @@ -129,6 +128,7 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
> >  		}
> >  	} else {
> >  		/* CPY* instruction */
> > +		unsigned long src = regs->regs[srcreg];
> >  		if (!(option_a ^ wrong_option)) {
> >  			/* Format is from Option B */
> >  			if (regs->pstate & PSR_N_BIT) {
> > -- 
> > 2.49.0.395.g12beb8f557-goog
> > 

