Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA07FD59D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoTM5VqqBSE/slfl8I1wW/rbVxxaz8QvUYFV+G2U2Oc=; b=nyJ2TkMNY8hpWL/YQwqm6f97YQ
	7ymZq7QNkUmY5VQzwtJDY6W0WxlQ//j2bqwv2gFLtHqyTTUXns+n2Dmq7bdXcMwWjgNFlQBp0cdw2
	qYcfweM/6Nx8qstOOEdOpzaI349A7ZOhknckBBCUFPKn54HJmUX6DUuSW33v3VShBK+rviLsBaBEv
	HDk5auAWhHNtxA2ykSsnFMP+P0vEgNDjcMPOvdBbpTGdBGZkmCR9DqeMtnqMFPBKHdwVKP8MeX72I
	ypuT6jAqHZ2Pq5rVPsH1K0RVKPEswukqm3ODXiJlp4Yh8UWyfbWhJnNJPyseb6KmMmOlAsE/iiNWR
	mYrWiTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5SN-00000000mBF-0fOA;
	Fri, 12 Dec 2025 15:53:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5SI-00000000mAf-45lu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:53:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so167035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765554797; x=1766159597; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AoTM5VqqBSE/slfl8I1wW/rbVxxaz8QvUYFV+G2U2Oc=;
        b=qiLFTtPdnaf8MriWRqXQ+O9Mv6cKZzzY3RrCRC6nuTrmMtR1gw+/Kgv+hpB6eyEwMQ
         TaVh+BJl9YkNZoVZw+imrjSw4JS/KFzGe9BsrtWt5AllOERnGANnIKBP12f8S5I0gi7V
         dA7pNtYynWd0Zgvr2FAr9OuZbRG3I0gXgC5Vnk9LAm4XTmSa2nD8h40VEGb3WApSStQL
         g+5xyqS5kkpTLO6VpG4sYKxUtPmIwhGJqRDyBjY9KcwuumrmZf/TPXqsZXDUkJ81IANm
         NJlXSFQ4nGbsXi05nVtI2tkgICRcA3iOI5WWy8sZEDsCO5Bw+AqPibUXK9A72fEgOM1M
         h0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554797; x=1766159597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoTM5VqqBSE/slfl8I1wW/rbVxxaz8QvUYFV+G2U2Oc=;
        b=gFhy+bpRvt71YwlaDlSOzimM+MtAaAq8hBl+sfrCf1dJXGeuwlyayN8/tYijxsC8DB
         fmC6AY7JPJeVnk62lPPTBhph5u+s/Y68VDukY4hXGTbnYW5UNPklNgiiuL3SNdD2I7xW
         2xYcyYrYYMNnLYftQZVC3RBzr8QIp6tgkL3xOt5Poily1zICPSx+J43yoWRie6TZr9Tl
         lo/zcVnxTjoddOT3HLnIceOwJHGZE9tttKsCwcqeoyFbe2xlaqxNFtBupDaUf67Pc62B
         cUmk3nPQpbjJs8+LC03MqUzK6dU/NNZoLlfO+8o187csmGgeRXO3uboTqa35UruiDr6D
         vp5A==
X-Gm-Message-State: AOJu0Yw2UllI6pUC04GcXgpc1bsyfq+WCuV/Z/U8svd2QjO2WO/o8s9y
	CHakselLWjMIEGfsRJvNHO6uYmjKuO257elkg9TTdq8u/Xc1G4NqkStIZmzXw9CkoA==
X-Gm-Gg: AY/fxX4MZhnQCMp1qQ4gSrzV03gDCOQ/MLlOG+ZIGIzZEpJIObx4YqBrhiiNAH65VP5
	jRwxx3gyLyE54T/xixF/a9uF7WdoJRF19MgQNtybwcN5lXIEPhLjmnWZdqLds+XMHE8Awzyai5/
	rs4i/DA+lXBh2kvosUlJSavVw7nLklXnL+Xgk/CGu4Gu1gGBNlU5YgxPmPPelBDe4Z0Q0/LR6gs
	ev6dQ9PUJyn5Oh1+iPW7eDtGn8lWOfNjbrRNbVIsAQMQAquq8rLe6yQJsbBnPNW+JV/XiWcPHdo
	CkIC+XklMW0s0DJlhXDHIAPWTTa900U6zZISGOgsv1R3Txs5WASQcpiad0aLmFjDR5H+CM10ma+
	I9K6gRcNce16UDkSzyrQZHGubuzz7+7Zuc2WLNyqfNl6Pgl3JxnvA8RW2UH4xgB8b7NPweCrOoW
	lVfteB01FUNVa8BqzhArRdPGB9GHaJUSe9fTr80vsaJS3S0ZXqsahFDqi9gnWI
