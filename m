Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD89CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RXPt5HpxBahR86o/HeRzM3lfXAfvN85/ZCFAeD5ZDhk=; b=2586KFWZEcjmKt
	lLQKMsogfbkL470d8pq1WFBKb7BpbZ8fWisRiPlNq40JSYsUb0E4Bxqof68wa7SSOpo2vmNkWsN06
	5pi2iPX6/90GsINvIpWg+EEWimMxTsGxCiSEiztB/WGJ5xNHqVe3QBBKn8yDL95eZCsA5rKnfQxoG
	A0dYYGTfbFKOgCbCM6y4O6R4LmE4AVECteEBgT+XRAALjAEobBXsYTE3TQjJPpq42M3tRtLGs9YKy
	4gq5UTPwO6vGCh5uR3FdVgPpeUVHC5ONq14rOpgPq73xNT1Tm7UTteosU3ytN5hc3Nplhh77KSpXJ
	eKhyJiqX98XkQVLtj96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLD-0000000Cte1-1j8J;
	Mon, 04 May 2026 10:15:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqL8-0000000Ctaf-0iBw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d734223e4so2235038f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889747; x=1778494547; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXPt5HpxBahR86o/HeRzM3lfXAfvN85/ZCFAeD5ZDhk=;
        b=bKPuR/eCm6vIrSLwB2v9W5fu6nRYfXPzIpHkrmqSJMdrDf/BrNTSPQ+GIJz3KoS3Ss
         HJC0mdKUp1SKdIDTzQV5wosjCkjJsgL7z9s7Vk143A2CHHms923XOcKEfOM2PtDgTR+S
         080LRQl3ovaNkHfg6rL50rNI8tG7sEPp8xx7tgxKHwx+qCdmKP70c00OO8t0yQqsyjVA
         9HdeuqnitfQeO8hLDrhRN27t+kFnk2A/XzTScNi+cGmf83Yyt9Yi26abH8irmVWI00u0
         444a81aiUgtZ0x9nPEKWYxLm1mSAH+A3Yx/CLNGiw6njUUw+X7CzOreAVYIwcUIcEKVW
         TrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889747; x=1778494547;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXPt5HpxBahR86o/HeRzM3lfXAfvN85/ZCFAeD5ZDhk=;
        b=RM4ebATPOVlMtj02G3hz2Hsiz8dutswXeowfksK1fbm0Y+PFUxQ1DLOFf4XD6YjmRb
         eY9VCKhl2WZUSRzgtKLxM8N2Eej+Cwpclim4ocqROFcGn0i83O3kf5GGRUJfEHkU+2qY
         trU6RKuNkVcLVogT+7J6rM4khV73QORxTc0dmTNLVzDCTQb6Qf7xYhXDbnZhT7jwjWcr
         E3F8uGMqG4iJSwdgiRbPnXAktXQRdXxwS5LVXiBgot6ONch8JgV713cT5q0h7ueDDYGC
         l9jvVw7p5ZXVmtzQBuzi7diqW9xB67+oAo4lFI/VH9BxpOtaG6QqO9Oplpmmd91ek6cD
         1gww==
X-Forwarded-Encrypted: i=1; AFNElJ8RQ2S2J3sTfw0Jaepy95F0+4uWOYAt+r9JSkHmW3BYRTVS3oe3+cqxr1EZaHhEGa5M8mpTlDRxnDCcFR0AKip7@lists.infradead.org
X-Gm-Message-State: AOJu0YxifnOAfSKH6gFZZgM5i+NUX9TgPzocdeoBK9/aEAJn5RaTN7iJ
	++O4Dq3z5ZzbZ2OnH5PQKdGn5BoGZ30JF23qztD1O3Tojvzxj3bEuUS79PHGV+iEtsU=
