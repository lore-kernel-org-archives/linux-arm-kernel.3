Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7EECA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=; b=0rbwL9VjXxv3CtwHLsq+TwlTsQ
	VPS7Xi+wHQhmEsgfrCY0MgkI3OeEH2Tyw8YQ7S70W1k5TaYjFWnr7hC+eieXQ1yYu4+ebXmnVh3/6
	n9VUEw1SoHH7htdcizfaUGctBASwQ8M4pH7P7tDc+1PNqxt4gT4f9JM0bm4NLjJFiiHDyPoqk1Ajy
	Lj0tSqonwRnNNRYg7HqCX4PyUsGK0YEinNdxACI+fmaW2J7gUrHbSiOJM7rLYy4O6trZYpOb7H6ON
	37iv8MYeWgzYVKfj6eedx5szzqWw3mfGvSzmrW/MKAVcAuQbvmzbD0RXGUSeyZsRvWsuaFGLhhroa
	QNP8o4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBINZ-00000001cxF-1bHB;
	Mon, 28 Sep 2026 20:55:17 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBINP-00000001cuW-0ikN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:55:08 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so11260575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628905; x=1791233705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=;
        b=IRP4kMwkafYTWEXgkL01SWdBcfu2YAjXDrGmlrGwmnLvp+EHKj+1bW6FJSGgUWVDb3
         wkC+RSpG5MDYPdR4SgM6rSoTKWFLtdWfbjUSh8Bb27bahiZ7ei/t8Qs6JUVcp8Xr8uNA
         7/BKe5Z/15H/ALE0EwDTA+N7S4uiJrWs820Iq22kwZYbU5Yrxn8C30NwO0mzds5mQ+Yy
         r0PTuGIhLgox0elETw2LETpxe4rHzjsclGY6mkKFzwL0vTOduMJgKY2Gqve0D3/sVOD9
         NSjz1KbXDSG7808jEF4v01Vr6TxpMKwesDE4TimiV974ahjP9NZeeiyu0vL7Hx4772k0
         6RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628905; x=1791233705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=;
        b=cyjhzVPB7/ayjxyZG3d/pVYmdcCApIYbGBvqBEcRSWAILLihlyTsDTFhiOvo+9unlM
         v/S7OKqQ3pOOe6N2YMPRyDwNaYPjkteanLqT7PPJgFU7+yZm7JzSNCDZgxLCaVV/PGVQ
         rMO5j63pjdLv8qsAaaVUdNyIFzmDpJb2yNlGJbhdpVJB2rj7+gMz0hNYm3p4nbtLHRgD
         g4mMw6/w2q0RTgzim/5BRwT8V92fvXzXzh4mk/S9UwyNGzUSIvhrGtcn0u8ELVzWXfsL
         +7FJI4MbRPqzUNr0ldI9nxGpx74jLBYo/BAzb8K5l5LGp1LQKu0fVUx45Q97usMn7wUH
         Mvqw==
X-Forwarded-Encrypted: i=1; AKwUvBziraEeLZicG1vPCRFe2N6t59RpwzpDHyTjC5hKF4wUXaFLmbnelp2IGvc4VmuAmNXURB2sQunn+fne+0h/tnxS@lists.infradead.org
X-Gm-Message-State: AFuF++n/Nyq4HGb8smXBZLIsqVdblpTXG3cIPUS5GRW9B8XdsAykz2KQ
	JqXzYsH6Pk0gciPxE74Ni6H5EAy1EqAJJqumvd9QHPuE5LXDPAi79zQBTMBgaDo1VaQ=
