Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6429BCEDDAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXSFON/1VQrHCM+f9FmS2ChuuEZCr9AFJjq4nQ/j5F0=; b=t4d/UC66mPjDm+fCB9W1W7CzUS
	kenWPK20uyJyvXahqu9yl9ErVIYQk16PaO53k1lsvtdglVUGLpIRGuRnYgmHOd5zfBdrvfORuv08j
	Abh6KeJlwd9/va99eXrm3D0wFqfvow9SKDlOvMdgbTppdXeFXm3AnfN6x6RFR1BCTn6cxWR9ure3Y
	rf9upn3kszH20ExS4y+4oy8ttuboM89RBjNYypg3rR3Kwg+ogZULBFr7tHP8N4VQokpDnZEVoPyFn
	XTPLMSqoWHt7sqcO8DBAazuWfY6XYFohUJC4GbXIPMo0wViuH4DTxwNq/N+darujyQ/uOiYCBBn00
	3Cj4Xaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKL-00000000bQF-2BKM;
	Tue, 18 Nov 2025 15:09:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKG-00000000bMt-04Qh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so2840395f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478538; x=1764083338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXSFON/1VQrHCM+f9FmS2ChuuEZCr9AFJjq4nQ/j5F0=;
        b=lT5g3ZW3UcgEbqKUOvM++IJM/kni1ejUsnFxt/4EQhJTGh/nGmRLXfaMzYKcG3QM+A
         rHZqE08dbCHr7Ek/q08fi42UTNrMzWKpsHHldXmtcctEn8WOE9l3KsrdwSvZ6ErG68HH
         +f/HeBtG+J+dDsyZ6dcEcpI67OK9FFnG6n72nlACeX7xnfGKAl3OIGfv25GxjySb9ozS
         5Lw/rYjcrsDJpWMLrsOGgmt78Yzxwn/+DtkZvkRH5hBSHq/eosESGT9vFPiQU/a5dN8o
         KoDdavps9Ircy3umuGesgebhbdmbm4i+vpDwsmKXXLyUme1Xs+aKhu6pyLvw6CospFr1
         Bd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478538; x=1764083338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vXSFON/1VQrHCM+f9FmS2ChuuEZCr9AFJjq4nQ/j5F0=;
        b=v2gk4katHWKGw3os/6FwaLfuUaEk7UB7qoYfXzn/cNw61GfZ6doRNtNhVYtNZE0hMN
         mCMyRZRQcX7WntLBZkxaTnxmobFEbWrenKGcD/reoFvbmjUBWDgT1aw1VN3ENXjGETS9
         3JxpST0hDARZ55SO+wGnQOnmMiI7kolkIJvkQQdxXgMSY7wepqmHmhmFRpmil1ZLpWEc
         XN/fzuGfOav2H2kjGFIvya7hASnbc/uLAB8ycPicNhXFgM2azCTyItXtTjTsrYZIwwIq
         kVXbrlXjyB2Ix1R3mjycqo9pS+yOVYnYRrLfI/jTngFYCEYtHbXs5OdFoDJ0Phhl16ta
         6SyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8AfS2HgnesKjw3payydvFysi4pBKel5gBbgoorR2Xo41BFO5X75DwDHUH7JoUzYg9L/rLeXu47wW6zAo+KK43@lists.infradead.org
X-Gm-Message-State: AOJu0YwqlCiy3+CeCxGmeshf7NalNgT4bTHCAjzuKwqS74vGIBpiUole
	iphpq2kXspmgNq+VU1FfxgzgkN6k3cZFh2QBW0wpXmNkA6U8SqjCovWd
X-Gm-Gg: ASbGncuxdgc9uok3mRuUQ4DSRh2t3ba2/CPUmQfp8cdnfU/Vtj9o9a4cULsHdxBns/+
	dTJMW3RBXbdyUX6fp3fS9V9S+KTxPgciFTWW5SEgzGiaYNsEArWT16sFGK/alQuYS7NJdLlWLxV
	K07YOnbWhnUqW3A2rw+HwlcAIMejuLZsSBIAh6tjCtqXS/+I78xiXK4Ld0HtBJJsQ9rfY5fM+Qa
	FKyC187qFTuotsg+jZ4fCkAlTU4g307TISSq8C+Ld9OvvhDCZNXRJhiD06phorpR8DWPhbWT37V
	gIzc+7drvfbme/IkIEVexp/Y6XgUZCZSQXl62YpYkohwmYAU4FpPLe8RC+p1EIWS9aqRMHJuoR3
	bktB1JcxlVx1ej5tlbzEvsspSN5niaMWqkTHEYvxpGr6qynA0FOzeuJmhGofd78G+S2HYVFcbPs
	dFw4bnSRYncmyzTVOTN/jzXmsUDyWwXdfzM0vz1fMllXDAO7fkNnkVvzr7L3GRJOCQMBQ=
X-Google-Smtp-Source: AGHT+IEUJJGCTrmMLvsniUV7hiBdNMRfXZvya+c/u+hMC4mF96bJTPI256APV6+JR6pYbekvFc8AOA==
X-Received: by 2002:a05:6000:2f83:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42b5937618emr15137124f8f.52.1763478538022;
        Tue, 18 Nov 2025 07:08:58 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm33875087f8f.26.2025.11.18.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:08:57 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:07:58 +0100
Subject: [PATCH v9 2/7] dt-bindings: memory: introduce DDR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-2-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
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
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070900_760708_02399B6F 
X-CRM114-Status: GOOD (  14.99  )
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

The DDR4 compatible can be made of explicit vendor names and part
numbers or be of the form "ddrX-YYYY,AAAA...-ZZ" when associated with an
SPD, where (according to JEDEC SPD4.1.2.L-6):
- YYYY is the manufacturer ID
- AAAA... is the part number
- ZZ is the revision ID

The former form is useful when the SDRAM vendor and part number are
known, for example, when memory is soldered on the board.
The latter form is useful when SDRAM nodes are created at runtime by
boot firmware that doesn't have access to static part number information.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
new file mode 100644
index 000000000000..928961c74026
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
+      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,20}-[0-9a-f]{2}$"
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
+        compatible = "ddr4-00ff,azaz-ff", "jedec,ddr4";
+        density = <8192>;
+        io-width = <8>;
+    };

-- 
2.43.0


