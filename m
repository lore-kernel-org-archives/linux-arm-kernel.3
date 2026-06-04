Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F7CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=; b=h8g7fc8Zfl5FGEh2blN1V5ROJx
	zTxNfu0ddELBQu6hEz+XuBKpQzlU9ZlOLunT3HTmtwWATsOeI2lTCm5Kv2ME+Yixxoge6sXBuSGfN
	5hBzwSSqPVGnH1jXFGqML9QQFX7or72DXc3K/YUdfEvTyeFK3Ve4irU7bQ3fvvWLYzYDCO/a4Bp6W
	/IfRcuoDkuPv61DhrXc2/e46ZvZ0JmbIPDyGcuLOmLAy3R2KDh1oHeIIuUWRtmoVtgZWnI3uKvWr/
	3U+6lxIM5SlWDzjIXyMzLjAgw8oiQGbZRuYaDLoP74CslqzxO+JkTOOqkM8DGcfeb5FgdfR6TdPH/
	dCFmiN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUysR-0000000G6z6-34up;
	Thu, 04 Jun 2026 03:36:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUysP-0000000G6xM-1dD3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:36:14 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8423efd76c8so167259b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 20:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544173; x=1781148973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=;
        b=SixoUEN+TCFpremiLpzrUXYoANknE/fn2yl34hC2puYSxMiUNu0Mjz0aQj0bvh+X32
         tea9YrHyH2O6z0gwr4xP1OG3iZxVK/RDSnkLNOv44VL4Uh+DFIOtKqeqEiFqRk40NfLd
         ZQEJf+dP7lB40+Gj3SFK+MaTs20SGjXrfY3adcsI+yk19zQCEDe9ic4dM7RET3mpFm4v
         KEiBeohPfU1OPNVeMfDPmQzauTm15JEImOm8ta+iEfVHVar8fbZ8HKWmKLVBldBS9IoN
         KXfifqqrk4BDVSH2R7vnbrL1IMBv2QacT2ymUjS3/WVLWmpz3cW662yjENJnBO8HE+Xq
         P72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544173; x=1781148973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=;
        b=rp5mS6g+GVbcYVK5dk1B5HGIgYBD4N7MHwj8JSWSzO9/+5tPcSg2szMHgqjrQJjuyt
         apsj+ZeOPQtf1fi5zzmWvwtsUgiCcWVNSIF3R0UC/Ls6Xv5x/pzjIgPS4mLL6GkNL94y
         wror1vlm0kRZHYd/ykZdjJS4Y24jpVSpzqU260cWGZ9fLnEsC2APVzLYjh6O5qYfzZMc
         Pa3VjiopfDCGbkkcZavkoaIkVnD9um8JlxP0CjOfTQkX+1BbHiwxmp/MyZnWuPR57u1Z
         qcISJRYiliUdedgkHCSTZr17PqeUlYNagCuQ+IskzvpYKEzHY+sIJKdZDaL3T6/7x+ec
         cO/g==
X-Forwarded-Encrypted: i=1; AFNElJ8MQWIW0E10vI63ncTll+3HRWSt5zrvj+2+YmKOJdgS7+CK2cs39gyS/VKSCgoBdOjDvWx21w2CI3gvkbcfuux0@lists.infradead.org
X-Gm-Message-State: AOJu0Yym/8mGKd70dUZ/QzLxtLoNEkS8yHP3Qh4Nrf/p7BN8RA3ev132
	6RMBNXQbO98pnK6eutuhp0gQM2EEL+9qYWYbjGT0OmqbMpRPWGm2r1wf
X-Gm-Gg: Acq92OH/QXLNtZpYp5xl1KGGPOzSMAd2Nd03L2DOPKbOS3pOpU3iGiOA0yIW1I+gxfn
	AWdT69K/bD8X7avUH2l6wAf8FaBA9ijoLZDgD25bA8L7BzhH7vSCZkhaAP/mDrijFG8GPDF0IhW
	XEzzZh9Tct7EUJwz30KYnYY53LhmzhxRXCw04OwgUS52Mf6EH+3WsRx8SpSIA30KEYW2EANbOoI
	Gzy8OO7NvwQ3PpqqfZpKLQNnfo2fIsU6cHFYDvuF+hIK8oCVT3Ep4ZmrWnnfQUkX+dnlcppQDfN
	SHnhfyfcSWHIxdN5ynwdC5RZNjNBupRSVxgfXJq1zkmGrUrDLlEoS34sE+ZLOZvOQRZxrWePvDV
	f19NA6xfOzUQr4yJpWlcd6lyek4eZk666ssTWS+OiyMkspQtc9Lf2/rtWYIXGdU3tYGDXQYXdE7
	6p/LTSUFTjwEjVRnlYI/DInx0b3e6CKYjIodPd5AjMAHluXD/TsiFlCM5Yl6O/Zoj+bo7h
