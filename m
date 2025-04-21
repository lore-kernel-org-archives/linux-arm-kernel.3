Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE70C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOxnJAhc6wvN/76rnzdND4XiH0RAh5L8BLwUG18oaZY=; b=NK8qummVxo3JnvOWlskL3pDh6Q
	aej7L3+EIVf/RJI6otXC/lNHaTKIiWNgXrMxIjt8mahttsiNQQFH9SlEnWDc4S/7Vuaaoo+LfkQR/
	QQIxs3q+zP6KXzrs9NplD1a5AXVXZLlSB5WUArCZ7bestMdN49M/qNddNE8HUMtEyAzKj/4Evt9DT
	OfH5IntHP4lNv3ilE5hAUlVhfBBSqvMqlCfss4w1u31fa/bTEOjiAEXruvbZ/h1QPAvF3d1a2R233
	064mV1fHNc6kfKBGvBSNvvaAGH5FRqEpbLtyNnioT7Gm8XkbkLNO3yvRMUJOd6siiWjUG9Q6kizuf
	pXRstDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ybo-00000005Ais-3khI;
	Mon, 21 Apr 2025 21:23:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yYI-00000005ANC-16Bk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:19:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-736aaeed234so3575850b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 14:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745270380; x=1745875180; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eOxnJAhc6wvN/76rnzdND4XiH0RAh5L8BLwUG18oaZY=;
        b=dVEfalDwZGu+8jtjrVy8YvbV8K086ZoDydOyG78wjldP2YJ65ABzHcrjpbiI3Qrkaa
         bgUlesMl2YyiPf0XoQUaIFeHnbmfO5D3cN+qvz+HnnBqmdPLdvUEItQKZgIa6dKMLDNP
         nU0niBYtAwTD2AlizLu7kG+v5/SMyH+C4ZOk4AtU7l0CH3Q1zeTWld01Ro4i/4j4Ij+1
         GDLyeShDr9PIMYfCrRfnsYFBzWbqeJxobYxixMqTU6lJXEmYvgXskW/BFqpptd13/0xe
         SuZmtT6pVCf+qGu2qzR096UkcPiG40av8jAfWzMqKT2424jqn3+NYLi3b64OwRJXRRTl
         ajFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745270380; x=1745875180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOxnJAhc6wvN/76rnzdND4XiH0RAh5L8BLwUG18oaZY=;
        b=KmDa6I4Z51WaGvK5cpC4tnbc5QJrcLXQkv5Tv1oGLvmMoBLWe/WRwI07uP/UdPWPtI
         O8br1A4o9zeB0y2vLjmySE/bnnfvDmxP2ahUsRh2kX/AFiAop3kH+XQdfjKHL0BLBtKF
         yd8ExYSETW+1sf63tQIpUODRqtYhSyPhkUYzcapjmB77GW7/6SquJAwfCF/uIk9HSZjI
         A87hFygaEtKESDS7Mxj367870n1LECoiYWy8Ipm9ygh3oi9XDavXEnrN47vdx0HmD+QC
         TrJnbIJkQYc5Wia2DN4OdEk7S6D/iOeKhN0w7jiaH0vIBbXI2uUlzubabGIetoa/IIhu
         Qugg==
X-Forwarded-Encrypted: i=1; AJvYcCWCyXHcoXfVImAwu0FhzCzl64Ul1Tgafcbxz0FTfDm1IROwrglYajMRrD2rGbzMY6fTjCXOB3JdbfPnPFZHiu5h@lists.infradead.org
X-Gm-Message-State: AOJu0YzLK7DE+20zLES8biMH3T30JkP+ccHsCA94tHBQqvH8X+ydLCdV
	7+sXwQzQiot4l0E3TJJNJXoCfD8k8kABe54lLjJG5NAY03QfKS44T9TKZCF6fw==
X-Gm-Gg: ASbGncv61IshLsKn4/QqhE2lgCJbA+PPzj10IBZ8u5mlgV1NztzUgEWwqShDQDmwshe
	frH+HAKJM1mTKEVJHgRNX7tFTcNXHeEa9Xp1O5j6wbOcL+oJuzRww2MFbMZTkv1grnVA4aNHIHl
	qMm/TG6/3frt5PLQgj/sxB9rdXwtsZbsYYU4GAdzOJbJJkpJl33Yh3YsD6wYjCmdNbaw64uH7oo
	PfbxCMpuQ0XgFhsJXEhXhVtJ2bMZOzdCSrG+phFTagmPLc0FhfzhUDeskLbHV2BVI8NpYB1wmMd
	vATKFX9HX2JbVvXpUBivIAc1wrsqA06x31Ug3rS7LBwk+uMCGclj/CccB1z09yvtP/IvISzwwXH
	+FPnqOQ==
X-Google-Smtp-Source: AGHT+IFQHuZZplaf8sY7Y2IO0G/qjhqIBZAX4ciEU72ZJiY0NIk0kGrIvFbpMAl14ucHM0THPLNUAw==
X-Received: by 2002:aa7:88d2:0:b0:736:339b:8296 with SMTP id d2e1a72fcca58-73dc1566852mr17070386b3a.18.1745270380314;
        Mon, 21 Apr 2025 14:19:40 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfacdb9bsm7051875b3a.155.2025.04.21.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 14:19:39 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:19:35 -0700
From: William McVicker <willmcvicker@google.com>
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
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <aAa2Zx86yUfayPSG@google.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_141942_301047_8152DCA9 
X-CRM114-Status: GOOD (  46.70  )
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

Hi Robin,

