Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF690CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJpg2pS7/i5/eJlR85F2V9d17QqSosoQgMmN8Oxuetc=; b=WTbq1z8TfjDxyL+zu/YJhe0eKL
	oi5KfrHE+W0aElBUx0bbp7WyzqbNZI2mbF2NiYu5Xe7WqxZ1U3bJopWumNgFvkaoKBv9coHN/4aO4
	LWC2t9PCaEqfgpGqF7eoGxC3azOse6q2DOCeSGCpaDM0mUVluyiGgzPRp04hGl+QgY12FPeRw+HPS
	buSsJ+tD09GgyRZ4sx+Nr5oaJSopGYLATT+/3NvJYrlXrCVioNtzOlnpZtnXWPkGseFHLBViZ+7UL
	KJVzZUt5EGT3XhtbS8SgKlGKA4vZuRnC1YVYHg723Pz60bha7DaX6+G860SbxicxMpvSrsxwTewxQ
	LcioV6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uminE-00000000yaK-1B4V;
	Fri, 15 Aug 2025 00:59:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhOl-00000000nC0-15hT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:30:21 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 18EBF2018F18; Thu, 14 Aug 2025 16:30:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 18EBF2018F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1755214218;
	bh=HJpg2pS7/i5/eJlR85F2V9d17QqSosoQgMmN8Oxuetc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFpxwWvYUtB7xtV+IEmQnssxxYT8+OJINsLzStaw5+XVPEGLowQhZZQd5A+IyC97p
	 k/XxIeFcy/t6UkH30eLkDXWkafBTl+BQIoTt+YoyJ14kTP+LbLHcKKzrgdX9FPb4c1
	 X+Knpbr9bVs6ctgbJeEGGOXFjs4PzWndk1zR58d0=
Date: Thu, 14 Aug 2025 16:30:18 -0700
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
Message-ID: <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808121515.GE377696@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_163019_333888_3806FEC4 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, Aug 08, 2025 at 09:15:15AM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 06, 2025 at 02:55:38PM -0700, Shyam Saini wrote:
> > Individual PCI devices lack dedicated device tree nodes, but
> 
> This is not the case, you can put PCI devices in the DT as well, there
> is a syntax for it. Why not do that and have the FW populate it on the
> device node itself?

sorry, I missed that, were you referring to [1] CONFIG_PCI_DYNAMIC_OF_NODES
approach?

I tried a PoC with that and got the expected results. However, it requires
hardcoding PCI device IDs using DECLARE_PCI_FIXUP_FINAL?

or were you referring to [2]?

In that case, the PCI child node data needs to be parsed, which is
currently handled individually by each host controller driver.

This might not be a strong argument, but since firmware updates tend
to happen less frequently than OS updates, any addition or modification
to the FDT would require a firmware update. Wouldn't it be more
maintainable to keep this logic in Linux, which is easier to update
and typically updated more often?
  
> You should CC all the device tree maintainers on something like this
> as well.
> 

sure, Cc'd some more folks

[1] https://lwn.net/Articles/939317/
[2] https://elixir.bootlin.com/linux/v6.16/source/arch/arm64/boot/dts/nvidia/tegra186.dtsi#L1340

Thanks,
Shyam

