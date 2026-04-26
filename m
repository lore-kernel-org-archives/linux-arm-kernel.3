Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9975FFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFRtYnMfqIjWbEB7Nm5EvqwrTpEBb8Zy5pR0tbdz/Oc=; b=VcdRwsnPQp0zHO7ADx3ouTltYr
	lO/QQ0uDBjeSyzouw2I85UvxXA8piBhjiVA6Pcu6pQwI9PnQIyOTx2gzX81/crvLrK2Gl2urPJ7MT
	y4Y9/6SzsALAvWaNfGg3fa7hNG2WMfvHahrbfG8515qsDPJ4dJqUdJ+Cw7yYc7VnrFqdsUj4brL3B
	lHCeZoxy3bJUOswSClDGxoev3Tb50GsGN3CCQeTZqTKvzJahzIDnwMYipqnUE5wHeQhPAk5d2M4z9
	+QHllzBqE4l3zHclcUnykiW/mJ/Xw5hKai/Y9gTFiwRcCcU69ukdNb2qtp7HbhkN+YdrjhDf/lyIv
	Jj1kHF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4a-0000000FVuh-3Vad;
	Sun, 26 Apr 2026 11:54:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4Y-0000000FVtU-3Apl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 11:54:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so114449845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204489; x=1777809289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFRtYnMfqIjWbEB7Nm5EvqwrTpEBb8Zy5pR0tbdz/Oc=;
        b=QmMDqaE5FowYnTtOQmOiH/x8CseSpexfJtoyKvsCQv1Gbanjrm42xjbYajO5OidFJE
         uibCgTFg6aSNvzu5dBm4O5orKSs4Ucb5k1B3HI0MNg7tGrlt8LIh5bKHXOtQnaqlZYZL
         CVA2zQrrXnwzWInLBqf/UePaZ5UhkkDYbFnUYSJG7YzYvGMW9mFkYfShInoBAitlZ4oL
         FsPTU2vhWDqJNkz/RyxnH++mX3Jvv8KVnrPWKFm29hQFARqvdtF49Ys/fMxqiN1Nl8AY
         As3EVC4QgmohVExTkY+PwZDlROA6FmT0QgUcd6AInMcNMVaBxtkdXV96Hrwxw42US16t
         JHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204489; x=1777809289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFRtYnMfqIjWbEB7Nm5EvqwrTpEBb8Zy5pR0tbdz/Oc=;
        b=Gip5hL88cuhv9JicG81xk8CECBS9QhWb8nHIylTYBCKBqEhdUOugroq5BdNb/7vU6h
         Yr9mmRwT0EffYX8ECXDhg51KUVgnoBli4woAdiVK7q6uKAhWITX8ppdBxsrRUtqInhPf
         m3OdMvD7kxA+/G5xn2gogX6eqhm0oqRcYc9/dPfcQcFEC1n9CXljh1ZCkSR+wKNqpBrk
         /MBLMPKJKFf0XiQnSYxxQuO/zQWa/yf+PXrSqEOrNY2IEz72pfhhvN2t8zdt9G52FKqg
         n1bJmST4G61McGCU6O6RQUdEzBYN5GZwGtsoSYJpXVagnUN08BLKw96/B7sR3WZfZgiO
         xN8w==
X-Forwarded-Encrypted: i=1; AFNElJ/N6bNIHB9qamw8FMO9pPC3b7n83M9uGEI38MYp1AhgOl0VlIN9Mw7cYi6BX92RhjcBBECM/wB06usjcEs66xzj@lists.infradead.org
X-Gm-Message-State: AOJu0YzDYpu1Bxd8FxMzyS6LTuEaL0mHlZ9Fx8cqdU69RW3wT7wqYaXF
	96q27705lDqLmVkH8deRYz3W3bnJfxjP5Fz4+HwH6W+sxM/uGBtsTSZU
X-Gm-Gg: AeBDiet4lyl/z1/KtIe69k/zalCiFzMKoayU4lHUiTf2PbdIZ4t69SGav5nfsN0hJDP
	m5+FuHDJLdfGKmugzfuS8IbmLArBEwJm9tPTIs3J2D0fIR5bKXUzhznnHXqeWvF3VAn8cYJqyV9
	lUGIfwSjstDOkDj00y5W8jH67IBoD0G5FHI6hnModxcjP/fZ6RxegVrx/uyCxqDzVMPPfvfXYaR
	NOv3SU78Wyryb6D6cKyuUdFm6cQexqtVKXqUEURBFOd67apgv15Ewc4M2+ytTc2/wZjDne2Wxj8
	fLMhtkZcGTs/qFBoNE5dDLi61CwQjV5uqGfPRNrPQdpcqPVNpeHLnSRLBfdT28oQMDmK73ruZCC
	inE1+5AgPWVRIyM1sIT573u5ZZWLXaSX5EWTXQtB4XhLvs/Rux9rNMGJUkPRn7seCm0O/f2rW14
	+IIJQQXxs5jgojRHoixkUKzd/yDvT0T0WI9f/rpjy7RuxfAtsjfUY=
X-Received: by 2002:a05:600c:5295:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488fb77facemr543233015e9.21.1777204488689;
        Sun, 26 Apr 2026 04:54:48 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:48 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:14 +0300
Subject: [PATCH v6 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-1-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=bXEAu8dm/Md2Hoo00nr0sADiZPaa3JrZAFzkbiCSNFY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+L8bHJ3v3mQmorkdJFu/1k1Q1rxfqFwIAj
 RcmfDEnmGyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLSCRAAkC+A/ax7hQyrpCuXnczMhBdavq5k6nz
 1/7GrMB9U2uGk0Uh7bfp2ryxtObfOnxC1ru8NJYgmIGzvvOAZHwLxugoladVsQ9V6PeZK0y6MfY
 KlFVoq0xjVECtaycoCLPkbPG8HZ5V4uAy57OARxd9M3r2+uqGamoYfcD2K7QiSv728ioT5CKmhZ
 lewVdrF8Yek6FpDtgyLHxRpHs3PqgrhhobbTQNs+SG2uawCvPOr+gKdA0MoWHcccb7N9Bn5uAAs
 1KqSciDeXRZ2kuPoiWz4PapElCh9ghowPPZrOnb/iHXlZsPuW5+9RM0tut4GluqeRDv7o7BSQiK
 +EacECiBMZK3EtelUqe2zT6z+25iieUVP20mcY9QvcoDWyWw9uDgthKQQbJiJfXRXq62InRtRpf
 lZYQmIrCeqrmz5P36pttfbGJqT6v86264RCJbfVi5l3VWNqW5LIQ+Hq0qef6sb78Ajdm3+2D9yu
 FnQvDmEacrLwa+oc3wvHRUcBkkTIVOXqRHoJBfI7S0nY8yuzurgzbeqSbMg6snGblGDIslMXg4d
 7k9DhlZc+O/DNXSp7SoEhFWwQNcpCgPwpJaeTOZYrIvQYlmRXx7m0NUFvG9TPXwJfB0/vWFFsVw
 pbDWd0/wwhkB/KMUJv3mkDG1s5usMAJNDOdSRAjIERTcz1Dvb1mU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_045450_821429_4EB60935 
X-CRM114-Status: GOOD (  15.21  )
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


