Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E1Cw/0qGeG89S4JPfX/kPvD9bz7ebzHdRsAEGAL5psg=; b=ISI9U8Mp9dvH/q
	If1dOblBhYXLXV3tI3rCGegvE2xbT92iNRWGQ0xbe3pkmaqb2uC5QfUsUe5o2GVzsBFnjrI4WMK/M
	Ccw1D8bEKinwo1BHIcSsil+CRqWw06eQkvjj/6VcAmJ2CShmySgiqUMZOMGF2HpjpqBjuwI285TIC
	jM0k7a5S/NxaiP4qUI6flzXa0GTK1CKB62MTKW9eC6O47BaC59NLoA6sGsPkl8qa9wE6atn0YvIfz
	Y7pGWqDIwpYY9jnDZ9ORuV8sZ/XN53VNL5Z+vXktCBUi0BgFeJZJbt64pMCVCOm5qq27V3up5OT1E
	bha3X8nHklf4XMhj9pKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM35-0000000AALz-0leL;
	Fri, 24 Oct 2025 17:57:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM32-0000000AAKt-3V59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:57:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-475c696ab23so14022915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328675; x=1761933475; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1Cw/0qGeG89S4JPfX/kPvD9bz7ebzHdRsAEGAL5psg=;
        b=FZq/9j5WXsquiwokax+M5y2Vd92SGvSiJFzQiPPiUj/wA2LiGltnrjbu1dOYIIouiD
         /e3xjPfdpCZHShJJF4EsTjdK2EblnHc1KLdDlEElUZpZrJMWTR30GZYAo5CbAzLJ7kzq
         qkWY4tZZouqHRf4G2sAGmxR4fjeT4Po4WWBkc5XhnR1qclYBUAzXrS6A5RWQU7dQGfPg
         6+c9/4G716DT3zkfsULBBR+AZIfYZVfPBvckCFf7AQDnXvWj6GH4of0oCgcaCubcZbKx
         1BNtUrPXM8PtaXp3DLneLlbsFNIqZ/oRtol20mpo/dQ5KGj//4rEyIYjNneGwlRb/V30
         6dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328675; x=1761933475;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1Cw/0qGeG89S4JPfX/kPvD9bz7ebzHdRsAEGAL5psg=;
        b=M3neqT7M1obxMuAyoAPTXrZrAqU8tRoPsFL6TBjzTzIG+TD3gV4Xgnu706gJxB3I9D
         6wR0xg0ewVUdtJJZbNpwgGjCwi4aAtE6rXVSxfE38imZj/2ip74vVPahmS24u7hT106q
         kY+WXzNlAXzr1dGMmFBQ0DP0iaxGC74a0sKAi+4j1oXOOLKEvYScYn2t+aXOzFogGH7S
         iMAxwthGjJbNEFD2zKIkFx11bbAXiVFM/m1S62bGNRV0xyFt+Dbb8TK6o0MPwqf5B68v
         ZhetSbYWbI+hxi7lokIbIY1jdj4PZl+Irav2af3pJCXJKrRHqIoFzm6TYe34H1AeWS0c
         +xTg==
X-Forwarded-Encrypted: i=1; AJvYcCUx6087Y9lyccz5WEPIp+h3Xg+VBlFdaKuzFbXXzj1AsYtQHc+n3FJY3c32lXo9l8KgbZcPPYZb/7bn0Hkg9ROv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wxvFr0RCeDHymj2NDHLCl5nbXxgPF8lHVVseb97IyP4tSRvR
	sG7FHKstxH/981vIYsrEV/sPbdvnPaSP8r799aFu/D8Klv/InFE1gdg55C93WJm0yRU=
X-Gm-Gg: ASbGncvLY3wMVAHxjahdxEN9xiLxe0Qz/ugrj3rqVRif51X9/k3DgMQYG0XJxx9rfKe
	2uC4gymCLiki67HFXvC6RthV25dPFJEDW6vCaOjm8rJQg77GkWoRueHFjfJwOVDZZZWN6rezVMZ
	KWqDXoT4bTyaSnTrqgBb4E1h1GNaTNZvQLUY4qrhnDmxa/SRKFF0VvJcVj/OxZLn3uHhNbC1wII
	wulW4Lzsk3cyyUdQ7znTTXupXZCIKPYaGDhtGzM24cC0S3zYFNT877Gx87kR/e6ViNmJZ+7hVIq
	NByaOmWMeSyBc2F8OqQo6idfawx7LHt7k8Cd4F3W+NW1HfMon7umTOx5TOXf00DHLg1O10Abjbd
	UTH42IkXKc1BFIBn8PzgjiMD9jDNhHr+0BxwLht5OcHb4EKTdkrN0XvQBnT2oaVwemD52/D1VQA
	zCer6jilt1HVeu0xagQrXB60uVynSu4+/DTR87qiQ2DlYLFHL0ZDSyv1IdNTTXAGEqeGf0mEM5B
	Q==
X-Google-Smtp-Source: AGHT+IFQHKbKmCiA6JRzajPPEiW4bwewZWSGp564qjJA3Umx3RZWFZ3rplEvY0S0p6BMt+4hblU9Nw==
X-Received: by 2002:a05:600c:468d:b0:471:95a:60b1 with SMTP id 5b1f17b1804b1-475d2ed6e11mr39293175e9.32.1761328674816;
        Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cad4c81dsm104062465e9.0.2025.10.24.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/2] hwrng: exynos: enable GS101 TRNG support
Date: Fri, 24 Oct 2025 17:57:33 +0000
Message-Id: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA6++2gC/22MQQqDMBAAvyJ7bkp2jTX01H+UHqLGGChJ2UhoE
 f/e6KlCjzMws0Cy7G2Ca7UA2+yTj6FAfaqgn0xwVvihMJCkBiWRcAklipmDE43q2uJQK1JQghf
 b0b/32f1RePJpjvzZ3xk3+3eTUUihNbaWhtZcxv729MFwPEd2sH0y/bbq0FJpe+o6jTXRYNShX
 df1C+e9l5fhAAAA
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
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328674; l=2729;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=4HcI+xQ04cvm8dfroX/1IFzvrIibcJujgddriqoyOAg=;
 b=PbJqPExUQ4Ee5g5cWPlkn1RWrSJoYIEeJgqcOA1Db2BPtLcVch9Uka1kmOFbzR99vIa+3lscT
 drwax3OOUNVD0O56U4RWU3E3zl342R3GljuOYX1mWVzwYZfNnIcDZnH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105756_905509_64293EED 
X-CRM114-Status: GOOD (  12.65  )
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

cat /sys/devices/virtual/misc/hw_random/rng_current
10141400.rng

dd if=/dev/hwrng bs=100000 count=1 > /dev/null
1+0 records in
1+0 records out
100000 bytes (100 kB, 98 KiB) copied, 2.03619 s, 49.1 kB/s

rngtest -c 1000 < /dev/hwrng
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
Changes in v3:
- dt-bindings: put 'power-domains' prop in alphabetic order
- Link to v2: https://lore.kernel.org/r/20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org

Changes in v2:
- dt-bindings: add power-domains. Collect R-b.
- Link to v1: https://lore.kernel.org/r/20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org

---
Tudor Ambarus (2):
      dt-bindings: rng: add google,gs101-trng compatible
      arm64: dts: exynos: gs101: add TRNG node

 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml    | 13 ++++++++++---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                |  9 +++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 73f7017e663620a616171cc80d62504a624dc4de
change-id: 20251022-gs101-trng-54b710218424

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


