Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED3BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e8bQc3GvargUcdnmcUpU13zlbK5uT7tC5qOX+GAjSg=; b=n5b94NYu27BwGK/rV8qk0VUBSL
	xms3vn2qe4QGag6RewIoo1BHK+/DGw2/qPNKI0dADXP4DoufNWuJVynSMBWAkmTLJNZqb+xBKucbZ
	lNpeosWnl/kOK+142XUJiP2Ce4IaImYtsibcE4OX4aYJlQwY4eY63Tel0xXv07rDQGjgWgqP7/kBV
	608HV8BBMqdZcpUwNjod/4kVVekJRpeO0scfQ+TY6N3p7dSNaE1jfUcgdR8KN4ftGPC+Xgnc0kfhm
	9w15rCpp6/69K6KDYB+lpHwBxSbEZnIrQ8DHExEI0MI+czqvsHlzoJGzVToiWQsjU0ovH8MBye9na
	mr3zjPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5ou-0000000ENLU-2nTx;
	Fri, 14 Mar 2025 14:15:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5nF-0000000ENAz-109c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 14:13:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac297cbe017so589620366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741961623; x=1742566423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4e8bQc3GvargUcdnmcUpU13zlbK5uT7tC5qOX+GAjSg=;
        b=tslOBDt9gKVxb53ewnuweLHWxEeA9xnLVAGyL4mm7GA00F/ufqTkT4jE7dtgbg/pv1
         4PCWd7XEWy59qrT6w9L+JtnTkZKCDyaVucnV1YujtGJrdkrHskj+Hica53i1f+9BKO78
         bOLbaT57xbHEpSX1VrAu+KG5a+rzYBWp8P2m5oDg4G5fb6W3JlnuUNUI/t5/lkeKRJxc
         aevz4uVnZfa8n52VWBeUnxi+MZdiw4HMLGF66yjGwCX04e6SRSW7Fxhvu4dA7JCtTPGS
         i5glxNR/0EPg2/DWEQ6qYvNk/kwD0ciHrCvMpx/Ziu4ZsdK1QClV/bkMAHylmh2FgnaR
         ealA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961623; x=1742566423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4e8bQc3GvargUcdnmcUpU13zlbK5uT7tC5qOX+GAjSg=;
        b=QSV+SG3ivRxzuxV0etRDe3N2nbnj4vZRoBbaliLl31CVU381YbhiHgNQq383Ky5wa2
         cw4r1b60aSC52c+817emdf2/AkTmETFJpoWcctcBq9Zxw5GoYk3tgwDwwh711eJ2jBR5
         4IcWuRDcRS5L3soI/BEA4a6eIMv9nrE+zMR88lqu/rNM0d+AGOnTG63gGte4dzHM3LAX
         NNQMHBYu7fccLc2VVzfY3j/P1a+H9ghbd7/uwVm9zNJ7T5CUZCQuIVjKQh5foVJffluE
         D5TvvJgA1E3gHgfAGUrdWjLw8c1kATjzK7m+6cahAPNPR0u+7xRN9iaw6ES8pZBNrmRq
         TX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxrAn0QR6rO+t0jGX/fgrIN4NunJYswZlRg21ArWDXY9YxDzZB9B1eeAS9vkYNN42eDXMF4yMF6t+4/G66yYb3@lists.infradead.org
X-Gm-Message-State: AOJu0YxqmkBIbHsABWbllBD34/ujAyLRi+fuDCq5GbV32VlRdgc+C9pt
	C8BMFLwuucLM6Mo16RosIuE9aOBqPXAdTUD6LCTQpdrlt7nFGz3n6sGFfWlUYg==
X-Gm-Gg: ASbGncsdJ7sqmraFCkIFvElPNetNDbGaafU6izhQc9nJlYx7zbnUzog2F1NGTay1MF5
	1sddVQ3hJV7Ik5Mr5lCDigKpUpYp7neQwSju2yl8UugYQB2LpFua6yYGk2+GruY7TohmOZF4CHT
	rc+lcNPMzDpHRprHVTwdoeRPCM8ENd11GLbBsGvpEZTk+UiyyXfXL1cJt080M6kgpCicMz75rlz
	XWrm34yTKDVgMO8OAIM66rjriO+h+BXBmUEZxygw/lSXldnrfEnn+amiByOlCGuba7QOFi4v/r/
	V6tcj1wOYY4kzRKfmEkvJ+L4fQ+jHSQNc2dgRFNH4kD4sXUmZCQvIL7813zoZOhSMXm1khH0tRm
	aIvA=
X-Google-Smtp-Source: AGHT+IGXahv+MsWEwcBurmP9OU88In++x9q7BRsugIE07NqITWt221lmP5KM9LJmHcGfmeGrdzPtkw==
X-Received: by 2002:a17:907:7d93:b0:ac2:d1c6:4269 with SMTP id a640c23a62f3a-ac3314f4395mr235627766b.22.1741961623363;
        Fri, 14 Mar 2025 07:13:43 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9bc6sm226415566b.49.2025.03.14.07.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:13:42 -0700 (PDT)
Date: Fri, 14 Mar 2025 14:13:39 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
Message-ID: <Z9Q5k5C50Meeog9q@google.com>
References: <20250227003310.367350-1-qperret@google.com>
 <20250227003310.367350-3-qperret@google.com>
 <86cyejooq2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86cyejooq2.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_071345_277347_AB940C12 
X-CRM114-Status: GOOD (  26.09  )
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

On Friday 14 Mar 2025 at 11:07:01 (+0000), Marc Zyngier wrote:
> On Thu, 27 Feb 2025 00:33:06 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > The page ownership state encoded as 0b11 is currently considered
> > reserved for future use, and PKVM_NOPAGE uses bit 2. In order to
> > simplify the relocation of the hyp ownership state into the
> > vmemmap in later patches, let's use the 'reserved' encoding for
> > the PKVM_NOPAGE state. The struct hyp_page layout isn't guaranteed
> > stable at all, so there is no real reason to have 'reserved' encodings.
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 34233d586060..642b5e05fe77 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -13,18 +13,15 @@
> >   *   01: The page is owned by the page-table owner, but is shared
> >   *       with another entity.
> >   *   10: The page is shared with, but not owned by the page-table owner.
> > - *   11: Reserved for future use (lending).
> >   */
> >  enum pkvm_page_state {
> >  	PKVM_PAGE_OWNED			= 0ULL,
> >  	PKVM_PAGE_SHARED_OWNED		= BIT(0),
> >  	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
> > -	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
> >  
> >  	/* Meta-states which aren't encoded directly in the PTE's SW bits */
> > -	PKVM_NOPAGE			= BIT(2),
> > +	PKVM_NOPAGE			= BIT(0) | BIT(1),
> 
> Isn't this comment stale now?

I believe it still applies to guest stage-2 page-tables as the three
other states above are still stored into PTE SW bits (well, sort of,
only SHARED_BORROWED is at the moment as we don't supported protected
VMs, but OWNED and SHARED_OWNED will be a thing for protected). NOPAGE
is still the only one that is a bit different and doesn't go there.

With that said, the comment could be made more explicit about that and
explain this is now guest s2 only. Happy to spin another version of the
series with that changed if that helps.

Thanks!
Quentin

