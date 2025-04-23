Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4271C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTG8DAFdHnp2dP0ywoyFdyZYrfquR0mqHFgjbLDe2VA=; b=pontKfhv+UwJwk6N6WDLCWJh16
	UVX/30wfw0KG82THxUG5QiHOsHN2A/96tzRwTdJyYxN6xfM/GpaCnHYQdGAESd2hoG9j9JZYp9rhw
	xLG/paXfhqJM3zlB2h4sSaI4lfmSa6sxGxfDfOeShqrTfcaAwNMA3q29k975RUORn7iO6wKpbt/eV
	RTkY1tgEocHBT9i0EDcaQRGDCx/iEPSwrJpMmxIQQOUnXM7XtxMMnEQTdHeWl/xnmPVJw8165HuUB
	XvhnmXHzd3VOHTcsT/nL1fBwoA9san1WT9lazs30N9BhPcxg3xOhN1Df8fCZ15nyB3leAEtEEljrv
	8G/6f3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqN-0000000BlIp-31PQ;
	Wed, 23 Apr 2025 19:33:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fcC-0000000BiOY-2R7v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:18:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227a8cdd241so1950685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435916; x=1746040716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTG8DAFdHnp2dP0ywoyFdyZYrfquR0mqHFgjbLDe2VA=;
        b=CPTUMjgov1splv2cEvnm1olgIzrqhaROsT9OLXTmHwdoF6c3VE0fEXsX3cS4ME9CO4
         PDX6BgxE8AFQ4gOMNXlassZaN0lRXINmMWDHRFoMP6jp12LLfVzhHiTdiBt2dzp98NMx
         owaT0jIZnrhxBe385RjCwjkOzmWEFAsIT/b8+y7fgBGJ0mNovYf1hn1xyvEd7khD7Lrt
         GzrUhgQ5PyzHg7DWAkmEMfFSPpaSESE9hduYxWlGa2XE+jt1w3Yx9dDpzuT6bRhpEO4Y
         DfFdOggTmG9zdOTqn2b+Uw0zK7uy5kvg9Zgtrphpnypw0tFmff0VXoXoXLGiUpr9lOdi
         JS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435916; x=1746040716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTG8DAFdHnp2dP0ywoyFdyZYrfquR0mqHFgjbLDe2VA=;
        b=MXF+GN+YgxfCsqWBQErPvvGrCoepKsGTZ9g9T9OXNyFEwu84ewigyzvETuNJae6KNL
         Rn6TAookXBtnoGtDiE1pju5taUttyEva6jNLRj/aq0NrsAlguzq5QOO64JUUMTZsKOpW
         OEa/ltkoYqTzz9iGmF8LgMqEsfCv9z3HmO20KTrrirrcl7LR/ROTmesuooQAL+K52ccE
         VzYRw0i/fDLw/r7iJNSxP/XpMN/BQMDHurQpvBczP+r5L0N6BC+CiqnmTwiwLY45PGer
         srCCQ7b/OHlE8747309MOn6lSJxRJqNTmgpUP0PmQtIw0C6uyoUkPBbCxNMr5pCuv/Qr
         I28A==
X-Forwarded-Encrypted: i=1; AJvYcCW+eZoX+C3iwTUvhFblL6ke6wBNvvyhZfPmQpxXIsrzycQpjz8NgEKDw5MaVAC9p3zjQ3j3u/PgZ9FKLO3HO3Gp@lists.infradead.org
X-Gm-Message-State: AOJu0YwRk/553FZXok3+/boQHAaCicE8pHL8dcsVF1u/urinn3VIaqgU
	ppWR1gwXsVYfLX40vgtPflHhAmSWjhtVyst+Nyciip7r3c2dz3ANe7b/Ic/s2Go=
X-Gm-Gg: ASbGncsyGY23Z6pqYm9Em2eewUrmaEcHmYVcVIgga8Y/jgcHfEVQ1OjeFTHUdsPc1rE
	TxOdgsDcJ2Ue4pxZP508VBvlaivO7rhUfBxHKBc0x45WEjNjvaPjwNl8tcOsuisPo4DMUyH+PeV
	USN2J/DiBkdcs8gDnb5bZmXQ3cra3iQADemuUZ5//mWjpTEe9og5lCqfYh+Cs1vB3tvU8Evg+3V
	uf61VSudmIOVnT+cCrYEKHbo3MuoQfT2/OOo1ZNcGtruessY9bR12Kin/D4QJxT9rSWgDF29Y0Y
	XH1MZrvQzIOJvS7vQLcTFbyRlYhyktbWhCOcKGaZYi+rP7yYGYzC
X-Google-Smtp-Source: AGHT+IGVUpukk6IH6oBCSYckzehJVWDoFyKFCFz+R+5pqwO+XdOKln8KhlOaepxc13szHyqhG89q2g==
X-Received: by 2002:a17:902:f549:b0:223:635d:3e38 with SMTP id d9443c01a7336-22db1a8d6b1mr8150975ad.15.1745435915841;
        Wed, 23 Apr 2025 12:18:35 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:35 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:18:31 +0400
Subject: [PATCH 1/3] dt-bindings: soc: Add VIA/WonderMedia SoC
 identification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-wmt-soc-driver-v1-1-bd8bf32521c2@gmail.com>
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
In-Reply-To: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=1697;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=P4t9q9q6HNFRvbE1rkBp9UJp/QgyD0QTFlp6sfgadw0=;
 b=1+FGgFYBJHV6/0XVa9XKgAQpOA3+7YGbHCSVG44rcyhweBnrNGsV6t1fFSPmZwqEi3gpKQ+l5
 5/ZxGQqAHWbA20ME5pMssU9tVhASX90L+ZOFiK0yIPPt0jBjpLVuRQ9
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_121836_625681_F5105CB3 
X-CRM114-Status: GOOD (  12.31  )
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

VIA/WonderMedia SoC's have a chip ID register inside their system
configuration controller space, which can be used to identify
appropriate hardware quirks at runtime. Add binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/soc/vt8500/via,scc-id.yaml | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/vt8500/via,scc-id.yaml b/Documentation/devicetree/bindings/soc/vt8500/via,scc-id.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eac72bd66fd6331c8d9316288bc1acc3e337efaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/vt8500/via,scc-id.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/vt8500/via,scc-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia SoC system configuration information
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+description:
+  The system configuration controller on VIA/WonderMedia SoC's contains a chip
+  identifier and revision used to differentiate between different hardware
+  versions of on-chip IP blocks having their own peculiarities which may or
+  may not be captured by their respective DT compatible strings
+
+properties:
+  compatible:
+    items:
+      - const: via,scc-id
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-configuration@d8120000 {
+        compatible = "via,scc-id";
+        reg = <0xd8120000 0x4>;
+    };

-- 
2.49.0


