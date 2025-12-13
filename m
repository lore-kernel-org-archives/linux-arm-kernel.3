Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07F1D5B15D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzmSrFHYws3seI5++T73Umsv6HmE9smzNN7qciehKN0=; b=GjlZY10QugzoPO94cjD83ndnrQ
	eetBBEpwOLJXSDHI7p6sz0WSyVjdwgMiLL0JtGKKt3N63j4EpPLaVEkI0kSniqxCc0amsvnmncb+X
	RXwD5Lg1A75XQmNgO1W0gpjXaWoK0EkeBdstjfu5s7/xplfhrwwZ758QhoUd3hZEbvl5PoL72o0Ts
	TGiZ9wJbnmFBAs9cquvpt7vJUZdLUkI/eEKlUkW67TdQKmA1DBi24GVS81U53Dp9TgWhcJ86jGACI
	/M8cLD6425AbuzHPu4cYAcPgOaAWK+JdOKj3RlnDeSs5LU3DcGdM/W4lkAcjyKz429QfA/MfTAsYJ
	ddfvbtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUSya-00000001mhc-2ZMd;
	Sat, 13 Dec 2025 17:00:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUSyY-00000001mh1-1wTs;
	Sat, 13 Dec 2025 17:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3A15442A2;
	Sat, 13 Dec 2025 17:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96631C4CEF7;
	Sat, 13 Dec 2025 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765645207;
	bh=VzKBYcoy1QLzHCut6+iKlDtsmmJak9U5g55kExj/JFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RwzsPYFWZct3fYDaSoH2MO8Pr6OmUerebApwD55CqIDmIjhoGYii118YuorwNlvqq
	 ScAULQd/58dFFaqTTbGQluGmGyWmjP197/lR0mEIj9eB+4T931oqm6bV+zZ3Dtp3UB
	 /3rEA58xa9OtbeLC8Sdoct2UoObIYuhaP3mRahKBMFr5MyUfu8A/UkiQKKb0hJJ052
	 XpUK03v0ZQVQ46uHO5Tv0MUUttfEsK/oQCNHvdjrmUt7X7j38m0kpVAalfiSZ9oRUU
	 sWgR/3U8XMRryBhIuoNjoTDFmxZ+oM6dTz94zalzS6WErXPW7Vhg3NOCfVaTboJchh
	 qJxB4vBT3+yhg==
Date: Sat, 13 Dec 2025 16:59:49 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin
 <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove unused includes
Message-ID: <20251213165949.4b51f7cb@jic23-huawei>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
References: <20251212231203.727227-1-robh@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_090010_581316_117DA49D 
X-CRM114-Status: UNSURE (   9.15  )
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

On Fri, 12 Dec 2025 17:11:52 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Remove includes which are not referenced by either DTS files or drivers.
> 
> There's a few more which are new, so they are excluded for now.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> #for-iio

Ideally we'll get a QC ack on those as well.

Jonathan
>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --

