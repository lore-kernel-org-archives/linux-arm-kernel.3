Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCCFC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koc31sD8jNUGY12YBBneZjOQV63HfvgiWXOvYIpvhlY=; b=S+Fe3Xrf3pqBrDxj8YIPqwTShy
	19l+/P6N9G287EvuSfgM4CHeTFtQa7Urq5vdegS8yvEs3gW0afNB+5ODDtKKKhTDu6MCiQicBFStw
	ymzyiwcJweiSMoN6lUsffvEN2fd6WI+rc/gqMToB+R1apjz9mgPOIuFa42cx4+sFobOQrsgmUT6zG
	fe4VO3zrWswkrriChU0mPcxTGloVsu6nKUrv76TVL2tkPWqq9VZNwb6B+gNLC8LUtQ9yv2Xr3MvC0
	fRbiyjhDF2czSVv26Wyw2y1gK7PUvcwunC0LibRjR6b6FUXcAb/7aiT2D0k5If6fvqF/9I7cpJNCX
	pw+yeQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jr1-0000000C5FG-3tEd;
	Wed, 09 Sep 2026 15:04:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jr0-0000000C5Ew-3osV;
	Wed, 09 Sep 2026 15:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30E136020C;
	Wed,  9 Sep 2026 15:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B80F1F00A3A;
	Wed,  9 Sep 2026 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966288;
	bh=koc31sD8jNUGY12YBBneZjOQV63HfvgiWXOvYIpvhlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cVuUiYF81lvPxLrEo/jB4FHWll11l3fZla6GDDprhdn944gmL8El2xxvjAVcXqhR7
	 hfO0yUEp3xeP5ec6UV3BAY9oILoz9qPNPU7vC6eF/NBNVjfjGfFBq8afm0G+PSrPUm
	 diANVBgVxP3uHB3A4FAQKGp9GD+7PeGEsA1041CAKu7JtwOqchVvCUE3X8Cq9IuIJh
	 4TKKrS0jxJBU6BrKxKtyMEVj3YgW92YV5YT7rIIGc8Hj6gjSvzLjg7NyitcyljnB5+
	 P7b/IggMPQXEepA8h13KMnb8diVXOv6+wxxp+nCqyzCDSFCSZ6auJWmwZ+0m9Y4lEY
	 WxSRIcwBp+H4Q==
Date: Wed, 9 Sep 2026 17:04:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de, 
	chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 1/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc
 divisor overflow
Message-ID: <wdvdeeoo3lpru5266r4sjjaj5s5cbvdjzkjw3vncvltu5vpw2q@rv6h7dzibzsv>
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701121936.19407-2-angelogioacchino.delregno@collabora.com>
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

On Wed, Jul 01, 2026 at 02:19:35PM +0200, AngeloGioacchino Del Regno wrote:
> When trying to calculate a PLL rate for target display resolutions
> above 2560x1440, 24bpp, 30Hz, the pixel clock value will be more
> than 32-bits long but the division to finally calculate the digital
> clock divider is being done with div_u64(), which expects a 32bit
> unsigned divisor.
> 
> Fix the overflow by using div64_u64() instead.
> 
> Fixes: 9d9ff3d2a4a5 ("phy: mediatek: hdmi: mt8195: fix wrong pll calculus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

