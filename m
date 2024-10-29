Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D2CD3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=; b=VcLTNG0fRerfs9iMik21QlqG3H
	ejwkqxK4l8gzDdqulA42/amPrimcPwNKx3ZvUGxk4D+J0MalQOMftXH8tYHlGE1uvPjJMhbm6yDe5
	cAGkazh0aliCD59HSIshhsTHtSaIFq8zeSri1rmg6RoflsuLW+TYo+MB5cIWiyL7cqhS6LEmrJ466
	6VChNQqPFv57i+PpEeoA++P3hIRVInb2j+WUuZJz9IKA2YwWBbBlk1d767oiQeCPinTPUXMokB6Qv
	snjLGLLg/dap/0QXKYa1F/jWvYM1gaMUjO0QR7JH3RxgkVVVIwulxFajlYXAAmm9TwokWuZPqHBhe
	ML6IcYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rja-0000000FdtZ-3DYD;
	Tue, 29 Oct 2024 19:18:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rhx-0000000FdcN-1Pmr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:16:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c693b68f5so63411625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730229407; x=1730834207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=;
        b=YqFlUvxUt0cDPymzBGvybniXiycHhBdywTTcohyjVFcIWwyImlsF/UUrE/Lpo9u7bI
         Ht7AP3Ecq2slY76BJJBdHpT/FUm14piRFpsPlB8zsrTXSHUhYCIgV4ydxinefdAF9dgu
         5gySM/3EDbXVgg50PhVg9DBpx1D9NdP/7/bLMDIpf7H7tGfAYmdBMJ6ozIVQ3MXWQVCx
         Bd/nbtgiut6E/v9d0k5d86kOFDf1I26vDwk4ohFAoKZlwd7eu1D79VoibzXIK6ckgJtB
         HWA24x4LZNPIMCLTobuMFMztj+C3IyQXZ2Yo5wlaZh6C6eHT92YhnXT1e2iP3MKHK9AS
         aD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229407; x=1730834207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=;
        b=NTViqa/oS+IuyhVW0mGe4kQTzh4iPYpTdC+ukfbaX882jIy82YRRsFeaAAkvzZXBJQ
         wfti3a79OE7WsnBTV75Vf/qAO7KQLCe1t6q+C7QBGPfJ61DQV91n2AQwkcvdgzRjRbqD
         Xtxt5QJl2M7x4djJco1HxgXEFpdkRcOH7XvUUQk14i1DVS6qo3F8UHCxHaKUoPAneO5i
         Aibl6tWIY6K/EnrZWm8S9//CqRqAZCF1iWZFs2KWUQle0xNiuLgNUF3PFCoxZ0t+S3fJ
         ahPWKg+5Gvw62ko6jizgzRGxSmZJdIqmpr+CLyb0Vi8T4vWCFt2bGiroJ6fkdNs6dsvs
         RF2A==
X-Forwarded-Encrypted: i=1; AJvYcCXj/MEZo/tgqnI8zwuhV5O/o9a/TmNilMM4Yl+/C32O7u76xufO5cF/r4olHUTbOZzdnpdcQHZFBAIr0QtA9pGF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ydbg9afr2zLyuhT306aQEXxl2ZON9v0npIxe37mdHol9p8+K
	HipR4mYnluDEuC7q4YihxVl4uXwKfrhWme9StXa4S2LnCjNUPoy0
X-Google-Smtp-Source: AGHT+IFflxdhOOdhlw0WMMCci3BlMlyqQZ2ZA9xv59ogXANUwG9RzYtz7JlPEFXLPDfj8fEW5WQ+0w==
X-Received: by 2002:a17:902:f686:b0:20b:8ef3:67a with SMTP id d9443c01a7336-210c68744a1mr195187515ad.7.1730229407280;
        Tue, 29 Oct 2024 12:16:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:16:46 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue, 29 Oct 2024 16:16:38 -0300
Message-Id: <20241029191640.379315-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_121649_413421_CF0AE9C3 
X-CRM114-Status: GOOD (  10.44  )
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
Changes since v2:
- Only document fsl,imx6sx-lcdif with a fallback.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..ad0cca562463 100644
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
-- 
2.34.1


