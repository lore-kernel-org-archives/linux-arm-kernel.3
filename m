Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=; b=eUDnEl+36dnXjiEgDjOm3IrK8M
	YHDJ/a+8Y2lUH7ViEOMoecwvDKquCdE/NnU0hFcnCQ9baX9R1dg3AsLhA//rbsNgfG32QTgeUozf0
	+ziw03khuS9LpW8Q1xCzo59L89VUUCH3j5C6+RdB2XRi2GGOYtsYLMjG2oyDmdIgtKsDAb8BcKIJf
	Yw9J61kzQq3xv9PhR8zNJZ5UhkFN2frVsFh6wimJcG/EpDkNvwPw9ADPFAie+n6VRTX1t5wp8+jaC
	y6LBeKk+bVhX3s3htjy5vfcZ+qjr7795TFRkVCdQEU2qU1lK1aJ0sPVVVHZzjmeQZqKfSroYHJR/K
	/lo8AjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UM-00000001Tpy-1jeD;
	Sun, 26 Jul 2026 18:22:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UG-00000001Tlu-3Y9Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13135675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090127; x=1785694927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=;
        b=k4c1ao12dzWKpThdU5IgYapIcv34xWPdfE6HB6S4R/Y/YXrCobQHsYzbuMDFjvLVPy
         2LNW73Xiy+zSm8hZRosJwhMqIat3dCzrEiuGQTs4cRP9ieHEPo2gSTJaCZFaHUuAiDzO
         8PzFnaXOol0o4cf5emt+18Eg8JtRrAm1vnMoAUWgIGD6R8QUaokB+qQSZeo3hkiKRZR2
         W3uJvL+traCebHIpbxjGOHtlrCJhpT5AG4Gf24Ax7F2a8WDvWB9JmBgpGEyIWVCjuQIG
         a+rn4SUX3gIz+Axc/B7sgq/eTBkIZUKMISKzCgkMVnQCHUlMHpdTSWbs90mIm5uMEz+y
         CJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090127; x=1785694927;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=;
        b=EGROf1znbFNBqvdNgHhiTzA12iBEjOb6hlR0qnqiUmAdUUIkg4l+nuXbqFYnngc/tu
         3B9fGMtRxJAf78wzTchoNocairN0xQhGoWLEsuv+5jz6l0UyELcm+dMwn60viMkU7AYH
         7DJjVhc72CGEImAC11R1P4DwSQ0jeZ45561LUhJ+6gnBKGkSI7rjg613cwTJ3Ei/yD+h
         /fyeoHftcvhI2j3Qtsw3OQkFnV72RpG+GyiKe+H37UibJ4rJXfk9dbZM3b8LMidjJARE
         3MPM6d+RtmISsM2h1nANBA7jzJ/tY0qEsvpFzVeDij9dANxNtELRzhX289weSoI49q23
         N3Vw==
X-Forwarded-Encrypted: i=1; AHgh+RpeRg0mhjgCqOTW1rD086dpiIgN7pNwV65rLH+gbUPtf+RxYeR4h/1cujayhDuEkjvb8FlmP3Tg6WT0uQBVGP9x@lists.infradead.org
X-Gm-Message-State: AOJu0YySATyaQlAG7Xm0d+xID2FsRCcLezl0sjWRirWhkUNlrsq2/r3A
	EhDioMmTJVbw7T07IMVGk+K9AbF8uipMuCOe5I7J5vi09RsDsEPCXn9c
X-Gm-Gg: AR+sD112jhMgs7yUnD7H0wqU+/M6yBg4bUgNhsy+0wUw/M4AiqMwPXL/00669cHfE/w
	VLuqgyK8xFIMKFgbOTkvMmzUuil+Mr5dadjFTFzsI06mjz7LFO6xhDjnHIVL51K1ehXhYopA+Zb
	feYhu6xU0nuq0yecFu7wt7rQtLZuG0+FxJI3aO/NZGrzn0OevRlrlx4mvHsNrgbe/mzzJSf22X2
	BsvlCB+8/Ae3w5liWAN5FXDSpKvdE+2KhcUu4rII8Ig1GtVjyiEGbFcJzbAQ1lQpTEiahNa2ZP1
	zsE25iNlFbG1H+LkpQKmrT+3ai3f82n9XefL1KLAFQ9o2PFfVFiztgtbJ1pef+hUEyD6SIIqJEw
	2zZTW+LePas8aOITMSt++3RH5Sy18RWpj1ANcYXKbyyy6ohRw80sYc1pEKI5ayUok/pw38PXnej
	KhkQ+pNuEBm69qXrtzB9J/UQKAmYZ14zvyua9q5w==
X-Received: by 2002:a05:600c:a102:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-496b575ded2mr58213725e9.36.1785090126740;
        Sun, 26 Jul 2026 11:22:06 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:06 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Sun, 26 Jul 2026 20:21:56 +0200
Message-ID: <20260726182158.249449-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112208_900711_737FEA5B 
X-CRM114-Status: UNSURE (   9.17  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..f205df64a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1213,6 +1213,8 @@ patternProperties:
     description: Orient Chip Technology Co., Ltd.
   "^oct,.*":
     description: Octavo Systems LLC
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^okaya,.*":
     description: Okaya Electric America, Inc.
   "^oki,.*":
-- 
2.55.0


