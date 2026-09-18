Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5473C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVUde7IRkQCiapOxCzvLvGC5LfRJvKccbFMpxGxukJw=; b=NRvubyWJPxduFGRKAbzPRuzp3A
	ILV9f2r9YA2q8FaW5pEF9ZZRXnhvoLY0nTat/6RSFtCOEpezgvSlOQIddpU2qNM8C8jKHFFSYej8+
	dBztacR1yewgmg1JSlnATByBUxo9tzWbt2po2iDBjwaOQbXz9zWqsTPmWoEmLZuiC1oWKTJMdrKDX
	yW2MS6wlt7AsTYE3nsaCne4T70Bx5VJj2g3G5OptrcH5/7bYNXTGvSdQscw/ret+mYxya4no6y1pk
	A/yZYZ6fABNku0zK5jwwLBk03GCYKJxx/f2E1pxbXs9C25ubABLgnTgMqW1ttaAauzmcgXgQFYMPr
	inH+wRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bqd-0000000F64K-1kcm;
	Fri, 18 Sep 2026 16:54:03 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bqZ-0000000F63M-3Jgn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:54:01 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-86868f7707dso570465b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789750438; x=1790355238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVUde7IRkQCiapOxCzvLvGC5LfRJvKccbFMpxGxukJw=;
        b=jI7DzKutWc/AGWnxMxdP/k0yXn7vQ7lI1yI5az1Zc4OJ1FLNTDPlix39syhSpQ7wc9
         iBEIQsf+05ufsvuuDEWOVErXQ+FbN5hGwqY8Iwrvk9+2Eg0y2DCG2PUpTSqvGlqik7Sb
         1fCPtjic9yNIECxbw9D4W1PFJUQCj+lhEiGYi21Hl0mlGGbs7PaLuF2vZjWB0eAI3kSh
         qbHiYN12dovR5f5132eHnEej0qpdA5jATwGvf/GXYX2X4SgIchyyVmEfFvf2cHv4ghqV
         T0yVerZdmghhf8Gh2TxSw8Utn6Yl65MpyRfbN7lNrLxDpcShvHuR2PpCSvYtAKUkQcCj
         qfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750438; x=1790355238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVUde7IRkQCiapOxCzvLvGC5LfRJvKccbFMpxGxukJw=;
        b=Wzo6j7GgPmy8/6Ur9Xk0fMO7sYWC/89mHVN78ZazHKr7LQXMsfJgkv5h1Ii322ww+j
         ac87qZHXgXeHd7Bzt4vYeTd2YJLsdvw3D1k/7Pi5AT5lQLLnd2cIvVLyzl9fo6khR0Oa
         sJwWV0HdmGS/IFCC2t2jqURstBcV+GLQt2tRH9wPN/0jrfEsVm9pFcDBrH3754tZwCeZ
         Llr1IBtvO85N2vlddzXbs/IoLX1yi70IXvugCraUU4hF+Ok1EfKcwasMJ4EroVwXlvG7
         cbDgO6JiKN1sGWP2A9pktRMgyeHcAb0aS5o5bQgvvLZzll7rha6I0iq2XHk4mYESRP+b
         HLdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH4+wtAhXIdY4qtw6cnvUDch7jS6/knbgJoWqI5OqRfGu23g9HdZXDlga6orcB/poKuKOPdPbPPq+YM5h/CaMr@lists.infradead.org
X-Gm-Message-State: AFuF++ke+hNEdY66CuuDIy6YrtxM6lK8pse94zh/XkGDLsr7ZAe2uXWn
	nKPUG5ZcizLlFZv+Ivh0cZ/cJwHamUV1Yd5GD+eZoeKQR6jG/GfY5fTB+AExshj9flI=
X-Gm-Gg: AYBFou25+Tz/rEeP5Sv6xlc8TCb8Y0p7t2i+CJQzGDvAO6Pya5BLRFaH3/zQByzWfBB
	KVbOq4bUOMFP3hATxYLcNeNxFbpa4VHX8o6d7hdI/U8s0OAeENHRmOaFJlENETrkLUCkxKoa+sN
	tr2u3TtrbHjhkBl0ZaAWs3QAb7cRmiyrXsL6Yt8TT9I3BX81ZASg5D3pPSt6W7tJAg83T7qRby3
	13kNR4di88a5Yf3P3C7sdvfbLC2wJ2s+VZahxlCzf1LmXrsF4nB8QwJV4NSDX6pGlOmyLRpyq17
	sFYWtbuXJkJhCK93r5xkXCXlTV8cFybM8i4p7JlAohLAK4hm4u7+8cZgct7hQNtbCMCEAkK818a
	f4Na6rHEIzItEzDNDJfhj1Sz1niooFDe8LWDX1iLTgzbWXQVPZMXrdS3CN4XLSOzfKD21qzzCoW
	l9Tr+k1lM/u5i4W20xVVH9cJ/pT2vp2GXQxv4euuaXENx0EiykCLFuw1hWbpSKE/uHM3cUneaR6
	fw=
