Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39491E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH2KyvSDZ4e1iCsmjiadcepahJLyJ8LsDobov2WzDK0=; b=ke2wgUWVp+CXVFet7sdbnze1Bd
	Td/po7nxOEBwFSg1eF9sd6i+nmQrwRXYn32AKxkBk1Ae0qtWCLeKz7SmSOwW/mFtlKOu/+LVxYnIk
	DVL+sypUPIka4u4Ts7EEyLFTN4sh1IHhVkKCvQlzTkd0Y6mwuOhFmrvDVKHa6wFu5WkhB3kLBBg+5
	bo2XEn0CXFF11tV9KSVMEKtMYHiyJNbTdIPtakhFCfqZSnhbBdgPTndm1D3ckcUXMxmy0Q73fGT20
	J2QxtFvPoBIXQ0vHVJBcn+ScFLpu42IEFqYSfy9MFbjTgxihEnqlsqhxldqiAVuaD4mLDSxcq9mKn
	o5Z33KlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJqL-0000000EYmX-20vH;
	Wed, 11 Dec 2024 10:21:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJkh-0000000EXZU-2eyh;
	Wed, 11 Dec 2024 10:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733912130;
	bh=+vXjisEVYCifCf+z33u/bFOO0lR3e3Qmb5SviT++k/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TMsP6MrKCkJHtlGJhXBjgfmPxO66lV71CoXhC34oxWzp2GEQw0KbEDk9OEvzpUE1y
	 unj5AzbsbVwSXwkd6UTiXTIZzl+nnxu1xa73PUMMHrrT4F4EhxMMm69PaHDIU5J57o
	 jLC/rCeirhjcV23FRW2CGtnnrl8HPmLz04t9hPRajQGZBhXEbFgvcMATU1llCBPe/G
	 FeZ48QdpclDMG/hpapNhH9rp+T60kWqxO9R64YYbvCyjShL26WOgrwiv+o658aZH1y
	 JudrF+YI5c47JOsXI7vWYRxItQ+AStW79lcuL3l33XjrMf3cubatMQtXmfHi951nMm
	 1aG076M538Ynw==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 168E517E360E;
	Wed, 11 Dec 2024 11:15:30 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 11 Dec 2024 12:15:08 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: Enable HDMI0 PHY clk provider
 on RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-vop2-hdmi0-disp-modes-v2-4-471cf5001e45@collabora.com>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
In-Reply-To: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_021531_829582_E2E5BCEE 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Since commit c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock
provider support"), the HDMI PHY PLL can be used as an alternative and
more accurate pixel clock source for VOP2 to improve display modes
handling on RK3588 SoC.

Add the missing #clock-cells property to allow using the clock provider
functionality of HDMI0 PHY.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index a337f3fb8377e4a3a200d4d3a3773a237de2bd6e..22462e86f48027ab7c5e270f2fa04df7afcc1d24 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2811,6 +2811,7 @@ hdptxphy_hdmi0: phy@fed60000 {
 		reg = <0x0 0xfed60000 0x0 0x2000>;
 		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX0>;
 		clock-names = "ref", "apb";
+		#clock-cells = <0>;
 		#phy-cells = <0>;
 		resets = <&cru SRST_HDPTX0>, <&cru SRST_P_HDPTX0>,
 			 <&cru SRST_HDPTX0_INIT>, <&cru SRST_HDPTX0_CMN>,

-- 
2.47.0


