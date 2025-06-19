Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A135C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU789LESDPx6spX9Gu45wOPXnZU17iFeIzBAgdevUwE=; b=JwGv8B4gOcOUoSjB3eRCOGAK0d
	bLTpAKHPeOFq9tvgzKV9bpkMWYgrjMq9Yvjhe9NisjmiJaXCWEjSWZgCvpRUopnGlTPb+3L0fjPm0
	tCRyB2eU1XowIh9k2h4wLhVMHc9/0L/MlpQEAVjOT6Jb0m6TNzJ/jTlTMpe/ZjUM1PnVeHFf5fnn/
	9Ybxcg/8tpEboKJ4J0fRz/NtvQ9TfXSi/1HV7P+C4fBGXhxuNXrL/Ou4ovJ1tfpmjJnNTM/NR/goq
	LryboDmmfBPOPsa3hgMjltLBB+1hcdauZt72UCd2x/AUWd5pBUmDWBlOISpokXYl3WD6O26SW1Cmf
	NsL/e9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMSW-0000000EGfv-11OU;
	Thu, 19 Jun 2025 21:06:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIbr-0000000DeMH-2yaF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:59:33 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-73a64e126d9so943078a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750352371; x=1750957171; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WU789LESDPx6spX9Gu45wOPXnZU17iFeIzBAgdevUwE=;
        b=LQXGmBwKHv2xUU0S21y5IZLO+oWLA52Y0Y5UgrbZev9h9oZl4+5Bo0qUh38Ymfh1mP
         R/TYUgunGzkDxTKL0//pncWW3OhV5AT+37gw5y5rUC3VJ+aHYcCSwa4E1KSpffTgZ49W
         3QAjY3CSC8BYue3OrN+7l4PMDXy/leIEoAyJ3WXKyjLS7cSgPMo8dhKgGWGuS2nuCHW2
         zu81Js73/kKNopn1XcQtICU8288HLEcQLQgtT3hefgTpP5Fp9dhVorOOvUb73w2FvoOj
         +wfi5dH6x266HZOCvRPLZGrMIlGaXoyGw/t17DX7SDex1/CDskv635+UeGpseHSVGpja
         PlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352371; x=1750957171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU789LESDPx6spX9Gu45wOPXnZU17iFeIzBAgdevUwE=;
        b=vwDe6Gz5apAPMtWz1vGd4X/JluSnD+CjKh7vPjUiaDK4EuCfdRylCHhWAsZ6CEvqNt
         lgbM+JhEUSuyhEERjTflf6A8+L9NmaaiFUyuQgD9CVZZdUdovI/TPd2T/kCfSHcfWW6z
         2JrP7qrOxfyca/Yxa81R+VN372Fl6gmVlzQxqwWDq4JyL19qvNRoRxLDe45xfTBdlMgM
         BU47xcq6/m8gILh1EUiqaurvIMLxe15dlvjVXfwkNl3tCA7/ABk258cOWONJfKD0+BjV
         uwJaXtJsyFOArQS3G5A9FBEKXuLXL6hos55uUedWkUHd/7dVYaW7U7RmnM3upaclzh4Q
         qtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2hL/wVykp5m031WTWtcn4gGICxEIXkCJTsyoQXy2K1bbexm7G0Tf9AtSx8W8kGzjQ4wOum1nfxwEvdNDSRwq@lists.infradead.org
X-Gm-Message-State: AOJu0YyqQ7/eYDjf2cRnHMXiSQGKCM8N1CCN1fcZ9rVQsRO3YI5rTPqL
	jUcb/Jmx2JKZC0PFFHcDS6R/C2TpIa90PXzMNDo+jChrL2OfIJtMOOrqysPEQLnqWvY=
