Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D861C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=; b=3iVkbElawhWoBl
	05vDjwauCPFBUmCuft7nkFyNkqDVEjxDyz9zSLpBpkVCtNzgP3/tdhXWgUHXElkS+EB6jS0igf3vs
	nZqOagqelvcU0TU1Qp+hKtxC2pvddCJBhBBjLSjDVoYz3rBHo6n14DnKYWcvEHzf8DgWV9fvDVw3+
	BGp0bLcZ/nEBE1pP0DjuxYJcFOtKjsSsh3E2ZD1rCv7LnT9itSl+Agvu0m84bWHd1QPG3I5HDter8
	kRjLYBJjMfhtG5F8nXrjzIDef53kaE6MOtL4NUaMoSMUZPAoIfbpnuF7qpEyuX/OGkeKZkxREKIjB
	G2W+IhFpmVgcE36+HROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwe4-00000009Pg0-0GMV;
	Wed, 05 Mar 2025 21:51:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwX7-00000009OR2-2hb4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bc526c7c8so4314385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211044; x=1741815844; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=CqwrZNSN6E3hTWw0vJa5Q7U0yBuTV8ojYJwURcEiFwt+QwiFUj+2+2+T8reCBZ5+ln
         xR9kQat9jGp1sxsnlOrmYEIw9ZNcjV+couF/4HpmIjk7HOXANa/KQRXJGH5yU/jHXplK
         4PW2Kgo0vhz3xk3jPPwOWZdW8so9BljTPC9xnKZbxzHXRNDtWU2+6EmJoQKHXf40Hmvy
         rsXT/UFRK86wtV8dOvShx6x0oK8uD0z3+cpLgppoCxovB4aUUTVlQf3ZW7uyeo3WFc0L
         eVoGnOk72H77Ew8l+0Z1O7Hxe7TLd12KcUXaQ1sCBzxx9RJYjJ5B4or/qbk2qlsns7D2
         Exdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211044; x=1741815844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=et4sid/R6Lwh17ykHKVob0xvDou/BnbNU424L2S7HSt6BTDy/hzBlmVcVW/144/TIL
         VFD5m3FNVx9l4fOtvWLxjBEqaMsWYcuR/k6l9Gz+MYrraSC6OSwu+RAURODlmABAeFMm
         D8Rb8w4PtB6QCZsg+HS8SoGdtLOp6/4YZrCWnAnu80xabIGRZtxEh1W8wmyXdxpDVTQr
         fafQQs8NQTqbxUozgo/is61UT8iJ7n18Wq3MpjQBBbytt31cJWN8rWg9kQdr+d25b03i
         JSHfMkeSnTLm7hOlcx4cx+o4TEHzj9Dz0kFpREu2gyhEHdzZkexSyiQH9hdkFJurND4B
         5rHw==
X-Forwarded-Encrypted: i=1; AJvYcCXQgaJoOhvX8p9XFYMFsotNZdEKeA0sQy9vbPCtyQCVUpa1glL4LZfweg0EshDCtMl+rFRX6AjdhaQIChUf6E4x@lists.infradead.org
X-Gm-Message-State: AOJu0YzZgcIEDSVxshIr+FvJ8+LFoljewZgaI8+77jIZGy9B6wvJSw4C
	DVWjY/4fzpHc3vPz31Up8eiMIGLkWrcvMdGy46tE0husWPyHPdD/u4sz8mZB6aQ=
X-Gm-Gg: ASbGncuY2y1nu6f6g2mSLq3BkVWYT1tEM0wR7LFnto5hs6D5mGDGtWItoHCKC9bUQXU
	h/zP2d4uzbZvNMu3QqJg9/6Vnw6333bqBmtTe4M8uV4nFd/baglF3ADcDP+/+8wLHoBScmnm71B
	87NY66Shtl5j7AeAn3BbvTmRIxSdeL+L4qhB/osgN/7m2A/xW5O5lc2Tqt0RqjihiyUFm66m8uk
	gbX2bUowdxkBsNbY5IaWjlWyW8ymOpKii7rw6rvKTLgDKgTPc3hzNATDHpRTx1do3lRH3eJ2B8C
	IO9ep33AwQtoj9dFWW0oSyVuanhzEcXZUlhP29YTHSG4ZRZ6F3TXjeinCE75
