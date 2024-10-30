Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D10D6B6B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTtvVILI8bASQzgU7LKCLSZFap6LNc4ft0tXHklb7n4=; b=zUBJLwhdLB8b+YB9hL3EM0KTMi
	QDr1Fwy3CxtUDEzSej88jAuDFvrWp2qOBjvdgMyS6RZy89d/9WIRKmGy+GklzE+dWPsTrhZGTg9Rc
	mPfcSF5FMmVXF0OxJXb/g7DqTpsJ8Nc0dOsHa+hp+33oNbBYBYpozDxQhPR7RTn/sLMpqhsbNjAAX
	HQMtzLYPAvFdOIZF01ZCA7iTKchTOWJk05DkPl+JgrQWi1mSQoq5tek8nIu4WYgXUY1JZviDHXMkb
	POjvld+NxclBlebarqGDWndNcgQMFbMGYxoLctFlUpJ4VlIDxCr7jEv0yf2fsdZ5aYqt+17CS0jSQ
	JQK3q5bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CH4-00000001Dw1-253O;
	Wed, 30 Oct 2024 17:14:26 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CDk-00000001D1d-2mlv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:11:01 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so106774e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308258; x=1730913058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTtvVILI8bASQzgU7LKCLSZFap6LNc4ft0tXHklb7n4=;
        b=gxgraCWf47Kmv1e9U6vEwZ02C3iT8UP02XNtgRyGDmVwW8kPGz9cTwGh9Y7SQmtHWa
         2pBojdBhnysjDO/AnaHdgb772+vauZiX5ITvBdHsuWAGTecd8QUGxf06FgJlA7CCss9s
         JcxwrogiGuVu0fPVDTY8oBEEnJh14mzr6jaAqDaUmJpti6A6QhyYMMhI/keytaM4/3Jb
         Bp7/GLq1u4342kD+1tI4MrTkPOh81fLF9GLI8nKrbDUh/664PcmLUIay6InmeN6xVTWA
         XJRJbT5DhJV5yi3weqt21t9zw6mcj+buXdJpCFWmOGj0wqkVoTk/TsMJDDx9jZrue2Hs
         G2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308258; x=1730913058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTtvVILI8bASQzgU7LKCLSZFap6LNc4ft0tXHklb7n4=;
        b=tMQNPkz1fVdm/lF8E7D8I/bPIOR9Mref2BtWJZa2IpAhG6P2DQmAU0G89vv/tn5UF4
         s/tfdFA+cU9oTmJwyujaHplC0UpwtUkE6Bhn/228n+CBLkzqjv0ayaobFnvfgK1aKisM
         7iAN8aaSC+gGm3eVtP7nizpr/5shno/2k4nIjGHELCsFjeYepmoyCevveLWmHJOCMsBH
         gvykcbXS4UmnL4th+qoiBYLlBVgL9PnXad3dkdAfBuXji7kCvKwhvR4xLv+PByJWkcfD
         vDX0CPrsfRfVZRvNnbifg30j8WN/NxX/3BlqCrjWHYitXXJElHWExJlEmWnr1XBhcleW
         hiXw==
X-Gm-Message-State: AOJu0YyUWHeilUGpqxxoPGoQbb/LFR0jGPjamdEBbEFjRIUlP+0Cxjk+
	UWIZHBbwl3JXTBl4xV7vGE6hsXeEdFM1sw/q0YfkknTwkU6nLbfnoMVU9w==
X-Google-Smtp-Source: AGHT+IHss8st7QKvUSU+438ejEUHcCZ6cpwlHDkhixbeOiuY4PcEzYL4njnCgW9R4LX95uzpYmxAJQ==
X-Received: by 2002:a05:6512:3a8a:b0:53b:4bc0:72aa with SMTP id 2adb3069b0e04-53c79e4d45emr165051e87.34.1730308257852;
        Wed, 30 Oct 2024 10:10:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9faesm26828985e9.35.2024.10.30.10.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:10:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 30 Oct 2024 18:10:44 +0100
Subject: [PATCH 1/2] drivers: soc: atmel: fix device_node release in
 atmel_soc_device_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-soc-atmel-soc-cleanup-v1-1-32b9e0773b14@gmail.com>
References: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
In-Reply-To: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730308255; l=1020;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=BGokR1rnVjyNDYabJSSa0k7Pn2ZZ9/4XWpf7LL38U1g=;
 b=EyUghQAPETz3hATWK388QYKXcL1vA578B0y0ZOrciW04D+dY7KkZeGs5utmBaPhjeySTFpXTv
 iBPlKCkpzAoBKbZ14G0RsDeSg5fKNv+gQVX98IvSej4UHKjivmxnCDE
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_101100_751093_492C4DE7 
X-CRM114-Status: GOOD (  14.17  )
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

A device_node acquired via of_find_node_by_path() requires explicit
calls to of_node_put() when it is no longer needed to avoid leaking the
resource.

Add the missing of_node_put() in the different execution paths.

Cc: stable@vger.kernel.org
Fixes: 960ddf70cc11 ("drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/soc/atmel/soc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index 2a42b28931c9..64b1ad063073 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -401,10 +401,13 @@ static int __init atmel_soc_device_init(void)
 {
 	struct device_node *np = of_find_node_by_path("/");
 
-	if (!of_match_node(at91_soc_allowed_list, np))
+	if (!of_match_node(at91_soc_allowed_list, np)) {
+		of_node_put(np);
 		return 0;
+	}
 
 	at91_soc_init(socs);
+	of_node_put(np);
 
 	return 0;
 }

-- 
2.43.0


