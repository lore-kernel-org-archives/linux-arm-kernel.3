Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8640CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=; b=4dxNtz7ernU69gdHJOlbJUbF4C
	YBVuysDesVJtWaQYHpL9hm/3YvidVEQDjmrqhfzs8v+S4uWf/gD6DSLoivLWzseucNY9LQ1CBmjnR
	Fo9BrKs9Hc9lP8iytfsqrMSN89jidCrLKwGe+xUTxRj+ydL17aZ6aZiT7vA5wK5Z8FLTf5s5vGlkQ
	ZSn8045PZLYLW4PD6mPBH1PP5CyE4Fl40jJftNo6KpLOI5ttH6KK0YNwHChFAFJoxFwglCofLGG6b
	BEvv8h6KZMEy0luW2b2/Ylq7Af8O1jYhKchwmdowItngdodMIjPyIFbIsBYZS5hMzrMXF09mfCAUc
	5g0mZXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMP-000000047wi-1LsC;
	Wed, 29 Apr 2026 19:14:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMM-000000047vg-1I8W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:14:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-483487335c2so1178275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490048; x=1778094848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=;
        b=sTQYqH/8XV/WVdEl/dWwwvwJRztycrihyihgW0XhvXZN80AMzNhn6vlY7ybE6mLJ2d
         pMWmdjGH/VhlRgR67d4CRxI4dKNUKU845l5wpYvlKUek8AB8l5zkkmLmbahA2wdu0X6l
         fC+xw44n8D4NEamPkhWFZ0y81bBij0d7ZWd6tqMqI88RwPHGj+ADoC13DTacx+4NB5MQ
         HJZeWgEvPW4KzPlm2t/8x6M1jZo7MPIhPC4km2P8L9qBioV86Z0VMBwvMsOkpVQrLLFF
         SJ/u1jihrV8S9uKmUQt8cWbalEH+ue/kmRwOpsLZ/LNpvdnLnuxYsRAg3nJPjWwK2Jmt
         Zmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490048; x=1778094848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=;
        b=kWiwSES77UHQicVOJCCev17pXxppW495O1FhU6OUO7LigM8xbNJQ2odenPMYn07rVf
         5lsph96zJrsLu0o0My/VXpPUcrD9hP6icXBEUO5jV3EDfwEPxx1XaMm/VA/mDti6D1o+
         p3kOBgXfVtyamU+hR7ljan5dswxtDYvYz78/Kd83I833GQkTf6Gjxsqh7ywAu5NWV52i
         iLCbwPSqkdMM4dFsVe3k/ZfvWKLjVPu6pMzNdGLyFjLHdPMms/J+VPXbFXNbeKNcWp4g
         OMs0W0OcibORN4C0SGRh9+74PL2ArQiw0gQ7DaOfP2lDi8d+obpsQ00m/HIZpEobMBi2
         3WIw==
X-Forwarded-Encrypted: i=1; AFNElJ9KTN7lNc0D86IbUob3J5ieZSJNEMTgSJdfGCy+JlvpeKOxYsrxt9aa7rBMzhyBW6/S8jXkuFYSQOX41Rz+hweQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxYq4tKL4fF/R3dcGVyzlCrKrrMOcjbhGGCwzrlu5o1UUYRgBaU
	Vk80EN/O0Pfrev7rB6MvNF01FQBpnxIf0t1QfjG6YlDre64k/lKZEneD
