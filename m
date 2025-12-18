Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FA3D6D235
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; b=dFoxBlT20K9zItYEXF6pG3wI/m
	+3hB8OK7T8TpWXa78XuLW2jjsApp9KqnF67TiHFY71GzqUWBBvHj7JhPpOD10wq1a9Fuu/j7x+1fo
	ykbpF7VXrkmLCF2UgCRoaO5gXGV/taotm1UHWlTnF8EY2tDFW3GYEeIV+epS4N0fcgQIM45yT24SR
	7Se9fun13UVy9GxnD6aCbNSmO1zASe7LAhWVYjd7HuPVRIWNh+kD84oD4pk4VTy2gw2DoQVdARDhs
	VqddhxQKsvZa1uo69L+7BOWCUUEOmA/m0woTjvaM08mR2jgU5wWQJS6RgnltuGZvSnDfgYWpq5sFr
	7TUJGeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpI-00000008gHh-0nUp;
	Thu, 18 Dec 2025 15:22:00 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpA-00000008gFM-2vL6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:21:55 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071284;
 b=Ii5GibGjTkKmEmSpI7WcgEgaM9DD15spSxwSL/5w/VqxrxhACRy/BFcbMcaiojZ1SX6ynsT3
 iTkQoruPA1HQYK1AZ4VxspzU9Nx1UuxDavhSr23BS2g8F1Z0M6otncjgmmDQpKu3qBXYDy6bNcb
 UME1aimcnXjtSYUwMKSA2d8ahasX4D0SBVbKyKuInxyQaNNuf8Cq7earuV9/gicILDNpk9e0meN
 KSPg+wlpWNb1GkbAJlzpboCA0K0pjxv3eMoR280p1+BF/jSmXu6GFN9YdogqsK6a3AUMk9f53Hy
 cFIolR+HkkODWU5ltuhklW8sWnfdSW9q0RvY1nVnHQXEQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071284;
 b=el9SEkNv5aMQ6BpAn3dCcw0CaIgWI30ivtGXxx8iRp70KyJzh6FA39T7ZhT2TzJFug2QV8Ah
 MRWa4sJbbdFQyVnQ+r7aVXKW5K8COLvAOHx7X0pcZfdB0AZwg6sQD1lwBihQk9WBNPNL4dIYS2K
 Ttjf3LxYmpkYSo7TFu5cHs7e+OJdd23mJhHKwmA3z6pageXKOEGQRbqrEv/JdD642CLZx2npZbf
 dT9pymqHbOALPIq54tGFFVOEb3RizsvUQdyrsCIqThwzQN0L0fWG1/ySfSZkC4GYpHXnasd9U35
 8JUUk6wkl6S2nCIWx3/c/H4h0wGUSLEJSPewR3oZZ/DCg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C1E2ECC0CC7;
	Thu, 18 Dec 2025 16:21:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Thu, 18 Dec 2025 16:20:48 +0100
Message-ID: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDry6fRMz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 79e50b13dc320d875aa9306a79dc5026
X-cloud-security: scantime:2.032
DKIM-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071283; v=1;
 b=erVUdNGdt/suCMqptHMC69s2Aq4At/wrU/RYnmy/AS7pQEwH9iib10PeTq8VqIcAtGJKWwK4
 Wem4uMi2RxVnhy4zB/um7GFGdO9O2K7XQVcqLwZ663up3Fh+MozoqIVgrI35FO0vAIGH49fPxSH
 eH2W33j20sr+kKCSO+MgC0GhFeXakCG5hv6YHqIT+kyzZJUrgx+85iniEZEpuJ0Qvhp8oUGo4kz
 lQf8aCPyzncOgeNt4eohjNe0c5jP1Gwb0GckkqGQ7A/mi8e8AqepSltsv1aoq+AFUl4H1JnH6j/
 iH4CMzdIrKRj/O5LpaRP1TWQPuhsdhaHfNLgbiR3lEWEQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_072152_870692_7D3F060C 
X-CRM114-Status: GOOD (  10.69  )
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

Add "clock-output-names" which is a standard property for clock
providers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/clock/renesas,9series.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index af6319697b1c0..5590f04147612 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -52,6 +52,10 @@ properties:
     items:
       - description: XTal input clock
 
+  clock-output-names:
+    minItems: 1
+    maxItems: 8
+
   renesas,out-amplitude-microvolt:
     enum: [ 600000, 700000, 800000, 900000 ]
     description: Output clock signal amplitude
@@ -83,6 +87,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0241
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0441
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0841
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 8
+
 examples:
   - |
     /* 25MHz reference crystal */
@@ -101,6 +137,7 @@ examples:
             compatible = "renesas,9fgv0241";
             reg = <0x6a>;
             #clock-cells = <1>;
+            clock-output-names = "DIF0";
 
             clocks = <&ref25m>;
 
-- 
2.43.0


