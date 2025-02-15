Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2916AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sOzHbiOoS5yihAuEFC/WAZMn5LqH9HEiJMUp2IVfaik=; b=EJvZqY6ck7egedRjKx5fQJgKPR
	Z4p15fxo+wGdukpCdaU9q1aAvcQGV/cZBKlxig9Z/dkLTVASRPnlZubY+j7El0Vvjo0JPu4mGIBpr
	pPA8383gy4QHb5l6WvmUsr6sUVImHSNXXiheV2Awj5f7yzw/IC3r9oBBUcLcgMZoXSFWgy6lcxJPb
	bxuSprFw4BZQlg69HwjZhnSyRTsy3XJ4WRgxia/RHlnATFFC//ljhg0p0ACRvKLuBoScxmxsL0I/C
	07z1Fxemklv35eiR7VoP57aaEn7gztGz/5lA6rWjzRm/xStZrXmIBtsV8TMKYlovO8j7t6vDudH+q
	PMkLSsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHTl-000000004Ql-1qI4;
	Sat, 15 Feb 2025 12:41:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHSJ-000000004GH-03uA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 12:39:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so17351375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739623173; x=1740227973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOzHbiOoS5yihAuEFC/WAZMn5LqH9HEiJMUp2IVfaik=;
        b=lb+qQqZxNr1x0uDOximFKIzcFq58pSxe5r5V7hrQDo/Nu+5bMHveWjUVniajK8ZMc6
         c22H1jaYMPe5Om7/VpXwLcDi4Mbh+4hCms8SJYqck9yQGO4iLi09LZfkbDnqvDtB6J0o
         uIQLe5jgAQGcEwXxtKRriW4WGxrnhHJlulRsP94HLkI3Z1yNn2fbyARn2UW44jFAT5k6
         tRwJytnI0cMGpnFe4judRbpkNtWqSaHYYe/5xftqrpHKz3HqiSf62pSxpl1oFeGdyzWn
         wHBV/Aml0wfblKIS4hzexYzIQBF6w4LisgNyzXA/gWJN6p7vvdy2VPiFAHw/UCd1CzqR
         UQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739623173; x=1740227973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOzHbiOoS5yihAuEFC/WAZMn5LqH9HEiJMUp2IVfaik=;
        b=OCoBtMz/6adyqDDsa0p1bsok4T9HFdhX1IDcZal59R8Qb13tj3dclk5BCWgRNQu7sn
         2fVR9VMb570u3TrCawp6I7q1hmjb2CdE15rIn8G0I8TGCmlX+62gQd03amCnP32F7Bzg
         /qJKvorjLREcH01cpZNpCSXGq26zd5EHZsRC5FBJ0sty30y6a/YIETXkTaCnOE15aNBM
         dmcxeMExbfkOpeXlYVL9/OG9F5OaHMlfYuw1wtryn7V7up0Dy/aB2T/+rWk0qJxPy73C
         jBrC5h4nFR5h0SYGR+mTkSGFuMSN7ZSjWr71TAz4sDqBcrQsw7h/tHCoVZS7MzocNhve
         0oNw==
X-Gm-Message-State: AOJu0YwWw+js03JuW+pZN2M9zEpihdKUxR1wARCgaVAa6x1S3BFGaYcG
	UTq3yQ8N16c6cXdgqFQ8BZQtVYgIiOf+68MejxbHnBXQt6K7ODknb4IOqg==
X-Gm-Gg: ASbGncu6w9/fWJdLRxmVpjjczeNrYfKrouOsBnwCx9S7m4o1RxalNVTlW/gny+/C/cT
	U1nvjgd/g19iy57nsDA025twRZdthwSA2INqVMou/2XHLXOWpMRgp3UZJiLZFna7KfUw0W94GWC
	llfBFNXqq6Moj2NxJa9IO1HPmdDMgqQ9xAKER8b0aynF6ma2zlE2xLfmN65nr56svSk7yI05hv1
	V5vGkSwomPbYDdRIOf60itAk4ddsMSj7xLQd4CnoILEg6bOekMBNQbi1KH+lRVO++L0tamlTid+
	Y8rlHnLbq8VV/uSQttJrZCsBVA1MqtWqaBM3E8W/J5dPtjMYcaMSRyodaV4nLHm+WDI=
X-Google-Smtp-Source: AGHT+IG7zNrA01xgjYEn/MTIJYOqGw1HZPW6RPoPt4xc17909V642AX/ilwKBKzO9yBWRkBEkSVrLw==
X-Received: by 2002:a05:6000:2c8:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-38f33f11861mr2472767f8f.4.1739623173271;
        Sat, 15 Feb 2025 04:39:33 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7156112f8f.5.2025.02.15.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:39:32 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: timer: exynos4210-mct: add samsung,exynos2200-mct-peris compatible
Date: Sat, 15 Feb 2025 14:39:22 +0200
Message-ID: <20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_043935_059147_07538763 
X-CRM114-Status: GOOD (  11.11  )
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

Whilst having a new multicore timer that differs from the old designs in
functionality and registers (marked as MCTv2 in vendor kernels),
Exynos2200 also keeps an additional multicore timer connected over PERIS
that reuses the same design as older exynos socs.

Add a compatible for the legacy multicore timer of Exynos2200. Rather
than differentiating it based on the block version, mark it as the
one connected over PERIS.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 12ff972bf..10578f544 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - axis,artpec8-mct
               - google,gs101-mct
+              - samsung,exynos2200-mct-peris
               - samsung,exynos3250-mct
               - samsung,exynos5250-mct
               - samsung,exynos5260-mct
@@ -131,6 +132,7 @@ allOf:
             enum:
               - axis,artpec8-mct
               - google,gs101-mct
+              - samsung,exynos2200-mct-peris
               - samsung,exynos5260-mct
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
-- 
2.43.0


