Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2385C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLsX/gs1tKsMMnKu9uGMMtuUOhuCedG9mUGeM+Jn11k=; b=EoM6uiGt6q6jsAvypFyIh4c19F
	usofusqMRGe+WCroP6R5yl6r51L9mBIg8MIo+F1+vdYeUYL248GqfLjmW1Ao+VdWMeQ4DFP2X8uvY
	iPQ5rrYf3vVAK6O6CsHyAzWNsHZ+IQlMGpkbZKaYLSrFctZf+rV5SgPIoTN294i1qBO7z2UkvFiZp
	8q94R8GExZL4dFoSIDccE/+G9S65r3j+VpmLYaxcYM+PO9Egjedp0UbLXGmpe7zx7rb32Ob8NuY2F
	/LHqG0RFMdY1M4abYX30jjczNeccDvJZJgLn9MXoso1YdmTCHBIXfKLTtSjIn+r1Zx0bSsvd2F56P
	/0XPFSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WQe-0000000EBCs-1X7e;
	Fri, 18 Sep 2026 11:06:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WQd-0000000EBBd-0GN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61299447C4;
	Fri, 18 Sep 2026 11:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3727CC2BCB8;
	Fri, 18 Sep 2026 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789729610;
	bh=SxIZzWCnD27F3bETzw8GzrIINZnH9G/TAzwOYgMlEyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qmJYjHpFv75j9+oIfrEunA8PLhMig/+P9mUDlBNFS7sIsGBI38j1wB+ya33KmVUGG
	 YAhLDr2QF5NcFWJDM/KNbO6nEWbyux+TGiwNElO8zam71Uuz+BfKP0gZ+hU9Q1o2KM
	 S+i8HZTSYcYcqBzHuVN+lm/AYmTiWMcznX0kznBG8alfXfLgS0565Z6305zF5P4gYM
	 QqhwYI+FBCCeoSGIx49RK+ckBDEShlYIE/0r8dls6VTLN0kekxT1O2cXpSnVBc/B3A
	 3ugH3YI6x83jZmWVGR09RLreOkDSTytuqc9n+xzCYskGhslHeAKUYj0PjRDlXzvd5i
	 hpk6FKfRxADJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156CCC982D6;
	Fri, 18 Sep 2026 11:06:50 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 18 Sep 2026 21:06:44 +1000
Subject: [PATCH v2 01/10] dt-bindings: mailbox: apple: Add M3 ASC mailbox
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-apple-mtp-keyboard-final-v2-1-a5c685e50b60@gmail.com>
References: <20260918-apple-mtp-keyboard-final-v2-0-a5c685e50b60@gmail.com>
In-Reply-To: <20260918-apple-mtp-keyboard-final-v2-0-a5c685e50b60@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>, Julian Braha <julianbraha@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789729608; l=1133;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=jWZaHgDdQBahv3cP0BkPbF81okNWtgFAdgZ27z/Vurk=;
 b=NgcEIACFNZmoME8QwmiMnJLz74jcA0zAHgOuztZXA/3Iw5uxazVfZiqOhirJuEmNb9Gn9PjB4
 ODfjjfyrivwBzJmK3yAAI4FyYqCypCMEu8J12WYo38Lim4nG6EmaXx0
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

Add the t8122, t6030 and t6031 ASC mailbox compatibles used by the
MTP coprocessor on M3, M3 Pro and M3 Max SoCs. They share the existing
ASC v4 mailbox interface.

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 28985cc62..9a6dfb0b2 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -30,8 +30,11 @@ properties:
           - enum:
               - apple,t8103-asc-mailbox
               - apple,t8112-asc-mailbox
+              - apple,t8122-asc-mailbox
               - apple,t6000-asc-mailbox
               - apple,t6020-asc-mailbox
+              - apple,t6030-asc-mailbox
+              - apple,t6031-asc-mailbox
           - const: apple,asc-mailbox-v4
 
       - description:

-- 
2.55.0



