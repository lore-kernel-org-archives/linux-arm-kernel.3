Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDD2E64A87
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0SZ3/Zuy8g3IadhgXaPB8LqQDO37Mo3P8H3ntaK+Bw=; b=BcyzMUTk1qdt7+V6UyxsE3ttAW
	RzcboJ1Q+crJ22/PUebVJPTc6eRZw7S/7y9tsPlil85dJspOMcfYxHpH1GCbMQLfvfWfiLNHLHsFN
	pI96m/OYPS+l/abM3TvwRTNIENeMloqg46wiEG9+TyM9+ANvlsoN8qu9sK+E/GkYfAg52dayV7GqH
	6Dz06DCRSbiNw3VtXm00S9CiGLmCU3jDXySiAXdc2PNa/oiX+redPSYszCKUvO3/g/HOmkAV76p+z
	l7JEJQi3t1LHU5iLwHUwkeBKbdgT9sFGqLmRy/eBCOauT9ryhcXq6O6nzib9jZcgsYkNzyz9VsoDY
	cAZ7apSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISIT-00000009TpH-1efs;
	Tue, 03 Dec 2024 12:46:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISCb-00000009SJH-3EZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:40:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa530a94c0eso883220266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229628; x=1733834428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0SZ3/Zuy8g3IadhgXaPB8LqQDO37Mo3P8H3ntaK+Bw=;
        b=S5QRY1LSxx70GXMkGYSxU3gfBqsp2a+yS+qs0GUpCRvBjFKwlGPCLQGMRikl62KXxy
         UgAvqO+t9H6T+1QNyApzlu4ErB0a+/Nhg6USXwTm7RimyOAntkew/HqOFLKc3zyKeBqS
         /YAYXy7gFgMYxeciHUD1wwevOe0xoe3q0MtcYN7AgK1yMTrcHoeP3jA6p9SUBGzv1gt9
         SzEQd0vfXduxSGRjskTM5ZVerZ/w5z2ZiXIub79kBiJQ/I1a3mz4HKzrqepV15wUL8LU
         v5y6Ab/Y4EU06a0bHlkRysGbDScAKbbuE+PheoTrsF3iiGgDo1MkbbOPFJcrxHQdrcRX
         hG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229628; x=1733834428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0SZ3/Zuy8g3IadhgXaPB8LqQDO37Mo3P8H3ntaK+Bw=;
        b=oEkUZcspvefzkUNRDU+qoaPp6z2OO36JLW2R2CgB1TKB0+b1XOvE+MnrKf6uZbNAJy
         j20UvWlEjj4CsYP6XElmTCZDgfeRxL7DUw8436PzQ1cywRVA0wV8tNXnmw5ifbPEmPU5
         slyYFNOmnMrIKd/njjmeA6nwZEdXN9GNFNdug8UDLh8sDp/bmOgnZjvowtvk0jH1jUkH
         eE1QsAyEikpvgw5xqQEI6ejGzuUAMelQZjVs55Rgt4J3a5r4Pgn7xmTClXn4d2NnK26R
         ctuSZdBDMLGw9ON7xon3FxaFZtsLfNs40ICXGFAFogjWDsc3ZwhWPT0DHXa/FaGYz6NA
         6YWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzuKXoB4TTlnx+DMqRtzyLu6rTH4d1uzaC/NoRYSSlu2D1DWYR9H9SE1eVAVH17fSxP38Te1W3hl8gqMH47b50@lists.infradead.org
X-Gm-Message-State: AOJu0YwgWCNsWKfsi8OUCP5GxNY4TAv5ZNNNSbqjH+v7X+xxvfkOJdSE
	xVRwXF3yO30C35zxq++YyWvYL2b0Ql1iYcfDRchxJOjQ8ZKSIVWBkyPObbolU3g=
X-Gm-Gg: ASbGnctMUjuefo6qrmcgMVlZ/R8Rfr4J7q9FSL6brVF2KcRPexw6Yxe9xI3ayn1jRAQ
	jv9OapbnS0szUmqPx8FuZwSPx8GALjKtN/sVc430pRfKKbIDH4vtd4gYjW75Jx2+LULhaVvuaYI
	9NdL4BfWtXBJvmnIbwDE2zjH9ZXgyT874izl8fCu+jdTpXmVTf8XdiXNTaxYHVxP764uFLrgnbv
	BOVqFT2dQbB112j8OnO9sNFazcFH+r2W/LqTcz79PVdVn3ObZ2o1ygi6QCGt864mJz4XFfvzhS/
	Bm5LEocjf+o7Yj14Mr44V9qM8+e94fqtcQ==
X-Google-Smtp-Source: AGHT+IEtOgF5+Pd8GQXG5yAk2/ZT7iTApOoCMzUviVqMUPCGmvDJSENPWZg/xy3RM4OpVosidZ2alA==
X-Received: by 2002:a17:906:31c7:b0:aa5:3c28:e0ae with SMTP id a640c23a62f3a-aa5f7d1b599mr200040266b.15.1733229628143;
        Tue, 03 Dec 2024 04:40:28 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:28 +0000
Subject: [PATCH v2 5/5] arm64: dts: exynos: gs101-oriole: add pd-disable
 and typec-power-opmode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-5-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044029_807820_0F590AAF 
X-CRM114-Status: GOOD (  14.23  )
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

When the serial console is enabled, we need to disable power delivery
since serial uses the SBU1/2 pins and appears to confuse the TCPCI,
resulting in endless interrupts.

For now, change the DT such that the serial console continues working.

Note1: We can not have both typec-power-opmode and
new-source-frs-typec-current active at the same time, as otherwise DT
binding checks complain.

Note2: When using a downstream DT, the Pixel boot-loader will modify
the DT accordingly before boot, but for this upstream DT it doesn't
know where to find the TCPCI node. The intention is for this commit to
be reverted once an updated Pixel boot-loader becomes available.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index a5cbf1e10c7b..e58881c61d53 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -107,7 +107,6 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
-			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
@@ -146,6 +145,12 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
+			/*
+			 * Until bootloader is updated to set those two when
+			 * console is enabled, we disable PD here.
+			 */
+			pd-disable;
+			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog


