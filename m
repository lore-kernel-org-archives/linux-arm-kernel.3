Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3562CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LjpIZbO9mvGi9jWfEQ5hnMKUvryAGp+KhC+W5IHOPY=; b=uZFxC24KMprndxYIc1TeGSa1hP
	4d3KGZ+m0Q3C6UR8gOqCrsrgEL4anu2LnEGeddXU5Lx9d/Bfezr50s56VvhRY6TWNegTp27TG3+Wq
	j912SSmQMBhXwAJLl05UH8OXGlH3kCO7Zc9AMKLwa3Mkny+x9YFrB0EKdmkoIT14P2btf09lOMyvt
	eTEN9ybZ6TGm5gSF2WrZ/YPF2Zw/JE+x3IjRvEOZky8mr3Rxd5sOHMVBWsKT8AsyFoiVLNi20oE0C
	qVudmkZWyxMsE7CKCz63RtMizmNhT4E6KiO2Hoj3iy3Pb6tcoQpTstkZYCTcUu0WzSSTiwx6vX08G
	HByXS9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCeb-00000004KaN-1XCf;
	Sat, 16 Aug 2025 08:52:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCZf-00000004K70-34gk;
	Sat, 16 Aug 2025 08:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3LjpIZbO9mvGi9jWfEQ5hnMKUvryAGp+KhC+W5IHOPY=; b=SI7zKLa4dEQCOLbUrXX3/K27g5
	07P+mm/LO8kX2jggsK6mhHtRMG9xg5xx4HEE+NSGComifIc3jn0sv/nXkuQg55LnSzOXz5iW+YQTd
	EKgMLa0ZtQp9nSq7K3edsVe35MTSTzP26EliIRrcfuGHsTF8FHCgqBSmsxZP8/qpZD7wHGdKTP7ei
	f8/zEE527bMRplxRojmkUTg7E6Wtn87WUbk0Z29PpgAPgqxoMkkyfn3PJucwr7Zc5ik0H9KCBKOwu
	puIWEXk2Nj3bAiB8cLSuVWIZ+WPOA8lquFa78YavFMDcva0jiu9SkylDl6CyAy6lzIvMYwJzFe0wT
	5UKpjqUA==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCZc-0000000GwM1-1UUq;
	Sat, 16 Aug 2025 08:47:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47174aec0eso1791236a12.2;
        Sat, 16 Aug 2025 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334054; x=1755938854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LjpIZbO9mvGi9jWfEQ5hnMKUvryAGp+KhC+W5IHOPY=;
        b=H+ITnZHDOF2kgCNrom1lSKTvWVQhZSl4pP3cAky7YdNS75Nzo4ZUDaqwmjkFmzyhRT
         Z2aygwTJPCUUxN4oyKwXBBVr22JfhsaBPxasv4xcUdb45YcI6MEsemZBA43fU3IdqQFG
         q4ur700DOXF7GJ2t6FW19ePGIRz8sUz/WyQdo3hBU/hdRZD8MSUao0QmHoUcEvLFG4kO
         Vtvgp99B++qE8xBiboDn53oEl2s1QxWMaLPXehAcqMzzON2HV1k+/3+WyXtk8o9o0euz
         FIqOUlxw7DJXHiWb1dtO5FUTjelDZR90QQQbslEvZ7cLP9ppvJqDU6UyZ/MLPgLRFnSO
         h+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334054; x=1755938854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LjpIZbO9mvGi9jWfEQ5hnMKUvryAGp+KhC+W5IHOPY=;
        b=KnGx2o3eV/XOfZiauoQLqb5FnWo79PcYpsj1b42ew4J3RcnM0ViAE2xjuUfSbzSsia
         64SnlxjD7fRcYo97ba3NyPrjRnruaTO3J3oMtKXkZH7B0IZ46Ye0ZedSx0BgJyACvles
         EgwDDdU8F4oPaEG2jy/zSgNLiPkk7bJWRIZHlmD5fN2nI+uoqJj3yci39CKDf7kP8ige
         zFWpDg0fxReaYsUmKaWr5rRzwudAla+fDJKt71AgQ6msO0oI2m3PSQiqjSTLh1ZVX4Z+
         k4nKuFKPbBwH7oI9G5noIEoHjuemtoOGbtAJid5yCgRkbQR3AvefSNdh8YuLpiYbsCLs
         5nPw==
X-Forwarded-Encrypted: i=1; AJvYcCWIJEp3ut47/h0nxm0K4Y8qeUn0QRDIGYfXEjJJ1pS55vIqpoI/B0J6n75uxlYMNGsc2coxG4BEsSdh@lists.infradead.org, AJvYcCXyvbQ0Dy//dBCkIUMlvcsgfNn+TsUuoavtFyeJvN2MrPua4ie0Y7sqAr7Hn9FZKziFeKx4+t/LssSaRhWJljrc@lists.infradead.org
X-Gm-Message-State: AOJu0YwqObnIYogTQ2s7Wv4I6LrmoJse+epVcIl1ckUikOHlkNtjWeel
	azxAbDP1i+7b4gUnjoZEvRQI7PVB8lVqqXdEXEhv87d05X8ydNzddt2rKUilH8k5z3U=
