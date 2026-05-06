Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F502CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=; b=iXCXQFgm2DvxxBuaeUyW6HSBRi
	w8ptH9tkfyqu0ndtxjNrHIkOG+l53EFluYFA/qvuW7XTG49S90sIrYtBUOWwqV4c8Tw1ydWnKqwHu
	JOuGpUGhFs8mOvQ+pOEIaF7AQnb/p6ZKCpVLeNOUZcJIuMDaR4qur8uyCiw1tRA36WkM5uqVGV9rb
	aiUyRJKNd9mLanUhMA0gZUQSiVnWtdgTLYSfMfe5BXu9BNYp1Qys62KnX0gB754NbA1vuMr+kC7aP
	xzp7C91o/0ICx7jJYt2It8Mp0X98BYchmg2VKfqobzLEnhS9+7fTd2DigbDHCa52b1GIlFwge1WbG
	FsNEhdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0N-00000001sxp-2NEK;
	Wed, 06 May 2026 19:33:59 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0L-00000001swm-3cHO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:33:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-44da2de25f3so56886f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096036; x=1778700836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=;
        b=YTRi22qwi2mLd/HzzaIt6cllwgR18Eo7iWxpURC//OuZGamue2OpR8dgvvQmBpRthw
         Szy5foQbM6rmgtAtjd49PYIW3ZxwmnDER68du1r6GT3jOa3hz2HiJ2PjUrEMf4tdDhpm
         bIJNEavNo81rTGU5NVZsAohUjjdAbNQ17kKswTeLQ2FeqJmYFduKC9txYuINYn/sj0Dy
         FpYi1drtfR+aIa2WU5TMslb+bTk1B8QV6GNtTux231t9mK6oEcYmXgMmL32T/Pk5gRcm
         gnekHJHXpRKRg0tE8v0vPwpl7sI/XyCQnVzsKQIcVqx0imiNwwqh5646ynKw47x5RjrK
         wpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096036; x=1778700836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=;
        b=XU43FfayPvvbvyH60InbNg9vJzz5kJvzy5GJEAWY1io7EnjVd2DC3KxawYPC5Vtcgn
         Pvt8z6AdBaEr2DKLC4nTV6NB8KzyX7388W4xaP9f44OiyslIEFaG6hwuQLWcgALTnaHZ
         5y5H4l40J8Thf/H6P2Fj/mh+2Ut6seUiuqoFv++gqKI7Z08No9dT5KAI6L2qoc/OaWDm
         +yT7vYpx8OzAG7n360DJIi3XKSm1BESMLlwWkl55D+FrOi6WxG99TMqEd01mt9mtyGrO
         ZOMzL+hADjqFRLf/DkTKwc6axCPpf0EeWilNvuI7QuN0xccdX9Tf8VY2fAz+IbwYlFuA
         U/5g==
X-Forwarded-Encrypted: i=1; AFNElJ8T5wymb7x+mY4bDQPE7uN5ghcyzkQJZXQ0ZYM4Rzw+YWIFpdC6Tsfkzu26PUsQ30mMRNT0pOqY5iVTxJMr180v@lists.infradead.org
X-Gm-Message-State: AOJu0YzJjtYuJPEeNxyRxIfMLAQz4xyrKz8oRO2aME4KqDl5lHUJF7e4
	J4oXqvGi4qqwG+60NpOO6m2sNZpYGIC5Klc/tevfX561vkbXcRQNv1ku
X-Gm-Gg: AeBDievFYCM3ymttJGsBHHckEOIkaz/yyJXXECW+fPVS8WJz4oqOoIG3oyK2Axp1cYH
	B7xeQ4oyUyGqLpxc+taZyhl/btra5NlgetQioaln1OnX6JBBT3R86JrtafvKih7jnllH7CK+yC4
	UwDzl+IJZbFXuP6oKgvtwV00ODmg+oqueoicYxnsQKVnjY31n6OOBE2CsQ5b2G7OqY9m4MjNqEI
	Q0ceHzo0nqmcUUsFel4soYB6RSCeIWpo8sDsw/sxnx35k0MFTZD35n/tUK49L1nHGit9fjm8ww4
	qksquTDzCZkAX7IK1iplq1n5ahfalvN4R82NAoh7plnuvQJCQjGSuTp+bj3MelaOC8rnSOfDS0I
	VnSVstCokcH3UUuWpYAvbTJa4v14v64zus6LQz6b/DLk8ulzEYbAd+PVZvXrOyHUP2oiyEKmLMN
	Ow5G7Cep3bn9moKx6Sycc0qWErSGKY2aFWsF+SaJINtHwJPJ7Q7+357STGttRqzgDV
X-Received: by 2002:a05:6000:200d:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-4515da9545cmr8271440f8f.38.1778096035758;
        Wed, 06 May 2026 12:33:55 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:33:55 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:18 +0300
Subject: [PATCH v8 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-1-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWK67X53SzKHIlBRmKN+YIbH0e7b6j2TyOr
 aCK6GX/DqKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLe9A//QrlJoD5UHF8Jyl3id4evXsfCSOna7s3
 a3Vr2Eb2zkTlTOgcvpkjxjQBSgKu11wh2ipgdAHyWoxfWLzWOKvt0RRzEkMMAyfciXMLOZ2lI6/
 7u2PAjwtrWX3JRhKTnAOVZBOsffj6E65JWWHL1i0MTiNLaTu61zqN7EDsm23ie/t8UTRXlAFIm0
 HNQYjZUG34QM5alJ3LONrFEo10wxrHMLX3IiOubh5F2bfohO68yy/+lsaLM0Y7n6j5/OAA0IZUa
 VBK7uePl8d63Gq3B3FBKGisV+kIW2mMji8qCcaDL/z5eP9pQq1lw4y3KERIQdrlbgnLyRz9gCO4
 s/y2zMkIsc0DE18qeMPMBv87Q+8S80d52TzxfQj02CuwxGhHmD8IEmp0ysFNgQnTAmw7WD9F9jQ
 ogtoJZND+ExSKF1+wkWfIL9r2fV0ljl9pCiCvBaabvbhBdlJk+dHTxYsT/m3yGRTpfl0JTj8B3t
 Q/8AmjcT2gf/z8DsedC6CryNtvrwhDuia/jlS3Wzp9wl2oUNWAjWTk9QJQWyBGF5TbXYW+VOCdN
 fsjmv6YkM7LafxHSL+kqgzH4Mjez4BDNb3rcFA+G0dOvxZ07cZuwjn7+4SjsFiRmnjZJzp1PB8n
 jBgulpoL5cVbuVM1B3TVh21UGevB9y78NqWrTGAYww1yLQzAEJbQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_123357_932139_7591A5A1 
X-CRM114-Status: GOOD (  15.58  )
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


