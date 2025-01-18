Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5663AC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=; b=X62+b4XH9ryJFSJ+gcUbBNQiKp
	T8dkveRf1Lk1zcBL9+Do+9ZZ0NmgPgTPuCetsHH2ndlH4DlO6v3ge9PPZ7E6ZH5KqfHstXcs1khuz
	yjCLF7ET+wglgnkOwVx7ADht1/sW5wvG8+aIHHYvUWJx13Dq6Sz3IevvQlQr0wQo5fmkqSai+sNgJ
	m6tS0VRgSB72gfTdwrqGTO/bSvxvEdMAP7JMj+pNZHBhvZjJbqCfeXEW6/xyNVCWCjDBxZMdmPTdO
	JkN8vC7aISIeQ2z99VNpj9ZHdagSYmg/tktBMfwDbnNmmODpsSfnVKszxZnBDc/6tYiRh2z25A/q1
	oLiPyoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8DH-00000002OPj-1Ffn;
	Sat, 18 Jan 2025 12:46:07 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88L-00000002N7u-0jVa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso5879866a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204059; x=1737808859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=j/1h+FpjLbAn2PKXTfx7fr86fzfVNLHbusRJlyWDLBALLtjpD5t1Qr/bh0DnhVo5Hx
         ecfcruUyXGMi+5aBA7HKNGFLs57IXvheV0p1+sF1I3MoiCo9jCbIT8tpb3oHjeGMFQKX
         qTTzUxP1CxiC163BYWGdT+TyXkp3mZE4o0YN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204059; x=1737808859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=SeiRanZFd+BMPW1ylklZ+BoSwAbWs2/o05beI7PHzzL2KVy78b+B421eYwaaOf1b+F
         tB4BsUJVqYbcxOfQoQCVAlQcHyCa/HKT/XS2MSCkyAWUYhrPX8pn8j1qhy1xVrPa2HqS
         dgHj2S6kD0x9ySdxpVaVOhLRW3IKKbNCtlk++sRSHCHheluSZKK94Mge1nQsXp1CWfTA
         imz60oO+ofhecHz1vfszGg9Q3T/BRQP11HeUKjbHhq0RUzArVVOnHac8e+6/GmdaMefR
         rBK1IBUItCu85WmADgEDt4AqdGs2FoQc5+UdR266oKHPU9NK36J1xqVVlDgzrZggoLHl
         chNw==
X-Forwarded-Encrypted: i=1; AJvYcCWGkPDCR3KQ5uXESIN55hDc4grhwSIfqvCqXZm2adxE1789nYRZiQCR8cste7TLkQCO5o2xkHKsNH/wMw0igO+F@lists.infradead.org
X-Gm-Message-State: AOJu0YwOmP11xaPg24P4SzK616pJAnAW6cAbxsdqUNtrFTyPFj4Sskuf
	cfs6ukHJzoffPOMMaJ3pChGRdnKj39lF1gg6X55ex9vuk4enuVQ4AXOVApAJOEA=
X-Gm-Gg: ASbGncsriFUwb+htKDg1VJTjkJMYb68+kLUru1XJFuByXO4tomtpKCLo5ecM3AysG4r
	KjP0yTA1nfnCu2nnNkkNPBJPknuDYZVExUW/zrR2waAafBBMBKuFR/rxf28PgchkwnVxn4OXU6Y
	1OydV094sX4glpWoKdOPy3m7piJwbIOqZmyDB0oB7a6zYZlZdZzvz1L2xpk3rXYZOd7iLHhiVxm
	1U2iQiOdxO7DVQfjvYbMbHYa+maVuf/zNphkby+vvKx7l8BBZQKdK4KLL+R2gktHRjMaTARmtAl
	UBK77G5u/ytRD3U5SpfI1V5owp1S/l8gJh/PlEPvufH+8uV9+VnGIf8EN5DYiqj46MvPE6cfPK3
	AO35GwYfRrqLK27j91i5CuplpGALstfCjCMV6
X-Google-Smtp-Source: AGHT+IFQ8yRpDrn6T0dn98YTwfRiOw5fpPhXyLBKHn9xj3KdLRo+kA5BkiKZot4n2tztl2zWC2T1Kw==
X-Received: by 2002:a17:907:1c0a:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-ab38b42ae4bmr531043266b.37.1737204059477;
        Sat, 18 Jan 2025 04:40:59 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 03/23] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Sat, 18 Jan 2025 13:39:46 +0100
Message-ID: <20250118124044.157308-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044101_211184_11C1ECC2 
X-CRM114-Status: GOOD (  11.41  )
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0


