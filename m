Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7D7C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=; b=Rk6R2Ciq3CLwRa7EJ6tPRQ3GvD
	y99+ScYmQH/EOmDANYzosvmC9u/bZ0X9SZvxFxyva286gX0zI8EfIM+xwY3JnsdJtLv+WkYz78kYi
	ihdxrysiVQ2N2SKH4M+pRfpYBZZIClnyYS16FALkxPj5SljyekzxgIXWniJVJaowc9macyd2E/b7Y
	R+6RWOsoDMwML+jECDbibe7Hm0KK0jZmr0flYGJKYfkKWrJaVcD1IJAUuIcjV3UdqVpHd/bFX5yTp
	1EE3oKNQav8a3azjbL77Aep98fc7drBWOfdgcKdCPXaQhUjCXXCRiSRKW28WNjodtsNPNDuo03A+5
	GvGaWvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqA6E-0000000At3V-3I5x;
	Thu, 06 Mar 2025 12:13:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RI-0000000AmpS-0rFw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:57 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390e6ac844fso465936f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260655; x=1741865455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=R9CFdeMqnsCWcW4R8z/AI9nMzJotl4ZTZV5YtvYp8KR4rtcAXoxruCIJ1SSe58cPiP
         FPU7aJEl/JAx++zJsp2S2nghR2JBg1AYZtWs8Q+qM6z2Xi3fybUvd95xXhw+lmwF2oua
         i5kiB87NiF6iXYDIUd8XfQDqU8NGAQXy7riX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260655; x=1741865455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=edynVAGaeKteg8CQUkYhCYvZ7EAf7PGjVa0/YS0m6a2UfqSLnx3IhD5Pq/UctMyNwY
         P3chh7Xp+d7XOSIiTOFhR3Gum+dSNYmaQR7n/NJgmo34KAtNDFOWPi67SF77+6r/2141
         fFvhLkLJ+UJfqJYY6fprzTMoXvVeMq0+WJG+hMYOJLkq3+z9OEobUQErmNgdn6hdRo+4
         M2wKXvf7g6WA0dF0Nq3JXniC4LguigMpZ3KW5UFbPvdtPsKhdic9RGTnRRszfjRAZx6c
         aj82qSKzyfBCzgjhE1hbF0brLTL3n/i5vG+Kk+KIEK6PeeKrK816po9tgp9WVXgrmp85
         EWfA==
X-Forwarded-Encrypted: i=1; AJvYcCUCpDaVR3Mj9FDt2GbAQtuIrRRvAnrfdefhnq1HB/6RlvFR8j5cjX+k7CtRNcIf7382jKFTKE/2R+sWpyw6+4QV@lists.infradead.org
X-Gm-Message-State: AOJu0YzDETTQY0wYHrr6a73pTCgrmsxv/3P3ikUH+oMlNB2mcgu/JPiu
	GYsH1yduIQwacjlmLWQHN/Uz4OWmeXVjs558DEWzL08uYNg5Phax/sbKV2gui2A=
X-Gm-Gg: ASbGncsDdlHgfXqGcYsnyu+5BFl5ByisipbmLcbJuXMhAlW/IvUjdN/hqpkPxsjmC1H
	8u3Zm+2Ei7RIc5ugGoWA0Im1v9JnR09HrQ0CdWM4+28TUAb54i2mBHJZNrUKXRHoZUzf+TAe+Ep
	nhWEqne7rYrA8HCx08u1tCDvpfHVZSEUEw73viBrVAnQntUsURfHp6ltRnSKd1YxRSxmTIDf9d4
	6QbEH8S1OuGLOROttwF8PR/W0ZnThcyWk+sKnqEaA7M2UDYZnK0/EbkBaqdYfJGXgxsxPh11s2b
	W5+2Yn4G3cAYGGRSIvtACstknUxVshVUKpADHUcIUF2pKcYPQMJGruOEh6fSZ2AbB+0H6kMStBW
	BgelhGQ==
X-Google-Smtp-Source: AGHT+IEZn/9kHcDhx+uHLD679Aq/6iWA+3OuKqlfoSyRAz/qXxji0vn2yOVWqnfvegWeGGNMCqwuaw==
X-Received: by 2002:a05:6000:1788:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-3911f74e675mr5508637f8f.26.1741260654829;
        Thu, 06 Mar 2025 03:30:54 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:54 -0800 (PST)
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
Subject: [PATCH v10 16/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Thu,  6 Mar 2025 12:28:05 +0100
Message-ID: <20250306112959.242131-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033056_239554_5C4758FE 
X-CRM114-Status: GOOD (  10.63  )
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


