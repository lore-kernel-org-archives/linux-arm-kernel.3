Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 21:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6asYMkdcVOCJg0CB/GTsjjXoi08Jnm+cXJbFRuu7HS8=; b=SMW0unWrb7upUFWAtGcaMdvxnY
	A5Qh7f9kVSmEcGDfRJq9Id9z4yvtd2qotb28GEFBam24JB7X1dKQiM0INLun4eOoT23SzyU3Afzye
	swxk5+GNGIjla0cLfI5UJb7zaXwzyfv4x4HlbwNLQ8csmzVrIf87bnv2ywgVeMrThsw3aiqVT8fnm
	Ibt3uCHm4JNg4TERPZr4UcPSo6c1QsW11UaxS+MxKLlYVTeJDZ4hwtCTZ0l7tF4nfUDHFmgMrlrfk
	KIGv46Wa/MsP1un1wel855KPQ/Wz9o77YiKxs+uYB1XUP0EYu61nAWnEsk7S0+Y0YgDf5gg/7eM1L
	N5A9FtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LcS-00000008eba-1khZ;
	Tue, 22 Apr 2025 21:57:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LaZ-00000008eNR-11eu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 21:55:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2279915e06eso59897005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745358934; x=1745963734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6asYMkdcVOCJg0CB/GTsjjXoi08Jnm+cXJbFRuu7HS8=;
        b=fUDHNNKS0zPF3YNuTbVuOiLI28n1xb3fWIMo3uH6LVS6KQgZnV8bsdaemBxWj/975e
         AblroQ7rQgU1k5e+8sUl3/hYiFqEQL4n6VWuuYqUyHsue14tslWfJu0oqLRAdilsh1QV
         NuHJKmF05cbY2VB2N3O4z9n1cWs72LhWbm1ZDQrOuWbiDmC2JGL/I86/3pnjShNAxXWy
         7ECFUqOEwLQGhlKi2N4bVMb2J62ZlKJ/Rk0ciVuIdbt6P/01WNhtJQX+6w+aLmkrO7LC
         SsWm0NI4sSMpuef9gGZbebJEkB489Xcs/54fHMibZrMI47Lvz5HcYgU1Fy6CGZKu7fRh
         Qa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745358934; x=1745963734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6asYMkdcVOCJg0CB/GTsjjXoi08Jnm+cXJbFRuu7HS8=;
        b=vt9UJv8Dp7XsB0g8EdPXHlrkfe/3LpmsHidPbTo8C0qyqF6jU9bHjcjOmy4oa/1hMb
         bT0WHEw19xeXD3LAquUTa+/DrmARJni5TvuMaGk3UA6PxWqA9pFHLjFBaMOlyVYtpC2l
         KqQyDqmGPP9jhL1VpcnyMz0eXDgXI9Raxmi90jCzAg8dz/weXjV4Ea96ZCtGZ443opMC
         h5JUOsqs+qUx/QXckLSFm152FUdQmoAv7fJS4e7YnXNB9DCSm0LEq33C+DHGXPYdACyN
         pRG03LtnyCqnjeXKqSH3mIkpxrucWLgPzUe93LC0dRxVt4gleL1vgeC/2p0dL8vAZrl5
         ncRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrREdn2tdr271IG1B30oFNHOpt6bkZunoroAeMO9c0Lg1HnwMVuMzGmgsM9jmgixq99jrgRqzmO2Y1h0UvmQ8l@lists.infradead.org
X-Gm-Message-State: AOJu0YxirGV8UQb7QzgFLyfu5WTWsnt3nfxJfA3zk+HAQqg2DxwwY0u0
	5tldEZVwt7bMWn4+evPBwzS2/CypTBu7xAJ6ztElzGJajlHpy8p7o9eLFQulNg==
X-Gm-Gg: ASbGncuZahd6T3YUK/YTI65o3RdW+j5s9osH9DlRoo4/AUCgk4GtoOi/08I+u8DCBmH
	eujgp0CJcfYfm/VQAO+pbMbDTmXCHCORtdEhLb2WCbSLDkcy4+/LAuazsNFwK1h0U2We7RQ03CJ
	t0wrx37UO+IwqWUTrkghHUEFFv6TMCGekv7QuNrNs7xxYCulcH5Z0ez1BMSzocML6Lf3Bl2Dygs
	5E+0gCMLchi9FfZjcxEGMjXAT6dEaxYdTwPMGgEoS6FuDLN4+5vlV6Z1eMxRGOQNYmp9tNwExft
	dMw/mPBsxKWg9vh8lc7rag4JBSiTQlAj7fkuO54czY3X/1p1tWdn/CPB++jil2CvNZSsVD0ge3G
	rmXBWsg==
X-Google-Smtp-Source: AGHT+IGj1WS3gCYuWNM31cHMqZpSCdXyw2eIzHGcK/aumOJ6NuA9dKBVMTjVtVR1uQU6qgyTGOQ+uQ==
X-Received: by 2002:a17:902:ce82:b0:216:53fa:634f with SMTP id d9443c01a7336-22c536303e4mr222403105ad.48.1745358933312;
        Tue, 22 Apr 2025 14:55:33 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf3eb1sm90943865ad.82.2025.04.22.14.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:55:32 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:55:28 -0700
From: William McVicker <willmcvicker@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <aAgQUMbsf0ADRRNc@google.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
 <20250422190036.GA1213339@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422190036.GA1213339@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_145535_300435_677792B5 
X-CRM114-Status: GOOD (  24.75  )
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

Hi Jason,

On 04/22/2025, Jason Gunthorpe wrote:
> On Mon, Apr 21, 2025 at 02:19:35PM -0700, William McVicker wrote:
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 1813cfd0c4bd..6d124447545c 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -1440,8 +1440,8 @@ static void platform_shutdown(struct device *_dev)
> >  
> >  static int platform_dma_configure(struct device *dev)
> >  {
> > -       struct platform_driver *drv = to_platform_driver(dev->driver);
> >         struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +       struct platform_driver *drv;
> >         enum dev_dma_attr attr;
> >         int ret = 0;
> >  
> > @@ -1451,8 +1451,12 @@ static int platform_dma_configure(struct device *dev)
> >                 attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
> >                 ret = acpi_dma_configure(dev, attr);
> >         }
> > -       /* @drv may not be valid when we're called from the IOMMU layer */
> > -       if (ret || !dev->driver || drv->driver_managed_dma)
> > +       /* @dev->driver may not be valid when we're called from the IOMMU layer */
> > +       if (ret || !dev->driver)
> > +               return ret;
> > +
> > +       drv = to_platform_driver(dev->driver);
> > +       if (drv->driver_managed_dma)
> >                 return ret;
> >  
> >         ret = iommu_device_use_default_domain(dev);
> 
> The diagnosis looks right to me, but pedantically I think it should
> have a READ_ONCE():
> 
> struct driver *drv = READ_ONCE(dev->driver);
> 
> And then never touch dev->driver again in the function.
> 
> Send a proper patch?
> 
> Jason

Thanks for the response! Yes, that would work as well. I'll send a v2 revision
once I get it tested.

On this note, I was looking through `of_dma_configure_id()` and am also
wondering if we may hit other race conditions if the device is still being
probed and the dma properties (like the coherent dma mask) haven't been fully
populated? Just checking if the driver is bound, doesn't seem like enough to
start configuring the DMA when async probing can happen.

Thanks,
Will

