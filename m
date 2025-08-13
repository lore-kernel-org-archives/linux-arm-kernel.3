Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4B0CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+2MgRxKtKDHXWfk6f/P6hEAfTTptZtl+AlJvXaWoE8=; b=hFylbzy4W+d2y3htZ6OXuF2RTK
	apOXt1pmbc0ADfrRG3ENd7XbJELYKvJTKhIcxRWToK0ybrOE9GNtmh7RHQQWvPab4vlxh40QZVy9x
	xOs2OWgKr98G8sqwUFYz5LjMXh3NiDsERt8cbCKqiMHK60iG8JA2cYMEYJGdYFKQ5Kdj9mezOnfoF
	PzEoYI8ei/SZQJ0mTWnILzuhveRG76CCS20bjoLqJbqSFE1FHu/VFlCa4lyHOROzmi/M7xvicPsdG
	W91CmS8cZh2Ki/gn3nsUVw8d98JAL0839dl+7AaHiIxMZ31LMPKR3DKJXkWPzI+GcXNOUo74byYhw
	Y8HSxwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9wb-0000000DYPJ-0PO4;
	Wed, 13 Aug 2025 11:47:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9DT-0000000DS8s-2jHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-615d1865b2dso9579814a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082822; x=1755687622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+2MgRxKtKDHXWfk6f/P6hEAfTTptZtl+AlJvXaWoE8=;
        b=AjE7+zZFIkEhYd2kaoQJd3wQ0/a/bdgwcE23gXinCDxwjYa9bgtxTAN1jdEvx26WnQ
         X/erfNM+7zo/bqTwmG/m7qq5oRgVxSu7JvfyztqJdec0HnRvaMj5O2oE5KYBqyTDw6bL
         J6nQEp3MG+UYyfqHF3gH/bESYSawIGJG3Bk+ZaihEYPMMNELWyYz7aaY/6TzjLXzfDEI
         g7A7CCcTbPV77d0euig27nA9zKDJNCYynMR0WFEQwMRdXJaJ4TFm/a7AgmVEfV/7iAjr
         fU/acvVUu7nAZ15kM7WtMLxQuEkBGxJPG4ZtibTIuVBN/8QsQGhQy8iLKsBvesjXwzu2
         iYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082822; x=1755687622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+2MgRxKtKDHXWfk6f/P6hEAfTTptZtl+AlJvXaWoE8=;
        b=QGbeO5Tps90UXMBxRVi5SnENr90EVP3lggLzZzwKs4F6uvOlSgXWAkNk5qyfpMfAYM
         7homjAnwC5jUeXWxTYOc14j8Ti2ou9FPsfst/B9tsn26pOzN0BcMA+4aHgI3DyYrDt7D
         74kTC7/lV9labL9qiy1GjIafxj8GK4B0sWcg01sGnBCZ8oFPDk9V6tVvXJiM1T6bTKtQ
         tFdFCZptfSvTh0HMCAFCPAK43ftRQjb6KYybKBeHI12hMPxbqmsY3r/vzeWL/lJMMyLn
         b6svXkG31dyRYqp0WAPgK0doIrRCDFk8siIEZs4hDe3N71V+xGt2eJROYCE0IMffqKFv
         PKWA==
X-Forwarded-Encrypted: i=1; AJvYcCUH2Zbq8L+x8NxMTs2Mdr6x4BTPdmLbvodJlhxympUonDF5WeHf/xmePi3mBuak5zTN7cpIRqurtwc4Payxcj9J@lists.infradead.org
X-Gm-Message-State: AOJu0YykyIGl60czIov2H7vNnSy8SGH0RkUQ+XTQhaOErOHafgjhi2mt
	iIllYr3PAnrfS8LZhIa+M6q6oc14RyHQIgN67Sr3mrnXXszOGpMJZELqWVEIct8x
