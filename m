Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEE7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9oNdreHz/zJ196ou4ABQY3VD2bD24GH0lxFU+tXDweo=; b=19FcYDjJKepo+dhl1VYIDTwGD+
	DnpKmSJVk3f8EOKkliOCV8pkAUQ6WzbUomwF0tzvTl2iJ/eSJneFf2i0JHWLf0Fp/Mwsr21Di7dVs
	7B3BqikGLyW8XJl51n3UYg8KCmQntu//2j2hM8pq8oJ3S58pgihyqQo0Kn00MIHdKqgyoibPkTTcR
	yM5oqrz1x2+KQXVK47IIJLFUS1EnnZDtIK83UH+cPJuo6hJAR1RV5jKB8I2VCnbzq8PHVe870dwEd
	Zz+VMH+pBlnmHzXBJU+jVQL9vzcMQucPh9+PwqT42/DLKXCv610Iv4wL1U2RPuTjUR13fbs+qPZPe
	jtEcMrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbO2-0000000Bh2x-3dR6;
	Tue, 14 Jul 2026 11:33:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbO1-0000000Bh2q-1uLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:33:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C08E660254;
	Tue, 14 Jul 2026 11:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9631F000E9;
	Tue, 14 Jul 2026 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784028796;
	bh=9oNdreHz/zJ196ou4ABQY3VD2bD24GH0lxFU+tXDweo=;
	h=From:To:Cc:Subject:Date;
	b=lEqokdIt7TWgJvetkIdsb80SJJMOdKq3R7I75YrtXo1sPpQPxlTcz9koLQGds5J5B
	 d4P5Q7nDo1yYT+9ScuQ19dnCprISxmB3eVATiXdzCyU7Pwyi5LHXPUCk0SoYFjQoJL
	 Cl/NgTyLCgcehzbOUOdRPV6MqUgwvYUGBVSHKmSO2TAGeMCL8VxPnJDWeo+F0gpfE0
	 pxTNID0F7opJDOACOSpsNDeuIM5sV6/woXPKpwsLQFCAP7fAFjQOGGtrg70jXbazsB
	 IRo5Z/fy7eR8QX+nHgK4xvbdxH6gVdoRTM2KvV2fF6LjQ2xCsNXiTbFG+j54/fcgo8
	 nFJQQaYqE0YPA==
Received: by wens.tw (Postfix, from userid 1000)
	id AF3BD5FC39; Tue, 14 Jul 2026 19:33:13 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
Date: Tue, 14 Jul 2026 19:33:03 +0800
Message-ID: <20260714113304.270224-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The H616 codec does not have capture capabilities. Set the
.playback_only quirks flag to denote this.

This was somehow missing from the original driver patch, even though
the patch prior to it in the series added this quirk.

Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f4e22af594fa..93f511fb6190 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2237,6 +2237,7 @@ static const struct sun4i_codec_quirks sun50i_h616_codec_quirks = {
 	.reg_dac_fifoc	= REG_FIELD(SUN50I_H616_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.has_reset	= true,
+	.playback_only	= true,
 	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
-- 
2.47.3


