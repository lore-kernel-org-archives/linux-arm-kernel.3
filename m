Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEBFC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Po+RokqT72xi6/swJRWA/WKK6DdGWwXE5nveqQhmzsc=; b=by9SV8gWcsLqc/
	GzRVpBnqa/fYmbe3yxI8yhU0CgymbqBlyGTX1QAgDX4WHrCr7bgvDf2+xU/otfA4eEoxbFGSNtpJw
	OrqI1L1l7pjQDaC/5jmUUFkUgUnY4zTgFkbunb3B+pJq8x6Qbn3o/BAYIPY283N/iXTRngR1I7WnV
	JiJUN+ksAh3rHmASpFnS0TipJQ4s0hAMdupI1x3fUxmkhiuehV/GWxPlTLs2jwhsqn0u1+lf1qqWA
	x14Gdj8n9/25+IRjYQD5+NIL/k4HL7uCr2zs/mhnfaN2BmMrKJjfnXqsgo/jOGGDoWvccMQOdV/rY
	mr7ArkPsgCVQ7eRrq2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuZ-0000000A7bT-3i8b;
	Wed, 16 Sep 2026 21:11:23 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuQ-0000000A7Xy-1nep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:17 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com; s=arckey; t=1789593074;
	 b=Jpfz1yepIdncZ70JDIVGkPQ8nItZYoScmEzjs1rLS38cjv7Dgv2hsuycHJ+GCqBd6wlWSUs+aW
	  jGF3usHqRxutDNv6MSZotmU1YRvWwwPFA13XNTwq+nykq6Hmr8OxqsUCZjoyeNQZYONuB6/Qrb
	  X9DrRUz6jL0wtan29UfYnwPgmL7zhF3ItRLKIOeO0RZrXxWoAvf2LOatOEilQgm2gXTZZ3UDaq
	  95s6zFRM4EMT1wtyKmcTHjWCn/qEe6vOBLMcmPh8ijM4vY1JM0YbdJSYzMMEdivTqRJfJikx44
	  1YKDC99AyzzGZksc9UwhmbuPFOPrktBX9rlYO2sZpHH0gQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com; s=arckey; t=1789593074;
	bh=2LZ1fVhkv85MRMHADmROzKC+YrFJIScmDdtzlVxHDq4=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=E5bM5dRxIYZWbKHyRaB+5veAnH4tHCQsaZFZ30WrP1ipOsju+/Ef/f6fAhuZQ7l669TY0BmEtD
	  6fsG6YfY/5IlpDyPtKsTB5snh1BmtPqEhNWPd6toBqHNQj8njvoxaCG3ZIAf2BL4ShVThLWM5P
	  wNQRlNYBE33wlW66DcfnyBnLo/AfAgxxPLL6oZD2kryl8YNEfzGW0W95ypc0lEywNxPdDG4QyJ
	  wNYddDcMnjfatkjmCZaFJWTAfsQmL/1t/YTwy3ePh5GANC6rGFmWHNimowjE1Hs3CK41nmQQt4
	  eom9yIbJk/TKq1sXS2S37H1dPpX3txVvn/g/5Iop1JylZA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=Po+RokqT72xi6/swJRWA/WKK6DdGWwXE5nveqQhmzsc=; b=LQe3hYmBZcGyRo9grGxl2esnoU
	CEaw5EKW0jiHNWhgUCCRx67I95FJ7zF8VjpBSsZCUdi38d+RsRwgVfAm6AF4R57fepT1f4h6fxsRb
	6sDXvwOT57WW0fuZi4NXABwiqjOixqfXnGlcgSZrKM6joIOHmkwLZy1tlVsWbOM8LDLA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuI-000000066br-22ON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Po+RokqT72xi6/swJRWA/WKK6DdGWwXE5nveqQhmzsc=; b=AFSi5nlorg4P4NoThB2KNHBMzt
	OuTdtUNPCXJ432GM3Mk36q/a9SaksyLoDIANMC277HJa1Hds6agkwg9UwGK3ZfpG4lovY0PEgqbe1
	NBxkNiWSnZPd5RLH4IdYfjx99TnI7Zg9/UusqVZeQhPxuyD3YyjnQ1HFJE+mJsyPal80=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuD-0000000058P-2zEG;
	Wed, 16 Sep 2026 21:11:01 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC 00/12] remoteproc: add support for any virtio device