X-Google-Smtp-Source: AGHT+IHgrPk9LjMSTCWkz+mX87OREQ24VNtJT8cUEPQ3oCYGUFwwbcrSWBYFeLv2csIBnT9oc+2Bmg==
X-Received: by 2002:a05:600c:3b17:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43bd289418amr16472395e9.0.1741211044238;
        Wed, 05 Mar 2025 13:44:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC/RFT 00/12] clk: samsung: Use platform_driver_probe() to
 avoid __refdata
Date: Wed, 05 Mar 2025 22:43:35 +0100
Message-Id: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfFyGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNT3eScbN3ixNzi0rx03aLUNN3MvMwS3ZTEkkRdsySj5BQjEyMTA8s
 0JaD+AqB0ZgXY7GilIDdn/SC3EKXY2loAauT3JnQAAAA=
X-Change-ID: 20250305-clk-samsung-ref-init-data-6b2cd242409f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k2uk7mWRxQ/F2xpJkIMGDONFAxPuJRwjbtFcXicz32s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWW+Fg63DDLT5RU0aIcpUZH7IqA1fov1XeLz
 +W3BI3/CAuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFlgAKCRDBN2bmhouD
 15JiD/9nXCHXFQUw697F9/fNVIrPcbtmW5NHXZFybOF4f2dai/whUloBo4qQReli/BYWu3nCW7X
 rpBoYsgwNFjhePzvOR1spoSH5lZFLjpsd5v3kzU2iK1UwSRQJ5kY9yb9zt7nS73XjVVl7QUMrgy
 6X7hTB+6H6Rbl5AM97J49zzn6VF9i7E+DjDk2MecDc3BVeV+oQICWwdGPR76byLR7ElchPtm4HP
 cRiGElNBl+kov5YgrVHo3zB0cypidtk+kc8Myayjt1ae+iMqkBcpQslPyI459B7zctZF+GTtRBW
 e8D4wiDCB6Oxw/4E/WgMzLzVfTYf2Ha7wPLB2OkbVw15JrxDjrImnQD5ZPLTGI5clZq73IDilhT
 77E/+r6D7xhgfQuG6m4/oFQwxP/If3XSGO3th+jecGiMfOcb0ykFi2FeoSFU4gPLrXTQmGvKXQP
 gBLPzgEx3O+G1aXks1/uR01nM6YG/fmD/VBHNXmb/aQo0w0YA1L7Psyd5ROWmzJRd22WT3Jdkoz
 IW+fiwz22v9mbsrPAvrX5Kbpd5knN14KOGJZdsgYZXh8SeVGbqpEhaVRl6gfdRwoRCL9o5Kx9ni
 KUc+YqMmu4PFtWAHdaN0FIjNdmzgRf23DUFuAVd09qgz79Fyk5+Rmo9y7dsHehd7qmhCTsit58p
 kCPSQM+VzxaGNFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134405_676378_FB618ED6 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
and it caused weird oopses which even KASAN did not narrow. Probably
because of multiple exynos5-subcmu devices?

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      clk: samsung: exynos2200: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos4412-isp: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos5433: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7870: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7885: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos850: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos8895: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos990: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov9: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov920: Use platform_driver_probe() to avoid __refdata
      clk: samsung: fsd: Use platform_driver_probe() to avoid __refdata
      clk: samsung: gs101: Use platform_driver_probe() to avoid __refdata

 drivers/clk/samsung/clk-exynos2200.c     | 7 +++----
 drivers/clk/samsung/clk-exynos4412-isp.c | 7 +++----
 drivers/clk/samsung/clk-exynos5433.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7870.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7885.c     | 7 +++----
 drivers/clk/samsung/clk-exynos850.c      | 7 +++----
 drivers/clk/samsung/clk-exynos8895.c     | 7 +++----
 drivers/clk/samsung/clk-exynos990.c      | 7 +++----
 drivers/clk/samsung/clk-exynosautov9.c   | 5 ++---
 drivers/clk/samsung/clk-exynosautov920.c | 7 +++----
 drivers/clk/samsung/clk-fsd.c            | 7 +++----
 drivers/clk/samsung/clk-gs101.c          | 7 +++----
 12 files changed, 35 insertions(+), 47 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250305-clk-samsung-ref-init-data-6b2cd242409f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


