Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A58C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K6RMuFqw/0yA8o+/CTvB3vW+m44k9m9LPe8/wSzQGA=; b=UsINCZCso4TAMgcX9FsegDrRvz
	dDtweR6ktuuEBRh3QNjzMU2YLtcjCazsFiAvlC4aYQU65RWX30V6Vs04RrEkQCNd4Iq7cuDbDEjJ3
	SWwDs+c8s+0+3GG0TzO9CSj9hqBRN+m3vERMJp7iOSx5tholYIRxQFG6DoDYTxX0d1eawpeN+DkRF
	7dhtvPqr0kK+eI9eVN5AYR5h/scexA4CKZ6HecZlhrHBJRU8k8ULUdRuJV0TNpG8r0Bz3kqh5BmR1
	PWWRAuIayp5hgJUMMS/DPUqrjHbCuJFT6a/WQ3fErbN3O/2iVA9IPbkNkE4PE2ToDVycNBqHhIBiP
	bd1Y2gKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkO-00000008Zx0-0MZq;
	Thu, 27 Feb 2025 19:40:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhKM-00000008AaN-3kWp;
	Thu, 27 Feb 2025 17:05:40 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 206AF6A6;
	Thu, 27 Feb 2025 18:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740675846;
	bh=6K6RMuFqw/0yA8o+/CTvB3vW+m44k9m9LPe8/wSzQGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCxsA/uBn8Roii7nvPfKx5n6xPZL7bvOmsR03e6MYuo5F1rEuUaT/IQcgdIergUH2
	 fSoNdeEwoNdwohz6Bhze9Yd9195IU04lOE1YT8YByG/hjsK46/0iL4n4NuxECjDjq+
	 tJiXr1m4A1pCk/YO9xgQnI8Wz31UosUIgtoGWbJ0=
Date: Thu, 27 Feb 2025 18:05:31 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Message-ID: <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bjw9s4s3.fsf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090539_072471_69A08D31 
X-CRM114-Status: GOOD (  28.03  )
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

Hi Mikhail

On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
>
> Hi Laurent,
>
> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
> >> video capture buffers. However, on some platforms, using non-coherent
> >> buffers can improve performance, especially when CPU processing of
> >> MMAP'ed video buffers is required.
> >>
> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> >
> > What's the time taken by the cache management operations ?
>
> Sorry for the late reply, your question turned out a little more
> interesting than I expected initially. :)
>
> When capturing using Yavta with MMAP buffers under the conditions mentioned
> in the commit message, ftrace gives 437.6 +- 1.1 us for
> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> buffers in this case is more CPU-efficient even when considering cache
> management overhead.
>
> When trying to do the same measurements with libcamera, I failed. In a
> typical libcamera use case when MMAP buffers are allocated from a
> device, exported as dmabufs and then used for capture on the same device
> with DMABUF memory type, cache management in kernel is skipped [1]
> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>
> So it looks like to make this change really useful, the above issue of
> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> solved. I'm not an expert in this area, so any advice is kindly welcome. :)

It would be shame if we let this discussion drop dead.. cache
management policies are relevant for performances, specifically for
cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.

>
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411

I would like to know from Hans if the decision to disallow cache-hints
for dmabuf importers is a design choice or is deeply rooted in other
reasons I might be missing.

I'm asking because the idea is for libcamera to act solely as dma-buf
importer, the current alloc-export-then-import trick is an helper for
applications to work around the absence of a system allocator.

If the requirement to disable cache-hints for importers cannot be
lifted, for libcamera it means we would not be able to use it.


> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>
> --
> Best regards,
> Mikhail Rudenko
>

