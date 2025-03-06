Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E8FC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOVqMOdoYgDbI3s4q2wNweWZOHmBh2nVQMXWQXaXjpc=; b=xYWGhsd2Jw6LvVaOSVkxJs6p7I
	8QOH8OsC5weE7TGPHz0JLhH0Ge1yh8OkbhiUkkxWCC7DykJ3pPw8pCuyoEnGNXbORsou8LjTfu80G
	64cwzo7uEU/iDtEUygmaH1hXViyf34vZHDl5mIem722JO/OSk2RjwtKR48tYSeNOYM1LB8hIY1ScN
	/Xur9J3GkVmKQZbYQ8i4Yawse9PMsDKAX0o5lkCHfkEzKzog/tRPNwXlrHQqiNcJklSBIrkExLH/i
	E1nJexZvz5hFQQur0TEhebE1CWqAqblPxSEz2SsO7PF1Q7ZQowEy1ywt0RGUMJrQX2/ZqaEwUsdOI
	GR4/PNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB7r-0000000B1zp-1wro;
	Thu, 06 Mar 2025 13:18:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RK-0000000Amqj-36JI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:31:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso3301555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260657; x=1741865457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOVqMOdoYgDbI3s4q2wNweWZOHmBh2nVQMXWQXaXjpc=;
        b=hJW9USLVhGaxwemGb6yxtlwHY/0ugaCzMBvYfaV+qEQkUE7s7LEZxIo7EOHdt3RS8w
         GPtyaZys7SEFIBaM3gt/wmwkqDlsndGXwga5Z3nCfHDY89Ph+KsQ3qJikfDH+RbridQo
         e5XgBPb/o0n16lmqDJ/WCQLaP2XdQHuhHOztE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260657; x=1741865457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOVqMOdoYgDbI3s4q2wNweWZOHmBh2nVQMXWQXaXjpc=;
        b=WnMEzzj2An5wBqMgXLpurN5mFwlJtMjwUnxF7IqY9pK0r+FcBTtyfufQilUhUtKM6X
         i1iRi4m2sUNnt8YHdJfLE6GtH5G0LQullN1m43XrIseJQLpy4EsUT7h8T5azCPnXt8Ot
         XRpDBxqe0/pcAZlq0o6cwuAihT84lqqKt2O5ZxBywAtzdNJOV1IElg9Uoqe0ZpfflSme
         5AL6NaurUy2Iy8i2wDCGsQSRMi53utkAqLgymW2U59ZVKXeq2PzKVsTrfKXxL5RygSvu
         PFMemaJx9xg7eNiJzj5qUqIARyDSgbGpSgJFdFJGxAS1CTiVHqnHDILo1m8A2hVjlexY
         0Kcg==
X-Forwarded-Encrypted: i=1; AJvYcCVO/B+OSrxkWxVaYdPl1LpwnPHsxOQugjRf/NeuIeD1Mpn1JJwywQ6Ra5FWYOfesafT1u3xWwc+swzqC2aZfRUt@lists.infradead.org
X-Gm-Message-State: AOJu0YyUNjkvJ+0wzmF98SEaZYdrqHWcjrEdjIYAF4nMiBlTz61mQTuw
	9QXfXMyukj/ClXpXotei76raSULvxPeeRfoCeBfET6s9OVnxN8YpiOTZjf21JpM=
X-Gm-Gg: ASbGncsXoLsVatAiZhmkdKlGn7YS/CDmjsfyEz93Iys6ASHGbmUm7wNaxG8v+foxeZr
	XAANp9fQo75PcQ7LM2mVmp6JuQDB9UwbuAoI3ifvF3gh0+N/CXELVWAkyxKQLSGrO0Ib+c9+L8a
	z+f4RF+ojzmn9aoHNkOZR75xsVws2WTTMMEsAK267diPE8bPFPVyj3K6T/KHj1TzJ9VUzQhCt4c
	bXIAoCWSsZ8rKBG5kE1Sdgqm83Wm5FO7Pj3WyPztvfmAs6XjZ5GgljwLY2ObOn1ZyjRjuJcrPf0
	5gvmWKPl8H8iqUd2aeKPiYD5TBxxLn6zm56XwH2AhvR5pF51KtmxDlF1qQuS+Tk8RQajgrGJUDm
	syHdb+w==
X-Google-Smtp-Source: AGHT+IFgPl8ZKMnUf3wGRInXWeZOMK2GwX9o32ww5mgLwS3armZaCHWO1p7ddK+A7zbcx0o2y6edHA==
X-Received: by 2002:a05:600c:1c09:b0:439:9946:af60 with SMTP id 5b1f17b1804b1-43bd2ae76c6mr47045825e9.25.1741260657417;
        Thu, 06 Mar 2025 03:30:57 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v10 18/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Thu,  6 Mar 2025 12:28:07 +0100
Message-ID: <20250306112959.242131-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033058_821070_31677E06 
X-CRM114-Status: GOOD (  17.10  )
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

Changes in v10:
- Drop the v9 patches:
  16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  17/23 clk: imx: pll14xx: support spread spectrum clock generation
  17/23 clk: imx8mn: support spread spectrum clock generation
  21/23 clk: imx8mp: support spread spectrum clock generation
  23/23 clk: imx8mm: support spread spectrum clock generation

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings
- New

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..eab05170442d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


