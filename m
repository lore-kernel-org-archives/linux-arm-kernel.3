Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CCCCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=; b=CZiyX+rKRvqd4R0uT1yhaN8f3W
	PkHKrjgLbf1QslkL6/fXgukmps0egdInpaYG3kpts3fJyG0dHF78NnvPKcUsd7b8oBaEPMsuRmxcM
	dRiFIbte1kl+Ldx1XocTfHLCiupjXHoAGFSOEHJ7EeODKkyfBMAolOaBvbAQe1SMniu67AZay+NnQ
	dfJ3jxNnRbQTg9auwW2XvPHWw0NsLAzm99IHu7Hwz/oF7IH61LP4XPnKeljqvZXuemzc84A2ebCvW
	3EsBayLiltOwlCPOdgZ92XLXPlgo5xAfNIQv9ZBGp0C+ZSFg5s6GpXH6WurE+OMKuqx3Haumx9QU0
	B2iP2qeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVf-0000000763e-2HiM;
	Wed, 10 Jun 2026 08:42:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVb-000000075yz-1VJS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0b9328c4aso45093595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080919; x=1781685719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=Dd1ILMz8R933gNRVO1xu43Re4Rwhaw7sG0HOCwza03JtVa8wGj2UyTMJLkZqT9ceJo
         +gVFgmvIyCFwT6r2DrXRVDVZU9fF3FFEBNYRnv6ck5otU7zd/LUd499TxqXfxRgJJzb6
         zVXOc6bhMvn4ZXDmzlCYqojVZfYFm7S5pZ0u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080919; x=1781685719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=H+g3d8VOueSh9iiCgEuVFe+ZM1HiHs0nmRfKe74tRE/86GfhZ05CC87K0uxDrIAE38
         F19jqf1gNbvTfdhS1zTkjbfrX0j67b4IxXoIwk76y+RbFmscMxnjaXouENL6xTElWxit
         5sPXF/ELAl3hp5hiZxYKdeDYqiJtvvDLwBQ6TtZpW8yUeuPKs268RI7G93H45iPUYKam
         PCJeAUydPzqumYHavVFf/8+nS5bFSKp0OYiDxbGy6ybAxPBaMf+fO0F4QFBGhdrcFw8/
         yH/r0OiOk8ALRlvnRNgnNKnn0ktRNqeqCdsrQnqUSRGx17g54yvmYPDQ8HxdYN1VUaml
         hlTg==
X-Forwarded-Encrypted: i=1; AFNElJ+pfYAHnRT/Z1GmTM68nmaPSzUw0WJbtFpgOSFrhjkggM1US0Z2S8+AhIU1NZTiwXDkaj3mdcnkaXSZvYc2Vt36@lists.infradead.org
X-Gm-Message-State: AOJu0YzqqCt6friTpeJCGySWf0norK9Z1qb/PrD58xCCqWJmNF3CULgi
	3kgBIhoIdS3ui5G6c0EU2f4SzNqmHtR014WPxq2AQ+c7tHJT9wNZX/F8Imzkm26rww==
X-Gm-Gg: Acq92OFzrRyeBJ9MO41bwl36QK+ILx8YUorXi9c/mqQ+Ey0fGu4INQyL7jxKOZdQUsE
	nytUCRWQNmwVXmGBawmrWVesQsdV89uAo7ZVWysDhG/c54Rgk2/BP4Tupp2b035lzvPX/EbUiss
	4zzRhnADyp8P+sAYWjq/btrs8uVm+baTiuEJ00ueQy1zvjgxNdgrG/IBNA/06bs6XxgaudMy0cR
	TjFT9Ys/0s7xkLoitPFP5meZIN4bNvr0G24nwKxfeo17K0D6eqjaWibtzFjGXAhBAWXqVDkmBSD
	rxZHIWDlSQjv/b7KNyKgPlcwUFQvpfRKqw2LgOaTrH0KznqSzPfQ5A+5kSdqA2cqWMDQdnliXqG
	n1DOctDvTT15ikwvLo+j63sX936tJvc5C2uUG5WYupuiYNkBUy2/SkVMzivBfOZ1ga7sXUoPHb1
	e7rBcWmO0XqmfNCKVX4Jis0xRVdmKKrnKmNdp3zAfIoQQxJYdB5/O4hkFRwBnM9eM6rBoUTt6HT
	kAghBX0imPPvOLZq3f3Q+tO2qSz
X-Received: by 2002:a17:903:3bc5:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c2a1bafec0mr80534305ad.3.1781080918758;
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 09/16] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Wed, 10 Jun 2026 16:40:43 +0800
Message-ID: <20260610084053.2059858-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014159_459776_75E07C1F 
X-CRM114-Status: GOOD (  12.84  )
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

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.54.0.1099.g489fc7bff1-goog


