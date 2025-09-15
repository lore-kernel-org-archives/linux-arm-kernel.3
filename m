Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A8ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NC7L9a3XYKmlncczMkoD2UOHbL3rwgNH4J70c/gSpk=; b=Fncaqf/EXI+2EeQ0VHKHwTWZqo
	5qY0DEVrPecqKkFWcvIVjMv0nGkSjYu/V22O6eFS+Sw334Rr0FWcenJKlfqc3smw88CXsi+EO230h
	qQ0eR3t8a3om+9hC813YqFPCnW5CNDQWCyCMdKHc4r0gAFweY44GcUIJroKUbcGbGjZDvEgHIpcyy
	ZLJlWtJoAzRX47t/R1UD600HspPlK7MA9v8csIhoygYp+I2hSJmUN0gAIW47ltxzO6VJXHU23DaOW
	4y5x9i6cTxX83SlJfcO1mn41kZxG2xaceL+XCM3urvC7fVpKOeuvBk1+tBFd1VE5ey7OlUflnAbOT
	J7f7pthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC4M-0000000579T-3blh;
	Mon, 15 Sep 2025 16:28:46 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC4J-0000000577x-40rx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:28:45 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 837A22123290; Mon, 15 Sep 2025 09:28:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 837A22123290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1757953722;
	bh=5NC7L9a3XYKmlncczMkoD2UOHbL3rwgNH4J70c/gSpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVZj4wLJ49yR23ntILIsxDjPKy+iZpuAnfCUFiPCW2lV/OYtJLZ8jUk5MlAkU2bx7
	 n8x5YuTZacW/1c8te5UHuDcTZXvO7RRtJO2pqFWFzUwWBJGX4OKPtAyN4R4v1NgmWr
	 uUKbJZAFI8FgbBeonswNod7ObpMLbv8x7Xof29fg=
Date: Mon, 15 Sep 2025 09:28:42 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: thierry.reding@gmail.com, robin.murphy@arm.com, robh@kernel.org,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 4/4] drivers: iommu: refactor arm_smmu_get_resv_regions
Message-ID: <20250915162842.GA23954@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-5-shyamsaini@linux.microsoft.com>
 <20250909155847.GB882933@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909155847.GB882933@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_092844_027797_56805825 
X-CRM114-Status: GOOD (  21.46  )
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

On 09 Sep 2025 12:58, Jason Gunthorpe wrote:
> On Tue, Sep 09, 2025 at 08:46:00AM -0700, Shyam Saini wrote:
> > Both ARM SMMU v2/v3 drivers have common set operations for
> > arm_smmu_get_resv_regions(), except iommu_dma_get_resv_regions()
> > call all other operations can be clubed into common code block.
> > So to avoid code duplication put common operations in a new helper
> > function iommu_set_sw_msi() and call this helper function from
> > arm_smmu_get_resv_regions() instead.
> > 
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++-------------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 24 ++-----------
> >  drivers/iommu/iommu.c                       | 37 +++++++++++++++++++++
> >  include/linux/iommu.h                       |  6 ++++
> >  4 files changed, 47 insertions(+), 46 deletions(-)
> 
> I would do this first, not after you made all the changes to both
> drivers.
> 
> And then once you do it:
> 
> > -	static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
> 
> Can just be constants written here, nothing else in the kernel should
> refer to them any more because they are dynamic. The only way to learn
> the value is to read the IOMMU_RESV_SW_MSI. Thus don't write them out
> in public headers to prevent mis-use.

I wil address these in the next version.
 
> I'm comfortable with this side from the iommu perspective once you get
> agreement on the DT representation.

We haven’t heard back from the DT folks or Thierry. Do you think we
should wait a few more days for their feedback, or go ahead and send
v5 as an RFC instead?

Thanks,
Shyam

