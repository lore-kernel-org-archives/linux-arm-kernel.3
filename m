Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE35CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTay8Cx8bgDFDPX/AfO2y0JXUWGAYkk7ejr9qpnZoNE=; b=34LO5UqLzQmxKDfiuEkQ5/UA7F
	kxD2L0OT9+8dkymbRLiYNze5bz0rNH9fD1FlCcC3/MIiJGyx4p603FGSs64LO36hY9uUfGkEUln9s
	31Rjz/gB7oZgRWLOoM2AImDA0qqWzh3f7IJi7Jz+sBfFpJg8w42R7YYhxV7gY0q6lQWzIk/80Rer1
	F+WkYMP8qfCe7jKhOtOG96goVOJl6MpP7pYKVFnrvG+E63JMV7e/MpuUgZMgqFaiZ9F5wEvZvdDYK
	78ucmmRCUev85FYNhN2mCAlDCCMY4j2+AOlZCn5LfMu0EwSeZTTGEoJ5hfP6fCDRXg0GGV0iXa/h8
	KBmQ0z3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZELo-00000006QzY-1Q57;
	Tue, 08 Jul 2025 19:51:36 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZDNf-00000006Hcz-4Apn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 18:49:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae3b37207easo876388966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752000566; x=1752605366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTay8Cx8bgDFDPX/AfO2y0JXUWGAYkk7ejr9qpnZoNE=;
        b=fgx8/T2Yi7mcLnq+EM4SIrjbL3AmCexENqQ2pbTOxIrwMNfktvTVUiABLKdDSrCwyq
         3dK/AnEIHZr1oqtczWmrJoSHztw10NbXLuQ1Nc2/hy+Qqe9/wpbl8L3d7oxhx/DlUxwa
         mRqlQzVxBqlB41BgF7WuDF9WZa1RJVzyExyTPasfP3uIe8dtaVY/l1fJeBNjdhEX72Zy
         EdsEY8JCqHpcFeuu2ibOVqMEL2TKWPDiu3YBFbpOi7qKNHgzCY/UYJA1m3s0a8wLbp+5
         vwGSOnC1/mLAatagUZdxHEwq9NKYh5K+5Vk3Rj3D3C7tNBEea4hy6mhfLSnGsNEQ4+Tb
         4IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752000566; x=1752605366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTay8Cx8bgDFDPX/AfO2y0JXUWGAYkk7ejr9qpnZoNE=;
        b=CHH670DvQkqHYADE4Yp+sxhnz4HlcE4teCS/LfXC/WbMVcpPGLcglpK5AGAEsMLw8W
         BkPIQXQJlga+ULAb7OmMsBabmZBoKcFAZjukQIIVuaM/lPYaK4WKXJ7WFNthgQWwR5/R
         36PJ7jTW7NnFYlnIGRAMUh575tzCT9PBZfbmsF4f2Fio05tprIEuOrHjuCC9b7666jZo
         5kTJVYZbFi9DB7XCM+wfSB2yR8bLRe5GfQFMAhMVV3Mu2z9sFvV9sBsAy0avaO2Dl6Au
         4YxsyBVXlq9XXopJ6ONkGW540Z9YyDu+t7CODoAW/li8cdIXWjB1Zg/4Dx6YMfFQ0+Mc
         ORoA==
X-Forwarded-Encrypted: i=1; AJvYcCX4jqOg47Yhz3mpQfsIX2Uw/xMbxsnwrLJ7JasjmYwLA5oN6rPJRebUo1PHLVTLBfUVJD+l7Sd5g1QY+qEZOwGg@lists.infradead.org
X-Gm-Message-State: AOJu0YzHSXxlYzgCFywD8/nX99DVC3ciwqKAgMOLZWqiD3MdDETXt/YY
	nttvBoSyiOjA4Ja5xf944Lqr30dXL/huAYBWCIyFvYY0bZ6vh8WUucUR
X-Gm-Gg: ASbGncsh7CV5rl1YGEPU3fyYYz75DCe0HZGL2eEDGeXXrHtwQQ0QZUR421A4LfZJSek
	a90nigbv/W+P0FQAznYtROs7+8VcuXovruBQlgxRamASEG3ZWc1r6o55e+5OooumH/nZLLW3nvN
	tjq2DZZIGgCDZInM8EpfvQ48Hxd72PEPT/misJ+YkpPVtWhoY3gZUGE4vZkbsi6kVnOEcnBeEet
	RIp/2S6yKPrd2jfpmOltEop2HmtPzqnROX3tdxXCPYdDw/j6DKOpGSFOlNp7YVwmfDm2qmUv9tA
	JA0SB1gb2wj+mn3vHO/cYyg68ap8Qc6OIqnu22lvSH5njOkJvk0amFTgvb8MvcfdCm1zDu7uEZN
	O61kc9sfAw6iytfU4Nb2CnOOqprmqLiS8ihpOdafuqk20MEWv2Jy8KybxoA==
X-Google-Smtp-Source: AGHT+IGR897LvyX0eXo054VAQAVN3F6y1F0M1xsx9KzFC3PpF3v4lLPoZ4fbNwwovMtyDM/+TqQbKw==
X-Received: by 2002:a17:907:1b16:b0:ae1:c79f:2b2e with SMTP id a640c23a62f3a-ae6c6cd8f73mr39681266b.40.1752000566094;
        Tue, 08 Jul 2025 11:49:26 -0700 (PDT)
Received: from Lord-Beerus.tastitalia.local (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6baaaedsm944884666b.173.2025.07.08.11.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:49:25 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Tue,  8 Jul 2025 20:48:33 +0200
Message-ID: <20250708184841.72933-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
References: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_114928_029853_85ED6F6C 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..07d2c2ab5150 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -100,6 +100,11 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,am62p-var-som
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.43.0


