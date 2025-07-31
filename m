Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBBCC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=; b=gh7LD+LiOLe/UUqQ0nqTarGYv8
	w+r3GUrWrtigeDA+EdvwfG9lTbLPJ98nmJh9Fk1P9c87VnaoY/SU+276hUhS/mX1buQva8CMhG8E9
	IUfeOBKjhueClVVSaeWNggopOnfbclKLBc08QMkCEE8GY6ILuHm9kgYfBWgSWMuwokVA/g+yOzodd
	vRipI687phsJKrdhg74qbgbJchSKwZR3WO8w9m5M8DtpnOY7jZgpkY6DvrQth91Ebn7W79FsJ/keY
	EjvIohJk8Msmd+BsgJWmI9x7OhUbBEVLMdBNgdtXEnqtoRFiRCDBpOH4aiDn9eF3GtfEo9hTLuShu
	drq+cewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUb9-00000003stk-0HUi;
	Thu, 31 Jul 2025 14:49:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTrE-00000003lli-0y8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4589180b266so5187205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970527; x=1754575327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=YKY3s8AfB736CPYuKBto1qos3ll+AFPyS3UED5JHTw6/3ZVibkoOjEf6II86qRyQiY
         WYNQOxbo+bL8k4nsej3vgv7bQdOgBL3jvzktPnDeR+DeEfcVjg0o59S1cYQgDD6+R5NZ
         Idddb94y4GRC/3o9w2pTWuQ0r9ptIMUUsBsna60Jrya0XkTKguM/qjZNIaTXh/dbODDY
         kEcH/TjoWnOrwPhLQjebfBVMPfkRe5p2dBLeNssCdlBMwffFaUVDbIEVtWXjXJPpUKaV
         51UPLk/JADHgoj51pBFdKTxenyz3526GU5pTtNAXKDJD11+tnUYglsWC1xVzayMzFFH/
         NaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970527; x=1754575327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=NlsTG4kbQad5oM66q/YNwWXRyl01M0ezRTlJ2FakHVWubaA7Lf9GkiAsWDb3xBIkce
         hFJeN2O9Y6Tg/kRIEoIHY0oZsiul/s8U3eoXhamzWymPul+u76r7VW8rmJZU9zH4pvVj
         RB58Yc8iGiyTCR9G6ChaHBor0JpjkEuDIxjJgtra/fJoYihq8rUGX8EydirArXuIchF1
         GBquYGfT6ZgWP4p6PNM+pkr1Fql1Wvk3Os5uWma2dxpF7AsTKjhQxDoknqq4k2uxDB6U
         Utw8wPgPDXAwW2cuB73cfzlRbubG1CFvJdy+w8aeAFXEuE0148A1oGu2PRMIacnfVzL4
         SFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwHSOlS0e3VA/xOPYkXfT7WlhBA6f5DaBo3idyL06KMHw4tdm49dmn1BaEijbp5rtkY44zPevZoiY1VSFe9xlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUXNZ6s9d/QUQ2vl+jObaAtMaYtaGkl4aWRFarcqSTupHRg6O9
	VacBeFgeSU6qbnM0qT0tMgZledk0KZlHszlgDHbdeuERbMNihX2W5LUFpHIpE3TXb9o=
X-Gm-Gg: ASbGncvBDLoqN1p0t3idHtiVnl4nRGUNILunlZejpp3L4wPP9Dvaks/qEdrswDsq9pc
	a8PjqbZvA9AkhYNTRuuK9dOdo9ZRVJSu+kzpxG58HKHd5/CKEIElRWf86rrTroJEC4Hzol7cMnW
	FfwzRofWBCsqHHJ6MYmkgq6yp27XMV25P1z717ZPBEyl9CGje5wX5i/IRRHoyVFbJyJ4ijnH7SM
	2suF6Bx2zVdx1abZgcNZ3dA/Aom8+wVJ0isi5+kSvxPvKVY+y8smPqhh3RElOPzFFUmE6Sh8RCU
	/vBWJ45rCXxWlZETd0zPq0FUzYp/V3Q3e8Eg24Q+mreREeWbw4MnDCrSpOteORxlNIukbz+c27g
	F4QNfNzjWg7vqF4AFPWqQXskXW1XfF0widjOSGanmAxvgJGwFXl/tClW9b44=
X-Google-Smtp-Source: AGHT+IGoCseWUX+0lPWppwUdmNG0l0frr+iK8vwkU/QkBfN7U5WGI3OnPVlPht7D/5AVPZPGmJkn8g==
X-Received: by 2002:a05:600c:8812:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-458930ec808mr51382735e9.14.1753970526033;
        Thu, 31 Jul 2025 07:02:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:05 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: s32g399a-rdb3: Enable the SWT watchdog
Date: Thu, 31 Jul 2025 16:01:41 +0200
Message-ID: <20250731140146.62960-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070208_273202_873662CA 
X-CRM114-Status: GOOD (  10.80  )
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

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it on the s32g399a-rdb3.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 467e0c105c3f..e94f70ad82d9 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -72,6 +72,10 @@ &stm8 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0


