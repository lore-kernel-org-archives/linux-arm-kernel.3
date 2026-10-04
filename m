Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55364CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HArI0GqWQQ9wXZmElGrKtHu5g8ZbfDICvR7ZMSTUUN0=; b=NnXHv4mxKWimq6a1AJjdR9Lfh2
	BHQGMeTDRAAF28YDhuuPSf7u3OcWeDVIKn7IIOx+Mta1zRGqMIBuzipqWhYEpGcwfbcNvpQk2ERjf
	Q/n8/1biNyCVeaXHWqkHLxRxauCzX5gHvHZoTqD8GFmMaj6LudkX9uA9Z3p8pCac59V3KLYpYaZ0i
	YcUvioZDBVAYaGJI3MqjZiFWbnlCT3ffKSI3/FC3GVtMh579MvyyKmRTkduQc3HeYJWBBAnNK2DoJ
	a9j3eg22ECSoCbeAIDLauieoybZFMad0bxzd5XA8XCOMjHUDRQXQqP84ckhO/deuTzx9qTVueBURx
	HKvdQccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOc-0000000EvLp-3Qyv;
	Sun, 04 Oct 2026 14:40:58 +0000
Received: from mail-wr2-f35.google.com ([74.125.225.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOX-0000000EvEQ-21Iw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:54 +0000
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso411679f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124851; x=1791729651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HArI0GqWQQ9wXZmElGrKtHu5g8ZbfDICvR7ZMSTUUN0=;
        b=N0cW0lK0FXd5t1pBY59nZgd1HxUcpZvwWFwSAqEaFl/S8PFsPtF9p98O5ue/OLGbuv
         0YpSRvhbNjgw16qIDH+Q/KzF3Bj/7JEDoAHeWJMbimkynFWLM/kdsxY31hhiz3ysjOTO
         zA0Bs1y7VLd7UDHQpKjuRf4gXy/VzHNWB3YkZsGVF0AuUTmSLeNmoi06gjN/vbjAW+O/
         9HELmzUXbaeHvkRu+u00f2a/kApSgARtyD+fDU0BKXvHkKO4HxyoUtWDeGiit0JG0zrR
         1lQEp5wBBRjAqBtvrC7ECo3ytY01d4kTVlpcMgcH+AdbRznBizGtc/T6VtE/aDWVNnJD
         9EiA==
X-Forwarded-Encrypted: i=1; AKwUvBxkdKzzudC7XBb++BvEh9F/vM+kixNUDe7v6mtoexZOTv6A3vevBKTx3Ux+74BEdGYiBbaMld7J5Aq437NzjTqT@lists.infradead.org
X-Gm-Message-State: AFuF++nTvfVA9kzNfcaZG9K+YJ74bzXJxOMPmT2wgGVic8ILJleObQ5l
	G9tEfxBmRDvEXBL+/rqvBUbLl+m7VILlODeg2PDW7FmUpg0x5CHTXlH+
X-Gm-Gg: AYBFou0+QVoxAtmOg11nQdoy56Fxcfo1/93hWtGjLZ7XtzybeANHfqv4GVJ52HVELED
	UIM6EbhmSx/ZZHMUM6KYsfJFFZyIqhAdmvtu4fOyFgPM+j2ju/U7YSFNjfFo8QmFqNoZcLL9IQG
	cV7a1WdotrwD4h4VniRxF/JC6vBM572E2cT35K/G66uIVWcfXKQVgLn173AnstULynsVzLkHf0e
	CKwfAhXje+LjQwOtiAyCdxZpaIPiusM47NMeisElzBdpwJDAXJvNWef0KyD+erQYs1gwxaa82jy
	U7jMBkhNpneLpfXWB8B8HOwLwcgN+IlM/0d8n4AgNpo+ob5GCU6hFdQGMdVW2iHMwmaBBKTwHEf
	uNFcA/enjAZufVG/tB22BD9YKh+XiUsIPrFYMESCkeBNHzigBXCCTbdyPURnrXbBfoRjKtS8eym
	/3t3dIMgFp8hzkE479vo2dHM5OlPBlTLNqac80vkVXi2zUn25o47gfksGB5eizYRXu1L7kdis5C
	X6QHVaClGjH3xYXEySyBV2gPZOuo5RNLw==
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a02769ac74mr132090935e9.35.1791124851353;
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sun,  4 Oct 2026 15:40:43 +0100
Message-ID: <20261004144046.391444-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074053_581258_5C9168AF 
X-CRM114-Status: GOOD (  16.87  )
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

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What the T7 does not share is how the controller reaches DRAM: the bus
path goes through a pipeline stage with a gate of its own, and no device
other than the controller has any use for that gate. Claim it and hold
it enabled for as long as the controller is bound, otherwise it is
switched off as unused and a transfer that has been started can never
complete.

Give the T7 match data of its own so that only it looks the clock up,
and require the clock instead of treating it as optional: the controller
cannot do DMA without it, and failing the probe with a clear message
beats booting and hitting an undiagnosable hang later.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0


