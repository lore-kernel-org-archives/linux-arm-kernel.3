Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F09CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NmR/EC3Cn8L6cUNQYNHnPUar2XNgRmm87IeGx/J4wBo=; b=XfxycolSiGgUyqcR8s32Vyd0Ge
	boAp5nZ+WZARKgNcIV14RjjXPIdOjgC0ULQ3CyfQAspF1RQazl7rtOSObbPncdqdMdAIvtFHsg9f+
	XzwJi9krG74JATl2/hyoZwoZdhVqP8yuGp69iSAR+TI+75OPWwTTZJx6BYUGIOKZlorJ2vzFMonRi
	lgCTBlos+/bII5RE7a1NfpZTYyag5/N56jeyzyx4yXQTqRsiEmvtDhKcOKJihiMk2XkRUulTCqqW/
	e1SNIEdyf66S5Je5TdWLLnaqTnZeGtAlRFHNNsEL1NDyZH9Fk0cXxraSb+5c2sWTBc4ptcsbDa5ih
	lLUPSARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjw-00000003wC9-1NIF;
	Sat, 23 Aug 2025 06:28:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQU6-00000002Pq4-36nC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:03:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24458242b33so21186655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755864185; x=1756468985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmR/EC3Cn8L6cUNQYNHnPUar2XNgRmm87IeGx/J4wBo=;
        b=AOUYASzs5O3B2BbEHkMSXWySuY7SKYowsepWe2TuMo8bgWcGRPs8YwL9e1xEAYmgK2
         fSsp562dQnTJbh3g0WCcdkRUMMOi/EMm+m+FfS/ASy7VZBbMw+8YVHPRcbKLdaK+4+JU
         fbObt89kgGWgfdtrW6ggFBUmg049WnSESNfRF2OJ2+mNTs7G4SfLIu69Kn86sKRCBQHx
         JhbW7C2oi2zYGtHs9ngMAi+WwPOfaJzLAQCFpMv+W2O2dvm7SpSACGqecf6dAeAGQiy7
         Y6Ah/qf2jZcTUPizJan+B4fbZodS9jSfSIERxHFcu9vN0vHpRAhmfp9TAVCgdIhc90Qu
         G3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864185; x=1756468985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmR/EC3Cn8L6cUNQYNHnPUar2XNgRmm87IeGx/J4wBo=;
        b=b5dowKOFs9TSMuoc8iyqeZpBZA1Se7V9CTAs9wL856nxspqszzVEyaenhNruDpKu7e
         ojjI+vSwgd3z7kBi7MMzhX+eLPQsszzcWOVdNVC5txF78RdwfDy7ttkIvJNXebpT8LTn
         QRP3D6sHqbCWgwxQhpvHUwrL+8NUOVtxTl1TjyMyUV2ipqpWEDTl0W+n6oHM16NuZfFR
         Vj1oYXrQg6v3nxdN8x2e65AF0bXAzF3MrJm5t6LeN+eC0jWgcH7ZaJexZr3rZOmCx0UD
         cgdJSB9L9tEQYVADAtDx5Hg22ZxYYP4qGzcsTzBFXSTmiliR6fZY53qPfT5hJTNuotCC
         rbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf6PKslwxaeGcep/044fGGhx/MGHdKPWP5xqvXO/y42vvw9AJMEojD0SrIXtl598PP+XypKsc+s9DjP9hhCkGI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsq1nc6y6kWqssr2ZZjeyvsGlPV2qFdRROVW7YO6SLaaaCLb1q
	/29fXdmZINoI0WYUMbJvranJKFtRXnuiVC8cSrU1AjQN/ZpHVXsRFlfcZzS8gQ==
X-Gm-Gg: ASbGncuH09hP2QAyTgsmpQA2ZAPE053aBV04vNh894ENI+Bg6b9i/KTRoKZ7QSyQbbt
	l9yJMGOgS9+NlN00nyhm9rSi5FIUTkBMpK6kEd/vPkBDb9JZ46QbvWD8Zk/VNLF+g/QXC2DqwGv
	92J0pKREMydY5pzaF1L04ym7S6Uak/j4HxMt1vroSc8Ij9l8dBbl+WdL8jc8ZLkLs0cn5nesvTz
	CiWvHrfNywcXgFXbXYKtFdmP9M+N54rBUt8CRkMXPQDnRe2NHA9KDe4w49K5BvaigekZ/AXqUv8
	nVY43uJDOadJnAdP5nsTz4gVNH8g50APmnBKB22KCJp/fd3lElCh2Ccj8Am4vDA2iN0sWcq4uYp
	EW3/TdXixFRXuFG1Ga5fXUx510E/nIJRkAX6o
X-Google-Smtp-Source: AGHT+IH47oNxHNWHiA/QQLdgkhelXlu1aLYuXEzULXVeFtTkiDXrRFNb7+py3C3th4KEJf8Mhluf9Q==
X-Received: by 2002:a17:902:d54a:b0:240:50ef:2ed8 with SMTP id d9443c01a7336-2462ee38fbamr40886895ad.21.1755864185349;
        Fri, 22 Aug 2025 05:03:05 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5ae1:41a6:4f22:1c64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2463604af22sm20501085ad.37.2025.08.22.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:03:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53
Date: Fri, 22 Aug 2025 09:02:41 -0300
Message-Id: <20250822120241.26419-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_050306_826732_AA623E1A 
X-CRM114-Status: UNSURE (   9.47  )
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

imx53.dtsi has the following compatible entry:

compatible = "fsl,imx53-iomuxc-gpr", "syscon";

Document the "fsl,imx53-iomuxc-gpr" entry to fix the following
dt-schema warning:

failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 8451cb4dd87c..b77ce8c6a935 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -38,6 +38,7 @@ properties:
           - const: simple-mfd
       - items:
           - enum:
+              - fsl,imx53-iomuxc-gpr
               - fsl,imx8mm-iomuxc-gpr
               - fsl,imx8mn-iomuxc-gpr
               - fsl,imx8mp-iomuxc-gpr
-- 
2.34.1


