Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372EC606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jLvYU/7P;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MJkEViPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WIsAYVuA2tUNACU+9ZJPOaIId0MsnHlyEuV2LWfZyCs=; b=jLvYU/7PSCVvSt
	pFt1ZGdyXMfjesrD84QjN/1f7TWRAEFNItJ9nw6lmtkaGhSK2whb+MvDI/ufVFMqeIaLSAgdRTXx3
	zAbACvjB9+cBJjR6Q1ypc8BDRHIFGRPPGS5kuYGBl6LJhPIQjkLu7yem8bK+EBIYSCwg2hXUqlwIb
	OsJIneyIaAYyU8k8G6SGIzA+T+fO4A5EOM406kXCAfz+sY21qCvykQBNPuyJATIvZxDz5bSxYr3gc
	tysHgOp/wKuBQ4Ixrqn0qVkNPdWYDCcsFDnXZmRcboFjg2D/Cyz5JfQSv3BNF0/tuRzch4f1TOv9g
	aJSfnlwrrGnqsazvUtdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMln-0000000Dr7j-3RIy;
	Sun, 01 Nov 2026 04:02:11 +0000
Received: from mail-m12898.netease.com ([103.209.128.98])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMld-0000000Dr1e-21dj;
	Sun, 01 Nov 2026 04:02:04 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d8413a;
	Sun, 1 Nov 2026 12:01:50 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v1 1/6] ASoC: codecs: rk3308: restore MICBIAS voltage after reset
Date: Sun,  1 Nov 2026 12:01:20 +0800
Message-Id: <20261101040125.1864141-2-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19545536003a8kunm8fccdc7416d29a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBlJVk5CGhhDShhJT0xIGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=MJkEViPBLLrSVBmi0yY4NY0W388ta6Dsn8D9yLl6XkrKHhyUi6ddDSb32eZVBeQbHx5/vHz0E19Ay8fYxJd6Q7SVG/ICIcU7vuPpja7VHl+Co21D3eSmoB70q6UxBQ1X3IITrTEjxDYXAL3OCTsEAEnoHelm/ZKimyc3vY4SfZo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WIsAYVuA2tUNACU+9ZJPOaIId0MsnHlyEuV2LWfZyCs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_210201_749355_047BDC51 
X-CRM114-Status: GOOD (  10.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The platform probe programs the requested MICBIAS voltage before
registering the component. The component probe subsequently resets the
codec, losing that setting before capture starts.

Cache the validated voltage selector and apply it during component
initialization after reset. Keep the reset selector when the property is
absent.

Fixes: 4ed0915f5bc4 ("ASoC: codecs: Add RK3308 internal audio codec driver")
Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 sound/soc/codecs/rk3308_codec.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index a3d41cd8150d..7a18ff45e391 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -46,6 +46,7 @@ struct rk3308_codec_priv {
 	struct clk *mclk_tx;
 	struct snd_soc_component *component;
 	unsigned char codec_ver;
+	u32 micbias_level;
 };
 
 static struct clk_bulk_data rk3308_codec_clocks[] = {
@@ -840,6 +841,10 @@ static int rk3308_codec_initialize(struct rk3308_codec_priv *rk3308)
 {
 	int grp;
 
+	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
+			   RK3308_ADC_LEVEL_RANGE_MICBIAS_MSK,
+			   rk3308->micbias_level);
+
 	/*
 	 * Init ADC digital vol to 0 dB (reset value is 0xff, undocumented).
 	 * Range: -97dB ~ +32dB.
@@ -997,9 +1002,8 @@ static int rk3308_codec_set_micbias_level(struct rk3308_codec_priv *rk3308)
 				     "Invalid value %u for 'rockchip,micbias-avdd-percent'\n",
 				     percent);
 
-	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
-			   RK3308_ADC_LEVEL_RANGE_MICBIAS_MSK,
-			   mult << RK3308_ADC_LEVEL_RANGE_MICBIAS_SFT);
+	/* The component probe resets the codec after this property is parsed. */
+	rk3308->micbias_level = mult << RK3308_ADC_LEVEL_RANGE_MICBIAS_SFT;
 
 	return 0;
 }