X-Gm-Gg: AeBDieuEAImrcCvxJY3DwNqs5zoNDupIKGsW6E3yb2VW1ey7KbMP+3bV8Ny0ipZbhbc
	c4w4k0LqNnaobaH0hlh5dWQw1WjAM+t/AcY+On2ytYe13bRXbWK9E2sQGuWU4ca1qHaHpu6CHUa
	ZAWbzZXrJL+/VELt3B7Gkr0KAob66ymbfZ7XGmQ0RMqwgvqouH5I4cALVSuOoWx1xzi0WwALS6L
	+9rcb+t0zhogkR51yHhFj1DohHXs8wO/JQbSSKRycTwvfVB5kIYv6fOtCWy6d1G3PrrskEpUNjc
	lUOE3Ym5Nghd526/mSU36/a4PiNbmu96tlS079uxq7p6cKtc+PehzlT7nzlZ1DNIWMjWVv4kokS
	1PpKGZh8uW6j5bmOQKPALLMjpk6+48uX572KRdd0J2P2wcPF3YQ0gEbr2v5wgxJukt1laztsEUm
	BBPs+S4XZG33KVgXGZ/o86y0cydSmlBEb2wBeAyFoZA7gCBFzpj74+I8IPiaE0RLcOP7OFZ1kNd
	HwGWJ6saLPZxAhYTg==
X-Received: by 2002:a05:6000:288e:b0:444:2db8:d07a with SMTP id ffacd0b85a97d-44bb34e62b4mr14894990f8f.3.1777889747455;
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/7] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Mon, 04 May 2026 10:15:43 +0000
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9x+GkC/43NwQ6CMAyA4VcxOzuzlcGYJ9/DeBiswKIyspFFQ
 3h3ByeMCfH4N+3XiQT0FgM5HybiMdpgXZ9CHA+k7nTfIrUmNQEGBROQUV0PT9rYFwYadOjs3VG
 Pg/NjoBqhrAo0eV5ykoDB47qY7q+31J0No/Pv9Vfky/QvNnLKKACXlVRMQY6Xh+21dyfnW7K4E
 baW3LUgWbxpSoNKaKXkj5VtLbVrZckSsm6k0BVT2nxZ8zx/ALcAwh5dAQAA
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=3432;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oVghwXEaGFO+mpqTUByC0AmUIQGtr/LpRywd/Udsh78=;
 b=voi8crt+8GfhFajHco5uShZAg9TtsMgq7FvCTHws0Ox4uzv85b6/H/AKZ9OX/bnVGCNmN/026
 WSvQjnVhGfODLDt/Z2xQYjglqoL157mZFKileoL4u1DzIBywuhNloqf
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031550_382685_83DAE48A 
X-CRM114-Status: GOOD (  15.81  )
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

Fixes for concurrency and memory ordering bugs that were identified by
the Sashiko review tool when proposing the GS101 ACPM TMU addition.

While these bugs are genuine flaws, we haven't hit them yet, likely
because we don't have enough ACPM clients upstreamed to trigger the
race conditions.

These fixes can go in either at the -rc phase or as regular patches for
the next merge window. If the latter, we'll need a dedicated branch, as
these patches, together with the other ACPM thermal preparatory patches
will be needed by the upcoming GS101 ACPM thermal driver.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v4:
- Drop the SRAM boundary checks patch, incomplete band-aid.
- Split the concurrency and memory ordering into dedicated logical
  patches. It involved reordering of the last patches to avoid
  modifying the same code twice.
- Add a missing memory barrier in acpm_get_rx() to prevent weakly
  ordered CPUs from advancing the hardware RX pointer before the
  payload reads have completed.
- Fix a false-timeout race in the polling path by decoupling the
  polling thread from the global allocator bitmap.
- Use test_and_set_bit_lock. address dependency was not enforced
  when using the plain non-atomic read with find_next_zero_bit().
- Fix kernel doc.
- Link to v3: https://lore.kernel.org/r/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org

Changes in v3:
- validate more SRAM parameters and queue pointers (sashiko)
- consider/fix the acquire path (Krzysztof) - patch was moved
  last in the series to avoid touching the same code twice.
- Link to v2: https://lore.kernel.org/r/20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org

Changes in v2:
- drop patch "firmware: samsung: acpm: Fix sequence number leak and infinite loop"
  The patch freed sequence numbers on mailbox failures or timeouts. Because
  the message is already in SRAM and tx.front was advanced, a delayed
  firmware wake-up will process that abandoned message, stealing the
  sequence number from a new thread and causing silent data corruption.
- fix mailbox channel leak when `acpm_achan_alloc_cmds()` failed. Did it
  by  moving the `devm_add_action_or_reset()` call.
- new patches, last 3 in the set, they fix some more sashiko reports.
- Link to v1: https://lore.kernel.org/r/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org

---
Tudor Ambarus (7):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      firmware: samsung: acpm: Fix false timeouts in polling path
      firmware: samsung: acpm: Fix missing LKMM barriers in RX and TX paths
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 119 ++++++++++++++++-----
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 96 insertions(+), 29 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


