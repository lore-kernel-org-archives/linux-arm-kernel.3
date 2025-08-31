Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88BACA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlZ0v5UR+2xTEmMOu3usxKg9KggAdVQkFrID2DzE4oQ=; b=MYV4txzr+mHHvgcgqLy3yr7cR6
	vXbfKylhX6XF22s/76u1rp5l3B1YP3GH6zdOwp7KPGA8fAKBYYbH97A2FcOoYYy98DTcFTqYx+TR1
	h7Jg8FrV+K+mx29/AadJry+au8jVFzi3qOt1Jb5MJvq3XUL7NBUdKrYmbDSB/SG4Ie4h1dr3/j/kF
	a9TR11eSiHSeByaS0NYqn2lpA15VzGzx1FVUoeLzMJJ2NI8rN5l2QtW0VLzm3brf31xJe3AYaooXT
	VGUNm7uwpArVBc7i0GjwebQFUhcX8oza2WiiAQ3rBklW+1P7jbEK7/WASQ2DEwsTLMU7eo7dKYboW
	BHlHoaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ush6Y-0000000A9gF-1L02;
	Sun, 31 Aug 2025 12:24:18 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgvv-0000000A8m7-29QT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 12:13:20 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7f7e89e4b37so336202285a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642398; x=1757247198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlZ0v5UR+2xTEmMOu3usxKg9KggAdVQkFrID2DzE4oQ=;
        b=JuivvH4rFf6SF6bB93S8xjxMO3DM8HFuT4i/zEBbQwxg5rCHInaN9g35dfc9HL3Vcd
         lYyG2n6T0qNa0G3deQAd2KKMfaDBIFmWriWripfXJJabz7M1RYBR0TIw8LllpD1JEqcQ
         Mms9qUkEOiaHYVdY08EIiee3YHMAhTx1gOlD1kLePYu21Zp2ypW1Ekbb751Oko+r1Fwq
         4sn0wrKtDZ07yovNQatwqvC/L8hZnssxp0LHwNGOsf9J3nuxqxon4Esnqm39IF3cVja5
         cUaN4GDgoMK5aDu6W6uXWugafVODghSHAKd+ul9N8W0f+0B1UNPrhoO7/CuqRDaW4Hbh
         cepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642398; x=1757247198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlZ0v5UR+2xTEmMOu3usxKg9KggAdVQkFrID2DzE4oQ=;
        b=mrgmzTqCchTkMmNzs8oM5WfurOc5wn+Hm0U88iA36OzsIcwbeCTUW256QeByHauqho
         gPI9UymhuryYM+TGV0IRlef8FUEnKMqxJY7z2LQKtBrzC0l78F3rJoIQ33H54MPhbVNL
         YUYyAMyCuHXL1lbKn/XcF3CN5RTxGfhE6EAccAJYScGZEsOyHmf3x0db2lr/GQRvsXcg
         z5sVEmKqlaXKqF55YLOa9+OTShG7lBzA7oyXQ8jeEs43Y9QvBpeAQlY/eNBN0JSERSaU
         B9gtS2C1B1wFo3tVdTc3C4yjzXXHVnUv3lpul9OcSlWdjdDQRilMv+wni5bJLxeqGnP1
         AyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb+GCzYSIovwqUnR/egKt1RjGuSiMXDKD48hj/XbhQpkemf0yzG4egjMf4NX5/nuPfhrv99ar25IFlFbO8TIad@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2QqHB9kbESaou0knv91QNaTmVBrCoLZ9GVx73CrFmUbJnmLy1
	DXXSaYW27tvn+PryJu2cFHnze4NH8aJm34Jpga2Gdg9x7r0kEEzTH6PqMxpppBaRUSk=
X-Gm-Gg: ASbGncujp9CbPAuIMtvmhbKl7FhtgI+aKEqs8u+TzeJK7YcUawI6zkDRrZ85NpcjLUw
	/YIaGR29R6XIpIfLpLUyW+LVemqRuSt8RI3GRYOH5GOmc9mGZdqN4ujbIn/qwuyLCxh9Wi6W8kg
	Z5ryf56DgiMrij7DVzjtrQyFgj9sBwkDjzywwXkxXPGrZF9wfz5u3oYai0ythNdydO3sZZqw8ZH
	4UU9TqIjVH9no4C0kLoP6991YY1xfn/7t+GrNGWitbF+3dsmcNIJMJKjybKE69emaMSUfA2uxIX
	1aWyuxD76sICkqQz7nGrC/ZL836c6nlftzxUVauGzSh6Mheb+D049u96qiFfUDu4wAFSPk2ekog
	AczXgmtMURebS+xu6XdrmYfe2O4IEj4uwOkvrsUrLvtb83OTc/03q
X-Google-Smtp-Source: AGHT+IGlRlomj28QsowpW+ggD3fSIRdZkTy4adIY1fcPCIHbaJRIzm6jBaXx0BhL2//vg7rIorOICA==
X-Received: by 2002:a05:620a:29d0:b0:7f9:44b0:8072 with SMTP id af79cd13be357-7ff26eaae2amr464092785a.4.1756642397911;
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 12:13:16 +0000
Subject: [PATCH v2 3/3] clk: samsung: exynos990: Add missing USB clock
 registers to HSI0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v2-3-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=1180;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=m2f5QF1qzXsZs/+Ale6o6q2WrCrUbiw6HNuUXjNyWQg=;
 b=jhPFbn1//YcT1nfRuEz6+shNgqxHkLrk/WjGXAUF7BRl9XYF/0woSJ0zRfBoxqiOCuHFgPHT5
 lzyoXOz3+rJBxN/8EkFeSdhevcTySRhTi5kPETQZXXWA/eiNYG2SjdE
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_051319_554553_3296115C 
X-CRM114-Status: GOOD (  11.45  )
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

These registers are required for proper USB operation and were omitted
in the initial clock controller setup.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 7884354d612c54039289fa9b80ad08f34b9b7029..47a1e0850c3020ab66931ae0c5ac4920f41496d0 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1224,6 +1224,8 @@ static const unsigned long hsi0_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSMMU_USB_IPCLKPORT_CLK_S2,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSREG_HSI0_IPCLKPORT_PCLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_ACLK_PHYCTRL,
+	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USB31DRD_REF_CLK_40,
+	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBDPPHY_REF_SOC_PLL,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBDPPHY_SCL_APB_PCLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBPCS_APB_CLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_BUS_CLK_EARLY,

-- 
2.50.1


