Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFDDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDbbzO/MBfCwa9anx+czvBO5imGoZ/RyUt5Cn2glgCY=; b=CwaAUABMbXoeqYXgBjpLiBcdsE
	+mlgO663gaPrIo+cfkDh3wgPlLcXGCVfmv1b7/UhK1HPm2Flra54bDqmNi14395NvPU58yNEYUU0W
	dfbGNunxfb31HBNca0HNolqLOefItdGXy1BR+er64VlfSq6Hw03VaJF+exmH9M8BHW9Gd7+0Hpl1o
	IAcO6LNtLeiSEYz/RuB918QOIqCOvTJ2NEww5Zfa4X/VBCWJZkSKgeb8BfGGs9pYxOCHbOGvzsOmd
	bR+mE746e9jjkxG8XTfh823gm+wl1uAkoLTm75LaIQDoTrN8wjjFN7+HZ/aVnpnmRGK5FRdo7vp+w
	uh43xdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujr40-0000000HBm7-39YS;
	Thu, 07 Aug 2025 03:13:08 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujr1S-0000000HBXJ-27Js
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 03:10:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so535963a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1754536225; x=1755141025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDbbzO/MBfCwa9anx+czvBO5imGoZ/RyUt5Cn2glgCY=;
        b=hjh8CDIFv08wJYn/e4BW9y6Gf4taD9zeV+d4G1e96qZ00IPMI+XwLSP8TsiH0sKTzr
         5PjOXgm4PGOts2zz8m1aDy2/ApoljvrofCKpeK/XpsIfzjjPphSRn2vt/kMaRT92fpoV
         +4gsKiY4wruQYMRoGjnmbST9TlyzSIqKw/bgQqXW9+02goB9ykq/xEDHB5x6ovhehXq4
         g/8onsp3HbudcxWX6GfPdmtrLyRjk/oVKixjb+6NzSUbWspZnncWT1WOsQqpWoYGm0Y0
         pCMyRP42J5qkzyYbJskaa6ke1vESyZaQNtPnlp44w8fBoMSeL0XIbRHKAJClBLNlNys/
         qllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754536225; x=1755141025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDbbzO/MBfCwa9anx+czvBO5imGoZ/RyUt5Cn2glgCY=;
        b=f0mkJV2OxnHiXPviLqxvN3uAKlMcZ6bg0Me/rxkU7qyEeOlCItjwVgFNq3/+qSG3EJ
         1mzfR7dBa5tDc2S1N2WjNlfTlhTDACKy6vyvENihDwq5Gx4/VdY6jL0m+KjUYpQE4NgP
         g/eBrqc+lixVJ0QUothJwaF2m224jhN0nmHWA6a4U5dBofofHbkGhTmU4XjVdGtUqUD5
         NJtSoSskLeqrBd2yMFqje12Ea03jj6X71Dxvx4jozrn4jpiZGJk9R2lWMmjLlla2TZvV
         4XdRukPiRHz+rSND5Qyprrxzb40scl26aFbrLSIe+QfDZToCweZ6LvK+UA4qQ3j1PWrD
         v1LA==
X-Forwarded-Encrypted: i=1; AJvYcCX+XZ5S/GPk+EP/xCFUeyrMyVL+fmwxtewcI/ob7rXqoOd0ksgEAyv5lTKD1HeLGPaxHJWb598XhDmqExQhfuy9@lists.infradead.org
X-Gm-Message-State: AOJu0YzI0DvvoOpbfrrO9bDCnS2R/C+5WmAfK/Ys1Y/CYOYoAR7qx/ol
	Q06/A50o56qlOcrwpiH9yKHVKYrosdGHKIyASfmPavUKexYm+06VSnQsSFkj35BYoFLwohzHVPA
	tREjvmgBcs4xts/bgJxK6Geh0Jk6LVuhW83fh+OvXZasD1MEm9MXLrUGccUi5oJCI7b/KGA==
X-Gm-Gg: ASbGncvNETzv/hrc1MiR7Mh6c+uIUqDc+DhVFCM//NAGBzBmzW5+q9tkomgAGed/VVG
	154JLds7NvrTFaqI4EpB7IvuLuj+gwAeTBdmcl6u0FTM5b4UMPb/l25jeIpLJ/jtPP2YE6dCoBC
	opwZgWoPUch4DSC9zIVSFOtj6IwQ+P6KAEZu1yFMVJoDlFzmDwcD5mJVccRd9+Hptm7l4CSEq0y
	BJaDjyiODkry3kPLtlrxvdrZYeiUdJVSjeIRjbVP3ZNO0RjH+9bjG3xUkyYLprdU4q/rQrfVnsr
	KDe7jL2YX2bW/eTMeid2GZ35R+9loMVb0T3OkTN7DvUvr2phbVAt1EIWWT38380KwBSsmCuAXzF
	hmCb+W5uT1HbnP9v4OA/CN/wrkQa15QujNg3IMcKPlG+sM+OXZoETMG/FaiHPXY+FolT8stc=
