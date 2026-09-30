Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377C4CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=; b=JXUuJ8GkiIpbqjfvRNmwfh85uF
	YPs29Va6HmDR7aRDygXM+B+z6vp/InQiNNvuVMD2LqwOlw+zMOLRC1Tczr65l1tbUTynfMCbcdAS0
	AFVzIWvmHoWL2e4NViQbsVrNmMtPWRSGZaieIf/q/t23Q/47Y7v90qF9imus+Ev3ZbS0IIPdBmqZo
	8gGPoh21znsgBBRyOApOQMB1reBHgpEdiAGSax306OsP4EjNDZeHN5Yyiy14pzdGlPD6fj90a9T8m
	yv94xd9s8oYfqqh9gK1XH5nwspbCDDXiWkEO/e7Lny175pghXSS8M2jnVhCJve/U+xrSvxcmq5f3N
	ZQNVlg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwp-00000004ngM-0XSh;
	Wed, 30 Sep 2026 00:13:23 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwd-00000004ncq-3e18
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:13 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so60729f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727190; x=1791331990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=;
        b=lUpPET2qhiUN0GxWeeqrtFkMcfq74zYmbcTCrkekzT5pRmPNh+46R1vFyoZwCQyCaC
         dsrLsun0SMkvvwhxYHAKKSAX1Rw0MPffrQWSomoxyuKHhSoxCp9jz/6OYIszqa8HpPW+
         4Xj+SsufawPkFYbx0f88jzauJeZqG12Pd92zL1OEJ4t2JMWTduOwo217MbihOZum8Zn5
         ZiclPufvjmVW0UGXu0dQlXqyyHM30UhHrSlT2g3BebK+wjtE9BT4ECpjukXoGPaRVEE0
         7rzhvepnKFv60t7UH+3/mQDN8SMWgIWWx6tEMv6hS9UMpgrYihCC55EzuKhOeoc9TZEa
         IOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727190; x=1791331990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=;
        b=qV+qEUu5aMDZEBdxy7dERNgFKz+YTqWw4c6NvJGpxO2FXjwl6h/9I+4B6snmBb8xKf
         i9Iyu/BH4LaWzU4mL+WTPW/px4OdwqIYTJV388LCrOKj7sV1RQ8/dQXMXV6qwl/2Gn2E
         9vp2OvdvHTXRlu8wIzRMjq3jD9dM0bcUZAguQO3Mv/MxvW6n+TLhToDWUkldsG+Z/jEH
         4Zzbjvb2l5mRgNdjFgKSMVP7+FGZqBEd59OtUUl4oScMqcC4n0r40lr09xoFsw4fvT0l
         XyGfETbR9o8EG+PxueniU0Mjiz2JPiZ67b/ebQasuw/YCbOLlxD5osYbHbNzui0offWF
         JmaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9CDB4ptHup5lrwAMrnE+l9gCp+UAomjkVJv5zGjzcFGR5XAaVuJ/Q9lM9L8NiFhQkamkkdr4Ch9e55Ekcqwiu@lists.infradead.org
X-Gm-Message-State: AFuF++mUIcEEzT+MTHIkwjkBbzomcOp5NblvhsLNeRvB+yCjC8GP8VbI
	BxHNUjwP14mnKAWb140IMV5j9pCKww3n9phuwxDGKx2rFtFttAqcova6Xz8X2vZlsHU=
X-Gm-Gg: AYBFou1Yow6/lFFpSCPrHuLBCX3HV+U7rhOfMrnXWBuKiPfm6/DjxzfmXJihzs0eRN8
	BdhkBvDTq112x1LndieTOmSQyVHkiCPUc/KmH++wZLHWYeNpQkCtmqT0/e6R2JfgB0EqmshjeME
	/WM+NXwnPVPH+3eu6rmwZ1XdADmM4djEYx4UL/kadlaOOAMh6hMjRsML8zt9wZVyV9FQXUxVCI+
	HGHYVI4cHG0/IiRdhmRbp/B6RhrjpByWblymHOJ7+I3ysjqmRepGQQino1f+SRryBghn9GvhyQN
	XrMcF1x8+QHCGoeVEiueDoAPnB+0IrcG7KkIdL3y9rH6UHin9bmKLEJBfQL5rKCufvanmYJPEEl
	hVS+0B2qsaWTUZ7IRs6s/73YHiU6GfMfc7WIho7awcJ8s59c5rXCbaK8C1fGl1N4t6SWM9aI8QH
	W2tV5lQhid2rfjmlvOaezO4WjAntu3eGqblprS9zNjtLv7W8pzgV2Lp9j7sGziTapQKIcqd3ylC
	YfM/OuQKEVzctq4C2R9yZWfCHGQF6jLPmuQ6A6OPpUoJbw3haKboph3gHAP2g==
X-Received: by 2002:a05:600c:800e:b0:4a0:3c3:1ad4 with SMTP id 5b1f17b1804b1-4a01502bd28mr12961385e9.22.1790727189896;
        Tue, 29 Sep 2026 17:13:09 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:56 +0100
Subject: [PATCH v7 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-1-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_171311_939607_C636C2D4 
X-CRM114-Status: GOOD (  13.99  )
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

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..137297bf508b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11298,7 +11298,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -24629,6 +24628,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0


