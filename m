Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A0DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=; b=Qw5fYJQIaFcql29efCozkNR5w9
	otXbxGyXt/xHMr3HjSj2nrXi2aSXeJ3EoJxOC2AqKQ4uhloULOZs0gi1SDGX0zr1nFuJxE0snFkMG
	aFuyf3qETPaiiWEP/fB+2AmjV5ej5uzed+EoWhl/MJ1keabJlj1b0BsOMV3gSNoSYh4BkcBHPsOR3
	imuA+jBu3QLzCV44CbXRD2ZkS0B/3RzGxy5CfKySeakteEaLf5buvo6cbPvOBIOoF5OMbp2ANd27y
	w+CFLfAEtvS+6WUPhu+jyk1V8u/54OVBXeGo4jx9jguS+rf5Xmt97upLg4Yh1LrC9xkW23zR4+iQd
	2W4RYC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmck-0000000Cg17-3XBb;
	Mon, 20 Oct 2025 09:56:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmci-0000000Cg09-3dPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:56:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-269af38418aso49620195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954176; x=1761558976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=;
        b=KLt0tbs9e10GXac+wt/+pyNOUfhCfQnEVKAXKky1p7cEkho900l6B/TgoKPiIXWulk
         vsoWG6810CMzLpTTYIV8FKktN4DMhyB9Jk1WfUpdiWDUdj4VadQHKE0fvijs+1OhfPAp
         7qV4XInHJJJ/hMJhTLeDrBAtTLl/0EJKn5EVI27eBbnC9ev0RO0bct7KZp6nrnguueaA
         X8PNXEpTJwJuNlFrzfoP0xyiduUSDEL1xREfc4w7VilWP5mDvTb8jaI36Hh9ZxGOD2yH
         GTBpvWfofHZRfRJ9vk2TyaoSIUypeu3cC8/KECD+l+JC+xsxucO/Op+yrQAu8dcUtctV
         FGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954176; x=1761558976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=;
        b=OzF7jljiKjF308ZVSDBWwO7tU9oAqtzogYYOvu4Cx95JrSD304x6/TPMb5EHTNxS0Z
         eFatiUr6Gg1QzvimMNYSgEwe+naMS8GJV/c4nSnIUAJ5sdxPx46TDT4JuXN0PiE8YT4A
         /mj4U7rQD7CQiMG8zQCS7dsPoJ7elEalFaCPkyKJj/4INaSdDed6VgFJgGgW3GGwVLG8
         +rgA0jq8lDsdi3HtBIkHvEm3p3cfejM8l5d11AxqWOxQqssHfyXCnmiAf9QHS2Xy3+6M
         oiravZzl9o8V71IiMC/+WEDu8M/KFouc1Ti0Timv2I/r5qZA04QpZeI1zyRjCmJrPcLR
         ILQA==
X-Forwarded-Encrypted: i=1; AJvYcCV8QQFckbMEEDmvNQ9ar27xPge8tj04PuqG4ONOabX/0rUfsIu941fKofrStJ5voAz6zsbcdaK5lIlJF3um3+Kz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kR+HX3mfiRZPKf+dBwQ2ZFrwkzErqRWaZCUxniLqKveFeVhY
	tddsu+E0GS4wocOwLWS2iEug+4vqxUE51TGtueGobZY0Grr1qE4p9PZW
X-Gm-Gg: ASbGncs3JCcx5ZTRbv8WZ5yBVwG2HVqBd5VZcAT7IoSBAlSf9zYO4FxVIS9dl+ZvH3U
	wJGJN+w78HO3cXd2bjNb7QjkzXnXpRVaDwvAvPIMlraMwqnMjV5OEbLdQqJRtMGZ23xOjDc4+qN
	S4r+CshI7jlRCZ6BRxwlsE5pBwDObEvMm2s6rELsPfvyBHRciUIqXOq2yZQnx3D7U+jiA60S6Mg
	TijYirBuog2RwhznWXdKowoKWKXRbUFZ8qcbX7RlTR3P679q0rzehahKG1TdDAagUx7VybkPcrj
	96MGdT+3KIgmodlMnChKFV+XOTRqrT18312vWYQExfKxAmxaHazPouN2XXH/oh7It4Q0Ld0L3Kc
	US60hOAEHn8F+vCPg8CdYxcqZqiXaD11J/2/qkVKnzxoacB1qhEfrqqkoPGyIyLJaaDKV7zpouU
	g=
X-Google-Smtp-Source: AGHT+IGGbVMAvLRNPJzY/dwiHRiAXKBM0roNWAjS8uuWlxmmRK+1VU9M3wcXUApOTf5kLg4NLvhkzA==
X-Received: by 2002:a17:902:eccb:b0:28e:80d7:662d with SMTP id d9443c01a7336-290cbb483demr161050105ad.58.1760954175971;
        Mon, 20 Oct 2025 02:56:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5794sm74880555ad.53.2025.10.20.02.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon, 20 Oct 2025 17:54:59 +0800
Message-ID: <20251020095500.1330057-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025616_909136_407E8B88 
X-CRM114-Status: GOOD (  17.35  )
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..960357d6e282 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,11 +7,16 @@

 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>

 #include "stmmac_platform.h"

+struct sophgo_dwmac_data {
+	bool has_internal_rx_delay;
+};
+
 static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat_dat,
 				    struct stmmac_resources *stmmac_res)
@@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	const struct sophgo_dwmac_data *data;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	data = device_get_match_data(&pdev->dev);
+	if (data && data->has_internal_rx_delay)
+		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+									  false, true);
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }

+static struct sophgo_dwmac_data sg2042_dwmac_data = {
+	.has_internal_rx_delay = true,
+};
+
 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
--
2.51.1.dirty


