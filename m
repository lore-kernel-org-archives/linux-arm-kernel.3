Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B7CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF10JEnlsETKlm7kvCp7P+tLU7Hdn36ii37g+Gs8q9M=; b=Jc6zN4YxnT2bRYy3SYzfaG9eyz
	+yQhWpE71ukfjQhPh2cZl5bTYYpzLUSkvxk2/w2wF2T8yue7dFLxY4Blq1VaaHi5JndmC/+ZcK8v2
	BmK0BS18B/MxsiMvyesjdG+Zfq/cxzJ7VGIvLQRTgcNxTNxH2b59HZAFxmkRtJ4I1d7FdW08H99UI
	HOCvbo8+cWEjU1/499yXCS1gmIb9BTZkmVriYzK/p+eCGnFgn3Vg0bLqXdJ026aGTe7aSEbj4WZYH
	TP4y5JBklQLO9yz+dBKt73/M24c18YWUVDULxMb3pRF7SltC2/avRloEB7wl/XCC1cvddJZ4Sd/dq
	Ws6a65yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtwK-00000006cxE-2FLZ;
	Fri, 31 Oct 2025 18:33:32 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtw7-00000006ctO-0kEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:33:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 542E721FDB;
	Fri, 31 Oct 2025 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761935597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF10JEnlsETKlm7kvCp7P+tLU7Hdn36ii37g+Gs8q9M=;
	b=CH5afmJ+4ArbYwT89fUFQeyZeKeQFR9bFQR8GQo2aNfqpd+hvnrqHEoeKeS3xAg98aeXRt
	SBk1ahU6XOIwYhNc7xKeNX3XckxIGtwYL4ECguTfZQmrnDanXwIptjuztFBbWMDwFHbacm
	vBUjc9tXJ1qa2OQ6/5Yj2/imD9wCGIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761935597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF10JEnlsETKlm7kvCp7P+tLU7Hdn36ii37g+Gs8q9M=;
	b=4UUvAfdNbFXtmg8dJ6ZttM7x8vkl+1qx9xmSv5akF1GditjogWOlnaQ4MF6765iers5DIV
	k4CSyAIcHi9GAnAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CH5afmJ+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4UUvAfdN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761935597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF10JEnlsETKlm7kvCp7P+tLU7Hdn36ii37g+Gs8q9M=;
	b=CH5afmJ+4ArbYwT89fUFQeyZeKeQFR9bFQR8GQo2aNfqpd+hvnrqHEoeKeS3xAg98aeXRt
	SBk1ahU6XOIwYhNc7xKeNX3XckxIGtwYL4ECguTfZQmrnDanXwIptjuztFBbWMDwFHbacm
	vBUjc9tXJ1qa2OQ6/5Yj2/imD9wCGIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761935597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF10JEnlsETKlm7kvCp7P+tLU7Hdn36ii37g+Gs8q9M=;
	b=4UUvAfdNbFXtmg8dJ6ZttM7x8vkl+1qx9xmSv5akF1GditjogWOlnaQ4MF6765iers5DIV
	k4CSyAIcHi9GAnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE71213991;
	Fri, 31 Oct 2025 18:33:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sKQtLewABWmTegAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 18:33:16 +0000
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
Subject: [PATCH v3 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
Date: Fri, 31 Oct 2025 20:33:07 +0200
Message-ID: <20251031183309.1163384-3-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251031183309.1163384-1-svarbanov@suse.de>
References: <20251031183309.1163384-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 542E721FDB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLw7mkaud87zuqqztkur5718rm)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_113320_035647_94F0AE62 
X-CRM114-Status: UNSURE (   9.46  )
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
and "rpivid_asb" register ranges and also does not have clocks, update
the bindings accordingly.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 38 ++++++++++++++++---
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
index e28ef198a801..039c8e4a4c51 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
@@ -13,23 +13,21 @@ description: |
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-allOf:
-  - $ref: /schemas/watchdog/watchdog.yaml#
-
 properties:
   compatible:
     items:
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
@@ -62,7 +60,35 @@ required:
   - reg
   - "#power-domain-cells"
   - "#reset-cells"
-  - clocks
+
+allOf:
+  - $ref: /schemas/watchdog/watchdog.yaml#
+
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
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          maxItems: 1
 
 additionalProperties: false
 
-- 
2.47.0


