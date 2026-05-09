Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0EACD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=; b=j0UwwNW592d1gI79DzPLS3LdBM
	08Kq2I0d+bkYPXz8rgzGfJ+KKABCNp/UelVDMfmyVgqfofobvBhOZ3+3m9rrGT9mM1uGKhwQveRYN
	U7u2LQfjKFU2PQ59QeLKcw7pWKSVekBMNh5gIzmRKbfi3TUIc7985LqwbwasjRRv/DofmaGv4XUnR
	YeII5mSkFbjrVlt787r0qcUu/gdaNTvgRsfdp6njJlBfrH6Ik2ES4jCcmvrihynb0+Yk309owRHF7
	+zzLEUN3RgFRMb++tvWATpORTyyMB1Cm8imy7FWDRXKHl0g736Hn966apvnMWhgD21S/MBHJtWcJ+
	MQcK2bHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuf-00000009TII-2EsX;
	Sat, 09 May 2026 19:00:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmub-00000009TEE-1KUX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1778470f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353227; x=1778958027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=dbAVs2Vzc4bgyKnM5i7WkDx/FivMM9CT2e0iW2CbbNXHwEaPaciBkUX5bewe6ulf3D
         +kctnOUpmHOJWYcvApio5CRv+vL8Zpg/Nf7K4FEtj2kkOYR1EZwDRao8x5oYgvS+urcb
         4AQGd3xIiNpXxgNAZICtj7sfiZZ5zzL2NkCDQm9XEl/6+z1e7sahSyP6OOR+bVW2Fnd0
         V3PQ7ypcY3X4m/ZFYZAITr/Xj8+KL3kIUDL2ITyIe7LWYrHGwlY9AYAfzMTPA/ty/RVX
         b9crNiwnLx7XKrw06vdY7COcfsUwU5eq4ojEnbyC0jsW/P5Ojl8UROrcjE1Tkpe76q7D
         GdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353227; x=1778958027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=Ff44u/iOXyDzM2c4RJABKtYb7hpYWq+SbOHvHaJ/KFYUxyLPG3+jKj6u4diZ5Ri+qj
         zBX7ex2g3le43KPLhIbv/9mfH8mdD+LuGRX3EwWD4XM2Y/SL0P1adluW+4EssHNqmIBe
         GzYsxZ5SBUGn/teoCPTEJjl7MMnCTAJpOrI/tSNQAWgOQHGCVHSwgrHmqdcnc+rCtOcn
         I6OhzZFIjVJU/OjRSaDsL7KB8kUXV6ka9SVVI+9sj2Neb8Mvrpdpby9tIysfm4r62lPR
         wkWzcXbyfIuDtqBVNZoUR+czJ6+RJW5608Z2AkDdghPlz+rpaleOaUSLE4meBlSAHvkU
         SXLg==
X-Forwarded-Encrypted: i=1; AFNElJ+nmM111sC7c3SczWXsmT4bBMocNq/smaNLtuEj7dDMAA4lcTPsQyJPcnWzSPZpSV+S0HdOvc6Lu/T5tyKzTZGc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo3+oDYgxOwh6eFXeVZH/dC4YGaqDlFeXO3ySPJQr+fkvZ5kPd
	PqhVPEsigmcYT0SfhEIGtUDMjk4QRA/VwFZ9qOHupJFzxYYCB+MTZCk0
X-Gm-Gg: Acq92OG7RDgRuhwTfynx2sB/+JooppV8952gz11iMYP23ZYlr6CUmErLWwgpudbS2Ez
	AEGLdy7VYmbMW31MM0/463WfXeU7oQ9bvxGGdZ0E1SfajR4mn6rJle66H9ifdKl5KrNovBefep4
	Dqrk03fxABqDaaOBbalCov/wjTBCwadOS9SbYnqybFafOwWUuHkjzNm9caQQYk80Pp3197OkBcN
	45Y2EMDwwB9JMiFYfYskRJhoCW8DUTpO0OzCqC2Y5jJ0fbR48kIHAQbnuq1h4gzq84LzQ+YtgzC
	/GGKaizqrU+H7D9e0xxJgXVorA5hGG2LlA/Z7BZs55avHXvV5is0bl8q+FLiTAoI6uDSYaY8a93
	hFi2s6T7JZyrwI3729w/ulVnfbk3Pp8M8DEr3Rjt4uY0866WHdT5RrRTkKM8Jg75kbLPas8cZ2F
	1blGy/T0rZrC+AauwuVe9PpJo/IHFzuRfAUljBph05qAGS+MwuWvNJgsQgERAo2K841BYed1EWA
	HVKVg==
X-Received: by 2002:a05:6000:2dc6:b0:439:c661:3245 with SMTP id ffacd0b85a97d-4515cc31e43mr28677269f8f.34.1778353227339;
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat,  9 May 2026 21:00:12 +0200
Message-ID: <20260509190015.79086-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120029_449386_A653E990 
X-CRM114-Status: GOOD (  14.39  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- dropped | for description
- better description for allwinner,plane-mapping

 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.54.0