X-Gm-Gg: ASbGncth0nQrgjbjhgkEkjMBfZ5ef9RGguZ27vMIHUVy7HqFmPO1K+HPcs3Rym8OtQH
	jGQnRjI9CX2l3maWocWcoFZiNaOxqSBbDJuDvYj7bE8O1kcDnmz1bqA9EQRhtIgccI2f5HXbu+I
	6nZ/7nCq5i/hCtZgZR/uUkzUcCDxb8XKwXN7ZGJi/1wzXTDOAfVfOi4qMS+NgsyIRLmAajeE/E6
	jAfJ53GxNMqjCIyt/hkBvGWtfjAMd3ntiDIrvP10WklB91OTE6qIskrj/p2GZDgPAT8SKZDVdq3
	Wm5ZuefneQFDPsGpArmwWcqA9fnt4DxRKO3O
X-Google-Smtp-Source: AGHT+IFIVSAeEPqWaR7ouc36Dp5BIP5quliMTNtM08oDDkQu9GEu/sRTek8upP25DBEtFCz1lvvpVw==
X-Received: by 2002:a05:6830:6c8a:b0:73a:8a8a:5151 with SMTP id 46e09a7af769-73a8a8a5334mr1331051a34.17.1750352370711;
        Thu, 19 Jun 2025 09:59:30 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284ff5f4sm2339324a34.43.2025.06.19.09.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 09:59:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSIbo-000000003GJ-3nRB;
	Thu, 19 Jun 2025 13:59:28 -0300
Date: Thu, 19 Jun 2025 13:59:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250619165928.GA10257@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_095931_860620_A3AB40F1 
X-CRM114-Status: GOOD (  37.82  )
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

On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
> 
> Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :

> > Ugh. This ignores the gfp flags that are passed into map because you
> > have to force atomic due to the spinlock that shouldn't be there :(
> > This means it does not set GFP_KERNEL_ACCOUNT when required. It would
> > be better to continue to use the passed in GFP flags but override them
> > to atomic mode.
> 
> I will add a gfp_t parameter and use it like that:
> page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);

This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
works..

> > > +static int vsi_iommu_attach_device(struct iommu_domain *domain,
> > > +				   struct device *dev)
> > > +{
> > > +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> > > +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> > > +	unsigned long flags;
> > > +	int ret;
> > > +
> > > +	if (WARN_ON(!iommu))
> > > +		return -ENODEV;
> > > +
> > > +	/* iommu already attached */
> > > +	if (iommu->domain == domain)
> > > +		return 0;
> > > +
> > > +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
> > > +	if (ret)
> > > +		return ret;
> > Hurm, this is actually quite bad, now that it is clear the HW is in an
> > identity mode it is actually a security problem for VFIO to switch the
> > translation to identity during attach_device. I'd really prefer new
> > drivers don't make this mistake.
> > 
> > It seems the main thing motivating this is the fact a linked list has
> > only a single iommu->node so you can't attach the iommu to both the
> > new/old domain and atomically update the page table base.
> > 
> > Is it possible for the HW to do a blocking behavior? That would be an
> > easy fix.. You should always be able to force this by allocating a
> > shared top page table level during probe time and making it entirely
> > empty while staying always in the paging mode. Maybe there is a less
> > expensive way.
> > 
> > Otherwise you probably have work more like the other drivers and
> > allocate a struct for each attachment so you can have the iommu
> > attached two domains during the switch over and never drop to an
> > identity mode.
> 
> I will remove the switch to identity domain and it will works fine.

You'll loose invalidations..

Maybe the easiest thing is to squish vsi_iommu_enable() and reorganize
it so that the spinlock is held across the register programming and
then you can atomically under the lock change the registers and change
the linked list. The register write cannot fail so this is fine.

This should probably also flush the iotlb inside the lock.

> > Which will cause the core code to automatically run through to
> > vsi_iommu_disable() prior to calling vsi_iommu_release_device(), which
> > will avoid UAF problems.
> > 
> > Also, should the probe functions be doing some kind of validation that
> > there is only one struct device attached?
> 
> which kind of validation ?

That only one device probed to the iommu?

Jason

