Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AA1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=; b=oQzUCsCX4o64tC
	/QYn/d1gYVxS5Vjz+LyciraehnzR4N+tw7YffPT0SNgHWyylD5MF5KJQuOxavwDHpsVYv4jHCMm7C
	G1l3hfnmeiR1EbTflC9dnxksdGgppGTWlkCaZtLkx1PjhCIGsdRrG8/aiwDtXL4Zz2+yxgboGh5OK
	yi7fjIZpGmseKgeQ5vq9z+niesoB4BujtLbcDz6mLvW1mf5AerAoWZELaZGHkTyiYl/m7vBYaS6MX
	Z7Smn/xP+q8zX0TF+V0X62uBRlRKFFGQVsstetCIymEkYCc5FQBYegdnwFtmho1CfunD9k3Uhx2bC
	AZo6++PdQ9rWtYOISyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9fb-0000000Eqsx-079G;
	Fri, 27 Jun 2025 14:03:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV993-0000000EmOC-0MHd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:29:34 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so4023089a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030971; x=1751635771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=;
        b=d1oa7QIQll2qOapf4ieQcBfaHFiejROSYxeqF/wzWgghInHkEy48bzQxTE9vkSnk55
         5QbPMvd/wsgyQSMmNx3wYAIKdlRR/i94RuojHyQ6gubJ6L/a0U+7Ot3sbF8WOIPWHExs
         LKIN1xQaBrnEAFubp8863DyhhyGBshh9FVdpNwCupEJYysRecVptymNOwxm5PM/4ZaFa
         Dn7j37NlgSJ+QPkVhX+GuYZkYzOP3I+F/Xa6PVOb+9Pxn9IsZy3sAvqVLNhONNrDHJeo
         yxGYyHdVjWPYNLlkcCOdz7o4gGwEj+N08DuVcZyTg8Ym5FqKZwfvSHkbXltKFlg8bHSM
         pFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030971; x=1751635771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=;
        b=R4AElplbDNXvIS94xvkAxerH/FFB/0ScHAU0SeKuVJxKItOu8bkB561GXntMhMy0MA
         KNUHM36npgsukpFb1yhZKSQSjaGC3rZMBMSDvJHsfNamgxgdlZejP+B7X8GKqoVh9S3F
         ss7UGrkB2IQ7xLwO3QGoQAo7JbWKNbPSzSL3Pu/fcG+f8vIx9Ns6SGEhpDybuulZwtf/
         WiU9FjCMIzw7JZsprKgomiCAGEtfvlxsu1IpeNttuHuD/fpLmrbB88YLDgeGS0gjKbRu
         Dabja/a4Gf5mvFAYP2NCYofeEPLp7kb/bxUPluBnmR4SxfJu/MXPq108ocAufySqlh23
         nFqA==
X-Forwarded-Encrypted: i=1; AJvYcCWd6N+R4wC+P5UVX2deBOaVKBnlF/3yXSF2W9DaFhr7HBvlpsN1hX8nSrVG1xjE5jeUto1HFa2IuffqT4ZL+3HG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv8Msu9zOEPUEtJ5YfIAEmbu2DCSabc21njihPfBMlo8dIPBEd
	qV9yW5IFWU0rLaQADJwcdSDwWmNIo2bTq7vqfNayaJGDdEQ5/BrzKr0XX4UPTPLFfEc=
X-Gm-Gg: ASbGncta3Q1GA6c3emEYyIr9snDeD0SSZkxB71fS8WvnI27Qz3k6Jd29A7tnR5r4LzH
	Ncz58KHUSpEFmNlJwu+4W3Yj3JXdkUeRrmgh8gKhe+u5G0O7KXqswE1H0xtrHU0+46GynWAPtm5
	KvD/XfDj/jUUpMHQpesSwaOs+EByuCEGxl4ikq9n29P+z9KDB8L3eoyqZEolHkGlhgwaAX/2lSt
	F68FBVxa1UlryeBEi8PYxr8k5IRxzlmQeXp1KcO+0KSTCcUmBWiHHjpVqK5AwSWZOsa5xcH7db7
	jhhPDUOMuqvFjc4zWKO3+nM1nMHS4/MMxI6GpLuXWKgkSgl00KDTLecNq5QtL3B4Pxd3xCi46K5
	Gu6o7+FUDN1CN4sCuYUXIGYu8u9vdyA2xB+pFxF0JhzjjFY0wnavedfeW
X-Google-Smtp-Source: AGHT+IFZK5c46HhXnjcsG+iKu4lVg84Jm5gZqBHYsY+oJqop8E97nfkHet25Wa24z6oqjQJtzHQGZQ==
X-Received: by 2002:a05:6402:40d0:b0:607:4625:98f5 with SMTP id 4fb4d7f45d1cf-60c88e58024mr2569375a12.23.1751030971492;
        Fri, 27 Jun 2025 06:29:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 s2mpg10 initial enablement & reboot update (DT)
Date: Fri, 27 Jun 2025 14:29:29 +0100
Message-Id: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALmcXmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNz3fRiQwND3aLUpPz8EmNdC+M0i2QjE/NEg6QkJaCegqLUtMwKsHn
 RsbW1AGKIwG1fAAAA
X-Change-ID: 20250627-gs101-reboot3-83f8c247a0bb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_062933_125275_D67B34A2 
X-CRM114-Status: GOOD (  10.77  )
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

This series goes on top of krzk/for-next commit 62cd64f5b915 ("Merge
branch 'next/dt64' into for-next") [1] for the reason outlined at the
bottom of this cover letter.

This series enables the s2mpg10 PMIC, updates the DT for Google Pixel 6
and 6 Pro (oriole / raven) boards accordingly, and switches these
boards to cold-reboot (instead of warm).

A cold-reboot is a bit more secure than warm-reboot as e.g. RAM
contents will be wiped, and the bootloader will not assume the HLOS has
crashed (as it does with warm-reboot) and will therefore be ready a bit
faster.

For cold-reboot to fully work, the reboot mode (i.e. what to do after
reboot) needs to have been stored in NVMEM for the bootloader.
Therefore this series runtime-depends on the Maxim MAX77759 nvmem
enablement from [2], which was applied to krzk/linux.git (for-next).

Link: https://git.kernel.org/krzk/c/62cd64f5b915 [1]
Link: https://lore.kernel.org/all/20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org/ [2]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: defconfig: enable Samsung PMIC over ACPM
      arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      arm64: dts: exynos: gs101: switch to gs101 specific reboot

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi   | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi         |  5 +----
 arch/arm64/configs/defconfig                         |  1 +
 3 files changed, 22 insertions(+), 4 deletions(-)
---
base-commit: 62cd64f5b915617ea7978205b336ff21f0801c95
change-id: 20250627-gs101-reboot3-83f8c247a0bb

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


