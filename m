Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F2C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=; b=L6zp3kQAbG2N8TbfZbzwQj8150
	phJkO+oPpcmWmizz5rezE8JZtD4HrZSl8LlBIIynV1d8SJe+aG9/w3w+JetFgZIgDvZTHPd1jIDFl
	bF4KSpmkoTK2WfBbEGDjPBjuP8amEPAXAYHzacAEhZW9V38rrPyGFl6hlJjZUPN+sIMTy8sAkKwUB
	VllqyGKF0av8npxiuFBamyGuXdvCoZo3pANomtFJnx+JpIfkLmsUtwhKheu+vXD0/27E1B/SRsqdt
	OTktcJiNLdjKVfCMDM/qwk7VfSltR/vqKiTU/vjd0HqZuvsYkeUYbA2Fm2+0ZHNoWZS5pwd7q5ZoW
	3y11GRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HDp-00000008SNr-3pX9;
	Thu, 03 Apr 2025 09:50:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPv-00000008JqD-1s6o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:20 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so946821a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670758; x=1744275558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=JPL7mYxQ2e9XgLk58HKZIzz1Bz+NmQ+kn1jQRQocEni0ugdrV495MaLbzJmfqsHs8B
         LNsirQRiif1GodbaLM3gzrKuak1VnuyBQ22C8oypXioMDudBjr3w/X18I9kB8zmatn0v
         OpddEVIVgBXecir1/c/nxUmxmpp/J23iPQIe+qKTFCyJhQ9y8mdHG2HYhibC/cQbAx+d
         Syh8qvqmzPZffaqUutfY3Dj8qS8S342uuAmcHb3BjbydxP0RV5s7LED3tYnxcVF2n+Xb
         ZoWOXiOXmebQanNcg4E7UzMUseI11TkCW06VhwLoNaOlJVPzxYOnWMZS2xgTjLietAQz
         hoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670758; x=1744275558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=hAuupzUcAFouwH2xbtU5Uy/3StVA2NBEv/afnm1PwSLM8eSss3zvemIzRK3MBTMY49
         BPDKVqBi4OGc7dT3sNjeV1s9DFJsXnMZaBEGWlKUBQ0P8gW2bGSoT2D7PnV3zz6JXEsX
         Bf7urpOORainAZOX2QY72A1sDfodC/46UBOu+ozPjU9+w8vGbY1kKCkzRj6KTpZqLEbr
         /I+gFYNNp6bqfj9RRe7wtWLNJZ2LMss+G853ta8LhxeuRR4eYMD7s1epm+wTyCFZqT57
         AbU2QiFCBXsua3SVoXBG55CkfqBKLvxsY8yeh+A5s4ZfQiM4ZcHUXUFkxeBkEG9P9e4S
         UJLw==
X-Forwarded-Encrypted: i=1; AJvYcCXBEFoiQ6jldT3mvkFMJTuPRdswcQCSq9hrT9JJy6sct5f1Js7NJ+IJ291RRZH1UTcVtgQSsCMC1GG5b9fqIE4w@lists.infradead.org
X-Gm-Message-State: AOJu0Yye+RJ/A/2/FdjpukI0JgTo8+DZha9+v/VrunZ6gZ7AcfWtA9Zp
	zgOZ5nDEjV6niq4awr96ZTOpQu6haQLB3YhYoWp4r2NcZsJ/TJSfVkYbIBwawho=
X-Gm-Gg: ASbGnctBITLm/8kZmz85cfQAPLgeEYVkStdrcLztU2sl6HRqOW3IBmIiZ2mxqPy8EAc
	Sz+pq2ZwH/5jo5hhbyM9uFR57BcK4xG8wLd1jtPFPw09tR0i2jp5xf9oTotFcL0X07IV/sat9iV
	EEKJuliwt8SLHc+8eoLjsdltPMQj+mWh1Wjwk4MvjqzAvg+GS26NqGxzFtFzMMaTC0rUDD7GT7T
	gcqKqlFH/3KquoHfjaCzEofFXZIewWrOXNRadCchJt3ewV1In67Hq48WAHCFvD0lbOwZwvo3d+G
	QNgWN0XvkHlNzGbmLN/lfVgBWt7knUkw6cH2Cs/lyc96dTNuf6ba1g7IPvrNfJgc6WNXMD7EL+u
	DrayZi+JBfeUL19VIG4e0vrqFeQRLgJ7WDkdAIJE=
X-Google-Smtp-Source: AGHT+IGkYnX6rQ6GWjWnABJsBjhI2LJzWv6z53In1ISOpBusxw5cuCX0wciz6W5/efFFB3SIsEOq4g==
X-Received: by 2002:a17:907:d25:b0:abf:4708:8644 with SMTP id a640c23a62f3a-ac738bbebedmr1751267266b.43.1743670757782;
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:21 +0100
Subject: [PATCH v3 29/32] rtc: s5m: switch to devm_device_init_wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-29-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015919_504670_EEC97121 
X-CRM114-Status: GOOD (  12.43  )
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
2.49.0.472.ge94155a9ec-goog


