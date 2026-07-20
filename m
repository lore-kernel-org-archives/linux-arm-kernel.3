Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79CC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgEbuRaZ7fC8I4l3wHHvaMm3ff8vOKykqDqNHrxX4ow=; b=hmGfpcYfYlqNT+9LfcYo+wSA/h
	z542T+19zI5aUIGQd2Abani9OYEo7z2NuBDiOIgxj/JCsBXuC4l20eKFRJaOvA2r9UYjcffDIKVKs
	jK/hvX2ySu5nMcK7zk/ghgF9PdHXKIaa9yGYtyXwtbl5mZqzuUxPafiAFzq4GNXt43DsFXArvBcdn
	NTrcUy8No0T4UjUHoZ0weA1P/i8K4YWJxPyuTpii5Z5t0ngs95oF9L2rzNolTSGv37n+OGBk3PQ10
	yegr0/udljf+17DAaOvFcAFDEYk+HaoaB9cMU4OX3ZN61KWDQnNhznly1EPNEdrTGWNhvBYkg9nNa
	piVjHwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmPK-00000006cza-134Y;
	Mon, 20 Jul 2026 11:43:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmPH-00000006cz0-31mH;
	Mon, 20 Jul 2026 11:43:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56F24403F5;
	Mon, 20 Jul 2026 11:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8181F00A3E;
	Mon, 20 Jul 2026 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547815;
	bh=kgEbuRaZ7fC8I4l3wHHvaMm3ff8vOKykqDqNHrxX4ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BDrGf7NzG0L0sB92Cx3an0HY1ia4T3Hj7SKz4jZfVtUVZKNaE0lMcuzwpN3POvU+y
	 QW/1xfdjtYXcXfpfoizjUartFQ5DITdV9VV4RzKBfW6+RmwdEqwpw19lk6lxTBjwpA
	 OVdlzEOOHgbjPIbNgnUS3mBUcpmxuT5xpU1+zf17X/0Nu+Fp+2G7PS+MCjp7dXAOtw
	 XQd3v8cy/BdrIgrYxKeL5S29+gSDF+Fzbmu0AGMofTzCfibJI4EUXSVlIbMfs+cN1N
	 zpkR13ypArj3x2L/8tCe3SWBDgIB8mB2dJJUcYcuUNULhtOAtKNb2W1ofEqS7sRVU0
	 qRLKSqctmGPHw==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 matthias.bgg@gmail.com, justin.yeh@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com
In-Reply-To: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 0/2] PHY: Add support for MT8196 DSI PHY
Message-Id: <178454780918.1388616.17680006872088012294.b4-ty@kernel.org>
Date: Mon, 20 Jul 2026 17:13:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 13 Jul 2026 12:38:03 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>  - Actually sent the correct patch series (sorry, I had messed up v2)
>  - Added definitions for minimum and maximum PLL rates
> 
> Changes in v2:
>  - Added a few comments and fix scheduling while atomic issue in clk
>    enable ops by waiting with udelay() instead
>  - Removed one unnecessary delay after clk/pwr isolation disablement
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
      commit: 215cd5def8eca1c2aa7ca043483d96155a1c3ed6
[2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
      commit: 2ec9c210c1f931389709aee403d28e4f32676385

Best regards,
-- 
~Vinod



