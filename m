Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5517CD6B6B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJvO6m6VfJq7jLiXQGCAJ+rgJ6VzC5FKvl/I4BvuxQc=; b=h9oZEi2Nh3hJ6Ds+luv2q9kr1j
	pCiezT0Cr7c86nmFkLyBWoYrM92SZiexrLUEXevsJcP9UfgXyHxHZjzwd+GhMJKBGKEJUwJHTdjah
	S04SNpe7W8nISbYUQEIizp5NgR16Cnh+zNYDWb2+SpVLEQSjGLcbvxYhDFhZ2mK8xWgBRuJa9WE5x
	eqgs/4BGK9ZwF/t/RgK7K6YprLchOMQrrkFyjz2rklhR5Sn8kjxhpSsNhM3aF19em21d57YXiS5pA
	tPUlUmeOtxqLs0qPiZ4OCghNz+0XyoYNu6pXl00FHwxK3//y6HbYdqqh88AZr9qEK77AFGTfs7z4i
	iUvUCvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CIj-00000001EQI-1Qf7;
	Wed, 30 Oct 2024 17:16:09 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CDl-00000001D1i-23c5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:11:04 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so256111fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308259; x=1730913059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJvO6m6VfJq7jLiXQGCAJ+rgJ6VzC5FKvl/I4BvuxQc=;
        b=SFvu5Dw7LbAZRBRrqT1yRTEe58tVkAQB4M+aqCXA3ahA9LslY3fvBn8x2AtQItEjZw
         gW8kvh96mmHsZnFmp60kOEhs2jiVhnnSrRZm6g+ZvpNdlOZzA40Up35kMzGvt90DAMna
         U0qqYSGqxeZyFBQEY1JGQ2T1zbZaZmJIQQZcijUIIORsCEOOM9czsna1n7bTs8/pErFz
         oyztYaSc75gfuKQ18p63xw4XAe1dwIV3U1eKqS1pT3p6Qa85I3yDx0e5brdq5I9266Hy
         BV+VpV/WZxOmFgC+fAdf69YvJ8bKRoaey8sIQoxDsf3YKrcyUDr4XT19UhsYCZNYwPS7
         IrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308259; x=1730913059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJvO6m6VfJq7jLiXQGCAJ+rgJ6VzC5FKvl/I4BvuxQc=;
        b=fh3H/441+cRm0VemT4x/W4XgBdMIuxbbSOm7TEUgP3oFgWmZ3kslA7VWQFAeEW8LpS
         aoLjDFqkNS2PiAdVPBZ5qa9az6g/9a2UQTepoMCd7DfIDbVuYWw43Te3kRmp2FNgs9jQ
         kUYuYp4hP4cZPCsrjZ4LqUbk5pXiM9tTpjSch1q9sV/3H+i7w3+0a1Dlw4XAhMO2Dy70
         30UhirL/oSpcaALNlp78iAzWj7/Ln2tRu9CaWiAotZa9fUVFWpAaobbLFSOAxQFS4Twu
         /6foX633nCTd9wiuHicAUy9m+iWhyN3AeE7a2yVgl2ZgS0b0dh/JzIGdbZS9bR2NGrUz
         nDUA==
X-Gm-Message-State: AOJu0Yxos5UsEp6WAgLUJA6XQ4kcEeaFVtJEiguduGRCwOY09nljMhaC
	0wbjYB9qFAr5zhzIrqNIlXg7BrbHM/QJ3i9t3a9YcHWYyP5bWOhhxFBqgg==
X-Google-Smtp-Source: AGHT+IE9t0eBimyH7UiH84hK6DgH1SFcaijILVkX0wzzcYM83S6LqN3c4d1isUuteAfU8x3BfYI/tg==
X-Received: by 2002:a05:651c:514:b0:2fb:5206:1675 with SMTP id 38308e7fff4ca-2fcbdff1ffdmr135616061fa.27.1730308258955;
        Wed, 30 Oct 2024 10:10:58 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9faesm26828985e9.35.2024.10.30.10.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:10:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 30 Oct 2024 18:10:45 +0100
Subject: [PATCH 2/2] drivers: soc: atmel: use automatic cleanup for
 device_node in atmel_soc_device_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-soc-atmel-soc-cleanup-v1-2-32b9e0773b14@gmail.com>
References: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
In-Reply-To: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730308255; l=989;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=OndDXqKtEJ3cA9GTwb1q2oE8eowa7SIjG7xCrUy6/yc=;
 b=4PSAgRDXw7LxIptekOdlnHv1UbgiZ5LgxiPU3wDfeyUAV/VockQb3gdRTkZabAt/nKdictWHL
 ZmQj0gg9UejBJkOLxrq5kpZ/MLBrGlreE1U+n05iRMIZ+vjHKy76MjC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_101101_565203_EDFBEBF6 
X-CRM114-Status: GOOD (  12.20  )
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

Switch to a more robust approach to automatically release the node when
it goes out of scope, dropping the need for explicit calls to
of_node_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/soc/atmel/soc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index 64b1ad063073..298b542dd1c0 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -399,15 +399,12 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 
 static int __init atmel_soc_device_init(void)
 {
-	struct device_node *np = of_find_node_by_path("/");
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
 
-	if (!of_match_node(at91_soc_allowed_list, np)) {
-		of_node_put(np);
+	if (!of_match_node(at91_soc_allowed_list, np))
 		return 0;
-	}
 
 	at91_soc_init(socs);
-	of_node_put(np);
 
 	return 0;
 }

-- 
2.43.0


