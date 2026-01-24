Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF41D715EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=; b=jIQkBBbZxU1/qaT0lm51lTHIUO
	p0aWB7j9a8hCIpcrCNRQVhaxRyM9vuke3Z1ey03gRnOAhnK4uz5VbhJLi6EanALkdaKfw3bbGic/6
	Nnlp/gG+cYBg1FwjWUnGD5VYr2kU6OkaZe0dW3OoqMpkaeDGG0V173V8bfC0OI9fqcD466TucT2tf
	8rLhsGTOho0T0gebZxiswKVsV2Kz5E57TVxPqp4FXbooEhev/ca9g5y0lYS1jt0880mGRj+VQXpzt
	lay44V3z1cQPg0Q6gYR3m3HyTT6+ZH948BNVJsMAPCaKtpI000Tm4kSV/woe8vhjAfbfDWskwqomv
	fG+cJOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9M-0000000AO7h-2trV;
	Sat, 24 Jan 2026 17:10:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9G-0000000AO4M-3bjY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b87f00ec06aso519326266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274609; x=1769879409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=;
        b=ed4QZiGD7z5LuVY4dHhcgE875y65lw09d+LWzW1khUd1OQ0OdHpIdiMdDUCqXPGhx9
         Lf0j0+glPcd2z3qCnd6nndd43MHgwO2o3oadszcMVj0Is5DBT9rFVvofBlIIR6cR5CI/
         Ru4FpmCECnl/lR4aNB1WWWsiZhW5YPW2BlTROIBsOrUu7gT6i8DGv5D/1xAhgoinl+b4
         WgnEfiCbXP/896fhoqCk0nF2bqiU+9mWTXhz6P+pKHrVbolng8T/Xm/qIHlZuROrIAjx
         0HIkTrMc2+0JbgxEDvpVQlrBVTfRLhFFz4psRo4kVe3U/9BJVxCq+7RTdIxXHgLUht6O
         a3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274609; x=1769879409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=;
        b=UvcZmL6KtxIKEQuZFKGy3YVuR9I8efETKSOiHvlpdSUJrGpoP8NcNGKo0MNMThm/dc
         Yxz853JCiGUHrUnt4aOVVjqKRrBB47ZMLXdB/0H7uM9q3LPrOgq9mDY4asz/hgfw5BK8
         M76TF24JaTLIg4M7jMzxKkY+Joe2ZdE4NyDfM3xgeB35/w6br9tWyDuHbgVCMfKxAN3m
         9jfFU1Jp6qBN2m+6QYbX1Gdwta3FhNKAniWgvrkRI7xMBksXWwsFxaosxi0e2FVMNsKO
         2jWjM03iRs1ekOnU75e9hPGxbNQKjOkL1nMdoB+OAOGzlxF6OkPPABCVAm/9ZKsRbZ2A
         iZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqNPPTJ66YKCIRM1L0UxCgLHC/o3BBuxrZzQeB16yEaiv6D/klmAXQ0ZEOj0vph5WW3fsytJK1bGkuMBjKi5Ul@lists.infradead.org
X-Gm-Message-State: AOJu0YzPHbHGL7gyuFPm3rtc5VpOvhbh32wqkTYPdqG3ww3eG1n5FRXU
	AxVRDIxNiOFUnrlWNfvdQOODdrgwlztjLC+tA5GWEYMf7g/iMdz5SQwK
X-Gm-Gg: AZuq6aLTQr+HC6UJb1LctMlZDXZcQ8t+1QCl3yXWdvp0p/COI1C1MGN2snkrWYPPkck
	NYPzZcmfc2CCsmghxypy3ndHpFnb+scNbfHlJV94OOvas5GN2ceGNUlhgO2LqoqHyNXdi9RJt43
	+yTdfT/sOhBc6zVPqj2dR1dLhxp5oDgZri5YB2aq5fW5f/RalT8wRE1i7qEHIGQrVGDYL6VxQpS
	vipMuxAUb3sV9UTEkXIhCA06SJ4E8raJ9Z1uWDMg4rO2WaYfq26RM0do7uuXP2FruAChOHxq9HI
	UCx7IXr/iqybFWIbTq6AfWmsxJ708S7C89o9CRbsGtbm/OqvwoY5Or1YTgemPGQdPGu6AuEmH70
	fEFICXwvfeuGARbUYUNWzI5qZ1bIh3Ai7Nvg2oWSiZnQNzFp8UMdKmlyZ5ygsZ5S4Ucy6tD/qkp
	15Bu+av2xRcWwH1nklWeNEoAB41hHEVjXV1rQNdeRuXn6Ojh+l7/S2DYnq2VhzZcz0ql6cUcldM
	rE0RZZvT7avHz7FFOBp/UwESLECUO47Lj8GNtUkMeO4Kg==
