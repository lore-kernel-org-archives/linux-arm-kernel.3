Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCE5D69115
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5Q6Qv7Q+7NO9XRjvZFVeABmFoVh33eCRfYHhRmvlpw=; b=ZLNaCFu93HwMv2m4SPvw1Xaryd
	wyCvgOLd8jdBw3HwNPfs+H5DzqCSyQ992NNxVe8nsDQxJHuGZvgUUWTzhU7n/0C87PJaXNTBcsNLJ
	290PbdxD87mLLPoysG7Gxc94K1FLqAfxmKAYIhLei7HkGgLmZoOjVOgZOwD8bhoTa0LQ4swPmGsuh
	mT3TDhgBpZXjjo5PM05CPtmgaYQMGd3o91t3j9W49uBloB6SXWQU2K+GJDIaku8NM+ze76omRT1cU
	iiN14MEAyioZq+iC5Z3Jb8BEzuxMOREO4T8AxqkjHf9Rjm5LE9ZliCVFd/N6E0VBkyXFRIcpJiOPN
	U1p7yhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgME-0000000FsLP-3HAs;
	Thu, 28 Nov 2024 15:23:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGC-0000000Fr69-1O9P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434aa472617so8345175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807011; x=1733411811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5Q6Qv7Q+7NO9XRjvZFVeABmFoVh33eCRfYHhRmvlpw=;
        b=f0lrrhg8yK5ZRr529HoMBwZIyOnln24wl7NwRadesFKdpawgpL2rYsgv3tWeKY+qEK
         wFOkkFi97wqagkG2CH8pEmpmMmwkjafcIXbpK8fp/wQLO3sqMo2lrvz++pu2JjuqzNg1
         S5y4q84zGUPhyFAx7eldqDRZWM6XAnDVLe0IpSAhTuJJF7CarLl9anvOT/D/k/Z8szkf
         uWsWLOy9M/icsb950V+p1pnxyBGxhwwbEJQRGMhSCH1TNZ3cvqH/Qopyz5Ip1MXokWrl
         y19RGJ2ntLQtq0xSLh02p9bdetEPabFwm8+H2TTbE3TNyZoCYUecffTvncW3v4sFRMam
         uUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807011; x=1733411811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5Q6Qv7Q+7NO9XRjvZFVeABmFoVh33eCRfYHhRmvlpw=;
        b=CZ0O5TkrJSFBH6EEUw/6GurKaCYkWPdziBgGbRMwsTl6q88eOsv2Qk++D0Nf6jsrHU
         rIvm5NthH+OHzrpRAoEXL1OxZLSoi7LD0TqRFDrHRX77BZmkIHe23HMQ+TFvYaFMmLIG
         b0p/B9S3ozJSD9zcn/2HTk7zs8WzKMkmCiJTaaWaT9hYQtYC3uImzrLlDq1RH7wAZcJC
         leOQ/DjCnc1zvS9SCZR1yrgQo6y7whD/X6MkCl+mgMCfNSoaUjOVBBCUOIjZXE9SU+4q
         UGuSBk3rSiz93jBYoDXlXYkWsgAXad1k4ZOl01S8mUWgu1VYJWlXxeCaHeuvWURVRwuv
         BwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9pYYEaQXp2DBkorBiV+kuVJxvA8a9fSUvaYpq7oGMWq5GjYV0NWLBlVkan+ksHKC91YPbc5FCZvqy5yyL+xRN@lists.infradead.org
X-Gm-Message-State: AOJu0YwWpKiR3hMYhCe55zHnsfZyAvVGvkqLa0uf9TIlJ1hScG/ytKYG
	tB3ykxTLw37zlZGm+3F4Gk9PbNFg+AFarWCBaVzEWZ3PlQ4nYe2czCPwd4NttQ0=
