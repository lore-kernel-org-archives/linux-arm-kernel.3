Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DBDCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dmvGzByM5O4N9sfFvXRYfnFUo6WgQWqvYDajZ7pSaE4=; b=ltt1js+7HESO4TLwmGMF2lXx4e
	ibWN8atPM9Ro+FcRpThtmktfhRzSNP4O5biy7ISBwusOQGnWZRHuWlGXSJSYaoNxVmj9KqgVbbhgr
	g+LQ9cY1aqXtDoNvq1bvXnWWJ6LqxXeNIz20bH0y+gNRYXqzXmsWT/MAXrtA0luM2LrRMGlzrnZ9Q
	uWyYYEIcc9i1BARrs6i9eXSlg+zVs5OolXGHUWbXpV7va0U7eMX9oQLvwKl2dSqv8iSW9q5PqJu/B
	ZxBSQAkrbZXyBCAAH2tqHE5SOD8eGuXH5OVOmLw8rWWQzIpQ+ri2NoEuDPeQslmXIJkhvy+WtsUvF
	DLqNqODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ0u-000000031t7-2jmD;
	Wed, 22 Oct 2025 13:36:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ0s-000000031sJ-39xG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 13:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dmvGzByM5O4N9sfFvXRYfnFUo6WgQWqvYDajZ7pSaE4=; b=apPrLswqzN4aNgmm7SXhpP9z5h
	j70+TXJjPumabSjhbe6lJJOnYF4h5K0eucwJQt/KDmMU8UMwS9PSAbdaUlqFx1n57HimTtPrC4rAY
	TL3LQq8Jg2X0WEhfOHfN0SD1SHotgMw0MK0y450s1pqjJtEeq8asuerbDFlPPCQ4euX+aecnmLbi4
	WldrPGetZue0DPSoXKNnmk+JYXKCqLJGDEWSSSOwels9nG+0k+L3a+7d+QYixa+ZCW5gm60lot0hL
	LjBIaMX/p5TCd4prWbxgbHsVi7AEsuOf1en8hLzoQJrmfM5Pzd0WS9ftdXBri6X0/wOKyibA31gLQ
	m1fvqqzw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY97-00000000akX-1jtv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:40:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4710653ac03so2524815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761140179; x=1761744979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmvGzByM5O4N9sfFvXRYfnFUo6WgQWqvYDajZ7pSaE4=;
        b=ol8wbLmOpm0kDDryeoQHeOWa2VVBFgigxRugyzbMhE+6OUPqLbiM+TWfCxhs4x1xE4
         VlVPfDP+BZ1UkBMOTGq8dr5cfU0eyG6brZZP3m63oqnkTCZ7Dxaz17FoJTmEpXEeypgS
         6DZM0a219oU9ajJ7SJjUSrD3vmOxOckwyb9CvLhX6wJwwFJyk1Cy9ADuP8OjpH7/NcDr
         Ooa9Y3mR9SGHqzgM2rle15ivk7eLYMBSGgBn/xxVVmGT+xWAWkVxkele0VlRnAlCuhit
         yzVbaTYAOz1GQCPLtK4c+5ZrapVBr8dh/Mm6RRQp1FEwfo/T48mZvwMgTSvBht2+yaHr
         um2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140179; x=1761744979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmvGzByM5O4N9sfFvXRYfnFUo6WgQWqvYDajZ7pSaE4=;
        b=MOQNoUrObdSg/Fc/q7vKSTNCq9ETXobVGy9+4y/Bw6VRpBBhCQR/lnKsrNc4gcTP+J
         8Wwoz5bTQW75UGj/C6l2GTBiGIqGLx1XGFMVkKmrC09AeaOhPTcvxsoTTi+KyTDUgrYb
         M4poE/CTFYfIj4z7xDHwz1dNOTAeVzOBXITPOreMIGqRp2cr89Pgsevpfkyn7WI4T4gq
         UGHU9vPwFtakIpoHu2pS8HMMS6KVeqYaY2a7/Ei5hsr4ISj3f+dEi2x+1GjAQNjHbuux
         dtaak2CuotyhkVHyvmV7JhQlHBtxmmX2N+l+/K6oqB8vCcTUkAZV/aZq0FJcl1yXOmuK
         e70g==
