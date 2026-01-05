Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E7C2A08F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=; b=k2Qqo3zsZ1M4U5Yp4m6ODte4Uy
	0YXhFH9gX9KQWVNtADaV9KifwbiR/p+A567x4GbrIdXpS7mxcJAUTZn6/G3sFO45fniO6AK6fW/z7
	tjAeQgw1BKZFGx+eTjwB7huymJIZh6wyl3LFVlbRCcX0LuhZ5r6aAy7g4/L3veMNck0vOrkVOAqxP
	JVTov0l2iQ7uFr2h8yyrDawQEme42oD7C7RflADAi4ZVhlfyUL1GvxhhXZAx/b3A2blu71AbeFeO+
	2I4WdMbdh2Feofj7lpCQ3q0tyw8eHJ5HwiY4RotMBW2faRcNDNeTAL7LAL8bb4RLBl1eoKFH1l0hu
	mvmYL5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchlV-0000000B6Pp-3oCP;
	Mon, 05 Jan 2026 10:24:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchlT-0000000B6P3-3oPL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:24:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47755de027eso83563455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767608682; x=1768213482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=QTbjsPdJld+XOnOugbGieU94arCkzhjURWrYHdyqM4cUSOOLv2nRhFz3sG1wGauqSs
         d6WwPWed6LP4BOg5+dZc9Dtf9rfr/GabsuvnQaf82S8kDEZ2acoxB8qeN1hLb0zc3eRc
         z7JQDMOBI4zj0uNBOj3yheTt8KTyA14hYHuxsoDzAlOsDTe10GoZAL14/0YG3gbDv2GH
         SceKjjSy/ZJiZSFUEdv3F3h4beKfio/fdAecMHJc5m+HGL30U71gAMYsbERstKIBVoGf
         W4w0LMxuCgHx8cgex0xePOAzSVpJ8JM/lhXTxWJ+sUhbzI26GYmqjRKEcjW8H24bU0pZ
         5FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608682; x=1768213482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=TX5HhrR2DrbEjpBKymZrif+TZWgWUO1DrYBqDPdywST6i/VLfNobbp5QT7L04Xd+AH
         Y+E1yHBomsaQ508HAlrVk/x44CJcSQRH+KINubeS9+849su3/Ptkw8iTiomkzXuo0zfa
         BgUbF8tcFyDR9ZZc/zPmfe6wPk7GqX7GNaeoG+MhNWHeAHF/9DA3xwTWcIihJkrlPyzd
         g4dhR/7/g+pbXjDfBg08W2IBb8UTs7ysVcDjQZQULZVYulA20lzH8G51Re5IacuoI5md
         EsxWOlveIu29iz7ILNX5HqtEFSYl5BgCwJQIs58osb78k+fl2wT2+ifOjidFM+aDF5Mu
         TWSw==
X-Forwarded-Encrypted: i=1; AJvYcCXv4o9Q40ZsTfbCtBrMTuSXrowjhRfEG284Utubj7YG4LB8G7/Q7CT7mcTGGrDcgBoCkjws5uH6qn/rFAartXGa@lists.infradead.org
X-Gm-Message-State: AOJu0YwKRw45Gwhiz0BpvZ1W9r8uUz9ruq4monsFH7XtTO0rBwyaTwSh
	6honhIKmZ8Q7j10ufwXRD823/GYimpN/0UOZp2QUbhvj7Tkh8fjVRL2S
X-Gm-Gg: AY/fxX6YDmK8ytYimN2LtJwo3iiNfp7/RUUP3R1NZv8mDqW5HTL2L2FuOj5YK4D5ue7
	8So+5UW422GqwXxelVusse5psC6mmI31EamA328tti2cdljuiQjSd5/XfNRclPQpcStyiiUKFd5
	BRpi8iBUP25RTim4GodYnlZBi4qH0HyyRbEXzjG4cDNpxhUon0O2Tt/WNYr1B9hfB3/DJHbTkBg
	ebZDBQyNdnnQDPVyrhzH76He209JqJV8QyGPxwlO3pRCNiJrgqktpjnWGkBNNFer6OcG9gr9dAi
	vfk2ynK3EJmezVoAmwmHphAiC15FQ+ojMrLKUAjSKwItvxj8nG7g+fIgF6zNXXJI6covV6AgHQY
	aOvbKvcHWduv34Y/ITUfAxiZNm6hOwa+ywYXc3L/8vRR81jYQXLwkoYSIqq3IZZkWWJYywJUV8C
	Yi77KQtBTwCIQwjbVd3qsCtGrcjOcMkrP+Ady1TbVqjg7Py5bIJo84YYo4duuJtvD8bHJWQvDva
	q1fVtNrwTPC8AP6MLTsDD1pOA==
X-Google-Smtp-Source: AGHT+IE4Fxb+mvxMSRFCwCVY2MMYAerRo0gqIhZGIaYDGKCF0+BDab5bAu8le/Ontz20bO5Qq/g95g==
X-Received: by 2002:a05:600c:4fce:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-47d194c659emr571593275e9.0.1767608681857;
        Mon, 05 Jan 2026 02:24:41 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm145607205e9.10.2026.01.05.02.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:24:41 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon,  5 Jan 2026 11:24:01 +0100
Message-ID: <20260105102412.6674-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105102412.6674-1-stefano.r@variscite.com>
References: <20260105102412.6674-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_022443_965531_671B520B 
X-CRM114-Status: UNSURE (   8.99  )
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

Add DT compatible strings for Variscite DART-MX95 SoM and Variscite
development carrier Board.

Link: https://variscite.com/system-on-module-som/i-mx-9/dart-mx95/
Link: https://variscite.com/carrier-boards/sonata-board/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..2a957a593abe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1449,6 +1449,12 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Variscite DART-MX95 based Boards
+        items:
+          - const: variscite,var-dart-mx95-sonata # Variscite DART-MX95 SOM on Sonata Development Board
+          - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.47.3


