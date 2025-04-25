Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC/bTYB+vaGGLBaxi2S8Pkok8Y8UeFyQeznhV9/zsFo=; b=4tiACb/IcwKy5mkSk/pMe2uG65
	1kGps7pDeZrGRfgO/57dqG3F2BFQJuHvQ6H1y+3m30L4q8CkGiTfGaaqqdjUpIAtkHs8QZrfc4SdH
	m0L2Hu5jQoS90kq2XJv5VhPWJOtpkiA8Milesd89j0BsIVi7KMV0Nwew41VXcBI0fzrIkbVyIFX7g
	5Io9qB8VumZ9MaTYd7h5Ay01GIHVt1CCFopshfYz5ZVDSbDtmg9T9qr5P/TPRzz0wN15wCLopds8o
	yzELlhc3umA0VVHGgBUeyXixb/oEgzZ0YRyrET+1AtUxIZdXeE2FEL8sH0U/sUzIrkr8NG/+6dwBw
	HzNXPK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JtX-0000000HPdz-24Ey;
	Fri, 25 Apr 2025 14:19:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J5t-0000000HH8n-02x1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:27:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2260c91576aso18959075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587672; x=1746192472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC/bTYB+vaGGLBaxi2S8Pkok8Y8UeFyQeznhV9/zsFo=;
        b=BSNfyllIIMGWBEJ/nAdqQhKIkdU4q+NycVJqC7IW5DdTigqAk2pSsr6/LxyR/OWHny
         GOHHEQ4HmLgB7POLBuY2AQNu+tKZud05SYZHTg4yHeSfQYgNcG47dh+/JU1vOlxy+9Bo
         ZvhTysrgbPxqNw6X1b/Rbxbqql5gi+/YVupqrUspoFi7EM2llUTyn2gqjN4mg4i+j3L3
         l8RYFcO+oHF91fWXEhUXt1q/BkQsFqcEJiEcVh6gGv6mRtlmOjKdTFjFtVIR/LYQzHpm
         NpztpExuG9PZT4ntdqrLxnOUlVZccDP2W6+sP25LDp2Ruh1hP7GkH+5ynYxU+qW+LCtl
         0j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587672; x=1746192472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC/bTYB+vaGGLBaxi2S8Pkok8Y8UeFyQeznhV9/zsFo=;
        b=rciJtsPGQaJRfpZGO67ShL2sXHO01cGRGeU+ZEllpvkdztsivD5+0P5ouz9Iyjes9s
         XgOuDYbhbSSyhHF2YeVJxRPrsKtpsr6J+fPJkWXruVQqjPb6BC0UYNRnCR3GOJtG7pFd
         aMrVkvimX9zz43jCYNxhRxxxrfp6rZDDOZMy6heHo5WDhVgKepufRDzMVx9Ecgh3aRDB
         st/guCffKW4FJTr7VPIcyZsezaiCxBaLKQdQV2TcPVPlz6PbgP7AVWBNHa0f/VkPJJ3V
         dSmvQdIq1YipmaRjXVrBPejO/FL/UVrlCWi8eMAVU8vleNtBeX/JXu67z/WRjA7m5Y/x
         E07w==
X-Forwarded-Encrypted: i=1; AJvYcCXeeID64wrXxj/WCsF7ccxcyKAfEqoRcMmEfnoxKZLuAe/mEgbEkVpph/WAxj4rV2nw1LJlShiG7tY8gm13K9q6@lists.infradead.org
X-Gm-Message-State: AOJu0YzhL126yfGm6eK9UEuRwHlkzXf4yMGOsPhSR0YifKRGL9Hg6Qh6
	t6cCwM03I6RhfpaSEUFBzAk6i6crnJWiVVqOrSb1Bgcq1mT0QmbF4GUO5A==
X-Gm-Gg: ASbGncvxTYoxTF4lzbW6jT8rpTiIjb49F7MU+ooeaNaJY9jC6dBu8e/MbODmtSJGEWC
	mUW5vW4oD0Q+C901NRMymcxDp5lShiXmEQSwIMpK0p0XjsO6eMfRJz8muSVFHnOG8nOZTS3as/3
	6GZgRPgWAFcqXzSLQW17SQSvSQKs7lAFrr4zQaUkPE78Bgbb6EHu2itjF+G/Y64C6aS4bliBI/o
	BOz3WrhfFqwKkNFsoD7fdv4o8OArTAzLj/8GUEpR40Zm2MOax5kIW4Xe9abJ+iq3Db6BV48AHtE
	xgk+CqUXw60SbzbMrLUeR5NOzn9wDoNKAFWIivcMcZQ9x+NorlzoZw==
X-Google-Smtp-Source: AGHT+IHWMSy+gCNd9b3APCkHLWMGa1W1be504gb3RjvrlpnKuAoazKcK7AEzjGj95QEQ1p5LsXvDnQ==
X-Received: by 2002:a17:902:ceca:b0:223:67ac:8929 with SMTP id d9443c01a7336-22dbf15ccf9mr39564125ad.0.1745587671876;
        Fri, 25 Apr 2025 06:27:51 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:27:51 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 01/10] dt-bindings: clock: Add RTC clock binding for Maxim MAX77686
Date: Fri, 25 Apr 2025 18:56:21 +0530
Message-ID: <20250425132727.5160-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062753_052210_04C3F835 
X-CRM114-Status: GOOD (  16.85  )
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

Add device tree schema for the RTC clock in the Maxim MAX77686
family of PMICs. This binding defines the 32k clock generator
block, which includes three 32.768kHz crystal clock outputs
controllable via I2C.

The detailed binding information can be found in the MFD DT binding
documentation at bindings/mfd/maxim,max77686.yaml.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../bindings/clock/maxim,max77686.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.yaml

diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.yaml b/Documentation/devicetree/bindings/clock/maxim,max77686.yaml
new file mode 100644
index 000000000000..72f11309f033
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/maxim,max77686.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/maxim,max77686.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77686 family clock generator block
+
+maintainers:
+  - Anand Moon <linux.amoon@gmail.com>
+
+description: |
+  Binding for Maxim MAX77686 32k clock generator block
+
+  This is a part of device tree bindings of MAX77686 multi-function
+  device. More information can be found in MFD DT binding
+  doc as follows:
+    bindings/mfd/maxim,max77686.yaml for MAX77686
+
+  The MAX77686 contains three 32.768khz crystal clock outputs that can
+  be controlled (gated/ungated) over I2C. Clocks are defined as
+  preprocessor macros in dt-bindings/clock/maxim,max77686.h.
+
+properties:
+  compatible:
+    enum:
+      - max77686-rtc
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    maxItems: 3
+    description: Names for AP, CP and BT clocks.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    max77686_osc: clocks {
+        compatible = "max77686-rtc";
+        #clock-cells = <1>;
+        clock-output-names = "32khz_ap", "32khz_cp", "32khz_pmic";
+    };
-- 
2.49.0


