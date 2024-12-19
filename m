Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A182E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULCkiQ8VoXo6ciE6Elqk4HCN1p6ytUWA5waL2W1UArY=; b=esc+M/ljiSU95Yu5CbcMahsiGh
	9jDfZsgBdqvpgNxXtMcJjIsd5EAQwLeyjn/8o/DwGx3iF/w1PvXwryfBrGVZTVejav15+uza0ICZv
	aqO9tZFovZjA3ACJVqYneCL+6wZGLjBPFpnxc3+fEzE7WczfMS6VBUdIjRUdMmbvU1FldM/XArgWN
	r+QQT18NxuDMnckMCByzasa2AjzkAFdaMHpJbAukqaQH027NWGt5hEcZtDpWhNhigu0iUnicfXX0t
	cBOuOhGu2VAltSIAtWrZBzHrnJ7ynExUjlIVDyYSixxjeDZxX7HBXkG2pjZpbp7Q7d2aKzx1MQEgt
	oDVB6/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMuf-00000002zkV-0OBX;
	Thu, 19 Dec 2024 20:14:25 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMkO-00000002xa4-2v2D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:03:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so1486723a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638627; x=1735243427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULCkiQ8VoXo6ciE6Elqk4HCN1p6ytUWA5waL2W1UArY=;
        b=BLFDDxForMYWJPzLDtbsmVIkrHE+B1hw/Hg4Cs1ZdVDF1D8pcVjJYJVHv4ZhrvDPqi
         2yojZRGezt1z9bL5NJBFXjFHHSXxfXXIzcUWzsN0aqwt1lw63cElep9RLqGUJeFMPuts
         1Vi4nT5ntzy9jeLyTEJWIQ8R16ewVIHCqcWrqam8q4NwQ10wInC5Zm+sH9taSpihErcH
         0enAIIkz7luUJjwK4k04nl9nlwt9MRDs8sAORdkWQVjTWyOVeEjRJPip9cbFhMkZtOOa
         jIn6mq1gf+vnTjewC9OEIlEXDo2y/GR42JAsKEKp9DV1qv7AWkQSJW87CEPfAnLaDnLa
         fLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638627; x=1735243427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULCkiQ8VoXo6ciE6Elqk4HCN1p6ytUWA5waL2W1UArY=;
        b=F9IxY7e/s8VGl+/j6s/wgeT57OO8auOTzTs+c/aPVAt1tx4+3BrLJCXPPXsVE7fuNN
         Mdl23pRCr4EYRJkCCU+tzkC8yP9l83EytwEi0jIYiAuDIgBlv+G/kFrQi/eyiqCT/vs1
         4V1BVCdMTyapVlTWWDJXQcgSjFrvnM6FKj8I4nSyLtqwe4qLK9KBm9xZdhtapdpHXFUx
         91ByccoE2yy7RqOJ5A0yo9kHoWemEvSlF1DEHvy/f1JSssQuDDHx/GHPXNpztVJl953X
         qiQTvWnpDr+Uz2lOr2hajf/MT2Krx4pyE/emmtM6m67PtwVd/ytM/Wq4/Urm9AOtASWh
         9iZQ==
X-Gm-Message-State: AOJu0Yy7GdXHcuYSr2DcZYkpyyJveZ+Gyr3ZvXk1SSeakFGzkcyfKrzz
	6TMdoK/6sC1T/LzIvix20nHyB68xnL5WNriQ7g3vfVi/kSiM0u6Oz6un3nVy9hA=
X-Gm-Gg: ASbGnctWNYOz/YNEK6/TVPOGtwYzLGnB3/Jku1ManWKF8ZhW9zqJpiFkKvfvFsNrg9N
	pWTyIdoB8bTtzUD+btGjB2pHI/fANrYWI6ljwo5PsUyVc1osA163goM8d62qTZkbpqfBe8QO0EA
	cpqVtgODp1/o2Yqv10xMK7zER5YabLTJYE3xHFQpWeHAI6tuMu72u9MJUjmc+X3hPTbp5cMg1hY
	1OGD1lHO4laI/e6eYbdxCkY6zr3RZaqI01TSSsWX0rjt0Jy3Q==
X-Google-Smtp-Source: AGHT+IELH0oCu4fjW7oZX27SBjII/M71jzzcfKoxPHZ++4GSGWA7IXgMSzFoeG+SeCLv2JVdSNynlA==
X-Received: by 2002:a17:907:944d:b0:aa6:c266:97cc with SMTP id a640c23a62f3a-aac2ad8e1c2mr8332966b.23.1734638627209;
        Thu, 19 Dec 2024 12:03:47 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830ae6sm99991566b.22.2024.12.19.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:03:46 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 21:02:14 +0100
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-am62-partialio-v6-12-b4-v4-3-1cb8eabd407e@baylibre.com>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
In-Reply-To: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=msp@baylibre.com;
 h=from:subject:message-id; bh=raNMV7XctJIbSEmg1aR+IsRod9wfbi2q0jEtotc1h3A=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTakRWuOsJ1L8p1NALuSEx9UrfAfFqxypZpe5/mybfe
 H/3tVpVRykLgxgHg6yYIsvdDwvf1cldXxCx7pEjzBxWJpAhDFycAjCRJx8ZGZ4Lvit/aTfVSXaL
 VsTXWYmMm7yWfTJzz9u4c8fr0kU90q8Z/ucWZ+evvDdrgfvTgAOrgmccv9IhqL1uqa/1R4ak+wn
 RqWwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120348_735774_6DE3009E 
X-CRM114-Status: GOOD (  10.51  )
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

WKUP_EN is a flag to enable pin wakeup. Any activity will wakeup the SoC
in that case.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 22b8d73cfd3264735ddf91874e60a0c5fc7ade5b..dd4d53e8420a1d671e04a70d4af8b0ea1b75b2b2 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -12,6 +12,7 @@
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
 #define DEBOUNCE_SHIFT		(11)
+#define WKUP_EN_SHIFT		(29)
 
 #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
 #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
@@ -38,6 +39,8 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
+#define WKUP_EN			(1 << WKUP_EN_SHIFT)
+
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
 

-- 
2.45.2


