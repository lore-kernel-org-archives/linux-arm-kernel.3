Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C3DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NTbOy29uVlcjxenqUAe8YQxe9aRTQQhc7UehxU14MvM=; b=NtGbgeSk9Gv+TEb4tv/eNg34uz
	sEmWht80kq196+hjJRTLycOSzGZk8g7quRp+C6AiKbQ5FK57iYk8d1NOP5423qj8fstKMy4khV3m6
	wbhXG6OH2ct6sEUNLOAf38EisrYVOi67d/f2yvBwCfzXAHOgPNZ96iegRep71pYcpZV2uhdOiWv+B
	jx0myfUdYdPOj9k6WGW58CoGUM1OFMAZ/UndthC1RwdhPKn/YpytpCxChweZWUwyr/4uB+fXWFha3
	PE9T5LgI+Gp/8N4W0LBV8r/nCrHcB1RIEyzgNwfqJrrpiYIjLHA0Q7pVevrcErHzczSICce6RwnSz
	Db6ERgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qv6-00000000wgC-1Hsr;
	Wed, 24 Sep 2025 14:56:36 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qv3-00000000wdV-3q3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:56:35 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b550a522a49so6053285a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725793; x=1759330593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTbOy29uVlcjxenqUAe8YQxe9aRTQQhc7UehxU14MvM=;
        b=HzpThOorPiqF5HwTheWAN8XBFKtmw18/h9q/zouhGjNzgKc43lfBIEuptpLkPoYwjG
         5hwgGg/TXaFvFnrY9TFTom93KBgGb0mdf4EpjBRubAvk9iaCUv730NX3C+0gPfT6i25Q
         8xf2E+s0n65jxrhaAaIE3r+/7ZM2u29HyA5o0ee7Y73F7RwB5Oaakogji8UGjwHqevNR
         oJAEuHrEhU1i0rEd12vrgdfWam1ba0HY7VhLw+iqHLUWBNt5+TSM7Q1Z2T697SUePK+c
         FenjPdKgBc8yysuhrCRXWFpz1QE4IP2n808gaqCuUkDoFoNcO3jCN9pvfZeMV/tWQNUP
         lQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725793; x=1759330593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTbOy29uVlcjxenqUAe8YQxe9aRTQQhc7UehxU14MvM=;
        b=LERrov1m6Fp4uOqNixXefZdSt0P63QaI5g2K1ernQ9UBs5pxqvk/TPqmoscquBmyxP
         3krVDio4umNSytzFO81RZ71VhzuYcG7AZ1EkEWE4Vjmu+Zib8A1ykGhafXoRLw1rAf3A
         ZXOYMnLEAsmQqdGfOoJsKIEe52pZYBcHhfLjY0cNWshy3HPqJ92C5vPillGV5uixuiY0
         XBFB+xTTIBSzpP8b0+RNiAHclehcAAtIEGoh9UHvvVy+bO8Fv1K2iVYmWyfwd0OuLZu7
         UiFKInJTULu08NPtcgujrrzyfeo55O+wYFc4A1WdUfeREKWkrgZxJCEmUrT/tdF3BXNM
         k7Og==
X-Forwarded-Encrypted: i=1; AJvYcCV86fgSu3Adlon9vPTtm/PG1E8ZaNRConO9YQv70HN3Bz6nlxmOonajsKjv4l8mxZDOu2tOw/78I83otgVus39F@lists.infradead.org
X-Gm-Message-State: AOJu0YyTGwqS2zQDpXOBuyI7a+YRe3k6EhsbpPja03rdokEQSVXCtWnb
	tr8BQSjcGHcY8hY7yYc8uikd1vdHK3VwPt19FQMjyJ+GLZwlZmahuddC
X-Gm-Gg: ASbGnct9ZntctNc06Jhwhbg7XPN7L8NXUizZeUSi2eY4MjOrvqc1738LjzonF8Pdiir
	Y0MArTlLQlA9q5Ii92tNitCnhGU+7DKejp7//tGlYgaw+pUnv+NATtrzurBGfb7mqd15gJJM1a/
	xD3yDPrylSINwY/hCZBNyC5O5SnqE8uwDiWtzvlqFV+mk8m3weIFSRvypslOzUBI7L2HolgiW/b
	KP2/lbTlLVJ4wYsv30LybOyW+wsGi9ubg2p3p1/eUn+GW5x4lOrVaCj99m+hLs7r/DHVRZMG/sJ
	Q8RECxD9XU9E8sa3VhuBpMmZzaoYQjdSnIcsRd9mXbTI6VxXEnCAtuptf1znfT0apNG4Nrtt6Wf
	vC5AN88TiplVP2Iwqyq3DaAN7omryJH5kwfxCLfdmRQ/iYw+P0siZyMOGEV8=
X-Google-Smtp-Source: AGHT+IHUOeFU4kluRlGJm8/v8V8Ejgu0uLYlYSI6Xmc4VXSt/m1ELVH4qAcTGAn/spP/GfmPawzFYw==
X-Received: by 2002:a17:903:b43:b0:267:776b:a31a with SMTP id d9443c01a7336-27ed4a3de4emr65295ad.29.1758725792827;
        Wed, 24 Sep 2025 07:56:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f31:8167:35e6:be:ecb1:9216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de963sm190509975ad.77.2025.09.24.07.56.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Sep 2025 07:56:32 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of kmalloc()
Date: Wed, 24 Sep 2025 20:25:53 +0530
Message-Id: <20250924145552.55058-1-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075633_951012_8ADE9569 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
API, for cases with dynamic size calculations inside kmalloc().

Resend is to correct previously sent patches mailing address.

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ffab32b047a0..0c0a746a183d 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!sam9x7_pmc)
 		return;
 
-	clk_mux_buffer = kmalloc(sizeof(void *) *
-				 (ARRAY_SIZE(sam9x7_gck)),
-				 GFP_KERNEL);
+	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
+					sizeof(void *),
+					GFP_KERNEL);
 	if (!clk_mux_buffer)
 		goto err_free;
 
-- 
2.39.5 (Apple Git-154)


