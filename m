Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2890FD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9uoDZoX5wcYSBPe17Yxmax+57dy5y/EA9jB+yCG4Lo=; b=V5rreebB5qlsoQkyqNw4uDMlqC
	c+NkwSoeo3MF21Bf8BBgKvdBrntnUxoPeXADZ7MeWHVj0/hpG/9YfdUeUpd3VdijsACJH7h+hOHF5
	7EtswvnzVqTmZYlmV3Sn5vtiJGh/e6gR17LzmKLNYKH7xLv1Gg6ViGTamYULLWGicqoUBDQl/5U+m
	i4SUhGSR1xlt7FfsyRPcJLO6xCu3Zc13JvlxUkOiJ1OxXS5ilm83iopvaZDUT4mhPWe4jPzFx9Epa
	0sZnkQSegVXNuR8bNjS50MmZ2ZepC97y6rtHSram4WUGuatsoAr6796kJ3WwMdC72WgEIR1ZYKahJ
	awioqCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03GI-0000000AD81-03hF;
	Tue, 10 Mar 2026 20:01:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03GC-0000000AD65-1vSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:00:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ae3f822163so31225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773172855; x=1773777655; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9uoDZoX5wcYSBPe17Yxmax+57dy5y/EA9jB+yCG4Lo=;
        b=XTdImRstbaJVLcGD7Rm9KyoUVO2SRoMYmQ0Qruj2hSjRAsoIsQIIwkMwLeBp/w34L8
         w9OvvEJjSpWdQeDuLS52AsQtsZ7Ubf4o/zR7KjixfNlQ/J5Bo+QmfLQe+XO7QdSMnPWF
         u8bBeTrIXla526zVxQTJfiAEtlRzV6n5kIESrWIfYA7XiGzx9lajYGHQCnBBnxOqyw+d
         euvdWPwcjXMgy5VZko7+Kwlc6c+LOrqgFlGDulwNBM6ZO9tbkMkTKuHY865/WoQiJgOc
         eDqOi4UQmFFmMKYZA910FLLsCBf/u9EtvolgLkppHkHDlRsOR+tKg5DUpYjq1SuCervz
         rHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172855; x=1773777655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9uoDZoX5wcYSBPe17Yxmax+57dy5y/EA9jB+yCG4Lo=;
        b=L1ZB4qkb6E+LSxts4w4Vs42ZRKpm2N82cPDpdmhrFXfkcinuV8lHKSmZnY9swzivVJ
         S6eRV565XY0HQOD7q5ul2oAlMpxXWE1Xx+svw+P1xOT7Oi0e6rt10QxCSxEq4StPJIyX
         T/lxqj3u04stCojeGhazFpd/t9knUGG+NSvx6mDVvwDtAC9nS9jHV0m7Tac/nHGT6iLL
         2Ay/UKjdo0pekefPrvaIYaweVXKZSFlyrDsAZwIrJgVk5TZqoyvp9Ccm0iPiqml+FlzW
         dFRLLT67CKCcdo02fmOiFOej0TFbGp4gNRx2kqaNMLYtPBnpViJdpNrLeMW1DjGiXMpp
         aZVg==
X-Forwarded-Encrypted: i=1; AJvYcCUblBggVrq0wtDsjryAGTX5GHiv0gPXZaQ8rXRIcKYBActxuvR5S7DhUfG2H+3e3BEpvCITrbTrsU4TN5EVX/64@lists.infradead.org
X-Gm-Message-State: AOJu0YwnCzWKUrButx41kHOsa4skfZPaIk8NbRkzarq/3qhuU7maXh66
	Jas7k2gfnkOBo5dpxZr93aseFMYy2jElgunoq8UZOzh5tQJxJxs2pVEeZDCMvMK2Zg==
