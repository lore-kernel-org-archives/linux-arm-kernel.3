Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E299C87FC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=; b=GnXSAvXsShtKLXZH07rIsCNJRi
	0qgBllrG1PpaIglsHHn9dx216W862SqMEfD4he1D200xXKkGt7uXSuNRp4X0iKmNCK9vPaEjoPXbM
	KGOCl5r+ka7c8uevA/9noofFWdH3QoBkIF6phaMRNUzXxjj8RDtCIFIChIyXyomzQ6ai9hQozeHXP
	D4XYPgXmw9TirKyCc/xIpYZoIr+RZxLDuAjC1GWecTb6cZz2TeFdTaDgoT+cASKcyKX9lqdGNLJ9Q
	AmJnyHTw1sSE4R041b34xJ4fB++h+UrGBAvATjy4Tg1wvlyTaZla371w8wbe59KKL9HkBpVyW1lDC
	yWBzfSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhv-00000000RpF-2hFL;
	Mon, 21 Jul 2025 18:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvF-00000000OMv-45CC;
	Mon, 21 Jul 2025 18:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=; b=qsWiZIM0NZYMqQzYJ6j04t37G3
	xFKA+fN7C92kpqzr2bvZT2Fuau9lcRM7tPDr2kU3G/2WziOQxIASi/Hm37SxY3Oqr9EFbvoZmKLOb
	fcv99TtLKCk+xrHXCECIJ/3zs5ffusyK4IX0g6aZDn3ph8Fn60CBu23bm1JngxHTCjmzNfu9pNvwF
	RTPWVjSYfP8aTUnsYp+bFpluJn+hslktFVSIbyRCh6xLcToC+HMVO+rjnKL0eT9Dk6zpam3OyOFEq
	rhuHKnCbuPlyA6Gj/O7tks5cXmtES0rzoRfJywKR+ASKotM+HtALNxdHBpgf/w28cb4KEozR67TJK
	t7HVxQ2g==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvC-0000000B6sN-2t1u;
	Mon, 21 Jul 2025 18:07:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2676958f8f.1;
        Mon, 21 Jul 2025 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121248; x=1753726048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=RZbQlh76RaQw+QMyqHRFoOEOqkmYxrv1YwMFoSFGYwioKs8+zAdWTki69aOP/IDWfv
         TmkrS6+MMOQK6d3FfF/5hIKzyPQDLQnN7gRGO02unKNWAn761syqB6Ys5JJLykvBupZj
         1s9/nZfC76aRfcwK13OuinUlwxmWNpUf0mtPUCh4mjrBufgld2XBhY503cBvJm2DjJjf
         yLHk08vTlpQENa5AJSzRahvIh+RTqhGlLyHULbhE2Oi5BoqptZXvT5KBviQaxTj6SNKp
         r7NlkToGOb3RPQLdRJLXWVCwqK/RL+ILdGIvAKL2KsVqarh2aYywOcG7bgAMHL0pBMEx
         Grcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121248; x=1753726048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=AeiIibr/JhENxOxMTdvu7dUtDIwP5gQM6K3Q80AjPjECrqtEvTwWkyrN05tjPRJkAj
         Gewguvld16pnm8XDomdXoWZcB9x+MUxpMsy17KQ8UEOwyHKh4UU5jm/dTKQ7MeB/ci54
         5BpArhfqJkd7II/tJa84vIDVcvbTdwI/PZIyaU2mylOyFZVp+yyEX4q7h5nTipjjslAZ
         OqwY6WW5383N3LgB/3xHSf73bRT44SZd2yC6QPAd4GWLI36T3SD7tk3DZBV++tXGEkho
         dVr9Oo2O+4u0hdFN01KU41j5FmRe/UR8IEU6h+JJdAXZAXezOo3GFm+xVvBjlGUWQtxM
         9gvg==
X-Forwarded-Encrypted: i=1; AJvYcCU5bjE9BvzwQLXAx5EpmiLsTVDmVYREbp8jZ7D4PpOgH52z5hzgLiJroEkDkAg2r8L4RaVNPr1RnphtU0Ldprwi@lists.infradead.org, AJvYcCUxPa5EOJTlSpiFB8FDubU1cDYZM3J6Dc+TFXLv0t4f/m6gI5CgI6iJKtywztBgMUw8oPkqGikpxGdqTv/KfGU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2t6LYoyMSnH5o27+NWrSTTKwgqhDUPybjjOS72ALDXZbs67g1
	wVgK2wKohvqOYsBxfdkjQx5cDP6+E3IdfiOq70SFCwybZ+nD7aYje7yV
X-Gm-Gg: ASbGncu25yJKwz8zJDGhJmohRJvmH2fqLqhH9oqBz9QL5nFgWQc5EIBH/wt7ZXFfGEo
	z5KMeuQRasOfkDGVYN3PvFDU+ba3XZxxszPX8bBVKR4CTnIxo5+xGWfclA+D/fK3PkcjTZgScXH
	Do7qpT8WCwBIf6drWBIk34sCWzTzcN6Df5Fparntr7ExDrrDR8N8ynPMJSBC509hK6QkLE7EJ21
	tiJx+2H0h/HhvuGtMKmS251hs6ObcQ02ZGES7FiXS1K+U8hSI5BQWuJvR0FI+VeJLXXbcNtT4hl
	CoTv204jY2BCspT4HESQi1VEcXP0hHiueRHpZmzYTyouYFp+51o+2ih9oBciJxSPiyvFlFY7yxG
	+e0NHfkwksG3NxunU5bGlP4U=
X-Google-Smtp-Source: AGHT+IGYHvoIqXYmG9yQPodcuC8yICZXTkPFoNGcxMbPnfnBTzexQFmzBmrG3T3lmTwxSiAjYQZz+g==
X-Received: by 2002:a5d:5c02:0:b0:3a4:dc32:6cbc with SMTP id ffacd0b85a97d-3b61b0f2f8dmr10615647f8f.20.1753121247732;
        Mon, 21 Jul 2025 11:07:27 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/5] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Mon, 21 Jul 2025 20:05:52 +0200
Message-ID: <20250721180710.2116-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_190730_915834_6EA0CBE9 
X-CRM114-Status: GOOD (  15.78  )
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

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's mainlin needed to do the readl poll in
atomic context.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 59 ++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..c0e13f9af3e5 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,14 +67,19 @@ struct mtk_i2c {
 	struct clk *clk;
 };
 
-static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 	u32 val;
 
-	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
-					 val, !(val & SM0CTL1_TRI),
-					 10, TIMEOUT_MS * 1000);
+	if (atomic)
+		ret = readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
+							val, !(val & SM0CTL1_TRI),
+							10, TIMEOUT_MS * 1000);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
@@ -117,27 +122,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len,
+		       bool atomic)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num)
+static int mtk_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -152,12 +158,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		pmsg = &msgs[i];
 
 		/* wait hardware idle */
-		ret = mtk_i2c_wait_idle(i2c);
+		ret = mtk_i2c_wait_idle(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_start(i2c);
+		ret = mtk_i2c_start(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -169,14 +175,16 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			if (pmsg->flags & I2C_M_RD)
 				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2,
+					  atomic);
 			if (ret)
 				goto err_timeout;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1,
+					  atomic);
 			if (ret)
 				goto err_timeout;
 		}
@@ -202,7 +210,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -222,7 +230,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -230,7 +238,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -241,6 +249,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
@@ -248,6 +268,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
-- 
2.50.0


