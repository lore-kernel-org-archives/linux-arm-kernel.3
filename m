Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A576E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=; b=WdkAJqtqK4YvJ2qdyP6Wh6IasF
	3kl+PItnUClMtfP5VpOpmOXHgoRDRN51ivwKc/xk4vGa0cEWg3hYzd17hW3LV/u5yvucrwdoWfstS
	XxYlx4/ekvw//8+wIJMByFBCa5MyMXek5ItYe+paH57wTM6cFBztZJ4cwzCSgOqNFGgdhX+Ri2E4I
	KwfpKaxSW+PaHw6tLktUJ5MHxMUtHwrD3ChaPqCEpj639kkPWZlpuNBjYJS0cq277DJQAxmGEcoqh
	9cBhvDeRn6yDw7cGseP5WnL5kgg4nY1ubVlpz6ol+IArfbT5mpxtbGzcGvudOUlx0d1fKyJa36wSz
	aabnipyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRutE-00000003YIe-1kDV;
	Sun, 29 Dec 2024 15:07:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRud4-00000003W1C-2HSX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so15317616a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483853; x=1736088653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=DUTgWcKCzZ2ebHsO6w1YeEA6zLs1uA0+m0mERtjNk3vCtHG73vU5P2ysBCsVEy7lPz
         GPnaESn+muJbO3QLkKViZuTqLguZCbfw/hf9f3eicKUU0qc3oloLBQ0CcZZfNMzcCSae
         VLwGbdSLtHtAEMG4fSQ8jCVJPewlMs/OwPjy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483853; x=1736088653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=dx/KXTBBbAufMjBC1xXS9ICR+/LGGoz2ZosDl/+ivKffDkSARw/7qHdd0BgB1d7UJc
         S/FFKXc7U8Z22AjV42TGyiv1SwAaB/MfVv4/UFI+vdTZmwVziglrHPAqHUhGoEv5KWS+
         yBDL4N5befInOrJNOojVUDZckhoD963m8WmWS6rb5gGxU0Tl22IukpberxpINnlcyJwA
         jNVydYYf5WoOOZa41MzxL/csyVeI3ayZdnAWNGPQUaCBthiN/gMzJItIKZQDbnBeRhma
         J3vi50+8v/I9bxM+hCg0xZ6WXVtK55JNt9ZpOv0hI3tP2XXbcqtUyVvQloao5WUWdkDW
         f8tw==
X-Forwarded-Encrypted: i=1; AJvYcCUeAUZoQuZ1hRjOIlRUGjuURL6eg1vAnaIzDTeZmIeI7Y3ncZXn4odcDLcZq7RRTinlbYqLlyVPcyw6aaBHQOyp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvgia0nFOaZIvPvB40zkQ1TKZnNZBUCSjLpLvGm9DDZWnVT5WL
	YiH99sA1Gz6Bsc7pM5g3c+bKNWV5ofmRkx8QTtBp7t5AV2ptcz9bW0liZIl/iek=
X-Gm-Gg: ASbGnct5VUw86aJOcQOJCGSFpxKnTVUx0bqFOO7gmQWEyNTnsMEcFQr7RXsp0QOoEoJ
	3qj1LDOah43YKPAUaGqOTyNdA/mLTAjUeu+U4jHTFu/4MWx+Q1v4nfDunlglcCzCh4hB1+EAAzN
	PttxPe07lUHtaK6bT5r136Zs01NMUSqa8I4iPUmF7Iqu7/MrSr4QHonJsAzzJ2k5VGlGcoslBDZ
	uTZP3PlpF449BF+TrwKV9gedtEH840htxWl5D4n2F47UFln7g6uGxE2du8e0CBotbkw01/Cuo7N
	OY3rP9Qc/4FmO9/rJvlW4A==
X-Google-Smtp-Source: AGHT+IGAr/fj0/FxvDNSF3QhklUe5PsXkRgWrVEt4Z7yfy8kv6dXfzAqgAyAuWRdOWj4EIdZF2KqUg==
X-Received: by 2002:a17:907:3f9e:b0:aa6:7f99:81aa with SMTP id a640c23a62f3a-aac2d446f68mr2704157366b.6.1735483853232;
        Sun, 29 Dec 2024 06:50:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 13/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Sun, 29 Dec 2024 15:49:37 +0100
Message-ID: <20241229145027.3984542-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065054_596294_5842DD94 
X-CRM114-Status: GOOD (  10.06  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0