Date: Wed, 16 Sep 2026 23:10:45 +0200
Message-Id: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBQFr1Le2kAbjaBbwQN0K1KS+KNfaBN+Y
 hFK727U5QzMLMgkTBnHZoHQzJnjVKHbNPAPO91J8a0ydKv37aEzSmiMhZJEP8wsheMw2qScD1t
 tTbDO7FDbJBT4/fte0J9PuP5lfrkn+fI9Yl0/ay11Wn4AAAA=
X-Change-ID: 20260915-remoteproc_virtio_map-bcf32a5fab54
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8074; i=francesco@valla.it;
 h=from:subject:message-id; bh=2LZ1fVhkv85MRMHADmROzKC+YrFJIScmDdtzlVxHDq4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR/vXhFxs1O+ZeNzaR+WR9EbP8ttnyMXWhxp7Mv2L
 qdEO2RTRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjCRpxcZ/plsdVz343C7wAax
 WPGU7orpm26Ui78507JUnPG39fbYnwmMDD+nfuphvLDs5hav9z6vt0trb5OcyLrrWbF8ADPb68r
 TT7gA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: e2cd8e87c43240b8d223c7b470c6dbc2
X-AntiAbuse: ID - e2cd8e87c43240b8d223c7b470c6dbc2
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuI-000000066br-22ON-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141114_996587_0965DF90 
X-CRM114-Status: GOOD (  27.75  )
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

Hello,

this patch series introduces the possibility to support generic virtio
devices over the remotepoc transport, whereas today only rpmsg and
virtio-console are supported.

== Introduction ==

Support for devices other than rpmsg was originally planned [1] and is
declared inside the documentation [2], but is in practice not there for
the majority of (if not all) the platforms that provide remoteproc
capabilities due to memory allocation.

While vrings are pre-allocated in an area that is reachable by both the
local (i.e.; Linux) and remote processors, buffers produced by virtio
drivers aren't, since they typically get allocated through kmalloc.
The aforementioned rpmsg and virtio-console drivers instead use a trick
to overcome this limitation and allocate these buffers directly from
the remoteproc device's coherent memory area, somewhat breaking the
separation between the driver and the underlying transport.

== Well, nice, but why? ==

Main usecase is sharing/virtualization of devices in hypervisor-less
mixed-criticality contexts, where a subset of peripherals are controlled
by a "safety" real-time processor but still need to be used by the Linux
world. Several solutions have been / are being proposed [3] [4], but
none of them re-uses the existing, standardized virtio specifications. 

== The proposal ==

The proposed approach is to introduce a bounce buffering mechanism that
is transparent to the drivers and can expose to remoteproc devices only
memory areas they can access. This is obtained by defining the .map
memeber of each registered vdev and use the map() and unmap() callback
to bounce data to and from the remote processor, just like the swiotlb
framework is doing in other contexts, using the device's coherent memory
area and the associated functions to allocate the bounce buffers.

During the map() callback the address of the incoming buffer is compared
against the coherent memory address base and size, to pass through
buffers already suitable for remoteproc usage (e.g.: the ones allocated
by the rpmsg framework).

== Status and open points ==

The series was tested against a custom Zephyr application [5] running on
the Cortex-M33 processor of an i.MX93 and exposing six different virtio
devices:

  - rpmsg
  - entropy (rng)
  - gpio
  - i2c
  - spi
  - can

On top of three of them (unsurprisingly: i2c, spi, and gpio) several
devices where declared inside Linux devicetree and successfully used
(well, technically I'm still experiencing difficulties with gpio
interrupts not firing on the M33, but that's not really related to the
series). 

Several open points are still present, and needs to be either
investigated or discussed:

  - for each bounce buffer an entire page is allocated from the coherent
    memory pool; this is a waste for most of the allocations, which take
    on average 32 to 64 bytes. An option can be to initialize a DMA pool
    on one page and allocate small buffers from it?

  - the support in its current form allocates more memory than before
    (for bounce buffer tracking) also for existing usecases (i.e.,
    mainly rpmsg).

  - an additional issue still exist - and is not solved by this series -
    for a subset of virtio devices: communication through the device's
    config space. The remoteproc transport expects this config space to
    be somewhat constant, and there is no provision to sync changes made
    by the driver with the remote device. This prevents e.g.
    virtio-input to work.  

  - device de-registration on remoteproc stop is causing oopses (under
    investigation - might no be strictly tied to the series)

