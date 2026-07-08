Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB10EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5+zqCqm6NB7VrbhQXn4pi19V8+eCmczdyzKDDG/9iE=; b=VKCHuNdjKSEI/ZCPQfMe4Q7Kzx
	mhleqN5wuqHC8oytWJUPbVQBT238H0ObA4LtytSG3z/tHX/DsJO+k7+rYalLyul724kZy0SBOmgWP
	fJLG99R3yP9daq+CPUBKFHVLK6oKDGgKNPdt8V62TstJhuGrFMD2qdzf0ij1KYixbD38w8E3css1t
	RaT37JQfuNcOLtNKuEHTo50sdJAktiSatJBCbc1l6+nYby7aaW4r9UeJ4e3N6yRWX/dbUrBGVrtoc
	ouIJioaW+2i9capPXM7aluEv7gHKWRFj15ONx/P2lGzy6QTBM69xHpYemeIfoDlnDUOjXwQmgH0K/
	X9VsRm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPLF-0000000GrNj-2AfQ;
	Wed, 08 Jul 2026 10:17:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPLE-0000000GrMR-19PR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:17:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D93AC43251;
	Wed,  8 Jul 2026 10:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12BF1F00A3A;
	Wed,  8 Jul 2026 10:17:14 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
Date: Wed,  8 Jul 2026 12:16:23 +0200
Message-ID: <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
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

Add a firmware property, for systems where SCMI must be used instead of
direct hardware access.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
    Pulse Generator".
---
 .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
index 4e23bba334382346..fc499e7cf52e4f0c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
@@ -35,6 +35,12 @@ properties:
       <dt-bindings/clock/renesas,r8a78000-cpg.h>.
     const: 1
 
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the SCMI firmware device node on systems where SCMI must be
+      used instead of direct hardware access.
+
 required:
   - compatible
   - reg
@@ -52,4 +58,5 @@ examples:
             clocks = <&extal_clk>, <&extalr_clk>;
             clock-names = "extal", "extalr";
             #clock-cells = <1>;
+            firmware = <&scmi>;
     };
-- 
2.43.0


