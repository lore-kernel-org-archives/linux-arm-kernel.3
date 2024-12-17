Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF71E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxP352xQrJECWy5yVL3g0J4iVO0b/TvCNJ0J8iinEAk=; b=3tPzpRn1NuPm7u4ElnrZ5r4z7n
	9hWoXweQbCgzjBPPwEAV1SyTzcXGDWeeJMXaA4V8nk0LrQTi0AdLGc/leKKsfV8tfhw9dAbKeoOat
	y2BnUoNucGSg+/JqlcpARE6D+3byAyLKACCu0nj6mOajQY73fGSdCFKlytIqScN7fwkbtqPwJvtwP
	5btpUlR+nE66eReneuZptFx7rWH0GFfBjBWsGnXHr1t+yZaQwi4HAsGGn+ppar/wSyFYLkXPx9BH6
	QE8Kq+0XlxlfPTOEfwS3zD9Sac3wqLpIApDl/0AbHxw0G+JdrDly5iW5WInsX3FiVqDGpLW5Z9TF6
	zWLFE7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXK6-0000000DVnM-2Jea;
	Tue, 17 Dec 2024 13:09:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXIx-0000000DVaM-2cSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:08:04 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso9660543a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734440882; x=1735045682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxP352xQrJECWy5yVL3g0J4iVO0b/TvCNJ0J8iinEAk=;
        b=Gv+5Q9r1M6tgxgrSsMUyjV5HLJMHssGFqXnij3IrGkQgE6PbeK5EG0ylB8k03hNxH3
         EvWhroHz/ExKTFWYut8FsZ8nZwXSxbqszRcseBffAbzcdW6uunDNM6Ck0GLSGe1Y7EkV
         nMzQQzmlrBIuq1/Zow92xMpwDqUTSk4/QqBoh46Zjg36zYfmQMOIZlXPdxDleSSZHWOE
         4eG7YGCQtId0CzqGn3Q3wGRYbb9hWFehkBInep3CQnwq667ulghZVGTsDL86NtTtdV2T
         4V8WNXnkEFHk1z0FC5RgzhUTbVCymW9juFpjyBX9azVwXTXsX1mvW9iwg0xbuiKnzMUJ
         Uaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440882; x=1735045682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxP352xQrJECWy5yVL3g0J4iVO0b/TvCNJ0J8iinEAk=;
        b=SwGyGTZO4S8pO7YzJqgch+jgZfwdM7UV/5cGJ3T1MI5mVlujs0N2JWjCxSqJiWHBEF
         AhheaVkfKdyMZkz6ITS8t1zVHfAveDptuiLmSpu1wB5uKyErervC5MNmq1HGERZN6EIy
         OQLXsmTlthCCGLQqxJNL3Vf53xWRhVQ4u+QA/nN5DXRmw8V4kEhbcIxmeEfpeUH0Qgal
         j1FnUrZ8vTznRpu7btajtyMajyRPKBG+kNzBIeMKF0RPthSIVLmpzUB0z4MPyNd4GETJ
         GBTtHWmXTi0Qyk/67TfBh4VFiE4j0I9eOxjy2rgqaGZYCsXA9IUMm0XSEXivdITAiN1v
         vAfw==
X-Forwarded-Encrypted: i=1; AJvYcCVT/6rYeB2hWjA5hR728EiwruZOgTJUJpRu5P17mX8VCbd0ArTT83Y0IRP7cE9gXzOqBM8Y37xaPtSnIXhJv8EV@lists.infradead.org
X-Gm-Message-State: AOJu0YzEPH1bW1OLmamL2SeBJw+qAo4DTSjtQhp+MPQOyj9HW50mc/g4
	8eSGF44TwJPgiX+S6eu5QtgQ20o8hnosrOiWeaf/O6rja5Zgway6/awxKCM6QQ==
X-Gm-Gg: ASbGncvaSoZTUuxB6Wd87CVJpt3aUp4RwO6kVnwZrIT3aNjH67zmrOMH5u5KT6ifgt4
	bEgmczZ6A79v9GBW4g7eOddlnhWJPH4jkVEMSE0pBfuTo+3XCp+BGPR3iA8WVir+BqVMzw90xhx
	pWEZAG8pGLlS+7Semd/TwOI9r5cRvIJrkVXxwSvIIZF2SuLLyKAQs7scN6Vx1Y8oIcCixtz1ZB2
	Yzq9Oq9FZiYtHe2PHAZjMs35perVaGDRKQGyrUr79lpyKKWY3jcTip8WI8VsIK7G3OCG9x36hX/
	H/+erUmMBhjKAsM=
X-Google-Smtp-Source: AGHT+IHPCDUKwR/FGRi6mHLODl5BviSg7xFz4W1NW5gTkYq7HIYlXpzWI3patHH94VqPS2+uTzBEng==
X-Received: by 2002:a05:6402:4349:b0:5d2:60d9:a2a0 with SMTP id 4fb4d7f45d1cf-5d63c42d641mr15856567a12.33.1734440881906;
        Tue, 17 Dec 2024 05:08:01 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae12a7sm4261850a12.50.2024.12.17.05.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:08:01 -0800 (PST)
Date: Tue, 17 Dec 2024 13:07:58 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/18] KVM: arm64: Change the layout of enum
 pkvm_page_state
Message-ID: <Z2F3rveiCEuPwxhN@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-2-qperret@google.com>
 <861py6sht3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861py6sht3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050803_867273_DEFBC243 
X-CRM114-Status: GOOD (  22.84  )
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

On Tuesday 17 Dec 2024 at 10:52:08 (+0000), Marc Zyngier wrote:
> On Mon, 16 Dec 2024 17:57:46 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > The 'concrete' (a.k.a non-meta) page states are currently encoded using
> > software bits in PTEs. For performance reasons, the abstract
> > pkvm_page_state enum uses the same bits to encode these states as that
> > makes conversions from and to PTEs easy.
> > 
> > In order to prepare the ground for moving the 'concrete' state storage
> > to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
> > purpose.
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 0972faccc2af..8c30362af2b9 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -24,25 +24,27 @@
> >   */
> >  enum pkvm_page_state {
> >  	PKVM_PAGE_OWNED			= 0ULL,
> > -	PKVM_PAGE_SHARED_OWNED		= KVM_PGTABLE_PROT_SW0,
> > -	PKVM_PAGE_SHARED_BORROWED	= KVM_PGTABLE_PROT_SW1,
> > -	__PKVM_PAGE_RESERVED		= KVM_PGTABLE_PROT_SW0 |
> > -					  KVM_PGTABLE_PROT_SW1,
> > +	PKVM_PAGE_SHARED_OWNED		= BIT(0),
> > +	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
> > +	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
> >  
> >  	/* Meta-states which aren't encoded directly in the PTE's SW bits */
> > -	PKVM_NOPAGE,
> > +	PKVM_NOPAGE			= BIT(2),
> >  };
> > +#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
> 
> Shouldn't that be ~__PKVM_PAGE_RESERVED, given that you just defined it?

Sure thing, I followed the same pattern as PKVM_PAGE_STATE_PROT_MASK
which was explicit in which bits it sets, but very happy to change.

> >  
> >  #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
> >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> >  						 enum pkvm_page_state state)
> >  {
> > -	return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
> > +	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > +	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > +	return prot;
> >  }
> >  
> >  static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
> >  {
> > -	return prot & PKVM_PAGE_STATE_PROT_MASK;
> > +	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
> >  }
> >  
> >  struct host_mmu {
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

