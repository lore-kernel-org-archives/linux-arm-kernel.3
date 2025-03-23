Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CECC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=; b=pZy1lSrd9KV+NlTpGKAVvmALdH
	zUbjEOcfSYXQafYqkU1aW/LmoVxqIn9B+E9YLV4M/HB/deYoka6c+3daTooCbDPUDPvd6jqD0NrdJ
	g7iJmoKawLbwFMUxdCf0Dh9mgvPKJZTeKGBtNceIsNmQAA1evo+thuUlnYzMWlTaKebEHILaEKfCz
	UAi0UdcsYUE2pHJE/idZtRR3qWJyNxGADeysCQFrTSIkGJphR8boeuzapyhrsKE0MceLHquliFEvp
	Zk3I+xDkVzUuLTqygTAsyxtADCbNcJs7xh/UAhglJ8BFV1RtT0lOvX1SEa3+6SGrD11xtseHi/Han
	M0gE395w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUmx-00000001uaG-3TKx;
	Sun, 23 Mar 2025 23:31:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyp-00000001pDh-2Bh3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso588949666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769582; x=1743374382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=;
        b=zO8zi5Hv1wQEGq32bLm3V8qj0BqcZLCoQt4ra9fNO621hni8aA6Fl/LeeSTGMo/Aw/
         A60uIi0rj1YkzoGCoMuvC08lIDzz9XSaYBZmi/SbtDOTzyi53i6gwul35WybDZFHZkGj
         DSqKXtXbI04VIJ0bodiUeNYzQAYik1Hm3lpavUKXyzcvTgyyemHjS79bOSn5PmskjRqN
         60XXtXwgwrCNXlSTO1eutojVBFtF4l3UlK4X5mSBs3abW3KHz11pX2uX7jxxwCsWb+X7
         P2w0io7NbkCZaQdt8hzs8DsBOstCecfjoNbuMSIiaSVnhMzOejog63EjtqoyQUEENuuZ
         NZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769582; x=1743374382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=;
        b=W3UmOY8aWC/LyJQ3MB2x2XsmBlMv0pB6Gm6COk62zaNLbnUaRUQqAsV5X2m04Y6o/j
         cqJKi9OvfJlJXH/LflubZnDRZoDpN/qEaPuQtJCHlCz5TO1SV398U8mfSLaHq7OuIq22
         UBUM9C0xZsBHVEtdkvMJdkQ26EqUBWfAbELo4tzlX0dpSOShUttw5QqMJrWjiqvSpraQ
         SjRhu4HghRzSzXj4u+aaGXvPUczRc7U22+aVeYml+yrn0Np8hK9ArCBkqcSztYnluPQd
         6lpRpN0qtuLX6Y33erHuO7qlkyzZx9D0wvb5qO6Osi15OByYX8h7kwxlWs1LZzmPdbnJ
         ZRtw==
X-Forwarded-Encrypted: i=1; AJvYcCU++V6hSHlkyBwJGRTD2hyYiP86kHfnYputiWBbUlATjPl8M+k3G+305Nh6K/8sg4iMRXG6unieNkfa2RnCgR2i@lists.infradead.org
X-Gm-Message-State: AOJu0YzAlZfoE42Yfv/rsFaCEEoZp2pUqq0SMPLJvKnT2YRx2ULF0oUB
	/16ZB/tTadFUmijz0aOhvTEuszxZ+TJTm2CyTn+oK+65CkvuPYX4XRcpGcwEQ3w=
X-Gm-Gg: ASbGnctsy9O+mwlesi3RmW6gjeRGwmOkcQJhjhZ03rH4auTfp11fJg4BYOINCq+Jd4n
	5GNPviW1TzEgSx+8vYwL6lOYapg/aO4tXP1RzFSxJy8p6NuwTCs70Vq/oos6i092VinSYfHiO95
	77smvmKnBKP0fdyOlr7qJc1Pi8clNxNIHeJg7JeUdnAXbHLzvNwYU4h07vMvHo5DzZ10QTqsB4d
	g1JfdRyKLeOtc5KOWZQwZ5Tnc5ZvL/50NWIWPQQ4jB8WSDGK7fTV1jalAbrKEFUhzPkqdzwL6Hq
	/EyAlqPAvR+E8uzfDa19PkiuDjQAo0NPHUWDVuIBNHb/RNyDAr4o6yRtbKvl1T4eRpRuPaEGSnM
	tq7BKDYfYNJzN2MCJnlBRUUnNqGeR
X-Google-Smtp-Source: AGHT+IG4c/ltmFn+ZYM2U03LWJ2WSMibTI8JvVco3lTM01jqnuwgY40zG7FK43Yn/mRbbubKlLsYtw==
X-Received: by 2002:a17:907:c1c:b0:ac3:422a:76dc with SMTP id a640c23a62f3a-ac3f22b52f7mr1161510866b.34.1742769581788;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:47 +0000
Subject: [PATCH 31/34] rtc: s5m: switch to devm_device_init_wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-31-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153943_578448_EF373111 
X-CRM114-Status: GOOD (  11.92  )
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7b00e65bdd9c25b3426f92355f8ea36e66c3939f..e8e442c503064eb4e570af5bf7dcff6bfa7f4656 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.395.g12beb8f557-goog


