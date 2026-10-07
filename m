Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8194CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLwUzAmQhGSL3Ue4ZR+yc6YJqjUkv8c/LUizgFvUpEU=; b=3B7GmV/eS7zE1PMk3qYYgwIF9w
	rm5R+OAYCnJB2sH11qG3jBjJOOxZ4yCkxOOGbt6R6ZpeICB4xZn2+StGMH16Gf5z+HfPgmxtajZMZ
	aZ/L6HI3xYTMeYTtheAFO/kStuR1hn4A5J0qxqtcgYqnjxYiVdDc5yxMPTkco4DLGwY22P0m/dHCe
	l+fRdtzu49LvM37C2OjdpNBHvPk3+Z1tkOVYHUaHO/BsWqS56zYZbYRmtyAz98qfT/a+SJ5QaLzpX
	xYv5fRhKHhWj6IVnGcgFb6MCHhWlAU1nZ28yFRO79Y+DPhiAV9OAPwAVi/V6alFYHdZcSXghVn0Va
	u2dOnAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEUbP-00000002loR-1OVK;
	Wed, 07 Oct 2026 16:34:47 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEUbL-00000002lnK-2Gxs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 16:34:45 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4166.prod.antispam.mailspamprotection.com; s=arckey; t=1791390883;
	 b=ffM/l+D/nAuSDBCCD0JFDVqSXZQbRq5UmbsBs0lPyb8k6iPKto9MHrY66mvpTIMmMNERgYbQux
	  etbELNlJtR4yvtKA5EtO9Zu1s/MSYKZwNA9QsBYn/jeDjgI3s2/+RZrC75AO5pGU+BuR44CkGp
	  u4libLIrqsPv0igMx9UC1EDbGCTY++KAGIsHUgkMwFHxk3S4jei2HE2N0VUjBbQUTBZwp2Bpu7
	  ZBQ36KIPKRLxyZPqh5xjv0z/t0jc8HZ+t/n3UnDL4P85HFAqptam55JKSHAvaFITIDqToWmhxW
	  kdshha/YIyeDqEFFUVCmohvXlzAhY4sZkDsJnBNSe4uhow==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4166.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4166.prod.antispam.mailspamprotection.com; s=arckey; t=1791390883;
	bh=zWZ8FsXv6P2pM5aRRcbjwFhBPvqExbHMMrdKWPrYp+w=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=Fd5jBdVjKQyhU3vI7dI+5/eyy5NO2p0etkNrkG3FlU/rTPXBKkQWSeXrh1S09bp0Hwftb2R6yV
	  DOecKzpyahw3QnpJK2Xekqa7cJ+nlqDc4rh9z4ijJL7sYeXRaA0KK1v+P+mNnWiFrrZ0HkNcUu
	  e2ns8HDqH7Mx9Y4FKmMI0A0USvFJzLV472gwHK6dO3Z7e2B/HW+nZbiVk5HtdXEpylN9Ogj01e
	  w/sDO7rc4aB56CCwNhQSz3vY3FcmswHyiVexloTIw6i2O+uoUx2cpBOUwMKPsKBwYmJyzI++Lt
	  CdSjdGHTQMfBLXD3D5mcJjtjGYrllEKfgBGtS7WyfXyJ8Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=tLwUzAmQhGSL3Ue4ZR+yc6YJqjUkv8c/LUizgFvUpEU=; b=QHwYMxkQVTrxtR/s8pZLduwOTr
	uoufU3r4yP9VLHetLC0BrLHw+a21qnODVCl20to1WqADzpR5QYFHOS61m+B/gY9nWc5RojTYSiDbb
	WRr3C56QOtFGO3ZX/b0PK8EHAR5mEd27x1BT8eatogOG/q8DSANLsGHLCi9/AH38k2Jg=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4166.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xEUbC-0000000HIKw-3aKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 16:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=tLwUzAmQhGSL3Ue4ZR+yc6YJqjUkv8c/LUizgFvUpEU=; b=rGQH2Jt/bpeF930y+rHYkN2zf8
	97TtVSvsaaG5aGcB4PZfyMk7r2RX3uiBz38jxRRTSPle16p8V/ICrwQiDPiognt0S2z0kAnDjDYyP
	KOckZczNOgULzyrqXvYBnhG1X2IVXykdOIdCVq4OfsXhbomC4NP/QV3KzGUgCqn84S2E=;
