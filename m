Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F89CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1L8jykox/avQocIULNmCLTZ8y9+zM/0S8Z42jWufDM=; b=nZtyclolprDu1U/blBp4OKA1pC
	NDSJ4vbv4+8LfPxL8uy1t3t1efwPEXr4AeWOnbEVMc3VNAMwKxzNeoDRig14/lvVTKwU7WDmtynZC
	OpEetSf/7vixZtGxgBOj5HV37X56sBQyJL+xwbTarIkkvXZI4ObXKSrtWUFmD+bHiM3be6e8dyEIA
	wmxTSX2zFE4FSbhsIFIXgdXSvOLURt0l+kjCPASG8w/tX5bteyRowL2rnZfQ0ZghOeiROpv3JrGRi
	i7V3DnzxgA6JzedaIYbepsIjJ50xulT6jGBr/uB8VfIZ9Pmv99MWSyeNyEAbztCWEaEpZNkmRGfyr
	19SyF0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6Gr-00000000xc0-3gPI;
	Tue, 06 Oct 2026 14:35:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6Gq-00000000xbp-1qhN;
	Tue, 06 Oct 2026 14:35:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B2C06022C;
	Tue,  6 Oct 2026 14:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DCC1F0089B;
	Tue,  6 Oct 2026 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791297355;
	bh=U1L8jykox/avQocIULNmCLTZ8y9+zM/0S8Z42jWufDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvXdGDK1YwBTmfBMPwEf8IFYL007+JRcPJuME3P2Nita0OLXh/mfsdPULxUMPb5kg
	 mS7as+zUWe+7e+Yp8opbOXi0KstRi60uJybcaGLDsDYa9B0axaxKI89Ebezd4SUhYz
	 Z4TZ86oCLJBOEl95dp6dGye62RFqhdvbOWBXcSM1waI/obfEqL0Q2w5B/dNrf7GBuI
	 k6L1cJQMuwIcViz0XrniedgIFkosG2Ae0q4zq9Qqfc1qY8xY0qvAwW9aC/IdSi3F+k
	 2PzmYlch3jT089e1FhbWE47ty9r9pYjMAEwpenMfzUUs0uUv8c/TQKYC4xIDpVii9j
	 vQCzlmbsnR3tQ==
Date: Tue, 6 Oct 2026 09:35:54 -0500
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Irui Wang <irui.wang@mediatek.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Fan Wu <fanwu01@zju.edu.cn>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 08/14] Add the MT8196 compatible string to the
 MediaTek vcodec subdev decoder binding.
Message-ID: <20261006143554.GA2123458-robh@kernel.org>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-9-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923024258.257846-9-kyrie.wu@mediatek.com>
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

On Wed, Sep 23, 2026 at 10:42:51AM +0800, Kyrie Wu wrote:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.

Please fix your subject.

> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 50 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index d1d209cbb..618be8c52 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
>  
>    reg:
>      minItems: 1
> @@ -96,6 +97,12 @@ properties:
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
>  
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|'

> +      The node of video companion processor (VCP), using
> +      the remoteproc & rpmsg framework.

Please say what the VCP provides, not the Linux subsystem it uses.

Rob

