Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0180CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yDoZvnl9i2PCVqQpO58zWzoD91W2IfT5tAZBQV3TwY=; b=j95t0aFZP2xQK3oj3tdsII696t
	oOMeZ9buMYomZ+H17j6ODMXQIJxD5vD4MavWkwgu5xNHQdiMjQPrmHE9khc3earGEYZyR3sPttiwX
	g3A37ppJfBGmsOC7pYUgeI0a8ZGwIjRUtYy5E8hr6Z1TxCgf6+Wy5XIBWV5MGZQQ1P6MBVhgVbWND
	HOCiMVw/STyRQw6tWR7MF3/fssmG3MkIpQ8gmnAjICBGA3ntETjpGjB/mnDQdgVcAS9GdJPLiiOkt
	SasBjR9E9wWKO7KBLSBFnJNwna/aKb/H2XmCt50Q7LHomTVLGFZZ4x37LwFOgmLqla7xzhSm1Upee
	fiFA47dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUS-0000000C12o-3ctL;
	Tue, 04 Nov 2025 14:58:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUP-0000000C105-442M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so3448779a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268308; x=1762873108; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yDoZvnl9i2PCVqQpO58zWzoD91W2IfT5tAZBQV3TwY=;
        b=Lj485EhmVCNrzaW+xpqj/RCMcCkZZYfRnfKyGjUsG0U87aZgaNk+4Xp40Ycu/rHD6C
         IfLHQBjib4ec0uhVMZfPGrvmpMxxEW9vzyLaMGTk+NUBKtuH3vgnZt0RBmDn0zLy6dVl
         t7Twz+wnZV/54Pj5ixeJvF984js5OI+47lCN0E+sYKqbiu4OUZWxEhO283mjOSs8er1U
         rQgrXVq0npNkS7b8+tITq5Y6kh/iGS5VgErltqZmQpUkjTi7/Quimz3NSpACpnxH8K4f
         UK4Gks+/LImZLqznMb4zDsyVdXCv0CGctb38EB8fcbBn6hdx7W7QrG9bAuIFCUYillxC
         lmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268308; x=1762873108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yDoZvnl9i2PCVqQpO58zWzoD91W2IfT5tAZBQV3TwY=;
        b=ZW9iQEsfPww2JD+GJM7tCcCi0S/BaiCqF2BfwbhnOrF6y37j4z1rHncadwkkJSFNxP
         2hK3EU/KjinXOJ8GnFpcNUs38q+bfhyfxHTiA8in1fvox2c2cRmkJhtLQHinBx0kL3PF
         vrDeANP2XjTe8HpY6XZs136e5a6+dkUP5GgOsj+135yNvafapyRRzBrlWBhcfC/N0oBI
         /XlD+c1520r7d2+Rhuqqsms3l8uGl3IQvnN2gRsD/E6cvhimQFB90SIH23wl2mRnp2kx
         7/C9K9Z4X+OTXazuQdImPqfP0yjydRP8sZ6+s12p1Oq3R2SX6X78esRen1D/XEXXUOkN
         UlVA==
X-Forwarded-Encrypted: i=1; AJvYcCXIty2igEIDfC8NU5UPa/S5byhLkYNhzemgF743SMn2SXpZ4aXlX/rYaPSRPfK3VDVMQbfOKTfESXJpGEhyKnuJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyCdFg5Q4+2Jxsbaz7iHO9LBrepDa9KNRlxLVKPTqpoRTSizPWy
	dEn28KpJpZQBwKOIP+CdMT9GefxiZoRYNnrnK7NEsnDZk6GbY/svvXHy
X-Gm-Gg: ASbGncupAQdB0aKakye7xervKckuN869nlVOgWiHqCRFkFk4HLa0osOn/OfiUjodiip
	vez25XkkB1kp7EcgWjQ6tmXgq6EbL04F3m97G2P3zL8gZuFqPmsB3DPS+1RRTgLCxqh5NUkAxfv
	9LEKXyQ68Kz5UsWhLLPgrB3p+p9XMxExTs+VrJa+MbWUl6H4N+Bo7fcn3jqjr7JR8/DmgZYwY2k
	7kteYNWyXcsn95HhHTiZWEVMsoHAxTjSZehokjZEAkxzJhM8bnyYS6HRLt9X5vBZgikSONgAK8+
	vqq7/OGfD6aC2esAjHpyrTNSc4DJPMS5xGi3XIP6RqxxTNvZs1zTJh7NPKtOJRwwxYtcQWmFR+x
	bhq257R5vMk4DSDiJtn7lNkjtQDaRn1Frt63Vq9qUZZo/K6VWItmRREvBF6Fg3spYOkhdJEiHop
	NHoqVdN8rOxw1eelUvY8pobaP183DYjm++FDR2ufET4S4ahGI=
X-Google-Smtp-Source: AGHT+IFs9W8O44jy0to+HH8P36ANszj/+KkeaTelvysxmEQV/qsf42k3TLW8rGxbLiSoMryUWBJ0BQ==
X-Received: by 2002:a05:6402:26d1:b0:638:3f72:1266 with SMTP id 4fb4d7f45d1cf-64076fa052amr16212580a12.16.1762268308065;
        Tue, 04 Nov 2025 06:58:28 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:27 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:20 +0100
Subject: [PATCH RESEND v7 2/7] dt-bindings: clock: brcm,kona-ccu: Drop
 CLOCK_COUNT defines from DT headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-2-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
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
 bh=W9g+YJ6BtshhuZpzIE3hQJ772deNaUpm9Z9F4iVdSVk=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSNyhoRHcTk8Z6URFMUuRgH1NYbfHNCN3nuz
 TT5s4TYN/mJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjQAKCRCzu/ihE6BR
 aBZ8D/9GVrJnnbshf40Fq7EmWfKlSWadlwmZGigXl4snbvnPs6gFtD53934e9ydLgHRjv8u2HF6
 v3RetY0M1wonst8EpeN0+FuNakSthGOt128Yc+TgylDcybfRojzqe5x5QgzXnKnd17rLN4PRzZk
 b0uo3WfdvbegZCL6sTFjVIRc0186+231PoH/YXcwJEM32ltp/EKPAB3j26sIfQ6Fx7NJLkHbFhm
 F0YXJrGbjLkV8KYRV3xHTdDNTqZ7w/HZ2VZh69brnZptYURDhXlRehZR6/iZq5Qjt9dc1sKvh7o
 zTjZNyJy0LOeaxee4dnnGR5EqhiFycYqxrz1mXeb511qqn5qqrY6iq2ZAtSoF0gdcnkpkTpR6F1
 UzEJ3AVHAD8zoRwTv6u/EZ/pVyedM5nW0h2xCEx0tBZsGBjyRdPBrrZs4FHx03p8Glbo/dE+X/Q
 Islzg5UV4NnsdWM1pfAzZNzp1+frZq7Yz1BGpKUos9oGDmN+7qeiLqf7zQfmOsUa+EQLvevVbc/
 epSm5KUSSDLiBoNrTzmlXBjIwLFppBBuKazNuQTwja4J4ic23JMayyaGURMTtslUOr5+V8J0gkE
 DRJCYzq9mp2tk/wJmUWZ7jYqJfO+y3+JvxR7ZGYT5mLfLscGKy1XEiRu7tcjejTqLhGeskURnWB
 dpxZ04FL3Fn47qg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065830_039320_A9B075C8 
X-CRM114-Status: GOOD (  13.23  )
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
2.51.1


