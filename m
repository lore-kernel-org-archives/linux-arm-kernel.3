Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C803C61DD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=; b=TmGjhK5UA+sEF92RUkZhdxz53r
	aZO1kzVZJgJjQ+ADn+wvVkBwW7OzSC3JdkH04sWxtxNoHNx48T68hX1qn/gG+Nk/B6wGl0S31xEYN
	8dPV12t1OF9ERox27P9yRTtHquy95WsIKKKoeClpJfuS9EWkPU3w1bc2N4SDHVO202AGL/bCHZWJL
	qnhX+xnoi4vt7ZL5kWcK1Mz7M+BHLCvn5XfoFS63WZUmKhTDsoo5L0m5EEpvF2GJ3PHutKDeBOjwF
	05TDz8apzhYpwqb7dbXZ3m6A6Gq9LwMrUf/ZGYu/Szt5YQQYtNDbyZq+FGDbcxb/kTwelB8uMWHoZ
	MZ43W6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshA-00000005QR2-1sMJ;
	Fri, 28 Aug 2026 09:16:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsh6-00000005QMs-1uWh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8548db7428aso639197b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908576; x=1788513376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=;
        b=ZDZvMma8kxtBZ0Sf1ZZoc0EQe2r5aAbiP2jq9fmnzTF205j3sOXgaw+NIAtI0qkGj/
         I0mV5yXZn31ypmeBK5fibVH8+GN0vbCfY1TcG7DHA+MqxwaOe2I+92Y6dGfLdtuEG+y/
         mTWwWZFkMI4sWi9Bpb0QsrlwlY9ENxCKS+d480IHeMfSn73QSArSP24e9tJuk5FqKE0r
         /xtwZ402ZJxzTqUlvv1XUfDP7OiELC+1pz16K9Whf6Ynex3bYSJMSi8rkqQVq1DsTr05
         B6Th2aqMv43n3n9d5dZvKDnaKVGgX/7wZ1OfU42wNtTSKmcjcj+dFnlW7pzhuyfjaw9v
         HqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908576; x=1788513376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=;
        b=TG4BOm8ddDjL7u/zmUb9c8TV6DWPm+KWIyG4Uf4ONsAYpk0uMPVtzpV28Lgy9jILQy
         oGFfRJqc101AlDRBaiglz98es5QEfnNDBkx7oyuuO03esMq3oENqKpYhQPESZpFd6E7U
         U6ga6l9mVZ7q0Vbf+7OExiridBy1nVWgwCwkFFRkEHIZ4ieCif4Gx+XrE6ki/xff7Nsy
         ewNsnh/gtLaBh8m/rqpEgWNxQunxkXqoQ2tmjmnVsp9IqqjsNCKfExUQec56j77pc5yZ
         cFu+VoQ9exb4nz8CqjiTH8G+pb7Hp3zAK20hr5QvoBNZ3EU+LY4LFQu4UogyAK75cvTL
         aZmw==
X-Forwarded-Encrypted: i=1; AHgh+RotmBX+F9Ar5Y5v1Vm0sJBb5od8b3X6wFvU0YCmEb69NLvrNRYxNsXDXZo/yi+8WJjEzjKkObgNlld71U5WWy8X@lists.infradead.org
X-Gm-Message-State: AFuF++mkSmI8RLWmzEHgZcqx9m77YKFSWxkyBrH8JQvy3fWzakh+yOQV
	MfLJCi90xFLrtkQH76BptaMd09bwPsc1RIgHlAKI6ySPP0Q/wgc0m9EG
X-Gm-Gg: AR+sD13WzpJJGSltSRBIoj3/DrUxKPF/1NWwxt5Wd1nk6T+qFgwVAcNP6MvOjKA647Q
	MD+xNP7M/QrFVUUPw80bGTqbRrvDH4BeEIE27hA+z9EX1Kk+wWdEGYJVmlLnsrso/UHiYl9cDde
	mgY6s2QnEUrSrlXiRYgj14uyaM9atnk+CKOIP9tewqBjcihRK1vo6DD9hwVUDR08JGJjJQDKZhr
	k/Qq1OHujQhM5eMJfkG+8qG7/+pI/BOb3FVF5sUS/ucMda4tnUyNpEHImTgiQdKu7xU6Smzf15B
	gStXM8pb2449ggimOWNG6Oo7Ky1ehaZTCw2IrQqhQ2/D81Sd5mXlO0ns6JBH/LF15lX5sEZXQFj
	ZVWMLcORyddrEK7+JGqPBcvBxojc6SATkr5IaQjS6iG339uPRGsXmyjakG3sjHLdpxoPCn0JxCF
	PTK1M9n6vRxQFYNM26TT83DYlrh5vxgXZgKgfQt0HU3s72aP+EthCqwMYbZhSg9QCK3EBy96Uj6
	JWekd8iil1QtrPenVJcTIxyOVRCJZWqba7blnE9H5TMkUj/Sjvhc+osjx6yEuiSakqA3WhSDU9e
	OieQ
X-Received: by 2002:a05:6a00:c83:b0:853:6571:9567 with SMTP id d2e1a72fcca58-85626f06dcbmr11500046b3a.4.1787908575762;
        Fri, 28 Aug 2026 02:16:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Fri, 28 Aug 2026 16:15:28 +0700
Message-ID: <20260828091532.600047-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021616_500832_3D87B714 
X-CRM114-Status: GOOD (  13.09  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index b3e938088a7b..85fe828ca5ae 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -361,7 +361,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -386,9 +388,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -414,7 +416,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -439,9 +443,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0


