Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9733C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcArWbgPUbwqUStiCQfiszt5Le9LIHEytIaBBZrn4r8=; b=CTvUl8L4k0SA9xU87BwtBYP9EZ
	SccTwXDlUouO0UA96ugx5iyfKxrfW1WnRGtsvK5rxc81J9LZKVwX+fmXE/vInwd79X7lECtzJmsr6
	vUx78fRBKksUqMdDJlJgsp5eX7JL4zD4HMLUchh0dtoRL0Me8xRurFd2JWCvM4B6/Vrt691995yxs
	z7EBAADAKbxdBJ6KDl3BR6RQPjepFJ3+UoFBa2EphirXkF4YIuJsEtVNpsSUAFtV/W0KL7b4ceWaM
	r/eE5J6ZX/62vnFDEtEinN2m3uFMR9Nw1SDak7hoAw5m5rmZP3a47jTWS5UZUQn+uXkZhBZwyjZzh
	zaj63uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADNA-0000000ETyS-3jZT;
	Fri, 25 Sep 2026 21:22:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADN9-0000000ETxO-3BPj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED37C444F4;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC9F1C2BD04;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790371342;
	bh=ONoNtmJiIBVmdYvigtOlZwFCLGUN8EHYDzwyaXRm1j0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EMEHAV3BEj/A2XGWNm8xZj+jjbAuIstQ0yed9mD/Al1zZcE/csx9mj/XWrbmQthy6
	 QznCgeOAa0FZwB6wT+dHB1MennOHqknFx44hBdIBYFzBJXH2i2jtF/Y5MJtqh7OHVI
	 ttHry1uQ+Fgqee2yR+ctqXetb5zBQnOOX0kfJzJv3ujAA3/k6gu4coXCnanDy8VDf/
	 0k9chKywIp9j/v4IjjRQvHRy9x4dkmnl0pgmy6POZdQ42wD5nvUthxuUT5v3t6WXky
	 Dqi/BTYhEQOeiLMZzf9i6BfuDOVmCCars1eXrWoSPm+8a9+Cy6H664kyL6VUavp1kb
	 5x7h5ITTvv/XQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3C9C9832E;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 25 Sep 2026 23:22:21 +0200
Subject: [PATCH v8 3/5] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-stmfts5-v8-3-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vbynNCWfAo0HQ+BS1gbKGd/f9mQ/YKgvFg8G/NvxKsg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtuYM07qIN5wZpC1R+DMIeJx5PEEPnjxk5Rjy2
 wZCQqg459OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarbmDAAKCRBgAj/E00kg
 clNwD/9Lg7M9OCARmi4aw5U9dpXlYVqUYvudwR3TMnYeqDScSaOHLsGU+lwTYIWX6wH74/XBWKd
 FCknE6jXY/3B+FiZw6W+I37Jiodjcjur0NyfBXxsxonYFqIw+OLEvFQVlFbOrV87bVkSAL2rgk5
 47yu8PsjW1gEKEN2tD8TidDhaoR1yCyQDgzNuu9/lm+XcquvxZLVyCMpC6m9No0KmLyFt7bGVV0
 K9O15atUUdD/zS5SfgV/FjceTGs3tUl7lokiwmbMSWubQpiFfVd0Z+iIRpm1YNGS/UQv9IN6Cps
 ETw4xVODF5tAOFErJt2dxCId4lphugOnp2e9TJqabWjooxUC4MhP1UFSDBrIN73tpVCeG07/4eS
 9jqaqZrkjqiAJ3pnL+oPex4mjkok/jiKF8BBpKjuWqVx63fuXzMhozRIzaCn4CBB2kgk3BTyyFS
 0Q9uUxfmA+fu283l73DEUyycoJIY6rnpfab6ENUKcIMPvbvcXPFoySgzzoAjQwsEniaGSvIHDnz
 PJJejbnz4+4Vf57aV/cmCu93HbvGv9TAt0RXzNjq4cdyjGBkfxqIkYM9A3WT6vS2k7r7GZu061d
 On8XhHD8OCISpH8IkQDcd55CyR4SFbrasDUwTOddPXeNHBdGh6Ldlktl0D8X+V+gwsYa7Fi/bnL
 AKBl/iXIlCFpTeQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/touchscreen/st,stmfts.yaml      | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 6eb1ad6582d82..3de4bc5cd3f78 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -9,22 +9,21 @@ title: ST-Microelectronics FingerTip touchscreen controller
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
   The ST-Microelectronics FingerTip device provides a basic touchscreen
   functionality. Along with it the user can enable the touchkey which can work
   as a basic HOME and BACK key for phones.
 
-allOf:
-  - $ref: touchscreen.yaml#
-
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
 
   avdd-supply:
     description: Analogic power supply
 
   interrupts:
@@ -35,27 +34,42 @@ properties:
 
   touch-key-connected:
     type: boolean
     description: The touchkey feature is connected
 
   vdd-supply:
     description: Power supply
 
+  mode-switch-gpios:
+    description: Optional switch between touchscreen SLPI and AP mode.
+    maxItems: 1
+
   reset-gpios:
     description: Reset GPIO (active-low)
     maxItems: 1
 
 required:
   - compatible
   - reg
   - avdd-supply
   - interrupts
   - vdd-supply
 
+allOf:
+  - $ref: touchscreen.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            const: st,stmfts5
+    then:
+      properties:
+        mode-switch-gpios: false
+
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
         #address-cells = <1>;

-- 
2.55.0



