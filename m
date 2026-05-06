Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7777CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=; b=W/lPj0uMXmn1ZO1SQHEFNacWbE
	OAD4aBqjVnLvDIKh2g36ajs1riOXkJgOWBP4mynRfHszfn+sODCM01wBFJLdyBF7x7w9qQ1+KUcTI
	bUjgwteQsxV2GZqf9354XOnKY1U/CguKMSIj4Ytu/6Prjl+l9eoSKxdM23IWSYesdmISgECaib/Hz
	wruCua4KTPQZyxB9kgmujy7tG4U3oyUoMOu5LdoIJ4oW4kJECd42PY6VDbwKQuF6kX9kFpDakVw/o
	mWn9wtGBYBP0VAufiwWt2rFsfL0REHBi/Aprvg+WqvOACCOwSF42OYWvIdifr8MVjpRoLGmNjgMUZ
	o6nw9E+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbtH-00000000q6T-3scA;
	Wed, 06 May 2026 13:02:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbtF-00000000q48-1Cbh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:02:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso2843726e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072531; x=1778677331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=;
        b=SRgoLgJ4edkBsXWApigLQVrm9aCo+qx+9s4Q7jx1qr8jPOdUd6/qGcvWmiObqNXhYw
         5DMNeX/SgJIqtG9tPzNcGExIxF/VelA9qDIuLWGKRn609+UITVQjvEd97OLxmWl2EDar
         nIFfrGqDmhkXGdCwsyDCY4B0VcLoDLaULk7Qoz5dlOQ+C+slr6/ZpizibyCkQ74W0EGI
         Kqjx4D7yc25CKwt65yCqPYKNLtqioq8kcTry5jy37G1aGSKxWFwyarRwJt7Sd/X67cn8
         3z+0OqNsojVETfV0FAyfs8Dh0/K4voXeHVcDOdxnv1/P3jRSg46lTckikB5TyZpGs4Ig
         WAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072531; x=1778677331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=;
        b=dboM/jygJ5h//aOJuro/DG7C1c8AnRXd5yXWWy+HRn9aMZRRRkrj3ZliQz5fFdDilS
         EUkFFmZv5COOZLqs3b1MlxcLG6WI6D30rmxCgFlXm/HsQvEtOuQVxcVLtvynF6K91IWE
         Rp+caomUg0FCr0hbmfccCo30NNIxRp5Ay8/Fi8RVvETzthD8mGQUe8XngRNbbNwS8FzI
         3bSKdmBhe47jjrakNAAUNzvbm6WMOpKhucCkU59U1neWkE+rcIsYM9RyzLom5YVbo5dL
         9LWaAzzDcXHXWRIbPfkdO56sSJfhyH1XcogxP/UifZS3z//E/CrLYJs6to1bMyjsIKe1
         DWww==
X-Forwarded-Encrypted: i=1; AFNElJ+NV19gn1ssTUNmxIrEl6TNICzQo2Xxh1tH7EvXA1Uhi9dd4kg9ZOvpRQzyI1PbkD+GdRY78rxXdjR485IEZFKx@lists.infradead.org
X-Gm-Message-State: AOJu0YxhrKxWAwS7I0RwbaHACS214NdRmJ+BPMSIDI6GoI7XsZJQ6BzB
	WeIElMgeCUOEdhnW6N7ZES13KRnevE1JRpXcDCkKMe7CRz3BfjNFhi2x
X-Gm-Gg: AeBDieu38nt0qQGqFns2NqPAaAjUMBKrxecwDCaFdjbVUDNpic61Zln5XDFW9ZNiY26
	/ol5fMhnEbRsU8JAZvRNbEqQJZsohkZ6NZd6hYMIrHdN6EK7lnM3gWQHvN5p0h1X4g91WbSpAPB
	rpyBCSSlPbJjE7dtolj5mab7WzoCl7S27Xr5GLNo1QgHWvEx+gl7JhH7/KuqmJBsWZHC5P75Mn1
	DKJcQc8TdL4Ktsr+HQDGryzwfolvvHui4+5dvX2lb/bRm1H/tvoDyckCu80XZsInM1cpnTkncWu
	z5lQ6caAMOvl97QpngPj10Qk9DVqCd33o7xh8yIJhOiXkloNpTU4yDTXN49kLO9fwMLucZce4pb
	jUxl1cLjapqxPrGV/e5tt4ElLDF9oY7G2rWU59ROmuHVFDIvllP5RwEKF1BiH0OYz458/a/TgIP
	/zxG1ETUsFHshtt1Jq09+KPUhDcBu2UMlaPTWabDi8tkx2Hu3LGHijmpSEOIXCKjlrsMvvVTPWa
	Bqza/Wvfwb+bwHeedbwhqx4bsvqWExEjTymlVKV9X8X1s0/NniOJeUt5WD4HFYf8xGNIa2/22XN
	+wljrcy5Xkc=
X-Received: by 2002:a05:6512:6c7:b0:5a8:9135:127e with SMTP id 2adb3069b0e04-5a891351b19mr136583e87.18.1778072530001;
        Wed, 06 May 2026 06:02:10 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:09 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 06 May 2026 15:01:55 +0200
Subject: [PATCH 1/3] dt-bindings: arm: fsl: add Aquila iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
In-Reply-To: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_060213_346815_61896D7E 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0