X-Gm-Gg: AYBFou1H64+A7zMU385Yg9nZnN/okQV11LFnqPHv+IqYq64S+zFZIV3fXUkwzTrGcE5
	oienshC+k/W9SAD7IWeMnwdlwYL4i4layDuzofZdJibnYhltRADA0+i+NrCxTqSOxPO53w9FuJR
	qZwUzMDWuGTQ0EWYFZciR4cMdplPK8MsyQ11JN5NaXSM2k6mnpq9q+O3rVOj7Kz0rr2Pn9zeFKB
	fVFEYrUE4sz/aZFpiC8/8hDm5HEYagnyQF3zlEMwqfQgLY9r9Mlz8Zu0wYx7EkCAnZkvaxK0SmW
	xOuX+Y9KAQKt9mFgWRQdJjjLNunMwYKNfDjKMJ61CMj/Vv5hKFiGkczpvMpiqwgGQpbuxLbyOer
	eTm3IGTAkUz2d7AxvJw+x6PcXUGi/6SsmxKi4QEiRLCQDNkBY9iDJwvS//qgvWQXpXwKpJXsbAX
	Z0oJ9QYp2NX1bt9SE4xUGnheyEvUt/uBu4ht8C1a25yyFboiyA6ox11yOxPxI558XGU51dMlRgg
	8F7gyluxbd7HK6UEwFhlyXgSpwowFUJj5jN2ozjqY5H+TTVARoVOsqV8bZqFyMPeNJmWpUo
X-Received: by 2002:a05:600c:4f50:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a008b11c38mr44624795e9.22.1790628905176;
        Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 28 Sep 2026 21:55:02 +0100
Subject: [PATCH v2 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-1-717acef9469a@linaro.org>
References: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
In-Reply-To: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135507_250219_9BBB8435 
X-CRM114-Status: GOOD (  16.99  )
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

The Exynos850 SoC incorporates an APM co-processor. Communication with this
hardware block is done using the ACPM protocol, which handles IPC messages
for clocks, power, thermal management and PMIC control. In this
architecture, the ACPM firmware running on the APM acts as the central
supervisor or arbiter for shared system resources, handling requests from
clients or agents such as an OSPM. In this design, the OSPM is one of
several clients or agents communicating with APM.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Additionally, the ACPM firmware implementation on Exynos850 does not cover
all clock management operations (such as clock rate reads over ACPM IPC).
To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
called domains, add 'clocks' and 'clock-names' properties to reference the
underlying physical clocks.

Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines for
Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
specific PMIC child nodes for Exynos850.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 54 +++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 +++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..f9ef5645b8bb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1
@@ -33,6 +35,20 @@ properties:
       appropriately with the clock scaling. The argument is the ID of the
       clock contained by the firmware messages.
 
+  clocks:
+    minItems: 1
+    maxItems: 9
+    description:
+      Phandles to the underlying clocks associated with each ACPM clock
+      domain. This property relates to ACPM firmware variants where not all
+      clock operations are implemented.
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+    description:
+      Names of the ACPM clock domains corresponding to entries in 'clocks'.
+
   mboxes:
     maxItems: 1
 
@@ -77,6 +93,42 @@ required:
   - mboxes
   - shmem
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-acpm-ipc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-acpm-ipc
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: mif
+            - const: int
+            - const: cpucl0
+            - const: cpucl1
+            - const: g3d
+            - const: aud
+            - const: cam
+            - const: disp
+            - const: cp
+        pmic: false
+        pmic-1: false
+        pmic-2: false
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include/dt-bindings/clock/samsung,exynos850-acpm.h
new file mode 100644
index 000000000000..87fc6ccc1d99
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+
+#define EXYNOS850_CLK_ACPM_DVFS_MIF			0
+#define EXYNOS850_CLK_ACPM_DVFS_INT			1
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0			2
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1			3
+#define EXYNOS850_CLK_ACPM_DVFS_G3D			4
+#define EXYNOS850_CLK_ACPM_DVFS_AUD			5
+#define EXYNOS850_CLK_ACPM_DVFS_CAM			6
+#define EXYNOS850_CLK_ACPM_DVFS_DISP			7
+#define EXYNOS850_CLK_ACPM_DVFS_CP			8
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */

-- 
2.51.0


