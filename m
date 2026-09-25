Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6DAC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhm3OuOGKpGPipHzsmUmu5dKRRI8/O+LClIrmyA+BRg=; b=FE7HW8Ue3+jDTjRb5i35kE4k7I
	usdnc4CIa6POWLR6gZR5k1shnLGYdQ/RETawiGIwWL8aep9tuL8WfOo59I9ervTYpCKNlKMEusan1
	1f5dGbUZyBnBFf4QHLI0Z4iWvM8ZcJct97AUIMBmQOHWneX9keBH/Dwow2THtDlksIZ0t1vMGtVlh
	isLIS1ZBsTjLAz/kuFtmeXEHGT1X93Pl9b+hPwEanTqX3y1YthKQxIBEY0UCoDuX7aGf2SLg5sGXf
	6eO3rLKeZh2vnbL9vJMsAKYUOc4PUG9WQyxsUlQJtVGMe6k3qu2kowNyV6aC/d0tdjmXBx+Y28b3M
	Q6qUt41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFj-0000000EDY8-069H;
	Fri, 25 Sep 2026 19:06:35 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFg-0000000EDVX-1Ve4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:34 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com; s=arckey; t=1790363192;
	 b=AzHE+LiI+iO/sx8ChOaUSSBSX6sGxIVVHOEO+kinGnSCKR9+TQUADKjPKMwxKe9NkppXt0gRfs
	  LkGEy5EW167bOCGRCfL5Fb7/6EeRS6WyII0wUmnNL+C9ekvY3YmgifuPaqNVV3xHZjEz8PTLri
	  vYQcxHYOcdmZQ6hdO3vA9hDcCaKISfFmDZBXLEjZWy8EN142zdWqFEUEdgwWzbnKAE7rMqgR2Y
	  BOrfuLBXMr333hPUL2WiDxApT1jFvaYdqmQsQGbED4Fqyr8HOvvqT5pKJxbSyY5Tu9OaaEb9Cf
	  RgESlV5gOoZlT/Mi7/32B2r/KAIkrv/iy3dmn19PN+f+aw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com; s=arckey; t=1790363192;
	bh=pfEa9sDfSqmUqAkVSivfg+jwsPnAd7JEdfM7bR8Kono=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=uaet6jkMryyQD/EL/umW6Yonx5dA61K1Xo8S4E23oa7KL0oXCt6bTelIneRq5efBSQQ+ml9r95
	  HjOd/whifyY5rTijJF2wr3J0NNNWJAeMaz4IMir4Oq9nRJpv1Jpv2CzKkIm74CT8tqOzQLn9lH
	  Bl0szuXfDVVW5mq8DROsDHNxA/Nb/d4qENmWzhYKLyA2nIIET4krvfVJG5FxThdvSDfzhq2OjB
	  aBSwoSuz8dN9Q815mSXdvBFRyvCee6ZdKy+CeGF9gU6arAlGPjdQdGJnkz1UTM5U32dvGG43nc
	  AYbH6+Tbj5dggC/ejQQ39FQWvU1pQJ9/NlOcHe5h9qli+g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=jhm3OuOGKpGPipHzsmUmu5dKRRI8/O+LClIrmyA+BRg=; b=qosAWmaXvlDP4kBHodTrEMCE0b
	xQF6jcIhjY1u/99E6FqKjpv2gtT1KwMKPeLT9fH1TyRRgWXxBFC/Dcz2qOFE+zMzL6/ALDPlAcEuI
	/VvC+cJYylBzpvXueIQrXmBboB30MICKPzxpbCtgtDEePm/DeouA7SA6EqBTAzoOLT64=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-97jw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABFV-0000000479C-1m0I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jhm3OuOGKpGPipHzsmUmu5dKRRI8/O+LClIrmyA+BRg=; b=u7hR3YJo8ZSr2SisSaLcNNA9di
	zA3XUxiLlksid/DDe+DIdECQZUJAVZ8/bjoeEVS6W00sscP2aJdJg+YMk9CymkCki0s+B2TN9sXUw
	6yvzhxIdhakmJQceVp/tAluydMOcnP4JJIpwNXm+4k/TQhLzQ89o8WJWqAP4miEIjMK0=;
