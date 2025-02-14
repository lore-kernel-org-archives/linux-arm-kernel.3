Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aitcMe7WROI3inmWPb5j5yTibRGZT3eFja/8dsNPCSo=; b=zVJSjmcu1DfHN4pVitM2j4LkJ4
	7ZrmpoMJIxJUw63ImHYYfQm7Qil9VAc5abTbU2SutDOKcneDBjai89zxmb6M0s6n4i2c64jIDBgA0
	HvF4VJOs6x1ni5kEWPZ5zGDndloduICcFYMe+VePPyn4sLd/wVodVvpyUeJ8bK+nweIpkBtLAe0c9
	zmHjhRWrjEQGkwbbmri1n+0C0lUDLEpTkgDg3ZaBU4PCeTD10ROKkwyFvIwY0g82uLcZI82XWq0jc
	nJZMeYenLP9ArGsZZRmdbI0HYEjYCC9IjyNI/gNR8IcJZhxi9p3U//L0xgVsSvEohQmh6ojG5z5od
	MY7WNUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj26a-0000000G94b-3kQj;
	Fri, 14 Feb 2025 20:16:08 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj258-0000000G8lu-1KeN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 20:14:39 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e65d6e1f12so28599436d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 12:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1739564077; x=1740168877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aitcMe7WROI3inmWPb5j5yTibRGZT3eFja/8dsNPCSo=;
        b=dk3aCCaI6fDwYx28DaOM0Gzzll1YySX+o0uH03cz1idEJ+rm2YHb64XOeHBbZrYmbh
         wpf5Me1tOioUX3Q9ZICl/stymNl9VE+Oo2rRuC05mxnJ233u3gzwlDv+3tsI9YJaaqrC
         bV9/tnNS+o4e8GKXF1IeLjpgVA6ShIwJUPQzeto6MNhuib33+EmtB3FEZ5W9p/CLvMhp
         s/1EbcIcLeUlgtK3YMjilJBBV57EExdI4Yr+N28SX6fa5khWZCicAGlq9h1D4A5v9t9F
         5jhpFHyH0NaTH4rGljLaRbYCBRJ7Klr9L0675CNofwhiBSdKIug/+2NegsiZyr10yhyP
         Z2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739564077; x=1740168877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aitcMe7WROI3inmWPb5j5yTibRGZT3eFja/8dsNPCSo=;
        b=TiAXM+/tSilrM05tL8KuAfwcjWi7EEDKsjSAcL2t6g6Mg/bDVRzVFGgsXiZJYinNjA
         5Cmpr3zhtftnrDk1RMecn38sh9Pi1G48nv3OiUZj2Q5zux13fjDtCFQHPwv/60u9HSxi
         pJxTJwnP/FuiF1nQuFxravNY3WyYw7kwEBIxQWi7Cd/dfpVMExIaS2In7zxmqmzY118U
         GLNQCBOWHVmau/O+KW6j/0uRJGVlqJUOk26KaSf8sdwdKI0AykIlU1jgFcHT1ULupnv/
         dYGt12BbsIjH+KJ38cmnkk5TlD6+ttO22+SzVpiXEL+UOMMwqTmEzfmf2yKiHBV8vL0T
         Untg==
X-Forwarded-Encrypted: i=1; AJvYcCXNbipo8PHYU98sd0VUjZWSC3H33ifw7umLH1d8sJWtqoaKaoKx61ZlmGBt7BIlZXtBJzPB+A3s+IJHrnnUlL5c@lists.infradead.org
X-Gm-Message-State: AOJu0YwYkYFofSs33h3kXFyvU94x+e4DOyIhi4yhj8XnIqNcj8Gao3Ra
	wbPTvyfxMW3wy3yfAZRrgaIFbR2mYb5/9uiJbV3zEufRvIE77N85OvN7rW6GQzE=
X-Gm-Gg: ASbGncvGFHehk9wObHvWAmvkqPLaO5YllDpsq+EijFZMqSs5O05pRJjUoB0OmfAAvIi
	h5RpFEnKoOLlvtAmwfJw+VUPKeqB1MKfsoChphGWDDICYHDA+zsHhrdC9mG+iIGNA8qCCb6LC8A
	MeHgqNfQVntHZpFpHJETtPfObO7NILG3KWp2R+Rf1kLhrcuU9Q0nLTeIwlrf+m6DdgGyWfJ3Iiv
	TplysQFtT4vhd7Rs9QcQacsA2ISYxynvyqGOo+Vg8kYlm8qKt7KHqDW5lKEz2kUpuj+EOv5JYYJ
	41KLKJ34MwbchgSWyIiGQHjAo3vmMZSlSgBTONX69KCc9qHOgjlk9QZ/QELfSOkL
