Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF05C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=; b=qJqQharCemVbAPA/rjQilibr0E
	crLBCb0ovvcrbUxqpWD9Li7dfCIrhNfYkoQq8auPr+xvpiCDCKdSk4M+RW0oe9ZqNGM+3ILtgWJzx
	PpK7bzpYi6NRU9DWGBCY33wjC2q1DOijwDmO3TfBO3blNWQp2tl5+e6U1JkXiXTy7SLFOKo6dVKRw
	POXMkTcJQ1BhF36rK9Jd417IkxKYjErPjyJwpWjfr6PLsVGHbo8ahRHbgPMJ9wzx8r80sv6aw37ZP
	fOTgytfhjMT1rke0MxeAxp0iTTeFw4H/Xcf2XgZa3YVcpKXV1WjoedipnhTlmtrqU8/9JkV615j8h
	YRyQqSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvlz-00000005qpR-0fbn;
	Wed, 02 Apr 2025 10:56:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvgq-00000005qJZ-1rTq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:51:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so2001131f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591083; x=1744195883; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=;
        b=gM0Ep1vuamHFhhaWX8RbFnEIFmRX53rNxPS/7R9hF+k/KKy1clWrL7HdBc3zHXx7kC
         C9eR9yRNUFVUiY2fkA+rER22r1+8d+jmImFSXskMoJnxa5qOYXVP5dTN06teId1nhAXb
         kCyY5MWAEGHQZ2FWUKGlipKc+HjTytPKXUt9DYwZwygf1iqyHVnVyTHQAht0xNWRP6JT
         hyeDk2ywYU1dq90JtmPeHfylZ2UO4/IpA8Q1bgR/WIzZPIQWPd2KdvW9kmkBJ7TsEENn
         sKwxrEzwA3r9uTFneF9ym01HdDC+w18Uofdsy0vYZOPYLlbgTNqBykr9jsGAMzmjcYWY
         7t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591083; x=1744195883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=;
        b=LAed1lA0cZYCOWWjueLDBPpTjiE+zDeNdNuJ75B9tRG+MYP3TVrW4bQ8YKGQ1jZaHh
         Mb5SJo3QR5qQDytbjaUce7EEF4ixm0Hc2mgNJDMT4DsDZgS8LwYuUBVSgTABXvKfLt06
         FI+Sv7oTlDe6EZAnvDliSIOPb6iS0d+AusO1UL7jgvzXahwjzTpeJK4CwZ6Rwc8FEaBM
         F1P7xk9+22Wdga3GfZewHSmvGIQs/uo63MfFyvp2aS2g1DaTkbVT9Ta5qIZexfE1/HaX
         K0QPdSvyNTnbUNgftRbeqZ9Cc5N1MRYQlcW46PBY6bVbZWcChaPhSEOaq6Gc7rWIFaPn
         FDpg==
X-Gm-Message-State: AOJu0YxeBTk7vZpMTW7gJ+lWJ/WFPTcrBzRl7mJPm+WAPc7EWbGGJ9lp
	HLASu2r02H/b0m3WWAsMCopu6UHDF/L78j1/gfGkbdutSq+I68CR8sBLdUHQjXU=
X-Gm-Gg: ASbGncvlZQWj5uXIyTqtvotglo+y38T6KlH6PfLv7tRN03FVAiKmODtxTzjcQZ8SQbo
	US51BVkQQJEnsJ1n8Zg3BzY3TzSMtZ+4rqAoJ5cQw/OWxbb94Gxgogpm4uX/9+WEe8pm737rVoc
	EYnmb5zsWHCUjAGUkNwJM2kAkbGLsJfz/fmjzatwwsUynydea88ZUOeHs4OzPVrjS4XvxxthAOw
	Ql0DJk2aC0DIH+79JEq+vCIid6yxcgp85n4IZ0ViYDduk1/Oe6InBaNc3qKP1n6xmNbrEIl7sm3
	PJwldLaxReXKkrq7d3gjTgbJ8eXCBKtoBoI2irrmFRBX1+ua
X-Google-Smtp-Source: AGHT+IHOeyatznfz5QQNNvi0Wvd10HZ133vP0ZyLTaBfjufR3sET+MdtTaPLpYSIiYEYd4aCYgoPOw==
X-Received: by 2002:a05:6000:2913:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-39c1211fed8mr12507155f8f.55.1743591082782;
        Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Apr 2025 12:51:00 +0200
