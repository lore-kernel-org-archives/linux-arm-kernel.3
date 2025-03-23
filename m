Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B26C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=; b=4kJ5UW2EWBf5MEavtj0vO7M00D
	Tc6NAOt4z+aOQBOdOKlGS/d6ysElQzSCT/4hjug6c2AKMjCgJUGYG0m8qhzNuN5igM+QdomHE95TL
	C05K81RN4ONB2LFRXb+QOrS22rUnaF9LsCAs05yaJWFArNB8tof8al+1ltUnNX/WDkCtLDApa0Jyj
	rsVOkwjbFH89X98OgzR9UrtydCU9d0E7b14WBYxP39T5EAXlc+MqDnThAIY+LfeciKR4pKyxg8iOT
	/dIE1OAr8Sp/45Zq2PBNpAXRwVC2cw696n7AqSKPoMGoeStFQjgg7/9GybHbt+pKpkGpztvPFOmVz
	IqrKiudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUvH-00000001vHT-3zuG;
	Sun, 23 Mar 2025 23:40:07 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyb-00000001p5U-3oME
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac34257295dso794851266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769568; x=1743374368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=;
        b=BjDdN2xhAqAK7FFCL/21dQ4idRz3eqRLfVYMXtxtBmXq6Hpu8eEzdekm8ISzYsbwac
         tX0oEFTZHUjrUvr7FIlP95+sO2dk3FYzb1V4I6Lx0q9mkDER47d3wCq8DJ7Fhd/zfPln
         7NptHcSrKyvqFaI5iQhbzOQs9HO34xYY24pkgCG9qalHhsihpLOxzj7jHI3hn0GOw4pa
         qxnrs0qUSUkfR/gcqvCAwfYR8TNLKmQHLpWcnuWSLnY05UdeHDmGH7YjhvH8M5xrou7+
         8aDh5rnRi0DDPThI+uacrMnHZEW6r/7lSovdvsp8dbHQIBPohSM0hLZyGVYrQ3DTrwuE
         dLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769568; x=1743374368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=;
        b=X2Bdlq5n+ds6tZqWxuiMIiM6Npv7Qg3dRGVlyaUBlOMx3rJZzaCWeYU3NZe4fmC+t5
         lHIqDSv7LuhCmX+1A41yFVP4yorWQWS/6B1RT2sjU9OLynBj2jepMyCtQPZC5d2q5uTL
         i0y5BHJYV6Huajcl0qcw0Cneg8ZQdj8jihnsCluKhNQ26WNapizKL2U+PY54EMUkFWF5
         /9ucaCSFwa7DHx0LyM73zMttRtpMxrSfsrbAiK0/hlVVHEa8tJH2XBH6eb7DfS9mhFUh
         fQ+e/1ZEawD6p7y74vngo9yURWPJNcYiYWyyYSs0hezoBi+43wwWB37kNdeGuzUo41ZX
         QVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO1wjcHOk7cxeEJEYq4a3R9+K/a1Swme0EPbonDELsWk1pehRbfERCJLaxtE7ZDPOpa5P3kKtlgf4xNxigdiHc@lists.infradead.org
X-Gm-Message-State: AOJu0YxoyvemFrEC1of0ysX6s8X7sQdw90P4ugnhjOw/ItKvadlrKTth
	Eo+MsCTUxad33DZK4fi3r+haAVQYGbn2QERsgLTUnpnDn9Xb+rzO1VpMHOny3o8=
X-Gm-Gg: ASbGncuOdsEOfDfakjZsX1Vq4aRSbcj1TStWBBiplM3AJxUCGshPlcdRCy39D0/wZsd
	IWbPZ3D8gDNw6xj3mkN5wWaLjYENGwd3wDCTHUm0BxfKlJGXHdR262doNBIErw+S4ev+EgB1rwJ
	ocq3jNLnfl4qDyjhNpsGHVYfTCt1T342mwkI7tOkbTPlJqTUne+n3JkYkZx9lIg2TP78uRV2xxN
	FeoYUXu3jQTRAwU/Srv6ZYBHst70dfw7w4A88XGnHK4FXV9kna8BcY4YSHcscIhnwkYI79h8iLO
	2mPPeEOvogv1sV/MWFB6nrQ72ctjdS2EBGVs0EOexxj0bI+n1vKYIOMimq7nUElmwJRddH3pwIL
	Gq3IQGpF7vGYARqaZ73inwSenO17m
X-Google-Smtp-Source: AGHT+IGESlPld0TIZcF+ERlnjIFgWzaZCupFw8MycHD7wowlazt/klJI/2hD2dVdJFw5afV/HysuBA==
X-Received: by 2002:a17:907:bd88:b0:ac4:491:1548 with SMTP id a640c23a62f3a-ac404911816mr803996166b.11.1742769568148;
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:24 +0000
Subject: [PATCH 08/34] mfd: sec: fix open parenthesis alignment
 (of_property_read_bool)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-8-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153929_949514_9CD7AB12 
X-CRM114-Status: GOOD (  13.21  )
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

As a preparation for adding support for Samsung's S2MPG10, which is
connected via SPEEDY / ACPM rather than I2C, we're going to split out
(move) all I2C-specific driver code into its own kernel module, and
create a (common) core transport-agnostic kernel module.

That move of code would highlight some unexpected alignment which
checkpatch would complain about. To avoid that, address the error now,
before the split, to keep the amount of unrelated changes to a minimum
when actually doing the split.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 83693686567df61b5e09f7129dc6b01d69156ff3..b931f66f366571d93ce59c301265fe1c9550b37d 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -276,10 +276,12 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
-	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+	pd->manual_poweroff =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-acokb-ground");
+	pd->disable_wrstbi =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 

-- 
2.49.0.395.g12beb8f557-goog


