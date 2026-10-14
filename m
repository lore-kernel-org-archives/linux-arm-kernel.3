Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3855CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=; b=cAnCWn6pfUveU7DadUTQ/RMwhX
	n+FR65jTigNr0a6LnbtwioGFm298ni61Y9kThNgYnAytoNxU4AHL+A4rxQEJ9dN5PGOwAjZ5usEFo
	XCfHlcoRCX0rxbGqUxQki8Upd12eKc5c/fW6K5mOkE88ky7VNTM74OH+oaQzvejxP6dJEyH4dt+OP
	blcY8BkMWetv/gXv+yMwctIFBYIC44GHYTpAtiWoSooMo/hTh9SilraYkcFaA7oLa8CAxJly5Qek5
	ZFwqK3HGWdSaxWqbrucSxecTf9LJkBhAh1F9MRveiiAf6DyKneTus6CQIj9fI1olcaf4KGO5/DTM8
	Za0Kjahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37m-0000000G6gr-1h67;
	Wed, 14 Oct 2026 17:50:46 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37j-0000000G6fT-0XON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:50:44 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-3abe4821449so1755238a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000242; x=1792605042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=;
        b=F6xc5BNYwi00n/LLnFQBxs28jJoN2d4AhFy6IEepBcB4iWabWWKWO4QrIXSZvjYze9
         BtdbN/zBSy6R7Wt/8tixIDx6HuOjw1qg0iuN2AccG+iZ/JRtRoDCAQNQBtLyAePXIZ++
         LGeIg+VEcP06BV53nCsS6n7mv6Hrt+hWUFXAmHAzqpkc0d7ct5sGKUsi3/2UrqX/Lwg/
         p8xYBkf3kaL+GXD5xUAUkOdsvSA7VZrIU/ZCuVt5lJMcg5DHCMPK0VIa3WW8hzwfL5eM
         hstWNan3mkUDx+nkjKJenwTqT6//xzHEm6HhQmBnJrgg0EyAe3VicA3/SYPC7MyMIdQ6
         AsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000242; x=1792605042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=;
        b=G6ba1smCCnABUFPYLJnLEusRFdlHFZOgkLym2taz+PBb7TI16KcENwNIirwWQcBnMR
         OO4cvC0zpu3t3yjA9NXawdEo8aTmqSkeoxDyxXtftBsKN5weTlziIP2/vSXjZoSYDuhr
         jYJ3YOBN4BP418VkEDr1q/nfwHwwOHKsYYGwstYoiVrHv7cy8dJUp5gHAFcHPeIVX18q
         LV8uxW+4RDkFyKAz/i+Dt0bWpEFVl7ZBohgRAJx8U8KR2q3MMTKpZc6hZ0/8d/WINLOP
         5Kc2IP7SYxoGqHAEhqcHksf2B9oyuZOAoGMzcNaFkUr5Ar1QtkBfnG3F/opLHJPER/xP
         /ayw==
X-Forwarded-Encrypted: i=1; AKwUvBwYc5ye77CjhAQUhIuy+r4aek/56ZBa/rOxtewo2Ca1TSv6IsW2a2/kEI4Xx76zXZ66xwM9SIEi2Bh0Mgd24pVE@lists.infradead.org
X-Gm-Message-State: AFq9FYJCBnGxnSBG5XEsGTRgf0vORcBKFZJQoJkw3tmtDTozlw+ve0WB
	98OhlVr0lQmimvuVK/NQswOBQAzaPxFjEjqp/MCaox4d9p/DNUsUU5VH
X-Gm-Gg: AYBFou2N9zgIhzNe5UJrrQOsJORjIB83u3f6QHjBzM+qhKMU3fPzUN9vQ5uTEsShgVa
	8j04VsJLvwR2DKsszzFwww6p7ts9kzjildQc6jbuHwKAbD4jdpXBC2U+ccEQawTy2FY78pKr8dz
	k3Vg3FTXtfSJw+yH7Z5QzEquCD2Kfa3puTTvVSscnY4ueK4q6hO/9CrfZtj/UnlOFksuAfKlPlO
	+4B8zvXjs87gR+CvPUvMNgg29v/oq+FGspdyNSMWKeKu4ik0+389mugewGelOGaBhRP5+An8lB8
	CBcPfQUepvBu9Pl0syxDeQOLpwFmR9KZPyz65aIoV+rrD+dEu1vEg4VQ4MeMPcXH7LorkdHSYT2
	W1JxzHCgwFzGvD5TO6NwKtw3lJkF0ypHPclR3sAfZHzb0Ke0uxfvRBXhZrtIqiVc9XpWVBKmGz9
	d1q2ewn4I8ODpSLm5LzHkVMvyEda4qcHT3u9+N7UC0kUsQwFl4PkOm6rahtsrU3zhl2bF4YKGel
	3z5hiGnl5Yw2c8AI5eD
X-Received: by 2002:a17:90a:d44b:b0:3ab:365f:ebdd with SMTP id 98e67ed59e1d1-3ab3ad2029bmr13240853a91.37.1792000242195;
        Wed, 14 Oct 2026 10:50:42 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:41 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:19 +0800
Message-ID: <20261014175020.62907-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_105043_165518_9A3937D7 
X-CRM114-Status: UNSURE (   9.22  )
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

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Collect Conor's Acked-by

Changes in v2:
  - Use 'alinx,edgeboard-fz3a' instead of 'ebdee,edgeboard-fz3a'
    (Krzysztof Kozlowski)

 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.56.0


