Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=; b=4+j0t5jt+NBmDdTYhrERRUYb6m
	o673fxz0clo7MD0vSzHvZ9OpybBkDXK5asfjBnwn3sVTvCbeecfG/5nRQZfRHA8ltc0LW4AUgPOp3
	KNRAijMCSinSdg3BCh0RVewGOOebREJ9RGGMHw6hHVBHpnWA1IKgsoN3GmQqaRykzpfP2vgcbtEla
	lr7E1V+DGTAsjWh5hIy+2u6HQ3VTkvPjvEAy9s6kiTSydwFtsAK6TkwZjfg224XPd6jbTA0rDoery
	QuMTNbh45gXT/yLJGyUwi8M6KDCEw9/zQ2rZCRVJRNFJdsC+3MIiDNUK6hGyBRQm42iyHEvPAzYfm
	51GlPKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LLs-0000000071w-0KSf;
	Fri, 25 Apr 2025 15:52:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JB1-0000000HINW-1SEC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:33:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2255003f4c6so24675835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587991; x=1746192791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=lAOObEk4k6/P4v6gALe3J6OrUeMNThZfBTinq0nkfU1SBAgU2qiid60Ftd04hPCgNC
         h4pjHDD4AMBBAk4M+NY1+SwOi0ENPT9WpoL5ZOk7ARdI0uDAq3uBnqL6jkFN4O4ZwpaO
         nWw9iIHvEL15tcCXm81wxDSReNelM5Q/6Go2l3GNsyMYoEdUU2r2zkAqOyq3GxZ+8uHX
         IRtH6Pmr5BWMpC/JSF2fHOZBtwCM/HE9qp3j/sZmMq45/hx3KHw+XvjO42UwxNFFfzY3
         7G1rTXaP/E0krb/Kj+k6e/C6Ddl1xK+2Ef0fF94y1NRVTgMw50s9cIllwCU0+H0V+Quj
         BKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587991; x=1746192791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=TtXlLEhyPK1hRH6sFYk21q2xLqA50WyHYgjrwYF8CtSPQZ1e51UDnsrvK2EW+oOf9t
         ATJzJpiAQCnNdw4r//cmbq8krkRRPoOLmVcLjl7C/2TLKobjwzC1XkMqgkaC4zP/6/WG
         xa+jYiEKzu+IWMO0INu6c5N56r1VUHTtUinE+yWgRdqBxGYOdcLb+XtL7lo28oiyNn4s
         l23pvLSPKzp5vR8c7LTztYkTer4E6LfeAmpiErlNyg1EpRCrPD3eiO0tGQulfZGVKL5N
         aQDcCMxKE0whSnwqWcmjHSfbpxMxmDhuo5ZfpicIjmVFcD5Zp6RNuikZgtw8eVEoJSsE
         V6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlVxMVms7v3/GYfN1TDE586JNJPMTIsTyubykkhSFK+a45ikOdIgpYG/oC2s744sxG2wOekb1zFjc/zyGU9Kyt@lists.infradead.org
X-Gm-Message-State: AOJu0YzJHwSGG3KDXUXw4AGbKbHpmOUYlew1DnR9SM9d2+uKfPpcKVD6
	+Nb1RYr1mcnRBR0lWefjUDOtBPBlQQU1fs6jG59rgx9dhCdtEIM9
X-Gm-Gg: ASbGnctdrloBoXoCkPPldncZ6B5wHs8Glk+yvqDnhCITNI1c+uy7R40d9gAf0XLokAJ
	vHG4YnrN/MaWhUxPQ76/Ek+gg2tfwA9E3518/eEw7M9YD2GnGhf/r1ziyPoLNbmnytrEXSMY+3s
	OKUUTtKpS74qzVE6Uwx56G8qkvQeBDwmN3BB9KlC52vBrgdJ1HZ6lwRuzCFC3Sl18SMfpPLCFyV
	U+WPzqEAVeX0AJjeM1lpfItI8/BCkEtPPODrUCPGMocw6TkJ21d93ALudadPl8OBOKBMz/pVT9p
	ZAOSahePnCJ1KetTLKiojn9po9lIfLcYG5R/urw+8euddKUg/ofQ
X-Google-Smtp-Source: AGHT+IG4gdZGqoCFY00Bz2qafpDH6e8Ix477pgjTWfraJWV+LLOKEsFlXxB9rbKhcUQiL3rNHJ+myg==
X-Received: by 2002:a17:903:4410:b0:227:e980:9190 with SMTP id d9443c01a7336-22dbf742dcdmr41822465ad.44.1745587990612;
        Fri, 25 Apr 2025 06:33:10 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e766bsm31834165ad.149.2025.04.25.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:10 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 17:32:56 +0400
Subject: [PATCH v3 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v3-1-846b0855420e@gmail.com>
References: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745587999; l=1622;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=7MoBmJQeZLl1d5tdgIVwQgJNL7HZP8gebnQnY4ucRwo=;
 b=PCaiVieYKaF9KNg1bFpg51Oenx56aifgRnz4KdSOazltlzSwfLotz3hjw+68lvbSFv2WxfshI
 tA7p/S2WUaqALUrP0dY5PBdthUCyrkcMSAqLN8ST3RzFJ5+h2Fc5KOF
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_063311_389983_A6495773 
X-CRM114-Status: GOOD (  10.55  )
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

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..f2164144a7af29ca77761bc58fe7f4558e7d101c 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,19 +7,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
-description: test
+  - Alexey Charkov <alchark@gmail.com>
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - via,vt8500
-          - wm,wm8505
-          - wm,wm8650
-          - wm,wm8750
-          - wm,wm8850
+    oneOf:
+      - items:
+          - enum:
+              - via,vt8500
+              - wm,wm8505
+              - wm,wm8650
+              - wm,wm8750
+              - wm,wm8850
+
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
 
 additionalProperties: true

-- 
2.49.0


