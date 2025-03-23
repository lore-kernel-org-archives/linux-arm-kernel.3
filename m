Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358D3C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHaTbCMsBXEPy+wffmMjNGPy/wKjQsHouvVH+3/pTJ8=; b=K9z/1W9bFhwlyBiNrndC8w++jj
	aMJ7vYGIsf89u/bqIjDwN1HZhL8Dwo1AHGII1QssHRB5vBjCffG21e1hjFhwdlcFJMQIaph8FZda5
	RUREBk5fR7uL9EXuznRko+Em8zVckxepfafEWf70SahCvjr8+CYGAUdXYXcsHkp/WMh0TwqEeozZx
	bIl/VE2NYdWtWg0So37AozlXeT9Fp+3R39Xw5Je2HmCAylDldAfeUQ98UEZKUwMXlGZ0oUMUHs9B2
	FirLUEY2+wUvZ5vAIzfBSEwdg1fXIC0FcCN4DCJAJoxjOJr8jRN/XaY6MdQ6dmSGQJVcecfHXUdGm
	Om1yyexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUed-00000001twB-0UDw;
	Sun, 23 Mar 2025 23:22:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTym-00000001pBu-2Gnu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2aeada833so704466966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769579; x=1743374379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHaTbCMsBXEPy+wffmMjNGPy/wKjQsHouvVH+3/pTJ8=;
        b=c3Vju25RgW2n0mrOxJrN5C7d4d447j+omQxnyzS+6h3BO8xfKe3nAU85bRO77j0M4D
         0w4NHSqvYNPJM9dEikFrRtwk6VFNDt8vPZvqH44Ui0uIAd2pRqDM4sXF3kXrVkvVmoW2
         oM2Q8ofdFXmb3L4WJixT89Mgi7+5RITPZjH6peNayaRrkwE8bGzRMJG5EYdKdU59lXDX
         huKFf8lr/ajYbXTyJzNMITqs03zhCY/C+slaOwPH8emIOOE9Z5tz6e+oz5sHvzPSyMfL
         RZ/5Argg/TXSAJYF6Vp61pgaUSvQ8NhyZmvHtujjLaOnlo7VMUOs8eSoXzPc8O/wC0a2
         K0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769579; x=1743374379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHaTbCMsBXEPy+wffmMjNGPy/wKjQsHouvVH+3/pTJ8=;
        b=TL6fMleU0FDTXKN47TQfGvGwYhSYGFN/447vwZ0WuySCSozeTv7WQel0mgeabRyODT
         9SQwMTvEKqSgYtxVr5jNRcx8SaKKAi5PlYa2oIApoyJWQl4lW/5uwj+Sa3TLWasHGDG7
         6yv9za7be1lU55+QJde/AZnaPNuvEEM3JS1L92bVtGjqlENPvPM+/7MPTgCiwxfDd8v+
         8JMUWNEZmJ8XECNX66hgIOswf/coTqr/xDsRRp2vvEXZrShhHX75qUGdVjp5rr+NKo3W
         ZjI3YmfGrTcZ3jjeCFY1ku2xHdKdOQYBZBXC6BO0hxsERj2X0rvPazhgHhxCBfjS4Jt+
         qJog==
X-Forwarded-Encrypted: i=1; AJvYcCVvuIg7RFXtbxKlEJKEiKwlAhd8vHPrsFaqQYKHWx7j2kbaa/9DJmGvCS/vKarKyMBWvocPm/X/B+gK8/VPRxM4@lists.infradead.org
X-Gm-Message-State: AOJu0YxxBMSgi+8H/5C7o9Umc53hgQeG5dGDMcJadbR1Bx9g3PXy0bnW
	yTs2Q8gcLOqdYp2UgpPxk1da0CHHHtME1y6GZP9JQP/alI8kpd8lTFKLi8MHHsY=
X-Gm-Gg: ASbGncv+ZNo4wr0iVZYQSq+WxXq5tF/Io3BgpXymfR5f+dyd4HPEFXtILrWsCEag3xU
	8pzlwb6TQi3EN+hfpF2WPLyyhKTBFyz29UpH83wjdCPN9FzQf3ARgoURzpokO52Mh+zxgl+Yeon
	v1FWv9y7rCj7dkMsTVQVGq5SB+Jjy8oZNB4BbSA0YbSOzMu1QV3rOsIoF+hplHwlUetxeTj/Tqb
	scFqvhW2aulbc5dCpY+7rEL8weDYHNyJHx4xOYH4JMSPCrnj/EedF/uepFiZPOrf6VNN3e46DyK
	U0Mb77b8cZ2pUWtQ8W33Yv5vjvHIjPq5cqF+NUrmGJ9fodgjQErJg1MamtpjXxIazpV+Io1RWRV
	aYjGN2DHRxiXUZdhkfXVu3eRLePVY
X-Google-Smtp-Source: AGHT+IE8DhyAI41xwJ1273XUXoV37Lt8dbT+04E2oAAFhJgLPXY5M4zmkgkE92YY51ZbbO2cYsb3Mg==
X-Received: by 2002:a17:907:d84d:b0:ac1:e18d:a738 with SMTP id a640c23a62f3a-ac3f00af8famr1143082266b.3.1742769579059;
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:42 +0000
Subject: [PATCH 26/34] clk: s2mps11: add support for S2MPG10 PMIC clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-26-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153940_587917_A3B42A25 
X-CRM114-Status: GOOD (  13.89  )
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 014db6386624071e173b5b940466301d2596400a..e86a762f80ccd7485a9f2a6f567b81bafe119874 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -138,6 +139,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -220,6 +224,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -240,6 +245,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.395.g12beb8f557-goog