X-Forwarded-Encrypted: i=1; AJvYcCUnzILkvX3Dm61RcMYcwx2eqXkvuB2jDr2gJiBEfk3cjEPyTkv+jdM9XLniITPqxI1WofasEUlLiibw7WjBTiSZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxVXNRQ+BUJeuE7efE6e8zzv/fPjwX2E5gzQwpDRv1XrMCFucVb
	zBqdYlZ2unNiwXTtu3ZRaWVBcfOnAgeLoDdx6y5okgTwkBMytdd1SvOdVqNlq3KXgl0=
X-Gm-Gg: ASbGncv/BAX/dyJhXdX3KnuGk4d6Cq4RMZG/48hLCx44+5NrpMuRij09w1CcgH1bK6+
	EKO45OjKJkFNJWu5FlPlUvEE6Wpi2QChZbuWIgza9z9ev964lRDxQeYCzq7sSfBLjwevs83ENeD
	Ml52WsrsyxLB2GBLN7kwq6dSEq8hBmOWtp0xboECXHFPEuXsCeAPagD7/g1VKJesLYjw8Eq4MiH
	sN9ah+PWENPoIDx9AznW2SCR4gMxj0vGaA5e/ZK0bSG/jXCMDueT0QVtinvuihlGM7/g2vy66kq
	sQduloseLUNSbhEtGJ3rV5Wr5lepa0wPZ3Z020hxXt3vPYThd0EXTF9AsQ1tvPqaQ7Iji31uG79
	EQz3BBwKPt1Q2deQHmOyQP6SxKMcGSgaRIRfDqkn8LsEIWycyeddI3Ct84gGO9P9JcSLBEyznvj
	vdk9eBYMmdDGk=
X-Google-Smtp-Source: AGHT+IF11NRjqeuEZAE/OBiadKOc1mEMhPEL48ZpZiu16lUe5zj1hRs6GGA2fA/Q4luhxo1H23TAsw==
X-Received: by 2002:a05:600c:3b0a:b0:46e:3c73:2f9d with SMTP id 5b1f17b1804b1-474943059b7mr31754245e9.6.1761140179357;
        Wed, 22 Oct 2025 06:36:19 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427c3bfsm51915465e9.3.2025.10.22.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:36:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with DT bindings
Date: Wed, 22 Oct 2025 15:36:17 +0200
Message-ID: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_134054_355860_A2E2EA18 
X-CRM114-Status: GOOD (  11.53  )
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

DT bindings expect node names to follow certain pattern, dtbs_check
warnings:

  tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl):
    'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
  tmpv7708-rm-mbrc.dtb pmux@24190000 (toshiba,tmpv7708-pinctrl):
    $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
  tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt):
    $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi      | 4 ++--
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 9aa7b1872bd6..88e38d6efcaa 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -161,7 +161,7 @@ gic: interrupt-controller@24001000 {
 			      <0 0x24006000 0 0x2000>;
 		};
 
-		pmux: pmux@24190000 {
+		pmux: pinctrl@24190000 {
 			compatible = "toshiba,tmpv7708-pinctrl";
 			reg = <0 0x24190000 0 0x10000>;
 		};
@@ -463,7 +463,7 @@ piether: ethernet@28000000 {
 			status = "disabled";
 		};
 
-		wdt: wdt@28330000 {
+		wdt: watchdog@28330000 {
 			compatible = "toshiba,visconti-wdt";
 			reg = <0 0x28330000 0 0x1000>;
 			clocks = <&pismu TMPV770X_CLK_WDTCLK>;
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
index a480c6ba5f5d..5ea835fe08a8 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
@@ -91,7 +91,7 @@ i2c8_pins: i2c8-pins {
 		bias-pull-up;
 	};
 
-	pwm_mux: pwm_mux {
+	pwm_mux: pwm-pins {
 		function = "pwm";
 	};
 
-- 
2.48.1


