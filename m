Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE1CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wTp/DewPWwVucRrfprxY7chF4qiLf0sCuwP2ZtpEwA=; b=bEtYw0Gt4K0Z3YBMylFN132sa5
	Ye6X4NgxbRHniD0XH68NUeLvu03El3oh89TDQfCwM+y+f7Ai3Gto0O5seTmnUWaNLeKLg0pM2t6XQ
	YFZS1704NEN3reLqqYQRWsdpYWKUh2CUP94xF77ySgwGMjPz6H0v2wjgr4Nt9zBlX7w/uGC1m3Hcy
	gA49+tbPuhcZg9cooCekJRYKR+NFkTskF3RN1powCawuEWladu34ImxrnYQNFChnfxXc2lgkLwiX1
	kgxflVnufR+U03L0xKVIln8V0BZ6mktc+P1OUwvRVOH0K8DCVlO9FQHGJ/QtxTWa9naCIriwOrEuZ
	QkL53DoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1SA-0000000HaFJ-2ocN;
	Mon, 03 Mar 2025 08:47:10 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Mv-0000000HZGQ-2g85
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:46 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30797730cbdso40631981fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991304; x=1741596104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wTp/DewPWwVucRrfprxY7chF4qiLf0sCuwP2ZtpEwA=;
        b=CChJxmMOenYiWVf/FUAo7BU4SXCrHUidlwvYjaetvDWhW0DfOikPgiBBNF16BNfe1H
         SU1sIKJDOm1N8RPjGF5hTxGNh0D774zeb4LwU9sZAYlkRgmtN9q5WdMpWd64w+10QdiD
         5lby5DWdSqVnc/NMDcNnt9C6KNWR0/XRXtfrsLQSli7M6LOS4zBrFsmEjTf95vwbgBTf
         xsIo7gQ8lVKOLRJdNkxWxLB+4KwYjjv2kgMgnoSEA8EZ6v9L6PMG7NJ/U2XhfsAxr1S1
         e1j60QDNpCR0TZSrZhkzdOXPcaJvi9//VjYKhrSQVORYiZwAHV/8bO3aACJN67hqTmJi
         f+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991304; x=1741596104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wTp/DewPWwVucRrfprxY7chF4qiLf0sCuwP2ZtpEwA=;
        b=ca+ywqsP5ns79QkUmPGSW/OyZVqHFxASdeyceXAMpUH8gmmH76tnsTDAyIDdpgSe4s
         kM3Xbr5u0Yp+AlBgd6HwVJceHeXpM6kqBLOz5Dm9sdD/IGZY8n56tmqGBsZUZnwhgo4+
         nRKaniroR8YP3KkXHiPN4fxcdcV0u3UeySCtwqSpa1PRS8Y53Pjbu+XKFOpiC6UAtzgW
         Uwoj0pfydWz/mhI4TOyovaQXS1hKQztvWttT/GBMTbyCuhv9fsKSjBRhgBQYD+QCKX3A
         VEdJDa7+KfYlFwmFoYACFxEBfJZoXnzD9HpdnAABcqpp56d4RBPjDnwJbSr3SBb0IEG7
         PRSA==
X-Forwarded-Encrypted: i=1; AJvYcCX4ammLBNoFML+rD6DUpRUacxdR0Lq1XmuQzW/Icv8BUNc9ZUkzFJtavrlSRi165Ym6J8FJRCq5UUy+aNkMMk6p@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6tiqKpzmAUMkjGx1LgbiSxd4/o9u/ZpHxgZ3RDgmN4wiY95sz
	12RfQy4h8FCcfCnFFdN1OLZKhEAga6k3E87Ta29ghSlaPHfyt/aULaNkXASWBow=
X-Gm-Gg: ASbGncv/t7e3bvyv69Ntu5B9gv5KCvAzKk5WGCLUJoa4ecC2/hx1KnGSxUPlQLDpCJE
	55K3Z9p4gxnHH8OlGrSIzW0E2uzCz8ERlg4AVzBay0NKwGb1/CpuDzUZaFg+9AqhKdt7YKPKCIx
	Emss19bwrD6Pz+rSgvthNVzUdBj7XvTn1GEaHceIvGSXNSGdMbHlVwjb0I+GapctSSy0/7kT1QO
	hwqP1LEQyMxr8mu2khUPvOvvXwfscY29bpBASgimi5TGJ+KHV5QBBDesw8lX/AY0YJb7kZoB9x+
	8OehO4EiVtojt3yR/cgLZpRfmAgmMjBXPTe3Nq4lu2zSrwF2SiKIEY4=
X-Google-Smtp-Source: AGHT+IF2jEkaDyi16l+36h88tRe5CgK092ZTp/XvBwN0aDOK9nZNIn9ADMq46aBdbDPRqRrYzuRY5A==
X-Received: by 2002:a2e:be85:0:b0:30a:448a:463 with SMTP id 38308e7fff4ca-30b93216587mr47291471fa.4.1740991303634;
        Mon, 03 Mar 2025 00:41:43 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:41 +0100
Subject: [PATCH 1/6] ASoC: samsung: bells: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004145_682430_5D15429A 
X-CRM114-Status: GOOD (  11.21  )
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

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/bells.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b0746af07a5fff040fa 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5102.h"

-- 
2.48.1