X-Google-Smtp-Source: AGHT+IFMVcRp6VR4IdWnWexUALKIuSPhb07wbduD4zm+PjHvxwvZ6x3aGSq9zjx5g1N+kmv/0FkZ2Q==
X-Received: by 2002:a17:902:e748:b0:242:9bca:863d with SMTP id d9443c01a7336-2429f59ce44mr64630105ad.55.1754536224661;
        Wed, 06 Aug 2025 20:10:24 -0700 (PDT)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216126c96esm4081982a91.22.2025.08.06.20.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 20:10:23 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:12:55 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Sebastian Ene <sebastianene@google.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] KVM: arm64: ptdump: Fix exec attribute printing
Message-ID: <yzl5a3r3vq42kbcsetdlmmtfaafzsyhcqzpfmlbhy3fqh4eylm@hocbkksrt2nj>
References: <20250802104021.3076621-1-r09922117@csie.ntu.edu.tw>
 <d72b7928-8646-4616-a8f0-96b9d9bbaf09@arm.com>
 <z2hmwwmtgbrio2wv3sj2pc4zhxdjioorlhnm45o2arcsjahjni@xod435q26jqq>
 <aJHBf4KCUPpWbyU5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJHBf4KCUPpWbyU5@google.com>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_201030_910031_CA4591E5 
X-CRM114-Status: GOOD (  29.46  )
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

Hi all,

On Tue, Aug 05, 2025 at 08:31:59AM +0000, Sebastian Ene wrote:
> On Mon, Aug 04, 2025 at 08:41:35PM +0800, Wei-Lin Chang wrote:
> 
> Hi Wei-Lin,
> 
> > Hi Anshuman,
> > 
> > On Sun, Aug 03, 2025 at 07:33:04PM +0530, Anshuman Khandual wrote:
> > > 
> > > 
> > > On 02/08/25 4:10 PM, Wei-Lin Chang wrote:
> > > > Currently the guest stage-2 page table dump has the executable attribute
> > > > printed in reverse, showing "X" for a non-executable region and showing
> > > > " " for an executable one. This is caused by misjudgement of which
> > > > string gets printed for the executable and non-executable case. Fix it
> > > > by swapping the two strings.
> > > > 
> > > > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > > > ---
> > > >  arch/arm64/kvm/ptdump.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > > > index 098416d7e5c25..99fc13f1c11fb 100644
> > > > --- a/arch/arm64/kvm/ptdump.c
> > > > +++ b/arch/arm64/kvm/ptdump.c
> > > > @@ -44,8 +44,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
> > > >  	}, {
> > > >  		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
> > > >  		.val	= PTE_VALID,
> > > > -		.set	= " ",
> > > > -		.clear	= "X",
> > > > +		.set	= "X",
> > > > +		.clear	= " ",
> > > >  	}, {
> > > >  		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> > > >  		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> > > 
> > > Is not KVM_PTE_LEAF_ATTR_HI_S2_XN already in the reverse semantics aka
> > > XN (Execute Never). Hence when KVM_PTE_LEAF_ATTR_HI_S2_XN macro is set
> > > that means the entry is not executable and vice versa.
> > 
> > Yes you are correct. However in dump_prot() we have:
> > 
> > if ((st->current_prot & bits->mask) == bits->val)
> > 	s = bits->set;
> > else
> > 	s = bits->clear;
> > 
> > Analysis:
> > 
> > 1. region is executable:
> >     - st->current_prot == PTE_VALID (ignore other bits)
> >     - st->current_prot & bits->mask gets PTE_VALID
> >     - if condition is true (.val is PTE_VALID)
> >     - prints bits->set
> > 
> > 2. region is not executable:
> >     - st->current_prot == KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID
> >     - st->current_prot & bits->mask gets (KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID)
> >     - if condition is false
> >     - prints bits->clear
> > 
> > Therefore we want .set = "X", and .clear = " ".
> 
> 
> This seems correct but it will produce a different output than the
> stage-1 ptdump. What if we drop the PTE_VALID from the mask & value as
> Mark and Anshuman are suggesting and print NX when the bit is set and x
> otherwise as the stage-1 ptdump does ?
> 

Thank you all for the valuable feedback!
Yes, let me follow this and send a v2.

Thanks,
Wei-Lin Chang

> > 
> > Thanks,
> > Wei-Lin Chang
> 
> Thanks,
> Sebastian

