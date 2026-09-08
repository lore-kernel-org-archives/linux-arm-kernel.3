Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8499C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nZbq7ojrvR0nhCFEzuDTGoUBYYORnGgdKFued90iew=; b=fpu0Jjje/HZJ3HaDqjyCXXKK4y
	TU8AITFwoHqx+xi/R8/VsAuFcqjBV0FZL8NNfB1rpi3QVTqhlHrT244cH/tQvECWV6sZO2jzth7WV
	WB9xAlRgcX4axUMXfZPisVsakDGa1iLVNez52aev3noUxOi5PzQ5n0cCqAtMysHi+Esmpb3nPPSkQ
	2tiVO0D49ZGqSdX4RLlRIMXz2t3mDGKsDeVZCS1/4j7OrHxrYJNPOqLN4YicvgN1Zmd52vqYMr6GI
	fRUlFDS3Mb+1t0gsUePxleV0m2kYXBYLpiuhRc+T1l1aXeoillL17aFtb7cpfM5Z824/+1QXh7mVS
	Q/Hc6+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42ED-0000000AABf-0GLA;
	Tue, 08 Sep 2026 20:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42EC-0000000AABQ-12JN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 20:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8nZbq7ojrvR0nhCFEzuDTGoUBYYORnGgdKFued90iew=; b=VseYl4nDmGVgOZhBvqXFFBCgl+
	15hNzpdCycondtOEGnkf1wjL/mN/LTao7fSXE74UtWGtoxJ/WCXyzAoeTL28IPj9vBJGuZP/DA9Sc
	QyMH9mtCOQZYpNMrLqiQELCQS6O9mRg/wtISxd/nbLs3OtwKX+k5LYPSa/yNuY7Tj7VpFPdxA4N1V
	h2di8I2oxjwGuyMtwpWyJikj9EypTKDkytrVlN5RzvYEFakzpL8gJwICIXaRSgpU5ZnBgHCJciSqp
	zUdAGOm776NO6zFVK2XYhLaq2CVzhvNnkFtnGzLY+j9FsYjK4Za4AJZUCIchqPUWYdt3o/W+yFIQE
	Blt7DZtA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x42E7-00000000Jq6-1onU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:15:34 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d6ff3aca07so355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788898527; x=1789503327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8nZbq7ojrvR0nhCFEzuDTGoUBYYORnGgdKFued90iew=;
        b=rSNwVjS1YJEB1plidvsYW/zlfD6LikGwUYGXxcCt+XAqq882JD5qMUILlU48cfVG1U
         DXx9lYec3w4OGYtyp+GWB5YJCCeHxgNQV54ogqOQO6ON+F+mEVE7L749PrRIxp1jY7gM
         yJyvj8T15L5/eifi8qJGEKWxorHtQ1U9b+ErP3r4yMUwTJJiBcy60P1RYyQuVMC7cOsC
         rtFXGnDdFgWYmlUVgizjIz//D/ekH0ljYGEXSq/ddvJo3pgAqIFlB/xPhQFlVECE0i9x
         zm3u1+84pbtRBK50FAgu/art3YGDdcTmkgAGmHaCHph1oKi2AT0+epRcsl8fBOXiaDzx
         vrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898527; x=1789503327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nZbq7ojrvR0nhCFEzuDTGoUBYYORnGgdKFued90iew=;
        b=lpCH9+D4Igy6XpQC4+8K+omtcL9qV5Og9H5hzWPp8NWULh8mwzqyW2AhWmp/XWyzX9
         3JkQj+qCBk9xWN7derU49k4g9H1h7lgdDCSU/xyGEo92q5l7ahtLTftTdtaGNehXdbZw
         3q99yfc0w1mJl1TN6e3Xg1ocbU+8jzgq3BHDmQNXlsT8Z2Fs4Mfxxa6RV8I60Egre+0G
         rkt3EEFYbbcT6T1F7BxOcIwI6PFHxGtpdAEcvNvZ6PvF8EYph9BZc7YEHVU+jOTE0Eoj
         HTqmoZWcAvteOjMY4KvT7wsZbfx7nOxpYS7vMQRRCCbeuEjHgCZ3dxUYJ/9bpVDy+jTO
         Vm3Q==
