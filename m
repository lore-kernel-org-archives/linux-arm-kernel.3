Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BADC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=; b=pRkGyMYVa8PnCpohTUiIYtESU3
	ishq5+IpZd5Klnn3Cnpjj8Tno6fE6W07yr6VBU9gbGUQ7LfEZvpoGed23n5UrMd2N7g90julcA1gG
	sbeHwwy/BkBiQKDn2mtwN0xLffexSXIozAqE0nPW63QV5fdWY1jbTzG3k5t0JeXKk8yw+LiuXRBgo
	zupAYxVhpEhJoh8mKArY1gxTCzLB7CLUC3sB0WzHiN1oEPBDl5J0Q5I4A86Kv63l3vAyU43wxWkjm
	DNDr7APy+aI7+1wxF80XWTuz8KE6lWRsbUw2NJ4gXGQAaMHCZtG/ts49V/S5NXEYocrc7ww4Qui1g
	WMlIxejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2d7l-00000008beF-0TUJ;
	Wed, 09 Apr 2025 21:38:21 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB9-00000008Sjt-1y7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:48 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab78e6edb99so13304866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231066; x=1744835866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=ypcSKwXgFzwYtmFINm2YH9/zjTVZ0cyPet/bV7tRvLXW/RvNupgelYc9J1WMXnbco3
         jXGD0nYY5ItIad+FeTNLD/ryug97/ub6eNrn6sKwicm0a1fEGg4+mlzDa6WLmrK7TFI8
         R46k4Br4tUmjYt+xN95Qkq90IMxCm1lJTjg93Dg7TbbMiFjjs2yPNXn1WlU+UXGRBIIa
         uEiof1PlfddRGXGyjficJ0xbGIVwPYcJf19XUDSunk7eoCtJVbZ3Yja08tNMAaSdWEFR
         NI5WAo515+UVw3wU4HLr+UdNmurhhD1qiTTrLvEjmeL0PQjJReja3OnDyrCzIhW3Z82g
         dVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231066; x=1744835866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=krDNnggmCO59SYtqKh5xcMHz1M4RB8sNhN0zKSxVC9Nk18T131CS5i6kdjva/BN5bH
         KbG1pWiuAaXSIm9GtEXm364saC6mKEnMA03gDFOZdqPPtzNCYSok/7PyFcNiAp8gRsWl
         SHjoUw811YwRvTXCotxkdBV00PBVUmSsFkDnXdp++VzcmVvoQSF/JzjBVMcEwGL8peFs
         7hwmRgGwFofKYX1oRDbVKcDGSrulb0djtENmNOXTD6Cerk6k6EnyG0jehkBw63KzEF2S
         JqNTCaqvsaz8OVaWy3iY7sJRrNcY0rfvPGVmJnNedftRIXJuY7HX1OKdBS1Gkh2nKyEj
         CbLg==
X-Forwarded-Encrypted: i=1; AJvYcCWH2iX6jI6PvTP3qBE5hUSzB5njAqVYhw1nMcG44TDcVEgbINm/VfFCx8woXzXawXfierlA8bdPGBKGySGY1gm8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx90Hawu7tfOBByNNBJ/lwpFt3pH5pBxfItcIOTgtae26OYabcp
	j9tQv/PZha392G8X9u92YAKi6PKkzATvhb/94b3f3z81MsvoOxO8qLdTRNOGMFw=
X-Gm-Gg: ASbGncuZp07jpsGwwd9Dvu0gQBJa89TN9bsKsNbilK6r0pxIdWK+RHAe8mmFXzGCYro
	ku6Kq/LvZm4wH44RMlYPmieWbYnK5xdb7Ej1//d0ioSc/fuSufLjIxETz5Sioa5jqu7Qj4hriJ/
	xMhd0Ey8fuA/EHg0frB1opyb4O/QyhXt/nA9VauSlnBwL2GKa87pkPAAKOqpS+vylUHvzfZ5uah
	h/GDjBKz5SYKRe8lPkKrzH38Uywfa88VvIr+is4IjOjVseYyhnUvCjddIzvDsL7kefK7EZeMFsS
	OHAlphVtki/xR7iSeBLiwV/R5MQMcv1uuJnqpH287sy1bgwz5BqG+cPpjbhNSNpjFUY++Xp1Gzf
	Au9XCSVjZ1Z1wt8fsbhwXWuPEAps=
X-Google-Smtp-Source: AGHT+IHIxFKwjUo5uFV6Jyj3wWXPZsF8lPwam2ydOiylWhWcuYhWeTd4XU5X8ZDB51XZhRzJ2FSu4w==
X-Received: by 2002:a17:907:7d8b:b0:ac7:9acf:4ef with SMTP id a640c23a62f3a-acabd4d7131mr6904366b.56.1744231066055;
        Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:53 +0100
Subject: [PATCH v4 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-32-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133747_509684_0D421C83 
X-CRM114-Status: GOOD (  10.53  )
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.604.gff1f9ca942-goog


