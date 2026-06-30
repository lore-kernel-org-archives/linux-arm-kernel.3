Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F187BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 05:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZlx3+QrS8E5J6yUhrTaagwhrce5Kq0xuQVQ07nl46w=; b=T4NJ0pAhjQWmvKamcUdmQsIhrk
	niXcTCSzpjCpSSmnoBZTPll7ZZmEeSxlzyv7uTWVmE+2lRkbV0C7NpyI11aNY374YJ46/pVG3xMJ1
	+U+jfsjQ3jSwhrBj5ZPZ3KPtUA4+f7meWoPm9zIselIJhGD3XGaybWLN4YlEz5nV3sUYeo8WagEAy
	yTuYNgv0eG6+rAO9bRbufhAVXM3MRXndQF04NSotGak/+JFD2zWi4L+LMOID0WPP1GtcwGxA8iVT7
	9THNDWxfyurB5gsUrNT+tD+B4crf986NdmTtSdiFypnjjp9nvzw4H4z5ODam84m3N0xk2WfKRcmZ0
	JMhe9UPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQal-0000000Focm-3vDq;
	Tue, 30 Jun 2026 05:01:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQak-0000000FocP-0YNJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 05:01:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c81db32393so34095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 22:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782795661; x=1783400461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZlx3+QrS8E5J6yUhrTaagwhrce5Kq0xuQVQ07nl46w=;
        b=ZcEwpDK4AKBM0+YHyhedD22gM+39uUUh527vGa4NUdKYYiR6UvXkkvHdn52zKeb33+
         En4IdIoaac+48QtPvXw9BJapKeFglHNWlldQfg5AWLClciA5YX/TkyUZrs0iCPUyvAUe
         5vCm4j+Ixbi88kHfsZZNQVeViEumBxhbZAlS39oSsQxfyMmOuCR4552JJqAihGl9Yifw
         nMxR9nZi6nnxTEMiTEiaXkTl5t55ihj93m8pSovE5l8ZcD5KJGIZfkARUntZm7dB+yAk
         Hhxk9Qu39wa5rjZSZGLD7GysgeSQ6RNsIPvyzsurTW/IXUKIWihkRcFvijxRnFWg8Wfs
         3yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795661; x=1783400461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZlx3+QrS8E5J6yUhrTaagwhrce5Kq0xuQVQ07nl46w=;
        b=V7OWzwkA8umHvfVQGVPaS9k5zohW+uegxcPkDoLThNpED6VoBdegm+ddZlycX3kg+k
         9WX/68M/bpYdEN8mn4TkMBNQTYPR6BVbOulhI3RmvTs5mXTuereTluC7Bnp1At3pwF0+
         BRwp/ZR35GsVQQhkievUyHs9fjz8h0NL2pIFLwq4AVN0tcSYb81KghmKNxlefBrIhlun
         +Zk9qUNMNSGAMVPTY/3PmppWD3HggrIBi2cylLZLngsdSHWuROgQvTuxTkdVggcgy8hu
         aJ/6Ps+9mvZzfktECdOD0+S0eopodDhGvVgDXK6EsNQu8pKD2XDpfLDTIgsOLd1NKbV1
         xgyQ==
X-Forwarded-Encrypted: i=1; AHgh+RouVmkaBtv/Vlou2vvfy7RovVAqGg2apc9t1GdIQM12rugQCw0vKVeKb8xttN9MfP/9K+gbuUAFOYyjO5E3UMuq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3PCh8JKZZO6/J/VEsLqpXXPrppcZ/p6NEbEPdv3+8VNL/W9g3
	HhYSppS4d1HbiLxbf7n9kINCLq5DhykmTULYPlxuOEcXqYrCs+TQqprTJmmxPIUzrA==
