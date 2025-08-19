Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E661DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mI1h+BmNbILdGpeniKvEeoyTFz8pMoc//wK6fMdn9Q=; b=J3kczKkWMiJPRG
	gowGQz8V5RqkqL3VZe9NhGYdtXBkVb5Tavjw6j4AUeuEx0P3Pw3mDu898BaDfo0U+S7ZsBkjJYBzj
	xZP/5Yd3a4xFc6KhMn3N/TusMz+GbXbsln/avKaekOO7cO6KMwGCr5davOKNGb+2he0I1Al2te+55
	d5vo32jx9cyLW7yCo+4OeqCSu97nT2VQJjYm5EO95CMvsG8NQUTzE6O1v8ycVfbymnRX4ch3FquQg
	2C3EvFjqR1Fs/6Qvfle8hqya95necICMOG+v+IwnHqIUswj2zRVePxqv8GgzpZYDlF8uyy3ITtdhi
	WjCcDn8kJCwJOSUnrpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMyV-0000000AheI-0sfc;
	Tue, 19 Aug 2025 14:06:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKmo-0000000AKKv-43zy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:45:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so26046105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603953; x=1756208753; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mI1h+BmNbILdGpeniKvEeoyTFz8pMoc//wK6fMdn9Q=;
        b=og0qli/RQk1D/p8gIw4uVsZvrCS/BYvsUXwDSWZG7PuQ1CcDceGcmsvOHgrIx8IAs+
         M3H63ITBKABq952Bg1W06WZxQ0mnTdCj3k3vj/sEL0hX2f+0FtWa0UCrsYGpKQkOaz6e
         RMs+25cJxu1IjI36VdtdADs/x8Lqdna+yB4oiN2XVh+i9ICyIx/YT+MRCebR6U5DULag
         zFNxeEr3ehQgAHdbPJ9vTJEBnwpIXYDdZWtWS59mFZVUfFu6VIykeCQQ2fbU1qrDW7a8
         a3Po0Hvti9wKr3AUqUCVdpMYWiSmrK0zV7OdYAlVh6nO0XgQ6LD9daapO1SYzNOlc7Mr
         hsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603953; x=1756208753;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mI1h+BmNbILdGpeniKvEeoyTFz8pMoc//wK6fMdn9Q=;
        b=KMJxmWdVD8OYQHhMc/qja8htnR2rKfiEIvf5BCGbo56YIRfacUKNS8jPkU83zHrQpd
         /Dqm5eezqIgoLfDJdHIstY7qKB7UadefG2wKimPeHIw7qSwezLzOppChjhtgbv6w1IKz
         0QcdXi6f2MUWgmxucDzWFAXCAncttMxTXe9CWjRpiZj5gNbInTbrtEp+GMcmlGKqVVve
         OzibD+iN8aSMfZ8SYluFRB9HP+IrnpR5c7uxCmbv2PE5tzzI9VfR9i+8773WhD15x3Q/
         1b4CZ/y0AtqKUUrkKevvr7rPEw+GKh8K9au+rv/ftH5EqH4n06tdg/v9UBMapt8Djl2x
         i8+g==
X-Forwarded-Encrypted: i=1; AJvYcCUhUKr4YH3uL0N/EJP6ze12cgprehPDWcXgmY6nUGv03d1HHTNs9WGwfFWLBzOJWKiWBjnv3xc3upQ6aAur2RZX@lists.infradead.org
X-Gm-Message-State: AOJu0YxSks8m16Zj1Om/z0b3X/tI1rpeatYr7i9nmYMkDSjYUCwNHGAW
	tsDJCHcCWc8ZvgPhl4Ta+gKWWAPGVmtmHO5TkwaU0ocWFTnl77kOp7iXMc5LUhcgrNk=
X-Gm-Gg: ASbGncu82U7ojfA5z488HOr/pMIppnCY7Fcbnz1CIisRhDFmiK7KFHIDbIdMs6wu/KR
	fu9aOE43yspTws4zGKYJvztXaph/UFl0NfS5zQBtT45geUHEhQ2DTk+pW8WV1XwU1OGdC3bbV8s
	qZnlWurrplWXmwmGFnoXfwV2Qo3OYdXpndT9aUmgps7pfPj4nKwYDmXftBBklaGIFnD07tRItX+
	F43diAwGIImJOr3OQYwnSjw+6NzPV92wEPzcxqdPryxwAR1CxA3kp9WzAjc0+ELNhEkPfUCtnCS
	sUqj1lDq1uzgnl90mncMEWAu+FP2XSEf7ieS7r+9PQMjGuWYTykRvrwGkzvkrDTLoYcRIjRGs7m
	qGGx0qE3AAm91hhqjh/K4hanjpVIm0vwj5XXRYLirJPohtQC0j/oP7HRBpS64VRBmJQWT0F9uHh
	kw3A==
X-Google-Smtp-Source: AGHT+IEnwmvW6IIY3fHtQYIYoD1wKmz1nhv91N571YRo5fDdb1O2yoXT6VRpNYHi8x8OdTISvstKRw==
X-Received: by 2002:a05:600c:3ba5:b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-45b45374caamr14002615e9.3.1755603953268;
        Tue, 19 Aug 2025 04:45:53 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/3] exynos-acpm: add DVFS protocol and clock driver
Date: Tue, 19 Aug 2025 11:45:35 +0000
Message-Id: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9jpGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NL3cTkglzd5JxsXSOLFKNEc4tUA2MDcyWg8oKi1LTMCrBR0bG1tQD
 TV39kWgAAAA==
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=1667;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=atHOVDZrHoC4KUAzLF3V2ExuFabINMR3JpSKKqoKhGM=;
 b=h6Bb36OJtt4jZDYOdwe5maGI2bcHWggh27JZXK/hNIDehiPXcAddUEhsj/76QM7GPPUeu3kqb
 jydYZwKtvyDBk4+2SmWwopkALIvvL42OrRHIifDVPAm8txJvXd+GSM0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044555_014743_27CB9848 
X-CRM114-Status: GOOD (  13.20  )
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

The APM firmware exposes clocks that are variable and index based.
These clocks don't provide an entire range of values between the limits
but only discrete points within the range. The firmware also manages
the voltage scaling appropriately with the clock scaling.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the APM firmware.
Add an ACPM clock driver to model the clocks exposed by the APM firmware.

All patches can go through the samsung tree.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: firmware: google,gs101-acpm-ipc: add clocks node
      firmware: exynos-acpm: add DVFS protocol
      clk: samsung: add Exynos ACPM clock driver

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  28 +++
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 192 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  85 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |   5 +
 include/dt-bindings/clock/google,gs101.h           |  15 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 10 files changed, 370 insertions(+), 1 deletion(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


