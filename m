Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8791EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=; b=uWnALj8/VBW0VOMr6N1rZyb9FR
	hP+65Et623CR3nGY5b4uOCksllAGmG5bgtrZTmEvA83YHO70ker2qi+GuDNV5UZ+vkm7kmuGd4kWO
	BV5D5LTKZQBo4LatuiRiVKIOUlEKPmz2keyBAGAyivlFXwnSNkrmxeOueCaFVRVo4mACDYj9iNESu
	4DApFzwqmx1noSLpdTQXKbgQP9x0bQowY9hwdaIpFWo7+DNmXcClK6N/dG06248yhE3VM6tenOpGf
	luEaPdPDHra6BY1Xf/DJZTd1AlM7K/sbWYQrZX8/OQCN3fQl19vEV5Srr1yyCSQw3DHlqHQoQorZ5
	0cmOrVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HHH-00000008SrV-1lgB;
	Thu, 03 Apr 2025 09:54:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPw-00000008Jqy-0xrD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso115721966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=esC955ZUY2dhzcNIiGE55gPxM8kTTsJCb0W2QE9IeH3hZDkd3XD7bZt4Q4Ctzw9wuT
         XX1JeIYv82Q8Mm2HbUNV2eZDzf0DLcGTkTuYXdKeM9EuFyKOhIv3fIUiBowpDe6VkP47
         aw67v6IvyovCmAlC6adbaOd58WXt/j7EOzpDAmiNrsnTxzCRpsUrVTdjqkLI68PTJJ0c
         aadRTRs26u8E+IQarYwNszRVDNKVD0pVhWDzumqlZCbQ4MW6PekULEn66Tkq5CKHVusq
         fTf8xCvwLN0bcPpIqo/5iOZKMBdkaAHOK9+PkWZnibHDJhm31en1iGz4DMgFFQLNiuUR
         FUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=sLWjxUsifvZ2wTWKcEmkrTrQGWFAb14qYAZ7j3wUR4V6cl+5jWZ4IDm+Xx13qQWe/p
         C1FEjHPPmC+ysuGwCb/qjKHDB6tL71ifeR/TXMtN7T/i9AeTIxDo4WN1siY5ucAQ5Lvn
         MNFTCouu49KFSZEFlvPuef94FQFTpSgL4eyz7nKMnqe13rMdbE/VhvKYvdr68+2MqvW3
         UvBxNXsWpr+osP3CsWRtohvWicIuTLVg83zGUI3EIAfyQK9AExJTJrhR9KFlKE5pt2Yi
         Mm5GIahIaIXnnFu7vsU9aZs6YR/UvLmtkaLA2e144nMPeEaW11JLoseC0GU7V78Nt7e+
         j+9g==
X-Forwarded-Encrypted: i=1; AJvYcCX81tX+XOW7l1AQLiQZ92qBOz4x2QC2ZcdQpw+a7k9CUVlY9Pna9p76fnWY9mJVcgwjlzwVzBMCC8HnWXVyemlB@lists.infradead.org
X-Gm-Message-State: AOJu0YxY41dsvV6fzVLvBpAv0YroKsJoFmZzqPiggfIkMHYkRcYlJ3Um
	GrmfdXNEfmogiLuM9XJCxT6NE+QaNu0jqdAUyIvua62wdU1VX96vzG4L6e8Sn3Q=
X-Gm-Gg: ASbGncuEKGNdpIdanVa/CjLmAPHtUBa7w37SvdyCCweWpWWUjRsID70I7fEkr1Q/YuY
	69PhzKUrH5qaJXC9gDQh4T0uFB0ygtBmPIRCgtWOhfXEy9qW/Kxs8lcjUnPxGy0HcYqm4oOvfAq
	07R5APDjJjCBZsmFpR6OD306kcCi3ZBJ9tXbIbU+g/jtYXzfix3kcsv5JC1zS84iStplneGvqej
	zE18+pkpa//bW6lrgX5FKe4ofk/g2QVRnrvh5QrqXO4/Y4JEkOKNB2ZkJFIUmE0SFqNP3efZzv7
	OmBSsV/xSxFWRTgEK261WnEL1yXjX0e/qbV2Ab+NAgDIUxm+17wA5q2v3jkyfM6B/4pVQUxO+FE
	jt2Rpam/UMYhiM+RspuRSsNDm8ujX
X-Google-Smtp-Source: AGHT+IH778midZRWwNsQwTegqpsc1cU2/xzEiQMSkFa1kd7UfUZDcEcX+jZvLbDF0curTDRXNPPiPQ==
X-Received: by 2002:a17:907:3d8f:b0:ac7:81bd:60e3 with SMTP id a640c23a62f3a-ac7c0935350mr136224366b.27.1743670758907;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:23 +0100
Subject: [PATCH v3 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-31-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015920_274681_2076D64C 
X-CRM114-Status: GOOD (  13.29  )
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

This makes the code easier to read, and avoids extra work in case the
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
2.49.0.472.ge94155a9ec-goog


