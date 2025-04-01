Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3057CC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shn0tnN+wBrIjE3dOep3eH6eMsEq/Sb0KIGYTxFfN5A=; b=XeczZq0eIvpiuKv59iXq+NU4dZ
	VDdNE4+oJTB1Cac7PAweagVwIRWgj1QS07mjjE67z4N7HQ8SUnDNeEWZBBkLxpg0PXNT65OoOPL7S
	T3ky9GBCpVBlIWGQIaIs7yggdCwjrh4VpZ1DdpMGqH+30zrl5g6cG6yV8JTwicjAZzMFR49rupUGa
	w96xXPP2SOJpIwGryUoijBlOwGY/HTH4Y7ygHHtlh6jMzPZn+1x1crBoPNUTKgBkPwRRV4kjiCr79
	D6Es8QoNG2Rexaqjq8SwvybE/PcZKw5wR4duLBXZ5D1qiaa7xj6A02KsXlJOAhTAQNlpl87gFEgiu
	QnGuEWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzek0-00000003vIg-1hkJ;
	Tue, 01 Apr 2025 16:45:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeiE-00000003v0Q-28pN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 226EB6112E;
	Tue,  1 Apr 2025 16:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D942CC4CEE4;
	Tue,  1 Apr 2025 16:43:39 +0000 (UTC)
Date: Tue, 1 Apr 2025 17:43:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Message-ID: <Z-wXuTaTpWOLzTS_@arm.com>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
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

On Fri, Mar 28, 2025 at 04:41:05PM +0000, John Ernberg wrote:
> On 6/12/23 5:31 PM, Catalin Marinas wrote:
> > That's v7 of the series reducing the kmalloc() minimum alignment on
> > arm64 to 8 (from 128). There's no new/different functionality, mostly
> > cosmetic changes and acks/tested-bys.
> > 
> > Andrew, if there are no further comments or objections to this version,
> > are you ok to take the series through the mm tree? The arm64 changes are
> > fairly small. Alternatively, I can push it into linux-next now to give
> > it some wider exposure and decide whether to upstream it when the
> > merging window opens. Thanks.
> > 
> > The updated patches are also available on this branch:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux devel/kmalloc-minalign
> > 
[...]
> Seen on Linux 6.12.20, it is not trivial for us to test later kernels so
> if the issue is potentially fixed we are more than happy to cherry-pick
> the potential fixes and give them a go.

I'm not aware of any recent fix for this, so I doubt testing a newer
kernel would make a difference.

> Having an SMSC9512 (smsc95xx) USB Ethernet/Hub chip attached to the armv8
> SoC iMX8QXP over the Cadence USB3 USB2 interface (cdns3-imx) will since
> the patch set at [0] cause random interrupt storms over the SMSC9512 INT
> EP.
> 
> The reason for the storm is that the async URBs queued at [1] right before
> the interrupt configuration [2] in the driver.
> With [0] applied, those async URBs are likely clobbering any URB located
> after them in memory somewhere in the xhci memory space.
> The memory corruption only happens if there is more than one URB in the
> queue at the same time, making these async URBs a good trigger of the
> problem.
> If we force those URBs to be sync or use the hack inlined below, the
> problem goes away.

I'm not really familiar with this area. My only drivers/usb/ change
related to ARCH_KMALLOC_MINALIGN was commit 075efe7c1656 ("drivers/usb:
use ARCH_DMA_MINALIGN instead of ARCH_KMALLOC_MINALIGN"). I wouldn't be
surprised if I missed other things that rely on the kmalloc() alignment
rather than explicit macros.

> The content of read_buf in the interrupt configuration read at [2] looks
> to be the lo-part of a pointer +-20 bytes distance from the pointers
> present in the async URBs queued from [1] when we dumped the URB structures
> instead of the expected register contents.

It might be worth enabling CONFIG_DMA_API_DEBUG to see if it complains.
I lost myself in the call paths on how read_buf gets populated. In
principle, the DMA API should handle bouncing (swiotlb) even if you pass
it a buffer smaller than the required alignment

Random shot, untested and not an actual fix but some ideas for
debugging:

------------------8<-------------------------------
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 44179f4e807f..06d5f9bfef75 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -2024,7 +2024,7 @@ static int __usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
 		   cmd, reqtype, value, index, size);

 	if (size) {
-		buf = kmalloc(size, GFP_NOIO);
+		buf = kmalloc(ALIGN(size, dma_get_cache_alignment()), GFP_NOIO);
 		if (!buf)
 			goto out;
 	}
@@ -2171,12 +2171,13 @@ int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 		goto fail;

 	if (data) {
-		buf = kmemdup(data, size, GFP_ATOMIC);
+		buf = kmalloc(ALIGN(size, dma_get_cache_alignment()), GFP_ATOMIC);
 		if (!buf) {
 			netdev_err(dev->net, "Error allocating buffer"
 				   " in %s!\n", __func__);
 			goto fail_free_urb;
 		}
+		memcpy(buf, data, size);
 	}

 	req = kmalloc(sizeof(struct usb_ctrlrequest), GFP_ATOMIC);
diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 97866bfb2da9..226ac7af6511 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -45,6 +45,7 @@ static struct cdnsp_segment *cdnsp_segment_alloc(struct cdnsp_device *pdev,
 		return NULL;
 	}

+	max_packet = ALIGN(max_packet, dma_get_cache_alignment());
 	if (max_packet) {
 		seg->bounce_buf = kzalloc(max_packet, flags | GFP_DMA);
 		if (!seg->bounce_buf)
------------------8<-------------------------------

Even without the above, my reading of the code is that it is safe since
the buffers eventually end up in dma_map_single() which would do
bouncing via an aligned buffer.

Try to track down call paths from smsc95xx_read_reg() and
smsc95xx_write_reg_async() to usbnet_{read,wrote}_cmd* etc. and see how
the DMA transfers happen, whether it's missing some dma_map_* call. The
dma_map_* bouncing logic relies on the size, see
dma_kmalloc_needs_bounce().

Is there an iommu between the usb host controller and memory? The iommu
code should do similar bouncing but it's had minimal testing.

-- 
Catalin

