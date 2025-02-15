Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6917C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FaQaynB3KedHnyc+zdw5Lrkx8DsP6cNuMCn8mu2UgNo=; b=eHyMWPwbPCfbAMa2UPQyDcCZAf
	WEn4jU0xhKSxldOrHfAGD4bGd8Gy3KGKhxNRB/FlowUzS8RTuLywNB1AlofDR6bXGu6djr6MFAsw6
	Nc8aOCNkZLxbtkgvgYVF4fjWBti2W0JmxWGjepeSDoKxv1xX79fssgKXnMPwQegsduHExvTmJNMzU
	ay1ZJrRokvWxIurpSl3rWX+Wp1ulhzs7XlksiBm1bFMh10Bm9Ms66pGyWK7OqY+hJzOpsKAbcBN1e
	AZR1L0RUUPrZ+N/nFQpAsQhNXoXWzhoJomW+yNnMGvTFaapKY9/UVnGndOwYU1pORhTHmrqFmQBnl
	YhjGdxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHy9-000000007oD-0YhI;
	Sat, 15 Feb 2025 13:12:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHsy-000000007GP-1kg1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 13:07:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so17430635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624827; x=1740229627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaQaynB3KedHnyc+zdw5Lrkx8DsP6cNuMCn8mu2UgNo=;
        b=UQYeMu/0l9E5zuDu/cLHy3jwhJ3k+yP59T7iiG5fQatL+koGHgIW/W1B5//5eYk3a5
         g3DdhOeT2ztaaOGIcqNvbsatVMzSLZBSoyXdMTYPKkGs/QTrhydXp9zrzScZVJQbtIWO
         7vVky01hUQqtQXHgTZ5x2EXoBGWEdeYz5xPqs0DBvg3WoYu48CaPEYjqE4ZaJXvXGXTL
         Jwoy1tPyjHKg2V1wpTY5j1rGZV10n7fOibo3sej0cwxJu+zEKo8TAlqxShyaNFt5puaF
         OhodI/R9kEw5Rn772K4SeDoCrGJW+vKBk2RC8HNmEJJGZJHYLhraeRnKXd5J9C/LpDt3
         mWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624827; x=1740229627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaQaynB3KedHnyc+zdw5Lrkx8DsP6cNuMCn8mu2UgNo=;
        b=PnZSwQcgIqfKIhZC3/DFkXnchlZ0UEnAoOECOvGK9Y6XDjNqk2JTphUMavpzPv8eAk
         vA/bRVewQF6kZKR/ic7Ji/syXbro3OdNFyZb4AeFNo/iLHBhQETDiSfcAVr7rxTNeUBh
         Hg0/z7s2EO5qfm7t8oz348mTGy5eSlp+bYpD1blOHtyGlcCFWBzEoulG8yuRjGkfBKtk
         ucGyQMcdJei/S5h/boQGxOzbAk0xEZ6gGn1V9aHF0BFltRpf1WKT/irnrj4PwSiZDeoq
         EXxRJIwtd5fKsmgKt15EyIkJks5cGK/F3Lb1WWl21rcI2vRVlpokFE40vn+3KdVtqUrC
         P+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2OuveOCo/xcQVoHlhZsCifwHcT33IOmcBJt7nHpxcof2jv8HOAM+BggXiFI3vAuE/8TQf1Sd6LWRRJ3Y+cacK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6hfno5OIJGyD01lkzF1cDBLc1EIU5pakq33xmG5iWb7cXvVN1
	xnnugPZmdbjH8DzNML5qPYng5hzf8Ti8KCNF8vSdLXZ5krIAS+X6dAFehg==
X-Gm-Gg: ASbGncvWncGJUbQb6Qxv785tLCiB3dHe/y20ihEiaYsbaWyx1+Rc2RVqu7rz/l/xC2f
	va8ydNydoRBZSndOhzqfWYLRh6eUM8UN28z5uAJ3Wlv6xsms4gCs6Bvt7brY6YguH6Vwi+mEP9P
	ARdbV3Nstcr5tlztvwdjgb/qFvJD5TRy58B9PgLqX4JgHh0aoQ57TSISoLstn2ByxAWHZmldm9Q
	anNzU81eGG9qjpGFUGxhWFznnf7b92PyuPCBtJHhFMEYhLZd0dt1txZ6rtRvMBOpqMTh9r8o6YU
	R+qDMCzloG9GEiENk2cfvdntlJ6JrhMpyM95XpxkXDQUz3bc8aWIm6L8b2AHexLCtjw=
X-Google-Smtp-Source: AGHT+IFwPAOGPtyRYj1UkSwxPX/68on3y7o8btPwzsLs8+kfSjZ1S4NhhwH3txCrEPKfgYUWyS8/dw==
X-Received: by 2002:a05:600c:5125:b0:439:44eb:2d84 with SMTP id 5b1f17b1804b1-4396e6c9315mr29004675e9.9.1739624826670;
        Sat, 15 Feb 2025 05:07:06 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04ee48sm101718465e9.3.2025.02.15.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:07:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Sat, 15 Feb 2025 15:07:02 +0200
Message-ID: <20250215130702.170851-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_050708_458033_9C727CEB 
X-CRM114-Status: UNSURE (   9.66  )
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

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68..6b6c0dc0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20937,6 +20937,20 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
+F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
+F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
+F:	drivers/phy/samsung/phy-exynos2200-usbcon.c
+F:	include/dt-bindings/clock/exynos2200.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


