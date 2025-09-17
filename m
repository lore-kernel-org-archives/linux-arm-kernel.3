Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AF4CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=; b=EmcVKXG5C/m8bU71F0acTGI868
	wVb31QLgJHXg2ICdymOSNIzGu66Q68akNRNa8kB+5dDlgHhd/i3HZEmJ2mwC5oC7k1yClXep8eA6H
	pJMlyLWFfRP8nHYkjCOHaxQqxVc99Gj+WmKCi3GlGZrZSnRZFGMUYReZJ0sc41QeAyMxD7BBrCxuV
	4xB1s4MW5bKxdLdhF81o6odTlDfiMG3PHFelTtjx+TmwP+WxoCMJ0baE7A/q3NPDniQixJZD/Hi56
	Ev02K13z+HPGN/lHEDyl9aEbnCJYAhwDj2wYUKxzb6XAcUhL4UsxmsuepauQ6MSQV+RvbmpUZRLFH
	HSAX5Wpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAn-0000000AZP8-0jUp;
	Wed, 17 Sep 2025 08:05:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAf-0000000AZJG-1za3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:05:46 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b0411b83aafso934627566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096344; x=1758701144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=;
        b=T6gNwnhdc5K66M6WE6AxcFLyxsyDOIayZh1501w3Xwg5GLPy7Zsqz+o/10glSnPKt2
         G3JcYzgGyQt1lQNbvD/19bLp+39MDjMBtJJrUyRvQBHYCFOR35ZoBMyFQfb6SXOder19
         GP7+VkkkbDOSXEUrPfvjYVe8ynxYID4g8pCqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096344; x=1758701144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=;
        b=NFZqqV/bOI1dgJKkfB91bL8PZhLyCEtsf0wzHpipOEfMPNfNEaSJLAhqJQEJ2S/G4G
         xSbLORAK3JlO4+AcE6WXx4UweDK0dm/f4K3WHpLjF/JjtG5r1A0iVNp/qEibuW1gLm68
         2nAEbDprHPOiqeba10pO3tl6SCALAkj3HsjbCiQAymFCPqCAZyH+Qm7jyNRs5zJs9JQQ
         FPOqyVzr8RL/89qKrQYaJJxmuYDfo4XqBF259d0hSSTnVWHAKC7fYr+impEl8PgKX3KJ
         V7soPIijdmRUqarzEVeUxFQlWwyvuZDixAu0HMo0lwNoUqguObmcOEple5ha5oa2G3sA
         IHhA==
X-Forwarded-Encrypted: i=1; AJvYcCX8GR5DyqEt/MGaAe9EeuvppN+D/edRK4B72J0MweEhAZaJ/qMRw2pLAO0r6EQD8we/XsipbS7RbVYHu9XYOguf@lists.infradead.org
X-Gm-Message-State: AOJu0YwOEPcpzH78lpcnUdAJn0QQYJ3erewTaBx+v0530m7fF/ko61mF
	d6xjQ8vYipYXbM6wVVB8MlW9QiEFiMKg7GNtOTgb8ahGHH/LC8+NJFLRLMrvhzt92DU=
X-Gm-Gg: ASbGncs0mnRp4uz1fQaH1mazeG9+3Lp2pDBZNfRCzHX/h9bY3Z2mG6cIuFPYdstHlmh
	0eSqDLzA53kaQO+OAMTlxCf4jaSvG7kO0UcFsc8tpp2D9LdUF2mHEqjxLN1XpLPYdHnNh7rTqij
	at0cnGDOPWK3UK66rwjlO7X8wAQ2DorsD/dxImTcHxk01YGkSfBGuTEZfNkIdu6lybqGbuquDj+
	T81eyhdZ17kFKtjprDuoRcytOpen2ZShvyHIh81vu+XWnEyVJv3E+z5V5WHH40555Hi8oHKJGmU
	a69ezY1zPGgnUwFfa4GZTKwOhZBsr8bdHzqomVvVCu+8R8rhejjb9Lq/lmbsOzerTkz5s4I5chX
	0RhvHyVmairRmPq2rdMQbagn+XS+3kTPlgRbPYR8xZenwNh9mPshT2ebszvo=
X-Google-Smtp-Source: AGHT+IHgnDmHgbGe7M2wf+eae5X2J65rFCbRDo8gVvx92rWiaCFtz+XyS2dWxPaksXXrHlaef/NgWA==
X-Received: by 2002:a17:906:d555:b0:afe:ef8a:ac69 with SMTP id a640c23a62f3a-b1bb7d419ddmr158716766b.43.1758096343566;
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Wed, 17 Sep 2025 10:05:09 +0200
Message-ID: <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_010545_540111_A40FD2CA 
X-CRM114-Status: GOOD (  11.26  )
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

Support the touchscreen-glitch-threshold-ns property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Adjust property description following the suggestions of
  Conor Dooley and Frank Li.
- Update the commit description.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..1975f741cf3d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
+      Drivers must convert this value to IPG clock cycles and map
+      it to one of the four discrete thresholds exposed by the
+      TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
 required:
   - compatible
   - reg
-- 
2.43.0


