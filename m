Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBCDD41C19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE8fjpX1Eb1RavtBPTEOqHq6IlPTdZrinGpmm0IJQSk=; b=yZT4b6mLZcGQZNmGmncg+u1MZ8
	yvq1bwVcTGAeFtmBrk+kTKbGKWxyNkwRl6VYtBF2TA8Co/kTluQfQuNQckPBc9XGZaUD4nakelclp
	6hzQupCF+U3KYOOqiE11HJwLhkhiyljKCVdyMA86f47YzgC3Fe1xWBn+mVox4bZEij/DhCmih5BS8
	NqKkcCz3vhyaf4sK+zFc0Xfl7kIBbPY9fdSueEob3GamqZo1GWeM3w11gXZ+vgvwpShbpp5Io+k5p
	Rqnoc2cPZQ8tTVkvJwKco7z6vSIngb1f7H6Dq95BEyzCUrwGLEakCtgMYLCg8suKGSYS168ZnkNEX
	E73+quzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Hg-00000006BEI-1WG7;
	Wed, 13 Nov 2024 09:03:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB98z-000000069s0-1n97
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20c9978a221so74470935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488072; x=1732092872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE8fjpX1Eb1RavtBPTEOqHq6IlPTdZrinGpmm0IJQSk=;
        b=2N+FDha8NdwM7T09IXhZNhJg/LFyZAuYALlQZG8wVYE3yYoASxZRVWCmamrfsFjCV1
         qPkG+F0C3Kf+hBI2MhLfRVPQFjwXUG7p4ItFTu5apGR4k2VMUU/XgwqsXed6LQr8YOvA
         zVrnE8zTz8TeAehXXR0vaUInD+uMBYYBZxGiYZfR4fyaE7PdPrhi8qTgunfWQH3j6Yyt
         qINwHe2vcMIyOFCMs/0Q8KUDCiE7tJuZOGBaIGRqw9uLUNCaxLzsLe6wuMtNLP22sYd5
         WuUG5CtvUt5NOlvdQf182wT1e8lzWgSOMOIJ4SL5vBN3ZD9CoP9ssv+9W4/fr9Io57G/
         ugng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488072; x=1732092872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE8fjpX1Eb1RavtBPTEOqHq6IlPTdZrinGpmm0IJQSk=;
        b=se2H7JWzEwjo0yR8F0f2koBXlMcus5G2jpHR/zpAK6EL4q0/9nIkQfXEVwf7Vql5IM
         QkdUnP3jYRToEu2Wxz/X+8/HhR8CqhrXTYIjWVWbgBT6oFEoOe6ygEAzbr78YvJPCBih
         xQBibYLtY0P4GNTxPrP++U0Gf+RUWZWJkBN4mzncpBL3Qj9sGOuuotHL4NHAC5CG8LXO
         QP1k4shHu8pljMIniqnh+iiY5PyMhmWk/06Rn25nrKrmrAgvxZ7/K9Q0fkLMSRaS6s9b
         17Gzzmnqbr91zq3HVDc2CSA0qho0VurAzutLPQxsekJGHC3OMOdAN8wh1gxLsesDEc6W
         pZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0cWKHKMAbSEUTgUdgnCzpwpx+hpsPRFdZaWGTtDVHJm06iScmuV9PbqU8onrXxI2ZRQWStDQl8dymCuBPEPE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5AFi8pKqnh0PBwljwuD/0LyH2nDFSzE8PD33cWnLyTM8H8IXm
	7e+utbI6F1iGiuB6M82tlNrJPtFk9BAxlwd2FrfPsj1nCq75vOV1uT3OdF5f
X-Google-Smtp-Source: AGHT+IEt+6DU2EbmOYoC0dtzfG72lfI52C3DG6Nlz1YJ5vBiydCt6vOeAd0bjW9+oe2ZO+9WdDqEag==
X-Received: by 2002:a17:902:ec8d:b0:20c:c9db:7c45 with SMTP id d9443c01a7336-21183c9b37fmr271466235ad.20.1731488072379;
        Wed, 13 Nov 2024 00:54:32 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e62dd4sm105302895ad.218.2024.11.13.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:31 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 3/5] dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
Date: Wed, 13 Nov 2024 17:53:53 +0900
Message-ID: <20241113085355.1972607-4-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005433_575029_AD2FA2DE 
X-CRM114-Status: GOOD (  10.13  )
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

Haoyu HYM8563 is compatible with pcf8563 with '#clock-cells'.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
index 22909a96123e58..54c45bf3075b6a 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
@@ -4,14 +4,11 @@
 $id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Philips PCF8563/Epson RTC8564 Real Time Clock
+title: Philips PCF8563/Epson RTC8564, Haoyu Microelectronics HYM8563 Real Time Clock
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
     enum:
@@ -19,6 +16,7 @@ properties:
       - microcrystal,rv8564
       - nxp,pca8565
       - nxp,pcf8563
+      - haoyu,hym8563
 
   reg:
     maxItems: 1
@@ -39,6 +37,18 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: haoyu,hym8563
+    then:
+      required:
+        - "#clock-cells"
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


