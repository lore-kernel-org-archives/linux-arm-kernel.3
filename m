Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330A0C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb0xWtZMy3wb+Efco3IddiNHPbPPr5N2NAxGlPTtloA=; b=PB8nUQLF5yIVdLwGZY6ONDQoGu
	3mCVcUQzoo5AheuZSoeSwPrOsrg3awRbYNCc4XPiHBrlTTI/qtH3IB2FmDAbmGqybSIT60GVA5CfC
	yaDwF1mIF7eWV5lIrNXwu1nw6qkodI4mu4A34Ffg+GgzMVepYnXzdTNt2qq+DEMPsNJaE3WtS7pa2
	ttX/efuEV8V9NwrRn8eVcjhS7ndbdwaxfuccLqYxR09WGEpqm5vkAZ408mYMS6bLz9JDnYx92JzS/
	xzTVXBtyqYXhSmPN7to9wmRY/UntB4RJRshdsvFVjV+amEP+dtaKqadmbqcCmRgrbqN0fWbcp2OXR
	V/JBOZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFCH-0000000GOeQ-2QfS;
	Fri, 24 Jul 2026 12:40:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFC7-0000000GOax-2MQH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:40:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2969815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784896801; x=1785501601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb0xWtZMy3wb+Efco3IddiNHPbPPr5N2NAxGlPTtloA=;
        b=mawvzpuyPpDeprzFrY9YSl74wlhebDVP0yP4KWqTGRUVn3gfI8UCzAYklQbpOiN53h
         +H5N+35R3nokzK0ODnl5ZjdkFyLvIZ7rTERZUMaiAn1hV4Nlk+GTq3NocjlS2TE1JmKn
         N6YZUZLILYVu5CbX5pI0v0syJfexljk3FXZC1D5IeTVVqIxbNIXhPncY66U+8Pj6P5Ee
         YDOgSHVrcOXkp0U1KloTPlwxeN24CrdIqYGLrTM2xqq6WpNiOI4EYy0i5wKCsfk7g3dp
         bKLtgf2flMlqwimLKZZ0EjwxwElhE2+VtYdCKsF4O388n+v1Mdz1C+aUEjmfTffz0C3E
         ib9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896801; x=1785501601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pb0xWtZMy3wb+Efco3IddiNHPbPPr5N2NAxGlPTtloA=;
        b=YSMnqCa6r17Rt3HtDPkjCHOxTiAKBYn/CQx6Cb+C1woDKZkMZm/5gsUfxXUIeY1MwC
         FKqOBvSZkmnV4ShhlMhlY5grILGbY3aLn3ApTqvJrfs8I4eTo3Eslj1OPck6rpfk/xOf
         KwK4Ar004BbVT1bYmJmccPqsSvGvRetvE1beqa9FFaS2iEX1ovnzwOvh3StWq/HGbw0i
         cX5jYy9asZgMKe6fkRSVd1hTLRRVsbVY3hiyV/yfiEZ3+2vDI1nOh+rf7+0a5F9gl/26
         2UFOCE6gV8WYf6jjGT19nLannnVI3FjVkYrNuD2zLcHMucl7vLzbB7VFij9HRB8CLhfF
         kETw==
X-Forwarded-Encrypted: i=1; AHgh+RquRiQZ4bmoH+ZEq0iIbMemWK5iYHkNKwEaDATzlqjobGFKZJtq+V0n3E2kSqQA1746H4dVSqGbqQvOnX4vPcPL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzke77TctHuafh64iiql8ymEotTVKQTmkLJJVsZKrntd8jQAfbW
	ap+BAhGPfv1vxqnMCnFIBJaS7/1+vaH0jFdygOrinAK0YcPDW7uwUayGtyaQ3tKQJ5s=