X-Gm-Gg: AeBDietm7C5I15Z78zgXBgawpEpJeRw6Q0dTiqrmGGm/04HhnqD19zaWlKBIjNIo2KH
	M0seZ2dQ1YLVOECUMC1MqmLA1WqepG9gA05fWVogSB9yE0Ct0ETPszccq7gjLYzLu7uxh0t0SF+
	0WE+Yh0NQNyuuFydbgqw7O4wgZhS6qpTcUGMvL8AXjCTvc48TlrjaB2l0ABUOphvW2G+F9/iHCM
	D122Z34n3QTClH5XzdH1jxc+AtVg9F6MwOFd8mwXgqhYaZTQM2+Ge19avardHCgOl5uDI5Cszje
	GyW8sa8m/MsSjDc8N4ccaD8bbEl1tLGKcVVpCQ0EAyEQ6k8/3x/7Xs3FgBXKWz9MaaFgCkQnpYN
	Lxx9+gZPvlQThuiv9ZT8G36Fx4ge4clYYtsCFbi2Lw6scxF5BBbkPHRJbd2Qg87xRctBDWMq5cs
	lPwU2aUiMbtbT/CcReWkiE2BA8QM0duu+SmEkdfGGY8iA=
X-Received: by 2002:a05:600c:1f0f:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48a77ae9a99mr137026655e9.7.1777490048153;
        Wed, 29 Apr 2026 12:14:08 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:07 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:12 +0300
Subject: [PATCH v7 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-1-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=+GtKlk1K7hr83CoqJ8aTYEzO+TXa3ITFJyZ/GejNafo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1ccK4jzlaeTCnzQ+mj6nz3CojfOm46bCo2
 SlLMeZ1902JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKr4xAAr6MvXLGyj+fH1KeLch7jR81J65FCi6C
 l0TmjwzEsMksZfwqtNijUjfJWJdg1Kry38lnOM29zkWAZjojfpLli9SCljOJw0H1V+Ph24fr5XL
 SDbh/ODZ19cxLCbkZ5k2MUeLQXbh6z/X7ZTULTAp4GOhKS+YNWmBUjJAM+griHEM81EK3D/KL7D
 +tRUF0fZeZMeZthhFRJHA5ZLUA5TCp+QIlkf9rAWyBjb+8vu4s4fQWD4Hb97MDgdcE0q1IPA369
 058ElZn/gYW6rsHUfTSJAxg5IuVQEV+qkKMSrJe3WaqEnovqsNOGWnKarDfmwgupTVpC2QYOhJC
 m3GYVfj6YklJYH1cCQqaOgsOHHTxWRk84Moi+3+5z29CXdut8UkKVHcGBUAL8qibx/LCz9YDhzQ
 mLxHuD050T1+0k3FOsDJ4lTmXPs1STuwpqS7exviIjsAG/U/wC2Jyi8YImbQPlraF4hUzL7Pcwu
 Pu5lkMEyUo8ZHrtBff8Dh4z0p4ihnigz4bCkK+ZCTNyi5Am5dcvfG2lCY+jRDeWcLNTnM67dvUB
 5tMErwPDEdKFUF+JGNmEPMmL/lT6jcNfJ5qxnZRTT+0eFpzq2ZcNKy5sGGtQtyxYV7RBIgERW6t
 J2p6MB2yb8w/q4x9Y8aE05PvDdYzm2keQdwVFd9zwzvUss5r8dL4=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_121410_370827_CB730FFA 
X-CRM114-Status: GOOD (  15.29  )
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

This adds a new binding file for ZTE, containing their zx297520v3 SoC
and one board (D-Link DWR-932M) based on it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changelog:

v6:
Removed extra boards, I'll add them when submitting their individual
DTS files. Rephrase the subject to add "zte" and remove the redundant
use of "binding".

Moved the devicetree bindings patch ahead of the implementation patches.

Moved the MAINTAINERS section from "ZX29" to "ARM/ZTE".
---
 Documentation/devicetree/bindings/arm/zte.yaml | 26 ++++++++++++++++++++++++++
 MAINTAINERS                                    |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
new file mode 100644
index 000000000000..f028d2cec7ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx platforms
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  ARM platforms using SoCs designed by ZTE. Currently this supports devices
+  based on the zx297520v3 SoC which is found in LTE routers.
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - dlink,dwr932m
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..b768b9da37a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3772,6 +3772,10 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
+ARM/ZTE ZX29 SOC SUPPORT
+M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zte.yaml
+
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.53.0


