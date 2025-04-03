Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4CEC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=; b=KsgFA91od9VZoaUxQSb2c/0WfD
	+6U/gZXQUxBu4SHF/cT/+NL0Pk92Cof4nipsKbBylsIO/IE7GOVqpLtoy3tp0LkgYQgKKyQ2zX7Hl
	MsTCacbevMrxhOuLyfqVYaN5K2hRvSLbDJ+PBERB6IUGXw1jLhbBYTESNhDgs/qYT9MQvmQ9PeUPB
	zpaTe3oNQfZF3IP+QMpJDW2hsHrbhtxo0xSQVYwKrhbEXCaG50UcP1ktmCqJ6NEx+ByWsLuSQvFSR
	utuy9aDzMh3NabmwKqRyXMEAwkM9rTqF/9h3iS/wtiRZQi7BAuE2PLpioBtmvjHpbnVmtkU0uZAiF
	s5AFM+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HFY-00000008Sel-2VP2;
	Thu, 03 Apr 2025 09:52:40 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPv-00000008JqK-2qyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so1168075a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670758; x=1744275558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=udWu9GC0Dn/ldfQ7pQzVeg5y6NzhpSlvhzvsbtTsZg9x9qn3LuAPPzzruRwbiYruK4
         t+ZH3YyokVDUVvHUhGNSUcNeShKhdQQHF3tVQ1O/pQGvpp/Qc2BPAzGxebM9W9WgakbU
         CpDLakVF2Put16J4xmNg1e8eVuiX2jKO0gmYB82z1YGogC5JUgqeL24sf/ET1fcAmzNF
         ZCO94YSRIp5W3e/yZ+McSwhN1Yz7qPORbuDNMvWsr0CD3lRwPLSG8VQX5iHhjIu/2fML
         y6uBwqoFlAPYNSVyUndNLLIf0wRiVoFXZxZGqaQjESBQmOslKgzdpK6Tck+KfybL6C7o
         0VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670758; x=1744275558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=d4uYC24swnuSBHcphpZQAYNFnur4Gzgx2p6mdCgdmNGPkbUvRIn+PItPanUtl+xAY/
         Sd/AvFTNIJraOpg3ktKHMWYALYQU86B1oqZTHR0gPcLpWssF8jrc06dUS0drdnTkhf/H
         J2fJ9Gl8c9YtW/O/axkV1ZJ/263qbIG/TDRUc2dWgjBwsmLTph5AvT6yuQlWvfW94DIn
         Bf1ltyV4kYmMdmVUa4U2ci32iNt3Zqdj0TKeDWIvHCha6nwRlKMFgFjNEUPDGbxjJ7XJ
         H/Mg5yBqbmq9+9tvSpWDu+xVjPp2hwtipocDV14tqsLwnB5z4kuiecYUz2XSiYhudbJE
         5XRA==
X-Forwarded-Encrypted: i=1; AJvYcCXZyjnx/5uWyD4y/HtdPi+FfA+jt4dmPiS0geQ4wIGjjV7nECEVEN4kHpK6Q4W1qMpuYtLZKEi9GIFC5mq0L2JP@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZhjFYfLhinbbo5bcJvsbQXj5usXVMjSMSe5L34fi3HbpG2jX
	BqL8y3Ky/Ychq/V8tXxG/3nD6q24rAT+CL8EGEdq1Z5pz1fQygcl/NHcjqRjD2g=
X-Gm-Gg: ASbGncsiVGG9HJDsoiduIsYf5NDud46Zjw2aVO0RAPBiJAvwdoPV+Ew0icfu4rM55td
	9fJL1T/F4WZ5qDVwcwybkBaN8wwDzDYeGGPUMpXP5GJywy86UBvY3yDiFVT3WQNebmBym8C3V+a
	bBb0yJvl6/orx7i6KBZv9+qyPhmawLs98UID0zh2ii3I3KQwU4CHiB5UF/WIwWEikgNNCOLnTlF
	K7+xmt9XO40DBEHu8lpdUDcAvP3H1h21gxuINyBgw3SUtusf4Mm4tNueb/XNpQNQ52SSh53dPN1
	u7jt8/zbANRp1AKpNG4gSfrj71gx816zt1RgH9thohTDiNE7l6N7hRDqsC4REsKgoUUAD7CT72o
	kWzzLi5WdpxkpAlfs1sKwsJEN78nn
X-Google-Smtp-Source: AGHT+IFEc5fuLq8ADhguEhOTmTcH3HLdnlMJdU+ak+pq0TlS6iw1Do8PDAk7ua5/zSdVwdumNPkJLg==
X-Received: by 2002:a05:6402:40c6:b0:5ec:f769:db07 with SMTP id 4fb4d7f45d1cf-5edfde2199fmr15498579a12.29.1743670758300;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:22 +0100
Subject: [PATCH v3 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-30-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015919_730819_ABE098D0 
X-CRM114-Status: GOOD (  12.81  )
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


