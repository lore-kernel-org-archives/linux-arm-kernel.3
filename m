Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A00CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 00:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csvkdOo3RCGxMupPs57c3v+XYC5ciwSvYHJP0umZ7As=; b=pbAXNaspQTeoCgF74At4a5z7hO
	3h+puOpM0Ooh7GLlfD7c9VH0JCV37i38zwCtrbvQdcKf7GHtWAjDDGg9d7MAecW+pZ5eP2sIgKK3x
	QMs4tqgMCGkCc8rpOI8gnPK9mSjXHAHikt/WxHRvDi6ADGcm/SF5IqRKS/VXPPXyu69hgSe90BLYL
	QEliOKDC8eTpwZ7qvxTkLuLUmdKpdanNkbrCNoWo+MMeR5IhA+J1JcnORBH64MVqgnArS3wYJu0NT
	JYjDS38yBzFGfbi4arDIiS/0ISFGmMy8O5taxQPz0tWAUWg0/1xXa542DD9HkU00/P0vg8A9ni6F5
	44qx5rdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZUN-00000004xDi-3yAj;
	Thu, 25 Sep 2025 00:05:35 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZUE-00000004x6e-2bJO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 00:05:28 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C24DD3F532;
	Thu, 25 Sep 2025 00:05:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8F7613A6B;
	Thu, 25 Sep 2025 00:05:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ACrxKj2H1GgdNQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 25 Sep 2025 00:05:17 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
Date: Thu, 25 Sep 2025 03:04:13 +0300
Message-ID: <20250925000416.2408457-2-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250925000416.2408457-1-svarbanov@suse.de>
References: <20250925000416.2408457-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Queue-Id: C24DD3F532
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_170526_809938_FA427407 
X-CRM114-Status: GOOD (  12.39  )
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

Document dt-bindings for Raspberry Pi's RP1 ADC.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
new file mode 100644
index 000000000000..5266b253fd2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rasberry Pi RP1 ADC device
+
+maintainers:
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+description: |
+  The RP1 ADC is a five input successive-approximation ADC with 12-bit
+  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
+  and one internal temperature sensor.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Reference voltage regulator 3.3V.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vref-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@400c8000 {
+      compatible = "raspberrypi,rp1-adc";
+      reg = <0x400c8000 0x4000>;
+      clocks = <&rp1_clocks 30>;
+      vref-supply = <&rp1_vdd_3v3>;
+    };
-- 
2.47.0


