Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuJ1rCMKJ8piRzVxzGzbbZXPyezY0fLV1P9ou+GE3/8=; b=byKJIfr/iA1jsT/pB1zzwT9TL2
	FClujv6jkKvGXeHCAjOHbmhTbqo3P8qfWTRr1VYsxuFeZSGEmVv7F4n7MZwJws+sFRk0aO89bWxw+
	klI8is4eSipTyA5QBWwXevc4IfuaB+QW7Ia7Vb9GXEzRUYaXCC6LLzKvdk57w99yozsEI32pX+rII
	17+8wZNsNDMgua8bO5swRGtgG1GrYnPZ6xmm/v5GgdHR4/G1Q6MoQul8SWuoH1bdjdedFuZbOxnej
	AE/49dx4TaWsL26/vpXPUkl3Fs8fr0PdY1zI+jHTi4/pCQOuS/ut/XNC29+o+pwRYZTgS8n1c4nCb
	d3Kmc9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybZ6-0000000FROg-2dC3;
	Sat, 29 Mar 2025 19:09:56 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybP0-0000000FQ0u-111P;
	Sat, 29 Mar 2025 18:59:31 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac2aeada833so610396266b.0;
        Sat, 29 Mar 2025 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274768; x=1743879568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuJ1rCMKJ8piRzVxzGzbbZXPyezY0fLV1P9ou+GE3/8=;
        b=ecYvyHFwWAW75JeAZITt7MY5NmqF5XoYK8TQooTx9HGb4dehWX7mGDmdfV5H7EJ2fn
         SF3ziBx66r499G8WOlQfuc4GPhrUNhhVAvRZEYsdHVQ7EPjDnTK/rld2RbY9r7hgL204
         ANTRSkGHmHsGRSDMGQFrLOztL1koLjPZ6eZ3G0dRwqhnO/G5JuVpLfj6uIuA/HILyVWq
         e8MZxIcQ24ocky0zf7VyC3E8I9iP42S7NAyDHPw0UOE6Jk+A5E2LSNKNmKFSH11ZzX+P
         +07M802kpIbgW+4WJkYY6a75oqCRsVKLvQcbJ2XhvbC3IQwrm/EcYvRWqzJ9ityHps2A
         FoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274768; x=1743879568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuJ1rCMKJ8piRzVxzGzbbZXPyezY0fLV1P9ou+GE3/8=;
        b=exZazEQbW00DfJuXy+E46Iy6VpU9hS3h6pRtCad907ZFbW+YZjEwljDcHwFL72OElu
         PYl72bzx93eDYFDtZwtnGudJQg0LVi4sy0M1wr6vezXUPjWwNB74QXquf9/E3FWLCBT9
         3bxZhKj7sW2o0Nvo2E1BjwaQs3SgLAa17LDRGFShaQC0cVBxrZOnNk/pwO8cKi/BAgvs
         WOKwKkxpHwwzxgoXDH2g1A75jQp5ZbX56EzeST1Rbs7eEfwwQdHDEYM1vAOS40aXUBI6
         xLLYFDsxsMFcrdxNmGiF/XOv5fec/vLdXXCUhpNGjetwSC37CcQQHGwBKaJlVBoitk1S
         OC3g==
X-Gm-Message-State: AOJu0YxKQe2lQAtGUQ9ZTdua300nhs0pKlMGRfyeH0AnPkMryYdrGuVO
	2TvICTSk8LIpVRnyuJhJLYOJOPIroYsfEH+gY9JNhno2ZU0tmJOhAExEqQ==
X-Gm-Gg: ASbGnctaLwmLrHeNAKhV/8Xu/hD2sKhb6jClmelICEJ9A2xfxyO9VVoaLX/USEcQ6F3
	kRjUfC8fKIRCEAiW9pMo5hFn4YOJN3ZOFn80CNUXtGBmM9FcCwGPnR0l8/f5DpqIv/XcIN7CTc1
	dirSxDRjgGM5YEi0KJBs0Ogxol4QeH+Ht/Bhk4AaQZf/ETUX5sy2uejZFdqeRDwp1BRMsPYocFr
	jkFB+DZIw5fykiEYfTmukWG16zsa0DrISZ9utHPzNXngEXN6Nrf8cIWgPRvD5mv5c/0hg1b/xnf
	FWR6wK1X0rzxb0URLYc46cCXwPvTZ9YSCng+cWK5+Of/Q6hVVIQ/1HX++5OOuW02ZryW//X4ceJ
	I9j9Fn0/ZB9pLN7cd+Y+lSsyIDWntbSkj2+NfEiLeHd+WSZaYY9yre2JpPwiRXmMaeR5w3Q==
X-Google-Smtp-Source: AGHT+IFGctAWHqtx6AeFMYWfdS86m/LfdZde43epdyfhY6MjEgiqUrnQaj/WFj/gZ15p06VavYLUIQ==
X-Received: by 2002:a17:907:1c97:b0:ac6:e42a:fb4c with SMTP id a640c23a62f3a-ac71ec04f5cmr688598766b.9.1743274768323;
        Sat, 29 Mar 2025 11:59:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:27 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/7] arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:53 +0100
Message-ID: <20250329185855.854186-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115930_276834_3E0B1099 
X-CRM114-Status: GOOD (  13.38  )
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

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ab2b3f15ef19..12e8daaa1c9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1503,7 +1503,7 @@ mux {
 							groups = "uart_a_tx",
 								 "uart_a_rx";
 							function = "uart_a";
-							bias-disable;
+							bias-pull-up;
 						};
 					};
 
@@ -1521,7 +1521,7 @@ mux {
 							groups = "uart_b_tx",
 								 "uart_b_rx";
 							function = "uart_b";
-							bias-disable;
+							bias-pull-up;
 						};
 					};
 
@@ -1918,7 +1918,7 @@ mux {
 						groups = "uart_ao_a_tx",
 							 "uart_ao_a_rx";
 						function = "uart_ao_a";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1936,7 +1936,7 @@ mux {
 						groups = "uart_ao_b_tx_2",
 							 "uart_ao_b_rx_3";
 						function = "uart_ao_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1945,7 +1945,7 @@ mux {
 						groups = "uart_ao_b_tx_8",
 							 "uart_ao_b_rx_9";
 						function = "uart_ao_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
-- 
2.49.0


