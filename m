Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26282C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 20:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6UdB5rmZTqPCaXlZY8UC52PNm1OSvnR/r6zoqJnbYo=; b=gmObXKqjHmddsKDfh1RodZd70z
	werZYzn9HCVdlRW6SKRKxMXB2iSF6PlTU3EJqOzwuHWya9ayhZibb2mlgUnQ8XvnLEYG8fgViV2yK
	t+8VldJ+dRkJYNFpKhdwfe3yZrrOK7fMkBO/9wdRhBiI/ZU0d5yCki0k2ZE0kUuAdpArJ0jnQcThj
	//buS6iCV9rN0PN3JWOBfmjcOCSXoMJIoWQNgSpq0I4yf9z9qNIiGjQgwtFcjzP4GRk+pjyRml4lB
	jrpnhiwwBQKYE5qGyCakhTXeoCGL45sR3iAyW6jIkpEY4M7zOwGgDtvIkLXykinypoC/ZRDZ84ani
	GpeMye0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug85j-0000000DDJ3-417J;
	Sun, 27 Jul 2025 20:35:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7yC-0000000DCYn-2pl4;
	Sun, 27 Jul 2025 20:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B0FA456C0;
	Sun, 27 Jul 2025 20:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E84C4CEEB;
	Sun, 27 Jul 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753648064;
	bh=5nZ81Q45zXBq38DZEfLN0BWGpMbT08thVZb065qc1X8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YP1Un8UtCBFJ9dp5dotJeSuxHo5OFLd27K0ScDaM7nqp1oKN+MoQPRMjBPhDGxG+x
	 PAE0F6yuH8AoA9u8WC3RNs39MHUq70tVg8ra0Uv92OgVGz0zocRVrsEBIL7gr22HBZ
	 IRhCjCQfVR/BeP5nqZtaSUb5MEkF+6Srw+a4xLDc1gNzoPfMUuiSuSU3Qdo2HvXTQI
	 TMPBLGgB3gKP3D+S5Ra5LId4d+1Fxfq+x9v1/tVGNL/9WDR3y3OjjmjjZb95ZqN1QE
	 i3614ekCAQ/L9r0a6Zc7AI1Jz23koPmFfcEKvmpF6RkfIktLkp0u00qlAEdrQNjtJW
	 TES2XQFgaF00g==
Date: Sun, 27 Jul 2025 15:27:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 linux-kernel@vger.kernel.org, CK Hu <ck.hu@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-7-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-7-jay.liu@mediatek.com>
Message-Id: <175364805847.3206.14487659451507375281.robh@kernel.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: display: mediatek: dither: Add
 support for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_132744_733061_F8E28C5C 
X-CRM114-Status: GOOD (  11.69  )
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


On Sun, 27 Jul 2025 15:15:56 +0800, Jay Liu wrote:
> Add a compatible string for the DITHER IP found in the MT8196 SoC.
> Each DITHER IP of this SoC is fully compatible with the ones found
> in MT8183.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250727071609.26037-7-jay.liu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


