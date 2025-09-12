Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3GCPhCikDSUGnoAadyUM/g7Z75+Q0e4AIPmm0nIgWw=; b=HgOs0lfxJ0GIjIWyDn8/y0DQlp
	vNWiLncoZ4Wo9nzPbneyedVBzqX0fdVxWa/EhPzvUVZfBHu1d2oiRPBrtIIyALE//7dljM+9Dsy9X
	Gdn7+VaNk8uHlEXPW18i+3OTGuF5/yhOchPaejHBhyF6kThHJsZlkFX3fPs2PvHY6F35zkv+AbIR9
	BfhCugSr6GMfAejJrwmb38mNKN0ytYFei/IKkmkRhahBQqLMpSYzOHH6dcJLL1BRFtoNPpIoPtuak
	35xHpeViyhpVpUOmIGAi5mX0ilQVXRO1Y4DhPoTKdsYvk7c+7P4nBdXkYevnrya83ft+apalJMr7R
	e+EB48qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Pv-00000009k2n-0CYN;
	Fri, 12 Sep 2025 14:06:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Ps-00000009k1n-3f1Z;
	Fri, 12 Sep 2025 14:06:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 087D543BA8;
	Fri, 12 Sep 2025 14:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BA2C4CEF1;
	Fri, 12 Sep 2025 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757685979;
	bh=gQYcfi405JQ9buqQxkTP7o9NnD/8vJsE/3UdfYC31Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzznp34s7YFwrDjEEJkZ6iekjTLnPUhXzJLoPxBZyYG7N5CYK4W0PMCRqN5AARwKl
	 VymP7CBqTch6oU3Dxu+8CbAWzZ0kIqydRCrxLBhWWMw1bhQ7Z0t2YuRuWT8PhZMYIS
	 Kfz1cNTv0+6uUTVt0rhcsIvu+8XBwwvlvJbDRBPtUXZi6WaKHo+fJ4EgKll7QJ1KOo
	 UF6gaG8l5++/aG16KdKtx01G+jonZrF4pNSs9q4TWqU3ki3ZkruTpdg/M5gSykWMLS
	 gn47pNV+L6Wki7pJ42z98l/YWp8hyHWCGWhDKKhEbjU7tW/W+1B318r/PjuvYKi3cx
	 6YB8Oj981CRLQ==
Date: Fri, 12 Sep 2025 09:06:19 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
	dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
	jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
Message-ID: <20250912140619.GA1293647-robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-4-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_070620_929928_EF1A8C4F 
X-CRM114-Status: GOOD (  10.23  )
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

On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a DT schema.
> 
> While here:
> 
> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>   schema definition as these are currently documented in file [0].
> * DT binding users are updated to use bluetooth generic name
>   recommendation.
> 
> [0] Documentation/devicetree/bindings/net/btusb.txt
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>  .../devicetree/bindings/net/btusb.txt         |  2 +-
>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------

>  .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>  .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-

.dts files should be separate patches. Please send the bindings patches 
separately per subsystem so subsystem maintainers can apply them. All 
the Mediatek dts changes can be 1 series.

The schema looks good.

Rob

