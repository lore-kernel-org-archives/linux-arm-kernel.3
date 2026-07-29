Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C296C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=; b=Qa1PKL9//PEta4t+jWzeoD+RN5
	XYatAOttsZ0Sl/tDX0OSv5ggwS0g1qQVznlYYPGFic6Oi643R3bALkX2ZU/mRI0XA4nCelKKg/7tm
	ElVizOVmcBV8L/TsYaTGDxvQRQXjROQO/3dMLjsc5EgE2ISeVPXILIWos5Rdv0s2skhBBuLv44agL
	AE/+AGmwXk6xLJ7knrNqXonUGQ/DM7pLaOVmDilPPxjhGAQldFYOUF9hE5X85CHwSwDq4yDlZqs8H
	3RDLq1WytLLvovdTozyQ4+kwVdhcFjcD64WJKSNFhLXYHXtrT/WRCVX1Bk60sJZviN2myroOeK/gl
	g3XAHLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Ra-00000008kFQ-2s96;
	Wed, 29 Jul 2026 17:51:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RR-00000008k9D-1RZA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so816765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347499; x=1785952299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=;
        b=kxyZdk/IG/4KCWlp3koxlel5NY/PYX/Igub0CDCl3tNxxTG9VAq/oX3Hbugjj9yHfc
         o53SbzZg4TJ4BXuIetrtb8IQO5dnRiVChMc8+i4Fj6AzkyPi/MccqenGtTvrs71XVcJk
         yegGcYqqlD1CygQzHJjIkcz4ctY7RYAUwXqmpHLaTRh4hgLAXvA8QXx5L0Zfe1Yig8qm
         WwqqiV1RE7wRwGrPfE9Hc0XXnczrzUX24GHIhm056dFGy5fMiLSi+E0LBHsibapiRlSh
         371rvuj3nN6NyeoS7ZT/sHED3CcVXPjRLv+0t57vbmMVK3WZZuw6o/G55B9/7bda1sK7
         Z3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347499; x=1785952299;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=;
        b=sQi8B023gspa1s6yvvZZdj6+UIfVGwsSth4tInVeHStZjQe4D/HhSa7sP0cjfL088P
         pVvIuekVILeL3IVj6OL2mhwDTab4IPKuKVX0RAohiieRWA2YL9yhVvL3pgzMi8iErqoZ
         0yQsr1jUzr+RXdyXExqAdaExzUjSWPJgQQdVbzClcklHZfFluHrKxJbuqnivSzG2nF34
         WQRAn/q5xDcL2RJrdP7DbQkKNImYGb3uoVWQtPxtZTmBUJfaFKexAYx8au3DscmEnV0d
         f/j3cXhxwXt+e1PcCCm2py1B8HQYCSR8S6CfvB4Bzvsh3vrcyezVIkLvYKqS5Quf4bJJ
         Qd/w==
X-Forwarded-Encrypted: i=1; AHgh+Rqg41nvxuZJ7YfliieGbjyIPwD046JkFtgxYdrDM8H1yxels43mU+5w+ymGDz80EE/0GHNJ/WPlaboGAdjlEpjY@lists.infradead.org
X-Gm-Message-State: AOJu0YzbPODIdavpTbLE84totU17EXJfLbmNL2BWJhPivavwhVK6JuqN
	acIabxaX2WEC14Tn4/KlyWMo8TJRWK5uX+jBTTNh2a5vzNkCmBcVdGZX
X-Gm-Gg: AR+sD12oxPViynHs3pUpFfGRaowh3lslc2OxwPX0a1VHYdONM9FdjQ6OIccIGt90GEl
	dcY0s/zhXg12YSOHAm4rYR7jB/emqvoTHyOCWLCOot3LYpoB80SxTgxyllMzygrXxt7FlJhjghU
	YDL65Dqvs+yGp6gD1rHsvGpwZqmZwiwN7Ag1xoRyZu6cmB3iS43mWinHcbsrALgXogrdWAG3w2Q
	x549hOgJ8WIr2BVtaxM5wPSDQzl/yW0GWYHj2SdYlGVvVSvUSpb71OAH3QnYj3NUQFt1p/wxe04
	CnSulPgc/7Qz/+fcDopPRlgmto88/tMwlQclyn45pIe2friMmab7/AEWXO9epguKF6ygpz3lRhj
	1rbve+vZ+QlEoLw19NeRlvPO5Cnf9qfAWLuavPLPqKhPIA+tbaHSDkQsJz5KjQsOAi+y2u6od+A
	ii1vcawyr8r7gJ5jft6LH4WoFdMe90gHY1kkEPsZl6cY40UfYTPZfrjvdUDttvZpv79M8sFjT+9
	g6WJq5bFIehbWUcw4X2XA==
X-Received: by 2002:a05:600c:1e0a:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-497fd31a32dmr37058265e9.18.1785347499384;
        Wed, 29 Jul 2026 10:51:39 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:38 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Wed, 29 Jul 2026 19:51:32 +0200
Message-ID: <20260729175134.92909-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105141_392266_C7FBF44E 
X-CRM114-Status: UNSURE (   8.29  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


