Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20247CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYqU4XCnkNp8+/ZKI5EU+rCVLrRKXoIBVhhscHT//Bs=; b=cgxCjySc70riRb+DKWuhWZX0ld
	vC1FustDnZFq9BUaaDYOOELBBvamsUNUJ4hHhH5lPDUYpRQRIlqBNyLykHA9Sl0+z1VGGWwKxK6bH
	57xhrZqHBLT7GnIzn5J9ugexwTgvxnO4RtrrWOiYa4QHPv+QAj7lxvxXd/d3VBI0TXoAvlmRjfha8
	omUHbkjUAb/LR0u2HFW1guTtAZrQwNPYAaWGM/B6cG7GrRFQpikF47PlLArdnf0cqxXSVhAhDonvT
	vey6J6qoIQNJFuzeWkqONTIJXXX0v+EEouQ6oa8K7RFXvPAfDBScYLixJMpU0OEA6maD7/u3q+E2z
	3QOSFpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a9-0000000AFk1-0HdB;
	Sun, 23 Nov 2025 08:36:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a6-0000000AFhn-0Re7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 08:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D5E443B6;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C621C116B1;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763886984;
	bh=4VcxCMgYhmMmtFoirHuT2VY7mXYknw3cZfIwfQ93BDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ADdLpRe8tjByzXw83VIaT5hoSXH7vb1EdbIkOztecE5k7keW7iypTqd+doDcoT/F/
	 y23qn+6Vz26wH0BEVOl1n/wjVL/elMdNjB7U5UwS3/os/5ATZAVwPfAd7roHlDfVlM
	 NyZ7upDErTe9OAx6dgO8EWL1xK/LsQwCjLjgTy9w2ZVsBJdxl8MFAKdp6jyI8TKthB
	 UH+F+aspDg0WXrXyQijcSZ+onyjNlBGo9qgz4mb0QFNHaGmWflZPMhnklPLW64uB+X
	 nUU+1L8me725OoN17cUemaJX0XmmTSX/9SjIVuUOKPirs5lyMJK5BLNBcPV4RsNSt+
	 ggzduqEyewamA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71784CFD318;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 23 Nov 2025 08:35:50 +0000
Subject: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
In-Reply-To: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763886983; l=1124;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=ak0DhAM6ewGMiDuF0MxJPbPRxRy5VTuNwAK+zQj0j2o=;
 b=mnGqbVl/z06LDtgfnWHySKhlpzdB1tI4sr08M43fZvaKI1QcLj53kcG8lfxv77MkytMWWtr3k
 noSNgWtq7qIDsQ+UoA9apDtsiFUsGzHKu5mAgTiqkWWxOP57RsbPlrE
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_003626_195920_6CB73CD7 
X-CRM114-Status: UNSURE (   9.28  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Add a regulator supply property for VBUS when usb is in OTG mode.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 3de4dc40b791..a529f18c4918 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -32,6 +32,9 @@ properties:
     description:
       Properties for usb c connector.
 
+  otg-vbus-supply:
+    description: Regulator to control OTG VBUS supply.
+
 required:
   - compatible
   - reg
@@ -53,6 +56,7 @@ examples:
             reg = <0x25>;
             interrupt-parent = <&gpa8>;
             interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            otg-vbus-supply = <&otg_vbus_reg>;
 
             connector {
                 compatible = "usb-c-connector";

-- 
2.52.0.rc2.455.g230fcf2819-goog



