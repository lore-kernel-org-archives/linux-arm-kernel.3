Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3455C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN7LEuMudq1mUi6BCPF5860crqnrJNZXCJN217lSS6A=; b=mg4vIRpb7kTR0elCm1ogqfZ4c+
	NYJ2rUSsAhzHQvmoM1WhiQ/H44dNi7WzWuReJ5sgv4OHd1AKRTSpiGh5tpeoTpFGIDuAQ3FDsyPV9
	S3AQ0nHbKIJnFTBwJL0MOpXXeoqjKRqAiF9oVDZl/0cUpkkbCPXAR+oSVgoMJxfxm/gzbfVLls/I5
	E9O3WpiNZmP/ov1T1A5V02grg51KcCvZlgmBM4EpyLhV64bLwDcO5ILSKp3NK6nBwavf78WhDPLTx
	VX3JtNRk/kKSjfLeQ/V4RLwhxelm4EdTzBfrbCMHJIGy2E84q29y6THO8VyfZe9jnVsFE4aFpBQj9
	CXmU12Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAoV-00000001nlo-0vrg;
	Mon, 27 Jul 2026 02:11:31 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAoI-00000001nhK-0Fg6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:11:28 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1307031a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118277; x=1785723077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JN7LEuMudq1mUi6BCPF5860crqnrJNZXCJN217lSS6A=;
        b=jDprc5FSj6wSSo3UsZ5b12MDOYiEolibkuTQks9tix/0s7HZLCbZifysyMhO9DdtRV
         +Q7UP2jDrVohdU7ou13yzxz5RaebPYrNyIBzO+eKVUWseoZig4v9l+UPhTvzxgANeDXH
         IHhW+DUuT+Ky0m8cyO3/1fpJmdTTfMppdjKl/0Fp/AU6s0nzmWcFwXyqCTZwk234NEVW
         yPkOP97+lLfu/ara7Vkld77YTUGHpUjVVYeVpzvxpt3yuKiFNB2xH24NGUI60hGlXNlq
         0Surapg+Qsdscw9oKG0KuMCsXPX7PStsuK+6ZljaVigBZjtWIMMmK7Kq53wkM5iu1LCe
         GfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118277; x=1785723077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JN7LEuMudq1mUi6BCPF5860crqnrJNZXCJN217lSS6A=;
        b=H6A2G+7xJClLumzlzojkeTxTSRo9M5rK8olTRCWMz1G57ddSE2MyZLwW09q3n4eOWI
         O0LiX00tyNPT2xekfpH0x5kvslKNRQniXwqHsgfrBO2z6yzpO9pRfQtiwAFUGmb9fyeQ
         tQzwYGb6vuQJsZPqUdypwf2Fa5tw0yGKvUgHtMIlj5WJMs0rQb0ezcKx0O74wwUAKrth
         IUdGcccSIszG5RSWqhHM/tWUopwA8zsfkKjL/o3I2vXg0oZKTkGG4xvO/oJ0NYZUegPW
         IPrY3yCpAHjl5p6OI6Fv3qoAYGi0kNsXmb/XAEFpfA0d6hm/LihikeCU6RaVna1DkgwZ
         ov1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq89TG9Uni6BJnS5DwZghQrKX6QoFrWHjGGa+sh0MxWIc8Y4N7C8mFNOJ64L5MWy//MNHYI2bgOnTFChZcrye1G@lists.infradead.org
X-Gm-Message-State: AOJu0YxyR9ZO/FD62AQfcR1CjqcqNBBRIjZT0jllVoEDhvryL1vKJEZH
	ozUfQTAdih3asZKRcPSx0Xvmi0+0R07YBd+W5m2t0tzkqBG06vf/2iPS
X-Gm-Gg: AR+sD12k8jVjHOQtfQQbk+S9zJfgIzA/mfjIEuB6bzf0xQ8jO3JCkbPPvolxTAy27I7
	AunK98LG6IabuvsGDF5crKsCSLRia4HGM+R1ZLyov4zsV8fXOOUtVpRJ2N6Qfa3ywT1HIhNxKi9
	j/BOO1Vdjz5rPofNgYhqgoJ35aWnmnysMoecUNuu646wvu07DNEkMWWWfNAJWQvbWO114yP5UFA
	6cpIbzBOBjyOPZ3F7YWELl31T+LFRqA7El4Pm7ZoMsT7J0SzVHz0ULS2bpSo3sdoMmKW50aCIRU
	GlhapcakPtN6LnlwHVUNUDJ5DBwHtMWlJAcJ5fQ1xqrbLTd1vYTlqeJGbOWaKBUmkmoi3wATeBx
	4KD6SDLbjZ4FGiOj/ARyh44jZy6QCeR5mboDJUZ8Uh0eo2lBvxnP9aEWVrAeb3F/ZJqibuceE31
	2jNKDuYAXmtT7KoL93EEmCf+w=
X-Received: by 2002:a05:6a21:8282:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c67e131180mr5856351637.62.1785118276966;
        Sun, 26 Jul 2026 19:11:16 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:11:16 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 2/3] arm64: dts: rockchip: Add RK3576 GMAC 25M refout clocks
Date: Mon, 27 Jul 2026 10:10:46 +0800
Message-ID: <20260727021048.3375444-3-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_191126_364235_A09A7D08 
X-CRM114-Status: GOOD (  10.72  )
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

RK3576 provides REFCLKO25M_GMAC0_OUT and REFCLKO25M_GMAC1_OUT clocks
for the two GMAC instances.

Describe these clocks with the clk_mac_25m_refout clock name so boards
using RGMII output clock mode can let the MAC driver manage the 25 MHz
reference output.

Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 70e67d4dccb8..f1125c2f88ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1692,10 +1692,10 @@ gmac0: ethernet@2a220000 {
 			reg = <0x0 0x2a220000 0x0 0x10000>;
 			clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
 				 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
-				 <&cru CLK_GMAC0_PTP_REF>;
+				 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
 			clock-names = "stmmaceth", "clk_mac_ref",
 				      "pclk_mac", "aclk_mac",
-				      "ptp_ref";
+				      "ptp_ref", "clk_mac_25m_refout";
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
@@ -1739,10 +1739,10 @@ gmac1: ethernet@2a230000 {
 			reg = <0x0 0x2a230000 0x0 0x10000>;
 			clocks = <&cru CLK_GMAC1_125M_SRC>, <&cru CLK_GMAC1_RMII_CRU>,
 				 <&cru PCLK_GMAC1>, <&cru ACLK_GMAC1>,
-				 <&cru CLK_GMAC1_PTP_REF>;
+				 <&cru CLK_GMAC1_PTP_REF>, <&cru REFCLKO25M_GMAC1_OUT>;
 			clock-names = "stmmaceth", "clk_mac_ref",
 				      "pclk_mac", "aclk_mac",
-				      "ptp_ref";
+				      "ptp_ref", "clk_mac_25m_refout";
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
-- 
2.55.0

