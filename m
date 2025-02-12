Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA3FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0rHhA0hOIZmpE8kg590rOrrlLlZsqdQB6JFr/UMfEI=; b=Ij9ZNzxMjsjUFPI+jiWp8Y/eGb
	ZxDJOCC2j8ZfC37fKp/pgUzZVcHRCMAzb5Fv9o7tPZELkkMmGEThutMYsxq6hJD5J/wi6KQpmGON8
	XOzUcq4nLaSFkG3XpQMEjs1qPicyKDu94SvJgV7j19Attl43DFGw4DJFyzUL/lfzk1/NavicE6+u9
	WQJ3DoNn4AlHEU4DUwqotJu5ZpCweT5C5/2l5Bm0TVeGHo/m1uc7ZwKd8M+LNWaGCAUYeQ92uHKoT
	+9SOBzaWyVcwXY4XbtO8hv26qtKN/k1TbLVWBr4QBbo87SRbcn0nxK8tSdTwqwog4kdA2CqKw6E+e
	TJ0jV9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAJZ-000000073Ch-2L9t;
	Wed, 12 Feb 2025 10:49:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA7f-000000070VI-2v76;
	Wed, 12 Feb 2025 10:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739356657;
	bh=k/xHaZw9Tz6lmoCuwwVAm04oRGKiqCf1wbcqAMZmcVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I8pUmckE/VrhFzGJrHFb8l3kffAS9Zu0hipC0goSWw9N174CY9irmhDzjVC4TY7pp
	 7QS1MRIpLIqM6he/PPxwBd6rdKs7sD9DbphMcyFyPHrTris+QRjVVNHp2uoatKBd9L
	 IwC713km8Xc7Uk4I293gmxlW6j7GYXlnnw6jN3DHeRtnnwZdu/wfqZBaBOIBp+dPSE
	 ZcgECT8w3mJf95orzRzXdXH0Q9IWM+CY38j0sUFMqpBseuLHw2Y5KhyWdonIYeMGj6
	 SU6zA9IHHfo8Wv6xXP2aNRrVrpgUa/M2ip3fAaexclT0ekzgymM1yf75g9X/5VFQa3
	 v1rjIVI0lhntQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FF5A17E0ECF;
	Wed, 12 Feb 2025 11:37:36 +0100 (CET)
Date: Wed, 12 Feb 2025 11:37:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Florent Tomasin <florent.tomasin@arm.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>, Rob Herring
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
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Message-ID: <20250212113715.166def88@collabora.com>
In-Reply-To: <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	<771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
	<ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
	<be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
	<b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
	<fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
	<20250212-naughty-chipmunk-of-potency-7e0ced@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_023739_912911_275D71B2 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, 12 Feb 2025 11:01:11 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
> > Note that the CMA patches were initially shared to help reproduce my
> > environment of development, I can isolate them in a separate patch
> > series and include a reference or "base-commit:" tag to it in the
> > Panthor protected mode RFC, to help progress this review in another
> > thread. It will avoid overlapping these two topics:
> > 
> > - Multiple standalone CMA heaps support
> > - Panthor protected mode handling  
> 
> You keep insisting on using CMA here, but it's really not clear to me
> why you would need CMA in the first place.

CMA is certainly not the solution. As Florent said, it's just here to
help people test the panthor protected-mode feature without having to
pull Mediatek's protected heap implementation, which currently
lives in some vendor tree and is thus quite painful to integrate to a
vanilla kernel.

I would suggest keeping those patches in a public tree we can point to,
and dropping them from v2, to avoid the confusion.

> 
> By CMA, do you mean the CMA allocator, and thus would provide buffers
> through the usual dma_alloc_* API, or would any allocator providing
> physically contiguous memory work?

Panthor can work with the system heap too AFAICT (I've done my testing
with the system heap, and it seems to work fine). It gets tricky when
you want to allocate protected scanout buffers and import them in the
KMS device though. But as said above, we shouldn't really bother
exposing custom CMA heaps, because that's not what we want to use
ultimately. What we'll want is some ATF implementation for protected
memory, that we can rely on to implement a standard protected dma-heap
implementation, I guess.

> 
> In the latter case, would something like this work:
> https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@kernel.org/
> 
> Maxime


