Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA37C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qerd0DSiEClHnhSf6+zg6k7oHtaRKr99+x+P27FwsoQ=; b=YOkrDqdoEp2S5HxrQUee++eQsa
	XMIXhbvmaw5gNL+go8Etz1/YjQb2KoWYKigPzqNw1uqCEnQnATl1S9vm8SyG7BOaWDFCXaMMGgSyu
	wHAHpzDxEwzbuLrWFSn+hFRrMorf1xJrLXNrgAokDEMxAuWF8gzBBV7cwI1aTyHpEm643GO7KqHnz
	T3LtKqPIETHaEqDR723qUrE4qd2QSTBt40t/BzFYkjcMNJ5LNzzFlTI24hDSvH61CjQ3/LCjasxvE
	dVFvjRj3zqstg2z+ekxOhXWUe44A0H9USee2c9a4Tefuw8stbTN6JEflGJciLfquWkY0EWRFWbvl9
	jTb1ZoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jAA-0000000EUw5-40Bj;
	Wed, 02 Sep 2026 11:29:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jA9-0000000EUvd-2rjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:29:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7158140C18;
	Wed,  2 Sep 2026 11:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B731F000E9;
	Wed,  2 Sep 2026 11:29:47 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>
Cc: devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 02/12] dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
Date: Wed,  2 Sep 2026 13:29:18 +0200
Message-ID: <f1bb6566f00a06df7c01f43e5329b754a32620e9.1788338320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
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

On systems using the ARM System Control and Management Interface (SCMI),
Module Controller hardware registers must not be accessed directly.
Instead, the SCMI message protocol must be used for inquiry,
configuration, and control of power domains, clocks, and resets.

Add a "renesas,scmi-firmware" property to distinguish between systems
with and without SCMI, and to indicate which SCMI firmware interface
provider to communicate with.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add "renesas" vendor prefix to the property (I still think it
    should be dropped, or replaced by "arm"),
  - Add "scmi-" prefix to the property,
  - Elaborate rationale,
  - Move forward in series,

v2:
  - Spin off from "dt-bindings: power: Document Renesas R-Car X5H Module
    Controller".
---
 .../devicetree/bindings/power/renesas,r8a78000-mdlc.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
index 1dba1e1b1c5b52d0..27d85dd49f954623 100644
--- a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
@@ -43,6 +43,14 @@ properties:
       and thus identical to the second power domain specifier cell.
     const: 1
 
+  renesas,scmi-firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      On systems where the MDLC must not be accessed directly, but only through
+      an SCMI firmware interface provider, this property must be present and
+      reference the device node that describes the SCMI compliant firmware
+      interface provider to use instead.
+
 required:
   - compatible
   - reg
@@ -58,4 +66,5 @@ examples:
             reg = <0xc3060000 0x1000>;
             #power-domain-cells = <2>;
             #reset-cells = <1>;
+            renesas,scmi-firmware = <&scmi>;
     };
-- 
2.43.0


