Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B4CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXZqQ6drOwBvtPC0IyxHBKgG/jQ2WfmdAaB2rXR8h70=; b=c0Tk55rk0JxL10H///pQUbGjc3
	k/3PC7tDBQ4tImXhbS/HPM9Ok2iFthpbWkBRWm8fVM8uXpPQ1ByNjdl5bIu/C8atzJferCUL3d684
	OipZ4jdXPkSMIm7zQsrWHI8tyjTe40eZ7sHk3tkwjuVPErAMyimplkJ2HVjueNUAr6Pjy/Iw/r8AT
	D0OZDelHOvHp1DRF3eWJSLPk1EFeXoJYpeLs2xzo+e1gu6Pr4pdo8n3COLpjTYC5rY/QJcRa1Vro6
	gvfJF9rjvAo5BC1kz00ZYuFYuYCe3/sG1arEn/unQkPP5zIU0BBPbjgCyX1WdzumPQ8Gv6Gtr22OF
	JHaSz3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw62V-0000000ARLa-3Q97;
	Tue, 09 Sep 2025 21:38:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw62S-0000000ARJZ-2SbZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:38:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so25502545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757453887; x=1758058687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXZqQ6drOwBvtPC0IyxHBKgG/jQ2WfmdAaB2rXR8h70=;
        b=VLtce6xm3q3ufyaASsGHG1Xtf76qcmvp5HEWbMbC1CgsBEdVtG5gd6B4OEG8Gn9/sc
         m7OMyqz+y2Ss1RhlWijzzgL2ldEJ6mWbtx28HGkuupkyKyaRw6s9J4RpdOsoOf33P2EQ
         DHDAlXUVdV4DHhMPWzW9yMcw4tU4CSfHr6Yhvouk8RLbNvFJIxtF+MXy8nCsg20KIBTc
         1r8TyEYL+ifxd1hjDgqU8DIAI0QouEdgtwfrQ0u9gVdr4gdmhXvpZnJA0m/UwZQ24HYj
         DaYuda9k6wWZZoXc7sNHQ9mJjiOEcM4WB7CHcFBsDR0hD+oUHBmYmmL9dqC/1nAZjL+z
         DB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757453887; x=1758058687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXZqQ6drOwBvtPC0IyxHBKgG/jQ2WfmdAaB2rXR8h70=;
        b=jkGjtuqUKtJhvkPtCM+SP1bwsoAJhyE5KHYxPZiNC9sMLzdmBB5X0jM/YyAZCRTSo9
         /sWGIFJ8KryOR2VVzIEEIMOzKADqXQ96mRM6NAWaS/0V6Hhbj9sC58bEkReeuS6Uwkhs
         ObrCkMYsf/8sostpVP7RxzykZh6Tg7krfFKxLGeDNzM9lmMnCwD5CxHy3ngpAovhMFRh
         wMnvAJAPY4rWRqkdsJZmQWVwTC06GEXaksbWlQktRUrYJWfCfYs0gYJKiw5Wu6B7xHyL
         NSQsHe0CXNaKjwl9M6O8IOjuGJGeRE4weSk0o/x71gsoNBjUZFSPoeJUSj8KLVAYDqet
         kNbA==
X-Forwarded-Encrypted: i=1; AJvYcCW23AkgOE9erALCILltKJGKSh+cqQfsL5E8Y2tlk9jccuzTXHn+O0r98AHjOy8P2vrCoPTCBiAXez2ZaqFRqgtT@lists.infradead.org
X-Gm-Message-State: AOJu0Yww5GcydzRw7YlF/MNsONgqagwWU5lQYpdmNHMZSnaWuml0KQrU
	P5NALaeBL1hCa5YApwxoLOtXniDLv3jrpVUodPaink2L/X+rEzjc1uzT
X-Gm-Gg: ASbGncvHn+QMBanqmu0ChLilnVEztPODaqiCRu60YvJBF3CEjhDSpXXrV38xrUeLGQU
	uvDfqJWH/i1Eetb77vfCDsdP+/OQfuco0Qvj/Ezv8D1bTki7K5ANNI4X0CYF3hhRJs2BszTdTEe
	n/iZY74iHOw1FLmS3g1G+EUic+47vLl+2qugSMOZL8+L4iwM6F/OWR3uGX+gQsCb3IHLRbdkajy
	HvE3O0EOQqSSI5bnHg3AeJyLWgm5tF1L1dAvB5BKTRBtPbW5zCsRMFuwTQX+AqdhYP5Esz/CTM/
	75G3c7NsSgwIKnBn9K9GNrkcpWTjyrisC9XL87uTsy8+vCiAnaRJ70OpczVbO8lLyClYcoMyuXo
	zXZ9FVyiN1zfjVkpENmKrTZWdqviZhPnQEb6a8Hf2L0pWBEWkRui5dYjbZ04j9flauf9L
X-Google-Smtp-Source: AGHT+IGFr2W5XNaCtAtSPeMBbVjp/Ht51W4UIIz6VlgzEHG2zATsumVqb9oE8i04JOPAV6L7BQ2BAQ==
X-Received: by 2002:a05:6000:26c1:b0:3df:f7d1:f8ae with SMTP id ffacd0b85a97d-3e636d8ffadmr10185808f8f.4.1757453886663;
        Tue, 09 Sep 2025 14:38:06 -0700 (PDT)
Received: from localhost.localdomain ([151.84.244.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81cbb08sm2315165e9.2.2025.09.09.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 14:38:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Judith Mendez <jm@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Tue,  9 Sep 2025 23:37:39 +0200
Message-ID: <20250909213749.28098-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250909213749.28098-1-stefano.radaelli21@gmail.com>
References: <20250909213749.28098-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_143808_640610_2D6F123D 
X-CRM114-Status: UNSURE (   9.54  )
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Judith Mendez <jm@ti.com>
---
v4:
 - Added Acked-by
v3:
 - Change compatible string to match existing mainline format
v2:
 - Add symphony carrier board compatible

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa438..1cdb6464e920 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -106,6 +106,12 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62p-symphony
+          - const: variscite,var-som-am62p
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.47.3


