Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8724CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 22:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rtcCqNEwRzPi2I5Hkbq7ADSY01CvO5xXBkS7wksSvE=; b=eptVstALmZP0KnDEUWG0pJ0qyL
	sZ0hNd8/VZblomYf80+tF+3tXKTSmNTAobkKfd9a1xDN+90cgs1IwSMwPq6EPIEVC2pOAjjPovjW4
	KnfNKLLaur05WqpH8gCrCm2yk83dKmXPaSLzcIh/8m6PQwbpOhCHHOcvEwHGcYJw/oyMIHkOr9hCt
	USZWEW3DsVCCq6h8zl9muzjANzDU+BqRGxUaw3UhxhY87az6bLxiwIKO32WkFHl1xc4SO9u9oBI/+
	ebEmRggFnsS73Xr3roJy307xvvwyKYjRJ6BT+ofJfgcnAXCpYYKmydcTnIWNig6yeDVaA8i7tOZVT
	kbKPCHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur23E-0000000DGC5-1LnM;
	Tue, 26 Aug 2025 22:22:00 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur20U-0000000DFvN-34UG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 22:19:11 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 6C8812019D4D; Tue, 26 Aug 2025 15:19:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6C8812019D4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756246749;
	bh=8rtcCqNEwRzPi2I5Hkbq7ADSY01CvO5xXBkS7wksSvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXd25FO/CTVn1QSOUQbXEMJ929gVepWWEUf8BzPGH1O47quoc3mUJI794aVUEr9uu
	 WdMwUuZ4w6tMKjQ0o4OYxTeRjLqYZSem40ZIsqBPVC7iGR5ZVMolKhSMwD/qaNeGiq
	 +pioNVkMiMZzPQAY70cl2TtQL6bM+1BVZxhP+Tx4=
Date: Tue, 26 Aug 2025 15:19:09 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: thierry.reding@gmail.com, robin.murphy@arm.com, robh@kernel.org,
	jroedel@suse.de
Cc: jgg@ziepe.ca, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250826221909.GA3227@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
 <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250815003958.GE599331@ziepe.ca>
 <20250815023236.GA30997@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250818155310.GG599331@ziepe.ca>
 <20250826011557.GA2980@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250826123653.GC1899851@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826123653.GC1899851@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_151910_831779_1CA82174 
X-CRM114-Status: GOOD (  27.22  )
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

Hi Thiery, Rob, Robin, and Joerg,

On 26 Aug 2025 09:36, Jason Gunthorpe wrote:
> On Mon, Aug 25, 2025 at 06:15:57PM -0700, Shyam Saini wrote:
> > Hi Jason,
> > 
> > On Mon, Aug 18, 2025 at 12:53:10PM -0300, Jason Gunthorpe wrote:
> > > On Thu, Aug 14, 2025 at 07:32:36PM -0700, Shyam Saini wrote:
> > > > On Thu, Aug 14, 2025 at 09:39:58PM -0300, Jason Gunthorpe wrote:
> > > > > On Thu, Aug 14, 2025 at 04:30:18PM -0700, Shyam Saini wrote:
> > > > > > or were you referring to [2]?
> > > > > > 
> > > > > > In that case, the PCI child node data needs to be parsed, which is
> > > > > > currently handled individually by each host controller driver.
> > > > > 
> > > > > Yes, this looks like it may be what I was thinking of, the pci@1,0
> > > > > specifes the BDF effectively
> > > > 
> > > > In that case, we'll need to parse the child DTS nodes properly
> > > > within of_iommu_get_resv_regions(). I'll include this in v4.
> > > 
> > > Kinda surprised this isn't happening already? It would be good to
> > > refer to the original specs and describe how whatetever you propose is
> > > aligned there.
> > 
> > Just to confirm, does the v3 version of this series look good to you?
> > If so, I’ll go ahead and respin the series with the iommu_set_sw_msi()
> > change and address the other review comments from Jacob.
> > 
> > Otherwise having pci devices nodes in the fdt or dts needs additional
> > handling, let me know your preference :)
> 
> I think you need to consult with the DT/OF owners on these questions..
> 
> I've forgotton so many of the details here.
> 
> But once you settle on whatever the DT representation is it looks like
> the right direction to me.
> 

The of_iommu driver currently does not correctly handle parsing
of the memory-region property for individual PCI devices. This
patch addresses the issue by explicitly setting dev->of_node for
PCI devices, enabling proper parsing of the memory-region property
within of_iommu_get_resv_regions().

Could you please share your feedback on this fix?

Thanks,
Shyam

