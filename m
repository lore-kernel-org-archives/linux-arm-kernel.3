Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC826C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTfbnMUIEG0n8Nzn7+iH305BTPpn6kW1wYaDzBzIPgA=; b=wQehp4UdR/ZGKyRuJeGrrXLNPU
	9pXYBnDyE82ZdWk4B1nb0Sa5V2EsVVnvDkIEjepiEYaFEGimHrfWcy38owRLCxppgo+py4alZ4CA3
	Y8j5IDz8C1jgLxrS0ULthB7bIn15I+a/ROkL0b7TxXmIZu/QrraswLpDW0tQjQyzKm6yvorht9EiN
	EGuZ8dVmsbMi9RZN2bsdMPM2mo1Jr6EWWZ2DR3URPXobfN2TycaFGZI0J3E0qlzmCydEFJ7F4BBl1
	q55B/BCDuudLPelKImkMyQVzk9t4ZSilXIGiPArX90DDLiN9XBfv0vjRTq25IN9rV/rymUzhFpyQK
	Kx4NI6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQYE-0000000Fo3v-18mQ;
	Tue, 30 Jun 2026 04:58:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQYB-0000000Fo13-3hMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 04:58:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c81db32393so33945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 21:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782795502; x=1783400302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTfbnMUIEG0n8Nzn7+iH305BTPpn6kW1wYaDzBzIPgA=;
        b=GGtvUJMn/7yY4ijn7eCnicXV2gj2eXv9TCQDr4LMAVGkCj625aOcTA6PqPOm0rKJwl
         JSrSBJtUYzDxhJ1VXC2NOpFQcB2HSSSLlFNw9GkBHh2+EoblZmtlpbvS4RXSPCQpdFnA
         iO0KrP3FOZf6bE8bW7GAOUx7/wB/2UzsMPfKtOW5L44BaszooiPsxiRQ28McsozWGFt0
         gaaMXuXI+GkQM1hnvjPoloUri3U5He5D1t16eEm++LjPtAxb13CCgpD1rVUrVExKzlAJ
         hY/G1MFQ+qxu3MCIhMgGaMzOGCvzL/5RnvMUV2klMtGqUlowzsSWPOyTvnwwLn9xDqyq
         1GQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795502; x=1783400302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTfbnMUIEG0n8Nzn7+iH305BTPpn6kW1wYaDzBzIPgA=;
        b=FJGdOCvuIcfm2y84QNp8vRSr4BkM2aqewHa4Sjh5ImH13oQEEWlWWD83d+EQy4SHWD
         6h0/zRvAbDPyZoJFC7ftU6ifObLydPD7ogrvXlx+j2j19bNsMdNQuLU8JVOL671SFGvo
         gmRnydNjJl855yxbowRmechM1WANqswDb4FfX6YXNLR7jhrQEg3nz+HrE9XIc8Igb88Z
         rtjIV1H32eFackHv4nygD8Kani8TlxpYFQhKZvK4LudVwl/3kPUiUCT8zLJv8dc6MwNN
         emVN5JTpdi3sP/E4yNz+ZwQXDD1b433WhQELUUJ/QSdw1NBV5t8GbEw9DpqzMZJ/TfRv
         W1MA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9YzEm7N8FgHwC+69V13xoRTCcb1n+VRSwNak7ch2ZGzdtMwA+MjdiwoYQC7JQUXcODiqTGFh2UvcO9YiS2ydD@lists.infradead.org
X-Gm-Message-State: AOJu0YzLVQEjI9Smg7XzZT06v7B/fYj3sDokTk2cw63i7z3+ebwwpkc9
	BJtM0XHaKTN5dwi0Dz0mH/43ULDgEUjpdVzA1BB1DDXcyakTMe9TVMDrSm/7Zr/LLA==
X-Gm-Gg: AfdE7ck7exm+1Ud8h3TLoiXewosIfsqIDlJzElJBWUg7p+YSZ8cZygPsc0HjXmQYnpx
	G6/A/rHQGxLtHKj1IBfuWim3zK1ch6TrIKf1q/qFaTCfu7pGD7ic5e+HXVZxrsBmacZQ8vjCNMS
	epuX6kZX3uXxivZR2MGWxr/0q75T3rZcr0ZnH7MNnneMAbk13OocGpjgDqBIxDDyWenRfpiWq5o
	buwQbdKzhfS17UJJyEQCbpYlKYBh8VL4xEp46Vh5QBd8Mm8PrYThwqX0BkHFto/K/ntNKkPpLbg
	LqNZlQaoXcihP4od3BSzjHmmp+bpEg0PYK/nFSIoCMg5i7iejrK8wzSy4gwT6kyI6zkanGV4lQ4
	yzfhVu5DokmDZr7FJzLD6e2G9UW5Wi+23xdXFIJzpoHzLg4OPA2mDd/Wmtj4ELptm+92dt/tAjA
	qF302IibljuhSZaQeIG0bXnmWi1iFGYvrlol7yGsmFhO2FNUU=
