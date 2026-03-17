Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41064FEDA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=; b=hv3ZaCqV3bHhnNjlgPBp562nHd
	k6shReScZ9PxJHNQ7vsa2lwsQj6bG0g2veByeX0N7T7clyq2g9AsQbNrgO1CaTJL2MgYJdE3N8u2Q
	sHIwpcbynn6hPmBuHmiWhgQBaiNXFQaNdfC2+9Bg2YIqxNbdUGeWCJOhljsL9+zUmOa9j8tXFFh/B
	0sxFM2DyZI7u2DWmmGRbdQpA4sv1tMXDcjVB8Si7PgAhpWhYRjcWu/fe5QT8uqB5l8vdHBSEjwzS4
	tskrS7B6jMIfH/j4RUsfXRj4IpFghJbjt5aISib0hZesMdwBFnXuKJAZPu7TyMvtMdkGn3r656AXw
	0l5BLk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQE-000000074IF-2kzV;
	Tue, 17 Mar 2026 18:45:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQC-000000074HH-1ksI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:45:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so14360265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773138; x=1774377938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=;
        b=jx8AoyGGsIBx+lO/CIEFSulHa7GvVKeSQr9FaWhbsh+nARV6/xHpJBBVsQYozk+Teb
         1Jekg9PXPzVYgNZkEGvwPCsiTxKe1fPUvbDsc62XzR+VHkM46f9LNdEX6JjMruP6gRnl
         VstRZTC6RGXWiWaVex7uCnKNV7uF39ZLMBmz8QMhKbuR1Bg+dsC/FciHOIbuq899yp2w
         NwCXpznp6onOludHzOUKLhhQQCbcmyN/Rxbdmv/rFLhmbux0QhN6XkCGoDYoiUhhXOhd
         Hsv4yCKbDNcbbZom2Fe3NQAxv0QCwFmqkYxOAPbwffL1yRAPWG4nQC9CNOFuoqXmRh77
         d+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773138; x=1774377938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=;
        b=PtPBK0d9KAFAIe6ZGClPRY3c4nCFjCQjzBbi8fcKHVdBgGzOPnQMT+PSu/Kn06HJb/
         kE/0BLonlGdMUMSDayUd7ZUsjakoevOtG1C7IrqBxA031ME+G5DGjOdbys52/oQmisDG
         07FqWHJb31sl6swmfwJDfsFA48nu2o2yEtCoQx2+/0rbEma2dqqwHfWRk8i+9jHdRFM3
         XMSBgDr64stdb7aR/dSgtWWIVgv657u1Ujr15cAgNbAuyKGf9bDh9fW16aCGykZ1JdGF
         AhhQvxHuKkuraxCDJ1a8yFWByn/NNJ6Hgy9metCteoD064MUk8ggsYsWyN1tUyaQn8im
         QLFg==
X-Forwarded-Encrypted: i=1; AJvYcCUNaExa6CG3Ajo+6111Bb6lYxoGPVJ4Mosw1FWetraO+8MmPMKwhJQvGwKvFWHP4qlhpeUFL+U8hDWcMds+Ho6d@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbpvbd0siwGiKRBBggJeAGgnNQqlOfgn7SukSwwHpV+wrlYpLV
	Cr9K311gn0gtRvxwF8NschR7QivWJC5KzSOZj9b1MCUHYMNjpSkDPTlL
X-Gm-Gg: ATEYQzzZ68BOWurbXqW1OkwepRvxTSmgModF70TuZ3sBE4rQFVuuDJqq6vV1w1ZRMyY
	bYwXXqkmgup3aWnAjiUzVXiXYkc8J9gC74fNXJlNZXHqcYY/JJNtWefmMHC3QkyFkWz6tow9KBg
	PeT0ZUZK5SyWaGLfVyQgWI5FiiBuFKKE75mmGsRXNRh9oi5rq3T5cHuDxQnmHSisZBSYox3xHlb
	JzZfULdqhbECyCCY/Ga+Ezo9wkoeTc6wX22AER5U0gIq74ad9MNfywGILBIM8L/0AnSlSkFi2WU
	GTTivdaU048rmLD2FLadvuTG7dgKDfAW+lHLvEuf3hmhcLAxj4NC6JlMwevvPcSEDrOAOkECyMH
	Aj1nXxPzDpRqs/ea99cuUGm9dHS2Kb/Y+X/msxvgt90M+zrUpEg5EdkYaiBqariCSRNuCOtLYuV
	pDmch1z+E48c+maILSSqM=
X-Received: by 2002:a05:600c:1d0c:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-486f442df4bmr10381735e9.7.1773773138294;
        Tue, 17 Mar 2026 11:45:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Tue, 17 Mar 2026 18:43:04 +0000
Message-ID: <20260317184507.523060-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114540_475469_A06A1FE4 
X-CRM114-Status: GOOD (  10.03  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..22b09e148d7c 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -92,6 +100,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