X-Gm-Gg: ASbGncsuD491H3Z7kQQi8stMfYxxo+v6ZO53CwLjgazlMvWBfpo3efmh/S1Rezbui3h
	44Y+VxQmAjCuT1TjAsOL+ZadwKF2m1OdKqYBO8FD0GUcsLAqAwD08JiMxkBDksZxwUdpA2Dp5SK
	uc9QJWzscPRM1P09VZrjSUvLJO8s3iAUpGviIbXguNfOIWqpOQ4SYW1LWxmWyxdo/qxOgN+LszM
	ik3EEOhWurRi2qU9Y15nLSonOJrJ2apaz/oirizgxW/9JmYGjExJfQ7USicxLUUs41h6YcFr0Kx
	lJBnUn0pl5CZKJ5mhTI95xqDUdgBCVpqqpZNdbie/x4o8r6pUe3Wkzjw0lzYE4ArHPzTpkD0L5l
	P4pWZJNdrjzvNF+ssqqFplg==
X-Google-Smtp-Source: AGHT+IFMTkLskiB1Qs3dIHhYx1vm6JoFKQBNN3j/TxriFzjixkZX7mXsyi+PI7KUf9M6UIn/A8Ob4g==
X-Received: by 2002:a17:902:cccb:b0:240:84b:a11a with SMTP id d9443c01a7336-2446d6e5a89mr66059665ad.17.1755334054476;
        Sat, 16 Aug 2025 01:47:34 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:34 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/7] clk: sunxi-ng: a523: add missing usb related clocks
Date: Sat, 16 Aug 2025 16:46:54 +0800
Message-ID: <20250816084700.569524-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_094736_748562_02E9322D 
X-CRM114-Status: GOOD (  14.72  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Several clocks were omitted when adding the original driver. These clocks
are necessary for USB 3.0 to work correctly. I added these declarations
according to the driver's BSP code.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c      | 32 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h      |  2 +-
 include/dt-bindings/clock/sun55i-a523-ccu.h |  4 +++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 1a9a1cb86..7bf41e628 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -853,6 +853,31 @@ static struct ccu_mux usb_ohci1_clk = {
 	},
 };
 
+static SUNXI_CCU_GATE_DATA(usb2_clk, "usb2", osc24M, 0xa80, BIT(31), 0);
+
+static const struct clk_parent_data usb3_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_200M_clk.hw },
+	{ .hw = &pll_periph1_200M_clk.hw },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb3_clk, "usb3", usb3_parents, 0xa84,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static const struct clk_parent_data usb3_suspend_parents[] = {
+	{ .fw_name = "losc" },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb3_suspend_clk, "usb3-suspend",
+				      usb3_suspend_parents, 0xa88,
+				      0, 5,	/* M */
+				      24, 1,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
 static SUNXI_CCU_GATE_HWS(bus_ohci0_clk, "bus-ohci0", ahb_hws, 0xa8c,
 			  BIT(0), 0);
 static SUNXI_CCU_GATE_HWS(bus_ohci1_clk, "bus-ohci1", ahb_hws, 0xa8c,
@@ -1290,6 +1315,9 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&bus_ths_clk.common,
 	&usb_ohci0_clk.common,
 	&usb_ohci1_clk.common,
+	&usb2_clk.common,
+	&usb3_clk.common,
+	&usb3_suspend_clk.common,
 	&bus_ohci0_clk.common,
 	&bus_ohci1_clk.common,
 	&bus_ehci0_clk.common,
@@ -1422,6 +1450,7 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_MBUS_DMA]		= &mbus_dma_clk.common.hw,
 		[CLK_MBUS_VE]		= &mbus_ve_clk.common.hw,
 		[CLK_MBUS_CE]		= &mbus_ce_clk.common.hw,
+		[CLK_MBUS_USB3]		= &mbus_usb3_clk.common.hw,
 		[CLK_MBUS_CSI]		= &mbus_csi_clk.common.hw,
 		[CLK_MBUS_ISP]		= &mbus_isp_clk.common.hw,
 		[CLK_MBUS_EMAC1]	= &mbus_gmac1_clk.common.hw,
@@ -1474,6 +1503,9 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
 		[CLK_USB_OHCI0]		= &usb_ohci0_clk.common.hw,
 		[CLK_USB_OHCI1]		= &usb_ohci1_clk.common.hw,
+		[CLK_USB2]		= &usb2_clk.common.hw,
+		[CLK_USB3]		= &usb3_clk.common.hw,
+		[CLK_USB3_SUSPEND]	= &usb3_suspend_clk.common.hw,
 		[CLK_BUS_OHCI0]		= &bus_ohci0_clk.common.hw,
 		[CLK_BUS_OHCI1]		= &bus_ohci1_clk.common.hw,
 		[CLK_BUS_EHCI0]		= &bus_ehci0_clk.common.hw,
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h b/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
index fc8dd42f1..d6916c728 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
@@ -9,6 +9,6 @@
 #include <dt-bindings/clock/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 
-#define CLK_NUMBER	(CLK_FANOUT2 + 1)
+#define CLK_NUMBER	(CLK_MBUS_USB3 + 1)
 
 #endif /* _CCU_SUN55I_A523_H */
diff --git a/include/dt-bindings/clock/sun55i-a523-ccu.h b/include/dt-bindings/clock/sun55i-a523-ccu.h
index c8259ac5a..26b2e9dc8 100644
--- a/include/dt-bindings/clock/sun55i-a523-ccu.h
+++ b/include/dt-bindings/clock/sun55i-a523-ccu.h
@@ -185,5 +185,9 @@
 #define CLK_FANOUT0		176
 #define CLK_FANOUT1		177
 #define CLK_FANOUT2		178
+#define CLK_USB2		179
+#define CLK_USB3		180
+#define CLK_USB3_SUSPEND	181
+#define CLK_MBUS_USB3		182
 
 #endif /* _DT_BINDINGS_CLK_SUN55I_A523_CCU_H_ */
-- 
2.50.1


