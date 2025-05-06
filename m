Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F705C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=; b=kiuCc6FrZqs6Aj9e1xRdLi1U1y
	LyNthBAMiZxRlrbRcKbuxgMkJCwB2szAFSrRm6VaSb0Th6UYjc0DyW5mY4t4bIVom/AguZN8sD+vD
	ztCLB0cy7D/9YgoLCPRjcBWxXiV2QK+Ko8MT8xZpXhsk9S45LuwDjNwjSk9SKHbENC01NYyrXu4kh
	9A5/ESGX4l8BP47H7GhoRK7XEcKS6occmqPl1qgzo1S7cexUr9lYJxFyTfHEGmWpYvpVIVWSw+6zS
	Ysr4cMzLkEYVGAy5x1ceOgUksRSHNj0h8d1B6ha8F8e7mYd3zKtLQaXSdNXnbsARHtdye8O841FPE
	Bhm1fgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHei-0000000BxOU-1cjq;
	Tue, 06 May 2025 12:44:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFaj-0000000BZug-0lnc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:32:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf848528aso40662565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527520; x=1747132320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=;
        b=YOMWgQ7SJZsFnszSGH+T9vC3Uyelix+IL/FBPQIvJdA3eboFC/85Cy3gkhLd8f+OqS
         HoUzGJh1qWoLW+cfYj4N2nHOyQw+8sQkCEA6zGdK8/qDGk/PoSigLbzygyYTVqOGo59i
         mfvGLVNgTRzDLfAMlYmTYDQwVv3mglwfl0aXf0WJvZiSAmxn9felYXhrjPyKZn2WIgDp
         pW/t3iZdoM1sqD+SqidP883VrWZ4tmHXM0Kvi3+mgaJibBhuK7xuXerROXWu3xZd09zk
         BwYhn/DuJftQfTilSMmAhie1i6WSKaEuk8EPbLzhA8QglC0NSAtzPQJEe+s5yCDpdwGk
         tB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527520; x=1747132320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=;
        b=DJulyQVe/7MdgTuRjteR+16s2gUSki8xrhUhp1JCun0vyg4NAt4SrLmfIFGbujn0fV
         QOtfA6U+43hLIsIvBevqHGIEx9MFamqxF66Yulw3iUokUqvno7yk3i+o//hhF0NEw/4K
         c0qjwUsDYF6NKQrRBu7TsLtE1GTsqjfR2gTkKcqt6tUc7Vnq+xQdArx+H/JLSbXZxsx/
         EdhQwp2sAyPzeVpJtp3trr77op3Xe2YYANG1J236CIGkVTTYRzVqOZE8UM4hqcMI441n
         89Xv3qCDTQyNyJXRwXTRWhCyn7w6vM0poLUCAxW3xfgzximvIO9G9tmA35zFlsp7OPiF
         NgPg==
X-Forwarded-Encrypted: i=1; AJvYcCVlKGod0i5O/D+HkYddBv+Jratu9GCOdgIh9hi/xIxQWh7lZsDyxzAV89QGpL5xcH3yyeF12T4wnA7KLHU9U9dF@lists.infradead.org
X-Gm-Message-State: AOJu0YzpFu8HwgQeIJnGE8+EJb+0eULZnVgK/1qTv8WSHioznD8jYt1a
	d59969RzyXWox0uFILx0+Izq6EvOXR3GzXt1lusbTG0d3erYByv/
X-Gm-Gg: ASbGncs+846WUtnE6Tbel77/Uap4hsRaF5KlQuUgp+TlYEWomR5GvmTPo8cIU/Sk47n
	dWs/xu5v9l7LdM8GbvFmZ0sF1Z8xe2sBoHoVhmHRq52bxvbjyZB55hP9dXwebi4V34tn7YyplRb
	U2axg7HE+qDD1Ij2BxBJMVgNmi4ntlMWEfUPcoziML4TVHoByP2yzdHBNOeFVIoTEHXy1SZtATP
	9U7hJ2O89LL+XFKemhTueSOkW91l1askMS0o7TL4w3hRkml4xyrOY00FashpI/JUXI9QAB+GIZC
	ZnHIpVTJpaXdBr3RuUqI38x7kY/rP7/snlH9703qAsSQbyU2abgD2CVrKwhleQZ9uQ==
X-Google-Smtp-Source: AGHT+IEYF4ebhPDncCPOeVL/QRsWIn7j6RZs5f79o8NL0NOsY/ZAcvSRparMypRROyPTgVAEE7v9qg==
X-Received: by 2002:a05:600c:3ba2:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-441d0fbd5b8mr21811635e9.7.1746527519383;
        Tue, 06 May 2025 03:31:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:31:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Tue,  6 May 2025 11:31:51 +0100
Message-ID: <20250506103152.109525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033201_221231_1857552F 
X-CRM114-Status: GOOD (  12.89  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also update the bindings to require the "resets" property for RZ/V2N
by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
the "resets" property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Added Acked-by tag from Conor.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
-- 
2.49.0


