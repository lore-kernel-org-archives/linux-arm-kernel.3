Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11563CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYpBInbhYba1I5IFzkBXif3pXoZfr9uL09LB08J1+iU=; b=B1pVdcLa0mKLFPvTqE5R0u0FUi
	pI/bvEO1gIXzBap9mSNBvzSP8BxjMWFG9DVQLAh5882RGuPLw1zf+AaxfZGlYLg1ZNbcmMyTg7W6I
	cPbiel8H40rFLnPMlB3X5T/ZW+FV5ASehXfeWFJikyeLPgC95zVP3DPU6B5DZ/re4bNhRXYWBueis
	7TlMPHaI4MG63HTyKUaEUz8A990SRhJBbzA/zwd7/QPRDMV5gBiTR/KPD3Lgvvwv56ydosOd29+Wi
	MTJMY05dbB+ImPYdnD+A6hJlUPUo8LG4q3qHv5+nPu+t9izSTG7/nyaBuYXIvkjb2osDRCPzX7q+V
	EPyKEZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFH3-00000005Y75-25xC;
	Mon, 15 Sep 2025 19:54:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGw-00000005Y1I-2JPX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:53:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45f2fa8a1adso9238205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966037; x=1758570837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYpBInbhYba1I5IFzkBXif3pXoZfr9uL09LB08J1+iU=;
        b=PzYTKV/CChuK1B0DB+mf26VXiSg3nMeZpSeYgeewCeW9OSj64q557qOmvOrqcrviGl
         o3n559Pg9+3zs1xdHUsQbT/9mt9XaJS4EklwaNd/x/HexB2FMT28gPYr4e/UKlak/s+y
         kLqZve8sjAnWwMaumrynT5rnl3AYDUmFia/rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966037; x=1758570837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYpBInbhYba1I5IFzkBXif3pXoZfr9uL09LB08J1+iU=;
        b=runV3BwurxBhY+lKPRst50PMz8qxejeitFhskdXCCTpS+e5llVxPfnfhkzUZ3PUi5+
         WiE+mS17TXTvZE1E5P6YmIYDjEkNTTD4HglvC2P+NeDHNDpqOIaKiP21L/CSeTM+5CNF
         6d7G2QfLVJHMlggny70wiIFWy7toPvTEJcYCNTdkOzw27aSh48gjSxccW60kP8NbBi0H
         Doee/guOMT6ovzbhFtfZY0p/hFeiKnQ2FbkXQYQOzG+SBbPVyuVKkVfQmzjUrmMfPFi5
         Kk20nFCayrFJG7J/QYIghoUrrpV/tBAZJvskYS8huWlViunBMhxFUzwQXLrxspamqGRk
         yjTw==
X-Forwarded-Encrypted: i=1; AJvYcCUng+mrnM+uAXalSJy4ePM5Y4T8jGpICE3FroetrQzrH1VbCupnJ3OAbun8zcecU6ARag04RyAYgd5NWdL5Gemf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxet2oOVfsZPsWY/oy3LVVemfGh696nZznFPd657C24PHN11eLY
	+CIzVTbgoClG9glkcC7XDcqN+ou3p2S2Oj/W5wOasUg8w25JSTHmrX4gBv+KCA9/RK4=
X-Gm-Gg: ASbGncsODIGbjNgPOE44HEQeYknhim4jqhbwaj6cMLopjDQQ8sqbAzCtNUmcquWDgqv
	00jFPeDvrVTzFf9Bmsl0Wx3DWGw26NJMJKuXAdj1ydQeUDhCQWkmZeN5bg5soJ0BNlLbo3mben8
	uTwMs7Qr1OiCmoPtpCA7NVe/oiiWIYjSMHIN99/kGInfmlBlsOybaxt6QV16Q4GiBu5rKOhwkWT
	Y0eJHLAEDI8MjpDXcxljexsxNW9nl1qzLYdvMQ9NlYCdtFV6xe7nGBC2Ilns3Jjtrf1JpH+XPLh
	GX5spqP7QgQkBBSgu7AftIDd6lk1zKwKb+ojAtN0Xu3L+irtqhjF4CSAXUMJVEgF+5esiFHfARf
	7gOF7YgfvHHcWaP/UZpus0w1rkJaph6tKCOdSsF29vBos2GCh7JLZRll28BPJSvA=
X-Google-Smtp-Source: AGHT+IGia0IZ0pDiz5Yw5I2pPYwxxrez1ql7kM6HUI8y8toQ7q5lIloMT59fhRpk+Z7OXMtwBgr0pQ==
X-Received: by 2002:a05:600c:c8d:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-45f24060698mr116466355e9.6.1757966036748;
        Mon, 15 Sep 2025 12:53:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Mon, 15 Sep 2025 21:53:06 +0200
Message-ID: <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125358_612659_13D6B887 
X-CRM114-Status: GOOD (  12.96  )
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

Support the touchscreen-glitch-threshold-ns property. Unlike the
generic description in touchscreen.yaml, this controller maps the
provided value to one of four discrete thresholds internally.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..6214d8be5a99 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,18 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Unlike the generic property defined in touchscreen.yaml, this
+      controller does not allow arbitrary values. Internally the value is
+      converted to IPG clock cycles and mapped to one of four discrete
+      thresholds exposed by the TSC_DEBUG_MODE2 register:
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