X-Gm-Gg: AfdE7cnoQVh5iq3GwLOSAU6Wq44VJLd6/7AFdyQwdk1mk6j6AA505ZNR3L9GFElzJGb
	ls6XuYSphnFpULEyP2KO2ozQCI0Tv/Im95Oq4vIUmtcXieYg21F4/t75FAXdHIubxfZNJQ1+v3s
	ZuXUdDJvw5VZqLT34HrPzga65ONd2QZxm8UiJ3eeERiDePE4btyu/FOC12nJCWCWdZTcqDsK8pP
	fFy0gwNOsTxpLX7+gcBY5EATgYsqv+CAIIFHal6FpgS0D1QU+9cM6mxJPbzTCyi40VDZprjo/ax
	9RzShRNkuLCMUW4u6aQc6dCgpCpNVRsObOsGylmnjbybkWJRQEstvrjhd5GhT8UOtOy3esehxJK
	k2b0ctJuCeReWAoWrE0FpuTd/2gIPPsgw5dN2++/5RtIUIL484lbHtxpqpepL1KKf8HYnoYl70l
	6lJKySGdGO6Cu/E+bXhwMbB2EO0dwtA6/u5vhHwSRqoL5PsWw=
X-Received: by 2002:a17:903:240c:b0:2c1:ee6e:be1d with SMTP id d9443c01a7336-2ca3df01df2mr507815ad.27.1782795660514;
        Mon, 29 Jun 2026 22:01:00 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm986590b3a.32.2026.06.29.22.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 22:00:59 -0700 (PDT)
Date: Tue, 30 Jun 2026 05:00:54 +0000
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
Message-ID: <akNNhjmOulawZwX1@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
 <akIxS7kuhuLRHAMg@google.com>
 <akNCuEfZ30Gf21iQ@nvidia.com>
 <akNM5peYovV3GdV4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akNM5peYovV3GdV4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_220102_179558_0F5028D1 
X-CRM114-Status: GOOD (  22.00  )
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

On Tue, Jun 30, 2026 at 04:58:14AM +0000, Pranjal Shrivastava wrote:
> On Mon, Jun 29, 2026 at 09:14:48PM -0700, Nicolin Chen wrote:
> > On Mon, Jun 29, 2026 at 08:48:11AM +0000, Pranjal Shrivastava wrote:
> > > On Wed, May 20, 2026 at 10:03:20AM -0700, Nicolin Chen wrote:
> > > > @@ -5020,19 +5029,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > > >  		/*
> > > >  		 * Cavium ThunderX2 implementation doesn't support unique irq
> > > >  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
> > > > +		 *
> > > > +		 * In kdump, EVTQ/PRIQ are disabled, so no threaded handling.
> > > >  		 */
> > > > -		ret = devm_request_threaded_irq(smmu->dev, irq,
> > > > -					arm_smmu_combined_irq_handler,
> > > > -					arm_smmu_combined_irq_thread,
> > > > -					IRQF_ONESHOT,
> > > > -					"arm-smmu-v3-combined-irq", smmu);
> > > > +		if (is_kdump_kernel())
> > > > +			ret = devm_request_irq(smmu->dev, irq,
> > > > +					       arm_smmu_combined_irq_handler, 0,
> > > > +					       "arm-smmu-v3-combined-irq",
> > > > +					       smmu);
> > > 
> > 
> > Are you sure?
> > 
> > __setup_irq():
> > 1497-   /*
> > 1498:    * IRQF_ONESHOT means the interrupt source in the IRQ chip will be
> > 1499-    * masked until the threaded handled is done. If there is no thread
> > 1500:    * handler then it makes no sense to have IRQF_ONESHOT.
> > 1501-    */
> > 1502:   WARN_ON_ONCE(new->flags & IRQF_ONESHOT && !new->thread_fn);
> 
> I meant without IRQF_ONESHOT: 
> 
> is_kdump_kernel() ? 0 : IRQF_ONESHOT, note that devm_request_irq is just:
> 
> static inline int __must_check
> devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t handler,
> 		 unsigned long irqflags, const char *devname, void *dev_id)
> {
> 	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags | IRQF_COND_ONESHOT,
> 					 devname, dev_id);
> }
> 
> Not a strong opinion though, just suggesting a way to remove the if.
> 

I though I had given an R-b earlier, but I didn't.
With that nit:
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

