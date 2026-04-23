Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B73FAD3FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 04:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=; b=A8GLzTwjxLQvI8X7QUsXaDgoau
	t4Wi5Q0Am6/JDwELpjuWG6qXJxDWxGEwUChIfy7bl7N0TRjB0XnCy/Wohr6E/XkhB/Iq3esrCIaDB
	hwafMB4ps8IZhuXk/uHX4UNdKjL5t8GPU1f1BKSmft/78/WMCq4VyXynaZ7s7Afb++eHc/eNN1h+E
	3vdUGKqKXcoouvo/yqibUoiFPZRMmcWUmKQXTjgVZVQaVV7wPU43d9rmC2bccsHTJa4g3HM1dy7F7
	a3qiMO6pu4d769o7Y2On/38Ok8aOcJd2VPHUSWBZnFYVpYzJM1u0c+NpePDEjqyziD1INn3HvFyvS
	+iyoKpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFlgP-0000000B1ko-2Drf;
	Thu, 23 Apr 2026 04:28:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFlgN-0000000B1k9-1YM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 04:28:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b461310af5so24407385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 21:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776918534; x=1777523334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=;
        b=L74PH/GgFdZad/5gz4nZJ07QrDU4QYL1NR2lHxs2bAMyqnwh9JDfTiK/76wClW1S7o
         mSJBClNOV2DFO8cOif5R84+f/5p7nKLRw7JgyHwnPJpU69zYFRdE/Ro52CMMW3kZgvci
         xKXFzFh/HIQMez9vZcO7Fv9AIyjh/VTdhAihJyvtaFpXYtemmOuWGqdDB63fBHE1oh+2
         uPROoNXSQPSfxOitLCjNXZaGcm/KzNz84ReCNKo6/RnQdsgXExbt8Zc5EENLPatx0ejc
         LWgztay6pb82/m5JcMpmAHaifhe/ttAoiqWF901+bygqZXzye62sT94h1SdrCzs6Zm/9
         U+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776918534; x=1777523334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=;
        b=mD8ESUQP+scWoXYDtvEF6dQFq0pHWDa7Ivn2LtXsxaGqQFXdPpa1xRnFWEjekcpO88
         FKWO4KdKxmT4fOZSQ2lOXu53LoNjVztOTwT8FadlB3xekSZkM8Ko6egQqOEi5O9GNua7
         7tsJzbIYKSplJwdQhVEODBQiwSewT2IiXwNk0XrHkn5D1WBipnVXpkyyBKaJonEmZVQ0
         slmVbReQ9Bc/L0HJZBiqnNXmAdE+ukwFgbGGmpA3oO6HsXO0tUccYaTOiYnThz8dUS3F
         lhWslOTlKLK3SnCOtPfKWGzE/CF8fRbFw2PHWn2cwkE471Gj3fyjoH7EJGdGg/2MV8QT
         dHEw==
X-Forwarded-Encrypted: i=1; AFNElJ/F3TuKWkFXchZWPLggakvnI10Ih40KlROpcfAztUP9LryuL/3wuFb7eUnKYOh/jozndMtGFFV4WEeTksmnEEiS@lists.infradead.org
X-Gm-Message-State: AOJu0YxPVBblgbsw/Ht3WQneLPiJdvKWICDjkCP8s6iAarCX/ZkB4xk4
	OHRALEVciWQ2lbF30S/DN7LOAYA7skMiWP9+RD61glMeAk4hv336dyo5
X-Gm-Gg: AeBDiesLk5Azqn5f8UdIXJK5m2IxnJU5AV/NNnRDAsM8E+jJNQjZ7hEOKy95u/4IddE
	aabdiu/f43eVMb9wKIF2CVu0ph9B1tkZmu/rbdZhdPMzwgz0RYVTfITvL05XYF2qE8BxqoK7fMf
	JlCtMyw8ShNrWq0pP82ZDJLBs4FhPcmjjKfFiUh9Nwd7m4E2gHRvAWVFQH8BoOOPl0/NEJg6Z5M
	UepH88dyJJoHvJAW3XayGKJzjRM3TrnQ3jWS+BwBemC8y9YDPEtOESVOpGBE3cafNXILnKxluz/
	rUGpvADxv8E6BjE337J9kvwnI+UxT8Iwbf6ZBHlwGfirU9T7AqeWZ7/o9AqUYzmrNmSyoXoB2zH
	7iPf0fb6hBa1tP6AqCtdDF5DwY1ehOtGp6cofwPEAUuRLMGR9eNxbdTG+Sg8gFux59BRMg+2dac
	PeTAzibKIT8lmM9j2rusaofShpXWhO+2roAcUJ0m9iDYBjLwOFh+PLhxzuTfj/cT9yjZc5
X-Received: by 2002:a17:903:f8b:b0:2b4:6122:10f8 with SMTP id d9443c01a7336-2b5f9eb4a00mr190635855ad.21.1776918533945;
        Wed, 22 Apr 2026 21:28:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm165723755ad.77.2026.04.22.21.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 21:28:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mfd: rockchip: drop redundant wakeup-source definitions
Date: Thu, 23 Apr 2026 11:28:30 +0700
Message-ID: <20260423042831.21114-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_212855_417513_BD0F01C2 
X-CRM114-Status: GOOD (  11.51  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. The Rockchip MFD bindings redundantly specify 'type: boolean'
and provide descriptions which only repeat the generic meaning of the
property. Drop these redundant definitions and descriptions to clean
up the binding files and rely on the core schema instead.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml | 5 +----
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447200ba..8e394ab6879b 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,10 +29,7 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..548ba1f30712 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,10 +48,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffac8fbf..40f8f23afad3 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,10 +43,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d176a84c..b99aaff100fb 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,10 +55,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c27ba1..b7af774b1395 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,10 +43,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
-- 
2.43.0


