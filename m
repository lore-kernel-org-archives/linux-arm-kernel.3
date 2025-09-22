Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC4CAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=; b=L8ONi/aBAb9JlW807z6nGGAIrL
	pi0hBrB7s0RThvx8uiJVgOHbB9NeL8LxmNhm2v/jwnYgc2UMVxARXpUqfca+6b3BNEqlFbZVNDpOT
	7/A/KuWPjBk1YCIzGhF0fLA73HLfar0OzOjaxuRIbwhymgn3/WrRxH1x3Wxicjjd2Ntu7rahJ9yQs
	Pow4qx/dNBgSZQm7W/qX6P36J7BrmjnL5UfzF+VbfTfA6yjNgXmB+fEbF+7pm7wTGwV1CuBTsgKDo
	iGB6AzG1cpFyLElsReiWUlUOK6ln+qU4AYJfqmgjw4Q9YnxRDmbR6rZds98H3bwDpDoZSuqumUN2k
	BwOHK83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRF-00000009yrb-0zj1;
	Mon, 22 Sep 2025 10:06:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRA-00000009yov-1Rjr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so31294635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535582; x=1759140382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
        b=Dp+9ICIqZh4GMCCrqFgx2A7p+gNAckLhjqzQIIL4yVRxFK0mnFiT5ZAzVTMGZyogG7
         W1RpmNaB4C+JH3OsE/GpQ1b4nWOAzw4AgUXYiqMMPbVDhJUhmw5CE2uMeNI+Q420MxRz
         tkn4wwusjHQvJuXG/2WaByomxU3xRGs6uVcNSLSD34I/5XuqsAWz/lyUJsIzPW3gwxsR
         OvOD2i6PUbnzyhyRcSNT4oHLpUeetw3fbbaMDkF8n8GONO1c7vYkriKP5QUlSvJlpTZY
         P0a/SejMDA+QqQsms7aTNahVatXdtCWLH4ctN+OKBwbuN7sGGdq21dRfmmY+zQ+dnjGU
         pRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535582; x=1759140382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
        b=Uz6SbQKTjD2CNCKEn5Q/B0caIA7Kr9VWYttLKf93bx4bdf5kXXTo35+T9HIG1m+XmT
         sRcTEE4Yr+hVS7Zp1ZHco3vgDiFvCM7P88tLygm+JAhVvVhiTGLSIJarGK51RLVZsB2s
         MY/mNwDcLzF795bhlGNLE3roigv0NbbnGkrOxadnBUBRcbeng279ywm58cNGZ5E9ndE2
         scXoc2dmgEkByv7rZ1mN1pIJUKm/hUtT13B6K945iT84QFnckwZjjXhrIu7d/bXOGk01
         uCKg5wUCFlkjCSsFtkTNbHrWapohe29KbXvEeuVX7/ZQBk3sgzKYo8rxBCVbxIF/x1wD
         Co3A==
X-Forwarded-Encrypted: i=1; AJvYcCXPzlvkIscEqHbysIY8ap/pOIRVk78gfpNM/uZU0i/Fv05iKdCDBs2n1vb1mEZQdw4fUXGFXUEaTa0EF9wXui/i@lists.infradead.org
X-Gm-Message-State: AOJu0YwPA3zf+d5BzYYERM5Dc7a0Zh5uhzp8tvHGih6D4ESW3foVUNlb
	HkvMQu41LkBpziY6hKU7QpgCI7Y94e9TYTaik5j98SlVbedSjc7VhOCp
X-Gm-Gg: ASbGncuKaa9Ho7L+Ba3I9hN70SpS9jVRpbV4OEe4418dbFSmlM/yzMxIRRUZgkxVW8r
	bHq1gypyjyxBu7QgQjzqSxLgdn672eUNc1GkZ7S0Hk4VGYr50Is65YjII1FQTmhUjkjm0brJza2
	dqg/9TXpsCwZ2ri9cfuQk1za/cPsm9d17x44ky2mBHgyK8sbuLBOqDizUNOwnJy+mk6fWyL7RjA
	YWMRJ6pm+kTFSGtDORuiv9hhsZAAbZUOdol1iutD5ZVL9v0iVv7d0w+j7ukW89BdY3pm0NRoVzm
	nEmjNxHwrf7z5wr+QJkaQo9XYciLuz97/R8eD+oLm4fn2a8vTv+1mMui/+V53MrrP4eSUK8X5Mz
	sRiMnJ8yf0QyXRvPx7s7RZYnLI89n0NIRAlIoPUa9vE1JPaXL4t7guFRWdhELM8einKHUI0fvjf
	kV1uPyEyfwtMc137eP
X-Google-Smtp-Source: AGHT+IEHy+Y2fzQAk3dZV6QahdRxDSlEBeTRexcfOlN/UPgG/shF6Jti+KLhEJkls/9J12eMEfDQeA==
X-Received: by 2002:a05:600c:b8d:b0:45d:d287:d339 with SMTP id 5b1f17b1804b1-467ebbbfd0amr108011225e9.25.1758535582246;
        Mon, 22 Sep 2025 03:06:22 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f527d6cdsm221293315e9.12.2025.09.22.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:21 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:15 +0200
Subject: [PATCH v7 2/7] dt-bindings: memory: introduce DDR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030624_400890_1B955E83 
X-CRM114-Status: GOOD (  11.75  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Introduce JEDEC compliant DDR bindings, that use new memory-props binding.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
new file mode 100644
index 000000000000..bf1dae15b65b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DDR4 SDRAM compliant to JEDEC JESD79-4D
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+allOf:
+  - $ref: jedec,sdram-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,10},[0-9a-f]{2}$"
+      - const: jedec,ddr4
+
+required:
+  - compatible
+  - density
+  - io-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ddr {
+        compatible = "ddr4-00ff,azaz,ff", "jedec,ddr4";
+        density = <8192>;
+        io-width = <8>;
+    };

-- 
2.43.0


