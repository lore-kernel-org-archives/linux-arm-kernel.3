Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1215CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=; b=fR+8aLFeMpWRpgG+H2qtrQYriy
	DlvTheE91lN+YrH0ZhVMy6WXpOgc0PehK+4ZKVGtxbJIY2HKYcklK2q+A4MFuDV9S96661SMKPeSW
	+8LrGiUMCfVpghJiE2eCRuAVG9V0DGbvR2rCGCgj5qMUH6uXtdXmB6l0Il0S3p3baUko+jrlLOqng
	IJmGJcOVbByAGOY/tKBc7QNB2oZCJF9fOwDC8V4ZtJio2WdmfZ6lr+2oIutILPF1jdIgYEuZOIaRV
	e8ZLWfiNxBbZMusB1/WQWCllgr1rcL1Ht4jKnfyOmZHfvvfLgIdafKYl+qhB4i0Ehz+RUNjJLyPnz
	K2Dal9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyz-00000001wTl-0bRP;
	Wed, 07 Oct 2026 08:26:37 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyx-00000001wQS-0Jhh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c6f764f82so452998f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361593; x=1791966393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=IoBxzHkuo2fLx3b1G93fU4157KZArevjIZTiq0pAO6zz9FlQrLx9+tHd+93DoXcmTN
         /AaTNi8Fid0JVkVj6cU3B37jjd5pRvi2BJOCi3haObywQ6iFm0uWNIBu0pcOpSXOkxtw
         3AzhJs6QPMbL1j+rUh49Mdby9llsrzdVwqYW+k2tIBjk97McALjv/z42aWXIRAFx7saG
         FOZKNF07CLYwyArhHN4/Iqy/btsBRi8XxidbAk6wg40TcFBt4+XVc6VegeoffnutqZ+T
         MmTs3iywQeBh4Os5CIygkxaWeeK30bq5EA8/RfnRME5rqO1nGZspbnr5E/vYuZwC3rKJ
         4p9w==
X-Forwarded-Encrypted: i=1; AKwUvBwvozRbZOely8Wm+45PmfbX0G5RlhyqXYOk139ObwoSKunbQ9APWAaiC1tekDjw2tU42sBQoq+YKP2NdKLIxEiu@lists.infradead.org
X-Gm-Message-State: AFq9FYL0KTdsNcwn8kZELNAXp4bKBZPzzVghUB4NNMighmcmZqV1Th43
	BGPCOPl9r6SyLhtQM52lWsPlr0SaTVRkGpX7HDd66r40LO3wwbUsjnsE
X-Gm-Gg: AYBFou38HO+0bWONw0bmXxXycEQqdQKkFjwdFcETz8NpDoh0ScXDmcBvxSPb/otjXs5
	oj/f3VofJULr+MAk7y2oM/jBCPGueytlAZx4GcSkXF+twu6zIAjdiUvbVCAQippBKKNwpAFuMh9
	QM3M6vCzIv1A+kAuxFr0u83Hk94x9Qf4eLNj5yzmsbK8KVaaCe7CG5/LQO+4XuB4o6v2UtyBW9k
	AdDpy9S8y7/AndDf1UfryPvnC9mS/Q/R8QpaH+7+eUqBoCmFugJtiwrc8+Je31wlQeTlAgcHw8C
	bTd6kHqhmbFjRZ8gvhmYg15Me6vdXxrqivhdeCqHPw1tB6OV9fX5y28mW0fZ7k28ijI3Skrqv8I
	3cX7bkWThbuHT3ByzYlBS8K8pXdaG24M58tHo3FK55I5W7YhalhS5PU55/VOKvKns2lTfTmIYet
	cK64mAZ6XkyjylUb2CRCqlQhtpxqgHrZL931+kDWdL+Z0hgXkI5AXQBWFCb7PY2KVtVoh/jCGaO
	nf3rDK/4YvAq/aKoYEmBQbopis3y9PB7Go=
X-Received: by 2002:a05:6000:989:b0:48c:6955:a603 with SMTP id ffacd0b85a97d-48c7278fd23mr2475124f8f.13.1791361593220;
        Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Wed,  7 Oct 2026 09:26:25 +0100
Message-ID: <20261007082627.63807-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012635_126907_188FC9B2 
X-CRM114-Status: GOOD (  11.69  )
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.0


