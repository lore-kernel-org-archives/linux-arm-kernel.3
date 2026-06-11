Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1501ECD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2VTHNM7yf9eBbbMl6UrCOh8hTyt++vrX7POjxez12Q=; b=rlzN/z551D3DisSEhUNhkojNcP
	ABAzSZseWIsuz20o6Dy5Ab3C2p6T2xksf5VLXMqSnCodbaCEkjbYq9sBxE1WiFnt0aEGgc1nA8k8O
	9QkhJlqSL/Bfhd4sIyjVY63RRQJf6IeTMXCEv4nMIwdC7jEzRKmfPsPap4GxSrdQDBUfq9qsVDiX8
	lrP6CkK1dz8qpIF2QqRczVmLDeSvm4Skz9ok/riIP0yH5Xmbuwgn3/5OxFI+awP9ibE9W6+r9m3tj
	2sKT0XRX+UAhbW7KfvhkzXkzhKs8v7Bs27g9uCB93VGGgmQ1HxqGd4vsIU5lUnR73/KaNrMrSgUKH
	SxX7qRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaFR-00000008uVB-33cl;
	Thu, 11 Jun 2026 07:54:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaFP-00000008uTW-2uW9;
	Thu, 11 Jun 2026 07:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AAF543EB0;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F342C2BCB9;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781164481;
	bh=AAkROPjG9vjEI1vREPfQS1ERhGg3Q+Sad8i4hhcHFtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BdaXJyHCSSTXYQ3BmE8gSJTdA8lKaXawkriFhvOq0+DPsTuGkMagQkNgFeYRz6XYo
	 YS9v+gxVmQXnH7YyVVWUH3g2lSq/amPz+qmrKsLPGIA6GHsXLl0+K0VZGBZ2j0dqfJ
	 iXvs6KUhcIl1LkqR4AWbRmPfOBTByGZuvEartknrQYfEqUa2bwArIpitVZHP2sU+4q
	 DP0K2/iNHhA/GJHJ7oF1ONEVI+ucZgtf9bF6gLcMJTHUMBm00M33sN0Q/Ga6ctrbun
	 ORpmUGeudWt6zALi66eMz4Z6SfiQyFY9kO4nvxAGDsdQf/wdBo15vq2RD6dskBuj0S
	 Z4cwKiLLHoh4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4366CCD98C7;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 11 Jun 2026 07:54:33 +0000
Subject: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164479; l=1026;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=f2QomikSfT1qCooaMl1RhIsTgkvu22kj3kqZBPEonnA=;
 b=kaz9R4lN17UNqFjm0N1XpjPESjtpT6n3pIrJdL7Z+WLfsXg1x0aUsq1/0YcSbykV67lX+yyIy
 lAZ/lmz9+MMA+WvF4oAY7e1cekHyQr9DKu+yJwM0Z0cZHT/CeyO+rRL
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add the hw-irq property for each GPIO bank and enable interrupt-parent
for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index b69db1b95345..65ec9121300e 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -37,6 +37,8 @@ properties:
 
   ranges: true
 
+  interrupt-parent: true
+
 patternProperties:
   "^gpio@[0-9a-f]+$":
     type: object
@@ -65,6 +67,9 @@ patternProperties:
       gpio-ranges:
         maxItems: 1
 
+      hw-irq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
     required:
       - reg
       - reg-names

-- 
2.52.0



