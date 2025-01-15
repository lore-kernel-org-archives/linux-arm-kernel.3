Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C57C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCfgl7vGmKArk+EJSGegWOcVoBZ7U1jmz6/Mioq6zLE=; b=d+GCMHs4thFhoSEIisjPs5ZDfq
	zaMoPJb3kA87IsfcM3zReDF1vvUO6p5tuOFt+6sv2Kiu/mNjG8v1e3bX/dnKiqfXJHvNUsudHvEJ+
	WJ2upPMN3r8ptWdo6FtFyD68Ur8dMWtupbZ15q8I700ACjoGLGsDB/mUtGlPQJCg0IWacfEBq9GPY
	dRV0VgvvMF+LRDqDGtNHv3dFIwEznnMbJsK1BNRUDkaX0JJ9Ix37IZxVdq0fBCYJLNX74+fcqsnFo
	NVU9ElkUVXZRKTVl56e0B2nZ0zzv0g5C70cCLpjNkBecd2pEO86FcwNJ0/n1XDz/UDqFicKRFPq/N
	o4PImHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAph-0000000D91q-1AyF;
	Wed, 15 Jan 2025 21:21:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAlg-0000000D8JZ-3ZNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:17:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43616c12d72so217855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 13:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975859; x=1737580659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCfgl7vGmKArk+EJSGegWOcVoBZ7U1jmz6/Mioq6zLE=;
        b=CqQF1DtarWDgkpbCY2F9YWf7noPn+GWuW9GOMUjSazTnguZv+15BVR8YoRcBhGyH2f
         WFO0g5whr+ALaogD8flCB3SvCSOdmK/kxg7baCsHmpy/PBmdv/xbBWBVCkQ/niWqhR/B
         kv8CKLxuzikEe08eLD1q2N0mQQsykxPBaNOwu4efdPI8dPEZ4I3zLH8j9xkmoi5K+e3D
         X6m5UVgAmPsqZ0SuUR8Li2l4exdLnpOahUXtzbxDYnO/QN6JC0uXAnsW9MmutTpI7jU7
         spLX/H2TW9KjHLFV+E6mxvRb14m9KVMW1ZcuqqElitAvoST/Fs/pDmCnvSijogNlu14x
         VIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975859; x=1737580659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCfgl7vGmKArk+EJSGegWOcVoBZ7U1jmz6/Mioq6zLE=;
        b=CNHvtKa3C55VUnvyT3giJbBtvHrcCNp1C2Kg8/1lD5lKEUoC13HkW7mlGyu52nfzpZ
         uYkfuc7f3qOkU8lVy4r0uvClPBGeEAZH4+kg+svimLIZ/HWcHrs3OzDxSkp4SHIh942A
         iHywGfXRQLM78miVv0E7F3r+em5JNf9z3xhP6otuyMs2wI9N/g74bJO27iwOL331p6Yb
         uxbL3uHGqSVVr6PZyoPfPIXdHJdsfKQkyAoZ1cjXCpVCZVT95YUY/i2hBAWp8NgyxI9u
         CV+1dHnxCmdA2U+T1HhFpolCTCZRQo51xl2Xxx6jkDkEQL3s2EMjI1WYKiJ8yxcBVRM2
         2RKg==
X-Forwarded-Encrypted: i=1; AJvYcCVsPohTG0X46e26G0m/D013MtA9lUxb1iE+3KDRVpEA0GrlCU7975VHfOxYSQMHBlgHMwK7NyY8ptyhVmaEO+8h@lists.infradead.org
X-Gm-Message-State: AOJu0YwJn5rp5quQXU3t60GA4XIZR6yD3j8TPMpaYY0AZY1LUFJshIwX
	/XPYCat4RdhEjo88wYbyYTMG3s2uqCpFfcPWwO4p1A1pzl+D1Iw0TedBY2UfBuI=
X-Gm-Gg: ASbGnctShrosD6pekKnNtEOCcJzqHwtpI3inOazKY558kuQIZQ1/dYNSYJThIRF+jM4
	zXDrRA1SwXbtb7SvOGVikcfSFKDToxl2k6OQ3PZaBnoqKb9BvxB4uF4CoBrk8JmqKMKhMh8+Rmh
	bWFCtbiQ4L5dZbGIPTU79qMabBoW6CEqGe6PDmrR14P+vT7fgsysrvzTEKg5iiMmK5vqFnTIXKV
	uxA5XKejG1Pfal1Zw2SPB8tEoXc/UllxS9XNI3IWad1ycHQ/LbB9+IVoSghDH5mKZRLurQ=
X-Google-Smtp-Source: AGHT+IHsZzRkw4vtn4FVAn4kRLRS3nmMRocOva6R7Cj/qsNTQrWb/u9lbDAFUEclI72beLDiczSrtA==
X-Received: by 2002:a05:600c:19cc:b0:434:ff85:dd77 with SMTP id 5b1f17b1804b1-436e269be52mr111914805e9.3.1736975859530;
        Wed, 15 Jan 2025 13:17:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d090sm18433838f8f.2.2025.01.15.13.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:17:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: marvell: kirkwood-openrd: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:17:27 +0100
Message-ID: <20250115211727.194142-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115211727.194142-1-krzysztof.kozlowski@linaro.org>
References: <20250115211727.194142-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131740_885949_DFB9EEA6 
X-CRM114-Status: GOOD (  12.11  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  kirkwood-openrd-ultimate.dtb: p28: $nodename:0: 'p28' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi b/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
index 47f03c69c55a..9d7cff4feada 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
@@ -53,7 +53,7 @@ mvsdio@90000 {
 			cd-gpios = <&gpio0 29 9>;
 		};
 		gpio@10100 {
-			p28 {
+			p28-hog {
 				gpio-hog;
 				gpios = <28 GPIO_ACTIVE_HIGH>;
 				/*
@@ -71,7 +71,7 @@ p28 {
 			};
 		};
 		gpio@10140 {
-			p2 {
+			p2-hog {
 				gpio-hog;
 				gpios = <2 GPIO_ACTIVE_HIGH>;
 				/*
-- 
2.43.0


