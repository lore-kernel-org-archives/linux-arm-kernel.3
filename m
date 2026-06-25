Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F2CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzOAV6c9l3ZEl/l0f1yRQMyMZSVcr0iRgNVJE+KGFHU=; b=EBXMfUgVqJXPEBbw71mnx5V3kR
	gg668Qonzws8xLT89t0bwgI+Qh1b/mdcRn93/ZQvf3EiKGRSo/HN+oDCz0FpnQEVJ3yjW4MPdyDfZ
	ULNr0mEHFkiA2Cc2QNL2KrklduYXhvFbtNcq2p0+9XEzFIoBeHEZ5lPUK8dnmhD3q3ViLRHaGwIQh
	0gzXgoHt2PDFPLxQKmrrl1OKcLOZVBDcVbPijW0zDgh7zuipv20GLRAZGEqTIBXtoydKP+olak/dc
	JWiQdRK6DEZHkQcG5OFGuEFmEW/8IoeXEHg8g/FJZaSCpi2gsN4WXtSzfLihkQ27rnFsj/34EiyEb
	XmLyesvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3s-00000009aAO-36gQ;
	Thu, 25 Jun 2026 17:40:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3G-00000009ZUS-3oxH;
	Thu, 25 Jun 2026 17:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=CX6yNn6+XDm6w4SYFDDYmShaWUqfCpkp+4yIyGiYUSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KK0yXC+7+PI4hJeIIiTs5Gc/bnXR8un5kLwY8L6L9GGuPh1plJv2m6ygnb6TiOsxC
	 ekeEjEwuNPGJ7Kh3xdy9ZWl1zNwJbViCksdMNDTns3//3fEKlpTyJKH91RSTNWC3yd
	 PVIw60j7gjkA3rnIXMOR0z6tS0bKoD2dcXTEep3nyjl/a2yQZpviH+CALdrdn3BQ/n
	 oc6DGglsMOryytQfuFnDxIIAQ9JnRymzVl2hu2/7veoKE6xi79v73KUV2O5cfwQGK8
	 KJPvbRB/XxuCQ/TWsRyJStt4cxGBEwvRNrhd+KJKT9r4pTslQ7Eq3drTMIAVDMZyxg
	 PK/kDFCNsh+qg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A76117E1164;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 020E1480031; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:33 +0200
Subject: [PATCH v7 06/27] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-6-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CX6yNn6+XDm6w4SYFDDYmShaWUqfCpkp+4yIyGiYUSo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9vrj0Ft46lz+xwypywFClpHa6W4BaI+S
 HUnVrpNYiDnX4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaOl8P/R6AubIEOJ9pXnx0wpaMTGM80KIcULUaJn9mmw4palqprfb0El6m/W6qDsxJ7totyJL
 Ikijmmir+O2PEE/FSxBBLIXwe51weT1fyNHUTZt/ZbZArP7afcH1nmHD6+GSm1P1TJPmV0AAeBO
 llXUDTkOplT0RDBL8Ygmueac101NoNpllK2KXKykTTya6YPODUemPRRQJvEUhh/WLp7s3ODwmZu
 eMcRJ3sOD2RlvurGADATv5PaaLeUrVwE4FUPpW2/mVVRG8AJZZr6kqUBxIG+UGI+J1DywaoVHrd
 2FKUqTW5xBIfu4xCb2VBVELRUJbiTs8+O+gTTk4fFbuAXwB9oTGBMJZGTToQtjw0W9DBg12AuUJ
 qPR/mPn2zvFuk3gyoMApX9Bs6IrR68NxxBK5JhZJFn3RT7Q6GMZdeBS/KvicNThcaBOOvRWTIrm
 lUZMhXdF7MIhmDL8Frj8+OgO9lHfRwz10RPPpvYclkm5yPVp+lRLKNK1R7Ga4G4Qzc2p5HU9A9q
 1RGpHzTnGdl4pggS9ep/pWa0eMyDMy8DNtjAumpnDMw7C1FN0skaTfaTQmpczH164U/6v1m+vYy
 51M7xgbngCNz4fofK66QcwgtOxhVwI+3Vb14IjnmPkd/O2gs+SFAjcKK220i7jLNw1Yf5/K5wMt
 UeZWPFavrFoovrd/SWKokMw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103947_111610_7EFCEC55 
X-CRM114-Status: GOOD (  11.42  )
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

If the bootloader already enabled DP, keeping it enabled here means
the DRM stack can do a seamless takeover. Right now the DRM does not
support this and the code will leak clock resources on module removal,
so just drop this feature.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..7fa3cd519577 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -939,9 +939,9 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
 	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+		dev_dbg(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0