X-Google-Smtp-Source: AGHT+IHmfLLjUS7AcR5ly1Ud2Cl5iPQrQoNP3+3/YuFuH/EESCUT2zan2BZpMVjz/bWfM1lUWrZeUg==
X-Received: by 2002:a05:600c:8885:b0:477:2f6f:44db with SMTP id 5b1f17b1804b1-47a8980f38emr1019575e9.5.1765554797030;
        Fri, 12 Dec 2025 07:53:17 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b516bsm15647455e9.2.2025.12.12.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:53:16 -0800 (PST)
Date: Fri, 12 Dec 2025 15:53:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 14/27] iommu/arm-smmu-v3: Support probing KVM emulated
 devices
Message-ID: <aTw6afum4eqr5_e7@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-15-smostafa@google.com>
 <20251128165616.GD812105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128165616.GD812105@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_075320_225337_09F2FCAE 
X-CRM114-Status: GOOD (  44.61  )
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

On Fri, Nov 28, 2025 at 12:56:16PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 06:48:01PM +0000, Mostafa Saleh wrote:
> > When KVM runs in protected mode, and CONFIG_ARM_SMMU_V3_PKVM
> > is enabled, it will manage the SMMUv3 HW using trap and emulate
> > and present emulated SMMUs to the host kernel.
> > 
> > In that case, those SMMUs will be on the aux bus, so make it
> > possibly to the driver to probe those devices.
> > Otherwise, everything else is the same as the KVM emulation
> > complies with the architecutre, so the driver doesn't need
> > to be modified.
> > 
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 58 +++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 7b1bd0658910..851d47bedae6 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -11,6 +11,7 @@
> >  
> >  #include <linux/acpi.h>
> >  #include <linux/acpi_iort.h>
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/bitops.h>
> >  #include <linux/crash_dump.h>
> >  #include <linux/delay.h>
> > @@ -4604,6 +4605,63 @@ static struct platform_driver arm_smmu_driver = {
> >  module_driver(arm_smmu_driver, platform_driver_register,
> >  	      arm_smmu_driver_unregister);
> >  
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +/*
> > + * Now we have 2 devices, the aux device bound to this driver, and pdev
> > + * which is the physical platform device.
> > + * This part is a bit hairy but it works due to the fact that
> > + * CONFIG_ARM_SMMU_V3_PKVM forces both drivers to be built in.
> > + * The struct device for the SMMU is used in the following cases:
> > + * 1) Printing using dev_*()
> > + * 2) DMA memory alloc (dmam_alloc_coherent, devm_*)
> > + * 3) Requesting resources (iomem, sysfs)
> > + * 4) Probing firmware info (of_node, fwnode...)
> > + * 5) Dealing with abstracted HW resources (irqs, MSIs, RPM)
> > + * 6) Saving/reading driver data
> > + * For point 4) and 5) we must use the platform device.
> > + * For, 1) pdev is better for debuggability.
> > + * For 2), 3), 6) it's better to use the bound device.
> > + * However that doesn't really work:
> > + * For 2) The DMA allocation using the aux device will fail, as
> > + * we need to setup some device DMA attrs (mask), to match the
> > + * platform.
> > + * For 6) Some contexts from the pdev as MSI, it needs to use the
> > + * drvdata.
> > + * Based on the following:
> > + * 1- Both drivers must be built-in to enable this (enforced by Kconfig),
> > + *    which means that none of them can be removed.
> > + * 2- The KVM driver doesn't do anythng at runtime and doesn't use drvdata.
> > + * We can keep the driver simple and to claim the platform device in all cases.
> > + */
> 
> It is OK I guess, I wouldn't insist you change it, but I think it is
> kind of gross. Registering the iommu driver against the platform
> device instead of the aux is pretty ugly and denies userspace the
> ability to see that the hypervisor is sitting in there through the
> sysfs topology.

Yes, that’s why I was wondering if it’s better to keep this as a platform
driver and create the aux devices for the parent(KVM) but that was really
complicated to handle the probe ordering.

I will give this another though before v6.

> 
> Not sure why the commentary about built-in though, what does that have
> to do with anything? If the aux driver is not built in then it will
> just module load later and everything should be fine?

As at the moment the KVM driver doesn’t use drvdata(nor any device
resources) and the main driver(aux) does, but if that was a module, we
can’t know which version does what (if that changes in the future,
although unlikely).

Thanks,
Mostafa

> 
> Jason

