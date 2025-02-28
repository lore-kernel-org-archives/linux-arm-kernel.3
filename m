Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285B3C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=; b=v96X5iDicvbgVT3vzNuDxVZYh6
	FqpoujWqk0r3kF+cV/1Y3kNOHxbWlDk5f3eVxu7ZTifkEWL0NDkcXrvmpuqN7cHX1Y5xMbmpnX87q
	lpvb3aoWwDbV4OaLkNSF8yQZsXOQKP/CAy/zqhNmIcpgkncujI6iI4P14ykScdpu/50bVjZtltvnh
	Dsx/vp+RU1r19qrT0SAZrkNc3ga3zIE1FCpxjDkoLnI79Cd0Cfngn2UjENrdIe8f6S9I1Zp+LeaAK
	PupCZ9gfv3YW0mkVLVMmU+oFK552XhqstFszFYsBqY4+9ttU2CzrVwNR4TOYS/0FRnKrIBKlEH1Zs
	S5KdO1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8FE-0000000Cm8Z-38mV;
	Fri, 28 Feb 2025 21:50:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8CF-0000000ClRl-2tHO;
	Fri, 28 Feb 2025 21:47:04 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so4207417a12.2;
        Fri, 28 Feb 2025 13:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779222; x=1741384022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=nfeG4ZE+RQe/yPLaNDru/SywJBia9o4f7X2A53tpeahzGGG+jIDQRNqGU/qXrltHZY
         GkhIDZto/wqxmxBd/fH27F0Tvgy9sYZZKKl6hebiYsgfiJo3UdpjIQOUIBTjOMe3PEwS
         ELYXGnoV29oVyvQexIuywvIxtDQiTaKrD5EFJGMEnEegehjC73R+IzrwqkDPTAOawag/
         Lsrf/dS8KPvD3uYRztBQeUfVccOZTUyhVNIkhhkmj5YnLI3OjJZalWfbgu4DLlSjRpeu
         mGFE37Vatvq/VVzZLUj6abgzvSBgVFqsmWd0+oAZcRmrQ/fwoTE7RT6taoxv6Bihc8c2
         KPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779222; x=1741384022;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=Wc38/CjutdNSuIJ3yeLDW7TIeZ/IdojUDrBgtek0vYKK78IImZ6xAbH8HJhxOc2D2H
         XWYT7qdVLz5rIuxr1ZFya3+ZnEUO/T4ihFAY0BzfCK6NSAoCRYGZ1LFWydorbqMfEctU
         xYxSbllT6j7KNMBpE6PoVFjF2YDPRxrSa3fUy7fzXk1M8/c0A1MQxJAi9BfCmHMzOHTx
         lCxzdlSgbXOFPqBJtWAF80ZlnYTi57Eu65tOXVJYsl19pe1nQ9nOQQ9whVvjQtPNiYUM
         94H+8qa/0h4qIKgMyBxYda+mpqD+8vfpwFFq3YmH+oGwbWuJMrjBOo/dmEd8t88LSg7b
         3SDg==
X-Forwarded-Encrypted: i=1; AJvYcCWdaX8mdV+DMPz4aq7xr6rmyVkTcG4zGWiFA9AoxDoaE9LgYxmcYLexzyLJc6K1nFPhkGhv+VU783cWBH6jP5c=@lists.infradead.org, AJvYcCXkCuXAn+Cgupw+CIxg6c1vctSbDeHp/VXxMR46Thx9v8DMpB1/um9viBqHuDj8lyXAgjunUK3kFr93WYydtQbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyHYsGzbOCIdnmOh/HdvaMVcKIBljAEfCeeV1AJMRRW1wbgCRP0
	h2WMeICJtIqdCnxn2yQ5PG8n6ngueQXdnSraxrmmKi9+y/ydtZXB
X-Gm-Gg: ASbGncv6Loo4ubKZ0Y18/u13CtVJx/CgHE59WUiUZLFAU2nm9FE0z8H33cXtg4kA240
	62xUrVPOC2JBzIbqTIhc+I/uXv3ZL99WNHrBk3vtFE4WFTjeWtMOWCJQUY/fUidsrSIJvwDoabg
	0jGdxOhDbPnBPgL9zS0r0vJw0TCZBd/cuecCQfrdxTbdGLDVHZD9kezI2iIEgf/KF80PIwMJbvx
	PUfmN93P6i/MPBALfiWSmcJWoPt6c+JxT5LkN72Cl007x19mE3DeXIWvyzoRVbqP85WjKz79LHE
	Jk5tyOXDEXn3IkzzNA5eIHqgr+2euPrI57T3VCeAMpdFhyng+bGVCDkQKXXun9Cfuvxkl0W6UJr
	1OlQixHL4iNRx0D8ni07mB63plf3WNtTAMDlZ7TsBRarNtzUY06vXorgP5Khz4/Ex6Ky9AKC/hv
	xJdCNoulBB3npzciuH5w==
X-Google-Smtp-Source: AGHT+IExl1j4pHBwdTbidpfyZFj4T5YmQ4QIQxv+UwSzRsUopoj7fPWFY6xPxbeL8P2l/qxJQ1aoCA==
X-Received: by 2002:a17:907:96a2:b0:abe:eebf:ae54 with SMTP id a640c23a62f3a-abf25fdbdb3mr501157666b.20.1740779221688;
        Fri, 28 Feb 2025 13:47:01 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c6ee486sm356284766b.90.2025.02.28.13.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:47:01 -0800 (PST)
Message-ID: <fbdf85ea-81d4-4a87-9560-262edeb97468@gmail.com>
Date: Fri, 28 Feb 2025 22:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 3/8] net: phy: qca807x: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134703_734402_F0B89627 
X-CRM114-Status: GOOD (  13.51  )
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

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/qcom/qca807x.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 2ad8c2586..1af6b5ead 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/sfp.h>
 
+#include "../phylib.h"
 #include "qcom.h"
 
 #define QCA807X_CHIP_CONFIGURATION				0x1f
@@ -486,13 +487,13 @@ static int qca807x_read_status(struct phy_device *phydev)
 
 static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
+	struct device_node *np = phy_package_get_node(phydev);
 	unsigned int tx_drive_strength;
 	const char *package_mode_name;
 
 	/* Default to 600mw if not defined */
-	if (of_property_read_u32(shared->np, "qcom,tx-drive-strength-milliwatt",
+	if (of_property_read_u32(np, "qcom,tx-drive-strength-milliwatt",
 				 &tx_drive_strength))
 		tx_drive_strength = 600;
 
@@ -541,7 +542,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 	}
 
 	priv->package_mode = PHY_INTERFACE_MODE_NA;
-	if (!of_property_read_string(shared->np, "qcom,package-mode",
+	if (!of_property_read_string(np, "qcom,package-mode",
 				     &package_mode_name)) {
 		if (!strcasecmp(package_mode_name,
 				phy_modes(PHY_INTERFACE_MODE_PSGMII)))
@@ -558,8 +559,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 
 static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
 	int val, ret;
 
 	/* Make sure PHY follow PHY package mode if enforced */
@@ -708,7 +708,6 @@ static int qca807x_probe(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct qca807x_shared_priv *shared_priv;
 	struct device *dev = &phydev->mdio.dev;
-	struct phy_package_shared *shared;
 	struct qca807x_priv *priv;
 	int ret;
 
@@ -722,8 +721,7 @@ static int qca807x_probe(struct phy_device *phydev)
 			return ret;
 	}
 
-	shared = phydev->shared;
-	shared_priv = shared->priv;
+	shared_priv = phy_package_get_priv(phydev);
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-- 
2.48.1



