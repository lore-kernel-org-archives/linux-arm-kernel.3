Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D44CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX8AXiqzk9UzfJ/QXXVaTYJdzpXeRO7RDfiv6gtOnVk=; b=zTpgDTNs4ivys8iW3DrJMry+7a
	3eituozao6fY4D3eqAUxHbkZHnlQvd7A8TfXmu2rowiPXnsz7ZO+CzjDWls0wDyOUfzY+rWUlacAg
	nx5IPIOj4s25AUEpkcqDw8Cbe8NpVRNj1OC+N+nVOKzZMjJxY6O6u5HG2DjWJNni8d4sm8ZKOIh1H
	byJ3HB4PhClhmyCjSHFg142nRAE/fieZoxKVr1mwLvrlVoQ/QZoXS1iLB2sscMAYP/kUDsbGr/6N2
	6L/6iao+2Jde2y1Y4Bpn9xSy93bXgoqHSC65aD8iOgI0FiKx7c+rK0Ju2tXPZmPoe14sP/csTQE2i
	WOGRpv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhf-00000000EHu-2YBb;
	Thu, 21 Aug 2025 19:12:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5Hj-0000000H2tM-0GHY;
	Thu, 21 Aug 2025 13:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04044A58385;
	Thu, 21 Aug 2025 13:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFE2C4CEEB;
	Thu, 21 Aug 2025 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755782693;
	bh=76ReIJtXJzBwzWrjJa65Ko+8l//Yi0hjkZIdqxBBBC4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RnBgB5CTZ17kmiwkBbDAExo7pQlNQ7peebeeq092niVb2vM+IwmJxsaCAvlOS3f1A
	 1KXPgaHqN2qA+FxKYuTun7TaAYGIOyMoiJwznaRPhIPEf4jTowAINPvQa5U5Y/q2cm
	 31QZA8P9XHmdskehrqJbo59m7Mlp3EwsKBWt55rxDk06koyNoMi+dS8TV3XLfBuySg
	 BUN7JtkuVLrS9PAtC2+onlSRb59amhYyTZUBKjLNryTjslMPmnQOlFeQij1/xLGXTP
	 g87wdPfMA2peIEu6ojeGdw+oPlXqMg0JJ2c5MCSOLr2n2eQ+fqaYHiBWU7p3uiloB5
	 8ovoQJMVlfSvA==
Date: Thu, 21 Aug 2025 08:24:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: flora.fu@mediatek.com, chunkuang.hu@kernel.org, broonie@kernel.org, 
 linux-gpio@vger.kernel.org, mripard@kernel.org, 
 louisalexis.eyraud@collabora.com, mchehab@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, 
 conor+dt@kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, amergnat@baylibre.com, 
 netdev@vger.kernel.org, tiffany.lin@mediatek.com, 
 linux-input@vger.kernel.org, airlied@gmail.com, linux-clk@vger.kernel.org, 
 jeesw@melfas.com, yunfei.dong@mediatek.com, linus.walleij@linaro.org, 
 sean.wang@kernel.org, linux-media@vger.kernel.org, 
 linux-sound@vger.kernel.org, tzimmermann@suse.de, 
 andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, simona@ffwll.ch, 
 kuba@kernel.org, jmassot@collabora.com, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, 
 angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch, 
 support.opensource@diasemi.com, maarten.lankhorst@linux.intel.com, 
 ck.hu@mediatek.com, matthias.bgg@gmail.com, pabeni@redhat.com, 
 p.zabel@pengutronix.de, edumazet@google.com, krzk+dt@kernel.org, 
 davem@davemloft.net, dri-devel@lists.freedesktop.org
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-5-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-5-ariel.dalessandro@collabora.com>
Message-Id: <175578240744.3438740.13033328475024605529.robh@kernel.org>
Subject: Re: [PATCH v1 04/14] net: dt-bindings: Convert Marvell 8897/8997
 bindings to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_062455_227416_6A33F872 
X-CRM114-Status: GOOD (  12.20  )
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


On Wed, 20 Aug 2025 14:12:52 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a YAML schema.
> 
> While here, bindings for "usb1286,204e" (USB interface) are dropped from
> the YAML definition as these are currently documented in file:
> 
> - Documentation/devicetree/bindings/net/btusb.txt
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/net/marvell,sd8897-bt.yaml       | 91 +++++++++++++++++++
>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------
>  2 files changed, 91 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml: marvell,wakeup-gap-ms: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/marvell,sd8897-bt.example.dtb: bluetooth@2 (marvell,sd8897-bt): marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/net/btusb.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
Documentation/devicetree/bindings/net/btusb.txt: Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250820171302.324142-5-ariel.dalessandro@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


