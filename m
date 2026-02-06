Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32F2EE6B47
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W62an0abMcrLJ9IcEAjj5au+IY9PVbDUlIRL7uo1FT4=; b=kw2UTW+ZN131BZ6k2ZVgbuqGKD
	STDaev/SHWJO9Vi/UTMAZTwd/Vv+prJIHsV3+wg2wWzxg2hcepsPUFSKEXDwCWE7++zSRSGj67AkN
	q8NaO9aUtPSw1ku+D7YZlEhqt1hXKDqM6yZy/1qFaTGhENd96bBfLH20klTwpDgjKpcuBtu6P4vQ3
	GCOFVqoes8N+J0j1GlQVIbIVecAezRAgbrKFkgG7iQDJlcGFn5eI1vAFMbj0S2eqRwif6yJiMKHZB
	CCiSqCIcebrpSN+nitL4TWxMWxE3o0eYHMK+SXqRd/quERu3r7/2uwjb6tLYh3HLoOzcJr/prpDnT
	EBRi+22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKe-0000000Bejs-06x8;
	Fri, 06 Feb 2026 18:13:28 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKa-0000000Beht-3Ebl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:26 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-124a635476fso3566264c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401604; x=1771006404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W62an0abMcrLJ9IcEAjj5au+IY9PVbDUlIRL7uo1FT4=;
        b=X9eM5z6i1oFf5kb9/cKhhSBAs6sqWoDpqeXiqj60XTJGsayhCB/A+ip0RK+1z0jalU
         ylSHtt7KF1cBGULaH+TXhZq2kgLSqqcsKybtmwq/JrjGgPaMsVl8zX3RuF4PxNaZusDb
         rQPpY4hqomXK6wHRX6xutU64slBhQ3jGLYFpXpz0bxIIF7Gcu28Rx3MK2CDr//iG+MtN
         3Cc9taQffCPru+kjVL0cvmWPxrKaquLTFlCjn3qHdbaWxh0hczMiB9K9eHITOFhTNGgy
         f5dCHmkimRtQqwHoFDdKmGh54sglWoy7qElWSbmnFUtNKHsI+3rBpJFVfXwuC8381QxJ
         vcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401604; x=1771006404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W62an0abMcrLJ9IcEAjj5au+IY9PVbDUlIRL7uo1FT4=;
        b=EelQ0ZUN/tfjh+j7p9pDwANxQ+KTofkyj/R3SjQYX42WTj4iQeOY2pDIlzs4R+LnCn
         yeZDa6Zku9KgWS4MKlcF1T24rEBjLuAWnph8BgnsaNsZYdWoTCrSL1eL8Lwp1bGEizi+
         iAtIFiT93CMAp7hMUy783E7hXkObDwriYk+FU6h5xKCLbcFHS1a1uE4/m2iUi7MuEwry
         CXAWHpyx0avjGyJjEdqyhbvMKB+LLHA8JmCSy0cJLHaQ0qR3ZIZ00fUV5GOxMX1Gp4wb
         HbHszZnDBs8Qvftwq4zsgJQUveLDJsQIEwsLtpkaM7DUb1ocisfPlVIW0dIeqVxDA7Nx
         Yh+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu5qPK80NGEJoHACUwGAQpJMKNMuJaQde8jBtwzPz8tpSwuuucdXqdCIP9zXrABVisnb5cs2jQUyWE5YZF4qnE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy4/ODXbj6fPJJtORHlkFJuOKUxzzic0TTX9bQqW5skrQX3HRg
	KQo0gz2dsWuLZ1iFzVr5QAzmejpgkhRYNh8kmvzZH7ZndSPOFIc3Y8gL
X-Gm-Gg: AZuq6aJM87XxDd3RNHCslOAgohj1bpRtWSXEefRAdvljNBoGcs4QZsdKm7/Li+rTCzx
	Zp42iNAuAIXgN0thPDBIUQXIIDY36PHARQUZw3XesLgtGYWc//6uju6h091feWiNdTevZ5E0l7Q
	ungwAFekw6+2ZBLYIdNtjq02/dbafpk/ZC6TVY0axgMMonflskjV+RDxgIBm0XghgaLuWaxz6P+
	RxjiPlvaq/3dfVfYP4DiAlj2KDJk+daI2+CC/ZnApTE9PoOiEfoU2MPonxOYfQNoRZV5ipuEJmK
	xzbyAtxslnI/Encr8oQ/VNofe6i8J2/LhagmFOAceQiVndWGtzogSeqtgnbl58Is3EJOPpixLtZ
	6z7umP4RVcM8RuFg8d6/jG1YqqAMKHUh+WKGZE38LNnpkrPfwDgQnuJEbhv2RxZ6O8tP+MN1XRH
	mAIbjxE0HhodAuyBfEls3llEtf
X-Received: by 2002:a05:7022:6611:b0:11b:a73b:2327 with SMTP id a92af1059eb24-12704074607mr1378821c88.30.1770401603758;
        Fri, 06 Feb 2026 10:13:23 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:23 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 01/11] dt-bindings: clock: rockchip: Add RV1103B clock and reset unit
Date: Fri,  6 Feb 2026 15:12:59 -0300
Message-Id: <20260206181309.2696095-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101324_830382_B60D1B93 
X-CRM114-Status: GOOD (  15.91  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add device tree bindings for the clock and reset unit for the RV1103B SoC.

Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../bindings/clock/rockchip,rv1103b-cru.yaml  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1103b-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1103b-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1103b-cru.yaml
new file mode 100644
index 000000000000..fa7298955aea
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1103b-cru.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rv1103b-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RV1103B Clock and Reset Unit
+
+maintainers:
+  - Fabio Estevam <festevam@nabladev.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RV1103B clock controller generates and supplies clocks to various
+  controllers within the SoC and also implements a reset controller for SoC
+  peripherals.
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All available clocks are defined as
+  preprocessor macros in the dt-bindings/clock/rockchip,rv1103b-cru.h header
+  and can be used in device tree sources. Similar macros exist for the reset
+  sources in these files.
+  There are several clocks that are generated outside the SoC. It is expected
+  that they are defined using standard clock bindings with following
+  clock-output-names:
+    - "xin24m"   - crystal input                              - required
+    - "xin32k"   - rtc clock                                  - optional
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rv1103b-cru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin24m
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@20000000 {
+      compatible = "rockchip,rv1103b-cru";
+      reg = <0x20000000 0x81000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.34.1


