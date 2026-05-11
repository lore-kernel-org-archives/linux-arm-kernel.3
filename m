Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4CCCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPN0GnVnAV+QTqwTIgV1cCo5LbQpemV7wVfcXMSy54o=; b=qA3DGvU05qugte6DG+Vj545vAo
	8MgyyGFphGlLl2bN0QpE+CxcKlOixQ+TQpELh4elZ50KwbgVfcVyttCJ/kPPFauQx2uQwC2w+jX0V
	mzg2018jWPfUwV2k9f+gj5BXIU+Vy2SD9DepQctEyCGcUOyNy6mtPojZijj+WxROdjZE5LleinZBD
	y+m+fiNGOKUBxVHBJqr8JkLCJ1zzgW087HomuEj41zUTakiWTfP5qDMIvwMOoEDW3IP2or9+odJ7e
	zM0Mrj0MKuJszFyGaHmGiS35rlIMeADu/H0EPKWFAoE4shT7263768pmOJqcCakf1YOAiWQYgzLqZ
	xuigE/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOkI-0000000DJDq-3Hns;
	Mon, 11 May 2026 11:24:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOkG-0000000DJDI-35kW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:24:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48d1c670255so205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778498659; x=1779103459; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPN0GnVnAV+QTqwTIgV1cCo5LbQpemV7wVfcXMSy54o=;
        b=leM43E3kf+U33pCJBFQ/YJel+J0qe0VkPsQSiSCGoqazHaYUOOfWL8tV+v74MR2tvy
         e+owH9ZLchmJdWW0w2qssfq6HOe0rMk+t9NVxYD98wDCc2qgxjTJ9y3dRW9jUPH3seu5
         uKIXYfGzw0pEXUp9IBV8cnept2Z+J38FcUurgugWscGktchH/uDD8/JGPXhtSJVKQtgU
         GRVRBJiqigCnLL23xMCFYUf3xd8xEiioT848U/SsxhFJyn1gbfrRAN8tMBCYKA4FtDtV
         5cuJ11XoL2RxfaGkpO/SaCl2Qb0kpK9X089eDo8rQAMFSuVeamKRZg2LZ52c0k0EC+hY
         GGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498659; x=1779103459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPN0GnVnAV+QTqwTIgV1cCo5LbQpemV7wVfcXMSy54o=;
        b=Bs5CY3rksfTJeao5q5my91ka908CncOIM8wxuZgoTWC9GzW3wcAwcBrR9gcDi2g9fe
         ZMJIzqrlcj+c1KYT0f7QNEMykGwtxkL/tmqaMtDAVLRO+GCAubvsZDamweOQgwJXXDJs
         ygLayCpLEZvoJzZlsR66zNVzeDCjS8+/gXR8FL79dMJkle+h2QMtJ8Ofko0v3eVKdNTv
         k9ZoG8tPh/oPvbue0UtmVxfUrJroNJ99NgN7WGRpDPfbE9VbCfevH41ciPWAoBTCwHai
         Lohds7uKrmYHvECn+nuCTtsGu6qgrpGH/7GDpeMotypfsNcFjLr6/4Gjo5n7spkWn/Yh
         3lyA==
X-Gm-Message-State: AOJu0YxRk3MKuFJg2oJ8cec5FNt+wuIiXROo8ppcIHJQ0BdqI0TQROEu
	4Xb9hcxWKW6ivbl2dGgAsa8J7HQlNJN0aAjdUwB7iO+ZLQUkGlM4YFYz37xs0JaiwA==
X-Gm-Gg: Acq92OHvjPob+V2Lh/g21HqjWnAg8+wm1dcc8zS0ItSLsd7jZXiKVqLlc4Lx7XbXygC
	YzN1JmlLIQ4zeRswohPEE/Nq3amLIqoFaq457YFtUMmaf91s+daemTdJQs1/6GJ6R35FKUU+Ls/
	qO3LvuhvpLl58eOjbUjrQVWfV0sJZDu7m4k4EDw5Gb4CbllUDruhp2ZKfDySdWT2tQXRMTTmoB3
	2UHK/34PlF9EoS3hPDWqZxH1PioXalS6kGkS0rhhTmIh4vFB6cYtQqXEnBoRURauteS3pZukN2j
	4bH5mnGwMG7IfI4vR64nuWDY43GjREByxFuZEI06uJaAPXMAetCNc5VNZt1PmNsVQWFXKp+9CJt
	CBl1b6kJ3dYbjzudM8aKB+bnVqoVbjK2HhBQm+h/5leix+P7k55yhXTkOD7c9tvUIDbywaebdIy
	/039i5B1OMjcojUQ8sqqlO66hXeJgHIZ2d0GISsxr4mQKiEsE5wmMZuXAnQigOxuR81rE=
