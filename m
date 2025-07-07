Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098C8C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVv9VN6mF2jxRpVKoSC9NQ/7rqOozAMNWU4uby4GCM4=; b=n+hlZRpsa3dsYNUSG5koGZQeuF
	z52LNOPX9pkSa3CzX5ALb/Oeql95HvSBZkAFtvZKF1Mw1IzPsH062OCggsQcmzGn3NCe7b/NVqQ2W
	ddmFz6gVa1C+yje7CcinJc/Hl3YXMDd4LyIh8VHzl+Y/u+vK/CGXFLRBMdgZM8+L7kwWCr/WVHHD4
	8UekLel5TXLdEondWCvMuQvAQwlh3TYGSFPkd5Q3XWhxyFMoxpGHEB7yzJzFAX2u+lFQ8b9KeGrBz
	u0zi0sduZeEQ8PYnIhP8vzhWprt/4u4XMxJKIj4NA4lqsupwkajwEuY7LNcGB3tmHeGQLcTJqH054
	RwWMeIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqCd-00000003FGl-2Dtn;
	Mon, 07 Jul 2025 18:04:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp99-000000035mv-0ktt;
	Mon, 07 Jul 2025 16:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=QVv9VN6mF2jxRpVKoSC9NQ/7rqOozAMNWU4uby4GCM4=; b=IR1Yo93bPSVYTBpRB2sx+wIFNR
	cKsnu3dqCuXZdo7vsfK/S4xBckIlpnz6iKMzQZUpOj8Yh7EpZJabNQzbcetjIkLKJTKvjbOFrnbCY
	GZf64RuNZwUsQUWDMZuRX2Kvh3A/yrf/GbSm7B9MLIld5KNkyjw6Gk1g1tjP8ivysdH6mPk2SPr3j
	zJCi3NHDSrHV23YPISx13kFZK7TZUejR6eBIYn+XYtaJOk+aPt3uEHdzpfiVd+5Svc05Y36sK/Mfg
	M/u+tfOMCl+vDAY3kHRVPAqIGp+Y2WV9RtIxxnuEsRSKYkG3vYiqLz2LpQhGo9zHC/CwrGFmLO/co
	MM+Yx4Uw==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1x-0004yl-H7; Mon, 07 Jul 2025 18:49:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 12/13] arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
Date: Mon,  7 Jul 2025 18:49:05 +0200
Message-ID: <20250707164906.1445288-13-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095651_213265_CB7E2B12 
X-CRM114-Status: GOOD (  10.99  )
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

This fixed regulator is described by the schematics as being part of the
baseboard and its output supply is then routed to the 30pin DSI connector
on the board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index d4e437ea6cd8..d0ab1d1e0e11 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -107,6 +107,18 @@ vcc1v8_ufs_vccq2_s0: regulator-vcc1v8-ufs-vccq2-s0 {
 		vin-supply = <&vcc_1v8_s3>;
 	};
 
+	vcc3v3_lcd_s0: regulator-vcc3v3-lcd-s0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_pwren_h>;
+		regulator-name = "vcc3v3-lcd-s0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
 	vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -715,6 +727,10 @@ rtc_int_l: rtc-int-l {
 	};
 
 	power {
+		lcd_pwren_h: lcd-pwren-h {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		vcc5vd_en: vcc5vd-en {
 			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
-- 
2.47.2


