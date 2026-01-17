Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0DAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BBh+2qgbpQUHoDdDr6BIlnP2VoX2nm99cWm8zX7p714=; b=KNwVg3RDyVdrV4HsD8vQXbBdmt
	7zMg5R9t4iJ6uZINPHHMEdcVEmL4ifcYsqf4b2+UuLHt4ed6XEUGcNCR4vSp/K6SQWjDVvMRzEP2W
	eBnzSSIowQ15CQFswPYqhAhY2f4IzD11yWHdLqun2f9uHRcoUyY99XU/7aMD+fcjCAC3EpEJ4ZgRf
	a/h1I92OEXXw9iDvHhIvgZAyCzzwSpnYPRdlRd0EEGqxHKiuCD0zJ4nKUhLyWG3uCiPMofR4anKgX
	CGsEEs4xalFNkj6DtkzcC1UqM87rLGRkoo7mYM2kPiDjoVsWI84kwM6rsIszu1xgPtmOAG/QOgh6W
	xDR4utlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguiQ-0000000F4SQ-3MOw;
	Sat, 17 Jan 2026 01:02:58 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguiO-0000000F4Rm-3aBR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 01:02:58 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dtJNp5FL3z9vD5;
	Sat, 17 Jan 2026 02:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768611770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBh+2qgbpQUHoDdDr6BIlnP2VoX2nm99cWm8zX7p714=;
	b=Xhm6N6mks76A6Ov3xkJC7dgJ2MaVbO/mcUgNfLKkhv+OYaQ3KYOTmNU4meJysCwax3VpRq
	gDKtj/fCwdU1xFEVvt6YO8Mp3+6GElrTpJJs0lnXo7yBvWBQs2xVILZXxo7d8FgZprxFgo
	4gvm1N6qag5VOqgv8xdpESVwwtQZXFRzsNfFUhzIu8wLBEpO6TqE97KQBJ4U4GEeC/Hrx/
	fRoFY0bQfNAjGuE1sNMP6XUej7cImeQUsbBeMU8dqu80WDjqXimK695kT0isrFvyrn3LtM
	Fa+tl1tIKckLUk0HMf9kA/ay8WPHzAhcoR35KcV86V0nX6SrgqPY6lSwASglDw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=RRFxTyQv;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768611768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBh+2qgbpQUHoDdDr6BIlnP2VoX2nm99cWm8zX7p714=;
	b=RRFxTyQvLLwFd3nQlZ1ju6DXpJUsakpguv9UKXuBeSlLlsLr9tRFI/kMXZnPY+G4rtxoyA
	Eltx80J9LBOE6DknwbRjO3/PsxNzD1gCerh57es3ddI/5PAPj7/CNnyGJ6RR6J2hr1Unef
	yO86pwm1B29Vx0UFv+0TunRkq5bCYceVgWMYqIFsdz2RGZE19MPKRGkWh/wLNRg/WWkOhc
	xW9mn0TPKnnaucFSKIzFqlzXUDHtGw0Zq/y86lhYKS53mB2CwP87tt2qgiA2rUpNoNwWWg
	YIvQIRHV0fvtpK/1wE9b2YW5RFDNriXPltmyfo/AQeJGx3RJ+lvJgcEjdhq8hw==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
Date: Sat, 17 Jan 2026 02:02:28 +0100
Message-ID: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qc7wgykt7qnp4aab8fxq11e6mrj3judq
X-MBO-RS-ID: 55b7f5a610ad4e19108
X-Rspamd-Queue-Id: 4dtJNp5FL3z9vD5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_170257_036388_D1CEEE7D 
X-CRM114-Status: GOOD (  10.82  )
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

Document new property arm,no-completion-irq . This optional property
is intended for hardware that does not generate completion interrupts
and can be used to unconditionally enable forced polling mode of
operation.

With this property set, such implementations which do not generate
interrupts can be interacted with, until they are fixed to generate
interrupts properly.

Note that, because the original base protocol exchange also requires
some sort of completion mechanism, it is not possible to query SCMI
itself for this property and it must be described in DT. While this
does look a bit like policy, the SCMI provider is part of the
hardware, hence DT.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: s@mean@&t and limit poll transport to mailbox/shmem only
V3: - Reformat the commit message, expand property description to
      explicitly spell out this is hardware description.
    - Rename property from arm,poll-transport to arm,no-completion-irq
V4: - Update first paragraph of commit message and property description
    - Add RB from Rob
---
 .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..d06cca9273c48 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,13 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,no-completion-irq:
+    type: boolean
+    description:
+      This optional property is intended for hardware that does not generate
+      completion interrupts and can be used to unconditionally enable forced
+      polling mode of operation.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -379,6 +386,9 @@ then:
     - shmem
 
 else:
+  properties:
+    arm,no-completion-irq: false
+
   if:
     properties:
       compatible:
-- 
2.51.0