X-Gm-Gg: ATEYQzzpBhSsfey1KA9aNARE70p1gm6gXf9pFskI+UQsSGj9GgFj1Jg+5ih9PgAQvvl
	7BQhYiGwh1s/bb7hZDCyOIOsRhTk5aCe/qjIEAY2jbJd0aBM0tSxGuZlA8vrIVG4nmoFI31ClS/
	pkGeXm5IEiWR/ClKGdZDRwadzNChEzvdzeyRQgIT2mj4Vf5P04+7IWECjBO8Ng/ihsRUSwAvJbq
	+J0z0Da1obHjidfPK0oWUs985muL9B56AW8pm0kYmvADyoh6cx+ww3n6RLe5PFIr83KD3Uvp9WU
	zy/K4D5wBmtxas5PD2TjPMCiMXwD80YZCXkuaGgDb6SUJnnmE2e4bmgW8TaXMVxrhRNZwgPJhQC
	s0/x+2FtiDZ4YeJp4NvedO4gdHCC2zLv1xJmFi39mAv6YD0bySnHF+ubkiIWQ3eJr8l3Yoo4Xl8
	vM0rXpck5725ekyIb2tyrIk+iCKEJsnuCbui3HypJ8gidT36ucHvEZBO7elw==
X-Received: by 2002:a17:903:2ca:b0:2ae:5d57:c94f with SMTP id d9443c01a7336-2aead3e31a0mr779595ad.16.1773172854782;
        Tue, 10 Mar 2026 13:00:54 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebe95sm83922b3a.36.2026.03.10.13.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:00:54 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:00:48 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, jgg@nvidia.com, rafael@kernel.org,
	lenb@kernel.org, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <abB4cAjZjIvIzhkp@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <abBt8qj8QpkG-Fwh@google.com>
 <abB2V8VGfoh5yO45@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abB2V8VGfoh5yO45@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130056_504045_F070372F 
X-CRM114-Status: GOOD (  33.44  )
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

On Tue, Mar 10, 2026 at 12:51:51PM -0700, Nicolin Chen wrote:
> On Tue, Mar 10, 2026 at 07:16:02PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Mar 04, 2026 at 09:21:42PM -0800, Nicolin Chen wrote:
> > > +	/*
> > > +	 * ATC timeout indicates the device has stopped responding to coherence
> > > +	 * protocol requests. The only safe recovery is a reset to flush stale
> > > +	 * cached translations. Note that pci_reset_function() internally calls
> > > +	 * pci_dev_reset_iommu_prepare/done() as well and ensures to block ATS
> > > +	 * if PCI-level reset fails.
> > > +	 */
> > > +	if (!pci_reset_function(pdev)) {
> > 
> > I'm a little uncomfortable with this, why is an IOMMU driver poking into
> > the PCI mechanics? I agree that a reset might be the right thing to do
> > here but we wouldn't want the IOMMU driver to trigger it.. Ideally, we'd
> > need a mechanism that bubbles up fatal IOMMU faults to the PCI core and
> > let it decide/perform the reset. Maybe this could mean adding another op
> > to struct pci_error_handlers or something like that?
> 
> Robin/Jason already had similar remarks (to most of your other
> comments as well). I have acked their comments, and am already
> reworking on these.
> 

Yea just saw those discussions as well, replied before seeing those.

> > > +		/*
> > > +		 * If reset succeeds, set BME back. Otherwise, fence the system
> > > +		 * from a faulty device, in which case user will have to replug
> > > +		 * the device to invoke pci_set_master().
> > > +		 */
> > > +		pci_dev_lock(pdev);
> > 
> > Why are we using spinlock_irqsave across the worker? Also, why does
> > atc_recovery.lock have to be a spinlock? The workers run in process
> > context, and I also don't see anyone else take the atc_recovery.lock?
> 
> I guess mutex would be okay here, since there is no other place
> access the linked list. Pairing a linked list with a spinlock is
> just a common practice..
> 

Ack agreed. No problem with the type of the lock, just questioning the
choice to use spinlock_irqsave et al since I don't believe this could be
in interrupt context.

> > Why does it need to be irq-safe? If this can somehow run in irq context,
> > we also seem to be using pci_dev_lock and streams_mutex across the
> > worker?
> 
> pci_dev_lock was to fence race on the PCI level. Yet, the entire
> BME call is probably not a good idea. So, dropping that means we
> won't need pci_dev_lock.
> 

Ack.

> > Mixing mutexes with spinlocks is brittle and invites 
> > "sleep-while-atomic" bugs in future refactors..
> 
> Either streams_mutex or atc_recovery.lock was scoped for only a
> few lines each section. Each was released before the other one
> was taken. Where is the "mixing" or "sleep-while-atomic" case?

The case doesn't exist yet, I meant it as a warning against future
re-factors, since I didn't see the need to use a spinlock here, I didn't
understand why couldn't all 3 be mutexes when the existing 2 already
were.

Praan

