Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E0C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=; b=u8XfjIRqQowu9/ZYvakMxmrjn7
	080CTl7OKVqlmgYmiS1sDwV8NJNIpTO4yXOlLqWsmAeWYUkq9TNAIKucg02mfgHxNA2lJXjKEaEER
	JFW3KZyxdxkbiQYu0Idd3Z+lxji+SnQaKTXPcw52Q+D8/8r108Qq1082sl53fjXgc7X4Vzkt0zD8E
	F2ZG/EvI6NTAu9YMl4mvfalf62T6IABXxmJEd2t3ncleeN9kfos5r4/E+Qaos79CPehpUIjIj/zmi
	QXpR6bC2wedk9o1oLAeZmTC1smvrsVqh97sM5wKPpAMLPrjFqkLki7wVVARWDvjNPcTgpL8Z7lKlv
	reb/l20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTsV-0000000GYlM-0fVc;
	Sat, 15 Mar 2025 15:56:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgv-0000000GX2L-40SD;
	Sat, 15 Mar 2025 15:44:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso4605565e9.1;
        Sat, 15 Mar 2025 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053488; x=1742658288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=;
        b=ILagMfU/BEXwPwROO383ki3QkiqN0aO40zDUrOng3bpESbJMCJB4vWzeMtPGtItjdi
         4/dyN0Kwra5xbZAnJE+SROSUb9ScfF84jDYH7YB/tZntZhU8TT/OVaI5K4P7iQc+KXFN
         mfbbUNVk2lcsVbULGJrpBc5zdRz6Con6zXw89npYSiMSUx5xc35KSIw5RQ1M5oNGTnaM
         hXwL4h7FUfH9JsGhoNQ8zMS4g7IWyylqxW1j3TA/r9cfUDwu9XpOtvh9D1mbzQsxK7uT
         v8+8WpOK1MYPyXKmcf+5dbhKbWnexaIe0mIhy4o1FGm2DIhTBgUCEpzrK1sKYAWSACUX
         R1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053488; x=1742658288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=;
        b=HP8GoCcaQZw/HFMd/1Yw4R9lgmKYodjYxawx3IaTCwgq2MuKUIrQgARuiQgEtxbkSX
         OmKjDapr8ZOYaif9H9ZgU9Cu/33fDKPT8XUw51+diKgah+Svkqd0EmUfyghOdKl9WmCm
         ex+uPEEPG039HvfdZc6MEOgRmB0z3V8hy/8ZJBNoRwTwbMaLSV0s+z+exeXvyUm4yokX
         XxlyYbu+QYkfpTFnhCLfWI3kUMyVC/ykgvyLmqDI+UPbMkWGnlJ0M/jMQtx0VHsy9GKv
         wKQA+eb9UEF8JFBFnSvQGLHG9yv0lm0pC6Ajwv9zPOwUqvr90kV/RLaZR4fiMRjLIckL
         GYzg==
X-Forwarded-Encrypted: i=1; AJvYcCXBMXK+KrCn+T5tU4GtZR3xjRVOch2JtYhWYGXaVa3ZGmX3udzCKYfGvpXMDe2AeX/2U7ENWWjFRC4oIdWx/iI=@lists.infradead.org, AJvYcCXRQVIZKwJchq0QMCX5CizNA5dh0ftK3RBqvOk6Bbkmhv7jcIOcpCd+dA0R9g8bDzqdaGWKA+U+9rzuyzUsjtyw@lists.infradead.org
X-Gm-Message-State: AOJu0YxTWot4cTaes5xqUcuXJr/nBKKAQudwhxxbcigaLOFLTTA11hCj
	b4+ZTmqYnQaNnNFVSVYdj9CYkvTvqEu7cAqEBOwYXi7HVudQTTp4
X-Gm-Gg: ASbGncvItGHc7i6Pn0Q37d79sRRCNThsQtbPcLCJlD8i3NTQ9lUJ9HLtyLrGA1ImRMi
	suNdsi1/IyeCAooS8eZInRl2tN+dgFiHNEdzjPaxeBAtzboMa66KXqQA3ovpyeh5IVX2Y1yZ/zJ
	E4FOOWjiSUuXeiSzRb7uN1gD7gt4sRlz00R05EjodP/XuAfwoJjobMed+PnOBkNunDU++yBtSsd
	ASNqB6/Q00IIAAKEElwbrnuEnQ6Kc6A3B064Yhu6OvbtGXNJdRwMplRM+fo+lKN65ldYO+T6VrL
	ThcmSPdJtj9QxzJ8YR8B5eOQpMsfbqI4daNkTi2n0XdnBtn4B8YkU4vmvF+LOx+moDlDHHxhUBO
	0+q1OArC0acgSMA==
X-Google-Smtp-Source: AGHT+IGir5EjbBHxfMQYrp8pkd06ZMtYDcN3X2GtiQlfMspqlPbumHAhw6bjrr+M4eP0wyzj84nKQg==
X-Received: by 2002:a05:600c:4fd3:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43d1ec9071amr88893115e9.5.1742053488011;
        Sat, 15 Mar 2025 08:44:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:47 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 06/14] net: mdio: regmap: prepare support for multiple valid addr
Date: Sat, 15 Mar 2025 16:43:46 +0100
Message-ID: <20250315154407.26304-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084450_008218_DECBED7D 
X-CRM114-Status: GOOD (  15.17  )
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


