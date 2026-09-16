Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFD0C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUpSAShM1iFVA9tQq7QEj0VN9vBy+vZF0uG3dEujTMA=; b=cfP1BWkanvEzl39m9fqTzfAKvE
	j3PNPqAgMriW6+7CrD8JEjveX1QF/mi0M4UKKcf8cjFh6MWwxxcc8UtdZqxHCTM05R2XQVZEi7r2o
	178Vl/hLSmbAgzEmwQ1fdWv/jG65ybSHiYuo77Whuxe047PVUQKSyD4hTl92S9oFE44xUuVPyZuYv
	U5K95hBOZPUAvzZP4lc8GuIE/96nXsqhqd2N5Mo2+n97KqiWhjVw7RdHx0om2p62kfzJmM8jU/xZO
	ByrNTGJVi6cx/h/PC+Wi/jughdIiyVTMpq2UUxDd8uS12hqzuZiyxmWnAVUw/NsUh4T11hTpX13I6
	YJm6+OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6o3R-000000096aA-345d;
	Wed, 16 Sep 2026 11:43:57 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6o3P-000000096Z0-1zd1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:43:56 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 9B7621F822;
	Wed, 16 Sep 2026 13:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789559032;
	bh=cUpSAShM1iFVA9tQq7QEj0VN9vBy+vZF0uG3dEujTMA=; h=From:To:Subject;
	b=iGnsgwB1t8BQiAyma9+PcqCCNUQ9kO/L0seDWZDZH+D/kRhX3fW9nyl42r81Xwv5S
	 gN7DtrHKezx9zkqKAUoa5LZknZ/J+RlZNghUtueWC0RVf17cR7HlEsLg42SUaPmxTQ
	 P5w+CKq/cAbAM1d80+SNuHyccsYQCHEYF9IYBlxkgyz/i76jI4qKH6tgNjbP2Yl25Q
	 KfBTudr6/BAMpKGPLwip98RsojigAteaPIjhQoQ+w+Gl26cO1qOzTput1VECqE4Y0+
	 8mUFyTlWf5lCARIja/AQi+Bts2B8zln5XJjQj8I+6/Xu1IsgXy63Xc5XWrCG73ggJe
	 cGenXn2sstU3A==
Date: Wed, 16 Sep 2026 13:43:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Message-ID: <20260916114350.GB284106@francesco-nb>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
 <20260916091543.GA277833@francesco-nb>
 <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_044355_724861_E9C28C8B 
X-CRM114-Status: GOOD (  34.33  )
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

On Wed, Sep 16, 2026 at 01:19:08PM +0200, Luca Ceresoli wrote:
> On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
> > Hello Luca,
> >
> > On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
> >> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> >> > format reported by the downstream panel or bridge describes the display
> >> > input, but it does not describe how the LCDIF data pins are physically
> >> > wired on the board.
> >> >
> >> > These can differ. For example, a 16-bit LCDIF bus can be connected to a
> >> > 24-bit display by wiring the available color bits to the corresponding
> >> > display inputs. In that case, using the display's 24-bit format to
> >> > configure LCDIF selects the wrong data-bus mode and changes the assignment
> >> > of color bits on the LCD_DATA pins.
> >> >
> >> > Read the optional bus-width endpoint property from the LCDIF output port
> >> > and use it to select the media bus format used to configure LCDIF. This
> >> > allows the LCDIF bus mode to describe the physical interface
> >> > independently of the downstream display format.
> >> >
> >> > When the optional property is absent, or it has an invalid value, continue
> >> > using the format reported by the downstream display device, preserving
> >> > the existing behavior. The code is not validating the DT for
> >> > correctness and just fall back to the previous behavior in case of
> >> > errors.
> >>
> >> Why? Generally speaking errors are better spotted immediately, not ignored
> >> silently.
> >
> > My understanding is that the C driver code should not validate the DT
> > and that this is the general recommendation when parsing properties from
> > the DT.
> >
> > The DT checker is going to spot errors in the DT even earlier and in a
> > static way.
> 
> Drivers typically check for invalid values.
> 
> And people writing their private dts can do mistakes and not run the static
> checks. Bad on their side, sure, but having a runtime error would be useful
> there.

Understood. I would personally not do it. I can add the required error
checking code. No other DRM maintainer/reviewer commented so far, so I
am taking this as a request.

What should I do in case there is an invalid value? Fail or have a
warning message?

> Also consider potential regressions. Say someone has an invalid value in
> their product, say bus-width = <15>, which works because the default 18
> which gets used as a fallback happens to be the correct value for their
> hardware. Some years later we implement the new bus-width = <15>, and then
> that user upgrades to a newer kernel and their display won't work because
> it will start using that incorrect bus-witch = <15>. Better stopping this
> before it starts, IMO.

I do not see this situation honestly, if you have a wrong value, e.g. 15
bits, before this patch is ignored, and after this patch is also
ignored ...

The default in the code is equivalent to the bus-width property not
present, and therefore we use whatever is coming from the panel aka the
next bridge.

Francesco


