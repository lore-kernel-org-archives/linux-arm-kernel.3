Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B17BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ak7g+bnNvjs6BgBEr/Bs7DjjcW1VaCyUfDXvUXZ24I=; b=vny6JA+UQ58c7zc0y61szmAL/8
	H9NgMtdnHAUswc744PJvf/2MCp2RoIMbYqkWK2bd1eIP2fz2Ul5+KOXJjKD1uo9F0/UjrUy//xmaJ
	lo68LDcgQpoP3fM5Mi3jogv7nQ+2/gyRfEI1l456m9XX358OOON8/ZtcRpQoDSipUrG4N2goqTbe1
	wO6WdvqfAFiA4Ez9c6Q/Tbp1dYJBavhjY/3Ogivt7wLJsG19ganu4rwHOZGIGQPbPZILmThwBeptb
	ZJLl1DczL309T811ArcWsSKqQ90ahREEG/P69sbFvT868kZhN7i8WRDTACQ88vKZNDEviElgOTF7l
	VT3aaheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlbE-00000001rNR-0Ksv;
	Thu, 09 Jul 2026 10:03:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlb8-00000001rMB-44c3;
	Thu, 09 Jul 2026 10:03:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DD1F600C3;
	Thu,  9 Jul 2026 10:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E731C1F000E9;
	Thu,  9 Jul 2026 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783591393;
	bh=+ak7g+bnNvjs6BgBEr/Bs7DjjcW1VaCyUfDXvUXZ24I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gbAbOtT3xXk/mcJ1eT0tQ/7wTMH+HHidCthinZFuF3zrSj6VpvqufBIjNyy9WdhAb
	 iXzvhaQZT0jUbVwaBDmQjSY0uw7WRKsLuAuN6zNSfBks8I9jTszW8LBQPKMLgNwl9N
	 2icoPJfvY1GX+9ejjz7LAV9bnkUnRhLJ2u+v76Sb5dGdp4iMqMudghZdRDXMSNi3iW
	 ttqmCKfFDH3pKqRy67YcIy1H1kaCh8ZA/R/Dt/K4R3ivi4aYKVyx0JRQBU9YbXskog
	 bkxfi5V3N1ohep4Cg6imr9Uc3pGgloh4rsV6NBuLw25Z6lX9IZ/PRw2VbyILse1DhH
	 6ATkVUShF/UWg==
Date: Thu, 9 Jul 2026 11:03:08 +0100
From: Lee Jones <lee@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v4 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Message-ID: <20260709100308.GD2045740@google.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
 <20260623-mt6323-adc-v4-3-299680ad3194@protonmail.com>
 <20260708211056.GB1727174@google.com>
 <UV1EGIwox4bkh8ufCFb4GS_Pafo8bovmSI9jzRbQunz7AzjHnmItA-lLCPeeIxOLMoS3douarVEpoTF7DVffFJUcXZTdGTQ6-dfAYdomwak=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <UV1EGIwox4bkh8ufCFb4GS_Pafo8bovmSI9jzRbQunz7AzjHnmItA-lLCPeeIxOLMoS3douarVEpoTF7DVffFJUcXZTdGTQ6-dfAYdomwak=@protonmail.com>
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

On Thu, 09 Jul 2026, Roman Vivchar wrote:

> Hi Lee,
> 
> +Jonathan
> 
> On Thursday, July 9th, 2026 at 12:11 AM, Lee Jones <lee@kernel.org> wrote:
> 
> > On Tue, 23 Jun 2026, Roman Vivchar via B4 Relay wrote:
> > 
> > > From: Roman Vivchar <rva333@protonmail.com>
> > >
> > > The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
> > > devices array to allow the corresponding driver to probe using compatible
> > > string.
> > >
> > > Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> > > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > > ---
> > >  drivers/mfd/mt6397-core.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > 
> > Doesn't apply.  Please rebase and resent with my:
> > 
> > Acked-by: Lee Jones <lee@kernel.org>
> 
> There's a slight cross-tree conflict. Jonathan has already picked
> patch 1 and patch 2 to the iio testing tree. This mfd patch doesn't
> apply because recently merged mt6323 efuse patch (bde6556744888).
> 
> The iio tree doesn't include mt6323 efuse patch, and there was some
> dt-bindings merge conflict.
> Should I rebase on top of linux-next and send mfd as a standalone patch?

No cross-tree conflict.

It doesn't apply because MFD has one of your earlier patches:

  bde655674488 ("mfd: mt6397-core: Add mt6323 EFUSE support")

Rebase onto either Next or for-mfd-next.

-- 
Lee Jones

