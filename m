Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7D7C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZZahkEZsCL+PKrtdWoz/s9J6Xm9ti56DGFksMB3RZ0=; b=LXLp5BBELRosZU/R8tjyQ/95tF
	s4QK+DWBVOIMuBUqS27eSHjLKzCadI+JV4KoYPR3/biqd9+XxabalxSHo/v9zjDULBOJtfSCxBYmt
	Fc/PrNnpYb3N3sg2jx4xjkBgRgh6lAZonOT6CelIhSUWPXJLg8w9CncxQuRbYykVMOcy+iZFO1GSi
	dWOq4bBQPdsHBK2g7DcRsUA/6jPG+c7tPeD3290/Z6XqnPF4MMcN5vHRFDW8KFRohHnJyFixSsA8D
	LfPF428Fz04Jyx+mE0YiNUvKtf5zQe3ad/W6MJ3GqTCJwV30og1EeGVVvaMVGmgcj7T46LpVOix/p
	04tXNX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YWb-00000007pgm-3aZF;
	Tue, 15 Sep 2026 19:09:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YWa-00000007pgU-2Jwq;
	Tue, 15 Sep 2026 19:09:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 108F9433D9;
	Tue, 15 Sep 2026 19:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D991F000FF;
	Tue, 15 Sep 2026 19:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499339;
	bh=VZZahkEZsCL+PKrtdWoz/s9J6Xm9ti56DGFksMB3RZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jcXIQ846u0hD7cbVyrKnMTnF0o+5Smg3LWqn7qScZs0K5FP3b7hrYW5iyPz6/hHy8
	 pIGA5/OO8CSjXbGF5KVCIJo/TqDy0Pb8Gv9n8dMn2nSOnpbJjUqi4kmO3VvuXhCniG
	 Ok6H9QNm/qdFKYX8jVMaZHL6sAk9Afa2AYVzXXjPce3Nf5jn6F/PfWA7IzDGu0IN2x
	 GXYpnHU5l/6R2wZ7Agfw3267vwFTiBvNXutn5JonSgsLEU39ICjePxlgKJSoPSWBur
	 khQzwDROQ+E6PmicA6lByW9Jmh0ehelZPIGPD4iZVhp4PAxe1aX2g4KPN9BOb3/9s6
	 42VYlluwxsC6w==
Date: Tue, 15 Sep 2026 14:08:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jitao shi <jitao.shi@mediatek.com>, Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the
 compatibles for mt7623-mt8167
Message-ID: <178949933645.3018579.8198387236458743112.robh@kernel.org>
References: <20260908184125.10916-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908184125.10916-1-l.scorcia@gmail.com>
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


On Tue, 08 Sep 2026 20:41:05 +0200, Luca Leonardo Scorcia wrote:
> The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
> mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
> mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
> them as separate entries. Correct the binding by adding the correct
> fallback.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
> mt7623n-bananapi-bpi-r2.dts:
> 
> i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
>   ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long
> 
>  .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Applied, thanks!


