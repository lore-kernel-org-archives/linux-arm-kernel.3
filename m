Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2555FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=; b=BWlaha3mA3k/ZlMOUJuLoGV4ld
	8vbNTxRCb/SCQjCGjeUazq0TvfqvGgcAi3kqpFmRkKEhTFJLz93jrIDS20xGVOdKmZ6q7jxRKQRjm
	4qRt6Y0u3liBS5h0r6wgI4Sq2ZLPjSneIOAuw1ZdPfJavPwySvDCvtopfb8gLEfELmYllAq+SdTGk
	LTXFbKtj7Y1oXALmFdC1DMkxp8eKFiSM/QqyKF6ApPeTkaNKpUr55iMPKTgAFOP9yLNZStstAMxL6
	RHc7/oUbeap0h35sJcyjdYowcc4SGRsJbejnSTkGOX11OW/GDv9UPQC97PDOfOLoKVOtd14emVbcu
	lKPnD8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwADS-0000000BaFh-01s1;
	Wed, 10 Sep 2025 02:05:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwADQ-0000000BaEw-0MSa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:05:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-24c7848519bso64485015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757469943; x=1758074743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=;
        b=KsdDAS+MOTFM6MsSvPL0v2hvUZWCb4853jaJOJWUPpQdJ/CXmi+mKPX9r00weixWWE
         24H0ETZzW2BbjEb2aeVzAKbswSsdoKScukr7gSV65/eRv2jRalRoUCbe4HNXidwXPu2i
         vsqGQgm5+9t1sqikH5wT1Yt0YdNMlSoaFFbg/PURc2ok067zxVwNB+ZrZWjNFkRfIJmX
         dLPoCAByuZiR1KziDajQczUmk64bkY3Y68VW3zs78OZDfxi1i0mA5RjMI2/zUYlCzURo
         M9CIdOX8he4MGwm9qu4thzs1O9oS/zvGuk19L9FRVe4IGEEf70FMAeS7wVBwhbb52BD0
         TAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757469943; x=1758074743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=;
        b=EFj5PwmyWXbGXOKw/pzo/RHe8HPYyBZK7fp105l5JubtawAnksic3/VfmtyPibMCW/
         aZF7nr02+fLdiTER7+MnIqCwOXMdKcaZQz4siqxGVrbWpAtO/bVJzcywqWDZj3tvg8r5
         nHYdxSQAPrIaTVpphyk6ZXRdK+SILTR3eLcyvbZBBsFcUkQCo2sBW1X4CWJuCVp7AbHa
         WiLHOBD/nrYwIFEA7v5/seO2LdOdyITI1OvllT7oJ9MtSkU65y+QIVLR6UFdJPvJ0GXC
         ewK4JaFGEAr7cfFcgj1u6b3evranZ89fveL/kPDdlN9gA9fBH5SaNH2tGKiVt8q7xDGa
         6DZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQqSua9hA1MkAS1Q28a5FsppuPAKCMF0KFbnDb2kMQLYtleO3rPhqx9py+IshkGfbXryZ0LFRpAmrNc6u757wn@lists.infradead.org
X-Gm-Message-State: AOJu0YzqI3heKvXqZYtUg0j/GB4jRYMImulyVmWdMBwb/nM7MXPBhWaw
	2i88cbrwMTWkzjo2pIMvrUdZwJ/BQPye00Rmh089oWwTHnU00i8ltzvn
X-Gm-Gg: ASbGncvwWMY3XfcFMMrnQgGzRq8FtMwKJfGkSDByUCnlIRsbjI+9r29Ay7985oCeubD
	kDlKcgdrrkaLUg4e1LFeSr3N8/2PCwRcCJGrv4AuBqJWsEmTtG+xenN/hE1n1LT7cfviacip7cT
	uDehhPas0+XGXZVulIhCQL6dMpHd9a4VGw2S1jBrcEKpljXFuOmKlK/3arr2162k7iC3EQNMh4h
	mcNpNXwd4fq5JPjEtpm0tPYJMcAV+FZP2J8fUR1XRnfysEAOSnWOC5uy15Hqyc3y8lZS5+S3Kzt
	LYyuyVIJoI7DtxFcHUbihUk+QvuyWwnFoLpNAqluW0Jb2dMw9JJPhSSTVu7OzQ02fUdvBXqUqCA
	AwQnJZgLJtp0OdUz6na1BqHsy1EPnrZWO+Z7y
X-Google-Smtp-Source: AGHT+IHfsM+uQNdeDlEV8Gi3sfhH4rxp5TEHRWiyAFDuYJhy1hRqhib9ntEdtEsP9dyG9OLtpdKBRQ==
X-Received: by 2002:a17:903:2a8b:b0:24b:270e:56d3 with SMTP id d9443c01a7336-2516ef54cd4mr178901465ad.4.1757469942906;
        Tue, 09 Sep 2025 19:05:42 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:05:42 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue,  9 Sep 2025 23:05:23 -0300
Message-Id: <20250910020525.342590-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190544_130699_44E54DD2 
X-CRM114-Status: UNSURE (   9.68  )
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

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..ce31b873fb95 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
@@ -199,7 +202,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1