X-Google-Smtp-Source: AGHT+IGnMpUVAQSaoCinCLx2FBIU+4N7ViIjMJqQfxMTZ4fEWvtSzvHCiXUgAsqSsNDrtdOvrjsIMg==
X-Received: by 2002:ad4:4eed:0:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6e66ccc114cmr11243186d6.16.1739564077030;
        Fri, 14 Feb 2025 12:14:37 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65daffdbbsm24455776d6.99.2025.02.14.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 12:14:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tj255-0000000GmgQ-3jtW;
	Fri, 14 Feb 2025 16:14:35 -0400
Date: Fri, 14 Feb 2025 16:14:35 -0400
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
Message-ID: <20250214201435.GF3696814@ziepe.ca>
References: <cover.1739486121.git.robin.murphy@arm.com>
 <c2f0ae276fd5a18e1653bae8bb0c51670e35b283.1739486121.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2f0ae276fd5a18e1653bae8bb0c51670e35b283.1739486121.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_121438_356325_FD7AA498 
X-CRM114-Status: GOOD (  32.19  )
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

On Thu, Feb 13, 2025 at 11:49:00PM +0000, Robin Murphy wrote:

> much just calling the same path twice. At client driver probe time,
> dev->driver is obviously set; conversely at device_add(), or a
> subsequent bus_iommu_probe(), any device waiting for an IOMMU really

Could you put the dev->driver test into iommu_device_use_default_domain()?

It looks like many of the cases are just guarding that call.

> should *not* have a driver already, so we can use that as a condition to
> disambiguate the two cases, and avoid recursing back into the IOMMU core
> at the wrong times.

Which sounds like this:

> +		mutex_unlock(&iommu_probe_device_lock);
> +		dev->bus->dma_configure(dev);
> +		mutex_lock(&iommu_probe_device_lock);
> +	}

Shouldn't call iommu_device_use_default_domain() ?

But... I couldn't guess what the problem with calling it is?

In the not-probed case it will see dev->iommu_group is NULL and succeed.

The probed case could be prevented by checking dev->iommu_group sooner
in __iommu_probe_device()?

Anyhow, the approach seems OK

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 9f4efa8f75a6..42b8f1833c3c 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1619,6 +1619,9 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>  {
>  	int err;
>  
> +	if (device_iommu_mapped(dev))
> +		return 0;

This is unlocked and outside a driver context, it should have a
comment explaining why races with probe can't happen?

> +	/*
> +	 * For FDT-based systems and ACPI IORT/VIOT, the common firmware parsing
> +	 * is buried in the bus dma_configure path. Properly unpicking that is
> +	 * still a fairly big job, so for now just invoke the whole thing. Our
> +	 * bus_iommu_probe() walk may see devices with drivers already bound,
> +	 * but that must mean they're already configured - either probed by
> +	 * another IOMMU, or there was no IOMMU for iommu_fwspec_init() to wait
> +	 * for - so either way we can safely skip this and avoid worrying about
> +	 * those recursing back here thinking they need a replay call.
> +	 */
> +	if (!dev->driver && dev->bus->dma_configure) {
> +		mutex_unlock(&iommu_probe_device_lock);
> +		dev->bus->dma_configure(dev);
> +		mutex_lock(&iommu_probe_device_lock);
> +	}
> +
> +	/*
> +	 * At this point, either valid devices now have a fwspec, or we can
> +	 * assume that only one of Intel, AMD, s390, PAMU or legacy SMMUv2 can
> +	 * be present, and that any of their registered instances has suitable
> +	 * ops for probing, and thus cheekily co-opt the same mechanism.
> +	 */
> +	ops = iommu_fwspec_ops(dev_iommu_fwspec_get(dev));
> +	if (!ops)
> +		return -ENODEV;
> +
>  	/* Device is probed already if in a group */
>  	if (dev->iommu_group)
>  		return 0;

This is the test I mean, if iommu_group is set then
dev->iommu->iommu_dev->ops is supposed to be valid too. It seems like
it should be done earlier..

> +	/*
> +	 * And if we do now see any replay calls, they would indicate someone
> +	 * misusing the dma_configure path outside bus code.
> +	 */
> +	if (dev_iommu_fwspec_get(dev) && dev->driver)
> +		dev_WARN(dev, "late IOMMU probe at driver bind, something fishy here!\n");

WARN_ON_ONCE or dump_stack() to get the stack trace out?

> @@ -121,6 +121,9 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
>  	if (!master_np)
>  		return -ENODEV;
>  
> +	if (device_iommu_mapped(dev))
> +		return 0;

Same note

> @@ -151,7 +154,12 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
>  		iommu_fwspec_free(dev);
>  	mutex_unlock(&iommu_probe_device_lock);
>  
> -	if (!err && dev->bus)
> +	/*
> +	 * If we have reason to believe the IOMMU driver missed the initial
> +	 * iommu_probe_device() call for dev, try to fix it up. This should
> +	 * no longer happen unless of_dma_configure() is being misused.
> +	 */
> +	if (!err && dev->driver)
>  		err = iommu_probe_device(dev);

This is being conservative? After some time of nobody complaining
it can be removed?

Jason

