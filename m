Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19503C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=; b=Ug3IOGJswCIfKVFrA34qxlimLJ
	OZc0UuMXtfCOgRjhy19V+evy7twNH3hU4YByjhLgqOyNEGKzbQP/G2X487GGV3ztnwnWFYOlSzqjd
	6L5cCh0VnWqrViYalY1OlcupkoSU352UrAlKGHAOD59wJm3IyouYvJfkbsStMmVZGA/b+L57gwBa6
	qRk2kf4qiKDBgrpgXZGMyjmhaLbbnljKhNil1QGY7u9RnFqVUJmk2QKvD2NK4lDvR0c2LS624nypO
	KVEZYcnhOWJ5Q/72It4gpNdQMacg0GQlJUbg+EKbGlggtVnn5KU5/sDjV02++daINuU5qnSNwBRSb
	Tcfkzjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4S-00000000o3V-2KRU;
	Thu, 13 Aug 2026 14:06:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4M-00000000nzx-3VyR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:06:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fe377a217so1355448f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629965; x=1787234765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=NfVB/qn2bjpvsRfgnQ9LDFbcYi42dGQ4UBMF1YYvQ6obwyF/nHarWHcakhctk8b5g0
         qi2iVAlyl36bPRvJVlZe/ZfU48ep/fRysLy7iglKU+4jg083TUoVn+t/lScM6w+Dj46m
         iJyrR/7FN3fSkkrLjSMEG1i0XnUDHjJuaIRHqDGth9/usXGbYR1zu/MKookUcTAJT7oZ
         9Sht1Sq+nVryKCZKos2WwSn7mOFWxH47D6j0+6Ecde1CMQFR6oaB9avPBkeLtxOyupeY
         j0+7vTYcflTYD0yPFe0PBFtdTk6TGvbBlrkWa/7k+e3g7RIY8SVN8s3UpgroWS/t436S
         7hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629965; x=1787234765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=pcWZ7AGU+R8l1vN4dXSx/MaHJby7459Md/9kLKCCmsz82nWkCNWrEAuYx7i36/RstM
         P/PB+TNRGfX1fMuAN6eC46c/R5jjxwmzXH3acIGpYeaCVjuYCrcXaVhaGgLHnY7wFJlk
         dYvzbitJtoirKwBAag4aUMF4yMu5gqe1mZoA2o3DRacofGsFRiBqZgw7GuVLupoRGv7N
         FgrpZokgF4FpGdaHqFa04R4Za3ucgSgvqJ6EAEfmMz9XEjcwbYTUU6r6NKWljvBxdYm/
         IeEG7PGQOzRytBCGIdUBIKAX7UIYJibyGXIFfz7GzTZN9AEqkhMHGzZ+R134IAb0APwS
         sZsw==
X-Forwarded-Encrypted: i=1; AHgh+Robg0hEidzsLSNIorn2i4UJuD726vYisZA8aSmUAdQK1WzqmifYa2Bwe/ajVPMfou893hnaSZnSTVQvVD6x0heE@lists.infradead.org
X-Gm-Message-State: AOJu0YyzmhD45o3F9QDmlH9ySI9aanBxgMI+1ZNw8afHQL8uxNWms+LS
	bkfTFp6PBuS2qN8CPe2xt9586uH7JFGjJ6XgPiy/oiJ5sAsF6IMLJeqe
X-Gm-Gg: AR+sD12pzZdEHVG9gl4MnhmrseKELMnup3AlQqob1gTUPVqhJDhUGI6wewBbkUm5p49
	IB+fRWMW2/bNqpdS0cO0B8zub0KHf8fQ8/gtWOanTHKQcWTkaqSQefIGgnXMGPFfx3Ek9aIlJrS
	BGn109+8GAgjtjLzdBbnpfqTFqUpLNzyB7nS4Wg6DDWqUT2v1R1Yth3ZjpuIzpGxKJ2JRNLppKT
	zZLpqCfL0qow/5J99rAKPAUZD7j8DGNBEqmEH85I10XP7nzr476sKfMzGahvORFmhkC7XGLX5bi
	dDRd+5oa9mMvJKahSPML9RrudUs0xNXd1IaG1qxoTfRj4DZdIXxSmXNZVFyzF3MvnvONIEvWV2x
	DO87DNOv7TjQwApTz0l/Lkou26OSG1PU4LaQgqLKcuDd8nHHN+RrWECfGydwyHy33ZlUFA5hRBa
	2svUmZdb4wtHuBdHMxiOERItdguQqpNaKaRMUl99DuAmgm3c180qb+LUiL5dU/v3YCmnqYm52+l
	b/H
X-Received: by 2002:a05:6000:430d:b0:481:568e:d6ed with SMTP id ffacd0b85a97d-48159ee5201mr8885423f8f.15.1786629964824;
        Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Thu, 13 Aug 2026 16:05:59 +0200
Message-ID: <20260813140600.1824949-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_070606_927682_C546EA81 
X-CRM114-Status: GOOD (  11.73  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0


