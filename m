Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D5C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0wnoOO5pG/STL/OpzTwEdV4fc3ldm12F1eE4DwdDVU=; b=b2kFFSCdwoKb5PFueaE2Bu8g4k
	ykzueAzKBzDrmrokK6XdX4Pojt190pNvbGklPgrTSjqpQl26T9Ts7E4nwmrncP2xhbo8+IXDHgcJ9
	YbpF/eJYv5X8/mw0rg0oCpoZdduyrfguOGU0MOfjEFgBQXo6DcRtgqHucxPmmVLsSTah22Qhh9bc6
	kf1RvWww9rYYtRLI0zpukUIvMkn96gBleuLH3za3y11gN3kdvvhbWiqT3cpzJgakvcf3Z9WlD0IZs
	g7EEjFDHgzIzr2VEyfrDpG3supUUvMzzIE1a1Twfr9kQdUi7+IdtOWRANlKJ/Wein3/JBQDxV6l4O
	HqHS8C1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dDt-0000000AB33-439U;
	Thu, 24 Sep 2026 06:46:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dDs-0000000AB2D-2MO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:46:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7A5423E1;
	Thu, 24 Sep 2026 06:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882071F000FF;
	Thu, 24 Sep 2026 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790232383;
	bh=R0wnoOO5pG/STL/OpzTwEdV4fc3ldm12F1eE4DwdDVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=koWTzwgXzfK1tsRkEa0NQlX7UtVL0Y2s+v/pZ/J4FNAIbfHcagmjIjvBhoxn6HzBE
	 cnIqWxAWh8srKT6XAWxK+jPnkL2VBHyWzH24so0+Pv2lyjD5oUyrJ7iLna46XHGyCj
	 P+NTR8r0f6g1SQLEpb4rEtYT0B4mu3Mr23gJsZQt1IxwD/qQt9cDIXtSFAu0jH3dIQ
	 EjF/Ug21v5k1kuw8Fpxc3eoZCu5QVrA8ZJsTSOc4X/0b05kKpZEtc7/WXZocn67RTw
	 6CsIEE2w4gPwBfLoKQMCkzA3nRVCr1gVG2iPDH1cQEv+QW6DJWlWs+ezKydrK4ZWQ4
	 74MydDOap5AOw==
Date: Thu, 24 Sep 2026 07:46:17 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horatiu.vultur@microchip.com,
	steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me, herve.codina@bootlin.com,
	arnd@arndb.de, gregkh@linuxfoundation.org, mohsin.bashr@gmail.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 10/14] net: lan966x: add PCIe FDMA support
Message-ID: <20260924064617.GY13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-10-0ecc179c8a2c@microchip.com>
 <179008205148.2160803.12818321368571406375@kernel.org>
 <20260923084538.wgkw2nt5ergoxcot@DEN-DL-M70577>
 <20260923180730.GV13925@horms.kernel.org>
 <20260923201155.lbbbtx22adz2ilhg@DEN-DL-M70577.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923201155.lbbbtx22adz2ilhg@DEN-DL-M70577.microsemi.net>
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

On Wed, Sep 23, 2026 at 10:11:55PM +0200, Daniel Machon wrote:
> > On Wed, Sep 23, 2026 at 10:45:38AM +0200, Daniel Machon wrote:
> > 
> > ...
> > 
> > > > [Severity: Medium]
> > > > Is this path expected to work on a big-endian host?
> > > >
> > > > Until now the descriptor producer and the FDMA engine were both on the
> > > > little-endian SoC, so the native-endian descriptor layout in
> > > > drivers/net/ethernet/microchip/fdma/fdma_api.h was fine:
> > > >
> > > >   struct fdma_db {
> > > >         u64 dataptr;
> > > >         u64 status;
> > > >   };
> > > >
> > > >   struct fdma_dcb {
> > > >         u64 nextptr;
> > > >         u64 info;
> > > >         struct fdma_db db[FDMA_DB_MAX];
> > > >   };
> > > >
> > > > With PCIe FDMA the descriptors live in host memory and are fetched by the
> > > > endpoint, so the host and the engine can disagree on byte order. The
> > > > translated addresses written here, and the status/info words written by
> > > > __fdma_db_add()/__fdma_dcb_add(), all go out in host byte order, and the
> > > > HW-written DONE/BLOCKL fields are read back the same way in
> > > > lan966x_fdma_pci_get_next_dcb() and lan966x_fdma_pci_rx_check_frame().
> > > >
> > > > CONFIG_MCHP_LAN966X_PCI in drivers/misc/Kconfig only has
> > > >
> > > >   depends on PCI
> > > >   depends on OF_OVERLAY
> > > >
> > > > so a big-endian host (e.g. powerpc) can select it. On such a host, would
> > > > the engine see byte-swapped nextptr/dataptr and length fields, i.e. would
> > > > RX/TX not work at all? Should the descriptor fields become explicit
> > > > little-endian types with accessors at the hardware boundary, or should the
> > > > Kconfig entry gain a little-endian dependency?
> > >
> > > Hmm. Never tested on PowerPC, not this driver nor the DT overlay mechanism it
> > > relies on for PCI deployment, which has only been exercised on ARM and x86 so
> > > far (AFAICT) [1].
> > >
> > > [1] https://lore.kernel.org/all/20240430183301.46568e35@bootlin.com/
> > 
> > I don't think that the baseline expectation is that drivers are tested
> > on big-endian systems, but rather that reasonable effort is made to ensure
> > that byte-order usage is correct.
> > 
> > In this case I suggest that will involve using __le64 instead of u64,
> > coupled with calling le64_to_cpu() and cpu_to_le64() as appropriate.
> > 
> > Sparse can aid with getting this right.
> 
> Ack.
> 
> I am a little reluctant, when I cant really test it properly. Sashiko gives
> another solution - adding a LE dependency to the Kconfig of the misc PCI driver,
> maybe that'll do?

I think that should be a last resort. I won't hold out on this,
but I would prefer the approach I suggested.

...

