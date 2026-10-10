Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F8ACA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=; b=AQ32QICp9lCanXmoXgQFOpI7Z7
	WEbof8OJMVhqJeuyskxfCYH4ZPFnD38jZlSNza4+mZZvzms/YUyrbAuTPZYFheHpE/BLXWIFRerGZ
	V25nZqUghKnOD5hk3A92JX9I19X606TPRmK4qrXWbodTs7pbdhdqbyS9EyB58ZSWDQcJsmU87hlJY
	jKLF4yxWEkrQr6vvAUJq9qGdFxavk1oAOn5l8sN/MblMSFQE2VrryJXR62gdAvPfb3rjxQJ2DIUn2
	q9zAnl9QzXuMB6NvE2H9bCcMajtybIXybxduz72fzypQMFkjv/70wzn6q4mT2rBa+VP6+RfeFaSRD
	1YiKK4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnN-00000007sDp-0Ydl;
	Sat, 10 Oct 2026 10:59:17 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnG-00000007s2z-499D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:12 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c411d6615so260801f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629949; x=1792234749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=ny74kfitHorn5e9Xl4tae69Gaw7t/SWzXqwPwtKKePnm0H/o0BGktS1ljkcWTZGszF
         QLN2H4zMhKgQFTMPmtwYqsxLsrzQWqmJ/8W6ATJ7K1J5bFuuzrdSiyttHn8GLgz/VypJ
         o0PpMT7PUNmaqk+9KQJycgv/vepxyUWUcG2R8knEAhk0FOrxBe6Z9squB02OOpnzOtOC
         nHbeCbDxStGS5Vkg7wbrQP3f+H6qXKfjlCEfhC636FmYoHlaK1njvBLFkiSk2CHu4Wz3
         2PsqKYbzoAH1KaxPSnerTZMhI6OyAeV5UwxC36jkisGuLlWQKatYHQDozgssJpnLD4xZ
         pELg==
X-Forwarded-Encrypted: i=1; AKwUvBz3uWO9Z407hrxttbJUA3Bdtd9tZtYbgTjLA+0gYIlIrvhp5khSu0tegER0BRoZrcBNO9n9FQiMvjdQZOY0CqAm@lists.infradead.org
X-Gm-Message-State: AFq9FYKFq2hxVHxU11t4YMV+/UCOiCZQzzeDT61cuJk6bEYwS/DSCn6c
	gSBiBaLXs3dKpRyQL1FSysUzQb3DwQwWxjZS2+NWsJdy5Hv57lu7FIm/
X-Gm-Gg: AYBFou2MPzSRdVH5dS+kH+gR/FEbI/r12snL+dJjp8YVAP6y6p83hsOj+2DQDGULvYK
	lnPX6PNPe/fIvCLL7aZZTatbJnJr3PVHlelTqrlaTg7OetyiRyXOorSJeMHDI5hmA2w/ddJ/T49
	xI7uSHBRd6/b8fZp5Jn9ikao8LpjbjyDLADVGB8ih9+q9BN5DYYcNTjfrKsNjioQEj36vC/mEs5
	+G91sgc88hmdhEFveDpX8z+fT8lENe5pDSW3GAbtzVvy2kMVKtvoIHh2VX03xpxNNDOy7ZGSMaE
	LUgNpB8Ksf4LJ4Xhlh7tCxkhuFnkpLGoL3vdpbNlBAZZTKufRYk4TyiQEiJempZ6TkknJ+WUt/o
	8cy959J/U+Y7HoSrb/GbH1H+S/X5Gj+GvEsftsYNtudo0nMy6FOidYyeS+tQcPiGAt7Lyb7nkuh
	gdVO4LNm+UKMtKseZ/EEBC+U6JU83LkI2I9vtFagLuL6j30om0nNFZDR/1IItcSDY6fe1evxVbm
	5MvWVpjvSqXGqqlcz6jbJ7NFlTSnaBvISs=
X-Received: by 2002:a05:6000:22c2:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48dbacf3275mr7157743f8f.41.1791629949021;
        Sat, 10 Oct 2026 03:59:09 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
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
Subject: [PATCH v3 5/8] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 10 Oct 2026 11:58:57 +0100
Message-ID: <20261010105900.247342-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035911_035294_506253EE 
X-CRM114-Status: GOOD (  11.27  )
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


