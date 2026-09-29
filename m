Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE7CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWtr6adc3PGKcncqIhG1cTNuAhzWmYNX5CaLElVM8WA=; b=RffB78KgjvHQlfrD9LuN4uNSlH
	meIdpRM09O05da7IwlR/slAz2JjBx0KI+6mTisB6ypDWjBwtOqgs3P9hrjV1p3E/v1nnU/1AbRzvH
	iWPkQQR18h1nE17wxvFD9+dcvxiBKkCChl6Nauss2sEPQzSi2iDfYtCpTN9Nm0omeioDFQiOjCSsa
	YhvHNuD6Qu5Pn18R1idOX8xaB48yJhOM2eLu2TCZjmBsb6A/IwbWoibiDIRurVYkHLKjMbSCZMH5h
	mvfcC9T8fDdg+zBBktOhGB4J9VyzQsZQPtwMJGcYnnIWf45jvW14gVNeDSQEGjwZkTpBsNaCM2rKn
	CTdJGK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVkA-00000003N4W-3Pek;
	Tue, 29 Sep 2026 11:11:30 +0000
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVk8-00000003N3K-0xp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:11:29 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6aaea1cb2e4so4960037a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790680286; x=1791285086; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TWtr6adc3PGKcncqIhG1cTNuAhzWmYNX5CaLElVM8WA=;
        b=z70uipiFwbS45czEmE4Eb4ClOVZ+vVpqjvTa8X/WMuYzY7YZNl3JCM0jNE0uDe8nVs
         7vA0+39XqYcZMcbI0s4tpOzQjVdJewxeCleaR1TLTIjfkj/MabxQSHJwgPZh1GMM5JNT
         bD9hqp6BAYLEaxphQh6Ewh7/OMlQ6TvFguUI/OMhQpa+Wzkl81l2R62VCPMYXRSTyR0b
         +etqY/4MT9tQZQtetZ4oIMpq4xBbuv7OUoTjyXJZ0qhrEZI0t0B42ahXgNKwsQE+xA1t
         O+bmWhE0imezlc2PtPKD9nugdooPYPbSdzUrNfetV36Uvpd27JweN4z5/XNMREdNU2+4
         NWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680286; x=1791285086;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TWtr6adc3PGKcncqIhG1cTNuAhzWmYNX5CaLElVM8WA=;
        b=ldjgdjaSox48B1bGpLLXXvAP6FmA7oeimqN0TWfR1y7y69mSaPnhS9CaYPVqFYgyhy
         Y05i3Xho2TA7r/eS5ihu2S91sEKrmO5xiyyHV1lhRHMN1VxvlSmONl19u7u8G4dGGdLW
         cPDbCgRnq+AAK+ERGuIrkt76KMQ4yKheFzhM0DbUo1oeziKHpGcqGBlP6cyVF7sYEOJ8
         yj1KqPulBGa3AtIi2geSZv2Oq6Z4a1gqgs+FCI4xxG5CIBl1g3UKZh5T4liOCLQCwAC0
         AukILW5/PyvmqRI+xKGoTOZFekWQg8F3g/wQ7crNZPdicfJ2ZaD5lninp56oFsnUocsa
         1gUA==
X-Forwarded-Encrypted: i=1; AKwUvBy61p0dFXK0IvX8Ofcy9Fljkc3lfXcR02NB+qiTaRioLG750HQxk5vabKBUw+orlC8Dp6mkHuHRdpXhsqCyatgI@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2jgi8eAeixojkZyDlAqTQ4F1HgFcdiQTQ73do58vq7cbKe/nL
	gb1agC+Rg5i3qUAKt50UDS0lLja3RKjkNEVEG47xDTR7OXvhL9h+dpBtOIxF0XxxvjA=