Received: from [79.14.200.104] (port=64271 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xEUau-00000000MYn-3hbM;
	Wed, 07 Oct 2026 16:34:17 +0000
Date: Wed, 7 Oct 2026 18:34:14 +0200
From: Francesco Valla <francesco@valla.it>
To: Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <asZ0KdG7lloNwDfx@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s>
 <arLZj2DxBazf3wMd@bywater>
 <20261006183910.GA2890477-robh@kernel.org>
 <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
 <20261007134206.GB2792240-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007134206.GB2792240-robh@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 314831fba780c3fed2ee080d13506096
X-AntiAbuse: ID - 314831fba780c3fed2ee080d13506096
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xEUbC-0000000HIKw-3aKd-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4166.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_093444_076539_EA8DCC6D 
X-CRM114-Status: GOOD (  33.89  )
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

Hello Rob,

On Wed, Oct 07, 2026 at 08:42:06AM -0500, Rob Herring wrote:
> On Tue, Oct 06, 2026 at 06:51:52PM -0600, Mathieu Poirier wrote:
> > On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > > > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > > > these are discovered through a resource table parsed by the remoteproc
> > > > > > infrastructure at runtime, their description can be needed to probe
> > > > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > > > >
> > > > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > > > a virtio-device node, which binding is already existent and used by
> > > > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > > > using its index inside the resource table as the reg property of the
> > > > > > node; this permits to have multiple instances of the same type of
> > > > > > device.
> > > > > >
> > > > > > The binding is intended to be generic and adopted by any remoteproc
> > > > > > provider.
> > > > > >
> > > > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > > > ---
> > > > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > > > >  1 file changed, 89 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..c4a0d84b1460
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > > > @@ -0,0 +1,89 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Virtio devices over remoteproc
> > > > > > +
> > > > > > +description: |
> > > > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > > > +  providers.
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Francesco Valla <francesco@valla.it>
> > > > > > +
> > > > > > +properties:
> > > > > > +  virtio:
> > > > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > > > +
> > > > > > +    properties:
> > > > > > +      '#address-cells':
> > > > > > +        const: 1
> > > > > > +
> > > > > > +      '#size-cells':
> > > > > > +        const: 0
> > > > > > +
> > > > > > +    patternProperties:
> > > > > > +      "^vdev@[0-9a-f]+$":
> > > > > > +        type: object
> > > > > > +
> > > > > > +        properties:
> > > > > > +          reg:
> > > > > > +            description: Virtio device index inside the resource table.
> > >
> > 
> > There are 2 configurations we need to account for: (1) each device
> > located behind the remote processor gets its own set of virtqueues and
> > adheres to the virtio specifications.  This is the configuration
> > targeted by this thread.  The other configuration (2), discussed in
> > the other thread, involves virtio piggy-backed over RPMSG.  The hope
> > is to represent both configurations using the same bindings.  For (1),
> > virtio devices will be advertised in the resource table and for (2),
> > virtio devices will be announced via the existing remoteproc namespace
> > service.
> > 
> > > Who/what defines the resource table?
> > 
> > The resource table is part of the firmware image and is parsed by the
> > remoteproc core.  For (1), as presented in this set, "reg" links the
> > entry in the resource table with the device definition in the DT.  For
> > (2), the definition is also a device index, but said index is
> > communicated to the remoteproc core using a namespace announcement
> > rather than the resource table.
> > 
> > I hope to establish bindings for configuration (1) and merge that work
> > first.  Once that is done we can extend it to cover (2).
> 
> "Defined by firmware" is all I needed. Please make sure the binding 
> patches include this information or I'll forget and just ask again.
>

I'll include this detail in the next version of the bindings; I'm always
working on .rst documentation to add to the next version of the patchset.

> Rob

Regards,
Francesco


