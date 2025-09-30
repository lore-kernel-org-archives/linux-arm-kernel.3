Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42783CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=; b=oiWMGAXQsImb1sQIwJfhgWLcP0
	+Nwiii5Kj7cpeWzOsLMEYRw4hPYHkeXBHjkpINp+zX8KB35negP0tw51oy2eCn4KWX0mupOb/W1ov
	WpIgS0PFds5GluhI+qVByIHKqrE4yGF6j+n5kOFuunMzzL+CKAkAi9K9Owe5KwDKTNLWvia5kfQsT
	X15ceqhY8gkI/q8tDtAAR5qoIwLVrnWtK/3QucorZaNugoUjBCIxlbMRGwSdDHsy5pGLvrHp3aPF6
	e1kzEKxgRyN0hhqhY4Gf0UCymStZwa6lwEQchsHRpqji0s5xy9og1Lpod06zh8sNWZPcrjyNK4Uyx
	onYwBrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0j-00000004gqe-3o0s;
	Tue, 30 Sep 2025 08:47:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0f-00000004gmj-47g4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:46:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so56744805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222016; x=1759826816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=g3zUaC5ksRukfxc11HwqZ6KBUPlq2QAceRIAGeWmxVwXxhJU6rfn0v5XqLC+4jXncG
         i9D+aQcwLXXNuHNP9G/obNwT5dhCU08YCkktRj3wZbOSueODxsgg/gB4iekfgu+8xVqf
         DF6TU4Likrkp0QiIWpkZpVKHzrfvVz6resmdxh1hlIX6CIQpucV05r+bwmVJUb+lWRai
         hrHi85t/XNDLJ1ZX/4UbqtC6OVidcfOtZnVRn4BxyE4Jv8pixnytJ0ryn0hDa53cPQ3O
         Os9mOkzkHzzQB1QZWjsDacHjEE8V9/MXa+He+Xl0F6YfSe4XRhskYs74FdmdEQeDPOFK
         pMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222016; x=1759826816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=jJUQeYmehERE//JvXNwwhV1fwXEaUCSk4bof5pBl1YOmXCwEaVCECtRvzY+NShv5P6
         KQITeN1HudACC0SosIVfOS2qAZggGVwdJkeFuOyKKv0BSzgJS0u/YB0C+rMwzv/CyBXg
         /3WvvqXUHT8knU9hlvJOCQUYA0V/PL9xk6+9UzzPPRaQKe6rMeEfwe0uvP+Y+K7fEWF4
         M8nzG55C+fvzW5qt4lW2HmG5J96FBJZsMQpCshmcuuX4d9eMpPzABJeFZgc3AVBWNYwM
         OiFvQTGqAMbuCpvmOuvyBDAJtO09R/IFEfa6bv3qPnqVI3DQzjGswtAp+ailFx65G7Oz
         PmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv+yN35/AA1+oUp2OkK4sySQ0x1cAri74n6PZPGvvAimic9Rb6QXEwdpUGF87WxwV+72QgdAOHdAAf1IZGdTrP@lists.infradead.org
X-Gm-Message-State: AOJu0YxIBikT24ElQEsNEWAX9rdEy1iILQCx+U5DBSx5kz61852cFIhq
	olxbUmY9fy53eLFZxF6MepTIA1W4COxfPkfZNpOsv5QEh/B09jdFW7H2
X-Gm-Gg: ASbGncvsLSQJdJXQcRwyW/EkAA0Wr/18X0QIN0Rb2nawEIZJQgh3+Y/OtOSxbdqB+WK
	yrND9mFMi1gsi5B+oo9JwAjpV9RJ6Lywr20iDlKVcN7OUhx8gg8Xy/I8ZyJTGruIeZ2NP68/kwc
	8l5FhzZFAa75PdNONnUl2ZkySD84XSDuEFYxFddybAlEtlVo2QGgeoDFSGOlnPZaA/O1pJc1C1o
	EY4aHjFekp/flBcJ3kn52pyjNGfnr2NOHQCrdZunFD0dw5qwHvAUv7fxmYvn38GTUmZxRYIOVDY
	4WEEDi4uEQpCyvtMWc62XzRNDxn+tP/YW+di1rDH83H1UlUtrveqn50YE7MJZPqEMB072d0i9gj
	GrGqeQeZ0QY8qZOI+AZDVaVGjME/m+a9K2vKetoD1YaOc/7t2ZzVB8o/46B9CKFdYoAd8lL07bU
	RdcWQ0LKjVQCmAplM5b5xhbvaWTQ2JYtcVkkWfi68QjluFQ55L5Dc=
X-Google-Smtp-Source: AGHT+IGVQJJHamU6NUy4goartpYaIkfUJZ0iBlzOkN6u19q5qmKKBnwS/nG0zfk91bdRAJZUfDhusw==
X-Received: by 2002:a05:600c:1d16:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-46e3292fea3mr191174625e9.0.1759222016056;
        Tue, 30 Sep 2025 01:46:56 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f536a3sm54098975e9.8.2025.09.30.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:55 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:47 +0200
Subject: [PATCH v8 4/7] dt-binding: memory: add DDR4 channel compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-4-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
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
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014658_067285_ED4F2B9A 
X-CRM114-Status: UNSURE (   9.70  )
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


