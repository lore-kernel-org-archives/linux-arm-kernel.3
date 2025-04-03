Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB18C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=; b=roTZx0l3PQLdsmSwWbkdb4iTqc
	OWN4mRpTndHk8dbbkpPaoWB9PVAycbYOHGVU6WH2yid3NOOgj265e7frH9vouXdGGmKAm94K9okFw
	ibEklI8esvU9hJw6QLi42mYylU31SNw4zGGYpVmHHq5545qakcM6AJjJSxn6vghv3a9VPg76bP3s3
	HsebLNbzmeoAdKjOmfBOcFvHPPolQnWHH+eOcQvz6COzBn56DHRtSt/eXvUhztKEjdVCtORocCC9N
	xZK48gIUGxPwHInt8bYC3xAaisgoUGEPieESrinmJZG8q2pyU7wFy8yaVP2+phdHmP9cLJyrcgwsy
	R6Z4r5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GYK-00000008LiB-2mlD;
	Thu, 03 Apr 2025 09:08:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPe-00000008Jfc-46cm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:04 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so1167685a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670741; x=1744275541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=U0VWaYPBfkbEha42lEoFDRc7pEkAOFPzsBRk0wnl+jwqllJTFgpeyVGuJDl4INqo/V
         qNDhdF2RjgeuHj7X4Mmn8DTVdLU7LBFFaq7qAT9SuayKMkLUc6XFjTS18bOAsz8FgZ0J
         gwWUtkUEp6u85fRhdarK/Z6TmKOsBCIoFawAUEbXKltWQUNl4RpgwWpYBn2eqyNFIDPA
         Ww4k1b3Z7z2joYV9gfmDMwBbDmWa3LMzcaLH/aJQ3b/G2vYS1vFptuhpX91K7qV6rrq/
         dhNM+vEHSxLzfCLOO8SEUcNwMmTaSUrwwS/8K7SfbAK2Dp6LZj3Bsxjd0MMzhnSNfvt5
         NKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670741; x=1744275541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=D789G46ToRVNsvFB5ghU26cQ0g6AgvwDm7Qw+TiugXZT+Li5KFn1LXmyDM63p0gS2X
         yskQFVAS8dXNEjaDVFpgLfXBxbtIOe3LLanymDDfI8+AD4QcZnsDeEHJcCPUBR2I/NKc
         QUaNtiHc5fxkKuBuNrBCzzKtQEW5IQWwCza92K7nRdM8p9T63JJiMrUG9fJJbvvEFQ5/
         WHJUyL3ZxiVPEoSYA7vRdQ7mJzGoQlbmARMA6P0XCBKxBQpqtO6akjjFxPmdHQt5+cCS
         XEl+t2EBnMtYzYE2WKKJxnokqvd1PE4eMUEZDcYk+ztfOScNb7fxDyuNb7QC6gxZ03gZ
         eQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfN+kkqb5VZ47jSOp33C3IlbKNTCuFF74XxDzf3c8ynl76d0LcGZVVK2Ftzx/0Yh/hzHk6aeAPyUnOOIN9brup@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd9G2ATrf1ugJf/F8eKqv38p6/QbjXNhPYIS7TQ9wPjKVypdMW
	m5jpz8sHnVoW0sTsbfo8Fe6y4tiZ1a57vkJZEWgk4AZLxe5EjRj9/7uDDchd1/E=
X-Gm-Gg: ASbGnctMWrSOMIaQCb2/MSzdyYv82/dz9hwHhkjM7m7BUaJJkAUyTZyyFjLDu2BZjIk
	Cf9cK9U8jUR13nAPaG+Mc0NIzXEfRu7WVKJWuywofRg9BW7hkYnAHr4VhngOT9bN4B5ZgbkjeP3
	+dWZ84OI4DIyuaxEqksGEOPbwq7l8T8KM5sX1ODbH2fmboi1z7VaPXiZxnlGB8HEDnVl17A8ev1
	bX+J/aCsx/dw5c035eqgR31z2UeiU/KXO0+O6mVCJZ5vgoFimoPKShNRwOk790/3t+ug1s5arpv
	7Oja2iX8MeN1nNRjqmZgFLpus0F2jpXAWlPW72elPR/KKWxF6mX4LfFtCvC21fIP9E3ViN27eh2
	dSMPN0UriLAVPb2JpEQg8ZJ3sR2+3
X-Google-Smtp-Source: AGHT+IHQrHf12EJNK/p+81ZjxQhmjVXLedkpjwoD4qMiwxw3fr2xU8zdguaJrZmoo26ZrVzwsXGVGA==
X-Received: by 2002:a05:6402:2802:b0:5ec:cd7c:de55 with SMTP id 4fb4d7f45d1cf-5f08717ff38mr1640036a12.17.1743670741481;
        Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:56 +0100
Subject: [PATCH v3 04/32] mfd: sec: drop non-existing forward declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-4-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015903_044971_E2FD2627 
X-CRM114-Status: GOOD (  10.20  )
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

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog


