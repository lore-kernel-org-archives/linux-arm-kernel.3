Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4774DCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WOETdo7BhC8/fmfwEMHN4WnoE6JbrZL+S0o9p8CuQg=; b=g0iysxIZQ0b6tkHLtHBYaxoMtL
	8KEY4iHahNeOFcXdFGIjowg0w3puxUYSllA/4v2QHDzhi/B+K+buwEdyvLuM0fE0sU4846PN+XkBQ
	f8/FbKXPv/ahNw4+hsAXxM3F1Jv42d4jVQi8oVGqYHexlyilWZMiw241vAVg6UCLGZj7hFteghpof
	bdeL2Vi6jehH5QJgOo77VxnaqYtl7hnsbQPaARv8ycgKD/doXyalXfNFFjOQU3IxzG9SeQjUb4Flk
	pys9WpxiQjoHftDeVsrQ+IHufzn3ufwoZL3mVa/96aFrXH05Aw0+qoX7OCzwDegc8vEyYAjNBE03v
	u9xWTWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbbu-00000000nq3-3dGT;
	Wed, 06 May 2026 12:44:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbbt-00000000npL-1Abm;
	Wed, 06 May 2026 12:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778071430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lwcAHOQ9qKgB6gd/9on1FXLK0UkDSvYUDqw8dWjksSDlhrGY71mr6dLuvD+Juxe7xZVjqeJdePgX0oelI7eQUHqqowgB8a6OMxv6o1UV6i0eChNz60qd+WnKM+eJoBrwIjImFw07Yt0V27nCcqSlbOo6ShtG+Fo4J4K4qq2kCS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778071430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4WOETdo7BhC8/fmfwEMHN4WnoE6JbrZL+S0o9p8CuQg=; 
	b=QQtT0Z2HOlpHk1d9Psdmk2ZCNNPApPHJlD8+9lgEYkTjwIU+QWETNPS0/0co+QVLUGW99oqJLrb2APT0E4slFtgSK84HyYQSTdb7+WUFt9JJi0L0l9LJFfnCCLxwnWo5UvjBeYpz5WfQatVYER/N+9ert4DqpakFi/YFAGl6j+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778071430;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=4WOETdo7BhC8/fmfwEMHN4WnoE6JbrZL+S0o9p8CuQg=;
	b=bpzqFq8ZonERTui7D7EsOZ4TgLTnWPmS5jc1gVcCh9oknNoPr4foc8lVt6qDxno8
	NEFNeYkeNwiwAWclb9gxJan+sWCuuXr5s7umaNf7RGIRgmWvVTXIMxOC8jV1DLLjjvM
	Nm1YHD+K9808tVd7G2lSqrJ4FTNe1uXI84ums7Cw=
Received: by mx.zohomail.com with SMTPS id 1778071429188905.6876124875138;
	Wed, 6 May 2026 05:43:49 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>, Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory allocation in
 panthor
Date: Wed, 06 May 2026 14:43:42 +0200
Message-ID: <SurytM7FTOazQNVXXqCU7g@collabora.com>
In-Reply-To: <20260506-energetic-azure-pig-2b6ec4@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_054417_355036_20B0A061 
X-CRM114-Status: GOOD (  33.53  )
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

On Wednesday, 6 May 2026 12:08:24 Central European Summer Time Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> > From: Florent Tomasin <florent.tomasin@arm.com>
> > 
> > This patch allows Panthor to allocate buffer objects from a
> > protected heap. The Panthor driver should be seen as a consumer
> > of the heap and not an exporter.
> > 
> > Protected memory buffers needed by the Panthor driver:
> > - On CSF FW load, the Panthor driver must allocate a protected
> >   buffer object to hold data to use by the FW when in protected
> >   mode. This protected buffer object is owned by the device
> >   and does not belong to a process.
> > - On CSG creation, the Panthor driver must allocate a protected
> >   suspend buffer object for the FW to store data when suspending
> >   the CSG while in protected mode. The kernel owns this allocation
> >   and does not allow user space mapping. The format of the data
> >   in this buffer is only known by the FW and does not need to be
> >   shared with other entities.
> > 
> > The driver will retrieve the protected heap using the name of the
> > heap provided to the driver as module parameter.
> 
> I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> better in the device tree and lookup through the device node? heaps are
> going to have a node anyway, right?
> 
> This would allow you to have a default that works and not mess to much
> with the kernel parameters that aren't always easy to change for
> end-users.

Hopefully the kernel parameters aren't easy to change for end-users on
systems that deploy this. :) The use-case is copy protection for embedded
devices running on locked-down systems. Though admittedly the mechanism
works even on "tampered"-with systems, as long as the underlying hardware
implements the access restrictions properly.

I'm a bit hesitant about making this DT myself. It would solve the problem
that panthor could probe before the heap provider and needs to handle
deferral by itself, but it does mean that we'd be putting software
configuration into the device tree. Having the secure heap be a node with
no address would allow the tee (or whatever else) to still dynamically
allocate it wherever, and let us handle the dependency relationship
between dma heap and GPU, but then we require that tee heap driver
implementations play nice with this scheme, and bring OF into the
dma_heap APIs.

I'm not against making the dma heap a phandle property for the GPU
node and then extending the dma-heap API to get a heap by name or
by index from a user device's standardised phandle property/names
property, but that's potentially a very large can of worms to open.

> 
> Maxime
> 

Kind regards,
Nicolas Frattaroli



