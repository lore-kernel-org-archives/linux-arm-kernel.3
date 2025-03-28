Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A3FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=; b=JgSX1+6jfJZI1D3R/z1PvKqYNo
	EI3mR4EOyDS1ad79nhuORY2d5CIdJ2KKJEioPgtVT7u3vQRq8LgGlVxS0VvAlQBLDTYw7Tr1QIr5W
	+CuljAIi8r83kRBuemu1imwYGHELkTU9TvZx8ns0Hc4uD/NwgAzhYfLjoZtIgueQ+AvOzljd/W7Aa
	1etUEUhR/Xa/c7vEtdV6gg243SRDWY9zyS0Y+j1Vy6GKHkcy3yZuSgwru7Y0u/nk4bBrDsFNQyFo3
	NL/kvggfnhVVXww0MmnhL5CFZK04hmGZzej1Zye6Sln/cXtAJtz2wYatvu4H9WGTcCQJnx0chxlXe
	wJtqlUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAcv-0000000DaPv-2WsV;
	Fri, 28 Mar 2025 14:24:05 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nj-0000000DQnI-0LPi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2961486a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168670; x=1743773470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=dg8kgeICH5/cF98hsqkZjVOjqk98WbJGxu9dLwnyYoq8pXWsXbsy12uFm165a9TSjy
         tRTI2KNxGkVARpDTzrJ+JxHMhPvNAnS1EyM9CKs2/NfhIndA6dIgUspRNpHvzfSbEGxI
         rPVwN0NQypdrFWkx9CA/YIZG2SRXBkcaqfYRjWqyfffkZZucq/D/cpWSNT5Wf+KT/zPX
         AFDd8+OsVIejpgNri03sJv9onaZnBvazg67xOlQsop4hIHs5v8Ya++yyZliNXIH0sKXk
         qL+YLPG20EWxTEFtCIVCVDLCszXBavkYZXvLJC6O08rNO2kAgtHLwhrGxQdKzL0TTpXg
         bBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168670; x=1743773470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=HfNUzErMjQ/60LVNf4H1BdIMpXPHEnoWPyrNhZIO7UEAXlFMfb7ELyPXffMojHkEkN
         SA56HPSX9Ojlbd3L076Ag7a1PgE/vkjN+3VGmeswl+mLFMwymAxMS5qLw+i81huOUP/Q
         +CzBWy2u9ACrWaKUTWK70iLfsy9esT85c0lmGR7bTsHaGq/YtynAPE01F41/DoT7NbIQ
         2PlwZ1KretTAU939mZcJ4+9DLJ1VawSH9u5Q9nVHDuTO8CzPWE9kAnCZCVzG4fRAWxCY
         K7wl+0eDudrYKdF6Oa7DyZw9PL2s3LmvTTme+XDE8y9HvnavwlepgGI3oYw6luX22G9n
         JQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5OBugO8BQ/r038WZSB9iNIiFXT8RtrGR7h280KcqkyUeb6yqRL8cXpjFCuyKqM9OxU9QO5uoWAaIvQrvWm68n@lists.infradead.org
X-Gm-Message-State: AOJu0YzF9LUJKX2g4nqKzAPX2vBo6baw80Gds0/qa/nVhsAU5+Dn0FBk
	2uzcJCjTJuAM1GrdW7i1cui9Ke52i2W831ADhPvCQlbrdZ2PqT+Js3qpxQvH1nY=
X-Gm-Gg: ASbGncuTTFoAF+cJltToCABWnhl45QdsOB1V6etnRCwQvl7AxREJ5hqisMONaljd7ph
	f7UeOk/feTZ1MX9LhEx6hhLknID3NklA0SuNqyO7WMAjd70jd9JPow+I7Mel45eGrNGqfZR8JQy
	pIN9YZUfOSMt1fmD7tmstHRNrT1IWpbK05RyNJfMU3WgfK27SyVBmjp1zxO57SFBAfRv2guIhLs
	++HvS5iNqTUgRl1LP5qWscaEq077x2sDvalAqUpxCeUJfCCcNUitVeq9WXsoSQKQdRUcQCeO/NA
	IzB1vuujZpx1oCddF1UIIuIVHgcTXK+0HG/NsGii/h9fQiZUATpIwBJxdCw+G2PZYRCS0a364Un
	hiW+rOHBFDITNPDcmdK+RUuXkXJ2t
X-Google-Smtp-Source: AGHT+IH4AkvKS9gIeAEdf4WO0mRjBtbxCllwxmJHe2U/y4p8yWBXxd7byUvVNmfoRgEJ54AQL4uegA==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5ed8e388e5emr8163708a12.11.1743168669663;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:15 +0000
Subject: [PATCH v2 29/32] rtc: s5m: switch to devm_device_init_wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-29-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063111_120228_9CFB5E5C 
X-CRM114-Status: GOOD (  12.33  )
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


