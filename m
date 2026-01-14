Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17953D37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IE45J8JgDPeyrAViCtUZj6ANewtTif+SN8oHgJqm5M=; b=gJxBb/qhZk6e55LQCah0c6+Gxi
	KQ7ih4Xwo5hii5fxe65aIjJAmVsIybUk8f1x8r+uiqErANTuS1N46XpcnXyY+n9y4JX7XWbXw46NS
	/I1kTTSpCwubOVCSODjospx6DQb/79qhn/RH9I72ZUdhQMyVh05s3X5vHkDcvOEHTmmBugQjDoyR0
	1sA3rBOIxRS9HUELPb10z3ZcmiA/jhbslfw/VO+zPIm5TzydCqluvwULASr+BITWwROkkCX15BIdr
	WieC3ewqkHNnpJQsVdVPbSvjHvFR2vYlSl/nPgDorSYdhlaWus/zZqNr5ndVDwabVyCPersdZgpAa
	l2HgaG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gV-00000009UQO-18hk;
	Wed, 14 Jan 2026 14:17:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gS-00000009UNl-37XX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47ee0291921so11860285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400235; x=1769005035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IE45J8JgDPeyrAViCtUZj6ANewtTif+SN8oHgJqm5M=;
        b=FfBU2sgSLamQbP/gUhPNu8tJwaQQnXIu+BkOGmWa6JOssYBwpnfvlPe3Im+XOQCYrK
         MhknGyKHdAjvPxhEXLpYwUgUmjwlDOwgojOZMpIjPliuhXGe1BNjecwkz9qRQAKeInVP
         5ptfTt7/Isnbm43Rihtl7RrAJVLsUTLARdSll5/w7WbYrdbZW3dYcTBjzoU+fR3mtTWO
         a/7K7L1MqCvEdf1yrvC5x7A1U63BXhbUc9VOdrSWE7TY/tNvdmjPPJfXZRS+CoywdZ9l
         DBmYwyamazT+bCKRiF54CIJm+/SYieABEGSrUAD5z9DV/2j/gOxYegPnJQNgwcWeHN/n
         AweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400235; x=1769005035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IE45J8JgDPeyrAViCtUZj6ANewtTif+SN8oHgJqm5M=;
        b=c5l79cTw7UPP6Gvhp3hxGUtGI6+zYyVER5vBUcIfBJWNHG7RbIDPetjgPETg+ogLrt
         wn/pPwo+MHPJT/LKrUY/ZbqSSl3iOIrkPPy2CRBOw726oB59s6LU9ZCQ63vtx/mRrZUy
         svbjsEjCO9m+Lz5QIsXE6g6a1I/TIYUFq9gs2THFL3/VfiXmH1PDFto53bmgy0ssCLoM
         agdZuazPm4MGMUiWX7xP5IGZVTCndxBPFAjiUTJp/QDvNonZlBg3LOHnYmhdg6gQ5n77
         C40PtBborBpzPeCcwQFKtsn8s51vIBkxsCkEv8Y1vb0WEpNYPQjd+Z4UtxM56wr2yfde
         JpIA==
X-Forwarded-Encrypted: i=1; AJvYcCUKMjWTv45r83JkoXzFa4YX6PX8Dh/XLudI4zXsAcWx/jwpAhWDblv5fqsl7bXt5IC5Es4cPBfZ/s2XvWgeUJ2n@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4TDhDoIwFart5brZWdy5A6xM3UGWlO/8Qhmczt3DlJ61GpNlN
	3KfxSt5/LYKMSVhVNDGFBy8Q1NJ3m3jqNngsOQAFLPh3mMTIOvVPqMIsHlxd000RLtE=
X-Gm-Gg: AY/fxX6MIfk/3Xpe3xAPPflKVdYfHYrVQsjW6UR4igK/7atc3iZHNLPP9g9hSpB4+pe
	sIv+BrCjCF5hOPCO7z4/figGOxvXEY4qCxnKBl0+rAPOGuN+iUEw9vacG2YzhCyZiXoLHQr2wyZ
	avgZCcwrOb0qe8j3CJTyAPdJXD6LMPZExd2WyU3bxg3dDw9yB5OShh6GOOip+xqQIMHkQyU4Mk9
	xqwEHRbsYLIGEPoxRNn+MidkD3LUEZBjlLs0cSGZyrUMIaXi4klqdhOOlqZHHtUgDKOKak9H9t9
	lTg4hscyMzgcM9hBERiVgDZKrEbiZ0UajGzq7uo8Mkq4kqqg+XwZzWnKFebvIHSXtArn5Z1yQla
	cDE0f6Uifq4Ri4qMrR9pB97G7h+4rUjdoK9w/pv5sD/2qdMp92hZdhia4/syRdTAf/ZbmLdNvjS
	QIKBBl0dIVvQ5/ARdI6aCVbZLNP4ewre0pRHfz+pJhNk7gj9e4M19ZhU4KsL2gYhA5moNkEGuZZ
	CNX9fAI
X-Received: by 2002:a05:600c:870b:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47ee3349d27mr34820035e9.15.1768400234736;
        Wed, 14 Jan 2026 06:17:14 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:08 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:31 +0000
Subject: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=1858;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8UojV7uTS3mheivu+7sw0eF9oi43bOc4wBfGZPuFRE4=;
 b=L7ka53Pavk7o7iv9buy1Uk9Hui9JJggaZxvrQ3ziB2ZiI1QLIDOWA/yKh7O8c0KHhKHL9SBVE
 ZcmvuXqrAbVA3WmMGUQlhnK9rs6sZ/WjzLR5VHO/HfFM7tqZ8VIaPf2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061716_809772_3DB73D58 
X-CRM114-Status: GOOD (  13.24  )
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

Document the bindings for the Thermal Management Unit (TMU) System
Controller found on Google GS101 SoCs.

This memory-mapped block exposes the registers required for reading
thermal interrupt status bits. It functions as a syscon provider,
allowing the main thermal driver to access these registers while
the firmware manages the core thermal logic.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mfd/google,gs101-tmu-syscon.yaml      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6a11e43abeaa23ee473be2153478436856277714
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/google,gs101-tmu-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 TMU System Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  The TMU System Controller provides a memory-mapped interface for
+  accessing the interrupt status registers of the Thermal Management
+  Unit. It is used as a syscon provider for the main TMU driver.
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-tmu-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@100a0000 {
+        compatible = "google,gs101-tmu-syscon", "syscon";
+        reg = <0x100a0000 0x800>;
+    };

-- 
2.52.0.457.g6b5491de43-goog


