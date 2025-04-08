Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25899C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=; b=H1RbXoT2e4pJBN/QR3uUkQUZVf
	x8iWed0k0mbnXy3F4BuL8uikzkHmEtpF2pX6b0xVaZJ7c43dXD1F0XqAhU8LiMHcffDQExm/YlwLM
	OfOvik8x1Ntnb+2wtDdH0ujGuK7dkyUlpLu9QkTb0+QKls7JEd3RnY/bBBdBRX7KaHmbJjjEFEvG/
	wqi/Hx939a8lgrxmAS0Fzb6a6d2IfLqPrS5XDbl0izUo3IIAjpV0ghWySe9V9MaeehXI1bZGiOfAG
	9xrP5yGJpzmQo+SSrJ40ILQ94RBTryklkXvl30ZdHB2oF0FU1R/qhOr1Vm8oEuCGtKBL7GzsrhSLm
	9bQWxfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25qD-00000003Zce-2CtD;
	Tue, 08 Apr 2025 10:06:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d0-00000003W60-0YQj;
	Tue, 08 Apr 2025 09:52:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39d83782ef6so290167f8f.0;
        Tue, 08 Apr 2025 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105940; x=1744710740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=;
        b=bhj05V3kX1AGdElYqrXuUG/xPm2JRoUoTQhmCRQnygbGxbD9YH3jwgTHEBML9PcLP/
         MkxxMVFi/CU6FJJyHxqr5pTTAQGp5wCiwQEkAZ8mtcnVn0T/goPmef94KGrHj/14C66Q
         bfFYxCPaR6Ogt574jumx7VB8Lpo+gYFkjvGA32c/FsicuEbwqlmD0q5rncfUAvkY7qPS
         bVOf5GC4qTZjTXe2dhgzZPhg1BlxuGyT+T68/eG/rXCquB7oxIBjgcybBhSN5XF8OLbI
         UF9WSbXtlMXUaXDM5P/HKkwG2vstIQ+pn1lyEXWQTgNY4J8cdMal9fut57xblI2Jjj6F
         fkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105940; x=1744710740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=;
        b=uYXnkMzMvd6F6VYFXnYRfW+lhYNB6WIbgLZxAtPLwnNcc4nfUtbS5tK5Inr7MUXhbb
         Lipab8rv9f7nw/TCWEafir3C5G6ThgfJmQYLvUOx1hiiOHOA7tu7VJ8C7W37Xvv1QtqD
         LHyHWwZ70mIPpw3Yc4Az29usNetvm4tys6xhm8ulkf2B0cv2eFrTGVe61Vk/9KnmNUky
         fR28auJCOU8WlFq6zHXMeoKPW2ISsyDG7PVS0C2jbczPVVBvJCIJMx23vsdoFBJsIkLF
         UVTQcyzbRlB3IacMOV6SHbKzZhRM94pO7jf29THz1F3Owp44a42YExLKbk7GXPgf3Vck
         cF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKeuIbMkmRHbaM5KrTolAkNY37rdcCQQtWtE68FKgYYe0lH5KXu81Zesp1sRpqKL2AHXdHHGu9vkkkxnQpPPxq@lists.infradead.org, AJvYcCVVW/ZH1VvE4e8muk7GqEAx3ERXY9CM8Wbq3HNDgOs/lCD/QlAE0gHPxVSmpx6El7b1NSkMsWL+zx3YWfM98sU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrf66+vBgKQLhfeg0iBFZ86TcVGfHOPx6JrJcG/gt/rz5+vpEv
	jjgUrlyeRvnH7OIwzjZO8Pw5OxsSS8xuuzITgVVrYVxD2ZtHZEen
X-Gm-Gg: ASbGnctdcNzXmGlq6281aNAYDz2t/RfGv3FiXPq7RIiQ91LxsCokGCMHuP/CVNXO7kB
	uYdFPK9tnGnNNLSPo5iXQfB22JN2CTIAKCiEvl6Dt71LCHUtOZFUXTPLPm0rxNQo2hTDQfEhDoi
	8CgoPJShXGqHCHoyLPbyXESc729Y5nmOYETtcaAnGgnA66DlCvTSokbZxkuuhJMmPcpJvO4Xy5J
	1ycoRHqVqTR/HXy9Y7u474dFDP1HjcHnnZqC6bqEXM56jucNkNOU6wODC6jz3lPEkeDcSK9gwt0
	n/czaGbwrbb2ZAPjZg56l3jYIYv1vo7KTF9W1l6FmaKsiEKBZLsVoYJZQrnyq+EPQcNoaFMLruf
	3zRSfExY9QrjX4g==
X-Google-Smtp-Source: AGHT+IGrqwVCjgn7rIaO84RS/dOygNudZl4m5bHzjJ/0QnrWbjeDDkJm2owzPEvR2qtLmTK4q+Z6+g==
X-Received: by 2002:a05:6000:2ab:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-39d81f60b1dmr2398842f8f.0.1744105940434;
        Tue, 08 Apr 2025 02:52:20 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 06/16] net: mdio: regmap: prepare support for multiple valid addr
Date: Tue,  8 Apr 2025 11:51:13 +0200
Message-ID: <20250408095139.51659-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025222_171205_319CD652 
X-CRM114-Status: GOOD (  15.92  )
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

Rework the valid_addr and convert it to a mask in preparation for mdio
regmap to support multiple valid addr in the case the regmap can support
it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index 8a742a8d6387..810ba0a736f0 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -19,7 +19,7 @@
 
 struct mdio_regmap_priv {
 	struct regmap *regmap;
-	u8 valid_addr;
+	u32 valid_addr_mask;
 };
 
 static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
@@ -28,7 +28,7 @@ static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
 	unsigned int val;
 	int ret;
 
-	if (ctx->valid_addr != addr)
+	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
 	ret = regmap_read(ctx->regmap, regnum, &val);
@@ -43,7 +43,7 @@ static int mdio_regmap_write_c22(struct mii_bus *bus, int addr, int regnum,
 {
 	struct mdio_regmap_priv *ctx = bus->priv;
 
-	if (ctx->valid_addr != addr)
+	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
 	return regmap_write(ctx->regmap, regnum, val);
@@ -65,7 +65,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 
 	mr = mii->priv;
 	mr->regmap = config->regmap;
-	mr->valid_addr = config->valid_addr;
+	mr->valid_addr_mask = BIT(config->valid_addr);
 
 	mii->name = DRV_NAME;
 	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
@@ -74,7 +74,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	mii->write = mdio_regmap_write_c22;
 
 	if (config->autoscan)
-		mii->phy_mask = ~BIT(config->valid_addr);
+		mii->phy_mask = ~mr->valid_addr_mask;
 	else
 		mii->phy_mask = ~0;
 
-- 
2.48.1


