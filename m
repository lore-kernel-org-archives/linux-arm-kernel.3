Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDA8CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=306eaqOacfVW+zMcivcIfnGM6iMNqXKgw1UBlY0rnKo=; b=OeLxdV4ilss8DpnoL01xIMheJR
	kM6wovyPPcXz0hhkgovRGV69l9MKtH31e6ffVCKl+CV7Mep5rFGQJQa1hhYOhJVXpG+Ek66ggul6n
	F+ojV+j0zb99Gu+lZjSoUKlAkcaYlppurugWeFjvL3iwbJyoEPvCf7jDDVSm8BOTgUoNDj84N4w4n
	VW/fVVEdPykECrqM8W9SoC2sa+3TfttpUMehZpzYThszlbpWaj3jwW1Xyhxw8xaISKY6krY2Z4JPW
	dcGR2U8OVhAjd1Js7frZ44R71lBngXkas6nRN0+2E1wCF3ryENCK66Sor/Z0nSQiBVt5yuP5m6jWA
	4+h3eS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3a-00000009TKF-1FxD;
	Thu, 11 Jun 2026 13:02:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3Z-00000009TJJ-2IKd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F4035601E8;
	Thu, 11 Jun 2026 13:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344631F00893;
	Thu, 11 Jun 2026 13:02:45 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 6/9] dt-bindings: firmware: arm,scmi: Document arm,clock-domain
Date: Thu, 11 Jun 2026 15:02:10 +0200
Message-ID: <bb65a93531125757f3c4beb47cd7891a1a7492d9.1781171706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Power management of on-SoC modules is typically handled through two
methods: module power control and module clock gating.  The former is
exposed as an SCMI power domain, the latter as an SCMI clock.

Document the new arm,clock-domain property, to link the SCMI power domain
provider to the clock domain provider that is responsible for module
clock gating.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index d06cca9273c483c0..18e4da3884c4c12e 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -174,6 +174,13 @@ properties:
       '#power-domain-cells':
         const: 1
 
+      arm,clock-domain:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          When PM domain consumer devices are also part of a clock domain, this
+          property should be a reference to the SCMI clock protocol node for
+          the power management clocks in the clock domain.
+
     required:
       - '#power-domain-cells'
 
-- 
2.43.0


