Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yhTYmczFL2uCxVu8k1+oZGQNpSYllSaCHFjNudZdlY=; b=zq/iPjyBXy050qpQBuDrAWsR50
	CSm0nyuzPONED0aomX6mH16ArusjFSLiZsW7eFhvwoUSIDco8hYl8ka0nV/ZBm1rcA+5cngE2US+3
	Fvf9UisHpDYfncNj9UmBkZkoNktVt2CAy15bpOZ84enPcsb3jHMbZ3UrZCUYOPCGW7hcJSs2zStt2
	zNCMpBqeoPWn3zOfhbbzsiV2MgsoXIjZHgf3HQwrqi31erjUBoRgQOMINN792WDfBpaXjCHhrnpND
	DQkkUHlA9XbuxKWXm0P27Aqa0XeIYIFPV0OgawVpuN6ov6qGZa4XxCzyd0FOMukBBCOHWY4zJ2Ytm
	zh5WuSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZoU-0000000HJ0R-2VqC;
	Tue, 30 Jun 2026 14:51:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZoS-0000000HJ02-27TB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:51:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c9b1db4964so54615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782831107; x=1783435907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yhTYmczFL2uCxVu8k1+oZGQNpSYllSaCHFjNudZdlY=;
        b=H6+1j1RbPHpdv6eFxjffwj1YfIWXRRGyM+w7th1lXFZBWS498aIlm79mzTizx9c6Rh
         ZPnrBoFCRyNzWn7B+L6i9qlVDYgR4WalNsckUMw0DeWrD83h7Ls7SRN7YHB/EZiytm4X
         yBfVzLDhSTcCUf8OSzbbfgEAT4gktGtcbcnuAJTAeNifwqvMcs3wn4dsB5P4erD658cM
         pmK6P8MN1Mt/573S1vDtF5OdrDerWVcsD/osi5UTmJdz/S6Fvx768HQ6gG4BtvsHc2Za
         h3IjlzMo5z5u0hCtRnKd8Dk9k6IFHIbWJnCvGljoz2E3bh8kGn3kkME8b3AZ5lmLTfob
         7KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831107; x=1783435907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yhTYmczFL2uCxVu8k1+oZGQNpSYllSaCHFjNudZdlY=;
        b=mAkTq98Z8smpZpYBzzCM1grGpZD1IlmUbkZ6wTEn3vmEU2ySuP4CwrAjz9T2wuLbvA
         t/YfEcrJWGw6mrGamRbc/I7UR1UjNTfp97R8dtoQ4e56IBfjfx5L16PlpV1wEw0cLThG
         CdP/kbGzyl+rFalMePV34O+L+Oh5/cWde0x1aFRJKK8+ddlSQo4Mz9THIZYcwYV63bu+
         ADVCUmohCUQWmgMB8V/UwidaSpfA9e3ap1stsKemj9bRXWBaTqWA90d9DwKTTlGgM7aM
         5er/+O2OOjzUNA0ysNq43Ge5l9sc14Ytf5EdPbluECzI9x8ZqHvUgvIyYwG+crGWFIv9
         tPWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2QjChzrLCu0taGQyEje3pJjf4MkwF/nDcoM02edgoxLPjwmkGvF/gvBbxlUNY9LEcl/Lq/xr7RVKTfU90cwb3@lists.infradead.org
X-Gm-Message-State: AOJu0YzQQ2/kxOvMBFAMrgCHtLqRybN8yQmgRFT4J9DO8UbKbYbN428g
	U30siPlvs4xH9Flz6GcWx13IO5d0TCa7S5660aVcNGu9qE6ZuoP7W3qoy1rMPOaSmw==
X-Gm-Gg: AfdE7ckfEUNgaiwKWkyndA57QvMrvuPz0JSRJIz2vOV+sAXzb05d9AGO9XpTJ/mCSgH
	bIEwbu5Jp9Eptl5FFYz92byEI0JjllOyNLXDtD6Z9mVoOKLWkXSCE91lY9OTk0u0ZPv0a82/qzR
	CkbrwCgngeAUfScxgKklwm1q3kEeeap+5YuRHgnDxzWFTWIBVNcjYmJi/1hARBCHS9sbcxmbFsF
	HpyCUfW0bYBxfzFZM1tHif7OBWfy8GX8HfZ66Jajxl84vQiMaegclgQOgOT4YrYNoQ5Saht3sCt
	cMf89aqXCwCpKflV5KKc81Eg0Y4Xa64wJvkRPAFCB2JLWkDFLxH2FxeZiP3UYHVO/kZ6cRCIvX2
	E2BoWcGvlRsGf7bAYA44eSAftcm2RFOFg4q+L+kYQm8sl+YWC0r1Vg25bJYlqIXq7B6YIIv4qqm
	TFSLar/YG+rJxhgAkBj0U380A1lJ/4p2p7ZqCr8PnAvnd2gAY=
X-Received: by 2002:a17:903:ac6:b0:2ca:4f33:e87a with SMTP id d9443c01a7336-2ca5d8db7b3mr287655ad.17.1782831106989;
        Tue, 30 Jun 2026 07:51:46 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d64c6sm15636325ad.82.2026.06.30.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:51:46 -0700 (PDT)
Date: Tue, 30 Jun 2026 14:51:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <akPX_N0P2EcI_jbV@google.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPB6l-fuJUcg4a2@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075148_546511_85317030 
X-CRM114-Status: GOOD (  24.70  )
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

On Tue, Jun 30, 2026 at 01:17:30PM +0000, Mostafa Saleh wrote:
> On Mon, Jun 29, 2026 at 11:15:33PM -0700, Nicolin Chen wrote:
> > When transitioning to a kdump kernel, the primary kernel might have crashed
> > while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> > driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> > and setting the Global Bypass Attribute (GBPA) to ABORT.
> > 
> > In a kdump scenario, this aggressive reset is highly destructive:
> > a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
> >    PCIe AER or SErrors that may panic the kdump kernel
> 
> Can you please clarify more on those errors, what conditions will
> trigger that?
> For example, patch 4 disables the EVTQ to avoid events as there might
> be a lot, why are they not fatal also?
> 
> > b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
> >    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> > 
> > To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
> > and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
> > flight DMA using the crashed kernel's page tables until the endpoint device
> > drivers probe and quiesce their respective hardware.
> > 
> > However, the ARM SMMUv3 architecture specification states that updating the
> > SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> > 
> > This leaves a kdump kernel no choice but to adopt the stream table from the
> > crashed kernel.
> 
> In many cases the patches assume that the CDs/STE might be corrupted,
> but still attempt to retrieve them with some validation
> (log2size/split...)
> However, the base address might be broken, TLBs state is unknown...
> 
> IMO, although that might improve the status quo, there are still
> heuristics, in addition to noticeable complexity to transition the
> stream tables. I wonder if FW can deal with AER in that case before
> booting the kdump kernel.

I guess we're reading the base address from the HW register itself so
that should be fine? CDs are in-memory so that's why they could be
corrupted?

About the TLB state, I'm not sure what might pollute it, since this is a
kexec, I don't expect any non-kernel entity to gain program control
before the kdump kernel.. Hence, IMO, we can't configure FW to deal with
AER here..

Thanks,
Praan

