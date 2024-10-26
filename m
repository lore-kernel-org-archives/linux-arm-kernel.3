Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8822D0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=; b=buFsP0BafBmuL1cuDpIezsfQUf
	iMaCPewbdSL7lHtV27Pp73/j0eS5v3xd0NbIkQZL8sIZAJbAjoNpwfQhE1ksJnVK7gJTcJFtHovqQ
	p9UdFryhAWX97E0igMDFt0zwpWuxPeXn/cunbCP8n3R2TgxQOwXP12h7zD27GlQQavG3nsoaUZtl0
	Jh4AOXxCE8xLpAcYCoYQvPs8HjJq+UHAT+LxWXgr5ImyTnWqG+Wmb2IAt8BRU6/PxTEOABmkv68Iy
	AGJYS4y3mk/7NronB+PSYt3qoaKerl/W9g6fCbrGlq+5lan8IF+ji4Lg4MeNeUWusnVGe5KQL6EoO
	3LyRFp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nZy-00000007DDZ-3XbG;
	Sat, 26 Oct 2024 20:40:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nT4-00000007CBs-2ytN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:33:04 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e59dadebso3769024e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974780; x=1730579580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=EiT4owmC26zlQo+niXxYe06Y/zVZpbe0vPQNwcaya5TQTRKPsH+ZBqaMYY4IoRqy6m
         sbi3UGDMIrYYnIgjCv8U3nGyniYTwXepeS8HqW4E6CdBgWHZLF1ow7aBGgWrpQu9OiEY
         U32WdI04rlULDvddRFFeAoESQARbgeJJLFd857IcTPE9nEmMc8Tf++N7fF3QUG4Dt09K
         UlAmBtlAUHAWOjVBpvGGyW5DaXTBKfgs8EIb9xBRCPgcNHmorKb8oiyFyhjVZEZ3uGB7
         Wl7+7yFy9DLFEIxHHoWJNBZB8fpRMpVOTPV40rGg6HR7I28DeBUTYdAApafMVEZE7fpt
         F0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974780; x=1730579580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=wSnghXfRpaUKtk+MH1SziEeuvJmBko2nz1tANpKegVo1HYnwhkD5ygxsuB1IyTjeLX
         wElH3za939kC/anQuMbwa3aD8LqtdPjRqK2rQkGhOqFgXbwBRXJ7izv8n5dRuPJ5nz75
         7yaglam+qpQiOyC4SzZaOuTJyMF+NoA3farK5Sr6J2R/Olvj4NdxiSwywCreH73UxKaN
         teejgSFFeSAoyJfDGQW7zBvPu5sxEN2lvNrhWAw11dAFR4M5dlonqNHVJJ9FaD98K6AF
         c0tukMwzQjsQ6BcdXUFHMNNXOsxz8cSM1l3QCEcIKPHCeCMUmR3eE8iBugrX1fRvpd0Z
         jUrw==
X-Forwarded-Encrypted: i=1; AJvYcCV7IR4egctK904uy3lyBBCkbOrFjcnlM/AWhBmq4glUdiaL2Lggtr59upXxQJuxH/jQ9QyWLm/9YE3GtjtLw3RY@lists.infradead.org
X-Gm-Message-State: AOJu0YxsLdR/VU+Enz203gypFdeMhUiDK+pOU1un8OHILLm/LiuzmkeK
	imWgM6R3UO9H5m+S6ea9lCSZZaRQTFM/3ZpLeOYj8hkMQH8THOuc
X-Google-Smtp-Source: AGHT+IHWZf3xXJWbjclTAVdzqiSi3SC8R16MfNzyEIkT5MszF0E+oAKczTmO03v+bTX0CcurM/WUAw==
X-Received: by 2002:a05:6512:1392:b0:536:73b5:d971 with SMTP id 2adb3069b0e04-53b34c5f886mr1377958e87.38.1729974780318;
        Sat, 26 Oct 2024 13:33:00 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:33:00 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:38 +0300
Subject: [PATCH v3 07/10] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-7-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=938;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UX/VlaIr9ETHnZFFn3Brzw/0L1791ZTGgYbdKg640mU=;
 b=MHk0C/fqCvgcyc7O1jK3IuskS2dcJ9ZvFOTuuysMIFpOtlxHJFOoxLb1kpPBG/il7YSBGNHVl
 0PYfyTQlzt9CLdXffsjft5doo8Xa7NF3hB5T/jsMfhcuFta/xr1PBeO
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133302_782717_E4008404 
X-CRM114-Status: GOOD (  10.78  )
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

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