X-Received: by 2002:a17:907:d91:b0:b86:f0b4:4974 with SMTP id a640c23a62f3a-b885ace961cmr524530866b.26.1769274608550;
        Sat, 24 Jan 2026 09:10:08 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:08 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:02 +0100
Subject: [PATCH RESEND v7 2/7] dt-bindings: clock: brcm,kona-ccu: Drop
 CLOCK_COUNT defines from DT headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-2-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=oiXhK2A6qAjCeSrQjh8L1wUGnhbIoDCcnIty1f+TnrI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr84AtMz8e9EIpfABMWvoSk4kv0vtrP8/IL
 hSvXEKVnzqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aMKEEACRNvmrJFuQDxrjGretSv/T2u+KJjPG6EBnz0sOxMNotQ2zoZFowKVbvvWbOzYW3ULYzjb
 1rML6Y8keRWjGapqEu9z42FFjJTbjM3Iu5gvTYraySovyj8GHrc3mHYbpCe3YiNkJNYaBE2G4mG
 9VHUniRuqF4lH7cTsh2BwzyOx9Or243smDt97LqbOA09fmGhDATS90TvVfQyLqd1nVhynho+URe
 D3kpMqEFVZWLNbZtTwRdJOEg7bTAGtM5YbY88EeNZHx5faZ9YEWrDGNlD+gMKbYvLnQmUcENox9
 CYSqQKH0/Vg4pVEw3gL0YtsQaioTVg0bXaOQPBRjbArymJM63vMLs9+IWZVbixCqEWjCq5WuVYV
 FGyfJGWxzyBpA9PxWSfeqiv3IsKFSFOosQYoeuv/qXTI7Ctw+EdlbPIzgByH5TW2uJE3SXAHlE3
 WisKISiz0BkCdmVvApNbKHvUrKapJE4b+A/yjVp6EMFvGroI+ZwEC4vpWWvkLsLNGTK/bxFrQt2
 s0i3BmrQiKHqRIsjkiel6CSuw7FGOdt3WRw69kZg/3yiAklm7lO2Q2/mspsGo1WbdYp8d8EcyXf
 vO0SbxHYaOx5Ocylsd4WtxwRoh6Ps4Zq3YJQStn3VEEbnyTjes6nm5NJoljXJcu7wW4nXEhfyQD
 BVjWHyUOVW+jx8w==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091010_929127_E7612D02 
X-CRM114-Status: GOOD (  12.46  )
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

The CLOCK_COUNT defines are not used by device trees, only by the clock
driver. Keeping them in the DT binding header is frowned upon.

Since they're being moved to the clock driver directly, drop these defines
from the dt-bindings header and only keep clock IDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d..7a380a51848c 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -21,12 +21,10 @@
 /* root CCU clock ids */
 
 #define BCM21664_ROOT_CCU_FRAC_1M		0
-#define BCM21664_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
-#define BCM21664_AON_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -38,7 +36,6 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
-#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
 
 /* slave CCU clock ids */
 
@@ -49,6 +46,5 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
-#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index d74ca42112e7..0c7a7e10cb42 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -27,19 +27,16 @@
 /* root CCU clock ids */
 
 #define BCM281XX_ROOT_CCU_FRAC_1M		0
-#define BCM281XX_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
-#define BCM281XX_AON_CCU_CLOCK_COUNT		3
 
 /* hub CCU clock ids */
 
 #define BCM281XX_HUB_CCU_TMON_1M		0
-#define BCM281XX_HUB_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -50,7 +47,6 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
-#define BCM281XX_MASTER_CCU_CLOCK_COUNT		7
 
 /* slave CCU clock ids */
 
@@ -64,6 +60,5 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
-#define BCM281XX_SLAVE_CCU_CLOCK_COUNT		10
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.52.0


