Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994ABC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbzM771jnHPkoNQsD/EP9i/y5cMtnR/p8XWwx0xnrsE=; b=qN6rHV6uvwvtbmKiAs7VZNzDvQ
	4VJrrwdLItM6xnuS2dG+5yO0ZyPLeQJGJNS2+3n0v/elTP9sVgefpSUFbgr68dwKOX6bFUZfafYhP
	2rHHAXMf5D+b3LMrFrA24zE8Ny1cF0A8k7/CorSGC/qTz2brPi2SB05IkYEutTliUVtFI+XhriDEm
	3AI76PjxLe0yNlAaMnM304Cm6mQ9J8BUNKdWip/rfu9YM3jB4tZdfw6DjiBemUW0Jn6gHU9JBzJRB
	/oAwXMPCE77sPbuGb4Mvnz1MBJ1dsn1AmIFoJDs0Ic7Wq7ePh86KIIsMKTYcHe4YFrz0tx1xQRIoP
	fbP6nXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tked1-0000000BHYM-23TY;
	Wed, 19 Feb 2025 07:36:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeW4-0000000BFQP-2ASj;
	Wed, 19 Feb 2025 07:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93031A41F36;
	Wed, 19 Feb 2025 07:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E489C4CEE7;
	Wed, 19 Feb 2025 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739950147;
	bh=kojsiok+qr5Jm3mhLDj10YtMlEQt+sQaTdEisc+sBFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WgNBumnsmR+I6YcSiXBzOAtOYS2pXh5ygEVGcl8CtUXQAg7PwokDT6qOsOke7BynM
	 goFt3wlS6GZbVc6SKgEuFg7JRUxfi7mKVeqdn3fYUGHtEJP+VNfv/olvHjkX5ndHab
	 9Tykcbj/FC1NqETnoEUCFC1nxWF5YOq5zRCHB+Xh2MdOz5DRDhYw5iwCmFnLxCG+Av
	 QXcv93KXu0PZg6M6r4QdS+uL8atW5S2dwxs+pBFxYyvR6ySwUpcQiOHdskESomwh/C
	 GT7LNQVkAo+rA3gdOVJVARWIERvsZAXzSoeT1UKuFI89iDJ3WFnNZLgau8rpmDFeaZ
	 KbjEMZtb69uLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C03C021B0;
	Wed, 19 Feb 2025 07:29:06 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Feb 2025 15:29:03 +0800
Subject: [PATCH 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-irqchip-gpio-a4-a5-v1-1-3c8e44ae42df@amlogic.com>
References: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
In-Reply-To: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739950145; l=1351;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=vjPBu1HHhtJ40032LUG+5H8YJbi/gKBdDE3m5hFavvg=;
 b=0aRX+LboPpexOaTwmX3H+YQd0Y2mCu1hV2pp4pVwj/4pM5zotWkSSzIl64AOHuySD3aaUFC4c
 nkskPATR3SuBhUeZ4PnX5/a0Dr2mK3HMwpE9vMkxBt7H4774FUf4PEb
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_232908_719943_061256BE 
X-CRM114-Status: GOOD (  10.26  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for GPIO interrupt controller
of Amlogic A4 and A5 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index a93744763787..03548ee695bd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -35,6 +35,9 @@ properties:
               - amlogic,meson-sm1-gpio-intc
               - amlogic,meson-a1-gpio-intc
               - amlogic,meson-s4-gpio-intc
+              - amlogic,a4-gpio-intc
+              - amlogic,a4-gpio-ao-intc
+              - amlogic,a5-gpio-intc
               - amlogic,c3-gpio-intc
               - amlogic,t7-gpio-intc
           - const: amlogic,meson-gpio-intc
@@ -49,7 +52,7 @@ properties:
 
   amlogic,channel-interrupts:
     description: Array with the upstream hwirq numbers
-    minItems: 8
+    minItems: 2
     maxItems: 12
     $ref: /schemas/types.yaml#/definitions/uint32-array
 

-- 
2.37.1



