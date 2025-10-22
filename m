Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A394ACCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/T/x7HAWx7iB0lp5HpZ068PQTi7UotyqR4HqE7amHBc=; b=BPrk4Y+1nVC8LU
	7SZsR9qn77K7MxnB3AuW/a3t+SBlZg/u+WP0vvOog2I2c3nYevGvFQ6dfTlScSbV0kxKSZ6JEfUr6
	KhWGYNCZ2pzFQChs8bEhjaft5tS15/6z96XXGlGqRjsktAhcJsNgeypAb1cKTs6ohNpkWQRUJ/Yol
	/HzW9zbQM7wmgaP+86iF0MXJYmrSXtLJU+qt1b+jaMohsjAXzfXjL2e2t8vWVnS1gXT5fDh/UWwG+
	2CilHlnWgfb4WQzDlcZqJwHjCgmtdr/Ri490+72ReRamIpNQlP3f778R6I+eew5kikHfJJsZhKpmv
	Fb2ic/lcWpzZOOwr0O5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWsh-00000002ctp-0f7j;
	Wed, 22 Oct 2025 11:19:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWsW-00000002cpS-1jhC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:19:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42421b1514fso4250763f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131979; x=1761736779; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/T/x7HAWx7iB0lp5HpZ068PQTi7UotyqR4HqE7amHBc=;
        b=AN1aLiDIiVoi1cjTIGhWFrEz7UJrnu85KhMGomS7d4ffff5uydO/3PCAsuT55Ik4vt
         CXo9zOJDVaPMp+Glz1gI9RjDPQMn4Y7bnvZdwbCvbY32mhKEYEx5GWmEcwOcg8CkCGJq
         +d5dtQU3MX4Tbtc5/A2Oo75p1MuaZIaUNTwtEXGk4GbIP1SPcbnvhN4I5UuZDPtD/bry
         W3Ik1VKx/IMRJdMY3WXL24+7bRPsoQhbB5Kq5AwtRQ0RXAnS42YPusR6P5cU78oSz0Oj
         WCiE+RBj23YNvVVcEiJSXw6kyHjgPssR3sh6RtVSYRoYo6YCMPyNu+HBBRZBaM3tgyku
         BgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131979; x=1761736779;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/T/x7HAWx7iB0lp5HpZ068PQTi7UotyqR4HqE7amHBc=;
        b=oV7IXdeIbmI2uK1xAGMDjaGgQ2cbRWTt1btoeLuZSww+qLQRhP2ITdEIP9YmCNnAYO
         CYWLE0xh/7m+CD2kKb0t0nWgHMrhbg0HgZpEbM69a/8dTNlRwnhptYxy2t92UVBjk5qh
         muyEuE1cb7DDqSh3WsF98dIRTV7ovQY+3uQG7V7SKmE4EY0dFcz5OdOnS39/nHmp1P64
         JV0i0D+49TNwPOK/yTzxXa2zn7jc5ZgidO9O8002eU2TVeC0ywglVDI5vnwqNUwXaqe0
         z9dq/wqVOvSUoFERCqRwAMCei5p+Z8RoshQ0RC/PCQA7ALUwaj+mTEgZj6F6xnyR/vUr
         8HZg==
X-Forwarded-Encrypted: i=1; AJvYcCXOEa82e7g8ITs/EcGqI5xn0/9hd3sJJnbB5qVu802oEcr7TWq/oLSo0ELxBfkOGfr8qrNsbSDtfQStubHSTt7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6MB0vnIkdkQbV0ZxHFCfFdMyKSoGAsTUsoY+wxBpmiMxlf8vs
	9tahvrHZNTCiApe8VeCbVdSrMYG3bM7WCVED+TSc9s1PYxUkqmNnreSz6BBwvka0D2A=
