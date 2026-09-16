Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C769C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xwi7DtOdh8cz6NAAVdmMuae3cwJa2QJyIgQkDwWYJPI=; b=v2indWHwbYL8bUx3Qb29azKZhV
	Qdfla1jmAIqKxPHjmj+kG1NAfJ73vis7Z59WmPgbDg5ugwSOqXP2WDKUhxjOEBo2Jx+cODX0YxjZt
	aQbmhXFYbRKNwh5PZIahvvW97SXtXMapuWeYGTSYYoyGA92bKo0IdqCcpOJBO6b4/PvH+c9e6qlOK
	EOFpIBjqus5x+WVcWZnI3y6YOkIZK7fWp4U70Cvw4e1A70nqXwaNuzL2WSHNmRso58rm/3lXaF6ZG
	GGynFCCo4SciWaayL+uQw5WtsWjx/nNEVtZ/b/+SzVxVknqdm7+X3jq/cVPA7u2mZmZhtAKluj1eu
	6zmMz2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lkA-00000008oOL-1DzK;
	Wed, 16 Sep 2026 09:15:54 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lk6-00000008oNV-2ynZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:15:52 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 66C7D1FE13;
	Wed, 16 Sep 2026 11:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789550148;
	bh=Xwi7DtOdh8cz6NAAVdmMuae3cwJa2QJyIgQkDwWYJPI=; h=From:To:Subject;
	b=U0/lzjnBYBNvqGbteRws8o/FtLbdIxR2H6RirMT7BFLLD33MXiQ21m2FAV2M4/wNK
	 3mtozjvKrsjY+G4iWWFJ/ktPzPynWGLtNSVrNR5tVdw7Ujgp9vjw/PaPLGLcEtgJSN
	 K+120Uqucz/5Y9wmumq5QvpCHYYoHNYreYTAtfqCLyar2fFtkqeGT6GSmhPybX5L5k
	 bA39OFwnOh9Pw6gZF+LwexIacmFc+T8ApCdIa2lTZ5mz2em0v+6DhswgD39qjp9Qiw
	 R7LulM0HrkY8qBuQ9deqmCQ9FU27//UEWVEVCj4zaD/00hNs/HGDUmkiAOIsI/gsnt
	 vA2N+KAGn7Npw==
Date: Wed, 16 Sep 2026 11:15:43 +0200
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
Message-ID: <20260916091543.GA277833@francesco-nb>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178954813309.214898.6895255097019153080.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_021550_937341_781150D5 
X-CRM114-Status: GOOD (  20.16  )
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

Hello Luca,

On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> > format reported by the downstream panel or bridge describes the display
> > input, but it does not describe how the LCDIF data pins are physically
> > wired on the board.
> >
> > These can differ. For example, a 16-bit LCDIF bus can be connected to a
> > 24-bit display by wiring the available color bits to the corresponding
> > display inputs. In that case, using the display's 24-bit format to
> > configure LCDIF selects the wrong data-bus mode and changes the assignment
> > of color bits on the LCD_DATA pins.
> >
> > Read the optional bus-width endpoint property from the LCDIF output port
> > and use it to select the media bus format used to configure LCDIF. This
> > allows the LCDIF bus mode to describe the physical interface
> > independently of the downstream display format.
> >
> > When the optional property is absent, or it has an invalid value, continue
> > using the format reported by the downstream display device, preserving
> > the existing behavior. The code is not validating the DT for
> > correctness and just fall back to the previous behavior in case of
> > errors.
> 
> Why? Generally speaking errors are better spotted immediately, not ignored
> silently.

My understanding is that the C driver code should not validate the DT
and that this is the general recommendation when parsing properties from
the DT.

The DT checker is going to spot errors in the DT even earlier and in a
static way.

So the decision is to just fall-back to the previous driver behavior
when this property was not supported at all.

Francesco