X-Gm-Gg: AYBFou3oIG6xaztfXFipARZ7kFPKFWfLRS+aGM5Hrm5ZZDt8xUD48Xos2w1aRps5jQT
	N6Rw91RQ8dMUUC9Cj7NlfEoAnMOUV0Gpk5z9KV2n8j0v3atxDhvR4noYjQysDRBG8kZrR4OugLs
	YoIU7RdsEGgoM2Iiz8TyWKsxnJal4w3uIi59jdS9NFCw71P/iW18p80/iaA4KmRrJDSQ9YCrM0p
	WGC0H7ywmoG7pVhkfjLE65fQYwgfc8uyA+gjYbrJRqfWwNj2Cli67RA3fxcV12GZnjE7jj7jtZx
	OYrvHr7LtFGqMOmooBxV6sLCtYt8Hbw242tRuXt3cMPTtzIV+suiDdIK8ML/nTFTXUkvMwpT764
	E16BmpckL5a3qm0wuFHC++57pwBbTnW74HRCLh47jSx0BHevjRs3YFjENQy6YT4XRJeg8JMfiK9
	drZXLhVzieqoLlsunF+rAy3v39Gyb6E5mSeGnHj6IbEIChFJVWqkLjQFLS0TjB7ZFWbzgLSqxEM
	VXqudfWlWaxkVwVtoFiPeM2DrQrqK6mo2KBnjy6kwSL26J05t0rFDnGnSt4vrcdhw==
X-Received: by 2002:a05:6402:4397:b0:6ac:b9b5:8e7c with SMTP id 4fb4d7f45d1cf-6acb9b59461mr557372a12.17.1790680286107;
        Tue, 29 Sep 2026 04:11:26 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb90128dbsm649822a12.17.2026.09.29.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:11:25 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:11:15 +0000
Subject: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIANKcu2oC/x2MXQqAIBAGrxL73IIK/dhVooewrT4IE60IorsnP
 Q7DzENJIiRRVzwU5ULC7jPosiC3jn4RxpSZjDK1ssZywC2bVgyPA+PG05F4xn0Gbp3RrraVbip
 LuQ9Rsvjf/fC+H6pf6gJrAAAA
X-Change-ID: 20260929-pixel10-initial-dts-fixup-8c21c6951759
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Brian Norris <briannorris@chromium.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=KEiVGhYQdQfRn3X8jn6XdoGeXBd8Iq2qGCH7rdCKCJ0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqu5zdB2swPvizsJ6BwiImUCPJc0ljDuz/23IXi
 Gsthh01Oe+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaruc3QAKCRDO6LjWAjRy
 ujJrD/9Pgov8/wNrVTV/T450WYQnznFxZ7t3U/eIFtkO8mjOB2z0mQJqTQk8OJF0b22MXyIxw4V
 5O/KgpvKIb6Jz0JGkyBt9mSCOGuljmbrB+/NcDSw6UTTEeldOdDA95jm31fj1L/vkc1i/J6UKTg
 pBuObkDbyRl1CknQGWEwSsBiaTmoXFRFGcKAOdQqqr55oJuIgoPHI+tGqxdeC04qjPM1hGYF17B
 VnJeo+GbfpCWGbHOBsKN0LMMDSkqrSGjjZv93Nh5ylszEonUkdeJak1T2GffLSR2wBw0xKlyt5M
 cTXqdf76JPeuPzAEpW73KZQr+6LwcaJfCf8wLXIMaq8iip+23SWF4MPf35WlYdElte0yJqgiowl
 qW2EHX/iEl6p8Cg7TVkFTGAiGUlcxLLYio73OLnalbUoWQVDskgL1ja94BXuGAbZLWcfdW9kKmJ
 gzUcGYeG/BZwiBhI1NG73HG33Cc6Ch3l2RfWTbtNyMykIFo/pQGVwYIkuNvJbM56PYwbMqHo48X
 yD2eGTjZjXu7VWHsEqckxgCXxplgUPhvTbKj6ge1wFfTczYMYt8portbVfBcosxpI61rdE+casw
 8MF7vKogggeb3OQqPnyTcvVQVVofqCWhKEwqDF8OTZP/JEupbx3RnhqOn9734mYb7tD85ZFmH68
 MJPhsQ/02yvQqKQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_041128_295802_256406BB 
X-CRM114-Status: GOOD (  10.90  )
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

Fix newly introduced DT warnings:
Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@5880000:
unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
child "reg" or "ranges" property

Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for frankel/blazer/mustang")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/lga.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 26a14b3a1b190a..919ee6619d9ee8 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -370,8 +370,7 @@ gic: interrupt-controller@5880000 {
 			reg = <0x0 0x05880000 0x0 0x10000>,
 			      <0x0 0x05900000 0x0 0x200000>;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
+			#address-cells = <0>;
 
 			#interrupt-cells = <4>;
 			interrupt-controller;

---
base-commit: b736258e80ca4c2c465cd4ec6d2bbf780e99ef55
change-id: 20260929-pixel10-initial-dts-fixup-8c21c6951759

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


