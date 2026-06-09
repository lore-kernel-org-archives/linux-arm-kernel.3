Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6839ECD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnTQJtWhXNNunD6hFzuvgsamcYY52i5xc8gBuKJVeBI=; b=wBDGZ5nrU7pRp9yszV0tGsACfq
	f2NmmYNL4KzVYNS1n5NnuLJE5GbHD5xJjoRg3PKgHLMrIij5nRzm6jiI2zw+oZ5JuEzC9Db2+g+QP
	z26Hj/261ba+yjqdkbp1dkWmolU4qBbvxssmhuz3w51fDtZMrRHlFqUL2+s4gRflAnBCFe5y9ZkMO
	zMRDJ0O0woCjvNY++HFQVJQQRX6mKAIpHzmKoBAaeVqNAFFZzQUeJAnbgRCovc1BEPUo4p1YDWgeB
	Z29LigKj8Zeqq2d13G75M71cT6e3Amd5RYQWuins/vSYKTWin6Tr0GEHWjoUFDBgTlgu0ckAsm6uR
	9hJd5GTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyaC-00000005wfc-36uu;
	Tue, 09 Jun 2026 15:41:40 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWya8-00000005wdE-1EgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1781019695; bh=tnTQJtWhXNNunD6hFzuvgsamcYY52i5xc8gBuKJVeBI=;
 b=jPURHqcNXhxRObsILBtwUwe7LpaITT3sGq66j+Z0U34wuBnPEboH62e1Bi0wMOTBRQ6HU5WfD
 zXQaZH5RgNe2VlZ6fjIWBJeC9mIcXEuoCPNeYrVEkTro+Hp1XJlvYqJgjPHTfVrgS+SjxNAnSaG
 O8w116BRD/LArcahWbbdFmHc06648JMr3+TfKG25B0srVgBDmL9o0N4DCr/dPjIDgHL2E/Z9KHN
 vdIrJzUdBPUaCstpkckgv3JQFkZE/MO9OBx8OUxHjOk0mPY4P2M9ZysOYwfF/oqDN7dX2I5HpCo
 Az/4L4onCptmo7ysw9KoLJbCY3E3fksRnjSAm2xc6/Tg==
X-Forward-Email-ID: 6a28342e2d71d6ad28f66e22
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.22
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI
Date: Tue,  9 Jun 2026 15:41:22 +0000
Message-ID: <20260609154124.445182-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609154124.445182-1-jonas@kwiboo.se>
References: <20260609154124.445182-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_084136_458001_E00E6260 
X-CRM114-Status: GOOD (  10.59  )
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

The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
being enabled, or the system may freeze when registers are accessed.

Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
constraint as RK3588.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
next patch make use of these new compatibles and adds the missing
clk_usbphy1_480m clock references.
---
 .../devicetree/bindings/usb/generic-ehci.yaml          | 10 ++++++++++
 .../devicetree/bindings/usb/generic-ohci.yaml          |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 55a5aa7d7a54..c49a1bbc8cfd 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -52,6 +52,7 @@ properties:
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
               - qca,ar7100-ehci
+              - rockchip,rk3568-ehci
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
@@ -186,6 +187,15 @@ allOf:
       required:
         - clocks
         - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-ehci
+    then:
+      properties:
+        clocks:
+          minItems: 4
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index d42f448fa204..5f1b4d2bff89 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -47,6 +47,7 @@ properties:
               - hpe,gxp-ohci
               - ibm,476gtr-ohci
               - ingenic,jz4740-ohci
+              - rockchip,rk3568-ohci
               - rockchip,rk3588-ohci
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
@@ -198,7 +199,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-ohci
+            enum:
+              - rockchip,rk3568-ohci
+              - rockchip,rk3588-ohci
     then:
       properties:
         clocks:
-- 
2.54.0


