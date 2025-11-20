Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D693CF64AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ1a6GXdAz13/z+frt7ZsPUiHK+rVmDTT+AWenA3aKw=; b=GOYyDVyce7EhCT5ajYy+AePE4L
	zhq5dmFVlHx3FTSebR6rs6U3oyMNSbCS3owZqHhIbX1CXqFxZq5DbF/9iex737Y0j+tHA/FVw8g5u
	Ksjt0/kjvIE5bTE843y+y//RNdJO1/qACn5DBw9SEICj64KBPRaKlge09bxTI817UdZG/VPbb4vh2
	89zocZ7TNHjpxYK2DlKeVoo9kVODaYh8uGhxCafBpbxv0ItLSSwYuUMuSI/VdHm9vAS4lHADFMJ8G
	mfM7QE6slfF1+4dMMCtnP1ZM0ycUWvkUFGlwr0Pq/2xGoz5qk0jssxH/PXkDff1Q3qe4s6UZb7y4Z
	iPh72CWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Nq-00000006Sfa-2lsz;
	Thu, 20 Nov 2025 09:55:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1No-00000006Sf2-1684
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:55:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso3823995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763632518; x=1764237318; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ1a6GXdAz13/z+frt7ZsPUiHK+rVmDTT+AWenA3aKw=;
        b=zR07gguIfRBBjm7c2YRDlZrobt2OVfz1ebdPsPSwEbwLI4inuARicRee0JCh+yMd0k
         1SvoSG88U3NFS6/SswyLu8CkQ1TqZss1OtRhlo7UetPgLtVtKzZI83zc/2/n5eRTPcxn
         NGa3+VOcYdi7/HFVlOkkgv7uSjXhOdhehFuPLieHrjfAPGwpx51anFaTTD2rpK8mgSh+
         ZyWpGoImsfq5r2KHYdE0vPIjSWSTmertGmNceUhfjwtryd0r2Ypl/IAtiyk6x8HDnk3q
         /azIYux+nJ2iStEb5yPIfrMJaXZWtfZVez4ZY5cR2lwbamuBmU4uUkUK8lJqGIHT1UHs
         xNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763632518; x=1764237318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ1a6GXdAz13/z+frt7ZsPUiHK+rVmDTT+AWenA3aKw=;
        b=NnCQIsCOMQtbOaX7PDY9GLpKClJCKS5hWS8SBjUkjWKTdj9BSLIljs0gd/lGKkzymX
         5CFAeqYLhWOPba3hAKf0SBCIuC2iJpDU4+f1dA7VdK4cFnmPeWkFIDSiE6XtbKEbsoGz
         sWl+T9e0CVyxgUUw7MhnUTe0nBee5EeFZRlKT/G32HqROcy/S4P6uDWjVkQ9AEp69BVH
         ZcDVUvtswNYsjBYsfaTbBmn6vmyzH/+9Zd5KupXmULcgpXcNoAJqiZ0rT3QMSJn1UeUh
         fmTkV6C7+RAPaKrQ1tfPeEp8D0lsTQx2GHTW5HHSmUH0V7EevWYk6omCWHVOctx1DWK1
         c9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXWBnhqd6eLSFDwZWdBw1oPwzG0MIw2H1BlJp+P3qec5Kbw8omM9cLOW+LvOzyPx4nIJH+d5LqT5puDIPh9bKDA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx21vXFi4mj7F5I1WtoZfZr/1ITmbfiaG+OBxCGghmy2NUoHjb
	hLLN7tF3UgPSVYC0rVmfafiR143WmMd7n6PvjjANminhUFc5tNr2+S/uYgXskTJNOw==
X-Gm-Gg: ASbGnctekRgnnHhsOx9LDapu45oDZf9hwRIs206oPd/96QY02fivf+TynzvS+qPKf3I
	Ni33h4QVFLoopjAna+u1UG4Kg8lGinwzqogcqC+DY/K1kCc59DKKR2ZPD6LeukaVhkgP2xskAga
	uP1jtPWy77Z/ECdGQH71W/o2pxWiZ+I7S+5Vzrugqt1QyBKmztJdHahiX2jwB+Lm6jQvCyVTlzi
	qOMkZpt5rVirVnmfsWoGP10inoyBik7CvG2Y2vqAV0l5pwV6CKSUlv18pKofD3sHoCoTYkZJb9c
	NaFoFD2869tU/81R4YtCxxWJVyNW4Pb/ppG2B6Pfdd48AlDC1/HqKhphkBFJ9rFOibB77Y/HqYO
	O4RF5vGOQ3YRZbghZQ25PgTP7+HX6mSOLs25znuSBrjCFyRDfy0vaIYH7/nVZWzERGSqcvyQgBP
	aFjZiJQfE9bUmmJQZskZb4gghqlrvSJWYlf3WhW8rcJm4xl9TduA==
X-Google-Smtp-Source: AGHT+IFJRNp2sRsVEs1GlQW6MJTcF2zwsPsEOfrLSK/NN3A774PXikUBAOOjBZgY44x25hx3cSpDQg==
X-Received: by 2002:a05:600c:4ecd:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-477b8a9b267mr18043455e9.25.1763632517489;
        Thu, 20 Nov 2025 01:55:17 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b831421fsm37963635e9.10.2025.11.20.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:55:17 -0800 (PST)
Date: Thu, 20 Nov 2025 09:55:14 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 19/28] KVM: arm64: Support unaligned fixmap in the
 pKVM hyp
Message-ID: <aR7lggObvo-2Yrg5@google.com>
References: <20251107093840.3779150-1-vdonnefort@google.com>
 <20251107093840.3779150-20-vdonnefort@google.com>
 <86ecpurq13.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ecpurq13.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_015520_337341_9CCD7F0D 
X-CRM114-Status: GOOD (  17.94  )
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

Hi Marc,

Thanks for having a look at the series.


On Wed, Nov 19, 2025 at 03:38:32PM +0000, Marc Zyngier wrote:
> On Fri, 07 Nov 2025 09:38:31 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Return the fixmap VA with the page offset, instead of the page base
> > address. This allows to use hyp_fixmap_map() seamlessly regardless of
> > the address alignment.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> > index ae8391baebc3..75014dc7d82e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> > @@ -239,7 +239,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
> >  	WRITE_ONCE(*ptep, pte);
> >  	dsb(ishst);
> >  
> > -	return (void *)slot->addr;
> > +	return (void *)slot->addr + offset_in_page(phys);
> >  }
> >  
> >  void *hyp_fixmap_map(phys_addr_t phys)
> 
> This looks slightly odd. fixmap_map_slot() should return *a slot*, not
> something in it. Can't hyp_fixmap_map() do that instead?

That was fixing hyp_fixblock_map() at the same time. I will move the
offset_in_page() in both callers.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

