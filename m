Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB99606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kl0MWDfV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LKM39kDr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=; b=kl0MWDfVBmzUfn
	tADMVx5TMQNJkowfVrNxiBOSudUjQw5hHXS1esbddpAjP5QF56yfSlEAcPrKQMZvv2lQOmYhq1rUz
	CowgdsuB6IL8BEaQuq1AR0hNeR4pKy2jYPqdFjQZU+4IRoe8UK1XB7JMtilEcWaHKvYRIiO44ZT0+
	V3tHhV+KCboR8vba4NTOPejHH4BtALICieA+hxpHMtD9cQ6YP58Rpxp6xgOA5X3aPKsc4hH+yP1zX
	uBh4hmmWoxnXLb+fjC6N08Kzc9WAv/DRKhc3vKP2+QRUa9rNCo4aHtSLTDz0xElwmi1PePpE3kxVz
	wCvSlDjp7rcgxIE0LFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtpS-0000000EIjh-1Btg;
	Thu, 22 Oct 2026 14:31:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtpL-0000000EIgp-0wLn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:31:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4956869750eso13058485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679489; x=1793284289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=LKM39kDrXrmDhBxmqR8oCzvja01KRb+0u49+91WE0spcVbd/99CNfn9A0kn4Nf/MP6
         55Gle0xJfq62Dj6Hh4DHiHWdM6mPTDsa5Yp/IhOmd8seg5za6s/PKL+HgxEwm0QZJst+
         NdBl1wSy1VJd7KaExbQQuFahEuV6eJn/Wemsv+phvOTD8cEi3zHHhJ3AMOAuI3mkQq1c
         7Ztquoh0rn9F3VLr7XS8T2+lNq4z96ZC557vrNswVaFNyWigL3AvLu7xC7ABYTz4Qpjr
         Nn914QQ/kEJY/XjhIelMp+9b2LI/susiBDsM+yBXbFmQ5U6NMH/NMfTnPkPg1cxC1/M4
         SIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679489; x=1793284289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=2xYS3JjYtbzlyVcEYILtXcUG0/xG6V+8JUhQY8VbFgCUf/mD1Fj/UIib3ngvZ4QJA0
         zIVBH1Rk6uh3Fpc3WoEWjTBz/NQa6LlIdGOnNKSMxSJPbnUA+yGLgzjfeGlzKbjOQoxB
         iFTZMRFqbUn0Xqd98Rr5laE8DpvwE7HYaBSfI1qN5hmFPipct58DG6czCW7ofOY5uqnd
         tNfv/+xf9h+bv/o1Lw1Du33akk927hxMuja5cZZYf9rrhQwqwkhUq8xPDsBtppeVGnbW
         UJExvIcqNvmSZv0sZGS4FiVm8zvAEjCj52bAaqEyGe8iSUlTyXOOWVJGrDo5HWFQHpm6
         njRw==
X-Forwarded-Encrypted: i=1; AKwUvByuzh35fKRrCctEhg66L8bvTsJajvLLUM0sef4MmF3cOQfSpUcKNC74qjmkq719MjZCqM45rfequ576e+WGUOlo@lists.infradead.org
X-Gm-Message-State: AFq9FYL6I5ses1Q1SbKT/qnxVB+6VHBw0cB0HW0ZNqsXSuiQroxdj9gU
	coIh+GE38+MPSw3lS7H327B9W6VUw62fYFKpDdjNOyOOk6QM3izCTTFs
X-Gm-Gg: AYBFou3SXqJ4/rjpb6pH+4Jt+nrLbk8p4y8nwKBKi2NR5s9I52nFx98lWvNGNit3W6u
	i92KRcLOwXIltxVs0hTbLHuO59eUD+lsWOkupVfBmzqNA/QA4KwWgOkhgkYcnMDpFMgpXMDEyXd
	1iuRUfwi+Bb62+mTyPAT5IPdWEz0FZxjhj6tqE76vfYYF/U0Ep1+20o0okzS41qtv5P9186B/jf
	TegbpSpS22ebw7xgjgHl7Qsr4Z+EMFKt1mvQlw0a9yG4NM4v37MLI6PVeAyiwEP8p3amwE/bUtz
	bQGR1UtajslB8wcIwFkEDF/+eAh9GLjfYqMi4xcZ/uif87dSgc9AkM88IQq9DpACRTHz9DMQ3eo
	toVYVUZWccy6O0XWtTSpbaePZKHAwhr6Yjn8a7BAn52fKnPjJdyLi47ycenn8ZACMYjm/UtDKdq
	IlYa5UtREjde5TVNbVB1I5fo0or1rv5XaJDICwa6xSL28KVeX+Z+FA0OSm/H6X/KsYUgkUAGRnE
	V/6+FRX+UV/VUNi9lgcju7f5UdUzKoUyDvV+QPTPs/XC73yjipJq0bTxMRVH+Ild/r+m5f3hYJ2
	0mOgacoL96v+VWKFi8aWdhnQE8kh8bg5wy4yl8zfGNl3+M6gwbuQkjks
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr107350405e9.27.1792679488862;
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:25 +0200
Subject: [PATCH v3 1/4] dt-bindings: connector: Add Toradex camera
 connector
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_073131_304586_DE8CA8A9 
X-CRM114-Status: GOOD (  14.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Toradex boards route the sideband signals of their 24-pin camera
connectors to different GPIO controllers. Camera overlays which name
those controllers directly must therefore be duplicated for each host
board.

Describe reset, power-down, detection and power-control as
connector-local GPIO functions. This lets an accessory overlay remain
independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
remain described separately because the GPIO nexus does not abstract
them.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..27fee3defde7
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Toradex camera connector GPIO nexus
+
+maintainers:
+  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+  - Toradex Linux BSP Team <linux-bsp@toradex.com>
+
+description: |
+  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
+  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
+  This binding describes the sideband signals as a GPIO nexus. The other
+  connector resources remain described by the surrounding board device tree.
+
+  The nexus exposes connector-local GPIO function numbers to camera overlays
+  and maps the functions wired by a carrier board to their GPIO controllers.
+  GPIO specifiers contain a function number followed by standard GPIO flags.
+  A board may omit functions which it does not wire.
+
+  The function numbers are:
+    - 0: Camera reset, connector pin 11
+    - 1: Camera power-down, connector pin 22
+    - 2: Camera identification, connector pin 23
+    - 3: Camera power control, connector pin 24
+
+properties:
+  compatible:
+    const: toradex,camera-connector
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 4
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0
+      - const: 0xffffffff
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    camera-connector {
+        compatible = "toradex,camera-connector";
+        #gpio-cells = <2>;
+        /*
+         * 0: Camera reset, connector pin 11
+         * 1: Camera power-down, connector pin 22
+         * 2: Camera identification, connector pin 23
+         * 3: Camera power control, connector pin 24
+         */
+        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
+                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+    };
+
+...

-- 
2.43.0


