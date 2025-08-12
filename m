Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55392CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJV7YHis7znGp8bI08CWuwiCGtVUv6W3lUmzvPWlQX8=; b=DLrELYHkcH21Y6igq2D1dF+NYz
	T3NMVvdJ+IS3tPKEHf+WvZrZa6TbrJWHZlu8CQ5TW4bt/MxiOjjvJ18SHmWdaezXPCyMUlIfwEBV3
	3G6LtjrTmC+R+x+JZ0PTuk8Ae4MBeB/GpBapPpNsijcNW240omjDi0wB7qExBGuwLhH/kAX4eF9gO
	FKUkY//rUoB6kIByed61blNK0AMCPpWn+lP+f2tCf788v/GJhixSVDA7LCsVybgxkwsoe/l71zpXE
	0IVgxqfNNYU3OZHHsmXWg5vswrERaU76QM1Q2fN7lYx7nJYpRNYFWk72Je8v7AKNabFyyuKEhKX51
	aiMMG1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIa-0000000Amvb-1bR9;
	Tue, 12 Aug 2025 12:40:16 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7T-0000000ALko-2XjI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af93381a1d2so832561966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990194; x=1755594994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJV7YHis7znGp8bI08CWuwiCGtVUv6W3lUmzvPWlQX8=;
        b=2xV3+MH9vuPLknmExn7Hpn4Jx8y8TnZnkcavyXa/3Qfbnt5dEsyCz4kSMVkXHjnVbB
         LNVGpTr2LqSnukxKYaQ8wu39mNFWnuy9uWzxA9KuJhnOcCmfa2P4YOWH75BzT7cP2DaT
         +svvDV1eyQz1V4OoGmkp7kquSdlUkFDtDn8hV/AsVXFqBTqTiLz8XcFRPV8kJZoCfPyD
         gK5SlEJ5gh5WoZdwy1EtUNkmOQX49EnW2ZGLkAZseq8IpX5w1zMc1fKs/G8np+qsf+jP
         LpuwF8YEDt/6XK5o1riGxKep/T1n8FtWuYlP9+xvEjSqAQBe72Kv+5kVa5M0X/p5E8hz
         WUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990194; x=1755594994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJV7YHis7znGp8bI08CWuwiCGtVUv6W3lUmzvPWlQX8=;
        b=aGQLzRFd0hkEAooa5OeFpTNRW7cl1T7j6/HheQ+4anupAj24YBvOoB8eY9Hg1Q1WHY
         oSfi4TSECG7osyWeTH/DEardLmjxLfzYlgE+jUmQsw2GHUYqpmOlKABAUGw43W7fHCLH
         EFtQNG+hMBwMuIGc3cDktgHhwKqUFMsEZt2MjXElVkeiSF3nmRQgmde8NMOVWEzmnNW6
         qkQ7jI4vQ4dP7i0GJiBU/EqBKG6tTv7vnsr5ijTHWYuZ5OIQOWEB8KxblX1OJoLny4Sf
         kn5EpoJ1Z7RE/ybyksmuiuJ19sfphQEaQX6KWrV1/OUj0/WxLiRnokK07zhw7X8hKu9K
         o96A==
X-Gm-Message-State: AOJu0YwFU3SzDs6kTCQp9r7dHwkhtQKhKA3agPj307AhYI8XBHe8uaOe
	xvu7+KKDqEsOE300ajvCEy8Xwmyg2/zY8WOcRCO8RlS33JCpUp1kmVfhXSrzEa2X8mI=
X-Gm-Gg: ASbGncvxP2sSdPkl0SqZJ5+qP0fMebD3amI3JULUXg+YrzOBRbkLhZED7wc76534upl
	zdMX6QA+ZhmbeSikiExqXmu4Y5oXZWjZlowm5b9a4gLsmR4ZDe1eJkwdugnI5JqmyGnHX7bfMSS
	KdylDZO7UnnVJpcVKqAw4P5LidFthnj0GWfLl3e6i0EZGHZGzn3QnFzprdsOf12xG/Hx+D9hAXc
	Mm3UWgULyOFoT1bQGjQ05ORJy2ZK8/ueqz+vJ5JDVwCveEBfP9VeOdXbYgbgmLpqfwNLbvlTV9e
	iv7k2z8mAxhrpFADDAiqBjdsiwfCjVIYwWyF1q5HhfJQ+xfaCssITwfa+I+EGWU4n2HSlNf+gby
	SSrHKWmtUSylj04bZddmulHzUUyUr
X-Google-Smtp-Source: AGHT+IHh8cqn28ouC7/YJj2rnR4pJ0TiM4OD7GAjc8cb0zqPwyxYiILrTmg7dkx5KBh4sMc/Lq0YmQ==
X-Received: by 2002:a17:907:1b1d:b0:afa:1d17:b5c5 with SMTP id a640c23a62f3a-afa1dff7dd3mr228206966b.19.1754990194063;
        Tue, 12 Aug 2025 02:16:34 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a1e8359sm2160921566b.89.2025.08.12.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:33 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:22 +0200
Subject: [PATCH v2 3/7] arm64: dts: ti: k3-am62a: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-3-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=msp@baylibre.com;
 h=from:subject:message-id; bh=U+sQZCXY+70gu+lQasLcWAIMKRfycTDRFh5r/EUihZg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbCGBLquu95ZoJH6wn9B255Wv02xfKYebx57/il28/
 1WM1fYlHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRn5qMDI9PfDr1Vijiz5Jg
 3WQN2zetV7a/udV17HTb1qDlWT1m344w/DNkmaF3KP2D388NDI4xcUe8Qrb1/tT645fQc+uZmEF
 6EQcA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021635_646645_6401D298 
X-CRM114-Status: GOOD (  10.03  )
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

Add the system states that are available on am62a SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
index 4d79b3e9486af18b8813a8980a57937669ff6095..31b2de035f0f748e34b8919f90251aa0551d9b32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
@@ -46,6 +46,33 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_io_ddr: system-io-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-deep";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.50.1


