Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6592BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2TcYXt8Ag6RzQrKrL1HEy/TDqYfzmTFebV6fjF1w74=; b=u698RCaXHJeM1MwNpsY1F0NYFB
	RXX3UdvFe9go6Nr1TmdFULZstITDcOUAlZkkHablRgF+E9lz/JiX/3lcYpt1Ef9jUR+E/uFup68gL
	EMWGzuVWhsauiVAZiz2y08zNqssm+GGG/TAR/mUSWraWqSv6elgO7x4nZRP9tDaTA69H7njTSw6al
	j96p8LntgfmS2d3PC9aMx5FRXhh6miiLhpj0qKXyK/QSAf3Tspah5M6St6XrO4F1XDYjEnvhMEUdk
	5fVLUeEJpQ8tdjVF1EJs+qu4U+RILeW2dwS+LIWhgC8JMm04A2RQJCCBYNw2xCuI2As42/ILStzyc
	l6ImAy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCr4-00000005FtX-2YQn;
	Mon, 15 Sep 2025 17:19:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqx-00000005Fmv-3QYl;
	Mon, 15 Sep 2025 17:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71DD04039D;
	Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D2FC4CEF1;
	Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956739;
	bh=echBK1j+X18njnYEmIigVCWTPbyp+OCXowD7iTEllfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IE48EwGK3IiFjChHMY8WDepEbhLCtNxnYU/5z69sMcEgP7bXPN0cqBnteEiF8K4wz
	 BDuAS8CAefnVdeOjVD221KnpxDk/F0LjOH6qcKQWQJG47odmA0WmwHnSCVre/ZLl6L
	 zVzS+g2T8rF+z/6cNHOBtIbOh8J+0KdUAvwDgAFChv7sM3e6KAmp2O8D1X/hkC2k6l
	 aWTpA49ruDg8QSVkTHqFtiDRf0CjQK0eS2GsoHAD0SyLtQ0pxwhoMX6nTMlLWiuHmK
	 oAKrC/RF+A0eeLwt/qbnL2I7MmyKjt0xGF8YNIIVcrl2hxWOfGG/6RIeiVz12BpOTh
	 dEA+cAoc3xBLg==
Date: Mon, 15 Sep 2025 12:18:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: louisalexis.eyraud@collabora.com,
	angelogioacchino.delregno@collabora.com,
	support.opensource@diasemi.com, tzimmermann@suse.de,
	sean.wang@kernel.org, maarten.lankhorst@linux.intel.com,
	luiz.dentz@gmail.com, krzk+dt@kernel.org, kuba@kernel.org,
	linux-bluetooth@vger.kernel.org, p.zabel@pengutronix.de,
	jeesw@melfas.com, andrew+netdev@lunn.ch, houlong.wei@mediatek.com,
	linux-rockchip@lists.infradead.org, mripard@kernel.org,
	linux-input@vger.kernel.org, tiffany.lin@mediatek.com,
	amergnat@baylibre.com, linus.walleij@linaro.org,
	andrew-ct.chen@mediatek.com, marcel@holtmann.org,
	lgirdwood@gmail.com, heiko@sntech.de, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, dmitry.torokhov@gmail.com,
	airlied@gmail.com, linux-mediatek@lists.infradead.org,
	chunkuang.hu@kernel.org, flora.fu@mediatek.com,
	devicetree@vger.kernel.org, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	simona@ffwll.ch, netdev@vger.kernel.org, edumazet@google.com,
	yunfei.dong@mediatek.com, linux-gpio@vger.kernel.org,
	minghsiu.tsai@mediatek.com, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, broonie@kernel.org, mchehab@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/12] dt-bindings: pinctrl: mt65xx: Allow
 gpio-line-names
Message-ID: <175795673768.2952954.14700429990661884718.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-9-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-9-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101902_045088_577B7873 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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


On Thu, 11 Sep 2025 12:09:57 -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


