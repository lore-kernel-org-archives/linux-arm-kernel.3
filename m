Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43651EC1428
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRBxFrn7AC9wXOJpDQL0/mC0loZfyU6jw3bAKE+4IaY=; b=0K4XhTCgY8sEBoCwtRWmeoenfP
	4BKw1To/oW3k8WPD2EqJiKedcO89wpMUAGxH7Dn0j2fIRDBos+ds7x7lSTC7VWrC2yVAGL5hevw0S
	AfCu55k9Gy73MAIJ4XGvDU4li1LRZe/921QdoPQgKLB81RkxF7l6ozPiFtJ0zjLBl5j8WZG3UCJFi
	qRwVVUiAFB/dh91v1iOyRyvHB1WdNE6mmXZszvaY3X8ICwiUf2U6RvTVTB4Y7g0Auh/VMu57bOPuj
	8BwU0hg+pumrA127DFfp29SbgvvcWmKNWQOIUR/oUvglWsdQRz2Mjml6Id/UiB7L4D1cBR97azykb
	pE8t4Zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNLS-0000000F0M6-3mmv;
	Tue, 03 Mar 2026 10:51:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNLQ-0000000F0Kq-0nDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:51:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48069a48629so59712315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772535074; x=1773139874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRBxFrn7AC9wXOJpDQL0/mC0loZfyU6jw3bAKE+4IaY=;
        b=B4YLvpGwI+YdXVaH9WH/5sostyeTPTXRnYMp6b2IWPEjKKZ0AzVkEI04ZvMcZvhsST
         ODDrk7JGoE9bq71m9djyUiCll+t1FqctsHyR7zrDdIOI30FOtlq59mu57ecVEfHFgBmA
         ChzqnALlNOmCopJNepzw66L+FXGVAgGWhFYxIwZ3hU87cDPLSKrkXFB2xDSMncqk2vnl
         ZRaq4Bt4kIlBnQhvnwF8rnG3uthNdIVjAxIhLZMQVWmTLEvfnO4qGUSGY6IkbfAygSd0
         q1kc/b3el7/be0zMIOLi/HPEAa4Q6a0T2iXd9BfAq/m/HfAffPeV7g6aG2lubHOQNwmF
         nL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535074; x=1773139874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRBxFrn7AC9wXOJpDQL0/mC0loZfyU6jw3bAKE+4IaY=;
        b=clKQTWZXNB+oYa5i7CyI1Gq8pfItnu8C+JV/wGW/7czRxSCO7ADfovO7lGHWM6wrKa
         BKyn7KDe0HcW3JfkGcRqFYzkh4WhZ6Z4EtRtZuHqUYhPSAtcJ7EVFb3iTzk2WTB2IFLf
         f280PdjDAkSyvb2TtISiuiCn/aVl4UXr6Oum+wnzU9gpkl6WsgfUv6zjHOPFeaDdrtve
         YgDJV0coBJ4XEVI0RGDHSyyHTTdZTx37+HD2OLIswR62MDpxpCWvHTq/fTi0u7gGzx/9
         aJHOnJy9WYklQ1QvGX4EkYakx3TwRL382qcmVnAQzmejm/y08ROmp1M40YayU4J5+Kd7
         tEnA==
X-Forwarded-Encrypted: i=1; AJvYcCXVQluh01voNq1fEttuIUbY3FdcMXSeqcphZhAQ+78e6pnX9wtsp2c3ec9OylDbEh2naFzurzPYhA5CBeuQiHYP@lists.infradead.org
X-Gm-Message-State: AOJu0YxuTYDaTwzvv00vPECTXQwonk/5fkKjCpROFhPjOuWOvos0fiHD
	c8oUNkOweZ/EwFmaF8fGf2Lu3Z2yJFFcUI2L2HQJuXaol0rn1sW7vkMp
X-Gm-Gg: ATEYQzww7SNyUCIQf4bll/bLAgelgDgAX4EpFgelegQ4GL5HDoAIdSvVNk8qDY31MZ7
	iyzVenPo3jYVrio6+KNqz3RaOdCM6109IIl6ZwKJHt5yqga8E9ihFj/ovaNrYOG5ZSCCJRrrBf1
	ijOl4zGsdbUQW4b3S7oJ6F0oAGQUUWEdn4hqjlV0c5/qio5yAjhwHDELgz9fr6DPrcmD+pqBvna
	4B2Wn0tpKvaBIO7BTQV3qvIhliVEGxQf43/StC/0eW55b8b1JP91NSW+86/cwI3GdgDAf9nDafR
	Oa/LTpb4gotHciStvJnhD2L0MwPUqWrpqxPoeuAPhBNa2dsPtPMzpDgaCUoYqLbbinBR0wgi1/2
	x0/PvwJ37LT2F9AdNXOIH+ODsPkDKETnjYpVCnwNJ0Wi5sb8Ph23VtqO3eYWRMHwEAMg/9h2Ycx
	AHrPQQ1zG4o3Ob7d0BQOQjVV8CEUCqI9Zk98AHlxqBaFr60HHM4BWDVfx3SMmWnd8WE/BgLmjYC
	FNK0Y19rlPk0IsUrnCfr+hiUEkAuHNyG1fGVB8=
X-Received: by 2002:a05:600c:c490:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-483c9c204b0mr264369755e9.31.1772535073748;
        Tue, 03 Mar 2026 02:51:13 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm318916045e9.1.2026.03.03.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:51:13 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Tue,  3 Mar 2026 11:50:37 +0100
Message-ID: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772534362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772534362.git.stefano.r@variscite.com>
References: <cover.1772534362.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_025116_242739_B0F37540 
X-CRM114-Status: UNSURE (   9.36  )
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

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..be2b88c3d9ee 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1545,6 +1545,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3


