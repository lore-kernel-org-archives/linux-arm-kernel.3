Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ECECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bB4z51LIflJklurj0g7UdBUTO3OdObbc/NJxwgKEh/c=; b=ZpKvdU2484C9Zpt9wPqSNqpwAS
	S/aDnwsZDETkLiN8zzB2cnwe0jW6Bd1oyKq4rG+MglELDyxWwpmh24bV4TTFLFhtO3+qqxo/bhPZ/
	IJudb6I0TBIxkfs3ZMbS4pJmGzIF1uewqJGfrrI9uV3r6/XJz7GGdDkxXvTLFAcjIS48s9FmXrn/1
	/ZxZX5E32XrDh5/Dr4S/N4+OQ+DKTfOOCM0dN4DJYMEysmKzudHaVVtB2w3OZsHjfLWB9JqYlc5eX
	NJRE+3keW6Jilyn9Dom77udFSGnbp6faGbbg9zML4W49aeFEoy2hzMwhydOjSdfgmATYP7FAvMaX7
	Yy1ole+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fH-0000000Fu0I-1W8Q;
	Thu, 06 Nov 2025 16:16:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fE-0000000Ftx3-0ffg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:16:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640ef45546cso203923a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445802; x=1763050602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB4z51LIflJklurj0g7UdBUTO3OdObbc/NJxwgKEh/c=;
        b=aSasU14fkqpJviz4s68ArG2azhfTpzqa/J03KFGNRKDT8rvE3acqJ8FjuSoPsx9DH1
         oh8vIRa1jwe8t/tEDun5tPl1i4eEaGtLbM/SL4ZIJ3YU81guWUhyY1zvc/fWaAOlqdkH
         OlYMpAVJtm4PC9pmXCzcteRVmjPAQ6JGpA0Ra0xVH3ucaNd8AAAOGAQCvzsMsnyOGpZ6
         Ne+oYQT+2UuFuKB1rpOHn3QuEwPUh9zTTKmJMZIHVGy0iDbPPQ4cn1EroRzTgHwkiq90
         mmURDXv/5CiDW754UiiFVaDGSsPCOqeIZVgxNm9yCUsKmgm8RDiNHp9CDg16pA5LYhhS
         cJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445802; x=1763050602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB4z51LIflJklurj0g7UdBUTO3OdObbc/NJxwgKEh/c=;
        b=lA2Fcnm51F4ueIhorg87wsAZR3d95qQW4rigyewMG5x9n4h5BXJA3xJmOHUZIUrO2j
         tfekxpN5XjRuV8gDdNE4MPk1dPGMR0dTqpW4c4AR52Tt4QBn75wLcLLPzrCOe2XrzELZ
         4MafF3ITG3B5ZOiJ3lLQ/RYkbs3KjvYdGJIZ8ypRX/T+Q9tKQrriXkfmLKBZVudtSCfN
         pkswuZeMlBg0YEfN7tcYoopP/fwcQ0bB02yIUyiZ/BIOSSZYQE5UDdLs3K+iQNTpGqat
         5AnqlMeRYPfxkRT0ZohhocnhsmNhuwJnKlsrrhL8VJQYRcomKFvT4poyUGQKk2L9p2fI
         xXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUamRnpe4Bp6aMCqt4tWCXPvwpL6K+mL0s3o3MVsVhJuLYEltuoQsfF8KLWHm3TcAJb8BIvnERck5atieIgXLCj@lists.infradead.org
X-Gm-Message-State: AOJu0YzVpslP17fxEZRBUtcW9Npb6XdNe/r1ZG5ppQi1K/AbF0w0bJ5E
	J+kIicZBW1j+bkzLR9RFBeCU7k9a3KNJLHVM6Sz7jb/vcUs5Z8TKzspA+MRZ20j6e5Q=
