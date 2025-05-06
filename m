Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE4C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=; b=Xy3rpdBLgBfK4UHt8oz5Wu4d1p
	Y4yhEDTAIg6zvTLOH5S3P5kcU8YJ8SCSqimLN4SsLLrQS27qeAA8WAusTxi9A0s8mhKPotJsUJKKY
	lkHLi9po6umZHe6PH8VyljyrtedcdQm8UIFJn10CszJfJuhqHm7J1MMp/9skLPKhklXfDFl7ZmAMm
	5PFfQcsJ+miZgmV3gotN2FnSCf5z8e++gtwwyR1CFNRK0+baEk/j4+SbeHQ9R4C+rfLEfnvmIZLhF
	cpspGW/SsIujICDvoogdwHkkPOPNb83li/e8WIu8iXZXmaGayS9zSU9oqtj0+DTM07f17rHao9Iz5
	4yX59OJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGB7-0000000BgGc-10pu;
	Tue, 06 May 2025 11:09:37 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEg2-0000000BOOn-048u;
	Tue, 06 May 2025 09:33:27 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso90410226d6.0;
        Tue, 06 May 2025 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524005; x=1747128805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=;
        b=IdqKZ5z+QIVQQx6oDgou1UZ72MQXjN0dsRcqQjmCI/4ev21GbDWBLT0r9za7eYeEWQ
         bAx5sCNEpSi/sEPRH/gFoW13D1WFtcCwm8GwdN0FERZdnmyHcyMZwXTHp9JAxa0rHWzl
         cqSf4T/UcuEtV7whyG0AdS3v296zTRin9wfA2VOD5nQ7BLf/beNsXid5GRQShHXssPnN
         IAaSeN9NUwdE6Hd4UnVqYPMyzw+GKid58BTOa6+BnNP7BOJnKAP92ynMMThFRH+TI/5t
         Nwc4VpT3/4EKkI1WxOL/AqUMRv+QwEmWAkM2QlEbqBQivlDbmADVUVg6aCfYcy9ntlZj
         cPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524005; x=1747128805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=;
        b=S/K2xMRcYrjSoEbG+LfZh7noFCCGjQ4vCHTIhiJIGqt2eEFtO3a6ZpvdzCYqoxKefl
         fbaHGnhrMDWd9YNyn7em62yhmpaBuYKaU7mZXxOm6y5DrqPHEPt8vEyCkejGYejrrUmB
         sFq/Azc/mfZTLZm4+we8d3SUBEsU15IQcwq/RXmjd+cjh8/NA8/4fpScmT7knrcEfKMw
         md29Uo3mtQjChFz3fYGlpfNR0H3RG73pVxeWtuKYHk9izNIVLpXqd+BCX5GfDaNY0JNo
         DarHtOBV4ZIIDZfpKbQ457XgX61iCkRVZyDPpWwXdKRJxS4cNCV+sfXMeAXbBATo/XK2
         KNUw==
X-Forwarded-Encrypted: i=1; AJvYcCVWuxWu0zEmuPiiGcZIvINgqcyyZwf5fF4wO3e4lu/mMFAa1rqa0dQzbD/Z/7SLqNVjxj+5hSeSnOkEjTY=@lists.infradead.org, AJvYcCWhy3VNHUKROo+ygC0MeVYqOUwsKmb1k6urdCsTi6oa80Vq/Bpy3NkfgYg0yMbD2AixSM9qXLpS9mlaa6Nc3Pwo@lists.infradead.org
X-Gm-Message-State: AOJu0YzpYf4gnsw9T+NK/jceg/QaFkOk5c+B28yR/h6jDZFQnqCkzSTY
	8mmLvNTk0hQBMcvbSQR3P212PMphha/Ik4qNtJEaHWpjGhQXfqQL
X-Gm-Gg: ASbGncvg3610gGbDyqQ7jh/bE6Pb5sd1JhXm6S8tb4WQmqtwltX1jDwWQ/xBkVFFGny
	VzXC432rtPNbbKweLVmDi8/DAkZjVVqLf63nqM3m2EG0z2+U/xRP9j+u6oXPIF6rSdGaoPIaPGd
	6PJcAoRWylVCdSRxRWiHbm1qX2z1NhRkCirXu8Dh69scd9+/LLyxzPM0KK5GSXcgYEAT54AIlOw
	br4bq7x0D4363bSLX01jslxUtFUAv52vLOLlMBQ5f0kv3qaPVhbrlUog8v/UnGIsCjpOGJOyiuz
	D71aQhrlgqmFacPn
X-Google-Smtp-Source: AGHT+IHQ/VCvHq3Ers+/VvDGnzDvxmpNMck0lZ3995KP7lY9UpCWzOawDdcIMSjGwrUnb0SUUaU/qg==
X-Received: by 2002:a0c:d6c8:0:b0:6f5:3b8b:8d0d with SMTP id 6a1803df08f44-6f53b8b8e44mr12554866d6.20.1746524004730;
        Tue, 06 May 2025 02:33:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f3b1fbbsm67539166d6.15.2025.05.06.02.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 1/4] dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac
Date: Tue,  6 May 2025 17:32:51 +0800
Message-ID: <20250506093256.1107770-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023326_052596_A6F7AB76 
X-CRM114-Status: GOOD (  10.12  )
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

The GMAC IP on SG2042 is a standard Synopsys DesignWare MAC
(version 5.00a) with tx clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..f16b49da6dbf 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -30,6 +30,7 @@ select:
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
+          - snps,dwmac-5.00a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
@@ -97,11 +98,13 @@ properties:
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
+        - snps,dwmac-5.00a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2042-dwmac
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
@@ -634,6 +637,7 @@ allOf:
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a
                 - snps,dwmac-4.20a
+                - snps,dwmac-5.00a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 4dd2dc9c678b..112b0b2a1524 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -15,14 +15,19 @@ select:
       contains:
         enum:
           - sophgo,sg2044-dwmac
+          - sophgo,sg2042-dwmac
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - const: sophgo,sg2044-dwmac
-      - const: snps,dwmac-5.30a
+    oneOf:
+      - items:
+          - const: sophgo,sg2042-dwmac
+          - const: snps,dwmac-5.00a
+      - items:
+          - const: sophgo,sg2044-dwmac
+          - const: snps,dwmac-5.30a
 
   reg:
     maxItems: 1
-- 
2.49.0