Received: from [79.45.60.29] (port=64306 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABEv-00000000KZm-1aVj;
	Fri, 25 Sep 2026 19:05:45 +0000
Date: Fri, 25 Sep 2026 21:05:43 +0200
From: Francesco Valla <francesco@valla.it>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
Message-ID: <arbEmz1jy0V7gjrU@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s>
 <arLXthhYbKkwZ9zY@bywater>
 <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
 <arP38OEaabFFu8lJ@bywater>
 <araOI_duKIAbphq6@p14s>
 <1b55f680-2413-4db1-b928-ed5741696d07@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b55f680-2413-4db1-b928-ed5741696d07@arm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b4b494bfe2759520406af1bea050b67f
X-AntiAbuse: ID - b4b494bfe2759520406af1bea050b67f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xABFV-0000000479C-1m0I-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120632_870378_3FB4AA9C 
X-CRM114-Status: GOOD (  48.21  )
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

Hi Robin, Mathieu,

On Fri, Sep 25, 2026 at 05:48:25PM +0100, Robin Murphy wrote:
> On 25/09/2026 4:07 pm, Mathieu Poirier wrote:
> > On Wed, Sep 23, 2026 at 06:05:35PM +0200, Francesco Valla wrote:
> > > On Wed, Sep 23, 2026 at 08:44:41AM -0600, Mathieu Poirier wrote:
> > > > On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
> > > > > 
> > > > > On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
> > > > > > On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
> > > > > > > Depending on the driver originating them, data buffers used for virtio
> > > > > > > communication can either:
> > > > > > > 
> > > > > > >    - already be allocated from the coherent memory area that is
> > > > > > >      accessible by the remote processor; this is the case of rpmsg
> > > > > > >      and the rproc flavor of virtio-console;
> > > > > > >    - be allocated from generic kmem, and thus not accessible directly by
> > > > > > >      the remote processor.
> > > > > > > 
> > > > > > > Exploiting the map operations, which are used by the virtio framework
> > > > > > > when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
> > > > > > > bounce buffering for the second case: when the map() callback is called
> > > > > > > for a buffer, one or more pages of coherent memory are allocated and
> > > > > > > data is copied to them, then they are exposed to the remote processor;
> > > > > > > the data is  then bounced back on unmap().
> > > > > > > 
> > > > > > > The first case is not impacted, since buffers already suitable for
> > > > > > > remote transmission are passed through.
> > > > > > > 
> > > > > > > With the bounce buffering in place, any kind of virtio device can be
> > > > > > > supported through the remoteproc-virtio transport, at least from a
> > > > > > > data exchange standpoint.
> > > > > > 
> > > > > > Is this _necessary_ for the imx93 platform you are implementing feature for?
> > > > > > 
> > > > > 
> > > > > If I don't want to fundamentally change how the remoteproc integration
> > > > > works (i.e.: using buffers only from a pre-shared area), yes. While in
> > > > > my test environment the Cortex-M33 serving as remoteproc is able to
> > > > > access the whole RAM space, that is not always the case.
> > > > 
> > > > The first sentence tells me it is mandatory while the second says it
> > > > is not.  I understand the use case but don't want to bloat the
> > > > subsystem with code that is trying to address a problem you currently
> > > > don't have.
> > > > 
> > > 
> > > Let me rephrase: while on i.MX93 the Cortex-M33 can theoretically access
> > > the whole RAM space, that is not a good idea from a security point of
> > > view and can be the source of a number of bugs. The target is to
> > > statically define a static shared memory area (as I am doing on i.MX95)
> > > and only use that.
> > 
> > As Robin pointed out, have you looked at using a restricted-dma-pool for that?
> > Note that I am not familiar with the concept but open to go that way if it can
> > work for us.
> > 
> > Robin, can you point us to a simple example we could look at?
> The only in-tree example is mt8192-asurada.dtsi, but even there the
> fundamental principle seems exactly the same - the system interconnect is
> locked down such that there's only a particular region of "shared" memory
> that PCIe DMA can access, so the restricted pool is placed there, and in
> that case can occupy the entire region since the wifi adapter only really
> does streaming DMA - restricted pools have some limited ability to act as a
> fallback for coherent allocations, which won't work for everything, but does
> happen to be enough for that wifi driver.
> 
> Here it would be a case of reserving some of the shared region for a
> restricted pool alongside the "vdevbuffer" coherent pool, adding it to the
> memory-region list of the relevant device(s), and usually that would then
> just work, since the setup is all done automatically by the core DT code.
> However I know remoteproc does some funky stuff with child devices, so it's
> quite possible there might need to be something more done there. But still
> far, far less than reimplementing a whole other bounce-buffering system.
> 
> Thanks,
> Robin.

I took a look at the restricted-memory-pool - with which I wasn't
familiar - and seems exactly what is needed here.

I am working on a new prototype with it - if everything works as
expected (I still did not have time to try it) it should only need some
very limited glue code, cutting the modifications in the
remoteproc_virtio driver by 95%. I'll let you knwow.

Thank you for the hint!

Regards,
Francesco



