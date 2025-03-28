Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC70C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=; b=xt4uyVfuzjpCUCh/x7t/nfChDu
	vPHmUC3dBq/0hslNDMHQEBeExHmmLjgJMnUhgkbQI+ZCZ6+eiebRkLL4rZbQaoCQV61MN5WrxOQTv
	YkML7MxaQTcSodXHPG3FqkHG3dF+dxQE3aakc3vLwPe9SLAAwLt2Et7yUm8dXx/wRf3cytw0o2XMR
	1e1+P0Z1UH8bkEKtx/v0btqqBFrdOH11D1QWPaVHmfaMgAJOi+Or/4fHF3t+HmDP05argoiBhBzcu
	nYs30cxFkxV2tP6O2pwyWwqpBpdhax0H7A+SOiHi6tB6G6oe9W2yecvdwp2fbMoR+xVc+2d8PkvKj
	05FQ9z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAgM-0000000Dazc-04o5;
	Fri, 28 Mar 2025 14:27:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nk-0000000DQnz-0P9l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso3368207a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168671; x=1743773471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=BXtAN0M5EQdwmfAagmjWV1IwcIMfbuAbgXG/EAzIAG/8fb5yZQgiaTRGv4gyHR45S3
         1ydt8mDTlAgJH+K522TdfjjDi3hXo7JOiQRle2qLv9AUPX7uj+UuQlRRdl1FPLf+xzJH
         6Zn/VNFUe5+viLyjbryPk1RJstFfojfDsIym5efZjX+EmBLKiZ4vAm86xMHNDNLqYHQz
         dGC7u5tzy9H0oS2RXQxcnQeShg1tgQOFcA76l6G5u39ElGIOTUWUZVyvZI2tmlCazFUi
         3z6Dwt+c8gzCKxB7xX05H9SFIQWLFto97zjRFez+wKcZUhp5ZDO5NrZP9Lu06iKY5EYH
         jxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168671; x=1743773471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=NaFiEdf1QgieQlSd0ApMfMHhzZJEW8pXrXyd7k7h2tsvJozFd5wLfJQuHEbfgNNeq7
         q9UblV82KXatmzemyIrKo1vJagjh5FlSxC2OEDuAEJt7tX9L1zZ7bFZWAfuXzCNK0Q+g
         N6yVxIyDDjhF5ycAjZYG4wH5xWmilPzkQELSk5+51G7Fz7kkcHyQY3pJ+gNZkvyKCnls
         KxK84AU9eZ/ft8Zm04NDNrSHrl50TnVklRaQPdrym+lssXuIKxwQpP1ZPZT08iQ/ByB2
         gAq8i6c+QkfGxb2pWwLSBz+gtQzDekP4m8jo+W4vUr9u7DJo2WDTOGZfZqPUyskwBr0Z
         7JiA==
X-Forwarded-Encrypted: i=1; AJvYcCWFlPUfWidiUNgPXcP8JzmgNlzo+yryt1wDhUvH1CIFEkBTD1FpVFZYh12e0bFZ+bBa+0yuAyumtlq+OXQ+AiJy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cKfEilUDESrMbOfiMjgQT9XO2W4mbRQjcyKJGRGID/FlAD5/
	ftyVeyc3z0nLWJvaycv2HjHP7VOowOntFAW5yxenmPqczD8Z1j64FMYc6DxnKIE=
X-Gm-Gg: ASbGnctzYfUA3CbjETpd65sG0DES6sz3c7Q0Iy9lbYfV8983wejIXlwLTG5XBLRwWTz
	H+Di5qDW0dBTv5+bK4flhr4B9BpNKCrPOc7w6+xCVi2NBHYhJp3hd/F/NMmojeGobvd5fBebccC
	4I/Zxt/rD6dRwJl90ElI4iM7EnQTfzclpsD9UvfP1aJL9KWbe6Bsng979pArEh/39Tu0VYn3ZNB
	6XbYyhj3QwgXBH4RU1ivmsFnXTI9/itNPUUW84G0xOhls7laRFl7ozFXRVuf/ZVATSdM3Ue0FQl
	YQCfO1aSCq8TXciGB35TYNOYtHMRlQxCsni32r7bXebK8lK+ZfNsZvC1Xwm/UvNFYBCih0TqMLa
	ISIr2jg+BV3f2afzLb31qnlGNWkzZ
X-Google-Smtp-Source: AGHT+IFSs1uiz+MYEgU+bUhAfh3+GZqO0SVgrjZOqgHDorj3bQXBjGPLvsOv5IgyeRPZA7NSU+kGow==
X-Received: by 2002:a05:6402:268c:b0:5e5:c3bc:f4e0 with SMTP id 4fb4d7f45d1cf-5ed8f80a51amr7531556a12.29.1743168670656;
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:17 +0000
Subject: [PATCH v2 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-31-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063112_155555_3C0C353F 
X-CRM114-Status: GOOD (  13.27  )
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


