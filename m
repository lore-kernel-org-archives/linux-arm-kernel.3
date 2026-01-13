Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3265D0C84A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnLZop3FdYjsHUUgl29dM+sZjq07g9wAgMcy0IQcJ/Q=; b=vTcFm9lF1B+mw/YoFhdAJfFJ3j
	9/NJYVBip/tmW1x9JVEv5Py0ClPkWpORKNIrQNjc9tmxCLuabmdCOFdKDCgNe6CXKPQbT3IxABpRb
	txyCPGJtFGmK1xkQiQv96t4evJKHgq3XrUUz12tX9L1kuehnphTGkp6o1piC067Qu8NwoZI/ksXAe
	7qesroREoFDNQiBsczfK1r5CsiXdI8KRhJ+GK8gS+DE2/mJh91CoYfTGV+Do9IdyZvRcAVFcoR88s
	pu1mZJoHMconlSrgBR6rNkUyh+h8TysQAtGIWINWv/T2aWiATO+IK3SUTNulWAZp3w85OplOnXgm+
	uqV+Vo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbp2-00000006vBk-01P1;
	Tue, 13 Jan 2026 10:40:24 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbov-00000006v8u-274j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:40:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so59227925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768300815; x=1768905615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnLZop3FdYjsHUUgl29dM+sZjq07g9wAgMcy0IQcJ/Q=;
        b=0y7voSSKMUoJxn5LVAHPuWnIc4HAMnTNQOakKhWsjTQG0FrfK5nPxdCm95SmYnJOU2
         UDHp+je28TZ1lTeIvlTPqPOG647FyyMwNBNxQpCfJzM8zw4GGBfGDqbtzFcmr4BKijF/
         satDE9IzKg9IpvBi1CCIGFQLvDb62QYLNZV2CW3GgEUrSezYHHizSHbXqTl6AZuG7Jc7
         mbgvKN7YEHpGWHKCztAazAqffRxXgygTrYMXkoaw77M1FChwPMey51EnTLULL6FydLMN
         HxY1FojOjmNahPSMQF2geqmFJF02fDEV4MRbxO/bLI741e2X3imxu6uW7tk07Zb2g3S2
         anSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300815; x=1768905615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UnLZop3FdYjsHUUgl29dM+sZjq07g9wAgMcy0IQcJ/Q=;
        b=DJ92W02WveX8O7ap2xmctBO29S/xA4cecZHT9JOwVxbeQcPxn6TxCQ4NDLXgK0Qw4b
         s0s6iF38CoKHFg3dp6gB4F15eJ+bY8eq5sGDTB2hVsb7deFdubzAJeb4t7oet6kGJV/F
         PnihdMUyJcwTmkfMEJlG1tfrXhWu2R241qW3ZLRycsq8wH8klArowUw+R6e3q6tDr1JD
         aD+RYeAj04sJbgZRZFmPyiV0E4+2S2dT9U8rxqMkgh46OzRh7gSNpSm8PMue+0OMR0CB
         DsleXxXfuZnxiwGkEoY57HDPcoQPgV8J8gtzhGSKuZWWVXrt7JVAhr1AtTv/NK6t+rQL
         jstQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhVqXXRj6gsAiVW0edPj0fY1XbAwigVelU0J2gAl8a5ydkx3WJXdvGjx+9vkzHd2wEXpUkarGVEEKd9UqWH1NO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy++vo5qzvV72gpeL5gRjow4ML3xeuYTGW51CITcJyH5MoUlGjy
	5sYUCTdeANnWDrs5xJ+BqZo2eQVHXLrHzY8MEQfuqCmIo6nxNsvAFLdPN0Z8LcoKzq9mz95Oyyq
	AG+xJXw8=
