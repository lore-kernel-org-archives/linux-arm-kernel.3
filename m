Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3068C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=; b=jWfFyALOFaS6wjHhVNHegVdwNW
	jLJF7yXWb4sWf0qczzKs9O9ZN2UwwVWuiE59aAjDwSSV1r13e8dgQp09gpwdI9CwYbCewoZXJJl8/
	q0wunnO6p54peAnJXVu0lKyAz8KewoC8ZHlz/Ffs6ZoJGrz3YH+I81cYoZQ9Zaec5OQuMTs1MzG2l
	N7wk+erAF79O9nR2JlM+4RfmcFB21y/WCxAVWC3RCttH0vZWdA3sCpdwSlH8fF75RWXqFClA60wzv
	m/DQpTfz5uTZhy3weo+v4XfiO4Up0683DXgR9X2tU2ARktegIE4KcSzTTZ4ePizkS1VylmWDjupIH
	GJsws0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUqH-00000001uoC-1jmn;
	Sun, 23 Mar 2025 23:34:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyr-00000001pF5-0ePX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so6965258a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=vpVAMspxct/wXnpJ3IpK8NyywGwsJs+caK6ZLX5fp9b3DvLO1pYV1WhCoYgBhUsD4L
         TPJcJO7R2N4ZkG37jd9ojzCGKRgTtaSNvqC9gpVe/OwCduUMJW55SSLUbt3zSdZDeTh6
         S2Zw53mO0+2mhIGMCU04DPxjpS9wmRb2nOnHBSucaQi1sv01WeKC4yO3hwNBbdWcmjBl
         f5Q+6HPOYMiov6ru7xHgamyFiNqtgnOHYsqzLSaWLWQ3nbj8phi+RABIteTa7VUzsURF
         ilR/1XNwjh/dAo5ytRKXNzBkmRzvOJAVTWPofDe7v3mR+c6crfa1IFe/AEtsD7z28ake
         9WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=mnclJ6ePav2ZGe6DwLo2fZZSUjwuw1GtJ+dekOdwMfniQcmuOG0IUxzLarvX3jGMqi
         xFLo4o+r0lFtFFHP27WO+8hBUlUv0YbtXBhzFS1VzLKxIkl1QMdc+JDiJN39vqfpEJiO
         gqjQexRi1D8BteWHHCZrbN94LovLXXrgdJ0U6/lB6TDRjdG8Igmg9oiGW8rxq9PHsG8V
         6SDfIiEyGhntjr5P7E4FGPZyGu1FqoRJKMQ0CWKqP8CWV7TzCRiSNg72291f67RI4dIc
         ebTQoJlXBrqRCCw1Lj0voyeM3rf7GQDNwyB8Wz0+5RzJCditPeNObb/9Cxyip4mWJFzC
         zmqw==
X-Forwarded-Encrypted: i=1; AJvYcCWBBBPIDTPD83ULAcOj21hu3PTsbQVDjP4XXiqJHPUy/vFV/m4mdF315awmHgPGTK9QZVWFPkQ0YrudHdAN1Hvx@lists.infradead.org
X-Gm-Message-State: AOJu0YxvoS+D3AGqzfRJziM/f6eK0Jf9IoU1bB2TU3rS6TQVKAPsAehE
	35Z0X+P82QGMeJTXicrST45/nE74uqkrs2UWxNlsRU8FcUfnTLkpsxIqX2U2tag=
X-Gm-Gg: ASbGncv/VyhwL80FGGP6+jXCQakwffmAWLXdFfPA04dWYpdHQ0cN1G74fnch2fo5K13
	mzCJpn+BJd+Pd9+VfgArPxfEODvw0ZA8mC08FMObVpdhs7fPfVcZqt4w/v4Fsi3J/jwQwVESRl/
	X+sNGAyphqNlf0Xh+w+FZaIc815AVIc46XS7JzswH+uiQMWiNyEX9JUsMaFkVRlIIaJ7MU/kjUh
	HYPBJWnd+q8trALOoQwDCP6B74S5Ssui+FTm2mhIUpD8Sgk7+6bOtqwX8UGAPiHxsklkLWVrW3F
	nJB2iADIff5J7T9SV8L1Q0h1zif6HUV9LgHS9oJ6TO4dQvwZYRbd+fHoa9AH6ooBq54LUupzgY1
	4CnaoHGyboAlvhYCQ0P5YzbrhYu7eA4/d/KqODrY=
X-Google-Smtp-Source: AGHT+IFs4xHKZtefwGlVOQ1hTfmO2hUQ+8e+EVgI4+xRTbfzM8/S+AZdGH6X4/sL+XMu2751zvkyBQ==
X-Received: by 2002:a17:907:7f0d:b0:ac3:3cfc:a59c with SMTP id a640c23a62f3a-ac3f20b9b10mr1154328366b.11.1742769583314;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:49 +0000
Subject: [PATCH 33/34] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-33-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153945_224470_46CC2C1D 
X-CRM114-Status: GOOD (  13.09  )
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

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra works in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.395.g12beb8f557-goog


