Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EC0CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 06:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VRyq5BFv/LmJQq3k2ZWrKQ4fiHLxWDLoUoH5rf8Juk=; b=P/6EUK4dpJUq7rkYYPo+dCA4XE
	cL/5Cqrix1kWuP0CgzCbIk1+npgZP+2Cg7lz1w+98Z4XZrtFff+mLkYN8aO0xMai/YX6+P7TH2KJ5
	np2cf3+n675cTzV56uOwq6zK5TGeYnmDuCgIridJ/Iy3+OuouYnYc5gzdWYnXlPGiRUti41ippqo0
	kvPYXCH3jnOd/2zrkwL8BN5Aat8st3lbzIsZoq+o+vgogfYT32KrlnaoloyzHv2qYUabnmtV/Vzo1
	N4IRrxYXiBjMuN8fxM8iB3DgrzrFncI6XzNFtuF9a01B7JY0S6hQ9ka0X7RRlM9b27S+TudM0Qn7l
	xhROWN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyljC-0000000AKzr-2jty;
	Wed, 17 Sep 2025 06:33:18 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylj8-0000000AKxj-33fX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 06:33:16 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D01521E48;
	Wed, 17 Sep 2025 06:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758090786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VRyq5BFv/LmJQq3k2ZWrKQ4fiHLxWDLoUoH5rf8Juk=;
	b=0sg6TJxGorjoRPCasZN/k9a9SX0E8DYkXZE8Ps0xxIl4SdUyAYvPuKv4duHvPp8gQjwNxQ
	XePvKEsXFT9fMYicmVX/Ed+3+1eUalq5h3NVye/lr0hIEiHIp55CPfTkNxqbI91GTqYXHO
	b6UO3KCUYpUMeizM1tiwgyXY6WTIoNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758090786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VRyq5BFv/LmJQq3k2ZWrKQ4fiHLxWDLoUoH5rf8Juk=;
	b=pFXIB1wEtcNWRVNceHbX9IKpq1w+TE+XKi+edOlZZNhFiDz3HlAvHnIsGlq4FP6pBsmAd8
	jqBFsMKbmzfG90Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0sg6TJxG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pFXIB1wE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758090786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VRyq5BFv/LmJQq3k2ZWrKQ4fiHLxWDLoUoH5rf8Juk=;
	b=0sg6TJxGorjoRPCasZN/k9a9SX0E8DYkXZE8Ps0xxIl4SdUyAYvPuKv4duHvPp8gQjwNxQ
	XePvKEsXFT9fMYicmVX/Ed+3+1eUalq5h3NVye/lr0hIEiHIp55CPfTkNxqbI91GTqYXHO
	b6UO3KCUYpUMeizM1tiwgyXY6WTIoNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758090786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VRyq5BFv/LmJQq3k2ZWrKQ4fiHLxWDLoUoH5rf8Juk=;
	b=pFXIB1wEtcNWRVNceHbX9IKpq1w+TE+XKi+edOlZZNhFiDz3HlAvHnIsGlq4FP6pBsmAd8
	jqBFsMKbmzfG90Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A7531368D;
	Wed, 17 Sep 2025 06:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qKsXCCFWymiIXwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Wed, 17 Sep 2025 06:33:05 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
Date: Wed, 17 Sep 2025 09:32:31 +0300
Message-ID: <20250917063233.1270-3-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250917063233.1270-1-svarbanov@suse.de>
References: <20250917063233.1270-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLw7mkaud87zuqqztkur5718rm)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-Rspamd-Queue-Id: 2D01521E48
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_233314_921042_2276A1EB 
X-CRM114-Status: UNSURE (   9.92  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add bcm2712-pm compatible and update the bindings to satisfy it's
requirements. The PM hardware block inside bcm2712 lacks the "asb"
and "rpivid_asb" register ranges and also does not has clocks, update
the bindings accordingly.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
index e28ef198a801..c8d3d6131a8d 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
@@ -13,8 +13,7 @@ description: |
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-allOf:
-  - $ref: /schemas/watchdog/watchdog.yaml#
+$ref: /schemas/watchdog/watchdog.yaml#
 
 properties:
   compatible:
@@ -22,14 +21,15 @@ properties:
       - enum:
           - brcm,bcm2835-pm
           - brcm,bcm2711-pm
+          - brcm,bcm2712-pm
       - const: brcm,bcm2835-pm-wdt
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     items:
       - const: pm
       - const: asb
@@ -62,7 +62,25 @@ required:
   - reg
   - "#power-domain-cells"
   - "#reset-cells"
-  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2835-pm
+              - brcm,bcm2711-pm
+    then:
+      required:
+        - clocks
+
+      properties:
+        reg:
+          minItems: 2
+
+        reg-names:
+          minItems: 2
 
 additionalProperties: false
 
-- 
2.47.0


