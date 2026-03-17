Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E64FED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=; b=hGFCSHZQ4ro/Scy6egYb6CMri/
	pHdhZwb6jvmHAAVFt3+eUrqF2kykn4wpQlDSNbo6BDgYeLAPgcI3W+KjlJWWF9Jl3QRRD+Xl0tzOs
	k16u26eMHFIpzAOfAb4VaD7UE1ZDgKLAFS7OYAVCf+avTeklD2DA7kM0V+ki/WKRggPB4bn2GYQQ0
	HC+CSb4oUXlGEbTJ+5NZXA6e/k/Xql1/lnpZP2k9W43Sl8vvcd3tOtjIBcDWolCJwmODZfgrACAr4
	utrFVpwz0bp3cD6Z1+lWUx5sG6K0q+yM+g+lRd9Y249NZo3W5w0x27Ah39Tq7WxyE2EzIWGoSZzr5
	XT5xcWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YqA-000000071A0-1Jci;
	Tue, 17 Mar 2026 18:08:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yq6-0000000714w-2cjK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:08:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b49819938so855343f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770901; x=1774375701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=;
        b=ynK/KZZcV5dJlCxO6Pl5SZ0vIdhUwtwiISJpW4ql7J28PBSPbSqUYhD3Aw1dUfsSN6
         G1Pr6LcfwLVwXNlQquj5suOCfN3Gcdo21OZi2yFTc2j6xxYu/LH5uwnfO7HZ925A2Eoe
         s82gPwYp1sYfboMONjS7+uSBSCx8/i6b4zyh5OU6Q+uejukGXLeznCfWkArCGYIb+MbN
         KFjy6o9JB1RHjXBzw+XXaeTN1AjbskjGgEFlVB78b3SCktlKZ6OoFRqJJw77CBIXpqM6
         r7DKwIFQFFQBoPsY3Q03B/dya2aP9wUQKVJkYYvPUelWzzbM61GGKVrzlt0ig4hhtK7Y
         DARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770901; x=1774375701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=;
        b=Q6KjWHjLzZ+j/9fFEvw9KsBn0T3GX33HgPVhLdOcB+DcYNPqBLfWIjYfhgkZAtID93
         KAoQCix9hs1i+94OdTBe5TadNzixOVCiyhO9Xt8p0DZ3aVAYtu8URKmNh4lAeMAE8PRJ
         o9oa+RXgI3nq8fFlglDy848FEzY6BO2UI0nTxQ7qWtlbYD+xcVHm0PGR+xQMLLTDSxTu
         4nM90GS4GQbcIyLN1HC+pYkKxYwy/KRNWyLPEN8+5fQk6/aOVL9+asuouIZDVQTX+XdQ
         k3AaxIDpGGxXwpu3wg7yyw851gd34NmY0iZPMDO9O+2Vj4NPEuu8SH5fYKSktxKqoAl0
         qd0g==
X-Forwarded-Encrypted: i=1; AJvYcCWu3bveW88hODorAxozx1SF49B6dPrCUZ2wy9Gf6BtdBy0nOxG249Lj6491NoJo9mihXU7p5iDJRvS8gNtFeos8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyes6LKc21HJId6kfcEbh23TpvzPLjGy0kzAcK2zOqYAas+ZYgh
	JIeZYylbEJAT2njnS/PyVNPSXwLJCNPCo975EVE0Dfm9qrza6e+wJ1ti0f7Hp+S5GdI=
X-Gm-Gg: ATEYQzzVm5e+szXyrqm01/YVZQ8z/s8AjnaMWcpCIvdDtoWYLCuHeLcIDJhSjrhemFe
	j7x6Ubl2t6w0TgOIcnPNnbjxHzafcwNHWc1oKJwz/g9MtZG3Hp0/WOvJhpnZlMXADkOj0/IsT4T
	pgusu/GEZZ/437qV3FrdQm6KQ0bR890Tv50Wr1xnGSGDYwDtG5nuH5mGpJInn1U4gmhU3gNBQCh
	e9Uvx09gDWH5ABP0kJl63u0xlPlWb7MTs8IkguMlakcJGYAGpXkk8ReDOirzFBCJnkNi/2lf8GD
	IudngolAVa/qCZvM2j21CUZkGlKWuYYKd5yUj9gjK80ts8rgNFN3VeFwUnBCwsJsHV7pAF0aumF
	/7y55/1qsnp04naaiyVO+6A6DTA43QjByEMjoFJVmY6F8tRHr4N4ughvAvPciTfXOzDVyq7S8DJ
	rfR3Sda1LztpWBz9oFMLBEiK22Wa8yy7Yo1judGaEQjgn4euBV3An0p0qZqWLaXuWXwCwStkl6G
	JeYFe493hZjJVm4
X-Received: by 2002:a5d:5d13:0:b0:43b:45d1:f448 with SMTP id ffacd0b85a97d-43b527aa5bbmr374980f8f.14.1773770900811;
        Tue, 17 Mar 2026 11:08:20 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:20 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:08:01 +0400
