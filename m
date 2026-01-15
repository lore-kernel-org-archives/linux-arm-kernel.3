Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD74D3CC92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 00:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VgtwkFnLHLGeFiWQok6lp+mGBG+8RAMBY4LEJIBqATQ=; b=IZfaODt5wvMjtA5i/5Ba3vehSx
	PmozS0vW+d6hocdJxD0Fudkdskcs7Rl9+4mIkffQHNv2nqgFd+EdNMR5UHaZ7OhDYvfPAsP0Zka5i
	m5Bz+FyX6kbH+iEuReV7XnYtfduF3oBeyeaVans6NOby9s6BrtZ7VuJoyTf2d8vC62oPI6HmPJqxb
	YhryZR/NCxTeKUoPsMDWLHs5rX5kMO6UKS8/6/mO+x7bQTqWzvC8xO3fhRo+d1Yx/6BWmlwKLSyye
	WCTdSN9a/dNgExUdeGE8Ol+beiRwSl3gC6Jgf5J/J+sJxL5CllpegvSp0LirX7INaq3EpfV5rqAwe
	wE7rS6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBYN-0000000BHim-3wB0;
	Thu, 15 Jan 2026 00:49:35 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBYL-0000000BHhJ-2o6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 00:49:34 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ds4BK2FpTz9t6b;
	Thu, 15 Jan 2026 01:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768438169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VgtwkFnLHLGeFiWQok6lp+mGBG+8RAMBY4LEJIBqATQ=;
	b=taqLXqw4blf2geW+5SFAgncMx+ULvPFhCxOwoAxzFJl49yXFNZERBwEvqhL47I7l4fw6iD
	qLCyzFjD4x+I7FdQH6HM7GwSbEeiFwSJRjvyvDXHSjTuKwlF3B5NAkZEAgzvceuP/mxlc6
	MsvMRXA+0Q3YgqDsiIApfzzWByPdvmr1vtdorZffitlDduBBnxkz0GDMnJKYGol1VUx4TU
	zeZftX5tM/8jHnc3XpYeevkUnzXOtb6iE/5FyeGpTk3TflykGyOd+6WK09mbrohXjOGwU7
	BzNVJugLZLCA0+jfiuotvktdSkHn735QUg84YJTpfV1Nri0S6RNneTg7G078Bw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KSHFcQHL;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768438167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VgtwkFnLHLGeFiWQok6lp+mGBG+8RAMBY4LEJIBqATQ=;
	b=KSHFcQHLGPFGYoHiCKIIEDQ733nW2zdEoK2WTiBf3D/KUxLktnYA1Aq4Wq/vfTCVbYMOXM
	5v5ou+oHmErvp518WdhNk3YClFsTqzDvTxZSxkK8LNhjHgUnJ14vAzjtkQSzHsfrPtu6qR
	BsRrX/Zp9F7nZQswKEu5jiqsA0SP7kl/Jqwkm5+vr/ei2pliPfVEbHLs0inFTnBeYZjbLM
	8zA3Eftk9RlIfBYoW8YXTfs8qQ6n7xIIBKx8vaC7QBE6sNn7BK5YB4ojKrSOiiW+CCuoEv
	+wL4yUGrNig1u/cgyE1/DTORPiDatcL8QKjcVL80DMjc6hy7ruQveNu1WUOycA==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
Date: Thu, 15 Jan 2026 01:48:56 +0100
Message-ID: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4s5t3ptatd9debkizza3rmmcj79dtxan
X-MBO-RS-ID: 8336ff34b2745b0d966
X-Rspamd-Queue-Id: 4ds4BK2FpTz9t6b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_164933_857161_92D3C48D 
X-CRM114-Status: GOOD (  11.21  )
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

Document new property arm,no-completion-irq, which sets all SCMI
operation into poll mode. This is meant to work around uncooperative
SCP implementations, which do not generate completion interrupts.
This applies primarily on mbox shmem based implementations.

With this property set, such implementations which do not generate
interrupts can be interacted with, until they are fixed to generate
interrupts properly.

Note that, because the original base protocol exchange also requires
some sort of completion mechanism, it is not possible to query SCMI
itself for this property and it must be described in DT. While this
does look a bit like policy, the SCMI provider is part of the
hardware, hence DT.

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
---
 .../devicetree/bindings/firmware/arm,scmi.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..46d9a0a9a0e58 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,14 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,no-completion-irq:
+    type: boolean
+    description:
+      An optional property which unconditionally forces polling in all transports,
+      meant for hardware which does not generate completion interrupts. This is
+      mainly meant to work around uncooperative SCP or SCP firmware, which does
+      not generate completion interrupts.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -379,6 +387,9 @@ then:
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


