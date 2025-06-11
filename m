Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA681C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twSWT7BJMNYESOOsgf7KCTKtH9gGlto8Lf8fljbrckc=; b=WAERt574pdWAbqxh8j2HT5X0tU
	eczPaL3RZMzc5JVv8tPKOqNF+9SjP7sMK+8Fv/nSkuYHrr4++oGpjf/CrZbL0qGKWO74MQRJX0mKE
	1ehqoApNu7CqD6qaqI0JxoZwkue8JbPPt9MuyYvYOU+ecnu9UZgczyc1xZTmS7bxZPCi7ewE9CcaA
	nWS+J+mD9YxbT3ebmzV/jUv+ifAqRhCmDGFl8fdh4NHein/SXMnAi1dBezCfV+ceKtxKWQZqozQe2
	4zQZRW6qf7B2jrN/mEAP8Y711Mncm86vCkzOL3i5y/wcjE7bxe843eKd9jy080EfcCn9lnm4m2+BG
	NtR6OsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUUz-0000000BcU5-26NB;
	Wed, 11 Jun 2025 23:04:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTJP-0000000BOQd-2FOt;
	Wed, 11 Jun 2025 21:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749678526;
	bh=p125Qdh7AXpcJlrV+7yqlZZwam5I0mnuIIk+bsJi8UU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EidgVnMiQFzztrReyrHUBVJ/dgBh0iS528uSU6ZSU0dw/oVXjLTONw6yvYb3IBPqR
	 fKgkeucn1eAdTsG9IGr5r2aUrGrxN6zYq7QdHqiCmC4B2zFZDg7TQ2Scgu1sd8Vkma
	 /SDNw9lX2QVSf79dLPn5C6nN0SqBisjOIt9F2xoXzfsDGUwlygMqnwXUlB33nyq/cD
	 J+eh0MSZQk8Vd1Il9blFhNbKZsEAk+7KZhyEnvNY1mRQzI+tfGnnc6nJ1MWCJYMAHN
	 elozjHQDkEKzQZ3L1vxI/6Li0jeFjXFFpvi0NF2PChhCmw9F5Y1S3CwcqhF6ed1T5e
	 1bPu91kPSGFTQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id EFA8C17E0342;
	Wed, 11 Jun 2025 23:48:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Jun 2025 00:47:49 +0300
Subject: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source to
 VOP2 on rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_144847_740422_6C662230 
X-CRM114-Status: GOOD (  11.26  )
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

Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
char rate via phy_configure_opts_hdmi"), the workaround of passing the
rate from DW HDMI QP bridge driver via phy_set_bus_width() became
partially broken, as it cannot reliably handle mode switches anymore.

Attempting to fix this up at PHY level would not only introduce
additional hacks, but it would also fail to adequately resolve the
display issues that are a consequence of the system CRU limitations.

Instead, proceed with the solution already implemented for RK3588: make
use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
will not only address the aforementioned problem, but it should also
facilitate the proper operation of display modes up to 4K@60Hz.

It's worth noting that anything above 4K@30Hz still requires high TMDS
clock ratio and scrambling support, which hasn't been mainlined yet.

Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
Cc: stable@vger.kernel.org
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef167d94904 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
 				 <&cru HCLK_VOP>,
 				 <&cru DCLK_VP0>,
 				 <&cru DCLK_VP1>,
-				 <&cru DCLK_VP2>;
+				 <&cru DCLK_VP2>,
+				 <&hdptxphy>;
 			clock-names = "aclk",
 				      "hclk",
 				      "dclk_vp0",
 				      "dclk_vp1",
-				      "dclk_vp2";
+				      "dclk_vp2",
+				      "pll_hdmiphy0";
 			iommus = <&vop_mmu>;
 			power-domains = <&power RK3576_PD_VOP>;
 			rockchip,grf = <&sys_grf>;

-- 
2.49.0


