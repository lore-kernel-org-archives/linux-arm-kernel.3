Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F46CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW6Pq0osddemYt/bdOCpAcfjllFX2GB9kYb3rxjKU1g=; b=UuDWkeGoNP1zu26GpJXsiFqwLd
	+5t5QVCtpzCh1jtu0PZd0Zsy1jrTwtJx8sTv9O4sAiZC6RKBBmyMROcGkZSb9tiH89Ac9b5u5Zy49
	5DrnmSUqBwPpmh7eSyIkAf4PzxFtmwj1f7u3mMAkDZWwJfK1Mj3JtNIKJEC96H8eUCLQ9qVjrLEy2
	VGS2MySPAq52AtKQUE727MQC2ycExgN53z/84b/Z3LDrQlHrIzChBjnUAMMAPCPxCd8gQoYL6Kn3g
	Vc1mDj7nu6EtrxYD3/vt8W7Nyhfz5qoTJNSHO1S7lxTwzw8V4GKzwJSMq3a+D4fAd4xVHo/Jpdmtt
	+fJ3qD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15Nr-0000000EAl1-1W0d;
	Tue, 23 Sep 2025 15:56:51 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15No-0000000EAjj-36Cy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 15:56:50 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 9BA8B2015510; Tue, 23 Sep 2025 08:56:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9BA8B2015510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1758643007;
	bh=JW6Pq0osddemYt/bdOCpAcfjllFX2GB9kYb3rxjKU1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6d07kjygCRywb698zp2lefj4VDV404AV36O9xh5AE+1GNG0a2jt/0hpzLu8QJQcL
	 ECN8IvpEiBbc7+D9RGPJsYTiQoEkMb8od7hrQWMMJzQRvlsSxnai4rFnr+3usp0m4Y
	 ZbxEKaGcTAem4frcTuE0FBtJbFhV335EYU3Zfcfk=
Date: Tue, 23 Sep 2025 08:56:47 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>
Cc: thierry.reding@gmail.com, robin.murphy@arm.com, robh@kernel.org,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, saravanak@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, lizhi.hou@amd.com,
	clement.leger@bootlin.com
Subject: Re: [PATCH v4 3/4] arm-smmu: select suitable MSI IOVA
Message-ID: <20250923155647.GA22010@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-4-shyamsaini@linux.microsoft.com>
 <aMw4I0AjKNPY6SOw@willie-the-truck>
 <20250918224322.GR1326709@ziepe.ca>
 <aM0HQ51DelZW_Rt8@willie-the-truck>
 <20250919120839.GV1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919120839.GV1326709@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_085648_806323_FEBB4D3A 
X-CRM114-Status: GOOD (  22.30  )
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

Hi Jason, Will,

On 19 Sep 2025 09:08, Jason Gunthorpe wrote:
> On Fri, Sep 19, 2025 at 08:33:23AM +0100, Will Deacon wrote:
> > pieces and will need to work on the userspace side. It's not like
> > MSI_IOVA2 is magically going to work (and I bet it won't be tested).
> 
> It could, if someone checks the default memory map a second constant
> could be selected that works.
> 
> > > Nicolin has some patches on the iommufd side to let userspace select
> > > the MSI address instead, but they are not done yet.
> > 
> > Maybe we should just wait for that? Carrying a temporary hack with ABI
> > implications to support broken hardware isn't particularly compelling
> > to me.
> 
> This patch would still be needed for kernel users.
> 
> Arguably the kernel users should just be using the iova allocator from
> dma-iommu.c. This whole hard coded constant/sneaky uapi is just a hack
> to make vfio work..
> 
> So maybe if the single constant doesn't work we could set some
> indication that the caller must allocate the MSI iova, the kernel can
> use the dma-iommu allocator and VFIO can just refuse to use the device
> for now.

So, are we settling on having two predefined MSI IOVA base constants,
and if both of those conflict with reserved regions on a given platform,
falling back to dynamic allocation via the IOVA allocator? Just checking
if that's the consensus we're reaching.

Thanks,
Shyam

