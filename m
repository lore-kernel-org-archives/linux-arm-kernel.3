Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F411CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiB1x2GnfXq41ehyBCW9ZhOP3PkByTOf4Ckjc7nHIvs=; b=JSmXhwwcS+6VAZz+QAtItA6Ty/
	rasJYOGp7Ja8z6Ne8FkIBlS+7LSPHv2LcSlaoX+PmoDmJzUuZWsuvt5vYe3crK267e4Q68DS3DZDR
	l7oAOtQKxlOEIqNO9V4iA71dyDemfaNo14FrDFVBoE/NQofL3eJ53vDAQmsFwG07cf4WG2uuiYHyi
	dOMk1nfrEHemYMrnwgv/iyKo24TU5rJRhXBWzo8wylGRgzxQ5nUuSZudNeZ31S4VmxbhaesuBMw1V
	5KBwdXgqfysRDSt32Fr3B8sreGxx9zT5lYsYR71GrHTcWcOcTdB+JbkHHP6Eez9+fwufvY8/5areE
	R9+cIQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDi0-0000000EFVn-2Jwe;
	Mon, 01 Sep 2025 23:13:08 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80e-0000000DPKr-3y5J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:02 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6abcd26bso3386556e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746479; x=1757351279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiB1x2GnfXq41ehyBCW9ZhOP3PkByTOf4Ckjc7nHIvs=;
        b=BUS/gXCNuqT00rsKtXi8ng7cwuPEN4cCNcrH4IAMvQMze3qXCfWIYnPGMW8bzJkLtI
         BaEXRNfo8HgJ1eLrbGTz7902EaHmD9jI1KtOqscOddv4x5rmxfPDekTpp6f1gh6fVloZ
         9EFfUErdwzCzwZ7MFW6HdyBMrJCRX4IpODtWY5HMyxPhLULnS+h4ZkaXv5N8hb89ljf0
         1oIbiNINkLcNFI8GDFkemhAlGb6cpJLCwbdPTNB1d2q27/gFpEZn4sDADdHRdkGkoUEZ
         3rONzVLFjPzszJy6T1Tm9Fxs4umdetVQvin0daEDShKajiQj42xkA8rJho6NCLMnIKk/
         Oerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746479; x=1757351279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiB1x2GnfXq41ehyBCW9ZhOP3PkByTOf4Ckjc7nHIvs=;
        b=X9h/5T2d1gkQsAN5YpEfkZrCn6+BVIBI2jOHWRsAtziqrbUfvTSWK2KkkWlq6o9txt
         LTaBc/Nelx9nU3ciMRq+RPKT7OoMKbSl0gE2IYk0JrfRBI+FYDAUeq6SPb6jOkp4VJBl
         J/rH4jhCPk383dUzlC6cYviE0sVMFnwrADwxJwC/RaYT2IUZfbFhy+wpuDbPPnfY9lxJ
         ZT7lHa1/mujckYyi5vQYnTpciy6W62MNUxU5QL94GRWXAmZj9gwmA8K0FYFsKrwL5sE5
         2o5nsdXH73j1LuEELKijTIt4x+7ZPOKbSmDG394bhTvpgA1Je3IMEGjrTQRtLNS0ZgNQ
         AS1A==
X-Forwarded-Encrypted: i=1; AJvYcCX6Zc5JtuHH483PLcjMsG4lweTNUjtZxYCyLp1p+Z0QIgq0a336WvxUGUnU9fguMVj9vuAjyxgtc9SSIBvXk4wp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyghj8YkgRei5HCsR7dV/okQAwCUdNDAUNlryMViIMsj18LQOJn
	nZ5aGWH/KhZsqPyfE+L4yRtc3UvhVYwKIOq7RnB+66S48KoaCbKeanjj
X-Gm-Gg: ASbGncvAHM6aqPyM+rzgrnV1sMjEluN63kk2WSq9zzqQQislcaKq1gePyaXjhnI+Hz8
	S7161ICxsTAR6iCzmWr1+yemJmd0PI4bXAWWuRTdHYY3BO0Dg3IgPan7LI3vFXZSd5/H5tqu5XT
	MGxdtW2Nyk4+NYiDRklg8DkQI5RxXnvrZOgp4+OAAOF1hKZIsZRigpmc3jA82EkwPTgb1PHYcMQ
	Xju+dnafatHHzZ9SAfiPziekjwhNeyaumrWowplujiWaJ6PYrqghKFhkOzLFr7N+LvpGI7TzlFo
	XproxI/B+tWULCjJ5CK5BbZzLvPPFRWeA/FoEwPytmpirkkNEvtW7uZhubDdYc2UEoSVWqXWdXb
	SJmzl48F7yOENMKSi3Yl4AiRMZZrFzuO/Ukdfn0vd3TzlKA==
X-Google-Smtp-Source: AGHT+IEMPwVvz3dT+Wa5T1jv6PwP0GwVTvVM4L0/EXefUHmXiO71AbRQUD+lo1xy2csQBhZ56UYSGA==
X-Received: by 2002:a05:6512:2349:b0:55f:400b:1144 with SMTP id 2adb3069b0e04-55f709dc934mr2840126e87.27.1756746479006;
        Mon, 01 Sep 2025 10:07:59 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:07:58 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:08 +0200
Subject: [PATCH RESEND v6 2/9] dt-bindings: clock: brcm,kona-ccu: Drop
 CLOCK_COUNT defines from DT headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-2-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
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
 bh=9lBqvWgoHD1CvK52EJjFXkM4bmXfkUjDmAD5ePtG1Ww=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLJtJnA13rPAwrEmbCtVga/hPA3it6+0GH37
 HKIZtR2OT+JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSyQAKCRCzu/ihE6BR
 aF1jEACKEG0rMtSl7xca6+LF6eZGKGO80JmTNV8doBqGFebvOwlJ1YQ7vn6x75zxx5fFIPnH9fh
 kKzxqzesdhDdKooL7PaKAjoIDkNVrJHqU/dpT+Fs2eIgZDZvqIkCIsuxgHjbX3Cp3NhiXTRaSJa
 r67ePQ1CBgj9G3aL169r5Yo+xUCHOSrgi/RzEEwlkm2oA+kHnOGH/Xwe+YTVZqv0N3GYOuFwDNx
 xnZ01HhfS2qs24G4w6rVAPIskxIfVf+QGo1oJBqwzu+J5boWzQIsvrghmZZbEpCiHlOw+9GbGCr
 b1PeSPPuCM4kSGL8cc2PiBjq94MbFJqjtDRbz5IL1rG9E0AKpHg6Ftz3xwm0EZBT3Na/T3SBEBb
 EmP6w245RIomYH61vVkfVOVG2ZTgSKGweKjj1G9DntDJHUocj+qFj+8gh2S6Qk4kUeZcSa/DPMH
 XUllABhED7wpl7Plv+tqJNiyeiAs2CuNR+ZlmysmakDEVnx2G1esLBDJcf/1UFt2qrN17sTXiEj
 JilnoSiJ3BTgnfj3oVrXi3606m7QYxqZxJX15RSP/QAGrZUYwZIA3DQHYLXtu++n0XZOyIcbhw7
 k4Os66fYYNEq7hVu90zC76yg2wQ3AqsqBqsDmr9dEgqbOta3HPl109cIJBvDBV+bZjx3c2HMsvV
 kmOQQ1keVxWqBSQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100800_995384_BB12D1DD 
X-CRM114-Status: GOOD (  13.75  )
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
2.51.0


