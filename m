Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2818ED7831A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcZ18Acyfgn1qx2AlpkGRDPoqylUNnc81TgbKsWflLU=; b=RR3VfqVun1JVoJ+TqXY6JiXhzC
	uQ2p8GFkc8ZNeAx1uMB+erIJqIi94tPl8R8VDo7mAU5V2ocMaIjC0E1omQVDBaqhMo4Dz2j7hbkhx
	sD+dB69wmPWZ4I+GVKwjMyI7Rtg1vkLe3wxtz50jbHhRXkRUEQ952kcf+MrzZFY9jDdEPDlxBg+EZ
	LGPvNs+J2yHYYZ9Aj6utmV9pu2FwmV1ZkhG5IMgC4GKMx9Bepc1yGokyDPIOk3cIQtCuu2pSpbFHc
	Q9gGLJNcC3HWDOek45K3WUlMK/KtqB+db6FSmhLQVo1wRoy5D15dSEo0VKkQeAyWsUmIaaa1Tonbi
	NBqbPVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Ev-00000006C7L-18vD;
	Mon, 02 Dec 2024 13:13:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6A2-00000006BFi-3we2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D89E45C5CA2;
	Mon,  2 Dec 2024 13:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53B2AC4CEDE;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733144901;
	bh=jEINaNWGAcKMa2bATL8ktCQNfAWj8oZ7TAUZr3ESYOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JHZk/A6i6SsD16eTksSkewswkSr6FifkMku5R3Wk5YVIwXPHjeCf9xqtwvOM5wb99
	 dhwqmSFWznNwGR1fvGGGS2Rk8GOJCpQ6r2IATIJRzsnl7Sf95x1p37xuyTTXxk/xeH
	 C+/7ULdyRLCBcyrtSjgpqE3BW7Eetk+UBCQFN/ne6aRagI5xjcPOrusXK/XJhL3vRj
	 XUsV1NVRgkJQJcHPQ46rJEw0yM6z8NOZ87xFHl0lp2zCzl+h6Eb4G8jv2az3dox2oa
	 Rlo46AmrKTM6FauX8Hju/PPOMlWeROSQlVLUipQuXLWuFEsT9LL92mgNRBJrAOHj1R
	 uNrdYJit1o+eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D9BD7831D;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 02 Dec 2024 14:07:16 +0100
Subject: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor and
 don't require nvme address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733144859; l=1565;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=RTgptgGDXIpNksG2RFyyX00KmvPw//2EuQKYPNbTnPY=;
 b=lCO1iSdVtfEpPAC77nh9P49nbswY9iqm8xcrLTlOoQ/khMbOZuUNCBRNJ2ElFwDs5zIuHMEQL
 lx6XWdp54GpALvXJ3t8KOkKVW/Map6F2UCEye4rZu31wIix5Hm/sjwH
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050823_081266_FE11F05B 
X-CRM114-Status: UNSURE (   9.21  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

As the Maxim max77759 fuel gauge has no non-volatile memory slave address,
make it non-obligatory. Except for this, the max77759 seems to behave the
same as the max1720x.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 .../devicetree/bindings/power/supply/maxim,max17201.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
index fe3dd9bd5585618e45220c51023391a5b21acfd2..417fc2c4a1c1961654bc54ec1ac24602012f3335 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     oneOf:
       - const: maxim,max17201
+      - const: maxim,max77759-fg
       - items:
           - enum:
               - maxim,max17205
@@ -25,11 +26,13 @@ properties:
     items:
       - description: ModelGauge m5 registers
       - description: Nonvolatile registers
+    minItems: 1
 
   reg-names:
     items:
       - const: m5
       - const: nvmem
+    minItems: 1
 
   interrupts:
     maxItems: 1
@@ -56,3 +59,14 @@ examples:
         interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
       };
     };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      fuel-gauge@36 {
+        compatible = "maxim,max77759-fg";
+        reg = <0x36>;
+        reg-names = "m5";
+      };
+    };

-- 
2.47.1



