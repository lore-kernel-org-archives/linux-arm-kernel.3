Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA93C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=; b=X0TLgGKFIMnCGvXWPnhV0dkQrW
	BjObW6XYgMKrtL4rnhBlsTRoAu4E3UCt3T+4xgLppP3jjFRWgfYmkfprZyeXtOcawAeRtlzjFUGub
	a+oP1IZapGYJHF3E56ohcWLp7nrKZ6xoyjeZd/YXpbjqSPb246XtwaK23uhzyTgbKEobaS7cLVsZl
	R8dzDeV5cK7E+qQ35ZlDzb5wxAOOOLQF5angK5443ciXbSdxFzRw0UR/dkMgKJBKLXDcNjSazjyKW
	3SxLDuohGBsnvlEcE6cBcHA8CeYBwj+VGB2wjr2kgLyStizXlWnsuNR4izJ6XI/zxd4ESvjO0y1JD
	w3Ih9eVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAed-0000000DahO-170H;
	Fri, 28 Mar 2025 14:25:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nj-0000000DQnX-2T9U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so4054715a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168670; x=1743773470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=uDA78V81a/9KdLfGyXqb0V6cqNec0bWQe7JSPoKtJVKZJSPOSfu02H3pt7IaPJUYwV
         IQ9hG/HGde1fOSnJonW4HxQWv43BHVMlvcQuHl17u5wGCGhi3cX/RLG8NcfamFFDQRXj
         SuHw/ThrWmdTPNXhNjT7a6t2Gc+djzK8AiALcMfvPfogzC5Qi7jJ0hF/FNOmBKt13m26
         +amRUV4mopy/MAnYBaVgMhX9ApUa0nX9f29ZqRIWaL+SxuZzJ5Ki0ITYY6VQYBaiTZFU
         B48Z9tP88O131aZBZIoUCDc6Z2+n/ytln8EV5+QSBwbEqDKiCKmzen96He/5UYTrl79v
         m/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168670; x=1743773470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=vh7/Rg5XWVMK4KKm3/9K7AO2GfSgtqWMOgn1kceYWrJGNT0CQAdkG+k72ospaWsQ5F
         nYchXlMzeYOm90rQm5jg10yowzjN4X474DZrX26fBD0qNbhZ1wYge6cEgSrol0uWQLLK
         v+zlWdPD3TYtuVDhQAYfNJZFaYEWATI7yxFsT2auDJA7RutmpJlgMmKa811Z1Gih3JnO
         U0k0M2hU+X4QwXcstAA6GCjxTN2ZMqP4j2+AfNialCfXGcdomnN8Jtz3TJ378O5xTkhE
         xnF8ClV0pzG46zzH5BFOl/ifPL2dF2XgXTsTpKdJj7QhvdhLvqmgCnw5cu+wrtKM6t7Z
         5LUA==
X-Forwarded-Encrypted: i=1; AJvYcCVfqm9np985tPO0QRzqsXmyC//phCqMt6AWmgn/TRCdNZn64SKu2Gm2NvGyIatuu8EzYUkKcsydAAs2mlYDX2+t@lists.infradead.org
X-Gm-Message-State: AOJu0YyyDmt1buJGUAValAZS1l2WUFcWb6DA9dHrUgWwNcrYNdHbv8QV
	7dZr5bEyhsRevVMXTLhO/QVx6oL9mmtz8qQy9/uSl2tqbtdp5LTLI62pMfwfsyk=
X-Gm-Gg: ASbGncv9KEZv7mjXdMyhY2T6D5/S9B517MkBYJ39eMdgVDB8ZwrWVCop5P7siodgi7z
	fzH6ZihnhEJBj+w3ULK1ir5dR61JZuTH2tsF4R9dL5s17MUh0igDxRQ0+ZgQzCLXw4Piks/E8QX
	5D8MQcBwM7Vackfb1O0OxTOb2sEjyWDrYL7mYhMb3QkecE8bnHIOj1WV7H6MqC4pMVKDgsnE2to
	BXATuzLb5sDhbx4a3SWqO240B00lu3QxsfYDwj+G2KKS+oivMd5I/86uXdC+uy7TfA5FbebcPM3
	yhfjNm0qPoV8zLqAfXkeRrF0LUe7qVlx0HwSqob/K6qEV2s/p+EzSH3ltizg7iCFUah8oav9FgK
	JZyb10zo9ngf/YpbDX3JUE9fdKQRU
X-Google-Smtp-Source: AGHT+IHYdNpE5Oaiy98m+ZWWJjpn0kB8pbikHk0ZcUltpSgeHSv0me+ylZHKLUVEOgvnZGzJh/notA==
X-Received: by 2002:a05:6402:518d:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5ed8f3fd122mr6775177a12.23.1743168670150;
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:16 +0000
Subject: [PATCH v2 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-30-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063111_626563_317C13EB 
X-CRM114-Status: GOOD (  12.71  )
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.472.ge94155a9ec-goog