X-Received: by 2002:a05:6a00:b483:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-84284da5a08mr6132587b3a.12.1780544172780;
        Wed, 03 Jun 2026 20:36:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm5539745b3a.11.2026.06.03.20.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:36:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
Date: Thu,  4 Jun 2026 10:35:51 +0700
Message-ID: <20260604033554.96996-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604033554.96996-1-phucduc.bui@gmail.com>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_203613_448431_61E26CC3 
X-CRM114-Status: GOOD (  14.84  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/rockchip/rockchip_i2s.c | 160 +++++++++++++++---------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a0a95b4f520..5a5087f4ae03 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -127,52 +127,52 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 	unsigned int val = 0;
 	int ret = 0;
 
-	spin_lock(&i2s->lock);
-	if (on) {
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_TDE_ENABLE,
-					 I2S_DMACR_TDE_ENABLE);
-		if (ret < 0)
-			goto end;
-		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-		if (ret < 0)
-			goto end;
-		i2s->tx_start = true;
-	} else {
-		i2s->tx_start = false;
-
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_TDE_ENABLE,
-					 I2S_DMACR_TDE_DISABLE);
-		if (ret < 0)
-			goto end;
-
-		if (!i2s->rx_start) {
+	scoped_guard(spinlock, &i2s->lock) {
+		if (on) {
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_TDE_ENABLE,
+						 I2S_DMACR_TDE_ENABLE);
+			if (ret < 0)
+				break;
 			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
 						 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-						 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+						 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
 			if (ret < 0)
-				goto end;
-			udelay(150);
-			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
-						 I2S_CLR_TXC | I2S_CLR_RXC,
-						 I2S_CLR_TXC | I2S_CLR_RXC);
-			if (ret < 0)
-				goto end;
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-							      I2S_CLR,
-							      val,
-							      val == 0,
-							      20,
-							      200);
+				break;
+			i2s->tx_start = true;
+		} else {
+			i2s->tx_start = false;
+
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_TDE_ENABLE,
+						 I2S_DMACR_TDE_DISABLE);
 			if (ret < 0)
-				dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+				break;
+
+			if (!i2s->rx_start) {
+				ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+							 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+							 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+				if (ret < 0)
+					break;
+				udelay(150);
+				ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+							 I2S_CLR_TXC | I2S_CLR_RXC,
+						 I2S_CLR_TXC | I2S_CLR_RXC);
+				if (ret < 0)
+					break;
+				ret = regmap_read_poll_timeout_atomic(i2s->regmap,
+								      I2S_CLR,
+								      val,
+								      val == 0,
+								      20,
+								      200);
+				if (ret < 0)
+					dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+			}
 		}
 	}
-end:
-	spin_unlock(&i2s->lock);
+
 	if (ret < 0)
 		dev_err(i2s->dev, "lrclk update failed\n");
 
@@ -184,53 +184,53 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 	unsigned int val = 0;
 	int ret = 0;
 
-	spin_lock(&i2s->lock);
-	if (on) {
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_RDE_ENABLE,
-					 I2S_DMACR_RDE_ENABLE);
-		if (ret < 0)
-			goto end;
-
-		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-		if (ret < 0)
-			goto end;
-		i2s->rx_start = true;
-	} else {
-		i2s->rx_start = false;
-
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_RDE_ENABLE,
-					 I2S_DMACR_RDE_DISABLE);
-		if (ret < 0)
-			goto end;
+	scoped_guard(spinlock, &i2s->lock) {
+		if (on) {
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_RDE_ENABLE,
+						 I2S_DMACR_RDE_ENABLE);
+			if (ret < 0)
+				break;
 
-		if (!i2s->tx_start) {
 			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
 						 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-						 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+						 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
 			if (ret < 0)
-				goto end;
-			udelay(150);
-			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
-						 I2S_CLR_TXC | I2S_CLR_RXC,
-						 I2S_CLR_TXC | I2S_CLR_RXC);
-			if (ret < 0)
-				goto end;
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-							      I2S_CLR,
-							      val,
-							      val == 0,
-							      20,
-							      200);
+				break;
+			i2s->rx_start = true;
+		} else {
+			i2s->rx_start = false;
+
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_RDE_ENABLE,
+						 I2S_DMACR_RDE_DISABLE);
 			if (ret < 0)
-				dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+				break;
+
+			if (!i2s->tx_start) {
+				ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+							 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+							 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+				if (ret < 0)
+					break;
+				udelay(150);
+				ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+							 I2S_CLR_TXC | I2S_CLR_RXC,
+							 I2S_CLR_TXC | I2S_CLR_RXC);
+				if (ret < 0)
+					break;
+				ret = regmap_read_poll_timeout_atomic(i2s->regmap,
+								      I2S_CLR,
+								      val,
+								      val == 0,
+								      20,
+								      200);
+				if (ret < 0)
+					dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+			}
 		}
 	}
-end:
-	spin_unlock(&i2s->lock);
+
 	if (ret < 0)
 		dev_err(i2s->dev, "lrclk update failed\n");
 
-- 
2.43.0


