Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85213C61DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w58IcK8ZE/FUFrG95ZGCGEBUQTz0E4TGMIPiEQMb1Vg=; b=GeDJ6JwapEA0KeCssmQASOGvHO
	C9wGuuktqWpEaVYgPMpS/5DVSKWnQyfAQQoR51COL4Rtfl04NEAqS1o+mMsc2yyZXgnDIWbmR5LSx
	o+YTmdJZwG1olKkrrHrOf4kFyCnR2ouqhxWPC2p4eRhHtT6NTUQ5Sc6UESygyeq7ugOzDW9OBNBXD
	QM17QSBk/PLYYPB/Q/Y5Ap1gMagnwDKQH2Qvei2tp3GnqOpfnXr3Xq9aD1STnjzSf2s5OwX+eTvaa
	yTOwu3Y6I9YrMVg8+2mTWaoqgYEXPajakayCf6DMDggBZ4i2nw3YNltDM1079iE3M6SuS5MoDoAdi
	k5VOxPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfY-00000006tjp-0eHU;
	Sat, 29 Aug 2026 09:48:12 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfR-00000006tfR-2Bhc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:06 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso11860215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 02:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w58IcK8ZE/FUFrG95ZGCGEBUQTz0E4TGMIPiEQMb1Vg=;
        b=fz8b8b2ynui/6fD+8xR28SzssuNTukK1E1tIARh9ReQd1etBL3ho2KZao0X/ORV2Yq
         xeVf/eDheQyiz2H99L0Ff7wa3bQuP1MqqK5g8Er7AusRzTkGSwBhxrri1as/nrYyDoHO
         zPZmFOmdQammTBsflZVmtp/Pq8znL/72EZPUGa6ikxn44n4Nr3P9Fflxq0L0KKSmLxZh
         oMrkqvyeIdxfDXQND+jqHvtSIxGSZM15lihrJQIihxvq6FlFrU8lvhgZ8RAx0nKYvv+F
         hibsnx4S7XWMofFH6/hj6e8uf0+Va9V6DZHT21ri6GNJ1k8H0nfQJP0HO5KxYHIIdQIN
         iXpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC75IzxmZIlZgeJ1tqxg+6XmofdVn9yl3n89jtO/ETC582o6/UpvxBEjx1J4oVXTu0bpyynVftXg2pLofriiYk@lists.infradead.org
X-Gm-Message-State: AFuF++nOsrC6z22LKI8p2x80r10SDujDP5GKd+B9xJOKOYVpfpX7QHIn
	tJ9J9XuWoD0Au2gw8FRMjgeCR/Pz9wm1y23kQmGsBWavHhds8Hh/IUHr
X-Gm-Gg: AR+sD10YvEeHNZus8MzitHVBb5XT136nK+hQjjH/5hHfKuTF8xM64qeEZQ1YIXfGN+f
	RZrf1mPwvJDEnDaLhGK5oLZP3bA6SHRQeUriwqsnFUwOEfujQDlngZnUYCpkURnd+XMWd//Uupf
	9HqJ8MoFQDE9NApSO8ns4pM9Opxfzdi1rzmyStdIX0vpMIL7JkEdJdj97bL4jALP5aeiUv+ljgd
	km8fZ1d1Ur3YDip0q9SBs8b0qDBfvyOt8CsnZCljhHr1NtiIrBAsclTOHokEt5M4zYi8wUHROVf
	Zx4LDyPjLa8BSBtQHLuLGkWQ5GzYssKgDJcKSyhgDaIRT9NOC4OSTkDBgJ8ttwAgEKWdzWWqHpE
	DgG2OwWpoxcFcNp9klHR7ZeVAF5YrHjg+NOE1l7Acr6c2vddnJJ9ArmV6HDYP0QO4/CGaBM08sE
	wjAAPZB+0xAjUZRQS9XOoqfuaNrBzw6wOyBo1/tq/N8FIFlFXGqs92bqyo39ZnMXBjwR8RoJ3hj
	SXfZFpE08WjUaUOPcjr/YZ4Nwq1JxM0UlJDIA==
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr177775515e9.9.1787996883483;
        Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
Date: Sat, 29 Aug 2026 10:47:58 +0100
Message-ID: <20260829094758.23248-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024805_580034_E9D5E362 
X-CRM114-Status: GOOD (  12.40  )
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

The vsync PWM output can appear on either of two pins, but the
description named a single group that does not exist, so anything using
it would refuse to start.

Name the real groups instead, one entry per pin. No board describes this
output yet, so nothing changes today.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8c4bd683cce0..719e111bc3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -546,9 +546,17 @@ mux {
 					};
 				};
 
-				pwm_vs_pins: pwm-vs {
+				pwm_vs_y_pins: pwm-vs-y {
 					mux {
-						groups = "pwm_vs";
+						groups = "pwm_vs_y";
+						function = "pwm_vs";
+						bias-disable;
+					};
+				};
+
+				pwm_vs_h_pins: pwm-vs-h {
+					mux {
+						groups = "pwm_vs_h";
 						function = "pwm_vs";
 						bias-disable;
 					};
-- 
2.55.0


