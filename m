Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361D4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ny5j/6TjMJC/z8tBR7whkEk58tIYnd2wnAxlQ5nNsQ=; b=jSelCHCgPTVB6IVZEScvYtQ9WO
	L77LtJTO2ZevdlVI4VU0o+C8l9hkraKW0lAoujdu7ZRftlrRPA3vUjDKVnlO8Uyp8veBRIko6P/MS
	fp1blqe3l67uuLVQGIvSfw0UIqTnMzo2vr9KyP/7EwQNJ9YX+nx1R9+iC0KZwC5xTOZOYfL53fA8Q
	bINTYfxwIu3XctVNC/E+pMAEm0DRDhBowiP0HT7fVTP3K5TmceCoworcNgdqY+vW1sXJGGXs+ouKa
	3g2vboe2pQgykHw3H7bt3ycmSSX8xgjzQFRugoS8iCp6GAA8QF1C+1JTUrl8r4RNC+amW7gg0SBgq
	eNwqNqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBbIW-00000005Wg2-3Fk9;
	Sun, 04 May 2025 15:30:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaoX-00000005RYS-2Igw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 14:59:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac25520a289so603309366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370772; x=1746975572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ny5j/6TjMJC/z8tBR7whkEk58tIYnd2wnAxlQ5nNsQ=;
        b=ZQQgfb7qbaGYosItY9gAz/Tdmw+6Lp/XvVGXIxAtDy+JegQPAEr5c2Gqn/566Z7pq0
         FNsYTs8AiJKJR6h9lSqR6n3uG+tJSZAoQPAlMQMy2hr6LwjIZY2PYcM9OK4TmroLMtE9
         BX/aezRrJQym7y8vCQh7hxF75b/t4IixDmYcLy/hSaQC4tNI7BJYnBkpKG5kqyNTaNUQ
         V4gIBvokjgw8zErSYRAqClddoIK7Yc2M/EemKj7bRLa62n7T9f8jLTDJAuOlUKuLsrUH
         1E04+BFmvDUFJEQej7LdfACKvHQzdP6IKpu/ODZc5S0H9I8hwWfTZ3D2vPdlLavdsMIb
         V3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370772; x=1746975572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ny5j/6TjMJC/z8tBR7whkEk58tIYnd2wnAxlQ5nNsQ=;
        b=dZZqV2K3/pn1aon6trEoPKx+I9FkHDWAUksfsONf08X0U7N8KuIXWX9M9EfC23wVF8
         GIVJpRZ9XLfRxGOwyNbw3bq1RBF8DEthHHSHIE2xRc/d2VroAhtTjyHskCLcWTiU1Pyq
         evZ+wIzVS/YMr2q/x7xsxpaK8dQC39iAmZ82uQ8Xo6llDUU4xLOjOX6igJuumzNbsQXM
         Mx60xb4o5juC/bIqNSXIKvALQshmVVdDy840l1xiaHloHR43t2PpgHXv8brB/fQBAg00
         fyTyT9nNWiPV7323YIUrR+ckV7B4qp8OlDp5Iwd5XFiJ/0bU2kxwNhAbYFS3cX1UKV/O
         11pA==
X-Forwarded-Encrypted: i=1; AJvYcCUSR8Hy7VZOuJgwNvxDglcAx/wWYGOTH1E/NjkHkpL3eyqVIQKr62iiITcEFN6q58G4o9BJ4HdlzND1n57yre7v@lists.infradead.org
X-Gm-Message-State: AOJu0YxxBQmbr6/2DldEoGvBJpNSJjmDBhf1UxKghI4XqSHmLa+zcQgA
	+OEHIC6HBx+yI7psNMLseOD/vjEwCNRxjELftYcKH5JR26Bt6+pDEAhGSw==
X-Gm-Gg: ASbGncsj4FbarBB+dMyTbtgeSgeJVZhK7383090G7gt2NgYQrc33kKqDnT52/9az5dk
	HPOWIJFqr3hZKJffFhbmPrWdbYbr8WHUH0DP2KtR9KrDc0UR0Rccxus/vB8WrYOaBDKZcGtVFnN
	HHzVzpCPg623dbQ3i0HyJ/UoQKIl0iFrOGJZ/Zky/8i/Unw/bNFs1Cc7wz2xpw/EW4uxAnNJeSG
	QZ1Tl3qnISqRlyZ4mp1JHBlGrkC6LI+rB/yt8We5e4HhKuK4gkyjKgbt6n09mrnj/Wnw4PUPEnZ
	5uGlgR5dw5YjbgMuOpxnsyUOzsMAboD1dCxT99i52I9W7X4L/sVihfcEyLvwyUIYXfQ+QyLcy+I
	/AeN4m+EMJkctLJw9iEVFJbyN7OY=
X-Google-Smtp-Source: AGHT+IEAZn2vETWAdCzHTScUgsNEu/Nuf7Gcd6Ob+PheOqy9a2d+WQheq2mGZLss9RXAM3FEkqVPyA==
X-Received: by 2002:a17:907:7f90:b0:ace:388e:d84a with SMTP id a640c23a62f3a-ad1a4a8dac7mr364338266b.47.1746370771646;
        Sun, 04 May 2025 07:59:31 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:30 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Sun,  4 May 2025 17:59:07 +0300
Message-ID: <20250504145907.1728721-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_075933_583235_1B4B4213 
X-CRM114-Status: GOOD (  10.18  )
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

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2dcc38f64..52258d22e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21401,6 +21401,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