On 02/28/2025, Robin Murphy wrote:
> In hindsight, there were some crucial subtleties overlooked when moving
> {of,acpi}_dma_configure() to driver probe time to allow waiting for
> IOMMU drivers with -EPROBE_DEFER, and these have become an
> ever-increasing source of problems. The IOMMU API has some fundamental
> assumptions that iommu_probe_device() is called for every device added
> to the system, in the order in which they are added. Calling it in a
> random order or not at all dependent on driver binding leads to
> malformed groups, a potential lack of isolation for devices with no
> driver, and all manner of unexpected concurrency and race conditions.
> We've attempted to mitigate the latter with point-fix bodges like
> iommu_probe_device_lock, but it's a losing battle and the time has come
> to bite the bullet and address the true source of the problem instead.
> 
> The crux of the matter is that the firmware parsing actually serves two
> distinct purposes; one is identifying the IOMMU instance associated with
> a device so we can check its availability, the second is actually
> telling that instance about the relevant firmware-provided data for the
> device. However the latter also depends on the former, and at the time
> there was no good place to defer and retry that separately from the
> availability check we also wanted for client driver probe.
> 
> Nowadays, though, we have a proper notion of multiple IOMMU instances in
> the core API itself, and each one gets a chance to probe its own devices
> upon registration, so we can finally make that work as intended for
> DT/IORT/VIOT platforms too. All we need is for iommu_probe_device() to
> be able to run the iommu_fwspec machinery currently buried deep in the
> wrong end of {of,acpi}_dma_configure(). Luckily it turns out to be
> surprisingly straightforward to bootstrap this transformation by pretty
> much just calling the same path twice. At client driver probe time,
> dev->driver is obviously set; conversely at device_add(), or a
> subsequent bus_iommu_probe(), any device waiting for an IOMMU really
> should *not* have a driver already, so we can use that as a condition to
> disambiguate the two cases, and avoid recursing back into the IOMMU core
> at the wrong times.
> 
> Obviously this isn't the nicest thing, but for now it gives us a
> functional baseline to then unpick the layers in between without many
> more awkward cross-subsystem patches. There are some minor side-effects
> like dma_range_map potentially being created earlier, and some debug
> prints being repeated, but these aren't significantly detrimental. Let's
> make things work first, then deal with making them nice.
> 
> With the basic flow finally in the right order again, the next step is
> probably turning the bus->dma_configure paths inside-out, since all we
> really need from bus code is its notion of which device and input ID(s)
> to parse the common firmware properties with...
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> # pci-driver.c
> Acked-by: Rob Herring (Arm) <robh@kernel.org> # of/device.c
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2:
>  - Comment bus driver changes for clarity
>  - Use dev->iommu as the now-robust replay condition
>  - Drop the device_iommu_mapped() checks in the firmware paths as they
>    weren't doing much - we can't replace probe_device_lock just yet...
>  
>  drivers/acpi/arm64/dma.c        |  5 +++++
>  drivers/acpi/scan.c             |  7 -------
>  drivers/amba/bus.c              |  3 ++-
>  drivers/base/platform.c         |  3 ++-
>  drivers/bus/fsl-mc/fsl-mc-bus.c |  3 ++-
>  drivers/cdx/cdx.c               |  3 ++-
>  drivers/iommu/iommu.c           | 24 +++++++++++++++++++++---
>  drivers/iommu/of_iommu.c        |  7 ++++++-
>  drivers/of/device.c             |  7 ++++++-
>  drivers/pci/pci-driver.c        |  3 ++-
>  10 files changed, 48 insertions(+), 17 deletions(-)
> 

[...]

> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 6f2a33722c52..1813cfd0c4bd 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1451,7 +1451,8 @@ static int platform_dma_configure(struct device *dev)
>  		attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
>  		ret = acpi_dma_configure(dev, attr);
>  	}
> -	if (ret || drv->driver_managed_dma)
> +	/* @drv may not be valid when we're called from the IOMMU layer */
> +	if (ret || !dev->driver || drv->driver_managed_dma)
>  		return ret;
>  
>  	ret = iommu_device_use_default_domain(dev);

I wanted to report a regression here that was exposed by the new probing
behavior. On Pixel 6, we load our kernel modules in parallel which means
probing is done in parallel. This results in a race condition between the IOMMU
thread and the device probing thread. What I'm seeing is at the top of the
function `platform_dma_configure()` when we assign
`drv = to_platform_driver(dev->driver);`, `dev->driver` is NULL which results
in `drv = 0xf...ffd8`. In parallel, if the driver gets bound to the device
before we reach the above if-statement, then `dev->driver != NULL` and we will
de-reference `drv` --  resulting in a kernel panic.

To address this race condition and KP, we need to defer assigning `drv` until
after we check if the driver is bound. Here is what works for me:

----->8-----

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 1813cfd0c4bd..6d124447545c 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1440,8 +1440,8 @@ static void platform_shutdown(struct device *_dev)
 
 static int platform_dma_configure(struct device *dev)
 {
-       struct platform_driver *drv = to_platform_driver(dev->driver);
        struct fwnode_handle *fwnode = dev_fwnode(dev);
+       struct platform_driver *drv;
        enum dev_dma_attr attr;
        int ret = 0;
 
@@ -1451,8 +1451,12 @@ static int platform_dma_configure(struct device *dev)
                attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
                ret = acpi_dma_configure(dev, attr);
        }
-       /* @drv may not be valid when we're called from the IOMMU layer */
-       if (ret || !dev->driver || drv->driver_managed_dma)
+       /* @dev->driver may not be valid when we're called from the IOMMU layer */
+       if (ret || !dev->driver)
+               return ret;
+
+       drv = to_platform_driver(dev->driver);
+       if (drv->driver_managed_dma)
                return ret;
 
        ret = iommu_device_use_default_domain(dev);
--

Please let me know what you think.

Thanks,
Will

[...]

