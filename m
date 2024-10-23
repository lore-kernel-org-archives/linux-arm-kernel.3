Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8712DD2E039
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF5Xe7iQLYb35u4BeSJAYQ0TqAMFI45ZoGY+KeHBwBw=; b=VMQl4TTUf+dLomYUkNZYWVg2Dc
	EnLv8paM7Nu0u6XLmUgGxkneDB1N+J68X9SP+cuOakRGsQ9oOTBYrgrQjjoLoeSm0mPA3wCikWALv
	MBuw7/L3YINEMSPvhD0vtMGZ1iMb4Jslg96GGCFI8KpYxt2Dil1tTGSv95GYMMk145SPRS7yIGxlZ
	Tv9muvqD7YHMeOxVYNVwQxP+OhvZ3E8vLlxTYjBPrWlNx3MmJqprzzSK1L15GYdXj2/M/7Ob6y4Uo
	uFMCaivgjnuF5FG317EQnbGl0CMg4Vg7ULNclWx+hUmr/nVq0b9z3QueNZOsvMXiMZfhkTNDGbdiS
	z3Gf84LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XuX-0000000DqUC-475z;
	Wed, 23 Oct 2024 09:44:13 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XVE-0000000Dkry-1Z5w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:18:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so4720832a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675082; x=1730279882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF5Xe7iQLYb35u4BeSJAYQ0TqAMFI45ZoGY+KeHBwBw=;
        b=Nt9XEKPlVZtycKePay0s5swJA+CKp+j35ritR3/foqdjushI/Vv41eQq1yUe+KJSH8
         wocVTE3gK9T+ELUQyx00jCblvT0tJpWUqpIELAVHux3n9pETvRUf8EQzhCflmlCUXfyW
         m0o+OP0SejbOxtvGSezRC73yaKXThuDpYy0hDQrhAqmYUFnJ0RKuf22ZMAryPYezSQ4H
         pO5iK0k6EXbeUuNXdZJx23lWww6dtMdSPJiFPzFNfalgtrcc/0iLg2WyCAzmjngJVNc0
         IOSLAumGE5YcJHJMLqTou95pN3QPBumDmDprEnU/mAOTStJdpNrDcgVDafwa0ZgUUXmf
         kCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675082; x=1730279882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF5Xe7iQLYb35u4BeSJAYQ0TqAMFI45ZoGY+KeHBwBw=;
        b=O7HTeWVHar2YAMrGcwhwcpIolOWCl+UpHpBKW/cwlYWHsfvXKPwqh6WNnq8E0duZer
         +3Iirc9za81W2ASRiydZ0/DSt2+5BlmbkjP7J93v/vEzrnMu8YSPmrSZ8+nuzRTBaDnN
         rv+oOKlqhGl1GyhtaCRojp0RPsC1q1ncISG4+hrrPr6kZ82SROxbzw1B0c1fxb4gJEU0
         LycAVCxqyrlfiJzv2sxkvbTHgERrMn0DT3s7rAITZJkBhoO/014ejozrDAkityQ7/tcx
         ohzGM05hLbyVytWk22gXYKF8igfFPgSueqsauBxBqT+AclVxI9b7tXjMg2y3//i/WLCV
         z7SA==
X-Forwarded-Encrypted: i=1; AJvYcCXutmmQVQ79OzumVIw9GJfdHhAb4pB/iSEY1FiH3MUOtz26IJVUaH7Cz5jLcQbpIOQy4deH9N3LSM6qroUSJ4m5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf8g1JssCukqP/GgpTpYgjycM4zue8L4IAnwVe9XMyEzlSIT16
	WzlWnR9uuBYQkrbHAJGCWuOepZHnuZXe+5VKvJkMXSf1kAbd4RTr
X-Google-Smtp-Source: AGHT+IFZFkiRyZCTTOggy6qIT3PwCb7eOhX/wvPrsD6BpgLkVRZY6bAlpANckZmH2/IzBf+nDKpzYQ==
X-Received: by 2002:a17:906:6a28:b0:a8d:439d:5c3c with SMTP id a640c23a62f3a-a9abf851b96mr178607566b.8.1729675082225;
        Wed, 23 Oct 2024 02:18:02 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:01 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
Date: Wed, 23 Oct 2024 12:17:30 +0300
Message-ID: <20241023091734.538682-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021804_484211_784FE39F 
X-CRM114-Status: GOOD (  10.74  )
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

Just like most Samsung Exynos SoCs, Exynos8895 uses almost the same
Multi-Core Timer block with no functional differences.

Add dedicated samsung,exynos8895-mct compatible to the dt-schema for
representing the MCT timer of Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 774b7992a..02d1c3558 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -33,6 +33,7 @@ properties:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8895-mct
               - tesla,fsd-mct
           - const: samsung,exynos4210-mct
 
@@ -133,6 +134,7 @@ allOf:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8895-mct
     then:
       properties:
         interrupts:
-- 
2.43.0