X-Gm-Gg: AR+sD13afXmBXSMkJr4lbFeKjSXCCWUiY+pZvfJzyTfIsZZl3Tc18qa7+rNKv8kB/bC
	J8OuCAkma50RnyyNib4zKWDpD/VwuG99g80wwUagFf14K2G74dzhmwVPs6oAXpSyFk4wG+69xu9
	z8Kvt2tBXwV2aH3/igcLp5kCgkWfEmqggauJV3YxPUeKm/B0ufQ59r8/Uq5IcoRCFVtgusSygeZ
	WgrNTUjtLm6uQMUc0foIkbdVcPlQZugv3g5oGnAnQqdBPNAGaHKy5SX02ekhTw/+QaqThy41DAi
	X5TYoS+89CWOypg9Vh4dVffK1tAsWpF1gk7u4rCFnXNnTH57fkjSWNI08haSs5q+8taJKH6XZXb
	Up/bkvgcgf9NI1oFcnVmjjcHaoAz1/9g0hGREAr5tcaBHTlX0TPTIDgNLpa6dNppQ+bFKYs30py
	EKBLBenBPmLaD4EGS7+LugONVAN0m7icy0bR4=
X-Received: by 2002:a05:600c:c059:20b0:495:63e6:5fb8 with SMTP id 5b1f17b1804b1-49573c9bbdcmr62628475e9.12.1784896801561;
        Fri, 24 Jul 2026 05:40:01 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:a07c:a901:acc1:9287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6b10esm71556795e9.5.2026.07.24.05.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:40:01 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Jul 2026 13:39:42 +0100
Subject: [PATCH 1/2] dt-bindings: iommu: add arm,instdata-override property
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-arm-smmu-v3-instcfg-override-v1-1-e7acf4a8a525@linaro.org>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
In-Reply-To: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=grNzaIZhTarizm1uEFeEaqFDbVnPHTcu7XioeAt/FBg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqY10eAg0RYUiLSa+cCoQ/bi2kFDEdZd0AvKhcp
 BNevQec4jCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamNdHgAKCRDO6LjWAjRy
 ujuwD/4vdtU14qtM7zY1gR4pBiw1bskRRH+U/hdF6Efn1OO0Dw9syoJjGIukFMdeUZ7ZazcigE0
 Ehf2cje464+yA/9S/eHT+2+6J992g8bI3b8A7sFNJE4nSStrgA154nK+Ns8okuYn0Uykyllx8sT
 oFOyohXlpjSkV0YXzwZIoBpXULUeiSXNdPJCb+NvM6dE0VfqD+6LCu6+qjz5q9pLnN9PFPYL+qa
 ml7zGOyKfLE/Vbw/HrWZ9n2p333/reyCw/zvIce1ZPKjqCaN8udMSLBqBRYr1GIZ2GkI2XRoDCN
 4IXAwaoUcXTqyV08728bh9c9G/kkTs56cNRWIRwaYWxFGPAxqZruRFs7GD6HnjpXr0WYGeb71lA
 u9DMtcE3AF3K3wWQ7TlymI2zAZCtwna7WdqbvGnUvgfuOt+R3Q10rZ+kcHqE0KLKL/egHYO+Ymw
 pZiQrylLK51/pxVqZK1fc5DL2LGs1XLkp1rOIYak/c7Hs/oiRgmvRXDsGjhN1y0AHmuQZKpoiXZ
 DEZmtJa00EsMsFit8+YC9WQ9JxtTj3dCY+c1t8dGdkDzc8hTymLXl2avvWuEf92eMr/Qenub7K7
 vYypUP1/G5BP2nku6FoVTv7lOz3Vu1lOZK4PNEkZi5BBbmTULXr+HLWFZ6QpFFdoYmTwn5WwR3C
 voMklnr0DyOl/Ug==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_054003_625332_AA53BF07 
X-CRM114-Status: GOOD (  10.61  )
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

Add a new arm,instdata-override DT property used to enable the incoming
attributes override feature to Data.

This is used, when the smmu can't guarantee that these attributes are
provided correctly from the client device. One such example is Google
Laguna SoC due to silicon errata on some IP instances.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 82957334bea2..23ea5e8880d4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -83,6 +83,15 @@ properties:
       register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
       doesn't support SMMU page1 register space.
 
+  arm,instdata-override:
+    type: boolean
+    description:
+      Override the instruction/data attribute of incoming traffic to Data
+      by setting the INSTCFG override in all Stream Table Entries. Used
+      when the smmu can't guarantee that these attributes are provided
+      correctly from the client device. Google Laguna SoC is one such
+      example for some smmu instances.
+
 allOf:
   - if:
       not:

-- 
2.55.0.229.g6434b31f56-goog


