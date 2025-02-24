Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226BCC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smR/eUa4Gl7DKY3ovjUaLW1zp0s2Y+hsxe3OpZY3a+I=; b=Te1eH1q1ZTUScdLcRLErNQRm6t
	s3cb2HKVtHKfckib3m01NY4vXH3l8D8RjwDz95Em33ll3Jrqs6uIDy0vBl9FJecGggW+5MoHmVurj
	vJFJeDhYYW8FxL5cVhTfOw6QlG3mNZqxEf4cxGcR7/Fab6eUIGK/TW/hyjoDrhymbBtV0qTmvaaUH
	mND48TmM852lCiFaD9FWqadjOX4Tb1NvlBxQNNPBILvlZn7ZhPy7XPghT7Ls9M0BTmPcR80qDJ6so
	idfJ2uqhmdjzN9SsHAwtJg5MPiraN02XvyOSTdvH0PJjLLfK9nx+gpGWQX4N8f4gA9nURQsVzoWuz
	fc5ETRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXAT-0000000DaQ4-1p00;
	Mon, 24 Feb 2025 12:02:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWlG-0000000DRfk-40pn;
	Mon, 24 Feb 2025 11:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740396992;
	bh=PSYe6R/xPBasga876FmS8mHT9Zoo5UeLL8SBdjJXyYU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S2h0bWvGZ/wrr74QxKpyYx3qf9WQ0JxBIUIjM4IGAT16YoVeJKx1K4amOuK76OY8o
	 0R6eNuYkJ3ceb2AQZObzCrHaxfifC9fX9LBuHqEOQbwJxdks9F9siUe9k0qFloe+C7
	 uF3KlDYg3LvWBCNuRgxDfHblWLHi5JCe7B095xMkFnO8xz2u7wxjYxpcyX64pCu/fI
	 OidgFXAVvWuyE2CnaBc9j1s8nwYW1sbhRhZKwvgjmc0ZHNYa8zycnvM2rogw46y9gh
	 nd4QIhnLaSMccsOwjs7RRqk/keKhQI4h7jiAy7QtCib6a+/Rct5zI1AvmIWlSVDaej
	 biIXz6p58xOCw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD4FD17E019E;
	Mon, 24 Feb 2025 12:36:31 +0100 (CET)
Date: Mon, 24 Feb 2025 12:36:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Florent Tomasin
 <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
Message-ID: <20250224123628.52d43b84@collabora.com>
In-Reply-To: <20250220-strict-cobalt-albatross-6f742e@houat>
References: <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	<1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	<ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
	<9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
	<1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
	<20250205-amorphous-nano-agouti-b5baba@houat>
	<2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
	<20250207160253.42551fb1@collabora.com>
	<20250211-robust-lush-skink-0dcc5b@houat>
	<20250211153223.2fef2316@collabora.com>
	<20250220-strict-cobalt-albatross-6f742e@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_033635_243103_7210CE10 
X-CRM114-Status: GOOD (  36.57  )
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

Hi Maxime,

On Thu, 20 Feb 2025 14:32:14 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> > > > This approach has two downsides though:
> > > > 
> > > > 1. We have no way of checking that the memory we're passed is actually
> > > > suitable for FW execution in a protected context. If we're passed
> > > > random memory, this will likely hang the platform as soon as we enter
> > > > protected mode.    
> > > 
> > > It's a current limitation of dma-buf in general, and you'd have the same
> > > issue right now if someone imports a buffer, or misconfigure the heap
> > > for a !protected heap.
> > > 
> > > I'd really like to have some way to store some metadata in dma_buf, if
> > > only to tell that the buffer is protected.  
> > 
> > The dma_buf has a pointer to its ops, so it should be relatively easy
> > to add an is_dma_buf_coming_from_this_heap() helper. Of course this
> > implies linking the consumer driver to the heap it's supposed to take
> > protected buffers from, which is basically the thing being discussed
> > here :-).  
> 
> I'm not sure looking at the ops would be enough. Like, you can compare
> that the buffer you allocated come from the heap you got from the DT,
> but if that heap doesn't allocate protected buffers, you're screwed and
> you have no way to tell.

If heap names are unique, the name of the heap should somehow guarantee
the protected/restricted nature of buffers allocated from this heap
though. So, from a user perspective, all you have to do is check that
the buffers you import come from this particular heap you've been
pointed to. Where we get the heap name from (DT or module param
passed through a whitelist of protected heap names?) is an
implementation detail.

> 
> It also falls apart if we have a heap driver with multiple instances,
> which is pretty likely if we ever merge the carveout heap driver.

What I meant here is that checking that a buffer comes from a
particular heap is something the heap driver itself can easily do. It
can be a mix of ops+name check (or ops+property check) if there's
multiple heaps instantiated by a single driver, of course.

I guess the other option would be to have a protected property at the
dma_buf level so we don't have to go all the way back to the dma_heap
to figure it out.

> 
> > > 
> > > I suspect you'd also need that if you do things like do protected video
> > > playback through a codec, get a protected frame, and want to import that
> > > into the GPU. Depending on how you allocate it, either the codec or the
> > > GPU or both will want to make sure it's protected.  
> > 
> > If it's all allocated from a central "protected" heap (even if that
> > goes through the driver calling the dma_heap_alloc_buffer()), it
> > shouldn't be an issue.  
> 
> Right, assuming we have a way to identify the heap the buffer was
> allocated from somehow. This kind of assumes that you only ever get one
> source of protected memory, and you'd never allocate a protected buffer
> from a different one in the codec driver for example.

Yes, and that's why having the ability to check that a buffer comes
from a particular heap is key. I mean, we don't necessarily have to
restrict things to a single heap, it can be a whitelist of heaps we know
provide protected buffers if we see a value in having multiple
protected heaps coexisting on a single platform.

Regards,

Boris

