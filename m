Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC12C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mRl6BLXH5K84xhTJUJU2+Misv0b0a4XYQFm5AwA7mY=; b=MoXe48Drh6E7qM64LyhYrboJ51
	DUV48Oy5ub4O7rwo5QCPJANzQtdhfv7LYDpBZC5M94v6XSUks7QYwb55wrUCZo9abGS4T91A6g79h
	9FNBVh+RnlDRoFmur78xeAFKZGTHWGoppMEEYMKYCXKQWZLIMVtADUhh6At+VQRdIUf7pGI0zjmev
	c3VzlQlHfRtQROM5BZQPz6n7OAK8ZI0SXH05o6GjuJFDsmBPvJxrnpiSdN4G2DXdSPKmQ1LUTY3J4
	L3qcPS7ntpQNvn41GpFtHRHekx6y9fFNAGMulFrCuubIPcJG849G6D7ChABZUww7AuJHiWCazgAWD
	gxau3KxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K18-0000000CAiA-2gdL;
	Thu, 17 Apr 2025 07:50:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JxW-0000000C9rV-1SuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 07:46:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39127effa72so76175f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 00:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876013; x=1745480813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mRl6BLXH5K84xhTJUJU2+Misv0b0a4XYQFm5AwA7mY=;
        b=Bz4yH9zwJlGHYXGprP6fxwowhhuGbZstWqebXkix1KPCAbVEnaYAPYvs9azZxA1/qq
         sWZR4zyBE7IaIWAZXYctmHp7vXdG7Cy7s6aIKR/l5OH/MXGpy7AozFXM0RWMhbsX3se9
         FOgFS4INIrWYwXvp9Jy1qIYvfUl10XNYIc7spKQkiIRMEpf07/VSpBWy6lWndYhRrS/y
         sbdVO9dvW1mja/1YGBLUJ6zhQJM2tWzmQ3hbrvelMHLaN/d1qdQGOecJl2bNF0fdqKP1
         QW7PADgkHAKaIuXLJLOKt7YcZnXz5Vn6JlqAngBlNsLNDAbJGEtLWR7SbUKfkXtjhohh
         zraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876013; x=1745480813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mRl6BLXH5K84xhTJUJU2+Misv0b0a4XYQFm5AwA7mY=;
        b=AsAazp9Xlc8unr9/viBHys+AMTJRhc6cr1pT3Guz6rpoKJnLZjoH8wNzpxJ2NbdJCk
         BzOwqUc0CNHHLAELRYQdREJL5q23YJ+ErjvWI94v1DS9aJPFULbh749jSatzfH45js2u
         t0F8ci3VLDPVc1p4iGK4bNG4f9AGz6uLqXYNDM0T6MveEc3cCXkuZeNMWrXJrKIA0dj9
         PamPb4ZvbW52GeIo+WuvHX3UUtUxeEiXWspcrqZ2JrTdGsQrBjGWUDODbFSeDefXyi30
         D+BTpdoep/UJ3ROV3cELCZ4h2TtT3kQDs8R0Zixoa10wF1cznYm7HR2vS1i2vATjR1oh
         A+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXkgvRXRF6pPJQLFCfwMvXrRSlDR8EwRRFOg4sVVBqykUMwZh0pd1PZfSX9+ftm/8iLH1GBgLDO9hh/PVArRxHp@lists.infradead.org
X-Gm-Message-State: AOJu0YxOIqASSwjaCX8ePZg9iJIiaYbd1eqW4nr5voFOHSfZtby9w5Gs
	khMPBOAZjSOFae8jbzZa1gxk8M+UDndBKDJjAzdGhG7cEF0hcWk8bBzyYQQy5xo=
X-Gm-Gg: ASbGncs7vnMJA1pAAZjtDPmzRtw24Zr6CZr4avaQgU17BFLcrC2Fw+I8ePkxoZphiT9
	3dW5wJ/yHQGQ8nXGlww66aw/CEPcKV3wx0HVPit7eu5ABTlWpZQDNbIpF9btihJoDL87mgkpChB
	8W7DW1Jk3nprLJzzwzdprKfMuonxGOyfjYcH4b0Y4hpj5d38jNB1X5q1H2YJmk5v/vLcvagZ5GZ
	t4PoXDWo6Q+lljnSGQKN8HQjtZO7MKPjJwne1I3hMvoFIjmqBS8L6s5yZ5BWkxo1YAEAxbE9lA9
	J7Ja3bliSGzXbLFZb/EOv1t/7UrTOd0i2e3tR+zPfJrVR0mYkTsT85InUs3y2Ds+w5Xl1LSQQTP
	5M1Oqzw==
X-Google-Smtp-Source: AGHT+IHLmIpfEcWfWbVkxDsxe2X44HIa3xR8bweYVogbYXiAiMnpleL2yNH6D8LfGendAwXp5oxeGQ==
X-Received: by 2002:a05:600c:46cc:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-44061eb67a3mr8079575e9.6.1744876012631;
        Thu, 17 Apr 2025 00:46:52 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b526ee9sm44037705e9.32.2025.04.17.00.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] perf: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:50 +0200
Message-ID: <20250417074650.81561-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004654_393604_248E558F 
X-CRM114-Status: GOOD (  11.01  )
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

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/perf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 4e268de351c4..278c929dc87a 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -202,7 +202,7 @@ config THUNDERX2_PMU
 	tristate "Cavium ThunderX2 SoC PMU UNCORE"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
 	depends on NUMA && ACPI
-	default m
+	default m if ARCH_THUNDER2
 	help
 	   Provides support for ThunderX2 UNCORE events.
 	   The SoC has PMU support in its L3 cache controller (L3C) and
-- 
2.45.2


