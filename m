Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A55AD2AB33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=; b=oI+mGQixtW8pCk/JAJInpsylFL
	U6uQY4l2itAaXgafSUDX265EGzkYYFZLXfewbaHUzGwvc8znW8U+DYLjTXJf5xW2S66J/RweCp99w
	Oz69y/yy2sLypElIebAgPLdipRwTWapkSgHNmiLZV7F+rzoS793eRGQmoX1+vEhK5OChpVfj40suC
	0AoSryUqNJVAmEPTk23a2zr++Ww/ghPuCykgCKQtDXP6bSTbZXU16V+zw0x4f6eByXab6nQDQASkS
	tUsCD7Oi+ntU3GSbQwR/tUnzZg9O7t3MwiRcpaRvA6PE2/TcrTBr7uJ9qIzaDVMvyudViyJdKsh6i
	1iAVVONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lSZ-0000000EQEn-3Uxw;
	Tue, 29 Oct 2024 12:36:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kw1-0000000EKJq-1BIc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:02:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso4332632b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203372; x=1730808172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=;
        b=h8opJTsl/bCGrNgloPtHGU40WjrrDQVgmyLMl+v4FtyjsL91fPXjkyrnCG3UUTcsgN
         Tjvj67cm6JZJBEcCTeaWK4tBi96oO5x8obg25TPy8HVy12ivq4PN5q5LW7CgcD/EQ5Kn
         EgzZHCzITHYAdvnK1qLYxumRG0VkaVr6q6H9aluPydHmtrpU51mcVDDzht0Ao8GXFh50
         kguaSHKdj8L9eFgFccS35pWPaH2XSO/1abQVT5FaDxflzQ2Gq0DtjlhepA+SO8JUTZb4
         Dzm+lEkTdpk+Z6TOndI3zS513mqHWZ4cRhPUX9IK7IAZ7Uvhdq6IDbsAPSrw8kmiptAR
         2l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203372; x=1730808172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=;
        b=oSe0igDUMtImu6G34IUGgHmwmulO8+I8WV9gP2+Dz44s2ME+ZKvJO+zpVR59dkCPLB
         wlvd0CR4IBeKCoC8KqsVg1R/OqxmwXZ+vDpvpGfgVTf1gI7U54zEAzx6M+wEAllfUrGn
         huxAo6h/UNNmYU0dbUkmu729ahQTDQvuEYV1Z0xJ1vOGIc8+VspTekeU+UIeH1c25Tgo
         CG9E9gsc0iALUTNXg5A2TUhPzJaeY1nJn7+IN8r3/nr/jdqjqjAX8G2zv1Mpfws5HeS1
         5JMaCWiZ6jZoMJtm0dqyHA37n/a1sdRxNIWjp57yIZBr7sXZNUDtVRJn9bZnCH+aUqZz
         DHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0yepwG+kvlxm/jyT5BWKKtBWYutLHr720uDqVg9q+8/nzHfNWC/pbBkLkmKB2OyMNk6tFRzXOlamtIvH1e7Xv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8g7dH1D0kUIXMi4O0BSPcw+DqS71VaTGVgtxKRNYkRHs4LcXr
	r+lwxwYpVVG7Ne6Zmc0X+7szbeXZQiKB15BPeW9NWu7WuU1Kngr3
X-Google-Smtp-Source: AGHT+IGSaPWzwYRZBKjWD9RrHpvpb6Xg8xbKX+Ux5F+Yk2959JKoj++AuEEpzabc99znDi3atvlmfA==
X-Received: by 2002:a05:6a00:1703:b0:71e:5d1d:1aa2 with SMTP id d2e1a72fcca58-72062fa0b5bmr16981266b3a.7.1730203371964;
        Tue, 29 Oct 2024 05:02:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:02:51 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue, 29 Oct 2024 09:02:35 -0300
Message-Id: <20241029120236.299040-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029120236.299040-1-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_050253_414640_D869FDF8 
X-CRM114-Status: GOOD (  10.25  )
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

imx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll. 

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 .../devicetree/bindings/display/fsl,lcdif.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 836955de3bc9..08ce19638fbd 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,11 +32,23 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - const: fsl,imx6sl-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
+      - items:
+          - const: fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
           - const: fsl,imx28-lcdif
-
   reg:
     maxItems: 1
 
-- 
2.34.1


