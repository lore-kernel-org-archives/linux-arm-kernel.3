Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98153CD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=; b=4nTarSlgV5g7zwQtNvmJmcwd/n
	cDSROYnWzB/F0pGeGg+OtMNvt+0ofLsRWyKfbstQnrU1ukImmXiI9G01ORe9ZfDSGQjeXyA2/6loz
	eYVllb16fwRPFe7IBSScpxKqOhP0asBp0BOkncUaQ0eYQr0InEJy0P6UBEL3M8WJohIOkS9BTYZFD
	fF2HOjg+kj1n3JOQ/tQWYgCs2MYFX1KqMp4VDxUidXeyHtYLVnnGtsqPCZN+iB9M4PGpGc52yOxYq
	enDOaEyEgVfPMjeFSHMH+Kbskk4HFvSKwYJGEt989BNCZyDVlRH291yVWyGMPktOuiDEovjvDPrhh
	sYdRayDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnr-0000000FrN3-0d36;
	Tue, 05 May 2026 10:14:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCno-0000000FrIt-3EZt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=; b=Xuxxndz9lL/j3Jb/wSsqMbLelv
	570mSZzFki7TRhFHybBWYxgjfGsjzme5jg9VqkUQLbbC8G3fhRrcEuusId1lqAPPEcO2gaWQgu1n7
	qsmMzoccwjb1iblAs2EJ+EuOdYHJcPF7v4UDyNc/2vbbC+C9nmrBagZmG+0glbRwFLBkPD5mZ0xZ3
	3IzQUsiNP+CnWX7A9u2UGEtkCd6R+PLYfyTZykiJDg4vvLLxEckhXzX9xNwVfrUsaBmPrLnypuR65
	q48B3KK++BKbTRnr2kP+B4sz1wR8nuiyN3PIjisDyQDYt64XpYLmbm0pIYHj8NLx5jcwonHypdVwd
	GYRE1e1w==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnl-0000000D9cl-1pqK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:55 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1627779a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976091; x=1778580891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=;
        b=bQEl6kM9g4hFoTPkZ/dCMvL2LKFjHQDfBdqumpzlbmtZZIkrFkDGqriT+3jNUvDEaI
         6l4TQ6vmF5qYAR6SrUO5oShuaO2pEJJNLuBg16qId/kOGIWNgVoFdm/5EfNqRuxmpLaZ
         JT19pOdklpOgL/nJKZBWsa620fz6SLuZwhJ2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976091; x=1778580891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=;
        b=pGK/3kNgMF3NGILpZwFffq2kvNAewz5K/KHo+B3/tleOsV61fL/f0Hx0HtfcKfTKSo
         1X3wzXWIXvX5yAobb66cEA2q5WjuyK8A4I2w/gr1oDukKsYSFdkJAPnpIgAomKqeS2Qi
         jAZr7pUrGIAz//LZo6XxVlYFPdYuc5vT3n6EoOG2b34yaT8VwmteL+bzgZODja4UgPR2
         2c4aqLQ2Ud/tIDFaznaOTl+yGsmDPI7xptWYvSYJt6/X9P5WWyl4v66yRQF8yILbeDx2
         Beqx3hI+9VmhlH3a8QKSxOc403TDZCsr7rwn3g8ldwR27OSo5vBdGoLmkCHyyH1MmGkM
         8y/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+IRSUOfq8Gdq7Hf09qnZK/YpWHPEwvoTsxt2RydvOS09+zXwLcSf1nUdqH4G+VfmpSvwgG+g/lNA8MSXrHOdmy@lists.infradead.org
X-Gm-Message-State: AOJu0YybZU2vpfbD1erTVY744blF+YXOlPszGvM0eOFeHNaG1VcYQUxz
	dVleBUVK7hZlPfeXRk7cU2HLJXDLCGEyqXpLgeynD0nqNXAgYKHnxiJ4u+jOBwQIZg==
X-Gm-Gg: AeBDiev4n9MLfDAk9+Y9pkgSWG/1+6N6iFksL++LF2IZtr6eSRE3VdZgvB2P/kioc3g
	K5s71htnOcN996IfnK6Hpo6DOHjcRXTjmVNHehSoX2YXMXjyn7f631urbDwsKj9s7419JTRU1SE
	9uMXMlZnN/MtQIErQKN9P3njhXOd6uKHJ38UbnL+OtICHofjc1sEJo8LI0LT4FhZ2rdWfzDRxTJ
	ACtsnYMGOuD4D3iYomLD57qn3QXKQtjPTdRlwRry6Y3IDG+l+HxiTTeQ2M9YGGLZOehKcdNt9aP
	AVrvQsuIONN/XP/jHFVmiE8tpCIUkqDKr2pjcKjRPnEbPjp4P2g7nIr1yNcDwSViWNaJlxWHZ0i
	vBhXH1FuViAJ7B3RqrR1PymFHR1HPkA7lA6cn38mVxeBinaOIuEstu8Sj5kwy7C0VxUufWQ//qr
	MMvQCUE15IU3fIM9A6M2VK7uBPUTSi0ROQjfZJFmk0FWp23Hr5CfbcMDsvjsLupdt+gv7Qx/g2D
	JVhq50PVjPWTkBtSYo=
X-Received: by 2002:a05:6300:218d:b0:3a3:56db:919c with SMTP id adf61e73a8af0-3a7f1b3ad0fmr13728832637.14.1777976091454;
        Tue, 05 May 2026 03:14:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC regulators
Date: Tue,  5 May 2026 18:14:01 +0800
Message-ID: <20260505101408.1796563-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111453_559216_8187FC5E 
X-CRM114-Status: GOOD (  11.95  )
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

The two regulators that are exposed by the EC are supplied by the system
4.2V power rail.

Add supply properties for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index cf9855618494..bda1b0f9f72a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1431,6 +1431,7 @@ mt_pmic_vmc_ldo_reg: regulator@0 {
 			regulator-name = "mt_pmic_vmc_ldo";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <3600000>;
+			vin-supply = <&pp4200_z2>;
 		};
 
 		mt_pmic_vmch_ldo_reg: regulator@1 {
@@ -1439,6 +1440,7 @@ mt_pmic_vmch_ldo_reg: regulator@1 {
 			regulator-name = "mt_pmic_vmch_ldo";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3600000>;
+			vin-supply = <&pp4200_z2>;
 		};
 
 		typec {
-- 
2.54.0.545.g6539524ca2-goog


