Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46087C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=; b=mDqbLzosaJ6u4p0YZycAmhVXUA
	btWul0XOXgCcgpnkxiIBnmYDaKcnkjloz2XvYyRrBqt66fvAEpwEBxjJzreGJN6bi9qYTLNlq0GDG
	T92OS4yHF0tPenCQ6tdVPKSIkG+qwcawUq4RX7MJxCGprP4073RNAiiUWVNH+nVOU3GI8Lb5d//62
	P+itEWPzPaVpicBxXQ1wz2VWuOcsfREtjbMA3jlkFoLGdD9i79apK8zHgfjbMi7pZ2NOmeQs9KzPY
	OrgQQ25DpFtJ5kgWOBYxjmrhNWRvq2JqsV/crcCFADuo/Lw7HPFQGAsH83GQpJeR7Fys21d8p50k3
	0E2XTn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdUIm-0000000CYx5-289d;
	Sat, 27 Jun 2026 14:46:36 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdUIf-0000000CYug-0G9T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 14:46:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-472055b0efaso238208f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571587; x=1783176387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=;
        b=WhKqqGTYzXB2w8jJKc/RTqvVQsojUIkJupBwJuCDrRaxvMRY/xwfVqreBwMZdcpuiU
         dyaxrVjH9FqyuJTfYSPRlciDzTJDn3Is1VLv4ZLg4DQCQaG/dcPSI4U6fR4e9P8BQeW3
         RKgxqwUcZwqfJm8AbWnOnI4yiabmw1Q8I7K25/91HzF5EebovWkST65MZMvLZ7u/yQLj
         JGhBTbjwckUxrX0MxcfjuBPRlAl6J19Sz3uK22D9kReEQmlsp8o781K+CjLxb4tN5VTU
         BqxB9lmZWB+b8hpSdVM1jg4jFRYIVgSJi2RdtA6keYirsoX0tLeqcoPulG7tp2pF+SDt
         ASHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571587; x=1783176387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=;
        b=dTy4jQHqzxWEFNu/z7puKX580TGEyJBZAOAfYjX+IrZbsV57T+qGGThxKNSwm3Ufmg
         J83PzrxFvjOEoTFVfEeaa6Dfwx0DxPuVfZdnz3DTQnlVA3E5rn4pCtd+jCnhottUBWBf
         uy5ebu1g6OHQQDB0OEk1+VDav38iBtswVzIMgL5+hN7ZaRgtnXYfeQed5YgZ0E2Qr5uA
         ASIzmmdNkt7KmjX6IB5V0FctHixbsJyaEFyGk0fNQAk79Y9bjSxANP9H6DcPYDaBu1gh
         2JWgEAETm7HzwtPDANbMFhfBwhOggQjifV1JUGFlsr/7FKWX7ECnSqoWxCkoOrrEemPR
         S3bQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VeiFyO5hkMsKzzOXafGhjASAKSuAQXFzHKw1JpgHx3kyOCLKl0nXz70rr/MXsukn8u4pH39iFNmt+au8lct8p@lists.infradead.org
X-Gm-Message-State: AOJu0YwjCnioraxmxV+zHqXp/cB2/82U+mykSb3mH1HyQHncILIFBfXl
	0pggfl29SEyZtFm+EJzjf/SWBMStomZ4Tzp+2WSJ24LgskHt+IrbSAx6
X-Gm-Gg: AfdE7clsoqmeoNupu4mwvnTrOQZWtWDn2L+lY/CBQdyMp3NWY7n9XqudOszFAuRoCG2
	jcsmyCnpq6hFW3w0FU3qB7jW6jk5xEl8B3VyGwLRfoiwBw6PmOaFaTYCY8JcO5kbasr/Bt+1f7H
	S7fX6z4FotqtCNuY1piZ5fQW3IMSMmWVzGjgdzdlTTd+GMQNhoZhQYlfZ0eRdzhme95rEy7F9Nt
	nW88BujqSg2c8PqRXRSYgYO8Qk59NvmVR00U1KyUOOBRvP1L1Xi/yg0e7bYoD0fVkO+UVMEckIe
	eK6tQDsWGNj7DjL03FtcNGGl7+Uc1rYPXIwcy3Y9jXZxmOTCvMqFACuLK5ZGgONMvFbr4/XbCws
	ENNEr6GSYTvecKKFQsDfpfimEFsUg2rOduiw033nBjmrQHhDYgyDeTYJy3PIsWNqQBAFwmabVRv
	YsNTuX/vjBT9goE0w880nilaYHbH9eYP+cfbJiyM1TGt2+BFxLU5+sRjZICyusOeAip/XtRAPWf
	ocGK+a+OFbktVyFDWV2sxeYnu4oDg8eRoqDlQ==
X-Received: by 2002:a05:600c:e54a:20b0:492:6093:8837 with SMTP id 5b1f17b1804b1-4926689a4d1mr117391445e9.34.1782571586901;
        Sat, 27 Jun 2026 07:46:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:26 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Sat, 27 Jun 2026 16:46:11 +0200
Message-ID: <a3355082aec3454f671b44e1f9a78000d2733470.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_074629_114216_265C9B89 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..c942d3d06469 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3


