Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37931C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ef/J1is8r5VQqr9+8Drw9LxWrjbRCAXxQdkhprM4+1E=; b=Ji2z9Ier4mZgxsrv5srshq6gYW
	KiYnAZwxvn6oz7sq4BtAVfm+hLQ+sD1FF4mSu5hjjbuV3E7UTIZJcpmggFeQfqBx8SiNVezfdu/aW
	qA453s0F5rxekhJgzWoWjDLu67mkTDukyb93CaAkEO6WR2zrnGSyng/UnWfFhykWIpoHRBx4+IZun
	XiCH7GLUZiVZOb0/mJvxTv1tBw6d8UN3xAs4BCMVfXfdhsZ1FraoRVz4UIPM8MAQp0GkrXj+yaoSZ
	vpTpYBVR021PQiCWjC6njDI06hRhVQPHDhVGKfNvpkDN0Ms3/Z8MH8OLfUS6jqCHPScipuV4Vu58v
	b0BLy5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trq0U-00000004Udz-1zDl;
	Tue, 11 Mar 2025 03:10:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trpyp-00000004UIK-3vTh;
	Tue, 11 Mar 2025 03:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A947BA467D7;
	Tue, 11 Mar 2025 03:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6792DC4CEE5;
	Tue, 11 Mar 2025 03:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741662510;
	bh=par3qu1dv9Zw4UCxcBo6S18Zh0aWFYrWJBkvOV23iK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D1bmCMR0PuRu4iD7DrvFHHXSFeXT0UxAt+gcZnx32KkXiRXnaDRu0g6BkzMxqzNbZ
	 o4/MXxDYVLXsqMJ+UrBncr9Ihj/BI0d4Gd7AOY+eFyVDFiQGNPZhu/IjwiWJwL0fga
	 ylaU8KghWXyuPyXlZid2OLey+O4Ny/xGe7R7Mywms51UHu1N/LxDNglXC13JdnuiFP
	 1neTD2CALL1IFa85FxCUipb1KNv5gnILjgRz/utl7P8rPlhFQS+7hvlfHLqfckCq1g
	 xkeKlWgrY+yQ7sObdaoEvU5zm3lq6XycAoHI+uTYqtn2zJ/bOdRcRtHAZivGOuko9l
	 nBnUs8jwpKMeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54224C2BA1B;
	Tue, 11 Mar 2025 03:08:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 11 Mar 2025 11:08:27 +0800
Subject: [PATCH v5 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-irqchip-gpio-a4-a5-v5-1-ca4cc276c18c@amlogic.com>
References: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
In-Reply-To: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741662508; l=1799;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=fjbxGdq7kon/f2bPEXT1/XjxHPpGuBnxVJQe/5OSgX0=;
 b=A8Z0IMKvUx4BuCPhe2tK+AUJQUh2m+5mdPfe5RM8p3xReYGa0bspT9eplSjqXhH/nFWlxwuJr
 VdHnUZcfSOHDBTHQGGwJ6gtf3VsBQM42Eqr50eQGmy9tqAx/NiEdYf3
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_200832_116742_40AA37CF 
X-CRM114-Status: UNSURE (   8.62  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for GPIO interrupt controller
of Amlogic A4 and A5 SoCs

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../interrupt-controller/amlogic,meson-gpio-intc.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index a93744763787..3d60d9e9e208 100644
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
 
@@ -60,6 +63,20 @@ required:
   - "#interrupt-cells"
   - amlogic,channel-interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,a4-gpio-ao-intc
+then:
+  properties:
+    amlogic,channel-interrupts:
+      maxItems: 2
+else:
+  properties:
+    amlogic,channel-interrupts:
+      minItems: 8
+
 additionalProperties: false
 
 examples:

-- 
2.37.1



