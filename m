Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89A1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=; b=aYTdvSUjyjpk2bCvXUOskpLtpq
	oOpRVL1O2IuDaWa3BXu7jTk9tR9j7sxY8D4bDk19sStQIk7lt21f8DzefcxMUN196aWt+/RimSm/4
	Msx2SqzP6G7Q2upa6uC873y0c9tWMLyE+9TB/qQ0ujRUHkad6Vb8uDR2LH1RXxdUW9HWlToh4JuTt
	Q6RRAv8R/nVKTI1gQeYD6c6u3J/tV2pNVHTyXQxnZvVH6V6yqMUqTLht3YqhNU3lW55ihn7hMdZbp
	I9pF3fQyj8Kc4qLq4sAQKgkfJeuhGWEnruIMv3KUe5CaBT0LDsMl2wUn6dzkKZ+WOFdFSsHiyQgiV
	+ahNJAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2d4G-00000008bF0-2spX;
	Wed, 09 Apr 2025 21:34:44 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB8-00000008Sj3-1bWY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so19211666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231065; x=1744835865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=xtUpdM4dqH++/Gi3Fhqk8v2L22uTYcXgX79tzV4KdcEXORXtsZwRGvFxKIZyAKZ7/Y
         JJsRgZfMOgTWwjHkAFcy8/CtaBqIKcdv2HwQaimyPMrSAUJgUPQkqdusxQny+Wn29kxw
         SzrjWfhN0mC3OFp1+6L1FCeBmCakLuMnFp4B43bqCXbR9enIQicpqP4Vwahoo+vHRn3c
         GUYXgD65zVWMh/KW0vvY6L5M03vmXIFo2+7GTifqG7QB0WKbc1ajFFroUfIxw+sfbd7f
         VxbW6kGyXZjBGo1n18uNZ7Zh9Jupw2Jm7CmelAmyEOrN4OiYqZPEK84g7xlhSOK9YslX
         QrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231065; x=1744835865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=FpiESyuHpwnvxTzBVNeXNZaNzAxUyXnCfSUyZcAaVHWagy3965GDF70N/EtKoCfq4S
         Jde/CIH1apazSSPBrFVP1vbQbRVLSNdgXZ/1EvgvyAAxh9MhrIx0zZU4n9An/lf9WmNg
         ReVHDdXyxNG8pc5J3Zr5N6ffNgII1q+pvToiJpPsoLgp38NgLeWqh4EBWWhZ7hv/NipL
         od9ijOosl291OTxd6S3moMivSbY0jPIWwf7wby3iTp9tYGgdMLaPRjkv17Lo82Wb5bCk
         /p5JXuvdLFiOTC6ipi6F+Kt/Eqw5hV6eq3+18Hd6PB/sb1wzFrIYeATT2FGQCk899Tkq
         ee4g==
X-Forwarded-Encrypted: i=1; AJvYcCXUz1+YYH091UP5JA21kFVIkVTdfScz/39AE4TAgGyslsyAiiN6QwelyN3WvABtLyXTCeJn8WFCa6zhdQa7E21N@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo4ZWAGfA5n/QZ9DEzSAFeU3ljRV8sg7Cn1YLJypryQnGk+xbp
	2g3ZWZDfJ+RVwXIuURTzRvBfIBh2DF9kR+Dht8+tk9EkIlvW8hAkNBWR50OJq+o=
X-Gm-Gg: ASbGncvzKxay7oD2Fe+jgzBLTHoqH6w+mDSvXaUvaKn0pMer6THen8H2hr4ismH6Yg0
	DHaB0dfbgjtCdkhizR6ms0RODctVBHXgmqPFb9Y5C7FNY/Wi4gq8hJYiwwT+GGgPFJqv/uEU9A0
	43aqSFopfPJkt4ppTRCdaUhcgwPaOrrKE/C86i2/6kdpdSQoV4x5P5dPK5N+nSQvXSW5wXcVNtm
	jTcZ+Qq2wUZBVMjRNl6bjiX+VbzNuYfMxz6/IXks0TFN3b9FoYAAeq2aZvw0GuWMBUqwlXIsp2z
	f+d4HSYf04+X3XOEA3EjRnSm3+UtZEq8tJH56jqKIqfN89sOuy4H2hdzW/tiM6N2GYem6KQxsg1
	vvKOl+YrnZ5X8ShePKwth17dcHRA=
X-Google-Smtp-Source: AGHT+IEdkkXow6n79ZWPbZRhN5XFCjydXvQNxgGlSC/PrHUaOACC0tp9PiBCaVoIN+0xJ5YXvd/Wlg==
X-Received: by 2002:a17:907:3e0f:b0:ac7:391a:e159 with SMTP id a640c23a62f3a-acabd4d8449mr5988466b.60.1744231065076;
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:51 +0100
Subject: [PATCH v4 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-30-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133746_456142_5D50B381 
X-CRM114-Status: GOOD (  12.62  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f4caed953efdd23fd0132d74d5199dec9cdfd294..27115523b8c25794a9f3ac8e734bb1ed998e9518 100644
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
2.49.0.604.gff1f9ca942-goog


