Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E6BC61DD7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gisI60aIRI94sbsFoXYOhSYGpkylj0kQ6heuxGTepDA=; b=Ss6NZ3RWRtvlftl+PO5PAWhDmm
	ApYjkepmqvKQR29YLEbb1HR2UTgXRHiQphMF5uY2E8RJjHvkSNqrMhtSghF/XyDZui9lds24Bsao2
	bfGWazrhh8us+8Q/VnNZS65Tg7V4Kg4qqCWNaJwxfE8eZyeLJYrKtUaHqjg/rRIfLwgqlla9H4bp0
	hIvsl0sSwM6XcW1EPJRDPyn0V4LAGqce4pzl0v2iTWrzv0hSyC0YVUzVcJq/eVLF6pt631os/OaMy
	aw4lBbuXuxvm3W4Z0Ka8I/CynpUwMlCBYcHsjEqJTdowIZfMKkKgP41RRliqzO0PPVG801+0AB6XW
	WiaQO6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfX-00000006tj2-3atI;
	Sat, 29 Aug 2026 09:48:11 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfP-00000006tdv-1tsJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:05 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so12296735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996882; x=1788601682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gisI60aIRI94sbsFoXYOhSYGpkylj0kQ6heuxGTepDA=;
        b=ft1cj01Ed9Q0kK0G9pLsQVv5XXTUe2AyTM4hlvEhO2YQuFg5VBhIQpCrpK2qNly8ul
         njvqMiRH8X0GbrAcX9XpYqdv+WHmYTjxLSLWN2WQdT4gwUxtTJ5dTDTRr7t9/Ku2OeMG
         C9WJfUaNC7B4nHczxwn80XQGSrCWw2IbtMtHEYEMa84W3GPPy7Y9yLOsUiWYlVfBx8mc
         +C2Y8VxgTJ35OzyL1aTWae3B5iG4ea4Tu/DNzAA/Z2K/HYw6/Jr+m0l1j1J6UEpRNo1C
         35S9FKXgMly+qAbFfGz2N9VMVVUHxhFZJU+UWcAjb0/gM4kVRTqSdoSKTvt/OHO+qBBd
         2/rA==
X-Forwarded-Encrypted: i=1; AHgh+RqxKmsPXd6Uz/2vyI9x4BMuM+J5pIzO8KsX4qa5Umd+W4B4pF2obi9w9HiCv5jJSKEuXhu8rl0pcn0q+Z0lVy4L@lists.infradead.org
X-Gm-Message-State: AFuF++ly9/GfxeXPKgMQOG+NqNWAyyveEPvkMCDWceQecU1ZpXWXVPeB
	Z7U1P1aYAqnsh/28UZSjDGdEby53w6Hp1RN0pR5nicLqEET5qyNe4tlR
X-Gm-Gg: AR+sD10l8g+FVIuFL1+6E4OS4bO5RNnfEg8wvpG3tZxOSp1MH1LsDbjcmOqiOmAIogy
	X6S6muSKW5zCk9/TZIk8yZpIoC02hftS2prSHHzmJtCdA4Ftp5DyuRv6QUKfKouTKzCat0aR5CL
	a9/eA/UmR/vrM5jZym250y9Cs1IJaoT/6rGW/p625QrHhHS/lpjaEPrNgspnsmJ77H+ap9fqhwt
	+tCVaid+Im76yIEvb2xY7mxqs+3s3eI98yJe3cUYvtiAQCqFYjpAxm9OOcL1BLeUq3Cx5wzqx0f
	PWQs7wTGzW4Osre6dcDSP31x+swQiAayA94YCyBy/nq1nXIlTT/8jz9pgkvtornDAoF05quzoh+
	6UExD+51+0G/u/07H8mNabnXMtWkf7za4dQlZcKPk+cYjijqVtgGbJZNtVee9zjwE8wO65v7TBq
	zR1Hauu84hNaPcp4I+eTWG0I8ZI8G1PgxwETSOzZ+MRTFNxWW3WUPw6rLdkmDTaqH5YDyYd9dVT
	sxPqjSI2eDiTg9TohGaD7YzyVg=
X-Received: by 2002:a05:600c:858b:b0:49b:928a:3f9e with SMTP id 5b1f17b1804b1-49b928a4006mr137978955e9.5.1787996881702;
        Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
Date: Sat, 29 Aug 2026 10:47:56 +0100
Message-ID: <20260829094758.23248-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024803_493178_B0B05983 
X-CRM114-Status: GOOD (  12.77  )
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

Two of the PWM outputs can each appear on more than one pin, but the
description named a single group that does not exist, so anything using
it refused to start.

Name the real groups instead, one entry per pin, the same way the other
multi-pin PWM output is already described.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 32 ++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..8c4bd683cce0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -458,9 +458,25 @@ mux {
 					};
 				};
 
-				pwm_ao_g_pins: pwm-ao-g {
+				pwm_ao_g_d11_pins: pwm-ao-g-d11 {
 					mux {
-						groups = "pwm_ao_g";
+						groups = "pwm_ao_g_d11";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_d7_pins: pwm-ao-g-d7 {
+					mux {
+						groups = "pwm_ao_g_d7";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_e_pins: pwm-ao-g-e {
+					mux {
+						groups = "pwm_ao_g_e";
 						function = "pwm_ao_g";
 						bias-disable;
 					};
@@ -474,9 +490,17 @@ mux {
 					};
 				};
 
-				pwm_ao_h_pins: pwm-ao-h {
+				pwm_ao_h_d5_pins: pwm-ao-h-d5 {
+					mux {
+						groups = "pwm_ao_h_d5";
+						function = "pwm_ao_h";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_h_d10_pins: pwm-ao-h-d10 {
 					mux {
-						groups = "pwm_ao_h";
+						groups = "pwm_ao_h_d10";
 						function = "pwm_ao_h";
 						bias-disable;
 					};
-- 
2.55.0


