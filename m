Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C792BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJZOALxYGmIAsbwOsqPhTE5RLkystQf+5Muchsun5ms=; b=tecMVmJZtYFNCm1nUsQvFmGGnb
	e28Nty5jYAglt2TixM0/XB8I+2wYnnNt+8W9IucOQyr6XbW30+mp3MowJUux5TmFgfcI67nQL1t2b
	8MsG6vnMgxa61MM/q6ZJwvBSca2Z2IXtq+yfXkALKpYDC9akKxSLhY86ZPTrFGxu9WgScrqb2xlUC
	1ezn3CY7Zk7eooe7R+X/P3KZUj/hFeFEaM6uOE9uCiLqXm3ZYNPcObjMbTxGkMezSkebGYrnF3Qbb
	TB5KliYpRBPPoChHZTvzUmd4VBeZQ9je8iAWaOmEOYxSIUdA6TKNlgca5o4P34pky+PU+RVW2bqeu
	Wqh8ptRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosly-0000000FGFC-38no;
	Thu, 21 Aug 2025 00:03:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonxo-0000000Eils-0EKT;
	Wed, 20 Aug 2025 18:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED15B601D7;
	Wed, 20 Aug 2025 18:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD47C4CEE7;
	Wed, 20 Aug 2025 18:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716109;
	bh=KrxBI4bw6u84H4zKkUEDYwKmV2iNFMyZmZhqsrfdtV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CozULjtI87ezxw30qO0tiBXmd/B+a0DtFD8O0r1Ijt8QQQx8BThbtwW8QWNFZ8zwn
	 GDhVSyvd/eTXNDvmuoKLP8gZbzIqwAavVeNAJTL9AD4T+oq9JD211sXJ3A9jIHdBe9
	 oby2P2YVBQ3I8r9mQM/Lwt2RVdfRe2sGJcP/c1x3u1vg+xkh+l09/RNCiQufnL+vjh
	 GyhWNZepnUHlVO7AOBcuUpAEM08nIs4SZGmNIG29XplZsZ5MYKbpImtIHpbPRBy/n6
	 J3D2v1i3GLEYxCZCXE+oRmNdlWlQrHy63msQ03IsVrcWk7mI62sGbw7/ZkfMSJmtPd
	 X3jYiXs/0WZXQ==
Date: Wed, 20 Aug 2025 13:55:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 14/14] dt-bindings: media: mediatek,jpeg: Fix jpeg
 encoder/decoder ranges
Message-ID: <20250820185508.GA273751-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-15-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-15-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:13:02PM -0300, Ariel D'Alessandro wrote:
> Commit 14176e94bb35d ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg

That commit is not in any upstream tree.

> enc/decoder nodes") redefined jpeg encoder/decoder children node ranges.
> Update the related device tree binding yaml definition to match
> mediatek/mt8195.dtsi, as this is currently the only one using it.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 31 ++++++++++---------
>  .../media/mediatek,mt8195-jpegenc.yaml        | 15 ++++-----
>  2 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index e5448c60e3eb5..b1f3df258dc87 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -36,7 +36,7 @@ properties:
>  
>  # Required child node:
>  patternProperties:
> -  "^jpgdec@[0-9a-f]+$":
> +  "^jpgdec@[0-9],[0-9a-f]+$":

This is wrong unless 0-9 is a separate, distinct address (like a chip 
select #).

Rob


