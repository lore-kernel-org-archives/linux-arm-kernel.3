Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD08CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3BkkNIM05MRslMrtDcvAYAmE9IErpoiznLkYTr/hTV8=; b=Tc2FCfZXSzaOL5
	6Ag1aD4tYtvSUtsUvPjz3VPJJAu7uuhUuV8WFeHgzHT5tPdwh73KaRCxWWWLFCsrk6+9mkpLQakdC
	V0gX+SfZBW14anlnMRHEiJsJEtIUyZbkTmVYHHsv+5q2pI4Kug2Po/F/nQQOLp/WsPZugMe1ECuhH
	rzPHdZlhkd0gpmaebTQoQHkvInlQuUHlBO/6EtJbf8mc3jdjksbJMDSXdLCxlRVBmdeQ7i6It0FCx
	gt0Bvv2FVf6F38xq7wyriZnFOlg5U+saYlpYMxsBSdYGHGu3MPYBchOzLAfyWAakI5DHlJwv6Qc4t
	wEv9T7je4E8EcXP5oWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLwT-0000000A9RT-1Rpg;
	Fri, 24 Oct 2025 17:51:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLwQ-0000000A9Px-27AX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:51:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so21739845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328264; x=1761933064; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BkkNIM05MRslMrtDcvAYAmE9IErpoiznLkYTr/hTV8=;
        b=g7PfCcFUeJNpegxk94QG5nKiHzpft38hc4K3gYTPJCN16Ec78u4IFUDzprSsb/sgqA
         Qe7oo88+DG7YnWTu+Zo45M+yalJBzV/p4zeZAAZxOESizL365LewDpguPoi6mhPSn74T
         4K0IWH4OZYWmwD2W58Ud/MvoB37vF5XCbG+vPR6FZ/tFmIi4dt9sxdgibfJFDQMlMYU0
         XaV3PMfMfHFdCXxHSLj3yfyP2hjCUaRNr700X1goZkz7Q/bsb3dbHR0NRE7DdLhsCAYi
         fwo2hPijPNkkvltg7dtZeji+RL8O+82ukrcdNKLdBpim843rhFyjZIQlY+Usk9dUdQmf
         N/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328264; x=1761933064;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BkkNIM05MRslMrtDcvAYAmE9IErpoiznLkYTr/hTV8=;
        b=tN7OU8ltDSd97HCdeFpaFLsyWSB/W08kUsyAVvcFyFq/eXalg9m4uYH32699sNNxSZ
         m8xJl+oa6ZpESL4R0fD40FrPAbA20yYzh5ibc0dl/i2OV1kwLvCekzfsjl3lK1FEDbfu
         F16/uQxk+m+UhLh43kG+7nSDFfj9rFojuKHvhThDGUjSvYaF+elrM/J0isR9cRJdOCJI
         0bxhtIkE9RLUT6GOR7CeyJJJOnIAvS41o/J70EN/4sYT6qNF7ZT9+rmPm1aN/5BfHHdp
         kvsOO+eBiv3dIY5AMW27/MF6usBGjEyNEvIHVMzBrfwtpj1ltxovze8UIvlyoGGVH070
         Lyzg==
X-Forwarded-Encrypted: i=1; AJvYcCWdsKCygHbV4DOvem/gHqAaHz5BUfIUXHY+KQk/mhcKXlTJOyuKZAGgl73fqILs21rphonXc19jvEPi9ZizT+Vg@lists.infradead.org
X-Gm-Message-State: AOJu0YxfzBXph+TRnnNCJEmLhK4D1gg96s6hqetRl4v4ElE0WjEx4uON
	w+VKt+xadVTLwj78UhE4pl0BaGvKS1T3aHtdbbz9m1lgKfs8lBfUQNqyWSOhRBjJNH0=
X-Gm-Gg: ASbGnctALU+KD8wK0tswYY5p2bNX2k+fmVfwCrQGVXPXLNS38kc0FrRHXCZZfEOsk1+
	nVypuRPWd91biXrQUmHOiTLimm5PxDa8Xk7cPEmMYsMoZwQHUDGXLw8FDNRN7EsfEu/1wnTo9z9
	xoblW3TEVA7XRenBZFelY5vAZfzcyLxtnoSkwBl7a/Y1y+4cyf3rR16ixyZBZevOQTmUHkE54Vq
	4RMt/ptisKsLkokNzGpDiEFWiYt4Lig6XmReq8FsIhJaioCLfN4UiEeAIsLnSwmT9tpN3SL6XYJ
	7n0qXjrgrEqMfjEQXHYjjBhKRFGZ1Ist/G8BEKoEkVaZzO2zZELR4L8Ppck/YMzBSEWU5P1O3P4
	SfU3CbKgX3unhcO3VhTz9S1CcG2abwavPn8MuIQUsvNjjyi+OMUqWBS3sPW3v3UdJ3qui8ByCDl
	X91l+KaXlwPNjcAnUz7T7iqbdJ4VKb9lnFCgmY26whcPRysyZHcrTFumq4sAtYGkI=
X-Google-Smtp-Source: AGHT+IGuCTB2VzxXr4BdWdJgj04b2GPHh8io8QNAnLWecfk99iG6qqbQtTimEzngfZJQ+vUUG31i1Q==
X-Received: by 2002:a05:6000:4706:b0:3d3:b30:4cf2 with SMTP id ffacd0b85a97d-4298f5671c2mr3093463f8f.19.1761328264273;
        Fri, 24 Oct 2025 10:51:04 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7622sm10321900f8f.8.2025.10.24.10.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:51:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/2] hwrng: exynos: enable GS101 TRNG support
Date: Fri, 24 Oct 2025 17:50:59 +0000
Message-Id: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIS8+2gC/22MQQrCMBAAv1L2bCS7pKZ48h/SQ2zTdEES2ZSgl
 Pzd2LPHGZjZIXthn+Ha7SC+cOYUG9Cpg2l1MXjFc2MgTT1qIhUyalSbxKB687DN4WDIQAte4hd
 +H7P72HjlvCX5HO+CP/t3U1BpNQxoPc3WXZbp9uToJJ2TBBhrrV+rSZYNpQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328263; l=2560;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=F6iAmNHD3Luf8UVaQkuxniLBvlzU+vxigo4O0hw+ZNM=;
 b=ouVjCdPSl7fPMeHYeiWolPcUlNg12vHEoXqNjHhaXd63O9uks3zaSartd8eLZeXLkrXwT5cCY
 XNmjsPndu2xBZSBSz3ao97449DqyuDNw4HpVv7szgd7EV/5zBSkdi4i
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105106_635440_79DA136D 
X-CRM114-Status: GOOD (  12.40  )
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


