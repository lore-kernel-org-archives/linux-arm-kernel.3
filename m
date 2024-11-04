Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E569ED1BDD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNoiMjw3OVqv17v9meTG6uSwfwajYIf8B5oUpoOvtpI=; b=k68R0zYYmyxKM7Lb7P5V2pgMJF
	oir8Cj7dkFJQGtNIkMtzz4tFn596G2U3ty/M1Yp6wkFxgJcY4a/O2si7oFcxd65gCxzxkbJ+8Q0c2
	N3u1CzpGBPRkYw0UmXYnRH5nD9oLqzYLjV/MEvcEuc7eDnQkBY0N6jcTNUtMt5PpRM5W2aoWK3M2/
	toDJ7SihCnIra8MQQk5wh8ZaHcBCAqj0tLT7qH50dAQO3GZijCFmpTi2gRPEIwZdFNT81Nf2e4tI1
	kXNb98sUg6LyjPQylpHZi41AXelnqDFvaM4jTMuxFuJ3GSIEtW6I1lXKPyFKQaVJYoE4sOf6Mj9vn
	9u7J44jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81W2-0000000Ef8I-0ROS;
	Mon, 04 Nov 2024 18:09:26 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t819o-0000000EaJ7-3053
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:46:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso8253950a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 09:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730742386; x=1731347186; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iNoiMjw3OVqv17v9meTG6uSwfwajYIf8B5oUpoOvtpI=;
        b=lcTVpjrmtVeCnhxOeCGBz920mVrhIj2XKmmqwl6un+WHR88HRSq1QVq0Yl6CMjbBNz
         K2QYr3nhRfHMjpf04RGcsxWhT3G1bvFzT/V187MHPW9nOkf0aRJGeaiuqKGMbp+JopKB
         jT39K2RI9S6X9tN5+E5dpDV/4TKs+AClTA0ZuEiZhRcAr1bnA+cQF8b40a8QRAbpILVN
         UBaUIUvxKY9RjUJWRtS3bTrV9LddV+Dd41snT7jUiOIGVuuVWcKAoxDn0R852F1IKdCO
         c1sC9Zo9ZhbC1jsTLnmnDqiwGmB/Wmn3OWITuxJq1vN7VvNlLJFEs8+aw66vFVPTcDHH
         VtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742386; x=1731347186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNoiMjw3OVqv17v9meTG6uSwfwajYIf8B5oUpoOvtpI=;
        b=aNn7ZBlQDnuSZeohMXkIEBUcqKhFL6gjW7twaCBLqYZI5Cblhx7qMQwY9IsaKTKQEw
         RvQPCG36Sp1Ksjwx8MrYejGrqTDaXevKrhCPX9CpCCJGNXxrKfrsZx1oDBCk1lTntSZu
         eFdtef1+gaEDxjeRFbgFAs6yW6plwphoNxcyUUV3LlKrTvfKfOz5aChXcRu32pKZxMA6
         GEnNPGI8HIFKJB9y4cFrtSLKgC/LSp9qGcGVAVJx9WFLbhiN5G5JzEneM+u6/KG96/hE
         wX0vDve9fBm902NUCvh38Q5dUBppWuuWf9WVYQEADia9aadQCm4ZSP2L94LmCe+6fJpa
         XytA==
X-Forwarded-Encrypted: i=1; AJvYcCVaOJg57STcwNp3vVpWEt3iWEGeyZah95wdUvMOOO9EbvvjzUnUVGepQS046I7pjKzsNLt1c/1l00+Tp6zUWd2j@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5zrpZwyy0YZ8wTQsbjgU21cFnpXcZh9yPpDoIhDspfjTlOU1
	DizSDocL7tZA4m6RuJsBScgju+dSF0mUcRvLR2NkThuKOZyL2pgYmQIV/uoKVQ==
X-Google-Smtp-Source: AGHT+IGrs35d/XWv8BanrAW8j6PHDnWwBaSo/wZx0w5yxGi7BlKHJcenw8eSrxH3L+MaXjx1Bk+QUg==
X-Received: by 2002:a17:907:7d87:b0:a9a:684e:9a64 with SMTP id a640c23a62f3a-a9e50ba4055mr1494056066b.61.1730742385859;
        Mon, 04 Nov 2024 09:46:25 -0800 (PST)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a33sm9246366b.185.2024.11.04.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:46:25 -0800 (PST)
Date: Mon, 4 Nov 2024 17:46:22 +0000
From: Quentin Perret <qperret@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] KVM: arm64: Change the layout of enum
 pkvm_page_state
Message-ID: <ZykIbvN8LO7pEan0@google.com>
References: <20241104133204.85208-1-qperret@google.com>
 <20241104133204.85208-2-qperret@google.com>
 <ZykFBhlzrUQtjEjy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZykFBhlzrUQtjEjy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_094628_782410_DDA1A08B 
X-CRM114-Status: GOOD (  27.27  )
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

Hi Seb,

On Monday 04 Nov 2024 at 17:31:50 (+0000), Sebastian Ene wrote:
> On Mon, Nov 04, 2024 at 01:31:47PM +0000, Quentin Perret wrote:
> 
> Hi Quentin,
> 
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
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 0972faccc2af..ca3177481b78 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -24,25 +24,28 @@
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
> 
> I guess we will still have to keep around the software bit annotation
> for sharing MMIO regions from the host. This would not be tracked by the
> vmemmap but it will still be in the s2 pagetable. As this is tagged with no
> functional changes intended, are we safe because we are not supporting
> MMIO sharing currently ?

That's right, currently no MMIO sharing is allowed -- see how
host_get_page_state() returns PKVM_NOPAGE for non-memory addresses, so
we should be good!

Sharing/donating devices is absolutely going to be needed eventually,
but I hoped we could make that a separate series. And yes, we'll need
_some_ data-structure at EL2 to track that, possibly the page-table,
but could also be something else similar to how this series moves that
away from the pgt for memory. Hopefully that's an orthogonal discussion
we can have later :-)

Thanks,
Quentin

