Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE38C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=; b=BUBSqET1ls3LsZTUCAjVKBPILq
	mLdXVKPs3DEukIs35EIwnFMP+9QqU7TM07wUnfzBlMaokc1CuyAYyFOwBznIMhOJa8AZmBB22mNAq
	RTtY6P8fhlq7BQUN4977iV71gDnpXeMx2/s2v16nDRMB5fFliWC8/QkBf+9E27EOCokXpNhtqnHES
	95yllWvH9c0oqUAvN2YCzERkFPjZzK3GdFTdI3kOBkfTdeLDCzfzKV6EH+TC9X/CAjo6Gax451mVN
	IKtu822U1Q1henb5e8/F4x4QhMq5KV0xQ5IKC/O8Qud9iOmIm51Uc4NKQwaDV5fafBGKJQYX5NyHa
	g0gik6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Va-0000000EJEw-2GSR;
	Wed, 14 May 2025 07:26:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Be-0000000EFSG-3xFi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:05:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso13859405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206353; x=1747811153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=;
        b=LDmUJxLlk9NnwXit/8d+DeWkJGxIUpA7J7WRMyoOqi4PLVfFmzGn/4bXiGabZvS/Aq
         0byiYjJs3km+jUeoS3M4ZMtrqQY9ox20TyjQ5BnhZ4I3ILqE/LLoB6cenb/Mhovv9d70
         q6TFU1YfQlBgXNX9GT0EH322ExzLR1p1fRD4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206353; x=1747811153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=;
        b=S8e4CdLQTwMFXEMO6+bzRWRLD6j2w14LuBggk6R5EpT9uFIxE0FTDdHDtrgHnoR7eo
         IMLWc8RPfsASmkeISYNf7xju7DER/CkxG94SvWMcZe3HC8dWK1MIcGBjkHv1CelSe1Qh
         l+nFNTo1tehgWyo5z/9ePgL421wpaRLxZor1HDfRpipBcpKDCXz1B76Se8Cn0m7iQRUU
         Ze9PkHKvsI1jDlFDYRsepBPErtf9aQ5MCSih+MffsQNuZ5B2JWCUCbVsjc/nrsMmW7hL
         W7JKFvdTG/w5Awjnhf7eTHL/xvhysBNNswJUVldYREwL2ymElmOB5Jd6OEWxGeoxur6+
         fmWA==
X-Forwarded-Encrypted: i=1; AJvYcCVxnZeQoW9lQVxwYnPgYXNAvbFPa3kIYJViKwNMwK1TQvmRQsh2SAFaItyqbBs/zc9byvXHA3f6fkQU04PYv4NV@lists.infradead.org
X-Gm-Message-State: AOJu0YzX83eLtYlS3t3Q9mRUo/jZvyZn8iWTfDn86WpxjPuvfHAy/M2w
	kegDHa9NrwXXcXpqFar2qPqfetPMroRTGKE1tPoFJxm69WsdU9o0TRRS9TaKXog=
X-Gm-Gg: ASbGncui5cBbkzQs5geywQDMoKL1JAdiBJmP4GHvVZEpZdvtIScMWnr+CGxCUcpfi5L
	lEv1PVW0Vxbi/fF9uQdl/nJ1GiPlnpAPAuCyz5q4UsZ0xwx4cPmFpZbqJc19yzXHvLgHZFTX+NF
	XVJixAUh8lEd8zyR9FgH8FYskAtf+X9Okb4Y5rBr80q6VtuzapRO8r8XfgvPWnmisc/BhewbeCv
	hU/CekRiyBywiuET61DHsworpsidn5exd6Ml88d+sawagbJNupvxtu60mEfecTnh2aOIhGh/gvP
	soR7gPNj1q1jeCUoOV6eV+zVvoc49DRXdwsAqEgn0fltQOyj+53UBEyER9Wy4ahATskz79PxvI1
	/lLtG0usaKRCsPM+Xgr0tZLN269Py8Sc+Zpl5eMdvMmI=
X-Google-Smtp-Source: AGHT+IHc0QtO0MfClvGYtNmSS0trJ59pgTJOhiVrzxjClwg6I7hvnE7Dqyuc9UcLulozaFc4dOaubg==
X-Received: by 2002:a05:600c:5125:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-442f20e3e9bmr15676275e9.11.1747206353147;
        Wed, 14 May 2025 00:05:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
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
Subject: [PATCH 3/3] ARM: dts: imx6ulz-bsh-smm-m2: Update wifi/bluetooth pinctrl
Date: Wed, 14 May 2025 09:05:35 +0200
Message-ID: <20250514070545.1868850-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_000554_984505_D4330B38 
X-CRM114-Status: GOOD (  12.24  )
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

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Adjustment of wifi and bluetooth REG_ON pin settings. Align them
to the production kernel

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index fff21f28c552..6e4d09bf002b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -128,7 +128,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
 			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
 			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
 		>;
@@ -149,7 +149,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2