X-Forwarded-Encrypted: i=1; AKwUvBznIx16Dhp8i6prenKp3D/vvfZAYdtc/F/ppI+fiTqHLPC62qHVmYCXIrCgBNufhFldFQ3sFDOTWSLqouHqooQJ@lists.infradead.org
X-Gm-Message-State: AFuF++mcLcIK6G/vb6HPIJ5vWgZrxS0x7do7BIzAVSwpQuf6GDNQa58K
	oICRf9KGTBIUgiFf1OtGQm1Jw1bjdRoqRUs7LUZKA3U5vhLKyYuCLYggtOaNbxv88A==
X-Gm-Gg: AYBFou079Z4r7ZSVOxISkywLe9Ry0ozQfaVamS38ZEpRVFdxb5V7s3nJXj/RCRcxxMY
	geYMdc0Ia/tiP/Jl2mo+5NSYGv7rxHlgJgsAaXhv4nejDLAhA8PefnEKsqWXcieGn+29TwtVEqX
	gkfhBqzu8hcdrei0ylmZAmL2ANTEMJk2EfPkIb40rkblSeJ16uMoiXvfUCDAewJgfLHORkpQcv9
	yJs9OkAPDBO2mIGjOkBmmJqdWUxjku/Tsb4ywelDGzitpwMMZ8gZlrvuY+69g0PHFDDjL2Hj/o/
	uHf/1ZNtwaZn9Rdtw+JKI2GJv1DHwnsdNnNh/HZEZlhbWLWMdPReoMMQV9q1Qmu2E1Zg2nSSKum
	xoslnkKEF3WaR4LLsiykn3Z+/Ty08+GQmp0cU/XztdJuFOJyW9DoSQi4c+ujs98N/M0Otx2jVy3
	Ap1gh5J6qaSajNqQqe2X6l6C6aVgKQLlOdvgNaE0Niic3NpOS31akjwyWjPYT4VGKwYc0vX7tQF
	pHxiT6Rggv3YDQFmoSpRFYKqg==
X-Received: by 2002:a17:903:3df5:b0:2c9:b404:b55 with SMTP id d9443c01a7336-2dbddb1f4e9mr1130545ad.6.1788898526478;
        Tue, 08 Sep 2026 13:15:26 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm339807eec.13.2026.09.08.13.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:15:24 -0700 (PDT)
Date: Tue, 8 Sep 2026 20:15:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v10 07/15] platform-msi: Introduce
 platform_device_msi_rewrite()
Message-ID: <aqBs1Rzz_i1N7756@google.com>
References: <20260908171712.356645-1-praan@google.com>
 <20260908171712.356645-8-praan@google.com>
 <87se3j1qgu.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se3j1qgu.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_211531_762808_AC331E0E 
X-CRM114-Status: GOOD (  45.28  )
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

