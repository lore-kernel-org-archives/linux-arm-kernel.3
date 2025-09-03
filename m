Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED83DCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqGQhSrmR9KNt2mlgrpLBIlQIaWDRnvltPL/Gn6wm7Q=; b=pE5P42BEmdjBhVtJeuvhF+8GFq
	sEeC+op/HNo8QqR8WjhQnt9/SwmpaLRc3rtKTd4R//aRXOqadF9LVK5BDOI8IZtQhOO4+ntyYTcno
	lwadqIBEjxAt+STlmjbyqH4cu5MJSRHzdXBwn3w/PVgxO1RXr1a9lhkOsnywj/EP6JLKNjtG8yKM+
	pXLKCAoTYY/ilX6ZFNhVOc2FRnGvg+NVk9ctoXJJkubWZA+whKG7oLQWkcm2M1PZJZ8XUhQhRT3hm
	fF3ZO4TR/NwoER3qqPrk8p+1XffxXUcPbrgEVkuNt/b7O9EyAWW6i8oVVcOqsZlnJTx8i9krtDxB7
	rGTK2TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utn1v-00000006Tzl-0oZS;
	Wed, 03 Sep 2025 12:56:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmFc-00000006Kcf-2ifK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:06:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4e84a61055so2328904a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901168; x=1757505968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqGQhSrmR9KNt2mlgrpLBIlQIaWDRnvltPL/Gn6wm7Q=;
        b=avU+Eom7D8GaW0Aro4FLn1EZHZVigYVB1Dl3eY80QOl2SGh7imy1JHvxwP2U/tjHui
         LwZQdZilVHyiRVKUDbmOluA7QPY6ocogVbarwaWGjeW0Q28aKJCQQR4gmmBrIDFA9m+v
         BTNpEb1xhabV+AG9bIhRlLpUZs5Rer6DrPTW+FQ2rgPmAZk9qRPuLL4FhfQXQ5C24O2W
         ILAwHLHRhuqWhwc3jYmcWxNi8sH46KJ8LLgfjZYr48n+dtUi3foaIl2MvpkRJ8eWjsAw
         ch7xH5W2TxiM6hNdmJRSlI5t2MhEj/4a7dGgiag2yCIbhxtFDTLf8gjW90RuzEv5txZN
         FoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901168; x=1757505968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqGQhSrmR9KNt2mlgrpLBIlQIaWDRnvltPL/Gn6wm7Q=;
        b=CYWQCZ+pbhXUXbJ5Dri1sVr6/90nFQyEtVRoO1Y/GwSI1tq0YE2ZyFhnVmE2UGR1+G
         BhGBuiypQvWByUgYpOqw8eiC8NGEcCGbQEikd1XUv6YLge+zJskBOy9a8bV7kGwVUdEe
         vM0rI78tNPW0vSfbZ2hyL/DTNHr8eaPjcyI0TDU2shcev+MCzNwrgFQPx7VUGnfKnQvc
         Fe0H5Kio+AvjtitlAHQpBYjAtaSKwoaja20ghsSvCMdHXTVzn3zZt5KfR6RHmSABwiRE
         9VBQhXMjGaB9AawrGwHlxE4iCjCfvpMErJFe+1Q1oRQFUxNMPJ+9GoAnbZRGbegXy0+f
         on8A==
X-Forwarded-Encrypted: i=1; AJvYcCX9ahsRrOD/foTYMEcTUqrt9QvZNmLIyVyxn23PQCRUGYVLAcpWSFs4iw6rHECylRhkS0EeYtWYqDlCiWj6kf6/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8m6ftw8fZGX1mAZaWdnP7+Qk8xaN44xpME3OdwP9+x3TjIEoG
	cU3oDQD+dY8lW+NI9iycLNmoWRNhKJpOgBCgWEGFfJrmHmaPuGDu4peN
X-Gm-Gg: ASbGncv/c5GmWRn1kvIQNLpRajcQV7IkQ5PSHmsJwOukUAVgeTqvKdATP+oXUufyIIh
	/iBNI8eIvQg7BRSqUVqmvtJBNgxFO5bumCKkicQKx67BivvXXxM7KL9F0X5OxxMsprGOq9wMrWO
	1rtH+52m+GtD/oiED4BNA/oWc/9zzXrGKwjbfMYXMM6wd9pudRqO3hkoorvGU/7IBiOAPuGPG10
	dGnBfErb8UoS2fccRXf7l4r8H6x7XNf5FkkLItGpk8YWx/d86RiAsWdKtWm7fwFVmk+IheQB0dt
	3fW4wPoYYi1L9anieEket0SDno6erzvtBaDVIZcZxaI7QF056POJBFegokoI2msi5IuL8kY2RcB
	I4YRqxfOLmuHjcWCI6M4WCBicGZwffjQpcc8A2COduKPbFIX1DJWH/bX1YVg+lUQkgdpitVVvq4
	BMtNvgadRGb5rTPfqyJ30=
X-Google-Smtp-Source: AGHT+IGRwP+2jhI7HlYV8PivgRIYsoYupEDByvIyv5rCdBLRIMTGG2RxKeItgA988VxEJG/hq8+L9g==
X-Received: by 2002:a17:903:190:b0:246:e8cc:8cef with SMTP id d9443c01a7336-24944870a4emr227499035ad.3.1756901167713;
        Wed, 03 Sep 2025 05:06:07 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490648c89bsm160905185ad.109.2025.09.03.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:06:07 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Jerry.Lin@quantatw.com,
	Jason-Hsu@quantatw.com,
	yang.chen@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v11 1/2] dt-bindings: arm:aspeed add Meta Ventura board
Date: Wed,  3 Sep 2025 20:05:59 +0800
Message-ID: <20250903120600.632041-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903120600.632041-1-pkleequanta@gmail.com>
References: <20250903120600.632041-1-pkleequanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_050608_684193_1F55A5D8 
X-CRM114-Status: UNSURE (   9.41  )
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

Document the new compatibles used on Meta Ventura.

Signed-off-by: P.K. Lee <pkleequanta@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..1eecb4b69fe6 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
-- 
2.43.0


