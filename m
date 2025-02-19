Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B9CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKMJ3X6Jzp+wNnNxZ3cTu3f1diCv42/eMEvkIcSBFc4=; b=VeekTc5kf7Vy0fDMQBpvqCDfhG
	Okqj6VG2GgXLYX3LAkiYDSrPFDSGoZFQ0fjWpJWgjdtoZhS9sEXKwBs/WZLnnusqlCUs1TNcK/J7L
	LM0LzgPsqtqrqRHWNFZ0t0UF+zhT53Q9MRtMoFRjMiGiYApD8tpAD/zSVjg08l4xZB6Xj3798BqbB
	bWLBNvSbpflj9m8amz8LHlQWRIC8iS8q6cGdUQ2nZ5uqMzGACmDor+dBaPza04t9XK/dsgs4Adepm
	e/NrM02RclADcHSqUVM1D4vqzeg4SA2L8BCs/rG9wZO2U5XGIrk5565h9dN56OV7+OTtyBD3xWHWp
	r7f6OW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoqg-0000000ENGY-1xr0;
	Wed, 19 Feb 2025 18:31:06 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkopB-0000000EMpF-2yYm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 18:29:35 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c0a1677aebso7681885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 10:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1739989772; x=1740594572; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKMJ3X6Jzp+wNnNxZ3cTu3f1diCv42/eMEvkIcSBFc4=;
        b=Ulnn1sLXaiF9DiebfPcf529FHT4cqqqBkvPcHN3sq/o/Zpk0t7s9p9eTOmddYoXbdQ
         rBj1dsbHPN+CB0dXBX/tB2oZEmocqPEzQVczccMFTTgv/vN3Yk/79siNPOIEh9T9CLVe
         CAhyrIEQstLTFgY3JJa2RlHFqQ1zJ5cKqtnHSCwmf4lvvIVFYQx3WuD1ae0vBLvFlMmh
         QsEI1tUcdOQAxLqJr0zzAX0qEUDMUX45M+DXzLU3pZs3ZLRQEiq7kNhum49NkdnuP9bo
         sG2cAJNvt/SV8jQmUhj2rcX2qTj8QLjKOddEGkDhmrLekp9MBqOOrALsdK+pw8OmYl0L
         MV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739989772; x=1740594572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKMJ3X6Jzp+wNnNxZ3cTu3f1diCv42/eMEvkIcSBFc4=;
        b=jacicYCOnjC2i+oOd4P9MepuCtwys9yHJ1m/4RBda+EgqHtG4m+RXy79aAljuE3oie
         bU+x7Jfk+AFkfNUc9TUHCIhFn2iwVz6ciMO7L5/wWo1RyGL8R0xy1/CnCkrIJ+EvUhgq
         h4QkcMO9ixArqrU1EmFXMrAsvWo4lbjs9vMinZnw5yvU0Ovp4i+kFWpRb2ElFe7+yZW1
         eJan5pC349w2vaUS33FkcMGXnuBksXdfnHDuUNW2Tx3amH3FZVrk/cAh+i2fLU6YvT+/
         NcMrFLTwGTs1A99AibE6vFlsOT9PRV0fJmgRUPRRlw1lcfyqtQlBB1hiN5zNQSzw/rzk
         wF8w==
X-Forwarded-Encrypted: i=1; AJvYcCXpuaeq3fnug7TAMtAKTHidRueU1F0H/FUH4OcWTsA+XOV/Fsaz3Zc7WPDo+GAeZmkeYUfxV93Etqk3+zefRvAP@lists.infradead.org
X-Gm-Message-State: AOJu0YyXxolD+VJKty+X1sJa90MUPngt9Xgn0WFrWxICRFjdevR33r+G
	B9bIZ6SRFFz/N9YzGStGSbFbEeIzeseaMe8X2851SduSNuaNJ2PnBlTIWnbDA5w=
X-Gm-Gg: ASbGncteQFy9700WZ92wGmZS1R4GTT+wFMY0QPyJjeMRzD615Q89U9nrIXtV8XaqXHX
	BLht3aHBijlD2wKFt+82VRaGROBarr5moXriEiFuhBefhSZAd9DrWbTUd52qvlwrtTVVRGh7HSO
	5xwexzBrshgavXnO4zfKIsO9uvNN2J2SK2jQmTKGm/98/PAoiBklJAQEYUkm16BoJAQ+R87/Y0q
	nq25zuefB7Ne/Ie/m1dmxXVdK6bbmjANeQKmzXZHIjI+VFEgKAMfRQQ2yTfcKkKccdBsIhcnVmF
	P9vyWZuwrn5j3+9RsTvxAI0mfZ2Nyxa82XlExpDRGFh1mD7B7J6maifzgP/cqB8G
