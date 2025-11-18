Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D955CEDDAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=; b=BJ8bL66icjklYYa2mv+9FIkPef
	34Ep50+0mQjkY6Wr6bJvbq5g++d1W+dYGGyzxFtRiL664HGABTRk4wM6M9Ig+UNmIkRrH6o7vTUQY
	hCWhCb7fAQ0mL1n+HPrZ6h4bp4C3xIsBi9SWDUWebBIMrtBBQ+1gC3+3BbT8UlpLBQGlRkn5IjCxY
	hmp/StAPDz0lVpR2Kw4wz3DIE6BOIs5LInU1JUHE9LXpydx51+BQOOz7ARSEuMPnuhsrTrko9wFar
	HcSEvdMJQQb9Ol3y77DiFN5xWpvWxvamrJMo389F8v21q8pu6cjyRLIa8kkNtZOKuKC+FhyegHWO7
	D7eXR+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKM-00000000bRN-0s3d;
	Tue, 18 Nov 2025 15:09:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKI-00000000bNc-1yy4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so3416305f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478541; x=1764083341; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=ZnCJ1p2Y9XpaQq5DqzVeg3EC1jYJiz7DdDg474M6QTMP1YVtROkO9k1b8kI2CsVk02
         8TCR8jX4wFqpa19GnXsa/Qnu18Y3Jay2GPal7rn/t8n6lXsLQX5fiRjai0L6FGEc0oJk
         QbGK15t4Ky2qxYOpLBu1jF0Y8s4CQNUuc27YJKtIrC+S8IIhucr1PiqjJxu/wtbkQ2kQ
         jm9op7zJiCwQzc9M/+Hh9CTDTyPHyWwkqeirtCjJHfHgNAggBHmPWJnChGAOaywR4F3P
         n0cm/fdOZs4O3b9LXVFYB5ommKzs8QGT+bCwLpgfFxaMtXonWQvO3C9NrMU6saCQ7/2E
         kl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478541; x=1764083341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=K6IWS48rofb1HGQqKV1zLo2F8orDMR7yTrwUbduRaaLQ89nZgVQ+dlY5cM3j77TIEq
         87QQcLRrgBt5pyjexlomfnZFtswWfa9YAgymwdy6SIYvbWRmLlprze515qkAPp8iGZPH
         DJFqeodT5XSmF5qgED+lqFnN5G1VSv4KiXZgRNm3+Ne8ze7TAFVRS3h7niITns9HmPLZ
         qeuOChuaToM20EIBt6DYm0B887VKp6eAldQyPfb/vxjx8llLI2chCgHxWjAV1lcNZ5lB
         1u7IK+pxbAsRz9qgKP65KXRKOcBxmBRk/sI4g/qbidfsHiI+eVTS2VUkIHJvKiPJcj2u
         K+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlJO1TrGDjGSIBf5+NJ++Hzl7xBNkSvfFnq+sY/V0aWzbeB+JNX/w0azCSddTzT5AFPMnFYWLjvjQbs1GNXXJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxcmhVYJfdwDDZgJSOYsmyy3LJ8jkEHD974LHzBGSwztKcWQZ5n
	GSn9MNbBmUD0xSvsq4UFy6+69CzphqXGbMGc20fsOBxqbWiBcapByFwt
X-Gm-Gg: ASbGncvSu/59iD5yrlmN7B5TQgJDu+g9pe5zBg0yhzOUizTneqpy7Zys8EX8jwN/N10
	gEuKeo59xpncxFVa6gkufLibvTmujrX9aTFNnxWtViV/0vHK0VKHGaz3wSOA/NbE0r2V0Ld7qSm
	PNsG73GfVAwo0bIvkLGMDP9uwICbUgOSUQ8e3PojXBumL1lvJ7rdGHO/WuiXsqp3S6tKQwHAW7x
	fhSbWSgLJvyPcuIxezKEdJPw376PueEFThauXGG4uPMPHZRm1SfGbV9AZ/cDpCOOpBVafy50Wtu
	xwB8LRcHsoiOrjNlEgsXmAioM0hwBKKpZMmtEK4yz6GyRBtMwb0A4EHwwu9AC9wPDmJ5Yx0SQ8+
	hIR/tIa+92saIgDunabk0oM6d1L5X/XYywGq8cMV8blnbgNWcvyfbr2JYNtJH+mrgGClLLEUHJP
	ze+y6zHdEKd3LAzFG4vqatTv2JA+sfRce1cIskHd0/GDfesVRNJmnrYj1x/BdZpC2yDLA=
X-Google-Smtp-Source: AGHT+IEav3zLRv8xfizJMoA6AzANIil30gdXqV2ruo4JHsyCzceH+zoUGEb+0IQGqWiBDCnkBR0TuA==
X-Received: by 2002:a05:6000:2083:b0:42b:3867:b39c with SMTP id ffacd0b85a97d-42b593745c4mr15995888f8f.34.1763478540535;
        Tue, 18 Nov 2025 07:09:00 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm31825235f8f.33.2025.11.18.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:09:00 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:00 +0100
Subject: [PATCH v9 4/7] dt-binding: memory: add DDR4 channel compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-4-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070902_526209_7C498D29 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add in the memory channel binding the DDR4 compatible to support DDR4
memory channel.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 9892da520fe4..866af40b654d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -19,6 +19,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - jedec,ddr4-channel
       - jedec,lpddr2-channel
       - jedec,lpddr3-channel
       - jedec,lpddr4-channel
@@ -61,6 +62,15 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: jedec,ddr4-channel
+    then:
+      patternProperties:
+        "^rank@[0-9]+$":
+          $ref: /schemas/memory-controllers/ddr/jedec,ddr4.yaml#
   - if:
       properties:
         compatible:

-- 
2.43.0