X-Received: by 2002:a05:6a00:ad89:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-874dc3f65a8mr6351046b3a.13.1789750438072;
        Fri, 18 Sep 2026 09:53:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff7b:49b4:123e:4989])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec901sm69019b3a.4.2026.09.18.09.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:53:57 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:53:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
Message-ID: <aq1sooGCYUiWbhMH@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095359_847231_450E33D3 
X-CRM114-Status: GOOD (  52.48  )
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

Hi Francesco,

I have started reviewing this set but given the size and implications, it will
take me a few days to get through.

Thanks,
Mathieu


On Wed, Sep 16, 2026 at 11:10:45PM +0200, Francesco Valla wrote:
> Hello,
> 
> this patch series introduces the possibility to support generic virtio
> devices over the remotepoc transport, whereas today only rpmsg and
> virtio-console are supported.
> 
> == Introduction ==
> 
> Support for devices other than rpmsg was originally planned [1] and is
> declared inside the documentation [2], but is in practice not there for
> the majority of (if not all) the platforms that provide remoteproc
> capabilities due to memory allocation.
> 
> While vrings are pre-allocated in an area that is reachable by both the
> local (i.e.; Linux) and remote processors, buffers produced by virtio
> drivers aren't, since they typically get allocated through kmalloc.
> The aforementioned rpmsg and virtio-console drivers instead use a trick
> to overcome this limitation and allocate these buffers directly from
> the remoteproc device's coherent memory area, somewhat breaking the
> separation between the driver and the underlying transport.
> 
> == Well, nice, but why? ==
> 
> Main usecase is sharing/virtualization of devices in hypervisor-less
> mixed-criticality contexts, where a subset of peripherals are controlled
> by a "safety" real-time processor but still need to be used by the Linux
> world. Several solutions have been / are being proposed [3] [4], but
> none of them re-uses the existing, standardized virtio specifications. 
> 
> == The proposal ==
> 
> The proposed approach is to introduce a bounce buffering mechanism that
> is transparent to the drivers and can expose to remoteproc devices only
> memory areas they can access. This is obtained by defining the .map
> memeber of each registered vdev and use the map() and unmap() callback
> to bounce data to and from the remote processor, just like the swiotlb
> framework is doing in other contexts, using the device's coherent memory
> area and the associated functions to allocate the bounce buffers.
> 
> During the map() callback the address of the incoming buffer is compared
> against the coherent memory address base and size, to pass through
> buffers already suitable for remoteproc usage (e.g.: the ones allocated
> by the rpmsg framework).
> 
> == Status and open points ==
> 
> The series was tested against a custom Zephyr application [5] running on
> the Cortex-M33 processor of an i.MX93 and exposing six different virtio
> devices:
> 
>   - rpmsg
>   - entropy (rng)
>   - gpio
>   - i2c
>   - spi
>   - can
> 
> On top of three of them (unsurprisingly: i2c, spi, and gpio) several
> devices where declared inside Linux devicetree and successfully used
> (well, technically I'm still experiencing difficulties with gpio
> interrupts not firing on the M33, but that's not really related to the
> series). 
> 
> Several open points are still present, and needs to be either
> investigated or discussed:
> 
>   - for each bounce buffer an entire page is allocated from the coherent
>     memory pool; this is a waste for most of the allocations, which take
>     on average 32 to 64 bytes. An option can be to initialize a DMA pool
>     on one page and allocate small buffers from it?
> 
>   - the support in its current form allocates more memory than before
>     (for bounce buffer tracking) also for existing usecases (i.e.,
>     mainly rpmsg).
> 
>   - an additional issue still exist - and is not solved by this series -
>     for a subset of virtio devices: communication through the device's
>     config space. The remoteproc transport expects this config space to
>     be somewhat constant, and there is no provision to sync changes made
>     by the driver with the remote device. This prevents e.g.
>     virtio-input to work.  
> 
>   - device de-registration on remoteproc stop is causing oopses (under
>     investigation - might no be strictly tied to the series)
> 
> == Patches breakdown ==
> 
> Patches 1 and 2 are cleanups to the remoteproc-virtio driver and could
> be applied independently of this series.
> 
> Patch 3 was submitted a couple of months ago [6] and paves the road for
> the actual support of generic virtio devices, removing the fixed number
> of 2 for the vrings associated to a vdev.
> 
> Patch 4 introduces two new APIs for coherent memory areas associated to
> devices that are used later.
> 
> Patch 5 might somewhat be controversial, as it unconditionally defines
> the VIRTIO_F_VERSION_1 feature for all vdevs. This is required to
> support some virtio device types, and there is no other mean of
> defining it, since the field reserved for features inside the resource
> table is limited to 32 bits. Given that the 1.x virtio specifications
> are ~10 years old this still seems reasonable.
> 
> Patch 6 is were the bounce buffering mechanism is introduced; another
> feature (VIRTIO_F_ACCESS_PLATFORM) is there unconditionally defined to
> force the virtio framework to use the new map APIs.
> 
> Patches 7 and 8 are new devicetree bindings, the first for spi-virtio
> (modelled against the existing ones for gpio-virtio and i2c-virtio) and
> the second for declaring virtio device inside a devicetree. This is not
> required for some devices (e.g.: can, net, gpu), but for others is
> necessary to declare child devices and link them.
> 
> Patch 9 is used to convince the remoteproc-virtio transport to parse the
> bindings just defined; it is worth noting that the virtio framework
> already has the support for devicetree declarations and this adds only
> the glue between the existing support and remoteproc.
> 
> Patches 10 and 11 are i.MX-specific and enable the usage of the newly
> introduced support on this family of platforms. The first one might
> probably be sumbitted as-is independently of the series, as it aligns
> the behavior of imx-rproc to the other platforms in relation to mailbox
> usage.
> 
> Finally, patch 12 is the PoC that has been used to develop and test the
> series and shall not be merged.
> 
> ======
> 
> Thank you in advance for any comment you may want to leave.
> 
> Regards,
> Francesco
> 
> [1] https://lore.kernel.org/all/1330589497-4139-1-git-send-email-ohad@wizery.com/
> [2] https://elixir.bootlin.com/linux/v7.2.5/source/Documentation/staging/remoteproc.rst#L26
> [3] https://lore.kernel.org/linux-remoteproc/20260721204704.400781-1-shenwei.wang@oss.nxp.com/
> [4] https://cfp.embedded-recipes.org/er2026/talk/PCYPJP/
> [5] https://github.com/WallaceIT/zephyr/tree/multi_vdev
> [6] https://lore.kernel.org/all/20260621-vring_flex-v1-1-c6c582fbe94b@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (12):
>       remoteproc: virtio: cleanup rproc_add_virtio_dev error path
>       remoteproc: virtio: replace commas with semicolons
>       remoteproc: virtio: support dynamic number of vrings
>       dma-coherent: add base and size APIs
>       remoteproc: always report VIRTIO_F_VERSION_1 feature
>       remoteproc: virtio: add bounce buffering for data buffers
>       dt-bindings: spi: add bindings for spi-virtio
>       dt-bindings: remoteproc: add remoteproc-virtio
>       remoteproc: search for a fwnode during vdev registration
>       remoteproc: imx_rproc: always use non-blocking mailboxes
>       dt-bindings: remoteproc: imx-rproc: support virtio
>       PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +-
>  .../bindings/remoteproc/remoteproc-virtio.yaml     |  89 +++++++++
>  .../devicetree/bindings/spi/spi-virtio.yaml        |  52 +++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++-
>  drivers/remoteproc/imx_rproc.c                     |  49 +----
>  drivers/remoteproc/imx_rproc.h                     |   1 -
>  drivers/remoteproc/remoteproc_core.c               |  43 +++-
>  drivers/remoteproc/remoteproc_virtio.c             | 222 ++++++++++++++++++---
>  include/linux/dma-map-ops.h                        |  10 +
>  include/linux/remoteproc.h                         |  24 ++-
>  kernel/dma/coherent.c                              |  34 ++++
>  11 files changed, 562 insertions(+), 93 deletions(-)
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260915-remoteproc_virtio_map-bcf32a5fab54
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 

