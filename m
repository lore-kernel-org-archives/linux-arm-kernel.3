Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30ECCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=; b=s+phNfxj7NpjghOmHwe9BlmndF
	fu0wKOYCfncIehPP9F3sA22Op3lIVntmYUpGfsf26Nzl3+u/Lv8F2RiJHYV9UN09qt9oMZSvm4dQE
	msFwuLG8zct+Tawg+O1+ed119Kg7SUEhpp7y5V2u08EAeRMP/FtsTpnCIEzmw/0fpw3Ir+onkHqcd
	UPpWy863WM7BJjAwyGnZoN6gP0KCEvKTx2qQihWIa/CpGeos6xoYbRb5n4xujtzo2wRt26gqhnSjU
	y1tDya8QUY6p9Mn4452tYsmlCKe7pzXijlDvrHta6CHi+g8lX3uA7YcadxWE5dTuenSFzTmoFUIc3
	kAMt+aBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q3-00000002VhG-1xLh;
	Wed, 13 May 2026 12:37:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8py-00000002VbD-3ril
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-459bf19e87bso1977443f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675837; x=1779280637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=Ve3mREsFIazeoNXPtvSLQBSyCTwb6bP9Sb/WpkP3M4O4oIdazWVyvbnwQkis/hMy52
         ePHVa4uNeiR6+pu0jDyHfh4pjZS22Nf5Hzr3iknjvnNrcEZ+g7IcXyLREkgtlhsxuuRN
         WjahwKfL9GDBuF43zcB/el6eIKpwkxKuINCrMvJIOj3VNFXnZjIikUcqVpebJDJj8e7o
         T9NFSKi1I0RybfNr9sGvQILEc99ysYSul1s6SoD3YF8lSRVoI+wc18x7WGLEHSXhYy54
         kRf75vwv4bt69e0t/Ubd8RO2k/OW0NPi1FIN6YAEvSkicEuox6YDPYYm3x8V79BOC1ls
         P06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675837; x=1779280637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=fE4eFe5UK4MQAP8bQz21V0/xtF9GUaMDbYnaK3qITQxxzE2ztQQLhvo+uKAz0PW4dn
         /nrXtzRrVNYEluuSckkm+y2R7nCJzPsCgq5I20le7ZT5LZOK8xoVBylKMMa0j+95bsfK
         4WeuMv88etQ5n3v6Fo/nnbyrjkHeWYtUcmqFdizDOT0xIeFpvlsbjNfm71WHg1M9Ym0d
         Q+gyP807zpxCRZQmn93qP7d1hgZAJyxS9A8vZnsLfxJkwlo93C4J0WV26jSxZkPdVeVE
         8wnYKjB7b6rz9cagqaIY1EuQ1bwdLop8CN6wC6ie5590jIc06geWE0myLI2pqf00UtrW
         FRHg==
X-Forwarded-Encrypted: i=1; AFNElJ86Z3W+/C7Q7vh09ETRxQo/OFw1mdlz5tpmGQie6etqHqYSQaGv6EzCYHR1PMLXnQSH/6YqTb5tSwZVsCJl4xNf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9/wC0LOOL1xnN9TGFihoJStNczZSOnm2mhq/SYb+Thvm9gys3
	HDaQmon7q6jykVwaML8wQwG9XsmPXcC+Blrca774i0ksXN64MuDpUerKILaJUg4oCkU=
X-Gm-Gg: Acq92OHRTw5nD41YDyedmYAyiCOEP25Vafqc04sdN/iDl5H5gq4nYaSobBOtoihiBjF
	PZLj36Aq5wcRhcyVoHXOQQK7tSYgch7o3L4pjgFZgG1IIMdL9FYIBi8UJudrIn/ztMitJQ2mC5u
	j/cmh8asfhHeGpG/SUtxqHFjV+d+BwIIHYBB+Jpz8psFwrpH2KRz+rl5ue939wfcfSLtM/wh/zT
	kuRc7FLtlzGNOKTLpxlExsiPMWwJyUCM8WtgxdqqX9n1SBXz3+xmBUbsrJm5IYdszgcJ5pG+XF3
	ivk13tOzR5UsFSiEt4+iq9g9JEnNK14GSs315/+55tbjo8HWtdAzLUmplBRJi0DIverSvXuWNw1
	sxPCIr13UpAgibmOXKtLjN0X9C+hZ0/Ef7MfyptwfB4lMIUAXHKehF60E9v0EUsrIOUPAh04j3y
	Inv3rIR2gQSbaVIbL3uSkyoPPRjS3Q0oxrOi6QQz0EuL9Ol0ozB/SuEuEnPdwaN7J+ZO3PUsEwE
	WrPJp2I4tb2RiUe
X-Received: by 2002:a5d:5f82:0:b0:449:4079:4c39 with SMTP id ffacd0b85a97d-45c5a1a791bmr4966657f8f.29.1778675837045;
        Wed, 13 May 2026 05:37:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:13 +0100
Subject: [PATCH v4 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-1-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053718_997215_B1B44159 
X-CRM114-Status: GOOD (  13.55  )
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
index 86ca9297edab..498ca30a00c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10952,7 +10952,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23652,6 +23651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0