X-Google-Smtp-Source: AGHT+IG6vD9GMzJFRgKV5tkVvAkzSXjZzf3sKuYbia/+L+uYcxerEW/IEbYH+D0NjcMpo2cEEaQ1ow==
X-Received: by 2002:a05:620a:1787:b0:7be:5bc1:9460 with SMTP id af79cd13be357-7c08aa9ab2dmr2845829285a.35.1739989765100;
        Wed, 19 Feb 2025 10:29:25 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0a609cb1bsm303023085a.111.2025.02.19.10.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 10:29:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tkop2-000000009V2-07PN;
	Wed, 19 Feb 2025 14:29:24 -0400
Date: Wed, 19 Feb 2025 14:29:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH 2/2] iommu: Get DT/ACPI parsing into the proper probe path
Message-ID: <20250219182924.GN3696814@ziepe.ca>
References: <cover.1739486121.git.robin.murphy@arm.com>
 <c2f0ae276fd5a18e1653bae8bb0c51670e35b283.1739486121.git.robin.murphy@arm.com>
 <20250214201435.GF3696814@ziepe.ca>
 <4a7823b2-2634-4148-8446-ad01a09b6880@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a7823b2-2634-4148-8446-ad01a09b6880@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_102933_893622_AA4035B1 
X-CRM114-Status: GOOD (  32.90  )
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

On Mon, Feb 17, 2025 at 03:00:46PM +0000, Robin Murphy wrote:
> On 14/02/2025 8:14 pm, Jason Gunthorpe wrote:
> > On Thu, Feb 13, 2025 at 11:49:00PM +0000, Robin Murphy wrote:
> > 
> > > much just calling the same path twice. At client driver probe time,
> > > dev->driver is obviously set; conversely at device_add(), or a
> > > subsequent bus_iommu_probe(), any device waiting for an IOMMU really
> > 
> > Could you put the dev->driver test into iommu_device_use_default_domain()?
> > 
> > It looks like many of the cases are just guarding that call.
> > 
> > > should *not* have a driver already, so we can use that as a condition to
> > > disambiguate the two cases, and avoid recursing back into the IOMMU core
> > > at the wrong times.
> > 
> > Which sounds like this:
> > 
> > > +		mutex_unlock(&iommu_probe_device_lock);
> > > +		dev->bus->dma_configure(dev);
> > > +		mutex_lock(&iommu_probe_device_lock);
> > > +	}
> > 
> > Shouldn't call iommu_device_use_default_domain() ?
> 
> Semantically it shouldn't really be called at this stage, but it won't be
> anyway since "to_<x>_driver(NULL)->driver_managed_dma" is not false -
> trouble is it's also not true ;)

That case in PCI I understood, but the other cases seemed like they
would be OK, especially if group is NULL

> > This is the test I mean, if iommu_group is set then
> > dev->iommu->iommu_dev->ops is supposed to be valid too. It seems like
> > it should be done earlier..
> 
> Yeah, looking at it now I'm really not sure why this ended up in this order
> - I guess I was effectively adding the dma_configure() call to the front of
> the existing iommu_fwspec_ops() check, and then I moved the lockdep_assert()
> up to make more sense. But then the ops check probably should have been
> after the group check to begin with, for much the same reasoning as above.
> I'll sort that out for v2.

I guess check it at the top and then check it again after re-locking.

> > > +	 * And if we do now see any replay calls, they would indicate someone
> > > +	 * misusing the dma_configure path outside bus code.
> > > +	 */
> > > +	if (dev_iommu_fwspec_get(dev) && dev->driver)
> > > +		dev_WARN(dev, "late IOMMU probe at driver bind, something fishy here!\n");
> > 
> > WARN_ON_ONCE or dump_stack() to get the stack trace out?
> 
> Indeed, hence dev_WARN() (!= dev_warn())

Oh, I've never seen that variation before!

Jason