== Patches breakdown ==

Patches 1 and 2 are cleanups to the remoteproc-virtio driver and could
be applied independently of this series.

Patch 3 was submitted a couple of months ago [6] and paves the road for
the actual support of generic virtio devices, removing the fixed number
of 2 for the vrings associated to a vdev.

Patch 4 introduces two new APIs for coherent memory areas associated to
devices that are used later.

Patch 5 might somewhat be controversial, as it unconditionally defines
the VIRTIO_F_VERSION_1 feature for all vdevs. This is required to
support some virtio device types, and there is no other mean of
defining it, since the field reserved for features inside the resource
table is limited to 32 bits. Given that the 1.x virtio specifications
are ~10 years old this still seems reasonable.

Patch 6 is were the bounce buffering mechanism is introduced; another
feature (VIRTIO_F_ACCESS_PLATFORM) is there unconditionally defined to
force the virtio framework to use the new map APIs.

Patches 7 and 8 are new devicetree bindings, the first for spi-virtio
(modelled against the existing ones for gpio-virtio and i2c-virtio) and
the second for declaring virtio device inside a devicetree. This is not
required for some devices (e.g.: can, net, gpu), but for others is
necessary to declare child devices and link them.

Patch 9 is used to convince the remoteproc-virtio transport to parse the
bindings just defined; it is worth noting that the virtio framework
already has the support for devicetree declarations and this adds only
the glue between the existing support and remoteproc.

Patches 10 and 11 are i.MX-specific and enable the usage of the newly
introduced support on this family of platforms. The first one might
probably be sumbitted as-is independently of the series, as it aligns
the behavior of imx-rproc to the other platforms in relation to mailbox
usage.

Finally, patch 12 is the PoC that has been used to develop and test the
series and shall not be merged.

======

Thank you in advance for any comment you may want to leave.

Regards,
Francesco

[1] https://lore.kernel.org/all/1330589497-4139-1-git-send-email-ohad@wizery.com/
[2] https://elixir.bootlin.com/linux/v7.2.5/source/Documentation/staging/remoteproc.rst#L26
[3] https://lore.kernel.org/linux-remoteproc/20260721204704.400781-1-shenwei.wang@oss.nxp.com/
[4] https://cfp.embedded-recipes.org/er2026/talk/PCYPJP/
[5] https://github.com/WallaceIT/zephyr/tree/multi_vdev
[6] https://lore.kernel.org/all/20260621-vring_flex-v1-1-c6c582fbe94b@valla.it/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (12):
      remoteproc: virtio: cleanup rproc_add_virtio_dev error path
      remoteproc: virtio: replace commas with semicolons
      remoteproc: virtio: support dynamic number of vrings
      dma-coherent: add base and size APIs
      remoteproc: always report VIRTIO_F_VERSION_1 feature
      remoteproc: virtio: add bounce buffering for data buffers
      dt-bindings: spi: add bindings for spi-virtio
      dt-bindings: remoteproc: add remoteproc-virtio
      remoteproc: search for a fwnode during vdev registration
      remoteproc: imx_rproc: always use non-blocking mailboxes
      dt-bindings: remoteproc: imx-rproc: support virtio
      PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +-
 .../bindings/remoteproc/remoteproc-virtio.yaml     |  89 +++++++++
 .../devicetree/bindings/spi/spi-virtio.yaml        |  52 +++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++-
 drivers/remoteproc/imx_rproc.c                     |  49 +----
 drivers/remoteproc/imx_rproc.h                     |   1 -
 drivers/remoteproc/remoteproc_core.c               |  43 +++-
 drivers/remoteproc/remoteproc_virtio.c             | 222 ++++++++++++++++++---
 include/linux/dma-map-ops.h                        |  10 +
 include/linux/remoteproc.h                         |  24 ++-
 kernel/dma/coherent.c                              |  34 ++++
 11 files changed, 562 insertions(+), 93 deletions(-)
---
base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
change-id: 20260915-remoteproc_virtio_map-bcf32a5fab54

Best regards,
--  
Francesco Valla <francesco@valla.it>


