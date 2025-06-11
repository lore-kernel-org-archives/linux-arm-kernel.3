Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DDC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjjFJphyDo0IqYeVnTfxfqpMK0gp/71Sj/vB3a+5qNU=; b=apB5tmWAGUUFHB1PgQK6AbKeyU
	6OvsHIRYkLiCuYioKfRrJ6Q6vU1D/5SayGhouVIxwfSgreWgORfKHrm8hRjfOFNKOTwe06X8T3Gn1
	chQnBxPd774h0x14v9Q0d0ESBnVuDh6HvXtCZ6b9ouB24S5NX6XhBqw+7ZynPvP0ua3aiNC7qVegY
	DtEWQeAbn9sd/nlGJ0vyg0Vgzyjv+Vl50ErZi9L5vxLalmx7oV0Hor6JIyHIbWw6q2rce2kdc80pk
	y3Eofp6eAJ+ZmPiRi9T9vCfxA9DXnLcShX2ExJ5QX/A3qfaUOW4IQ4KixtXVLsISQ30ORxBDVzXGr
	qAQcdr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUSs-0000000Bbtt-1pL0;
	Wed, 11 Jun 2025 23:02:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTJG-0000000BOOM-004h;
	Wed, 11 Jun 2025 21:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749678516;
	bh=LH3RSD841MZ/Wiu+j6uCJ53sshntEVWDrCUzXD6Diq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X1KUaJ2vZwipKPBKokVHgxzdwtYRuJjl1kPJJnlJRoEZsVaLlH7zvZbqAru5khxja
	 UdazX8hjDh3qWdJEMpTTnHKE/JHAbKmNX7yijDy+DUt+ZoZKani5n7TidH3PNS0HE/
	 zbf7rbjoEjvcYwcmcoSRN2TJgU7Z07KOJWHGwvDorHqzWRZ7bmkpmXUth+Owb1LVrl
	 b0L3vcnwziQl3r2jtx6klopCEyKTEcVFMt904uKxIjHJ3hupWP7AAnBXjSL1MRDDr3
	 rAFBRexrxeLCGq+3mvUhbpeELFkLTycraMSG1Mhm/7p2lK//T4MHCNCaV20CC9pUCz
	 cjjSSx+t5wXUA==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 182F617E1560;
	Wed, 11 Jun 2025 23:48:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Jun 2025 00:47:48 +0300
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable HDMI PHY clk provider on
 rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-rk3576-hdmitx-fix-v1-2-4b11007d8675@collabora.com>
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
X-CRM114-CacheID: sfid-20250611_144838_184670_1EC50D12 
X-CRM114-Status: GOOD (  10.10  )
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

As with the RK3588 SoC, the HDMI PHY PLL on RK3576 can be used as a more
accurate pixel clock source for VOP2, which is actually mandatory to
ensure proper support for display modes handling.

Add the missing #clock-cells property to allow using the clock provider
functionality of HDMI PHY.

Fixes: ad0ea230ab2a ("arm64: dts: rockchip: Add hdmi for rk3576")
Cc: stable@vger.kernel.org
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 1086482f04792325dc4c22fb8ceeb27eef59afe4..6a13fe0c3513fb2ff7cd535aa70e3386c37696e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2391,6 +2391,7 @@ hdptxphy: hdmiphy@2b000000 {
 			reg = <0x0 0x2b000000 0x0 0x2000>;
 			clocks = <&cru CLK_PHY_REF_SRC>, <&cru PCLK_HDPTX_APB>;
 			clock-names = "ref", "apb";
+			#clock-cells = <0>;
 			resets = <&cru SRST_P_HDPTX_APB>, <&cru SRST_HDPTX_INIT>,
 				 <&cru SRST_HDPTX_CMN>, <&cru SRST_HDPTX_LANE>;
 			reset-names = "apb", "init", "cmn", "lane";

-- 
2.49.0


