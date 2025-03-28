Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF29C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ/A5NQVl/i0LPvXyGUfZOVhC0YHLCb1cbCkUXx5q1Y=; b=F8zaC4+7daWygSkeSbEcPfZuH2
	bWH+fl/or73i7F7/90NPb1YpTZngmyU3IHJ3Fn34xDAha1vdU11pjecrBKd1vjko5CGpestsEejnx
	IbXQKLG2JV5W/P7cSD/rpBIazBxVdX9fDpq1ZDHtbb+CgZK/zS9pu83Lk5gyY8+hobYsJcAxfKBHS
	faVtDQ5ycNUmp7UT8daKEi/LVs+xX8DvLDNQG0utg8QAaXkPA+SuKUvPBJ8vTunmPe34mXF03j9o5
	5gbRcPwS5a4ac4QC1ck0TvxgSp73RRaf/lkXxgqIEAjHCy9uMUJv4U2hPUAwq2TnMWNjkgYtf5cvR
	xFOzwNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2G-0000000Dp8y-1jV3;
	Fri, 28 Mar 2025 15:54:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBQZ-0000000DjjJ-23CV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 15:15:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso453369766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174922; x=1743779722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZ/A5NQVl/i0LPvXyGUfZOVhC0YHLCb1cbCkUXx5q1Y=;
        b=pDB4ah28/QkxFaaS61+NNySVEp+xgclMYieAKamtkBBmSBNu3ychZX+w9fZ6EtkLj4
         G29VUyglqbNoK1Ak8nGfO4mZg4lx9WFad0XjN9QwFfw4qhqs3ywINFvJxb4G1oz1E21O
         fXTDSwBjTRfd3cg29b3Pu2llpKdp6rPvBdMSemntQpZ+P7KHAnWU/pEucOOU2LuQ86Sw
         IzbwItDE/ifX7XMjUrciOSiKoRqFj0eQ+wK/mfCss7Vkf6CwPXaganJQASNNZ4Hzc6QT
         edGMz19GMRVEJvQXfCiRu/uZZxeGFly/9rm5ZOwxldNWNITzg0917m5bJEdTBWvLA0jZ
         Dz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174922; x=1743779722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ/A5NQVl/i0LPvXyGUfZOVhC0YHLCb1cbCkUXx5q1Y=;
        b=LErDWMpzdSQ+f6LWAQEXlE7Q457P+mRiXpKCaAVeRgX8yngFuljhgOdVqVWRGVH3ae
         fpwB7iBvNE/huvUwK/BAzdQuVqYrZW/TIjogGBbztaDsoLT9XJ2QnAxKImJVFzhVdBd2
         vLZ2ywDfyMYfY4aCgsgFNablTgw4AD1xDK9onUxN8g5Dn6n+8tMRd0liNUhsXUn2bzbH
         1PqhKr0vxz/iTNbKzxLOU4IGV51cDbjtQLUovQPzMmr+rs2nB9uizKShQmrgs4r7dAi0
         CvslygVY/8Q5zQgSIROfgUrNcHLkMFaO+MAiv/jAu5nzM0b0fqufd2q3mYywF3urt3dZ
         qAQg==
X-Forwarded-Encrypted: i=1; AJvYcCWME8bk0QIoAVrgEzp3graEZetMyPvBDtbP6CpbjSfaU3Uk/Gtkn8zoetfJXTtjWOJuT+fAYWZmvxuX2XecUnTU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxulk+GU2qNO3vjksOeWH+vmEO+xN6ieqzkteRws3IBBJ1N+9bs
	UpOO20Hts1WR2/cKIyR4GQYOd1awBMaoDHl9bWLnKE088W2M2wpkf6bsVFbkGKk=
X-Gm-Gg: ASbGncvFtYkYZCPZj0/17/ShnRXpSuwJ5fokplhBEwJ0spvUWIXN1wX8aQsL0mSpK6K
	8s5WoFDNgnHGKibi4c5ARbavzV3oxI0qKcgahsH98+8aVRq/JqCeGseAKMiVli+4RTspq26iE7d
	Ks6Eipzosua9Q0kMobURVBEAXbY06kGQJhkC903G+Qs2bK0VAu73uKY5z/XzNXdyGPm3TFTUHg0
	CR+F0F00V4y3f8MMJlYdukB+NA6rq+GgOfkCEW1mJgAwmxtVr7eefWriWtbXrRjWVEG6N/p1ujc
	8lHIDKSo1v/YaQty3n+8pp9SBTW7DxLvz4lqS/QOKvKQsIC3NbVqOXIYHbgYtCwNIoWUiBpZeVn
	T2QgAmzq9Lj6UsglpiS5QA4Rm1YLB
X-Google-Smtp-Source: AGHT+IF/SAGXajaIJE2fIq4KovdnKXhHLZoUZ8JDIQJu039BLgAJUBx5iZLh2HzQlSqeRVtqSuVgwg==
X-Received: by 2002:a17:907:96a5:b0:ac3:8626:607 with SMTP id a640c23a62f3a-ac6fb122244mr749440766b.38.1743174921576;
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b742sm178789266b.65.2025.03.28.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 15:15:19 +0000
Subject: [PATCH v4 1/3] dt-bindings: power: reset: google,gs101-reboot: add
 Google GS101 specific reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-syscon-reboot-reset-mode-v4-1-77ba57703ace@linaro.org>
References: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_081523_558339_87D76A40 
X-CRM114-Status: GOOD (  13.36  )
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

GS101 supports a couple different reset types via certain registers in
the SYSCON register map.

Add a binding for this.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/power/reset/google,gs101-reboot.yaml  | 32 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml b/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cbd0a1d9b45af0cb994d616c56b96440c43ab971
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/google,gs101-reboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 syscon-mapped reset
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description:
+  GS101 supports a couple different reset types via certain registers in the
+  SYSCON register map. This map is retrieved from the parental dt-node. So the
+  gs101-reboot node should be represented as a sub-node of such a node.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: google,gs101-reboot
+
+  priority:
+    default: 192
+
+required:
+  - compatible
+
+additionalProperties: false
+
+allOf:
+  - $ref: restart-handler.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..e27f5e672bc5a04777afd098355898654654659d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10080,6 +10080,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.472.ge94155a9ec-goog


