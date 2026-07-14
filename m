Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=; b=ZPyzj3D5E9TsnQFVe9m0KF4cQ9
	KaHGpOFq6L28iCeFms+8Q+Fqm+22xcbmzQi9vBx9n/8HcbX8wfGkZ4Wm+rObV1jUenaO8IrqeCFLi
	CEFEBaacaDGDsklIIOqSyDkxc+pO3sbJfx1CyOBRxJLJWNsL5t4RLhF5t5NF0GWdQVFa28qfXNWBb
	vAW8WV88BNEYIr3bRrJOhgoxFPVJhyl7XdLowA9PWt/+yGhd3sJ7lCDv+wi7RvL42/bQljC5A+sQk
	59ccKojnpl866py9A7MURkdcMfl9UbKLCjpaf02VtSxZphFc9P3BVV/OMXgvVAIiQQP1/FG5KMV/T
	94X1eOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVn0-0000000Ax6I-3SvM;
	Tue, 14 Jul 2026 05:34:42 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVmu-0000000Ax20-1FQ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:34:38 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3570602a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007275; x=1784612075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=n3Jb7ewvk8teaitYmhh/MJwKiuyNac1CBMrzUaWMCOYUxb6cEehrBk3jmWNt3S3v4V
         Kwxz3ZEabMpyYPjyEMwq+4kaopG0OXHPOYphNf+3d9pxHNAW6+mB2zNPREoGzsJZrGWr
         6vr2YZMac0W7TubBZeZYq7thJJhSI8pQRnvBY2jL+Z77Uo3l/Npa1WjKfiRV1bD+r2SH
         g1/ygQXIGR0h3BtX6sLg+ZwkilbIqZn8+37sbJJtjKJvHbkQBItdT6c/95163c81ciEH
         ekriwkaAnqZY0nSvP9lJyRnlNanv+byok8A2eOHvjkmfaaq1nMFxIz00ki/t4Fl0cQ3B
         1A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007275; x=1784612075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=qKmzVFhPu9dEgsmqguwqHwSYp9reQVlt3IX4ApctY+HffjPY23cMktwIbAXZJ99Oei
         ycacZhinHJqkY0CH1u3PxhEl57+0C+zPxUcIVQaJdhPFDCBTsaW5c7YtTETeb9f9aDmD
         md2Eut2NaRaPgaCszQT8/HgXfIurha9mV9ubd8VgW8KzBOawxxxzgADU10oA0s3SeM8A
         Jul3RB35ifmFAMYObSeUWDF1/E6k5i4HrrRnkdmCLhQwHvf7pAX9d+GJ+z7qWHEUADjq
         8XQHiw/4ZxkMaKE70XEfyuRg+ijMCLHOJ1KDHhM/whQPTsZFfiAUGCUfldQUtvfXNV7Q
         fE+w==
X-Forwarded-Encrypted: i=1; AHgh+RoTBa7hiKoAR/Grhw/qJteM1+/GStyQbMmOvFsueGHroYhdTJ3ypY/ZIZsvyrh+eMKab6QbBs/ZV0+SSu+q8EQs@lists.infradead.org
X-Gm-Message-State: AOJu0YzYw/FWhJxm46gzWy9yeJaPN7gGPpk0CqHpgb0VfP/mU1EstaFF
	e4drKh0COjf+KOKzKZN0oighPFx7Om5IipV5ErFa/pTKp52TpW0bGQV9uqI0v/GT
X-Gm-Gg: AfdE7cnTHWYUkYZlnHm0kUS6OzvrNXxJVJ2Flr+jfAiOmMX48uv9PqqSsUm1uO37tyc
	GVrNKzi8s5Nv+Kk1hDyabUIpFpNL8y+S2hY87UHwB87q69shIOEM16v4HGVbD3q52QVxMH/tLEB
	cfRRz1z1iEgLySKWxCgrmIOBDNDDRr8rQcp5Kbcn22mdbZ7cToSGJW51CfJUUX0AL4z5pwZHOER
	R4sADaVy9qoXrUIC0smSYFPhkhPFXbloymrA6FPVo7CbGigJMZHwZHZDfG3IaokOWA0tuth9MeY
	+0yHQhW7zwIKg7hfy8h2RfIXppWA7cSj4UuB15gNfNU7BsyZghQVZxPrO9NMSsBJ+xSgCjk+nf9
	wPrL2kF07IWx01Z5TVomgTfHXWvhyxKDFA+T8Q++Z/epNrDE2yQ6OC4GDCKYnWRXH8zLsnBnZbC
	b1v+zBQAE3YXswCNr4QCrE
X-Received: by 2002:a05:6a21:3992:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c110157a21mr13059658637.16.1784007275323;
        Mon, 13 Jul 2026 22:34:35 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm33047165c88.6.2026.07.13.22.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:34 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Tue, 14 Jul 2026 11:04:18 +0530
Message-ID: <20260714053419.265523-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053419.265523-1-hrushirajg23@gmail.com>
References: <20260714053419.265523-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223436_348798_6D547C89 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


