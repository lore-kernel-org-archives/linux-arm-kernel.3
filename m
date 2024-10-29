Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA8D2AB38
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=; b=H+13lX6yvPBgvERORsQyvdS9gu
	A22wbIwYpVz1zQynfgUrPk/f7IRHivh3ElNTPAiVhZUksmYvMqkrZPev7RHbAQZAPfQWbqY3ulJ7O
	jH70pOxXE1F3Vr2mkjsyfGpjZTERI8BjZ9oL99cBuF1/xQdQwrfHOCC2IMBw1aZyt/WrKqUa8Z1PH
	583pStctamVKlt5v9fAG5M1JsRbggbl3vJklm0k+TN2xhoy6uaTVlr47ACaiU8wV4I12eFmXtkeTM
	P1s97KlNOdBjBBdUU/yxsXCO2zNEt/6Tp7cXjluUMHShscchlLnKS4/cvpqHtdp4SkMabPnz+SGWk
	byGLTQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lQz-0000000EPyl-2TL7;
	Tue, 29 Oct 2024 12:34:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kvx-0000000EKJ1-0h4J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:02:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e983487a1so3912409b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203368; x=1730808168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=;
        b=FEeDUCq6YWw85NZlEt0O7tpHCA5yFqWpF9DzfWxQHkmBBGXIj3OgSmMYQImLB+lMvb
         EtOhZreRCnLyttbD2VSZA0+TAsscK+ElKVf9TpeWDUOTV6dTbR3vBScTa7MgJr4DeX10
         jxxdQ2f3fgRY2RxwxYU3JG0dzSSZBQubtJ/RGvnAtvPrG3/K6T96mlx/rFDEoRpxfICh
         Hu/+J5VRR1iPOSk2ptb9IyhTNJvFHzTfTTOWOQH0R4FOqmxJ3CaQjNPntvzBgBOb6kdB
         YZthbRdPV2Ak+h/Lh08Vahbty8+3AbYyQZx2U8g0dYbpN9dI2ZxiEoilq0TCGR/eqjxG
         kYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203368; x=1730808168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=;
        b=e0tRk5WJ876XeUIMw14ZXkB8SrY8S/SOHL3dsvjIGWMiWj9SUfRnSteEuOBswwB/60
         1n+6hg+Wluk+CjAgfnW86hXuR36hwtcFJsmXKtNh0KYu/BhsUsNNIwrey5vAMoRgH+Ye
         g15ujepaqRJ7S7V903svdBmDTQdAMM0VKBZ7T1jn5uKfwOZKM2unV1mn9F4ybloHIvp4
         Q3OhQ6r7TUkBN0lKYdsGvfpeNEd9qwqe9n81GQtJGu67WlkTr7rl8tY5TqvOhk0SR3XB
         zIUutysYY9X2QeUiX+oJp+tY8keW0Rh0BLulQxEqDrDGYXYdcq72nJbfxSBb+P+H40RW
         WT4w==
X-Forwarded-Encrypted: i=1; AJvYcCW6my5/gQBQQayn9oWQApEnC4iVvA465brEgevbPjeDf5Msm0s1R1sJcEVVihWagl+HwketnBJnzyWYJJU82NW2@lists.infradead.org
X-Gm-Message-State: AOJu0YyVwVvyfY6erNFxta/RcU3i+8fvRmsqboXZMaq6aetu0ERYq+aZ
	ziGm2bqaEYnTQSFXLERjMge7KXXynvIg15gqxgs8v8d9mdCdMUdG
X-Google-Smtp-Source: AGHT+IE6/N4HaxtLmsC1vv1SohgG4z64qywId5rWMF+nsLvluOwKa5NTqFO4bJD8re1fhrw1o3yMuw==
X-Received: by 2002:a05:6a00:198e:b0:71e:7e8e:f684 with SMTP id d2e1a72fcca58-72062fb82b0mr15764161b3a.9.1730203368031;
        Tue, 29 Oct 2024 05:02:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:02:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue, 29 Oct 2024 09:02:34 -0300
Message-Id: <20241029120236.299040-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_050249_234790_345491D2 
X-CRM114-Status: UNSURE (   8.65  )
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

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..836955de3bc9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,6 +32,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
-- 
2.34.1


