Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1ACF6BF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQifOywefjoU4gXCBftnLl1F1+ByHJEmRLoM7kBhwr4=; b=iJ8myRngbWq0Wu3JL58PDB5iDB
	amxEQYSLWUytn831+5v2tRF/TS4IKyHNPzVwjBjlitNH/aEGHqMggerCJzQS25gpim01d2U1Rcqhe
	zQWQu0M3Nb75WSZLLu6Mg791TYVr9xbGBcw4qfZd2H/lTLfsnLf4bx94qJU9T1OlLYJhOQ6FFHGHk
	5FpSUceTKKiUk7PrWU65XkowKBfX4F3A9ZfuVikv8/KS3RwJr5XhwcYTV4/IIrcrKymcjFAP2OgDJ
	KMtMLnYeVf9uisLDAbBeQ3fjaf5v8aNzqyGnJJgIuiubqaGMprqmj8eVlhMwlnMed06v+Xzf/cTe3
	0/m/+3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOMP-0000000EKO3-0yId;
	Wed, 07 Jan 2026 07:53:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOMO-0000000EKNm-1bAD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF0AE60007;
	Wed,  7 Jan 2026 07:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ACCC4CEF7;
	Wed,  7 Jan 2026 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767772418;
	bh=9eNqAcghF7tdAA/uOmVCKek4FSJK0Zrf0oL0B3duEBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afnPrEGFvVIadMcNUTUWGGnLzqSlm3aYmVcEzgMSZfp3lvcYiSLEOKVX+rMvzyMa7
	 JGfHxFw71fhruvsnL8abYgCZlL6GbsK4hMStDJOU6I6QYiTmhiEe46RwiT/HXqaPsc
	 oHcu4PtOwNzl9t6AV62Aqcz1ahl77a8xioIlr/RdhvDnpSwyvY0hJ4iMvI9EMj6aIJ
	 hx16kke+fO1rSfTQu4/cSXWS5pDmT2fNkrOOBfRm8plI1H+wfe76RR2BKqBSXfdkqk
	 5iDr5yNtwR/wHcxZYVT8NVA+h0iSkIOb0hitquarBOlpD1mPB7daMl5W4kum22G4gQ
	 30bStwyDUPoqw==
Date: Wed, 7 Jan 2026 08:53:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 01/22] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20260107-elegant-utopian-kangaroo-cdb0cd@quoll>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
 <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>
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

On Tue, Jan 06, 2026 at 06:42:17PM +0100, Kory Maincent (TI.com) wrote:
> Convert the device tree binding documentation for tilcdc
> from plain text to DT binding schema.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> Change in v3:
> - Rename binding file to ti,am33xx-tilcdc.yaml.
> - Use generic node name and drop unused label.
> ---
>  .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++++++++++++++++++
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 -----------------
>  2 files changed, 100 insertions(+), 82 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


