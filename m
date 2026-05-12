Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8C4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gh0YPsx5HT0HEDlr/gUYFUWx5XOdgj6wDtu6dF4cI3k=; b=ABoA1vRAoppiwfl4Z4gblUweX9
	dZbm/JuuX5WnH1jLRwxm4KdFi0pgVpMS2amnEKYLV1dgkGnONfZDwIWN0y9cTfHrDh7jy5lxoZjs1
	NvcM4pp3sw8c/9IU8aMpsBDmGND6U9q8OuHNJ6+ErNYzwNuLy5tfsumh0ULSlJH3tM7ToQLfRk+Cw
	XHnYuBmdJTcZ105MnIX1OE4z9I8nw2ZlmktDsp7BC81NFUfHHfi8SPVBdnddAtqFRZF0ZuOdq8SbR
	mLtrTCP4uvHjetdk2alRx0Z09oG1wOxqS1U2CCyoJzCFW576nPcJBUyUOPpF+T8dlx9Njm6kKSj+I
	Fu+nfc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkZS-0000000GT1l-3zqM;
	Tue, 12 May 2026 10:42:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkZQ-0000000GSza-2ztd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:42:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 03:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778582555; x=1779187355; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gh0YPsx5HT0HEDlr/gUYFUWx5XOdgj6wDtu6dF4cI3k=;
        b=ndPcfaJVweN6FRU4G1B5atyK8NyUWgcSQRsAYchyJl0ON16JTYESKt93eUoOdX+Tr3
         cHuZ0lwhRL8Ewcz3nVnjSxnDqNOYluDMZtRZnyxstaz7nEHiklq+9X2byN4JegQGRVPR
         O6BZrXcIgWpcrHGRhTwME7FmypMmFo4Y/IbqnToEfKH+83hdsJDwUKzkFrsdud0v53fs
         4+apJrX2egKRr7EMqvFcR3N3snMT5ummrdiIRX2cIq06F6giW1yvoukP5pjmy4D0TdPF
         Al4Okxo51A7dbCO8ojPnlyIanT/bE+bu2ZGJ07IeVh7FcQSBdONfx38JX3gx+5Pxzu7c
         6DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778582555; x=1779187355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gh0YPsx5HT0HEDlr/gUYFUWx5XOdgj6wDtu6dF4cI3k=;
        b=Oo8LviVGiuaDfsNRWCBx4V6NzznkcztoZr3xbQ3K0IApkYXRNLIas8/eghy6FaoVCG
         dYtl1jh6C0PZx1/5UjyoMVuGPCS8pOvOGu1S5pNqO/ieigOeSWVyCjmGbS4lQQsrV6+U
         dSD8yc/BormInBaYAMiifKJUZZhhB/XkOcce+aiDmio2rnwR3SeF56Z4mnPfAmZkcCt6
         cnIs5+0wjX/PrmTT7NDforMxuRcm4nDGAtVP/VcR9C5rxYKWKRuj4rNAA3owYgTDr+WX
         ghqXQGApL3RWgnRlcRi/oG/a/lLNCWPHBoDd50pRoCm8PLO93Z2yBn2QhAVK7xpKX59M
         9cDg==
X-Gm-Message-State: AOJu0Yxnf44SFMHnsoYM5tUzugMm1YkTEcZhKhk9nY797J5GB/hpQWEN
	0PKTqygjjgJ5Lpduw2BEI8KLOxRn99+OhOglJJFGq/eUmaDSV+OgUrXnT1SBGvCMlg==
X-Gm-Gg: Acq92OEKmS/Qu+vJ/mV5/IJvD+89+Le6EpTLON9h31JepfA6Ip/ChicLT0g6cBbcNKT
	VdMTCN5nsgWGwTfu/24+RbmExuQnIV1VPqDjLaNgqEJIY+d+XcBN30oNuYr29wEGgl8kR1mPVic
	ArSJO5gsRI35/1+Flk82Mkd1+nGUDMCLYVipRJHnBOSHgszr9XgBgYMoMwnd7/bVj5cLXcvEiwG
	ll4qKIrfzDeguTHrtsQPWrJ0CQhwwCtJMxMwGUYp/0+fAEOka1l9MyDndiOCgM4pG6cVPPURmgG
	3qGsH1wdabG21NFFnEXUF+3oLPSdDTO2lvoDzXzQ1G62L7TIt0SSDCTyQAvxMs+Ln349gk9nq+w
	7aRG91fwZOZAkFlBngEbCOaBoaDuKsQmVSF31cmHp0rHFtLoTe5rXeruJfKXLvQbdKcrHe58wzY
	jwoJ/fHhQ+N3QrvR42jFUFR6TiaXogheS+MtG5i8bZ4M0NH3IScHmgxz4mWeSh0sdq/ST1iUivN
	0CZUQ==
