Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE92ECA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WnY2f3qUDmMEIrOsugmwhw1biyWqEpaCp+l7ISDYX0=; b=U2h3DpIvQJVwHGTILbFhDL3yOr
	KaWDy0mJy6Ae1VNGScLBic1loSNNuKkEVzqBZyYj1+oJTWLjSyvDEKTa6jRl6I9/71dc2vm/CdN7O
	8O9dqptISpoAX57C8urcFAav4EBWJKWWW0ZJr8SAJtMdeGPm/SXUSdjrH4og7eK0pTl+Ddms/o7uS
	pUQTLEkmniLGNa5VkvOhwShXf2lyWPzXcAEmCKCJweFAxjlbmbj1z83Rwkg34wqWYkK0+P7onsFHq
	lAnYPii87XO2rO5GkP3thpZadoLevKSLzRiSBCJ7pHpBucoLIFSDbHmUeEehMf/b9iXY7vDN/GI6p
	Glcux7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOc-0000000EvM8-3roc;
	Sun, 04 Oct 2026 14:40:58 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOZ-0000000EvFf-11yk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:56 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso4892745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124853; x=1791729653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WnY2f3qUDmMEIrOsugmwhw1biyWqEpaCp+l7ISDYX0=;
        b=27pCUMeYCA+j3nMrsXrgKlovHTxsuxwq9rooHJC58uVRvVHrZ6vhV1QfxtgJ53t4gU
         wk+o8IxdcDDM1pkYiligGaCz2uiK7miKVvjt/N3bUUiUs8fnksxXdAUk1UGh60kR0GqP
         yE9ZAFksWefO4nfuHrxK5J5oEshM97aPBSieENiV4y/8soRAv0c2LniME/6W40jUEtTe
         zuQsAxMj1TIrgyCE4uPANenyNMh58EqC7Y/WAOYmLF0cgWAwzx//N+z+bpb4frA9CYf6
         Ww0NiNsMqtIs3JKhH2pNvhqZVg7NM5kGaRjDKOhMja28QhDLVq331KkHbtTUhyzgw2EH
         zH9Q==
X-Forwarded-Encrypted: i=1; AKwUvByQOyQhjE+uEokDNOkN7huV1OIDqn1c6KAUocI23FEc6qjYwNcpqt77TGRyqjKH6Ror4E2f4g0WrfZSkLjZk+ZF@lists.infradead.org
X-Gm-Message-State: AFuF++kQJAugri6z/ZG8wiEaTkesUWt97G7rPXxvgwD19PSUjeNnQ5iN
	YABNmgzSSWVMYaP/jb0vE9jPMSNUhOYyP3fXrjvpYYn0xNkPEfnzKB3S
X-Gm-Gg: AYBFou3Lsi11zGDShhIK8WfSiWG3VT7VOFm17v9a3YsJ1zu9pG0wGwqrWu+NSqzA+As
	5+5LUCaXR4a2qpIGhT+TP3yshiQLb6vHu5xDv0pFWfOZpunTOE+0KxNQe1xa+4pG0ALA+byRCPG
	nO6knErAIEZtoaWljpt2F8/G2fim1DtLRWuGbyUGLj2Vsu0xfNIjNZaj55zAa8czDZdyiDdj+fZ
	2R41I8BLHw0uH5AhReUV7bu1enKTHCXVTzmcXjloOt77t/m4oy/j7XjBMOyZjR4dPY1fQl99FnH
	T3DEVy59PVky+at2dbwu8BlFWeEHGWR73IqEUMSbVFuKameQDYgPWIOLo28boRMqmgjtrv2i1A6
	BJUEoIsS9vL+vS/GHftOv6uVNNlNMu5sinV7piN6j2slEVTseg3QD1B8uApOgmVfLnR8yFxUg6l
	YhKLgMeeJCVhsv0G1KQMHT+Z6WgvsGzkyR2hemP+rHVWU/Gb+skjZa/Rt4hubpwhsgV40r9CF7c
	QiMGVRLDcskYjXYK8IhFnBOpwXXGHaSFQ==
X-Received: by 2002:a05:600c:1d07:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a168068ef8mr79507265e9.0.1791124853178;
        Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
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
Subject: [RFC PATCH 4/6] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sun,  4 Oct 2026 15:40:44 +0100
Message-ID: <20261004144046.391444-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074055_337101_6423A5BA 
X-CRM114-Status: GOOD (  10.82  )
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


