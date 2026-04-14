Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88643F9D0F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgrcDBo00fvd0ONP3/8K015y7G5ee0sLoazM00cdyt0=; b=LQOH/N8KZxaHmcQ2FMAZSmoV1L
	cQmTgThEV2Z2Mi9CRzeRR5BSGdBwZ/Nn91Km6kCuDRLqsF9VhrH4u3WDfuX9b5DoBdhDS+M+cOPjL
	q+/v7cwsJncuZw+112r3ZKQNtG1rQW6kBtGdboPUrFNSWDc4S7jaoNIsKRE57ek5Xse6xbgyHrHSS
	gVAdS0J1jv/pxdlkhaShXChFAZPeXI3N81q3xHnTSCII0sti3GhBXAHyyvTWf3/LvkaZ24dxPrBeB
	waYEvxllqapfQL0Sr7XRTEoJHeNee9D87mEqNGApRDENX5wYeMqskU4Ay0FoOFWtXiNl3xhHL/j58
	2yLDEA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3f-00000000Dsd-19zs;
	Tue, 14 Apr 2026 21:12:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3a-00000000Dqg-3yUA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d75312379so1841282f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201145; x=1776805945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgrcDBo00fvd0ONP3/8K015y7G5ee0sLoazM00cdyt0=;
        b=EccRkIs7Er5djPp7DpZSprtIMP9KrTdTFD919xopX3Kb4IAJZcG5cg7xpnW9k+laOo
         2vcZQxXrI7ws1k7lfc9Bs4TkxunPMDfjVlOLI2KvruSYUFW6Ju1N/3OXnYXk9eDJcvyp
         i0JG3FtVLoWslHRfJgJpcZp+3OKfm3OW0oUOVC1jC+tGsgTtwR7OOPA61qeiupmU5/7y
         Pt+jGk+80/FC40WuxAQ6nktICfgBjOdIsCKcVeUuBsQvYUj01yX9oNU86YgSvDzaWtEw
         oAI46TuhFo+fteNcDnxePmdXogiP21VQv331knzmdPjrmYPZxEMjK3lCmYyQnMDquez6
         zp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201145; x=1776805945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tgrcDBo00fvd0ONP3/8K015y7G5ee0sLoazM00cdyt0=;
        b=Kxg+64neQw675VqrYPTylCkD3FXcbOwZSb7isxU7Cv9RXtudCeY+YFxANVQnmNl7Iy
         ACcpu/lmiK6wZUOKx8xf4djMS0WFztd+49iYM7P1SF/c4EP5aNooKpgSjXuDY+arVX3j
         0dmUmr6N3v7iSow8lQz2vWGNNdHNUWLPLrF4uHOx04Vy8YRUXpbRaUyLDJ6TvP6qtXpZ
         KkNi74EPCposd8262DZtssM+RVLcY752FxHrA2N2b0F4Y/es00PIoKZKP63GeubJh0nR
         O+BD+aLARh1UZwR/gsbA28oyKM95oTIsQ9bZ/vk18MnxhaL9CQJeo01TD9YDZS2IYc1o
         c0TQ==
X-Gm-Message-State: AOJu0YzedwXTHqpcWpdpNtfCygyASM3OonbZ+bK46C5R8sbZKsLgj1ZH
	O5vi1mIyo9tBJR3cIl47TLzh4jEUqSF+wI09lXQGzzaALL41fXbBO09z86xgaa3n
X-Gm-Gg: AeBDievwo+TVX5IIKO8n05BjmZPp0O/FkuTn4dILhfOMzbT74cKYN06XRsJtu9DKfbT
	FmH03l5euR8wZ+cNb+XxVT01SFu1nW7ks+cs6RmbUKZXi0iaqfBDf7txL4dN8W7SHsBW3QVpMoa
	dKXvEwUfXJEdX3Ce6dlweuC+Uc1CB33gV/AP+ElScNtCef++M4sBQIwRMi875pJQA4J7qpRUN52
	ziiZKpDy/Blr36PCjVkSb9CT3s2Tk1jFYsfLKVeebCmKZnM7P4KCyaw7OcF1vycjT2Ph85ntsn0
	5tW/Zur+YC03fYL9jHl6XWHzgVwa68wyCT2QTq5wMID3BVnoasKlhff1ckl/AudOxsli8kCDfIr
	FcKn5YPqvmPsfddj7JvPUGy/3yQcwyv+6Z70/Pm+eaWKrmO6WbtocZf7wLXFY1k4Uh4UTqvwW8i
	OHg50C+YauAJ72JtqAwxWi8qaq4dBNS0A8U5H8obFEDl0=
X-Received: by 2002:a5d:6e48:0:b0:43e:a703:3675 with SMTP id ffacd0b85a97d-43ea703396bmr3825130f8f.5.1776201144745;
        Tue, 14 Apr 2026 14:12:24 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:24 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/8] dt-bindings: arm: Add zx297520v3 board binding
Date: Wed, 15 Apr 2026 00:12:09 +0300
Message-ID: <20260414211215.152850-3-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141227_010673_6BB205C2 
X-CRM114-Status: GOOD (  13.97  )
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

Add a compatible for boards based on the ZTE zx297520v3 SoC.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../devicetree/bindings/arm/zx29.yaml         | 20 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml

diff --git a/Documentation/devicetree/bindings/arm/zx29.yaml b/Documentation/devicetree/bindings/arm/zx29.yaml
new file mode 100644
index 000000000000..717ca6413993
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zx29.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zx29.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx29
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 974d7a98956a..c29eb2dfb1b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29202,6 +29202,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zx29.yaml
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER
-- 
2.52.0