X-Received: by 2002:a05:600c:638f:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-48e6e954525mr2966735e9.2.1778498658476;
        Mon, 11 May 2026 04:24:18 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm25337059f8f.33.2026.05.11.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:24:17 -0700 (PDT)
Date: Mon, 11 May 2026 11:24:14 +0000
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
Message-ID: <agG8XtrHUfWGy-kd@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <20260501130006.GF6912@ziepe.ca>
 <afiRB3e3o0G1oZvY@google.com>
 <20260509232714.GI9285@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260509232714.GI9285@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_042420_907923_8D7C6725 
X-CRM114-Status: GOOD (  33.63  )
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

On Sat, May 09, 2026 at 08:27:14PM -0300, Jason Gunthorpe wrote:
> On Mon, May 04, 2026 at 12:28:55PM +0000, Mostafa Saleh wrote:
> > So far this is the list of requirements/changes needed share the
> > stage-2 page table (besides the obvious: same page table format,
> > granularity, endianness...)
> > 
> > 1) HW BBM is not supported in the hypervisor page table, that’s
> >    because it can generate TLB conflict aborts, which the hypervisor
> >    can not handle because of the limited syndrome information.
> >    We can rely on FEAT_BBML3 which was newly introduced to work
> >    around that, it’s quite niche and not supported in KVM yet or
> >    have an allow list similar to the kernel
> >    (as in cpu_supports_bbml2_noabort()) which also limits the number
> >    of CPUs that can run this.
> 
> Do you think pkvm will need BBM? Hitless replace of a PTE is already a
> pretty advanced feature and the SMMU has its own support matrix there
> too. Is it for shared/private conversion?

Yes, we can break block on memory donation which is transfer of
ownership to the hypervisor or a guest.

> 
> > 2) Handling page faults, devices must be able to stall and let the
> >    hypervisor handle the page fault (which has to proxy through the
> >    kernel as the hypervisor doesn’t handle interrupts), this includes
> >    also IO page faults which are hard to get right from the HW which
> >    and may lead to system stability issues or lockups.
> 
> No.. once you turn on IO like this you don't have page faults
> anymore. Everything must be permantently mapped into the SMMU view, it
> can never be made non-present and you must run without page
> faults. That's what you have in the io-pgtable constructed table,
> right?

Exactly, but the CPU page table doesn’t guarantee that, so we either
have to handle page faults in the IOMMU, or completely change how KVM
deals with stage-2 if we want to share the page table with the CPU.

> 
> >    Alternatively, we can pin the stage-2 pages, that would require some
> >    hypercalls, hacks to the driver/IOMMU API and possibly new semantics
> >    in the DMA-API for IDENTITY devices as they will still need to pin
> >    the pages as they are actually in stage-2 translation and not bypass.
> 
> ?? Then how does this series work?

This series works fine as it shadows the page table and doesn't share it
with the CPU, so it fully populates the address space.

> 
> > 3) SMMUv3 must be coherent.
> 
> Yes for sure.
> 
> > 4) Support BTM/DVM for TLB invalidation, otherwise some hooks are
> >    still required (although not io-pgtable-arm)
> 
> SW needs to forward invalidations, BTM is rare..
> 
> > IMO, 1, 2 are the most tricky parts. It's more work and runs on very
> > limited systems, However, it can be implemented as an optimization)
> > which is my plan.
> 
> I think unless you can do it without these HW features (excluding 3)
> don't bother.

I am looking into this now, but as I mentioned that will be a separate
RFC following this one as an optimization for advanced HW.

Thanks,
Mostafa

> 
> > I am not sure how CCA deals with that, I’d expect they have a lot of
> > constraints on CPUs/SMMUs and DMA capable devices on those systems.
> 
> 3 is not supported. The entire S2 is permanently mapped and doesn't
> really change alot at runtime. No page faults, not sure if the RMM
> private/shard conversion would require BMM..
> 
> Jason

