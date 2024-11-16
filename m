Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E43D68BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH2KyvSDZ4e1iCsmjiadcepahJLyJ8LsDobov2WzDK0=; b=A0ZsVZNVvOmsMYDPrizWfv/iDa
	+akaGv4nU2bKJnXlASTcHXB5b4wd5XA25SjyrQ0ISn+P37AZO9VNEfVKSaEJ551jFoXXDRcvHaaju
	UQNwZe4rg6/pjkz65nfN8A7wjRKYrWpJIKmf2yk+jZ7UPyRQ/uPQeLdeg+NRhIOhqNi0zgKbSjjz2
	k6yO+Lx5BzS25/ei6lo1ACrkJtYQfUJ0Foo4wWlf+3oR3x+vAZ3ogiZxZS7r6BhnaS03ryK3LNnrp
	t2Hig0GC/GXHgn/rX+Z/rMFZoyHKeX0ySAOC+K55y546Y8c7L5rKW4OoT2G9xORms/M6QdcVYuVSf
	WLQZ4SMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNVB-000000062fX-2QBn;
	Sat, 16 Nov 2024 18:26:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNRW-000000061yL-0xYO;
	Sat, 16 Nov 2024 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731781364;
	bh=+vXjisEVYCifCf+z33u/bFOO0lR3e3Qmb5SviT++k/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ByWQALqQCMLAm1yBItp4upQlzSjAKi4CZzqz2Ue03i9ukCvvLb5RVYpc6ZQDptXSc
	 vvE79bAhaAXBIItCitFReUAJknB1yj7shRJwYHZMYgPK0TZtQp8tH2iVhlCZdO7KvG
	 nwwVj5kknnCy/iI1i0fqT4csjY+dWiem4GGG9LbI5Sl34H3DV3jo/3dh5hWOOcgT3/
	 WXhu9ONcBfoS2adgs74KeFxDqb5ywAu3/gKBn8Po0zDSn5WKrOtgNCrtGhWy7EUlg4
	 j8nQgX98WXQLQSO+d99FlFn2lMhFBXwgJxUpMd3TTPslQSqv7ZASelzAS+K1Sff/ZE
	 plWKY5j5bTfQQ==
Received: from localhost (unknown [86.120.21.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACA7917E377D;
	Sat, 16 Nov 2024 19:22:44 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 16 Nov 2024 20:22:35 +0200
Subject: [PATCH 4/5] arm64: dts: rockchip: Enable HDMI0 PHY clk provider on
 RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-vop2-hdmi0-disp-modes-v1-4-2bca51db4898@collabora.com>
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
In-Reply-To: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
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
X-CRM114-CacheID: sfid-20241116_102246_423952_3FCCC950 
X-CRM114-Status: UNSURE (   9.25  )
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


