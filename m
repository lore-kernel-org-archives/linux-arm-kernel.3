Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA191E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c+9If8W7Xl+w31iRvENBg3VUkO/76wew21FGkaNGXY=; b=lMiRhUzzUdLZLm9mops8Vj6kKN
	r1u2MMmTvc+785P7SyRWwdFMgwPFZgQL24MrksZJkzhmp3S7guMt5k7SDxy+bzE4vAnmF11fUdQVF
	RYWNHUgCdw8LQLc5470m9DWAx0kWcreEqi405o+cXEnBinfY0qSvg8QXHGzUMzjRTGG7xeO6VoXs4
	QvDP+TJvAhn6VaD23qfuTjkmYDZ38gfi0T1gQaOuP9bOieuDCnfVDy7XpF0r2rsf3Yo8IAWpKjPf4
	kfjtyQ38rNchKw380LLOORMZDwJd9ai3VcxKUHjjb4kwIDXqGbG50PQOv3+SiwpSEgarjN43XhWdN
	DlekEjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObjq-00000004qls-08cM;
	Fri, 20 Dec 2024 12:04:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObgS-00000004qHQ-1dVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:00:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1036081f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696043; x=1735300843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c+9If8W7Xl+w31iRvENBg3VUkO/76wew21FGkaNGXY=;
        b=F2nw+VzEtvjJPEcOw93kIuZbkuQf38yuGsj3UQfkNooFLksuZPiKcn/r+iCyQOFUX+
         ziLQ843Svi9ZWQqxG3LOmyWoAq6h9E4Eka6GoIw5freUSqnDxO1J03Vi1bYXzjdhOrFf
         usinVy8+IeQAEp+yDNntIzp70fRNL5/qjBKtQ3IFo1ZqoTp2+rEQmupJ6HJhgCMzSOhV
         eBwVEgu0AkdAwUyw3biGuG+nYGWNk4qfCYnCTQ7gTqYSA0BZgMJyE+Rx/7PKZo+wM9gQ
         BTccRiq22NgO+Lmo1jnqjTKpKV842LNuY3u3a2eemFHQ3DTRx6X8QaQyQEX5soZ1Migo
         d7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696043; x=1735300843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c+9If8W7Xl+w31iRvENBg3VUkO/76wew21FGkaNGXY=;
        b=RyOu+cFPJNiqzKIhBKSCqQWJwIt2eK26yZ5yC0VAjT5UsGZQ37fvseIiwT0CSGjlGG
         BGEIBqHNRdhnUZ8QzCSO1Cz3tC+oajKv2fZ93+XnCS7UIhvD68MpotxG9xmxrM4GCq7V
         cKw2eFNTDXpjOxKOtRrOvbtq+sj0dLStRTgeFcvRjfw0lT2c9DcchG2IY6KpA3DgChcZ
         WCoM1MiyX3pWKPOeVgO7/zQbdfsXyrL70pVrmvl1ycx19Se/VPx7spOjoNx50yB3JbQl
         P+s8sl6zuuGvpDAa1MYek30Ftmosndsm0/lgDbvjuhjGsWLtPVBZG83mLfgFyPGA84kt
         8eXg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkt1xJ28XTdj0ttr8BclEU4vseyERyR70lkIpwLJWucJlpvYyHJl+MSUPxBIcK8YE86nUO0sffbC+x8HGBgXe@lists.infradead.org
X-Gm-Message-State: AOJu0YylNxyQx7Zo/o3dU8wNX2yfTqOyfnEUrJal83IrnxuElDC8DiZI
	EaKGq+pqKVRT/nihiZb3WLhWlHhtO1bDtRIPvmT6jYM68opZItDS
X-Gm-Gg: ASbGnctPXVXj3MRdTyi3pHpvgKCU1uzX+gjIwaYKVNo8wf9EKazWK/u+dmmz3G4uKlc
	cqIORR4/vOpf8Wscx5Oswa4yE4S6Qmi0nfEoSvUfe464kmtvkNa93aEnh2fyZJqrXhkmZLGvPUI
	NkOGGxrDR4aB//cJFzq0ax5pYQ23Zd5mJSradaXTCjFdaPgS2Ud68xOzsyHajBMC0XOwBxtmZdC
	S0XBelBjN48SnYsk8AwqXCrfEwiDJ5QLx1tpHqrfjf+3j4zoTyXwu51XuLEdZ0QpUfdDBhJ9ThZ
	H4l4YmWfnygF7dfgkdGnD2dOXrgyLOORN0sJ1so+dPB6hX/HCfSqBhoty7F9mA==
X-Google-Smtp-Source: AGHT+IE2c5XLJyzNR1zhyXkJ+darIKZUZG1iPFBT6zdD9tb9k+0R145WUAU3upIKBqOszM+jPqMnSg==
X-Received: by 2002:a5d:59ac:0:b0:386:2fc8:ef86 with SMTP id ffacd0b85a97d-38a221fac08mr2551293f8f.14.1734696042701;
        Fri, 20 Dec 2024 04:00:42 -0800 (PST)
Received: from cypher.localdomain (e.b.8.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::8be])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm3921038f8f.108.2024.12.20.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:00:42 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
Date: Fri, 20 Dec 2024 12:00:31 +0000
Message-ID: <20241220120038.3137248-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220120038.3137248-1-pbrobinson@gmail.com>
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_040044_424744_CA76ABDA 
X-CRM114-Status: GOOD (  11.24  )
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

This adds all the pin mappings on the WiFi/BT header on
the SoPine baseboard/A64-LTS. They're disabled by default
as the modules don't ship by default. This includes, where
they haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index be2347c8f267..752d2aae8465 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+	};
 };
 
 &ac_power_supply {
@@ -103,6 +108,17 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
@@ -175,6 +191,14 @@ &uart0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector, with RTS/CTS */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 /* On Pi-2 connector */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.1


