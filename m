Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383BCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HybHSX/cYkHQKvO6mzXLR82O5IN46nB/6HHTSuvxJ9w=; b=TrVwplt9mV/UlYrJHnCdkSlqGl
	gQ/sCiS0IDjCKMFPoJWBTRic4Ag6XfNdobQCKnsIlr04g+ZFFkQN+7hR2IYfAEMQNQMLQ8Nj1uI6f
	dlRf2WLVUh3NBKYo1vHSe2I36eVXujhVQwGI62ULlQ7WKZAxBKLvmAceo9+rWmySLe0bq9OJ99REk
	64h8UVIVv+0DUCf4b4GvoUvelAqAhvrLIvnwRMr9WvdkpDBU/XInLhfMrKN0TKPX+G7vTB/D4LxnI
	5OA2bmWgpgbF0gWdGgdEPDDoLCBW1yHxIzvSaa/PfyxwrE7iOvWoXWb40IAydKNBUe2W0XfrqTOF1
	d2bzD6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzDO-00000005kpj-33fd;
	Tue, 11 Mar 2025 13:00:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzBk-00000005kgF-1INN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 12:58:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22423adf751so77597895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741697906; x=1742302706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HybHSX/cYkHQKvO6mzXLR82O5IN46nB/6HHTSuvxJ9w=;
        b=jBTMhZH288vjXgTHVzr3Elq6/JzlCOehROJ9RZXKVMR35Xxdl59Jmf8o1+4sbukSw1
         dmZswdpuzo2f/oVg7W0F1tTNEuwKJTJKHrHXElNHPzOUVbWq6CofUSmZDyJOyvE9hQQh
         S2zMTH+XMUSWaolfA+6KOov8AzfcCgczenFoFdKY3AB3UftiE8O0K8vtnXYnEKAWaaTp
         KJIgXtTVLFvuEBWBs6amSEI1WjTPwb+h54pzp8cp4/clf/88UW5dfrYaAJV2ezYNFum+
         8HyKYhCmO2mxRURVKHrHl3ackP6IEhaNiH5KrFqYW91XMnuArTU2hkRYHfftTJ39mLD8
         ck6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741697906; x=1742302706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HybHSX/cYkHQKvO6mzXLR82O5IN46nB/6HHTSuvxJ9w=;
        b=QI/ZaFSPpTfXhSQpRV0IhdYIXosLJgpuBgNVADyQs7Xu0EsE7lcek53H94AbGo7w+s
         YpifCQPHSO2JvVHRhICq8LO73ElD0qBFp3rZF3wgUiY6qPxnfb+3xDJfPP8aWRf3YpNp
         jDtWutw0Uka5xAFRy1GHxkxM45WcrNXggRN3NxDF0OmgQTRUK1AVUd+HP51nhlXbm7Ix
         2VQyxQsuPPwQQ4Bd29qFMX8WiAf3nw6AaFkXi9eSYkx4gxY9V2eUGK75s5Ey62LKPDOu
         4MUWCDVhM6Tf4CpyVPXwAkh8d9L7kw1qn/kU+FDodohf4R9IgnpXbhGrfUmiQbjznnK2
         TB9w==
X-Forwarded-Encrypted: i=1; AJvYcCXRBA/285xKYLnvZL6VBgIdvroX5Pphayayk3mD33xXoN5gXDnaPAh6jsByPXNwAEbldyDce4zAwOXuGI7Wt8b0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7gR4iYTgKe2YsfrRGIzGQVTJDGqrh6P3oypR/PIU4P6jFk52z
	uQAsrHD6nZF/f9A9bznQFOAb6geeLZ+A7wCpAoHb37JFvRaeWvAE
X-Gm-Gg: ASbGnctDwlXK1cJe+TFIOQkJanxEU1z2Zzaugo36oXjxmHkmKCAL8piiywFhoN25G9t
	Hc5ME52opojv6EZM/Qxq0svRbwUylS4y+hmCqMoQ52p/mEJ4dqUmVdkAaEyDAQER8YmrGr/DFHh
	0PWvTGgpCGmd1Xhzb0RZNYfDKhZwbFTPZ+ruyvF2SqbMWW7KqYqwHWXMhEJe2mHrBeOG9yeoAcZ
	huGk2kXnsw9WHMbN6Jo0fGLUAF5ZtYuujaloRNp5gHNI7li+iJOHpNOoib30jfWevD0CeA+CbS9
	qJgf3JdDT45APu1nPRgmnVvnwbzWpZBsMCvn06m5exwU+i6G6kYDmBzsYajdwYTBwDAaqBTtu3j
	6WDmI
X-Google-Smtp-Source: AGHT+IEOf4e2cGRATnJTbW2bOROibHi2zYAh0ElgqYv/rjSNcReiFylmnMGtump4zwxMszEZz/Y4bQ==
X-Received: by 2002:a17:903:440f:b0:223:7006:4db2 with SMTP id d9443c01a7336-22592e47c93mr62081545ad.31.1741697906379;
        Tue, 11 Mar 2025 05:58:26 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:4080:1188:3708:7bc7:f5b5:1c3d:ad0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410ab45bfsm96871375ad.250.2025.03.11.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 05:58:25 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML schema
Date: Tue, 11 Mar 2025 18:27:56 +0530
Message-Id: <20250311125756.24064-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_055828_348964_95076376 
X-CRM114-Status: GOOD (  12.24  )
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

Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
YAML schema (`lpc32xx-pwm.yaml`).

Changes:

Add SPDX license identifier `(GPL-2.0-only OR BSD-2-Clause)`.
Define `$id` and `$schema` fields for proper schema validation.
Set `title` to describe the LPC32XX PWM controller.
Add maintainers as per `scripts/get_maintainer.pl` output.
Reference `pwm.yaml#` in `allOf` to inherit common PWM properties.

Define properties:
Restrict `compatible` to `"nxp,lpc3220-pwm"` using `const`.
Limit `reg` to `maxItems: 1` to ensure a single register range.
Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.

Mark `compatible` and `reg` as required properties.
Set `unevaluatedProperties: false` to enforce strict validation.

Validate the YAML schema using dt-validate and yamllint.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 .../devicetree/bindings/pwm/lpc32xx-pwm.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
new file mode 100644
index 000000000..3e41cd291
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nxp,lpc32xx-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPC32XX PWM controller
+
+maintainers:
+  - "Uwe Kleine-König <ukleinek@kernel.org>"
+  - "Vladimir Zapolskiy <vz@mleia.com>"
+  - "Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>"
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@4005c000 {
+        compatible = "nxp,lpc3220-pwm";
+        reg = <0x4005c000 0x4>;
+        #pwm-cells = <3>;
+    };
+  - |
+    pwm@4005c004 {
+        compatible = "nxp,lpc3220-pwm";
+        reg = <0x4005c004 0x4>;
+        #pwm-cells = <3>;
+    };
-- 
2.34.1


