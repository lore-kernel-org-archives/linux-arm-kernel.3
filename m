Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFBC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=; b=HQeA5BiQkJGnXotDiRgpCknY49
	WDDyqyqJ3s5SIlvAfHpKFkX0E960EfXQUTKu6e6CxZcHdGI6qAJYEnYbSg+3R2fbqRJd9NPCme57R
	ZiNZJno48WBpSAaZ9WpyfRAQ3G1JKcrYgZCZyPRtTP+l5oxrD2ZXS6mO5l0MjQmdp710ulLLR5N3N
	gPuR3NhZUvqCTXzIZj+vRTQPUBvK+ZjYa7gQRA+6PH/8rfo3ti5UxFVflAV3ePZac05z0UOs82Dnq
	ajshtU1PJwsVEIENKsBA/q7Ugva8pB+LDIlHoVIT6s3qb0fQiseLPuLLPcufaHMcwLxGK2/Nh2/p2
	Q4WKSZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1u-0000000GLfH-2xPd;
	Mon, 03 Aug 2026 05:16:02 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1o-0000000GLPW-3Nae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:58 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7eb6573bd52so2068264a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734156; x=1786338956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=NQmXnGZUKb2d2udequqdFayxvHIYglBtZgEYHng/CyYci9ATiTCbEdr84CKt+N4uKO
         tyokkREWoe2mjqva1qaKmyjyBK6jsj1E93rcTILd0vlkba4BAIzVtJpoZaK6wCohHxW7
         CSITUcyNTncV6vmoQrV+IPLBUDG7T4P7yUjkuHDMONTOMZSz8nLeVS1r4cRt5s7cpSOe
         dDzSsvX3VE8PJEBQ4wT7uM7MBOboqx8ISFNqLoFxmfWgqedSCHZnyEl4fFQzArbYqtMo
         G8xItnupb3YUe8fv/+AXER7xpGOSvYznr0SWfzbCIWZHbP2z91zBsqGG+U78KawMlor9
         V9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734156; x=1786338956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=qpXXK40XxdSox1pgJ5Ci1z1YD20uo9EdxCkT5vxSu9/425a4f6SJiSsiWyk2FZk8dQ
         gbK99+XY9mpJMbgcL11XozE5bMZnXscmsHcCw7iWJsPyXXlEZvr7xi2l+xUkp6byI95v
         k5vOsW0dl1/o0WTlM6IhvBkPpnjxApItmeehJ5Y1U362MAsXWxLeO6fmi78oBcCQ+2oo
         6g02U1N1p66+2C/NNE/QWTNRsONT2/ZZUEupWOSPpeuFAhqJB1A8MEPSrCS5T/ry4O7o
         WVhxpACH9DtTAi9CgFlO2oD0q0jggHL+60LL1MVE8V0LKA3gMSrBzGExZu/mpwLL7ede
         X+/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2SpMMyAse481Nys4E+yoqdX7PCrZQfZ7p7zp6wOVr2BhWTEBUkItVSFw+RLy2tbc4bjLWWUBR7mwf9sElOfHD@lists.infradead.org
X-Gm-Message-State: AOJu0YxaSkUbP761OU0+Oliba8OrDF1hmM9ieRhya5N2lHByRpxTRKch
	pgOJAdlfXkF2oXwVoVPq41mgUGgf5fiVSSSUtMH3QMbWddtOtr054BC4CjqsPFzC
X-Gm-Gg: AR+sD10PO7nuNZXU0DdEo0+Zk64TF63DppLsRQi1qzNw5ongpPFbO7ndq1sD9eytEPj
	KQWxz6XybCxLx6JA2OStyHvnXu3FoSFrOdn3pYwq9Z1gtxozN/KTSlsTr7IxW0DbCZfmOe7cPe0
	+z17ZNjZklmCm0Emum+w1X+4WQJcgsd1tDtF+HKf+Br/K8n/PfWpAQpz3IiAjsguNJR5HRQ+7kX
	rqvvqvapgieFi6K/y6bwbm31XgCtAvxTwUryt6MW8w5tJtg+YoPKlxxPpKCNM0bKgVH0D7fxQE6
	lFFBz7t6LvNaG41Y0kGqbRuFI0wzTeCLaBMBPEZg+HdsQKi9bGyBFsDbOEwCji9eicaDw1fBAB9
	B5xlWWUgwwDkFyHVzOxdnF9JwV7MOCuTqfyMWwKADD9GjgL0t6W8rrQMlwW2viqPDpCQwJwzB6q
	+i1Qz4e18MgDhx5ferY/qMgqwygTYOv3J6TbWimJ9mFAB7d1kvZuDiN3XEovxxNA2kYgbOwoSzQ
	Ct/q+4YItV2q0jr0DH6x/VmzMZ2nXRpGLvkPDg+znct+oLcz5jN4B3eVkT+ojByf5uYbubAYuOh
	ASpC1GzGpCFMxUQvC5e4zJEVFwf0PMDw4/wmQDAPU/4tAOECulBNFY38c4vLRePNmypmjvkxnD+
	2jUO4OMFr6nwf6bTglbV8nZ8qh51KBHWIoz19
X-Received: by 2002:a05:6830:2a8b:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7f196cb65a7mr14526881a34.1.1785734154482;
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:31 -0600
Subject: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221556_918385_DA518A97 
X-CRM114-Status: GOOD (  10.84  )
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

Build the H616 PWM clock provider, AC200 MFD, both variant-specific
EPHY control drivers and the shared link-PHY driver as modules. Enable the
netdev LED trigger as a module so DT-described PHY LEDs can use hardware
offload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..53f6b8edaf33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -475,6 +475,9 @@ CONFIG_DP83869_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_DP83TG720_PHY=m
 CONFIG_VITESSE_PHY=y
+CONFIG_XPOWERS_AC200_PHY_CTL=m
+CONFIG_XPOWERS_AC300_PHY_CTL=m
+CONFIG_XPOWERS_ACX00_PHY=m
 CONFIG_XILINX_GMII2RGMII=m
 CONFIG_CAN_FLEXCAN=m
 CONFIG_CAN_XILINXCAN=m
@@ -828,6 +831,7 @@ CONFIG_BCM7038_WDT=m
 CONFIG_MFD_ADP5585=m
 CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_AC200=m
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_MACSMC=m
@@ -1325,6 +1329,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_LEDS_TRIGGER_NETDEV=m
 CONFIG_EDAC=y
 CONFIG_EDAC_GHES=y
 CONFIG_EDAC_LAYERSCAPE=m
@@ -1726,6 +1731,7 @@ CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
 CONFIG_PWM_STM32=m
 CONFIG_PWM_SUN4I=m
+CONFIG_PWM_SUN8I=m
 CONFIG_PWM_TEGRA=m
 CONFIG_PWM_TIECAP=m
 CONFIG_PWM_TIEHRPWM=m

-- 
2.53.0