X-Gm-Gg: AY/fxX5b0B4GglvZFXqSgVHuE/7kjRmJApZ34OlDqQHI6JHqZX/pJiuqYpkWLubehbU
	zogjN2aSEQBi/YYD5AjDt02aD+roLFlMEuwXrauvyWqdtEEuOpW8/0QJgfBWJSaYU1leTeJCef2
	o/n2w6lXoJhsidpLGh9VoqoOVT70Y1eacVHRgswQ/FoqABos06ccAuCyzblzNlWziFlc3NNtlsQ
	5WaOCjKP1IH6IWjHfbqnjn9MBjoTJWRmXjwY46XGGKGAQWgfjiePxUJrgVxBLQEnAUNRDOyfZMR
	6SashLXFL5syLMIwAYFRymuC2L7P5Hw/sFcytzWQSRZFJldYRgY1VWI/sU3tYAr40Ulc5zxFlFf
	w/9BHYjJOh0jbf34jTuXVzvbDjRHHN5gCGHmSQFUzrYzbTcKKjpvG9LWK2hbm23AqSQi5rv14y0
	g2NSebeUI+
X-Google-Smtp-Source: AGHT+IGPW2vs+GEXonUOGv6IM7v2Be6/k/u4eUy0hFfz4rHgAx/35xxKSfsgLIvsYF9dTnC+mseAhQ==
X-Received: by 2002:a05:600c:8289:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-47edddc38e7mr10052165e9.35.1768300815540;
        Tue, 13 Jan 2026 02:40:15 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d7f7035f2sm382339935e9.12.2026.01.13.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:40:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 13 Jan 2026 11:39:52 +0100
Subject: [PATCH 1/2] arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-amlogic-s4-mmc-fixup-v1-1-1ab1fca0fb2f@baylibre.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=+3Sp0zoClYxRTJMrmAOllqTcq4LFk/dhcZRRSjC5SpQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZiEKtOxqTFOKtX2+9jhMdJerLKLuTs5VFZGTk
 cPNMF0bHRSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWYhCgAKCRDm/A8cN/La
 hRIzD/4mJQr5r7TZXJ32gzQCCYrYb5YK0a4YhVLdtqKQDJiPDf0PyI2ITBQGfu0xCZWp7ZVPD0w
 bp2WXD7mUAqfTUzGCveK8P+yDdyR/p6a67TB5irkz/C5shmNChWJ2NspvzzEF+wBcnG3TcxQyZ8
 4gEnlB0xZyxa68Y9GIQXoaRB/iI/nc7HgG9A6ZaQ5Aq0wSOJypS9GMxx4ZPZHh8fyphWr4SRda5
 Dq+l5Ek5fNEqKvntPg0et74VwQ5/Rq8CPIcZ23TaEpcas/Atp8tzvIglNr1WaN5kYKf7pgNGOON
 kQ6vowX4CItMnyV/DEdr8qTkt8t3gFXfk0mhNmtn7G4LC+ft6NTM5/MywvTQlneoeYstrhAWccH
 7STGYsWmk8p5CFpVfIqUnM4NVb+U0YXYNQFchlu4nAi/lAoJBQj/h1iDwHYpcwnDCorJGafvZ/4
 hjPajnClilfVGhhPElJ00frSkXNrZfePckikDbPjGYTzUhv7rkYMUYgZM/BOnisHUC8yg/B8/KL
 qbjVJjd2oWc7ld4BX+dK21fypfTRwN/xgxGzNKHcE/0R7GC3x1kfoSu7X0K9WhCEV22INB09wCx
 oRlr/oW0DozchjrgRZLRRkKb2/HI3twqffyaJSwjhDLiLnPCZH7pARuIl/Ds+K7BkDtGCSe4ASp
 W52bQeCytbUNNWw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024017_562140_8B39212B 
X-CRM114-Status: GOOD (  13.13  )
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

The amlogic MMC operate with the assumption that MMC clock
is configured to provide 24MHz. It uses that path for low
rates such as 400kHz.

This assumption did hold true until but it now, but it apparently
not the case with s4. The clock has been reported to provide 1GHz
instead. This is most likely due to how the bootloader is using the MMC
clock on this platform.

Regardless of why the MMC clock is set to 1GHz, if the MMC driver expects
24MHz, we should make sure it does get that, so assign the clock.

Reported-by: Nick Xie <nick@khadas.com>
Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994dfa27ca5808da7ae0825e9af255417..62538fd9db6b1ffb33a88e12628aadefbaa453ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -838,6 +838,10 @@ sd: mmc@fe08a000 {
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		emmc: mmc@fe08c000 {

-- 
2.47.3


