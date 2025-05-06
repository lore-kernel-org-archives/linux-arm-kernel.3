Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE378C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO2ACoq9K/NiDM+5zyO8LOqPTK7/saDpFlE2IMUvDMI=; b=ddQam76Jjk6tPq69YJ+u3hhxX8
	ltgExdaz/7Lu1DA8q8CzYax0Re/0sv3GGSR3dOPwyOmMPz4Yp0r7Mx8ucX/m72mFqPXNiRZBb//RK
	CEyQVQeDzYu+LpwcogB8qd8rlgP7AbAsxz05jojI13H/K+XKcCpRaeD9+jIqu9R5FYQ9wKkIknQ3o
	Smr9YvUauDgAlP5qt8rL+GNBPx4FsMQBSrSUXaTTCA4g2E35Wkympvj8riXez+KdvaJBzQ25LtyBN
	DBB0bPES6g2CmU5AjPtzttL8K1QX7JhnSU+/FCYRvIIj9wl4H6lcN+nL3FayU3t1i/guxdZGTz8Dr
	6m/LxZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLkW-0000000CncE-0DxR;
	Tue, 06 May 2025 17:06:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOQ-0000000C88P-0vXQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so5929033f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538288; x=1747143088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO2ACoq9K/NiDM+5zyO8LOqPTK7/saDpFlE2IMUvDMI=;
        b=WUPsK+CclLH1BBmMBB6HpE8R2tfv66bDPTUYkBIwO9Ko/6uWE9e5+jn9CvfttEnOGt
         mk+qG3tO5lMQlPnjS+v5zVaCYnWInasLtRWuvZ+mm90IIcRbKHKz9YO3qKTSoa5X0/MA
         Gv5zu4DbXPB0VBfSzppkXEP/8y4wi0/4iTSHoHi4YbnsZue4sXhA7v+/VGJJlGuliZEp
         +MHPRsf6Glss3uCB4q1wrnsheIC3h+RU476LJ46s/MSc1F4RYyj4USKEzyEdifgyZtAY
         d4+iZwqiIU1JQyufovvbUn0ABenMD7ZAElvKdQQseYcLSOXBVrjRKu/RufKiuK/QZAtw
         WpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538288; x=1747143088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO2ACoq9K/NiDM+5zyO8LOqPTK7/saDpFlE2IMUvDMI=;
        b=DCWU6WboQKqQ0u0etVVQmPpP/OTLxpRtDO6y8A2TrJ6dVjCanI2bY9ZEu7500unF8Y
         pkXO6pVGhJLAbiWXerxSAfBp4lqMGBpogt8ayIoF3sBnSB4/K2dNchr67p7BKzRK/Y9e
         K7RZz2OS14iuEsyMAoDFXK8rcbqO6Ljq9oaVD0QwXqTHKpcOQ0aTDqIvEyQFFrD+EWam
         EgXv7CYVfFBhSnFnaDjrEvtO9EoKiyapec/Xj9qg1ThIamoRiqiSbNEQ8FMm+/aqCIB1
         8alhFZCIchoCFGIJxjGH84C1qyBcWnHUxaFQu75/7m2dfbmneE3DvVp3jDCh5IKShFPE
         gy2w==
X-Forwarded-Encrypted: i=1; AJvYcCWV/0Z0n4Twp54/VMWcOQnQFENH+Em0UIpQO0ytnKKeRTvtPRmsROgsPjtFXLIKPmGwZO+7VfXzaYU4/alCpPmH@lists.infradead.org
X-Gm-Message-State: AOJu0YxVop+9KiPV7GMjksxQX1rPsP7fTu6FjqesreBeSRoueJ36RljZ
	5S1Uuoh3H8QB66uExcoamko4twkzRWsvUsU5YkPB6O1D4JH0/gH4fYw2yQ==
X-Gm-Gg: ASbGncsMT8zqB/9auzz9kGboT69dT6ELTGbgXyO1rYARAngjI70nzmNwGfPMNIMH8/E
	b76qhP19k9hn/0FIcotjeZArDDXZlmo3+TribOUCawgaS4PsOwnWVXXvdKE7JTAxHouElJwQV64
	JsTM8vLXVLnxPVpgyT3ueRaE3Bc7nczF1QmRcSbGCrKd+CNG6Ny8+iKLr7+U9CpAJW9Xq5usdkA
	hzG2SoLYx90qZ2okgjLoqZBZH8XbBlcKEOLgM4hRa7TRBnZzNieLRRo43mtXGYjdAHB8wJZxY1X
	owmrRNH/sPivWoHfZWGk5VMp/of6aZbt0cCtwMwrNzAK/4dV8nqf+77I0rUQZfgZ5X/N27gEuF3
	hD3Cn8gXg1eUEqz+d2Q+Ps2n6o/nei/bG
X-Google-Smtp-Source: AGHT+IEDaXH62KwwI37pr4wDfcFSHeSXONX0vaETDZcKfgUX5r54cbwZDUoUROuqlyv3IXysrdKtyA==
X-Received: by 2002:a05:6000:2501:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-3a0ac0ec351mr1987214f8f.29.1746538288382;
        Tue, 06 May 2025 06:31:28 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b300873dsm638165f8f.78.2025.05.06.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/11] dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
Date: Tue,  6 May 2025 15:31:09 +0200
Message-ID: <20250506133118.1011777-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063130_266164_FDF21234 
X-CRM114-Status: GOOD (  10.96  )
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

From: Thierry Reding <treding@nvidia.com>

It turns out that some instances of the HSP block on Tegra264 can have
up to 16 shared interrupts, so bump the maximum number of allowed
interrupts.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index 2d14fc948999..df6784a7c96a 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -76,7 +76,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 9
+    maxItems: 17
 
   interrupt-names:
     oneOf:
@@ -84,6 +84,25 @@ properties:
       - items:
           - const: doorbell
 
+      - items:
+          - const: doorbell
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+
       - items:
           - const: doorbell
           - pattern: "^shared[0-7]$"
-- 
2.49.0


