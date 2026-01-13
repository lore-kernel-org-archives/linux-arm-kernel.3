Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D28CF45DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x3CYlMR0Tmf8RQ5i5U0+ElV7tLxxhG2GMXU9rUaD4oQ=; b=wUZyv7IgNw0FxkAf5qcMF/mQvZ
	3+hybY0xb3JkGsC11YbMgsAOuJ8rN21nuuZabWQ8pipmskoNA3rjtlfgQxVUJFn5m6uXa/r1MY+Z4
	E3U3c/Hp1VU8MId9NMe4kwcNlbf/nIiUIiUY4sRyx6EHdEU+dsmhgZ3mThMs5q5foVgC+K6IBPwfX
	sNgsRVrGSsmoSomfyV0VEzyveOseGCWkvcfqGFN9YRhXn9L6ZqaSLSxVbQjfqy+r5A8qEboOM+Vba
	JPNYnhL0xxd0gPmSxK8n4q2SfXv8CxgCeLC7MoRWXXvL6sAp/sB8Qgsf+xTKkZzFv2izGhJd/iPSG
	qD9ffNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfT4n-00000006NdX-2yky;
	Tue, 13 Jan 2026 01:20:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfT4l-00000006Ncr-0pFt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 01:20:04 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34c27d14559so3982768a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 17:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267201; x=1768872001; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3CYlMR0Tmf8RQ5i5U0+ElV7tLxxhG2GMXU9rUaD4oQ=;
        b=O8l6jzw2rbsblk6VBN8IdxtcVETIHGFspIFV0oAgtyTEnNXBCaxcp04spGE0LbpFqE
         qiiFLuhVZVgbriBrnakFP7gOi/pVfdowOlNy3Esme81gogm8hNTmlhWttDZV05Eqy961
         P4RXedQe4tR47MVwwJLiRAt6GYR0e5Rstc4zyT8jd7s7N8GleyzdLPkYvNi15RRqrLdt
         Pt+V3AytbtGHfGUwDdCnEPUfCypr64Y7I+f1Rc6dk+QOdEiqFYxlYGx6VdJjY5JyWq/f
         Ej2O47XKeIOH8gteExkKwTfN77dpqCmWWRTES7dNnlE0paYrYrmNmmOcSmB0qp1WAol/
         zVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267201; x=1768872001;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x3CYlMR0Tmf8RQ5i5U0+ElV7tLxxhG2GMXU9rUaD4oQ=;
        b=IEarO2petDQ2Hy1u6XIitRgusNeDVRxbtt4isIfLUNrmGZtziTyw0Yjqky/mWczdRc
         GlKxrpbEPioWSGdKDBPa++84NQUbLfKgosq1Vlef7TMJ7Ng4SuKS+NrXyt51EFtO2CvO
         V/ZTAHHCUHtTg9KdXsdkUEM4PsfY/vhHIwf/FQYhPNsUDXtk0NolmYPGmM923hc0yZ7W
         phZRlEgeR6snqDb61zEzcwQaVJm9JaLJFuXN8GQJKoZNvJwuAuwsExAxvXyu1zelNNTL
         8R1Iw4svT9OBtb3WjsmdiLqyRJ789dj1O+w0LPZWyEBa+h5/8Okf3Z8AzOVB3ju2CxAK
         OMkA==
X-Forwarded-Encrypted: i=1; AJvYcCWWmlsqOZ96Ge56KyjGgqKxSETWZrLExx4B3QJ8ZgZVpSEwIe2YWv5DGkkYbi9t7A6LZP94oghKdWP3Kez2y6D7@lists.infradead.org
X-Gm-Message-State: AOJu0YxRxLhZn2h8vvSkTcyJ7bDEjZ+b5/tLqpDdN1BLe3GgVzsDv+XK
	C8INmYRvctRKB2zHTQMhHKVDo7gKrV74sL16HL89h8hTU10Yeh7Wmy+m
X-Gm-Gg: AY/fxX4SR+TlI4+omtReTmKbz4rsQ7djRwsU6VbUfFBxpJOid+N/HfgdviUQsCf21Sg
	4Vh05iSDTkaFU8gaOuC8mmOqRsnwqzCO1vd99+0yjbr2nm26GjOukIhtw9b7IXhejBUhRcnadYt
	pgFXvbCF/V6U49QWsiYB0ybu1926eh305ErDnWHoFqcMx+ngPWgkbYymJPHbAU1CKnMMwApFQ6P
	HeiCc/pU1pVTzt5PKZNU4nOpJD0NXbLb6Hw1cpa9e2UdJTlTU13pxZdVquNbA3Zl1XIe8V0iU9m
	04yqp2Rx2YeHeHepzbepJvGIRjsCs2em8/SnjN43Ppp6UDr+CzVYQDOYjqNt871A/tXFv0zPIy7
	gqpsNb0kNiqHCCDo1N7qxgdM53Jz767xe3dHcgA0Ql9eQc25LjN3z07tI1uiydvzWWUkf29HHDz
	LupDUwaAA=
X-Google-Smtp-Source: AGHT+IG8txkoiMCUKW9YZHZofyZykPuk3kA3XK9+QfFe6Sd/CcyTQyE/WnqZnbSHsGDn+shRYOq7Gw==
X-Received: by 2002:a17:90b:2709:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34f68b684c6mr16514934a91.14.1768267201486;
        Mon, 12 Jan 2026 17:20:01 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c4141sm18533379a91.6.2026.01.12.17.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:20:01 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	xianwei.zhao@amlogic.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	nick@khadas.com
Subject: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization failure
Date: Tue, 13 Jan 2026 09:19:31 +0800
Message-Id: <20260113011931.40424-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_172003_241126_9358B6FE 
X-CRM114-Status: GOOD (  12.43  )
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

The SD controller (sd@fe08a000) requires a clock source capable of
generating a 400kHz frequency for the identification phase.

Currently, the sd node uses CLKID_SD_EMMC_B as clkin0 and CLKID_FCLK_DIV2
as clkin1. Both of these are high-frequency clocks (e.g., ~1GHz).
The internal divider of the SD controller is limited to a maximum value
of 64 (2^6). With input frequencies significantly higher than 25.6MHz
(400kHz * 64), the driver is unable to generate the required 400kHz
clock, causing the probe to fail with -EINVAL.

Fix this by reparenting clkin0 to the 24MHz XTAL clock, consistent with
the configuration of the sdio and emmc nodes. This allows the divider
to successfully generate 400kHz (24MHz / 60).

Verified on Khadas VIM1S with SoC S4 S905Y4.

Fixes: 3ab9d54b5d847 ("arm64: dts: amlogic: enable some device nodes for S4")

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994dfa..b87bc83b5a9bb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -833,7 +833,7 @@ sd: mmc@fe08a000 {
 			reg = <0x0 0xfe08a000 0x0 0x800>;
 			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_B>,
-				 <&clkc_periphs CLKID_SD_EMMC_B>,
+				 <&xtal>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
-- 
2.34.1