X-Received: by 2002:a17:903:26c5:b0:2bf:3579:cdaa with SMTP id d9443c01a7336-2ca380db35emr922105ad.10.1782795501571;
        Mon, 29 Jun 2026 21:58:21 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f3281dsm859454a91.12.2026.06.29.21.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:58:20 -0700 (PDT)
Date: Tue, 30 Jun 2026 04:58:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 3/7] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ
 interrupts in kdump kernel
Message-ID: <akNM5peYovV3GdV4@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
 <akIxS7kuhuLRHAMg@google.com>
 <akNCuEfZ30Gf21iQ@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akNCuEfZ30Gf21iQ@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_215823_924282_F7B38F72 
X-CRM114-Status: GOOD (  23.03  )
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

On Mon, Jun 29, 2026 at 09:14:48PM -0700, Nicolin Chen wrote:
> On Mon, Jun 29, 2026 at 08:48:11AM +0000, Pranjal Shrivastava wrote:
> > On Wed, May 20, 2026 at 10:03:20AM -0700, Nicolin Chen wrote:
> > > @@ -5020,19 +5029,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > >  		/*
> > >  		 * Cavium ThunderX2 implementation doesn't support unique irq
> > >  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
> > > +		 *
> > > +		 * In kdump, EVTQ/PRIQ are disabled, so no threaded handling.
> > >  		 */
> > > -		ret = devm_request_threaded_irq(smmu->dev, irq,
> > > -					arm_smmu_combined_irq_handler,
> > > -					arm_smmu_combined_irq_thread,
> > > -					IRQF_ONESHOT,
> > > -					"arm-smmu-v3-combined-irq", smmu);
> > > +		if (is_kdump_kernel())
> > > +			ret = devm_request_irq(smmu->dev, irq,
> > > +					       arm_smmu_combined_irq_handler, 0,
> > > +					       "arm-smmu-v3-combined-irq",
> > > +					       smmu);
> > 
> > This `if` isn't needed, we can continue using devm_request_threaded_irq,
> > if you look at the doc for devm_request_threaded_irq [1] it says:
> [...]
> > So, we can pass handler() here while leaving the thread_fn == NULL:
> > 
> > ret = devm_request_threaded_irq(smmu->dev, irq,
> >          arm_smmu_combined_irq_handler,
> >          is_kdump_kernel() ? NULL : arm_smmu_combined_irq_thread,
> >          IRQF_ONESHOT,
> >          "arm-smmu-v3-combined-irq", smmu);
> 
> Are you sure?
> 
> __setup_irq():
> 1497-   /*
> 1498:    * IRQF_ONESHOT means the interrupt source in the IRQ chip will be
> 1499-    * masked until the threaded handled is done. If there is no thread
> 1500:    * handler then it makes no sense to have IRQF_ONESHOT.
> 1501-    */
> 1502:   WARN_ON_ONCE(new->flags & IRQF_ONESHOT && !new->thread_fn);

I meant without IRQF_ONESHOT: 

is_kdump_kernel() ? 0 : IRQF_ONESHOT, note that devm_request_irq is just:

static inline int __must_check
devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t handler,
		 unsigned long irqflags, const char *devname, void *dev_id)
{
	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags | IRQF_COND_ONESHOT,
					 devname, dev_id);
}

Not a strong opinion though, just suggesting a way to remove the if.

> 
> > Additionally, the arm_smmu_combined_irq_handler() returns 
> > IRQ_WAKE_THREAD unconditionally, which causes us to hit the warn_on[3] in
> > __handle_irq_event_percpu.
> 
> arm_smmu_combined_irq_handler() does not return IRQ_WAKE_THREAD
> unconditionally.
> 
> This is the first part of PATCH-3 in v6:

Ahh I missed that, somehow.

Thanks,
Praan

