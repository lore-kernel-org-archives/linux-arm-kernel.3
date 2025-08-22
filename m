Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584DFCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNMRQSVGtpbE9DQVQ/0SgNV9o3SjxzyOiIQeuU61MhE=; b=iOOfA8q0NXGWjzTr7s6PNQymD7
	bvBOqoqz/BengVvzUBqswcNrXIwVdWt0LpSxEltIJ/qjNFcs71ULyIaUW7sHT36/cs+lErzqSRob1
	Nw2SwC+07qxpgs+QT+4Mbl2+YL8Mq30tQQxSB2gGx8JqeXQm74KHO197Pr/wANw5z0YDOIAECV9dm
	eSopvbeXwteypxJl1/YfbWvRMVgYGHQU05VDTSHuX78cfQknfq/x6f+FqinJZBcVM1K1iDpz8d8x2
	lR2aKECNbHEYhoxVY6OxS1kvS4ZSn/H3YHgsrMjZFzVOYaJisr2KjVsfIMGM8bEwK0j6vJ38p5nIE
	6iUUOMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrd-000000046vc-44po;
	Sat, 23 Aug 2025 06:36:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTWQ-00000002z9D-06p4;
	Fri, 22 Aug 2025 15:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C0A260203;
	Fri, 22 Aug 2025 15:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE912C4CEED;
	Fri, 22 Aug 2025 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875860;
	bh=XdRY7HKsACkQeqSKAyGk2v2Vlf2LTnVd6fqMdVcahtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeX8kKa/dZgcRh5rVfaqoe1CC8NN0aLGou2XiuH7yWo6zZoT0QIhl5aMWgudGWbFY
	 PPJfl4qu/m+btSrUwCgNWzdEyti9DSk+4yNowmd5ObzKp71SEHpVRe1OG/T15oBtg8
	 9AN3tUi+2Dlzatpa4sax+YkIVrb7+SqyD5H2awAnfF1PN1l3gHGmcimjHYyWWl0XLS
	 KDwELS31Lh0WKfWDKLUMyqgWU4sIpyzrjgQzSw4ldlERimgWAAjaK0Yyi7mXII7kK2
	 bMuRspo3WJffjr3/yeEtypJUPrix/S0g2/97MTyC+C1McOGFXza9L3Cz4L8nB3UHw8
	 +rd3s0ZGFUt4Q==
Date: Fri, 22 Aug 2025 10:17:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, matthias.bgg@gmail.com, krzk+dt@kernel.org,
	louisalexis.eyraud@collabora.com, minghsiu.tsai@mediatek.com,
	dmitry.torokhov@gmail.com, support.opensource@diasemi.com,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	edumazet@google.com, kuba@kernel.org, jeesw@melfas.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, andrew-ct.chen@mediatek.com,
	linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
	davem@davemloft.net, mripard@kernel.org, ck.hu@mediatek.com,
	maarten.lankhorst@linux.intel.com, linus.walleij@linaro.org,
	yunfei.dong@mediatek.com, houlong.wei@mediatek.com,
	p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
	tzimmermann@suse.de, chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
	simona@ffwll.ch, linux-mediatek@lists.infradead.org,
	jmassot@collabora.com, linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, amergnat@baylibre.com,
	broonie@kernel.org, sean.wang@kernel.org,
	linux-media@vger.kernel.org, tiffany.lin@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com, pabeni@redhat.com,
	flora.fu@mediatek.com, andrew+netdev@lunn.ch, mchehab@kernel.org
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
Message-ID: <175587585960.3825744.17420648666303158652.robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-10-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
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


On Wed, 20 Aug 2025 14:12:57 -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