Subject: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UlOHaAsiVzggi6F3jr2SNdC4VdtkMhUHdURJ6+cg8Ac=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7Rak9MG2ZQ9wzFG+COaaFPM1OY7zFQL8XoFY8klb
 RxD+gCmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHURdTBD/
 9kUNtbI+e7So11TmUK3hsKh9djqbup6vkAx8Pq68W4fj/BeAMNMd7T9IP5jFDOwwx4PykLAxN6JV6k
 WDxPv/TQp27p8s4T3Bt+Ofre6hh+YAC1yYvJeNx+8cY5xGEQlSj7eIU5yOYz//M83I6OKVJXNPM+He
 AC/z0hj9Gx6AT3DGH3xCNHZKLPY97mqcg7cOxK24/ZszybgGmHBxG7HID+XO+QonhUBRRt9OeSmz31
 CZuMipCh20FBQcLYz3n+JFMEQMbaCOkWXSaiBtziSjBXM9CV7l2KKSkkGL26T8RE77rMh+bf+VCcI8
 SVoEB8xItBDQK1HJmd8DwjjK+UqV9EK0VLm1uwtDOH+IWZmzYXKcXexfPLHc9oHcjLxebstsfM7etp
 qS9Byx0psLWQbS2cgGDhD3EaTF074h5uHg4CyTA24CYE7E5AfxeaPB1eLgyeVsXTZf+DuJPEzowVw9
 cZj4Y0zmqEPte46Vbq+2ELMEDZYpDL4yNSVHVYJjoMB9nPvdCPfKIUFxTiDQmR0tl8z6NyZq3Ozz4d
 m8EV1ehPtjgAPlX4gwTN0RolroIOhAFs9mfYsYxzPO3kYn4kMZTSX6HwJIlQXrsz/0Rjm5zppB0a1q
 +701CD3lM+r7hRswQPjXMMpuzB7mmerc7tQgEGAiydtikIs0A46CFJ9mgv5g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_035124_508748_8EC90E18 
X-CRM114-Status: GOOD (  17.08  )
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

The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
despite reading correctly through sysfs. There is high chance for other
platform to be impacted by the year offset handling issue.

The hardware RTC registers store years relative to 1968, but the driver
wasn't consistently applying the offset when converting between
hardware and Linux time representation.

This inconsistency caused alarm rollover failures during device
registration, with the error "alarm rollover not handled -22" in the
logs, causing hwclock commands to fail.

The ioctl interface used by the hwclock command requires proper time
range validation that wasn't happening with the inconsistent year
offsets.

Fixes the issue by applying the year offset in all operations:
   - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
   - Subtracting the same offset when writing to hardware
   - Using the same logic for both regular time and alarm operations

With these changes, the hwclock command works correctly and time
values are consistently handled across all interfaces.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b2..ba52e225dc8fa 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_mday = data[RTC_OFFSET_DOM];
 	tm->tm_wday = data[RTC_OFFSET_DOW];
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
-	tm->tm_year = data[RTC_OFFSET_YEAR];
+	/* The RTC registers store years since 1968 (hardware's base year) */
+	tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);
 
 	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
 exit:
@@ -119,7 +120,8 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	data[RTC_OFFSET_DOM] = tm->tm_mday;
 	data[RTC_OFFSET_DOW] = tm->tm_wday;
 	data[RTC_OFFSET_MTH] = tm->tm_mon;
-	data[RTC_OFFSET_YEAR] = tm->tm_year;
+	/* Convert from tm_year (years since 1900) to RTC register format (years since 1968) */
+	data[RTC_OFFSET_YEAR] = tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR);
 
 	mutex_lock(&rtc->lock);
 	ret = regmap_bulk_write(rtc->regmap, rtc->addr_base + RTC_TC_SEC,
@@ -165,8 +167,8 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
 	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
-	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
-
+	/* Apply the same offset conversion for alarm read */
+	tm->tm_year = (data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK) + (RTC_MIN_YEAR - RTC_BASE_YEAR);
 	tm->tm_mon--;
 
 	return 0;
@@ -200,8 +202,9 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 				(tm->tm_mday & RTC_AL_DOM_MASK));
 	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
 				(tm->tm_mon & RTC_AL_MTH_MASK));
+	/* Convert alarm year using the same offset as in read/write time */
 	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
-				(tm->tm_year & RTC_AL_YEA_MASK));
+				((tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR)) & RTC_AL_YEA_MASK));
 
 	if (alm->enabled) {
 		ret = regmap_bulk_write(rtc->regmap,

-- 
2.25.1