X-Gm-Gg: ASbGncvWgYpPHqSz2lzauhp7Ou4usePp6DCvKRjwYn2555o9CUQfxkSMGHm9GBWYlIz
	hF1sfdQ9K7VtlMl9erQFyAywV5KUjb/6l6y6u/BqFHRr0/Cv91mRCLyyMRwgKW561uHWXwUlc0P
	ogXvs8QR60T4WRJPQmJlBr+uqB3E4VMAtAxn0upgwdyKuPjpTakpvjGtnnzwOegJ0sHRT761yZ+
	C/8cegLyxCVuIIsuQde+C7k0gJZ5UpwSXHSpvqu5HDyF2rwhzsjTJkUB2byH/TDb3avAbc7h9mo
	SRIQ8ayRRt6ZE0s5vL5wi+puk5SC7D5oImuhpI+NdHY/cbFsOxjEcBXFc6QGNbE0fFxKNlRqfFA
	IhDljMdPpTiRClwgTAtyibIbZR5OxozwPe7SnOmfrc4SLONPAXYWb5SdvaqgbpT3FtT7q4kko0J
	WYF7F7G1peVoE61Gtsu+79gg7ajIk=
X-Google-Smtp-Source: AGHT+IFtC1GinaspbkQnd4wYug5IUHjv3SVNkj0rWIxppV9FyKPtYa1YcloDSaQrqrRVLMWxj8ovrQ==
X-Received: by 2002:a05:6402:26c9:b0:640:9eb3:3683 with SMTP id 4fb4d7f45d1cf-6411f615d03mr1806671a12.1.1762445802063;
        Thu, 06 Nov 2025 08:16:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:27 +0100
Subject: [PATCH 3/4] gpio: creg-snps: Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-3-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8j8xzdpWWGIQJTuLOAuFntqmfK/jylg0S/LsK5+N6+E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMngzkBYrj3JN8lP0o3ovEK2e++MYdMvcveA8
 m4ZPs0/rzmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ4AAKCRDBN2bmhouD
 1/57D/4pRWUnTW5hXv8wZdB6uRuQ55K28z8ZH3FaoCDGOnKAN61qaX0gKcjyK1QpdBM92q8dQlX
 7WOn1TtYWAGTHFqZ0FYGKUVtRg4AA40VNmIBZS0onPYiR3iUWjL91r8g+jFJRB2IsLwSt7sl1Gq
 aA8Xl3cHY3fo+3OVmd2TcZNyffc2f+8zM23RJHTHC2vO2JO7UgyiwzK+D8FukZVWziot6mdGL0s
 Z7BNjDHl8QiwXA4KWruLpwle9ZSdWVEM3zYUXEHb/UmvDvDHtyIhrW/7+ar1nPSXgWNLAys3C6p
 e8aU5fpUXAotF7tV+80nDFZe1fMdKUzUX2y2aeR3ErcwwuH+S7B5biM0GMzctAs/JaADM6JIKVA
 twdMBzL4Gw+dgCByJDc7fyqMY+vu3YtPwyla7Lw8PbtVd1OFaXAsJMEKoBb03X6xoHosdxtBR+i
 xrFfcnQBVxZi8UDPDa8gIgfK84U7Hp/6B4S47THfEkyZuJF511L1ii8URMSs1sPrFGMbCi0jKoB
 9cBGcwJqifeOyVVm/O+r2r9CSMGKdf+pXk2RVCW1CtCGEt4QyVYtucVFqw96bgGmqaJwkp2wKC5
 JdUL+O0Tk9wvaEynfCPgNCQSDSUUhm78cVRhcsmdO40bTXxVrupADbP2q/6asWxvHK/z02SPoq4
 V5KGI9l4mXh3aFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081644_222741_46CEB4C1 
X-CRM114-Status: GOOD (  13.32  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index f8ea961fa1de..cdb103b0fae3 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -134,7 +134,6 @@ static const struct of_device_id creg_gpio_ids[] = {
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct creg_gpio *hcg;
 	u32 ngpios;
@@ -148,8 +147,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(hcg->regs))
 		return PTR_ERR(hcg->regs);
 
-	match = of_match_node(creg_gpio_ids, pdev->dev.of_node);
-	hcg->layout = match->data;
+	hcg->layout = of_device_get_match_data(dev);
 	if (!hcg->layout)
 		return -EINVAL;
 

-- 
2.48.1