Subject: [PATCH v2 4/5] usb: typec: tcpci_rt1711h: Drop unnecessary
 VID/PID/DID checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-4-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767; i=alchark@flipper.net;
 h=from:subject:message-id; bh=adUNrc5DmhRHUleLGmdaxH9/D4sLCU6UUObKtpN1GPU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNEm7lq/wyh58vysd8teFvqaSX7aqZlhekVIp2SHw
 hzjoNeiHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz1VmuGfxYZ97tT9/Pu1tP4ff9FTPE84X1lm3ofM82yYv76Y4acTR4jw5pHJ93
 58wTaY1/eUZrd5S50eEub3t7nTuf2MzMeNDBdxw8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110822_708151_82D7AC6E 
X-CRM114-Status: GOOD (  16.18  )
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

Existing checks for VID/PID/DID in the driver are redundant since the
driver is already matched to the device via I2C device ID and OF
compatible strings, and they preclude the use of fallback compatibles.

Remove them to make the driver slimmer and adding new clones easier.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 59 ++--------------------------------
 1 file changed, 2 insertions(+), 57 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 37cf55ad74f8..4b3e4e22a82e 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -18,13 +18,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
-#define RT1711H_VID		0x29CF
-#define ET7304_VID		0x6DCF
-#define RT1711H_PID		0x1711
-#define RT1711H_DID		0x2171
-#define RT1715_DID		0x2173
-#define ET7304_DID		0x2173
-
 #define RT1711H_PHYCTRL1	0x80
 #define RT1711H_PHYCTRL2	0x81
 
@@ -57,8 +50,6 @@
 
 struct rt1711h_chip_info {
 	u32 rxdz_sel;
-	u16 vid;
-	u16 did;
 	bool enable_pd30_extended_message;
 };
 
@@ -304,35 +295,6 @@ static int rt1711h_sw_reset(struct rt1711h_chip *chip)
 	return 0;
 }
 
-static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *chip)
-{
-	int ret;
-
-	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
-	if (ret < 0)
-		return ret;
-	if (ret != chip->info->vid) {
-		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
-		return -ENODEV;
-	}
-	ret = i2c_smbus_read_word_data(i2c, TCPC_PRODUCT_ID);
-	if (ret < 0)
-		return ret;
-	if (ret != RT1711H_PID) {
-		dev_err(&i2c->dev, "pid is not correct, 0x%04x\n", ret);
-		return -ENODEV;
-	}
-	ret = i2c_smbus_read_word_data(i2c, TCPC_BCD_DEV);
-	if (ret < 0)
-		return ret;
-	if (ret != chip->info->did) {
-		dev_err(&i2c->dev, "did is not correct, 0x%04x\n", ret);
-		return -ENODEV;
-	}
-	dev_dbg(&i2c->dev, "did is 0x%04x\n", ret);
-	return ret;
-}
-
 static int rt1711h_probe(struct i2c_client *client)
 {
 	int ret;
@@ -349,12 +311,6 @@ static int rt1711h_probe(struct i2c_client *client)
 
 	chip->info = i2c_get_match_data(client);
 
-	ret = rt1711h_check_revision(client, chip);
-	if (ret < 0) {
-		dev_err(&client->dev, "check vid/pid fail\n");
-		return ret;
-	}
-
 	chip->data.regmap = devm_regmap_init_i2c(client,
 						 &rt1711h_regmap_config);
 	if (IS_ERR(chip->data.regmap))
@@ -408,27 +364,16 @@ static void rt1711h_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
-static const struct rt1711h_chip_info et7304 = {
-	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
-	.vid = ET7304_VID,
-	.did = ET7304_DID,
-	.enable_pd30_extended_message = true,
-};
-
 static const struct rt1711h_chip_info rt1711h = {
-	.vid = RT1711H_VID,
-	.did = RT1711H_DID,
 };
 
 static const struct rt1711h_chip_info rt1715 = {
 	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
-	.vid = RT1711H_VID,
-	.did = RT1715_DID,
 	.enable_pd30_extended_message = true,
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
-	{ "et7304", (kernel_ulong_t)&et7304 },
+	{ "et7304", (kernel_ulong_t)&rt1715 },
 	{ "rt1711h", (kernel_ulong_t)&rt1711h },
 	{ "rt1715", (kernel_ulong_t)&rt1715 },
 	{}
@@ -436,7 +381,7 @@ static const struct i2c_device_id rt1711h_id[] = {
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
 static const struct of_device_id rt1711h_of_match[] = {
-	{ .compatible = "etekmicro,et7304", .data = &et7304 },
+	{ .compatible = "etekmicro,et7304", .data = &rt1715 },
 	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
 	{ .compatible = "richtek,rt1715", .data = &rt1715 },
 	{}

-- 
2.52.0


