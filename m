Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE73E8B37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 22:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bkENfTlk9MJxxVdeYCjQOkydrXQq1jYHRUkjouji/U=; b=XSFvxGJjt807/ajmRywZOCUzb1
	W8yMZH3PvPLqjOpLz7u7pwehYJ1MNzWDKI6r22/Q8X3HXl6iFfiZCtTRcAzq3MOmTbjdveO+aP3fx
	nhXfco8pWOnMIMQiTpz3r/40Nd69yR1xqZwth+HdLX2FdlIHJ+nXZDfrneDKGZHRnRmq5I2MZNfRG
	cl2ZZQ+bpL+n+8LpSfbfU5ViSfiRT3tZJtHhJRflbMVvQnUCjZxHCfkNcy1LSeOa3r7E/gS9eJNmH
	hLKA6DXAJBLfcngIKuzpMiJ4CFwEelf1yEzs0q93WZgggE05NQULcRtcqXU5O3cBMEUExSXeRH+sh
	GGZsGrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPEu-00000007VT0-1A9n;
	Tue, 03 Feb 2026 22:51:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPEr-00000007VQi-31GE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 22:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56E16442CE;
	Tue,  3 Feb 2026 22:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23749C2BC9E;
	Tue,  3 Feb 2026 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770159076;
	bh=X91nXiYbk2aQj3hTKjb9O56r5Vxnbn/eV6DtlpDzA8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lwcq5ALiB+OesFqKvXvjJGqKqOTw5MtaYfUki/k4eFuthqEyuvSoTwvoqLWGQ+0v7
	 u07J0Fgx31qXN6MzMuwBdyX8B1fITA+/O4SL1j9sfDdDM2FUZlIreRmp1RVcV2eFGh
	 ZTPaNlVwfkqK9L3vZ7Z18oVXwLj5uYRzaiSmcJ5gUgpjbRZRBfR8CCwl3awcG/UBtu
	 QRJbA4rkqVQ6mjFm5QLmiMWmXpFocLYQH0/PHKkBWSHVUU2Ry+MBqO8K2qWI9u1+d/
	 XEFiv3Yv0eqS5Jp+Rzmz60PjwTH9cEqKhY2F8gKmCpaV8TxtMFgu/AABq0DnYhtpBN
	 +VI+1oXB3UAwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB35E8B37C;
	Tue,  3 Feb 2026 22:51:16 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 03 Feb 2026 22:50:28 +0000
Subject: [PATCH v5 2/5] dt-bindings: usb: maxim,max33359: Add supply
 property for vbus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-max77759-charger-v5-2-b50395376a5f@google.com>
References: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
In-Reply-To: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
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
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770159074; l=1332;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=qjOKPP6fH2LqYd2U1uPm5o7hj5uICSO7E5/ipdyMADM=;
 b=YRz56XUmrW3hJ51fTWbWJBHEqUxLf7rdB7vONG+KoIlUJ8W8akgzcJXY0QXf54c+pH+jBIDy2
 CDY4TPj5s5eDzwPGwhEvnMjjvC6bE1TlkXiH/eA7dBLZyQ8xmGXakvC
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_145117_801359_91F7CFAD 
X-CRM114-Status: UNSURE (   9.13  )
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

Add a regulator supply property for vbus. This notifies the regulator
provider to source vbus when Type-C operates in Source power mode,
while turn off sourcing vbus when operating in Sink mode or
disconnected.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 3de4dc40b79192b60443421b557bd2fb18683bf7..e652a24902eac93396fc61281cc9e2cb1d37a390 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -32,6 +32,9 @@ properties:
     description:
       Properties for usb c connector.
 
+  vbus-supply:
+    description: Regulator to control sourcing Vbus.
+
 required:
   - compatible
   - reg
@@ -53,6 +56,7 @@ examples:
             reg = <0x25>;
             interrupt-parent = <&gpa8>;
             interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            vbus-supply = <&chgin_otg_reg>;
 
             connector {
                 compatible = "usb-c-connector";

-- 
2.53.0.rc2.204.g2597b5adb4-goog