X-Gm-Gg: ASbGnctuUWPoxgBopcKBC5+hixJibcfWmo+4k4JKBdDOO2APtYHArVbiDLopI0rsWuV
	sju3lXfB7ZUqceW/G3E/m07IlWqDBhClyDbWQvc4E0YNvxf/GPQs2UryCHfxd+6R8hF7xIgzUad
	exfKDNav6udJLOogtuWsd1JUmrlS9+pND5RoVzvctvR/Wzp+W+gCjFr+VjSSqMvBDKiKoDblM8S
	ob64egUQMkNR18lF98LO9OJ1CHTVrZslQgcdKUCmpMaZVRpK50m4YctH+Jav4RJsKxMFX2Ae60k
	kkRvoGKt3U/tXnfcTENKvOZm4tMs2DuL/J14Y2Py/5OWd+6mFgAissNueKgGnlnoy/Mnd9WySWP
	PABnH7B2d3szAk6WqhT2cVNEUHDpQ58AS6ZOxywWi4W5OgXFvpJKvd/L7g+DWIjOaZtM00OtL3W
	t6pWs5
X-Google-Smtp-Source: AGHT+IFjOro9467OEyMI/W2I01Woz2Ux1Tf4CSfsmNe+ZdoGRW1ROPjzS9YFPh/RmIJFSZt2ySWbzQ==
X-Received: by 2002:a17:907:9801:b0:ae3:6f35:36fe with SMTP id a640c23a62f3a-afca4e43bcamr236802866b.47.1755082821601;
        Wed, 13 Aug 2025 04:00:21 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:21 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:08 +0200
Subject: [PATCH v6 2/9] dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT
 defines from DT headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-2-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
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
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=+3gXC+OUGrttxQjNxnrmV+KRMD9spkRxLvYcC7eZAwI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA92e49EbzEuG/Cda57B6VEac13NXUUJTprP
 JPFrm6TMFmJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPQAKCRCzu/ihE6BR
 aP9cD/48iYmKyR6SYUNzEVA9jbZ2O9h12s1C5tuGN83N4mmi3FLN1bo/o4FdlOFAsPxHw2MN5Xy
 4ypgY/swakHPpo83zBjyRa8TpO8kK7QiR+9RPbl1uZ5V8Dj8MGnvCrDdcFSM5CfecPovUgE8Tet
 ZCF3thdVuk5gGG9UsvNQEo2OU0TsYgqNGWasiJBeKfznrPqSehsMGh9ChbxGICd+kYKd6FjucAL
 z/fJ6QXhzfVTa2iMc3X8DfAiLWeE4dWT6ad0PY51vtJP2XBdw2HW08ZB+lecG9dEpKxuVjxo+8k
 E2PLLpEHOkaLItQrwBg6Phdbdx+VrPw5G0m7JbHAfPQDNoCe4cRdIK5u4SpfPTwWMe3F11n/6T5
 cWxsqpaljKd4U7krEEtoX+oTvx+s6oMCa/xLutUhyVN5mzyJfRCZV32k4eaXWmbpvRssMxloOcu
 WQ5eqmdjv7rOZteaZhLhJ7EZKKWwaFv93Udl/ivAG3wxqB+sObuWmlz0EfrvsJ05yhdymj1YRxg
 sHm9yNocBGFrrl9Lhh1nazcnIG003HZe7/OtIfm6qtvcj5ahIVjH8zQSMMjAxrzJTvHaNxaCs2e
 TBv8RApc2WodRfS0tdcOYm8D00l2gm7ATL2xnMKcz8DDSKqoa3M5Atenz96Rjt9Kxt6Ne/vJ4tG
 zF0jJtX31KY4Y8Q==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040023_703264_6431F324 
X-CRM114-Status: GOOD (  13.29  )
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
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d4ca439236f2f352e432989409570..7a380a51848ce100cbf94f9da2b997dbe3a65230 100644
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
index d74ca42112e79746c513f6861a89628ee03f0f79..0c7a7e10cb425ddb597392939cb218545a48bf22 100644
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
2.50.1


