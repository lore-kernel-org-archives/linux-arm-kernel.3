Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE1C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NYD+PNhmWJ+0B97cnp90Usxc3LHBxOcTXXAgBSj1Qo=; b=Q8f1x+Dpy47KV5nW5Pzjqj+68w
	nrV3uxum2RenGRQLJLpKhioLmQ7/siB1hJRBadtku4wVl4KEgUjERvYFwlD8GLdQE4qLldr1g1ezT
	JzBw6xpjC/H1lLD8qP6KDjemwcZ2CdjyNY5gj+bepNIk2gyfK6fBxw2M49ICVEeFmKD2MI7km7Ra3
	Lb4YkxOs/OeDqkOd3X1jAvQnfeYeH5evHcGTGYF+ar5NLeSzvqogASdYK8iFR7JVDw1180JddM4d4
	V1H8RrINkhg4Y6673BKqmDZU2sa/Ni7Pa3BL9HYnBseVMtqKI2bRhzP63I8qm8qilIsiCnwsAwVlo
	unC8CxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApsR-0000000GRRq-03Af;
	Sun, 27 Sep 2026 14:29:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApsP-0000000GRQw-25QA;
	Sun, 27 Sep 2026 14:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C0344505;
	Sun, 27 Sep 2026 14:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9FFEC2BCB3;
	Sun, 27 Sep 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790519352;
	bh=loY1pCAhdkrgIbxRkXzPM7ibYgJ5rizQ5x2h+dPCtoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e+ESTPNUtIG1RPO5PkUKC14pL/VXDPErti1u5o0ZCk+whGnnQ82raRnlsTVhjvY6i
	 mcRCFZA50h+B+/1sYCualbgq9A3EJI+UDTcr2rfgXMD9swiRC+v9s83HElSah6/N8R
	 DjTi7YFULXjYNhwjyto5KOVYIagmw6mURbNganer+vYFyZJfdNuFCx0xjiFbR62nXM
	 vNCBQ4+0uYEuUB4y6jrIcLh4rDl155BiD02Oz+Ucwover/rvWecNevmKDkF+ppICsj
	 7Dfr+goPhkjpIf+rBI7G7yC5OPGNX6eZTqZitU5C+48Rhatv/UpZSD7O8WQunj0FuG
	 Ssy4YVvQlnPhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ABFC9830E;
	Sun, 27 Sep 2026 14:29:12 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 27 Sep 2026 16:28:15 +0200
Subject: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
In-Reply-To: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=ocfAHBxwQh4nneVCIVvdqenheD8RusX+bkEk3wRZMOY=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZODbVS60nc1qt+uhw9c+XHjH1HP8zOuP7u1qkp7q95/
 B7EbP20u6OUhUGMi0FWTJGlf67liXeXj575ukc9BWYOKxPIEAYuTgGYSKo2I8OqrvAHN1oY5t9Y
 5C++5U9CUZF7w6wn2qdj/qzMnmX88KYhI8P6v1uVs3QOL2vumnNsYflKL7HNlgKzN8sJcoveZ1C
 9mMoCAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The T7, A1, C3, and S4 PWM controllers have a system clock in
addition to the two input clocks of channels A and B.

The channel clocks are acquired by index in the pwm driver,
where the core clock is fetched by name, with optional get
which is silent when not provided.

Require clock-names and minimum 3 items for S4, and devices
which fallback to S4, where the PWM devices do not work
without all 3 clocks.

Add an example showing T7 usage with its fallback to
amlogic,meson-s4-pwm.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml        | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index c337d85da40f1..e9cd5f1fdf264 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -62,7 +62,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -143,9 +143,15 @@ allOf:
           items:
             - description: input clock of PWM channel A
             - description: input clock of PWM channel B
-        clock-names: false
+            - description: gate clock for the PWM controller
+        clock-names:
+          items:
+            - const: channel-a
+            - const: channel-b
+            - const: core
       required:
         - clocks
+        - clock-names
 
   - if:
       properties:
@@ -179,6 +185,15 @@ examples:
     pwm@1000 {
       compatible = "amlogic,meson-s4-pwm";
       reg = <0x1000 0x10>;
-      clocks = <&pwm_src_a>, <&pwm_src_b>;
+      clocks = <&pwm_src_a>, <&pwm_src_b>, <&pwm_src_core>;
+      clock-names = "channel-a", "channel-b", "core";
+      #pwm-cells = <3>;
+    };
+  - |
+    pwm@60000 {
+      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+      reg = <0x60000 0x24>;
+      clocks = <&channel_a>, <&channel_b>, <&core>;
+      clock-names = "channel-a", "channel-b", "core";
       #pwm-cells = <3>;
     };

-- 
2.49.0



