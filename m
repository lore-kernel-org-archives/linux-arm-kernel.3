Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA9CD5BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=; b=ww0oiX65wiSCui6RLkSVkJGIcM
	I4Oc/o+zZo56pb6zo5Xpl6JRaiIMv3mTvw7GyKVXJBbMPY0ZXyC4leMJ1jscyS8f82YyfJzrYDZFA
	MEf62/c9NK9JeVnffpqRjofLOyV639LsAElxMrf/lm8FQ3rqbMhgNKDw6gDxJ/w/Dk2Y6pWpuza2V
	wTs8ZrqRy9CrzecIYGbIMBHLp/T5zSS5c2dGLO4NwklL7LVkvSObeqW5wqXTYy9uiRae8x3PodoKp
	YPX4CPjSWBZTa0HkZIwzSSDUFkc+ewOayvnnrjatUEJ16KZAuuLRoqC0Suy9SpPYOZRHyHMfRpStY
	Xx8hK83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT04-00000002y8K-49En;
	Tue, 19 May 2026 22:33:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzz-00000002y0m-0hJo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:33:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2766763f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229993; x=1779834793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=;
        b=e4fnji+aH/FVhnND087h5GAEYhPyTaA0I9lpHYOK3IcqSw5ok8PwxDpH1OkwZ5edP3
         enXjfIBZE890DHa2dygCW9mmFyiY8PGS8N2lo/bF8Ifacc72+j//ZVi/wURSvUw6T2oV
         Fa633e70WYgqk6r0gmCTOhH0nj5YNHQcEin7vbQq9cl93EVGJi1+jnt0ST+d+IEig8LM
         L6jx2grZJIfRL6Jt76BHn6gD011ZvdwkElSJT5EdvhPc3zS0ZYeJriiKHG01tuAtInf6
         bjunyBm42hoYp2Rocq5j1lTkS3IojtA9D+ZLSpWS6Y+c1TP+5rrktUrWc3T3JMw2KHqC
         z5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229993; x=1779834793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=;
        b=fS73sbQLTJaip3c6ph2IeKP+pI2lojgDBkIyzVXC0x1iJ1IVhNutdr9q8SiD9yO6EI
         94OcnG0D2L6izi/6qtkHQwBoeR4pxfDQ3GCh5ONVJlimR0eNELeveimUe9ZV3IUHhTch
         Ai7MZ8neGElGELIEQ1CMRQguWZ770mVIqtF836TTwOlUVnfgsRBcH3bmmwL9BL830MyA
         06Y8aQHA+zUfusSNyNIPz2LW7C23Q1tFGh6ErDhC0YTwWzyE4nMokxoxO73u5cQF0/Ma
         HyNKOLww0gRR13vbzwqCLSsOn5U1YF/aT4M/zMmG107oRohHuPSsJ9WGj47GY7RGexPI
         7VLg==
X-Forwarded-Encrypted: i=1; AFNElJ8rcDignoWg8jNOODbyPQ05bCdSku78n+NetnaqwU2sAci838QIqFk4q93XWcaaBwSM+UM/q0hCqbulLLdDo1Sb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5c/jpkNcO5rctDvWt1TKW3W0rz8OpaWz2SxzlRdwD+1NzOCjr
	JQE6W2Pdm7+ToEgRStbi7RZijujKCNjuq1DVlPWKHBxDkdCj/In8ylvB
X-Gm-Gg: Acq92OH/BLbhDeSlP01urcFrz/eEFmBQSyZS4ta0wctc/unwvED7G7olDgo4YgBfBUn
	oGsL8Yl5hfn57lyFab8Fxd8kPueEhP0c2PqseF11wD6HmcQZEdtk3vYzHNFzNzxgclOXK0tKif7
	VmCvBbYwF9kZBA+vWzFvGAiJIrwdIGvZ+ViuW3HGqgnwDGs1SJ0fbFafqQdUiptRYXkBR13Sx5b
	Um8jh61XcmqxLGx2OQdPRI3jaJn1ZwH7qWDT3PbKCIdKgKw09kRjkp1sZJHV5syqY8eLIAjAFiI
	Xr42iQk+UKGoQu81TIyN9il9lEkXkkSyVyHkyyo7PEy25kpR9E7wyogBSgec0/GfAtKTPjBO9Mg
	tFmmwSJx31D4ucruik/z1aM0XYpt2UOFo8J/t/YGjxrzrzjqdfY8EW5HmyVOF/0LCxJ+7lDl2Bl
	zUTWyNomHUJjNWmurSb5FBEgKNHB9AB0Gni9+Fi1Kh5YeHfQsQBn5V/0WfCJyJTw/uho5G3nsgj
	vxUOuPxVA==
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr321638395e9.11.1779229993156;
        Tue, 19 May 2026 15:33:13 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:12 -0700 (PDT)
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
Subject: [PATCH v3 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Wed, 20 May 2026 00:32:46 +0200
Message-ID: <20260519223253.1093-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153315_245057_39E4B247 
X-CRM114-Status: GOOD (  16.84  )
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
index d8fa29e7e0fa..3cde43c57a2b 100644
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
@@ -271,6 +276,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
-- 
2.53.0