X-Gm-Gg: ASbGnct2NWLRKZyhleug2w9EYePw1S71ng9iUu33oZI3rq6ocJvsWhhdlf8gWfqsguB
	etDLObaZBw5hAcuqofj8hIPIv+PIv6rlL0NS3Hk4DUaniKdLzAX7jrHTfHHPXgdmS9SSHJmlqT1
	MAox3dop+0kaWup/oXeXAe3s95oUIgdKxurdMHjWdg0ax0JF1cDv1nvv4TjKkjUXhZGBIQ/Rs8d
	42aMjPsFPFf2Mifl5Tutc1KQ6iCtHFaHqkbrhrOXkTsIoon1PoQWol5J6ghJ+ApGtVedXM=
X-Google-Smtp-Source: AGHT+IF0iJc1B5czbddvWTBnzzA/XHuEcHL2hR6LyPDDF8y2Tqjitcp7kVj8ES42GYzv1qAY3kVKlg==
X-Received: by 2002:a05:600c:3b29:b0:431:57d2:d7b4 with SMTP id 5b1f17b1804b1-434a9de3be9mr60030445e9.26.1732807010910;
        Thu, 28 Nov 2024 07:16:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:44 +0100
Subject: [PATCH v4 4/5] dt-bindings: mmc: document mmc-slot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-4-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KH6tn61/Aofb7L+ocHnF34SBttJAGs8D9xM5t0ckYwk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlcZZ0QyhefaYAilsotWqcLqgfPkSKK9P1RiHTk
 FklhojiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJXAAKCRB33NvayMhJ0QNtD/
 wJTQlrjKH0PY65pp1YvHE/K8ab0MOAghsuUJS/CYKI6D2Ee2EewIuUP5zLVsm1tq2+EUEOrJBqIlLM
 xgxNnGjNR2QEnoZfWeNFEEACal3ui9bkPZi7c2/CSi4KUw5SAT9ycCwBaNCH2JVbX+ubMcQJo6XQW2
 IoqziEgnTD32MkJP+gFanL4SoBxlVE0sGU3QiDu3scymKJ9CCFANE0EOsuBmNS5RIR0h4CEuFSsBPd
 cKefbWZxv97HOPZPXeGrVt5CIkqZ1R+Ajel9T8zVeQ12NZ86wXD6ytuxe1LVXq0pNiQWZ7pvk/zH6m
 SBIZe9BM6HH1ggbkmp77J6HTXaFZxP4C2HjNPXsWg5Mzx8X4jF8318t+BkiRcaBmDxWAc55M9FAS7h
 B3I/6SO7VdKxmRjJc2HKqMDiMpk28uXgaManIKOkN8gzmJtp7QZgYgTTRuO4wasH3yifooaU7AEUpL
 lo71weRzjMjo7d3Ev8mUidV+EvTIgqsbGxAMqmfoZvQROyUkcFMLMFvGmVWMznw35s+2k1yh4zxq8y
 h5JdkysR9IUT/SlbHfkuFR70LYpUIEROx4wThdLGqLVbfKf/2Ci9iuiiWlMOtthQcz60C8+m+Kg5qs
 OOD2zGlhE0zLGIpNpIlTBCYvq2DwHZlzV71aErT//1OaZGZHMJFbMGvvIomQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071652_380350_AAEE2AB0 
X-CRM114-Status: GOOD (  12.21  )
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

Document the mmc-slot, which is a subnode of a multi-slot
MMC controller, each slot is represented as a full MMC controller,
the top node handling all the shared resources and slot mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mmc/mmc-slot.yaml          | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1f066782806341a9f72460edd8e6454ce22f4320
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC slot properties
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+description:
+  These properties defines slot properties for MMC controlers that
+  have multiple slots or ports provided by the same controller and
+  sharing the same resources.
+
+$ref: mmc-controller-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^slot(@.*)?$"
+
+  compatible:
+    const: mmc-slot
+
+  reg:
+    description:
+      the slot (or "port") ID
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      slot@0 {
+        compatible = "mmc-slot";
+        reg = <0>;
+        bus-width = <4>;
+      };
+    };
+
+...

-- 
2.34.1