On Tue, Sep 08, 2026 at 09:40:49PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 08 2026 at 17:17, Pranjal Shrivastava wrote:
> 
> ...
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason. You really should know better by now :(
> 

Apologies for the confusion, Jason just directed me to avoid open coding
this in the iommu driver and have the irq core handle it instead. [1]
Jason had nothing to do with the specific implementation / design here,
that misintepretation / mess is mine :( 

I'm relatively less familiar with the MSI pieces, and gave it a go
(probably should've prefixed this patch with RFC). Sorry about that!

> > +/**
> > + * platform_device_msi_rewrite - Rewrite the MSI config for a platform device
> > + * @dev:		The device for which to rewrite interrupt
> > + * @irq:		The interrupt number to be rewritten.
> > + * @write_msi_msg:	Callback to write the interrupt message for @dev
> > + *
> > + * Rewrites the cached MSI message for a platform device.
> > + *
> > + * Note: Platform MSI does not automatically cache composed messages. The caller's
> > + * @write_msi_msg callback is expected to cache the message (e.g. into desc->msg)
> > + * during initial configuration so it can be rewritten on resume.
> > + */
> > +void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
> > +				 irq_write_msi_msg_t write_msi_msg)
> 
> Why is this a platform device specific function and why does this need to
> hand in the write_msi_msg() callback, which is already known through the
> interrupt descriptor and the top level interrupt chip?
> 
> I spent an awful lot of time and effort to get rid of these platform MSI
> layering violations and now you start adding the same mess again.
> 
> Not going to happen.
> 

Ack. I'll address the layering violations

> > +{
> > +	struct msi_desc *desc;
> > +	struct msi_msg msg;
> > +
> > +	if (!irq || !write_msi_msg)
> > +		return;
> 
> Oh well.
> 
> > +	desc = irq_get_msi_desc(irq);
> > +	if (!desc) {
> > +		dev_err(dev, "Failed to get MSI descriptor for irq %u\n", irq);
> > +		return;
> > +	}
> 
> Doing this without having the underlying interrupt descriptor locked is
> a recipe for an undebuggable disaster waiting to happen. It might be
> "safe" in the context you are calling it but it's absolutely not safe in
> general.
> 

Ack. I was thinking about races but I assumed the descriptor shoudln't
change but that's a "happy" / unsafe assumption.

> > +	__get_cached_msi_msg(desc, &msg);
> > +	if (!msg.address_hi && !msg.address_lo) {
> > +		dev_warn(dev, "No cached MSI message found for irq %u\n", irq);
> 
> That's just wrong. A message with a zero address is valid, e.g. when an
> interrupt is shut down. So if there is random crap after resume in the
> message store and the interrupt is valid, but not requested, then the
> cached message still has to be written even if it is zero.
> 
> So this want's to be a function in the MSI core code. Also this is not a
> per interrupt problem it is obviously a per device domain problem.
> Simply because the device provides the message store for all MSI interrupts
> which originate from that same device and therefore _all_ MSI interrupts
> are affected by that, no?
> 
> So this all can be solved at the device domain level without sprinkling
> per interrupt invocations including conditionals all over the place.
> 

Ack. I was wondering if the irq core should also cache the message for
platform MSIs like it's done for PCI ? Would that be a bad idea? Or is
it this way by design? (I'm having to cache the msg in the iommu driver
atm).

> Something like the completely untested below should just work.
> 

Thanks for sharing this! I'll give it a go.

> Thanks,
> 
>         tglx
> ---
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -669,6 +669,8 @@ void msi_domain_free_irqs_all(struct dev
>  
>  struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
>  
> +void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid);
> +
>  /* Per device platform MSI */
>  int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
>  					    irq_write_msi_msg_t write_msi_msg);
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1775,3 +1775,34 @@ bool msi_device_has_isolated_msi(struct
>  	return arch_is_isolated_msi();
>  }
>  EXPORT_SYMBOL_GPL(msi_device_has_isolated_msi);
> +
> +void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
> +{
> +	if (!dev->msi.data)
> +		return;
> +
> +	guard(msi_descs_lock)(dev);
> +	struct irq_domain *domain = msi_get_device_domain(dev, domid);
> +
> +	if (!domain || !irq_domain_is_msi_device(domain))
> +		return;
> +
> +	struct xarray *xa = &dev->msi.data->__domains[domid].store;
> +	struct msi_domain_info *info = domain->host_data;
> +	struct msi_desc *msi_desc;
> +	unsigned long idx;
> +
> +	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize) {
> +		/* Only handle MSI entries which have an interrupt associated */
> +		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
> +			continue;
> +
> +		scoped_irqdesc_get_and_lock(msi_desc->irq, 0) {
> +			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
> +			struct msi_msg msg = msi_desc->msg;
> +
> +			if (data->chip)
> +				irq_chip_write_msi_msg(data, &msg);
> +		}
> +	}
> +}
> 
> 
> 
>

Thanks,
Praan

