Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D3C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=; b=K8OUPe28L7jMRW3jauFsfoLTu2
	GmIPOpt1R26CV6MvhEOlDrr8Iq/9K4gqNkGUgFj+/8JecNOjGDxQZk59O9qqKTAscaptgo5u3PFQf
	hMlhMrKdhrMLnfuQZj6Gg0zsQGiZxQPeCl1ZPbCGfBpWK0mq12A+xyUPpS29sMk9zhDYZJcVn6JtO
	LqLTEfa/Sg3fFqfrEKO4d7ocm82RHjydrl31E6fmYfJrNlnF2VHDZPfwBdyYD4gPZQTZQVJz7/5Y1
	6BCSZcFxgtDpq+ENUe+Nnm7ruxu0zHWSYG9ZUGV3vlE8vgysBm9kXTlm50LCqS0TjGwxCeLZazQK4
	tUp2oflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHf-00000002ZzB-18CV;
	Fri, 17 Jul 2026 15:15:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHT-00000002ZlC-11DI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-69e7a5b61e4so547436a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301314; x=1784906114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=rvBXYDpSGiD//jh548Y0Vcvy75VYhqMV3KrlzMjy63tTqHiDGJYh0dadXKlGpfyw3j
         gTJCXaa1/ggjD+4XCaEq06jbrD0p6VZ7my9Kt73a0JvF4Qn+TfkNznKZnmbpsvOtRjpd
         4aOv6nnfqoS3B294WVAi/tcACbOJpWYDvI4FlYpoTKKlkb3TgDDmvRZz6rCGTwPGBm/5
         CkT7YCFnGuk2+20o1SJjX5/yqv7U/c7DhQDswhzeGt0VHmf2gWZR5B1ToJGmyHSOHzMQ
         CN4+O7S8wEALfBkTM+3GzPIVekeCskedlbD29Hm/BxNo+RE/QD0PHpt9iy6+KfjOhFld
         8jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301314; x=1784906114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=nsBhJZmFmmSM5YwKzqxfXSOihiH30GeoK/EMbcXBFgE+uNOOxKlVN6c3AwwKYoqGh6
         wMm8/72b/7Cbj0ROA0g3xZcu+JN2yDRp6Sz3it2y3OTvo6IFcuNti3VAhuCkAFUeg4lq
         iM/5d6fy7QxieiQRuq9for/LCDgjIzQj1Pyl2bj17B6ts8RchNdK826sEhf5l5LNNf9f
         I0n4kbcwmRUJpGZbFk21X/jEvuXPBOsJu/siyeeI00Zf+lSYNmEAkXnx/kj/ev5mvdqB
         1Dy40LR/cyOd7mhH6zhFx2gi7BX89GmrPe9FZi49wdcKdD6ne82JLf4OlT9neqsTKMQ8
         q45A==
X-Forwarded-Encrypted: i=1; AHgh+RrnzxtrRPMSyoUbRbjN+xx2eYbWF9hNCLsPwv+75YRq1Qax6hyAxGknJMx5NOJsPI2dOfikqnzp93ID6cnhWQXl@lists.infradead.org
X-Gm-Message-State: AOJu0YzhPoFFbh+IcdbALOCUNfuaNVCkuDlbqX3nBJSNDCmbzFn/7XDk
	kF0ilnZd1jpI69jeMir9N6KbOdMV/ymdZR+24OCyb4LoYfuhPu4XkOpT
X-Gm-Gg: AfdE7ckENo4SuY6tOj6qYRq8G8MFAFSXZxz6BaZSltZECUeNI2stcRX61VHw3s++DCJ
	8Ti1wdhc39oTw3E343RTwgE3nTbqAg7wykdAxZc5/9OalbRdjCo2uMwO3kzlIuEr6BSXisHoRl/
	QxSJxWhG4YP947UhGzuchbHruO0+WePe8Tmoe1t46L502s65ER/SrrenzvABs7bC7DCDjCudYWQ
	g0T1hFnXO8PzV0WmEKFx6VcmEVtSVLQYREEVAnj7egBh9wtA2Fed2zBeMODfNZ3s9zt1Q8aNo/O
	muJhIhZET6yOwEKhfhol3GndcOkJDkuY6x40IgPN57jC+/cS8d6R9e13i22CxCUvrrPEy3loWSJ
	hzWkptQM+KJ0T1MvSY3bD1cNwbNGxKiOf/0gIGUeP2OfODUHXjP4/wp2cxTgYbdzHOvfTOzhNeA
	==
X-Received: by 2002:a05:6402:42c4:b0:69a:50f9:6048 with SMTP id 4fb4d7f45d1cf-69e652ee9eamr1278651a12.28.1784301313577;
        Fri, 17 Jul 2026 08:15:13 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Fri, 17 Jul 2026 17:11:13 +0200
Message-ID: <20260717151134.678839-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081515_299929_39662436 
X-CRM114-Status: GOOD (  10.65  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..4ebf305c10fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,6 +95,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


