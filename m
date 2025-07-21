Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C602C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=; b=Gqcl5Pfw/gqPspOjpdXMvpnODz
	o3rt7UmsoHk9iGC51vVEciRxYxI5q9IrNlkD/iiB6iaA9VEjnDMrdKXbMK2yJrrttgEZ6o9IqpLhz
	L0c4s06wSWgj+5u6I+Dn1NlAdovp9w4X9EBccWt6EX1rYaOpZUH8GekFmAzxpUwIukZRbU+0JocQ6
	0tx2ymEEJ+oBnvcNMt0r/MG5lYeGoKMqEqG3nqguvK9eViZxYqjYDqdrhrPLvbfA43N8+KxE2x7Q6
	VkYU571+6iik1/cT5SSDVfZO+0K4NIlQNsUjlsmyn2rpkGMJGnKRoG8gtyeuTGZ/Yg0vtydqjSy+P
	mGHqWi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhz-00000000RwB-3G9t;
	Mon, 21 Jul 2025 18:57:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvJ-00000000ONM-45UT;
	Mon, 21 Jul 2025 18:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=; b=UxPbyl2FVT7Itp8SiB/ORQgJGs
	4cRiy128FvkXMlmgD2Z5CnoRaEzir7rmDZhGvMUiHPPT/crLJ+cTIKZI1x+V7krFZONuGZMMDZee1
	MDV5JFSvv7BTTESrcFzS7IlaZ4dwlMaG/MVY5rG01T75FSCBYPDW9UmitOsGn1doAJV6Ak7IyX49b
	0FlJuRgivehP6mW2/tLGtZkVFuUPAbMe4dL8qNfnsXAsJ6yVM6+yb8kE14Kn9YY+UMHuT5wBy9rPz
	/BwXHggNkZD5yQ2G1YWmyNnuHtcOTsBxUi6xwaxeElLsgc6h3cY9nEMwmd9v3gGKYHY+YddsfUUF9
	JRZvKWaQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvG-0000000B6sy-3yv8;
	Mon, 21 Jul 2025 18:07:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2587272f8f.1;
        Mon, 21 Jul 2025 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121253; x=1753726053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=euNeVSHFz+M8ByAg6bONOBREvXS+ctZ1PEmXoA6GTY8vfR/W9coSAGAYyGkSrqNmDv
         g52E5x63im9EAOWWzp84VkofrpbGqW1Z5NMT3P8e753mnyFmAe7SqMBhA3cIPFkRH6EC
         mq2jbyxto6T3Uqx6tfuPKY8d1RjBAdjOLqVlHQE/zIxbAaFPGSp5y1HNYqSN6adNcLSk
         Hz6XdGg5BlT9wGXS1IhayvtZkK7PTq83Rh7uE2p2OFalUwOi5OS47n2+HgdlFMR+K2mN
         LNuEy7BgjXA+Vv6BPsQznMfdohKRcanoljTa4p7vnwYWT1UrVJ32oUEbQpw8bJTWUvB/
         H6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121253; x=1753726053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=C/kaLwyw18pNpnQk2kISs2NfPklV4vZL67s2LjMQ1xFeKYw1tDf2ZUwSAfQqGltjau
         gCCrpW3PHzv+FOW0SOAF9w0atijHpqf+id2Mqq3htcXxIhird/meu9RHFlPu5fDvNGO7
         EeLGce4IgIvmNZaro8TtDv51Sbrb1OoNvI+6WBLqTfkukkL66kyj8y+HbjvYac4NWE9m
         sngczBcP3rvrLrpOgKtsHrT6PNbw7aTOwhytiXepGkFNCwg+Lkz4MLSljq8N7XFHRhCG
         QyzLsNC59QLOl8t+2lkt3rQHrtCJfJDCozRoZlJpd9UG9909yPH1xZtUc0nGomEuk1zU
         DtTw==
X-Forwarded-Encrypted: i=1; AJvYcCVZDpQea8pgO8ALX1b/W8pFnuzsMl4SfvVVAG8yFuBBEGLD1k9OzFIIQfmEkzQc0WYKZwu/WLgn35ns0m4HQyc=@lists.infradead.org, AJvYcCW8fNgB4sqnAixxr9D5JL0Jkb5n1eraoWGa6pJvrrgK0eCLwUnkhwVxAPvwO5A26UYUkcJGLvPaG/O8ALsxMCC+@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/opiuJ6s6CbJtz3IlcRc9wwMmbgUQ2h7BSgQMzPmQWf0zHff
	Ee0TLW02HSARuYhuWytQAnJK+9mtJcp3BrhENkkfK3HMLPg2S3CqlW64H7F82A==
X-Gm-Gg: ASbGncsTYtynSvmDhLcomlng3k6cfazQZf/m7NM/J1dEDUoRoqLQ6Ax4fMsXjNk+Rsq
	31j6HHWirHT8CrXcJpjiKA3z9QwXNFxcZ4+71c1wk4WMqKN1xEQkW73ieFTR0VQEkiwjoCF6ZdY
	VpmmVXH7JhF7k8fPEe1qt09ONUUp37cbF/z9e+JcYx1J6bX7/6mYIcevlAFGHF2i76zFWY8oPBC
	M7TIagJGBMqtKZiezV9i/+yPwsswijLJJwSht+9EtvpI+flyJ/d2jZrWfrbahZB7vt3hU3jQo8j
	NbvPmw/xb7b3wIq0B1JGUsHRjegD8VGRcUOWEnVTEmW73pwEPcI5koG3UtGsmMOx6Ex7mD8RV9a
	34ZMDWrKH42j5xSRics8gkSA=
X-Google-Smtp-Source: AGHT+IHmyUfextSJYKW/B0dJOold2dMrY42j43HF9l7jc9Jyi1JVLeAGi+6sfKg2IAK8W5YemEeGfQ==
X-Received: by 2002:a05:6000:2a0a:b0:3b6:18be:3fbc with SMTP id ffacd0b85a97d-3b618be3fe5mr7634132f8f.2.1753121253150;
        Mon, 21 Jul 2025 11:07:33 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:32 -0700 (PDT)
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
Subject: [PATCH v2 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Mon, 21 Jul 2025 20:05:55 +0200
Message-ID: <20250721180710.2116-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_190735_158810_93A348B3 
X-CRM114-Status: GOOD (  15.35  )
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

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 58c3da92cea3..b4dc1fb269a6 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -88,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -98,8 +99,12 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 	/* Clear any pending interrupt */
 	iowrite32(1, i2c->base + REG_PINTEN_REG);
@@ -276,6 +281,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
-- 
2.50.0


