Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64642CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 02:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfVLrp5MpeYOXpVpoxxNlTvQJ1uMnDQpTS8cxvxTiM8=; b=HLEjcKqkuOWRWWMrqWNNfUPv3M
	O8Lui4UKqA+ZbffsDLt4DgSmJsSykJLwjZni8Zl/0TEB5BpAGk8XIIUEe6Yo9z0UTuese+BzLD9ci
	pgv3xsJSjObyQI3zZDoHlH4yy9ed5uf3ldTb9p8NUTv7YlTAam8HxclIbFbIzKvtk/IEULvKU/jF5
	6tSt7Y5DEXa5AzozRVAGmyJ3EMvrXPZtGJTzuQ45MQTJ2JHVHLeYmyq6Gs4gs/xYnxFHjaRy5aVe5
	+4c9Niny9SRoOHhxBJuh8j8VLhHmEsjHUOnK+CNhWPXKwurfIxa5h1DMH9FT9cazYpQuBI6IOdcDM
	Y2K5W23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkJQ-00000001Bih-3Jxr;
	Fri, 15 Aug 2025 02:37:00 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkFB-00000001AkJ-10DU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 02:32:38 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 440FB2015E67; Thu, 14 Aug 2025 19:32:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 440FB2015E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1755225156;
	bh=SfVLrp5MpeYOXpVpoxxNlTvQJ1uMnDQpTS8cxvxTiM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOcqGEZcYK/2LHjZDb7xkXurRNzYTfC7qbXD1W0BEtudQ+SR358Agacb9YpCR7Pii
	 5dOU+pKT38r+DtzAhG0k5ZVAQ6Ky89TFgGDHKZxvbiFNW8N6BJOuEehjvAg/BA8JFH
	 q9OoHT6v9cg0jfey0UKbmRyGV6j3tz2MujrkMF6c=
Date: Thu, 14 Aug 2025 19:32:36 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, robh@kernel.org,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250815023236.GA30997@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
 <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250815003958.GE599331@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815003958.GE599331@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_193237_305568_D8710649 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, Aug 14, 2025 at 09:39:58PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 14, 2025 at 04:30:18PM -0700, Shyam Saini wrote:
> > or were you referring to [2]?
> > 
> > In that case, the PCI child node data needs to be parsed, which is
> > currently handled individually by each host controller driver.
> 
> Yes, this looks like it may be what I was thinking of, the pci@1,0
> specifes the BDF effectively
> 

In that case, we'll need to parse the child DTS nodes properly
within of_iommu_get_resv_regions(). I'll include this in v4.

> > This might not be a strong argument, but since firmware updates tend
> > to happen less frequently than OS updates, any addition or modification
> > to the FDT would require a firmware update. Wouldn't it be more
> > maintainable to keep this logic in Linux, which is easier to update
> > and typically updated more often?
> 
> The DT is supposed to describe the HW, if the PCI device has an issue
> with its dma ranges then it seems reasonable to me the FW will use the
> existing standards based way to describe that issue?

If that's the preferred approach, I'll revise the next version accordingly

> Presumably this is a fixed issue of the platform. You never did
> explain how your system has such werdio behavior, or how something
> like iommu=pt can function on it...
Yes, this issue is platform-specific. On this platform, the default MSI IOVA
range overlaps with an address region that is reserved for another purpose,
Other than that we haven't observed any obvious issues for DMA operations

Thanks,
Shyam