X-Gm-Gg: ASbGncsA0wzHlevkFRF7rDR6KpcuQDY1bonkf68wXIwO1Iq/rSrHkqlwUVfX169/wNW
	ARWY/OwDnGcZgiRUMLXU1vqrEs/DHKIiG9HS5s7uItb4rnDTh3bOG7mBoRe9hW0lUmvl+gcYtqT
	+15MeiR4CKtSFHHjwBRK6qqJTzqCIJBwfy/gjnU8MvXRmqWGCe3h+AYR7mdifQqVmjxvDmeHsZs
	aU2heY/9WEYmxm2pK7Q+MnCrWX149Tni8EMyC8/1vgfylKp0dQldT2gXBmrmplN7IhAIyyeRb7j
	C9uIaaVgd92vz9WcGcFFNrfBRSxkIvIoPfZ9tlIGFE6e1e5gkjHgHL7qEMlLiH5pvKBZei1dLV4
	gxbiKhtkVXnmeRQT1GK5p/ES8Q1txhpTQoireqeyJypSCFN0cFStkBg/4tCqInt6+mxL4/H/JAW
	fdRPhIdYX+6p+Y1anWNXh581hKwBi+vxrxsmnckgrf3pJfflxrpPAN
X-Google-Smtp-Source: AGHT+IGv86ynL42pHYdUKBw9RuU6yCngSbjdQh4SHsDnbLpVSdE137PiVhtffxXXGOOfiMwcQOf4Gg==
X-Received: by 2002:a05:6000:24c9:b0:426:d549:5861 with SMTP id ffacd0b85a97d-42704e029bcmr15217601f8f.42.1761131978148;
        Wed, 22 Oct 2025 04:19:38 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a78csm24820692f8f.26.2025.10.22.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:19:37 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] hwrng: exynos: enable GS101 TRNG support
Date: Wed, 22 Oct 2025 11:19:34 +0000
Message-Id: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMa9+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3fRiQwND3ZKivHRdU5Mkc6CYoYWJkYkSUENBUWpaZgXYsOjY2lo
 ANfjsVVwAAAA=
X-Change-ID: 20251022-gs101-trng-54b710218424
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761131977; l=2271;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d06wTerR1sR2T4EONqcyBchEQMucKU4Nk79E8aTrujQ=;
 b=IayhEy+ddWFifvTeb3lqukHgT/sBVfIIGHwKHkGUx79QsEmrV9yt+ClYCAmmEUlOhpghFHU3G
 ur6VZXs4GzcCQwFr/ye1jOP0bndyBkeKexTNX8yhHUO+6Cu2vG0XAR7
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_041940_845060_AA445670 
X-CRM114-Status: GOOD (  12.36  )
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

Hi,

I propose the bindings to go through the Samsung tree as well so that we
can match the compatible with the schema when pulling the DT patch.

Thanks!
ta

---
Enable GS101 TRNG support. It works well with the current Exynos850 TRNG
support. Tested on pixel 6 like this:

10141400.rng

1+0 records in
1+0 records out
100000 bytes (100 kB, 98 KiB) copied, 2.03619 s, 49.1 kB/s

rngtest 6.17
...
rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 1000
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=380.570; avg=385.422; max=386.964)Kibits/s
rngtest: FIPS tests speed: (min=75.092; avg=81.784; max=84.771)Mibits/s
rngtest: Program run time: 50908949 microseconds

To: Łukasz Stelmach <l.stelmach@samsung.com>
To: Olivia Mackall <olivia@selenic.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Peter Griffin <peter.griffin@linaro.org>
To: André Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: semen.protsenko@linaro.org
Cc: willmcvicker@google.com
Cc: kernel-team@android.com
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
Tudor Ambarus (2):
      dt-bindings: rng: add google,gs101-trng compatible
      arm64: dts: exynos: gs101: add TRNG node

 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml       | 10 +++++++---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                   |  9 +++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)
---
base-commit: 8ebc2add3e2d076adc5cc3e8c9bef268f7f1cb31
change-id: 20251022-gs101-trng-54b710218424

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