X-Received: by 2002:a7b:c041:0:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-48e90664de3mr468235e9.2.1778582554477;
        Tue, 12 May 2026 03:42:34 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b00fsm34945814f8f.11.2026.05.12.03.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:42:33 -0700 (PDT)
Date: Tue, 12 May 2026 10:42:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <agMEFhxsmjpO0thM@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <20260501130006.GF6912@ziepe.ca>
 <afiRB3e3o0G1oZvY@google.com>
 <20260509232714.GI9285@ziepe.ca>
 <agG8XtrHUfWGy-kd@google.com>
 <20260511142232.GP9285@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511142232.GP9285@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_034236_779079_881AB1E8 
X-CRM114-Status: GOOD (  37.15  )
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

On Mon, May 11, 2026 at 11:22:32AM -0300, Jason Gunthorpe wrote:
> On Mon, May 11, 2026 at 11:24:14AM +0000, Mostafa Saleh wrote:
> > On Sat, May 09, 2026 at 08:27:14PM -0300, Jason Gunthorpe wrote:
> > > On Mon, May 04, 2026 at 12:28:55PM +0000, Mostafa Saleh wrote:
> > > > So far this is the list of requirements/changes needed share the
> > > > stage-2 page table (besides the obvious: same page table format,
> > > > granularity, endianness...)
> > > > 
> > > > 1) HW BBM is not supported in the hypervisor page table, that’s
> > > >    because it can generate TLB conflict aborts, which the hypervisor
> > > >    can not handle because of the limited syndrome information.
> > > >    We can rely on FEAT_BBML3 which was newly introduced to work
> > > >    around that, it’s quite niche and not supported in KVM yet or
> > > >    have an allow list similar to the kernel
> > > >    (as in cpu_supports_bbml2_noabort()) which also limits the number
> > > >    of CPUs that can run this.
> > > 
> > > Do you think pkvm will need BBM? Hitless replace of a PTE is already a
> > > pretty advanced feature and the SMMU has its own support matrix there
> > > too. Is it for shared/private conversion?
> > 
> > Yes, we can break block on memory donation which is transfer of
> > ownership to the hypervisor or a guest.
> 
> So you need BBM support on the SMMU too? That is probably a big
> problem because the SMMU is often mismatched to the CPU :\
> 

Yes, that's why it's hard to find systems that can easily share the
CPU page table with the SMMU (some might even have mis-match in
OAS/PS)

> Also io-pgtable arm cannot trigger BBM behaviors, so how do you
> implement it?

At the moment, we workaround this by mapping all the memory with PTE
level, while MMIO remains at block level as they never change ownership
at the moment.

This is one of the missing features I plan to add after this series,
if you look in the cover letter, these are listed under “Future work”

> 
> > > No.. once you turn on IO like this you don't have page faults
> > > anymore. Everything must be permantently mapped into the SMMU view, it
> > > can never be made non-present and you must run without page
> > > faults. That's what you have in the io-pgtable constructed table,
> > > right?
> > 
> > Exactly, but the CPU page table doesn’t guarantee that, so we either
> > have to handle page faults in the IOMMU, or completely change how KVM
> > deals with stage-2 if we want to share the page table with the CPU.
> 
> So that's the real explanation, KVM cannot manage the S2 in the right
> way so you can't share it. RMM/etc are managing the S2 without
> pointless page faults so they can share it.

Well, there is not really a right way, even with a fully populated
stage-2 page table, you can’t guarantee not getting TLB conflict aborts
without FEAT_BBML3 (which is quite recent), unless you map everything
with a leaf level, which then impacts performance.

Thanks,
Mostafa

> 
> > > >    Alternatively, we can pin the stage-2 pages, that would require some
> > > >    hypercalls, hacks to the driver/IOMMU API and possibly new semantics
> > > >    in the DMA-API for IDENTITY devices as they will still need to pin
> > > >    the pages as they are actually in stage-2 translation and not bypass.
> > > 
> > > ?? Then how does this series work?
> > 
> > This series works fine as it shadows the page table and doesn't share it
> > with the CPU, so it fully populates the address space.
> 
> Which is why it is so weird that KVM is using a partially populated S2
> when there is, and must, be a fully populated one for the SMMU. But I
> understand there are reasons fo rthis.
> 
> Jason

