Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94005D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 00:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/JH4ZQU5AFvRH7Qn9sg9MSQ3ssLfCpHuJRXQbGQoDWQ=; b=3IGCfNokjP2gFaWW/WHFKQ1131
	d+qFoQKkbi19SnD/4xSUHtONt5zGgc12tStlsCC80a5p3SFkFOA6ndblLFxgrNYFMdhS5vZqQTg/c
	pti8AZ6m5Yp63TJJtCLihvTuWDRSHYPUtbgNUxEV+2amdBkY35H0ixGubokpa3KU83b/TFyvRuAvi
	3w8iprY3Gz560hDclKEtf/EK7+7ekuEcgfYdAieh/OkcxXPY2oKsdFFKSfRFEY/F2wKzp9hZNBjfq
	FYDqjjD50KU2t/hFTf5wYPHgWSYAbF2dSome2JGkuO0UBnAcN4Mgsr5P4PJving4T4E9Gwv11AHJp
	ZPK5lP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48Qc-0000000273F-1wGV;
	Fri, 25 Oct 2024 00:43:46 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48P3-000000026ig-3Vdj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 00:42:11 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3e600add5dcso842857b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 17:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816928; x=1730421728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JH4ZQU5AFvRH7Qn9sg9MSQ3ssLfCpHuJRXQbGQoDWQ=;
        b=BWPNRx8tRQXR8joPQkQVlXAm48kBKIrXmP5k5Vmxu4/qZW3LEITjwK4kqNq4DlRojM
         LKl3+xXSa3UPJwmrU/8m7a2Aw0GMwbpEagO0W2IRd+gYMlAh0FP8EtGzqs4e3OL51T4P
         cS7iMkSjK4cjrzr+jwX/MR4SyB+NWbiNODbYfsX70QQTd+rv5w/fDpW/kod4svyz1OL+
         SktNSWZVVxyG5KS/2dsxuyZL9qsV5rocFYymdzQnTWcLNNqTkXWnBi9Giak/9XaYUoSR
         KU5aFYrxnh2+9GjGBNuuHFjNhzMnXvqlImNMnzsZpHY/2xG2LoumlY0C1kzXIgWaeCf+
         lrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816928; x=1730421728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JH4ZQU5AFvRH7Qn9sg9MSQ3ssLfCpHuJRXQbGQoDWQ=;
        b=PTH2IeCAXj2OvzdRAVBOga1PHd2/5pQt2NqxuH2zkBv5WGbB3KhcfUg3JysJLwlCJy
         +2FO86DMG1v4PeTaWNaS8W1IctqpyAJ4LA1rOGIkQXS8dTCX3MunGzmonbTPWCWAGupQ
         07L3iXztxixlmhIDTxoGIQMCy6FXwI/T2WhvjTKDT453fWd8pC5sQxa6m4EHpJnPzmTS
         Y4RHo/4JbollKfaOv/2cud5vxVTkAQL+6e3uvmpa9FZDiEivsfehsxe5sxmfw0rbEGLm
         Z6JtMQ2s6kOwuBKOGL8uSi2i98ansE+ATxTPwSnRpAPLtpRA+V4sghUbTd+9bfEyDWEM
         xjwA==
X-Forwarded-Encrypted: i=1; AJvYcCW87vJRN0UDYNvV+i/joAg3y5+hLQVYX1lhWLYFb0fkQyVL68RIatD9vHZxjJcRj6dtX6UOulOijYbmPcbIXYa7@lists.infradead.org
X-Gm-Message-State: AOJu0YzwEoeFAQUxVljJz7zre2CWk1yBGUx3cwHtdtuIx6XEX+a98J02
	3Nicx5gpeyJ/w0qZWnAj9jy3e3dovqbSE7GLBE6zyO9xnv8QI/6b
X-Google-Smtp-Source: AGHT+IHhO0Oe/ES3dfFw2XAIiGrW09kdGvbnuxejTHYBTvDD9QQCbHbNJqfVJPaqKCqsiNhoGM7kEQ==
X-Received: by 2002:a05:6808:1490:b0:3e6:21a:9a62 with SMTP id 5614622812f47-3e6245014cemr8084123b6e.11.1729816928153;
        Thu, 24 Oct 2024 17:42:08 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3d2easm27289a12.85.2024.10.24.17.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:42:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7 irq number
Date: Thu, 24 Oct 2024 21:41:58 -0300
Message-Id: <20241025004159.1571782-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_174209_899183_432A148E 
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

From: Fabio Estevam <festevam@denx.de>

Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.

Add logic that contemplates such case to fix the following
dt-schema warning:

anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../bindings/soc/imx/fsl,imx-anatop.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
index c4ae4f28422b..ae708a658d52 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
@@ -36,6 +36,7 @@ properties:
       - description: Temperature sensor event
       - description: Brown-out event on either of the support regulators
       - description: Brown-out event on either the core, gpu or soc regulators
+    minItems: 2
 
   tempmon:
     type: object
@@ -52,6 +53,23 @@ required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx7d-anatop
+    then:
+      properties:
+        interrupts:
+          maxItems: 2
+    else:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


