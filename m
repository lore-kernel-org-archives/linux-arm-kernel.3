Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27130C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLsX/gs1tKsMMnKu9uGMMtuUOhuCedG9mUGeM+Jn11k=; b=llGAnB6C2dezgaCiwHaK2LGAd+
	OjTI4F3Ce5SEGIDjAewzAWrhMItXj1L8HhLNXGaYBZJXhKG/10DaMcqnAfh6dU6SPC1FqhB+NhKuQ
	XBQFCEmEYClipLYeXW1FtteNDwhIqeGJLlURUNIxpWlvW/p7bbSUDoAWBWXvA+5e0s+JpIzPJbymU
	ULPN3f6JWZkdpDs/HqsBaCatPGOorApxG67gfxO9I430KHcSvYL87ezB6JrJYPIhP/VornbJo1uIq
	UwgsN9NaiOW3LWOhhl9Lr8o/A8Ff3uxDFcLBVZdALFaYS/vbPT8wDKnYYhxzPvD3b1qa/Iu3bnb9V
	Uri/mPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YeP-0000000EW1K-322R;
	Fri, 18 Sep 2026 13:29:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ydu-0000000EVf0-3V6B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7066660A58;
	Fri, 18 Sep 2026 13:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 052B5C2BCF6;
	Fri, 18 Sep 2026 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789738120;
	bh=SxIZzWCnD27F3bETzw8GzrIINZnH9G/TAzwOYgMlEyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PPhxwElJDmWds9qb+1aJB3nANMP20ueAteYvomAU6dgMPKaKwWAQ9pJWoY+p7AOXu
	 dPDWYiCeo0IOESfwQnyArsclOP9mNnz3J9qh19vUrm2ZSUdkIvCgVFd/22UYmByc1P
	 BRhQif6c9dXLlMWfJyLl8A66z96/kBRKSYYU5qrFGU6sQXS4hpNYbOxODOgSPLayvD
	 pb064X4Ng/OkdMwR0ek1RvCEmY7tC1MlPD46xFCBNxqgeTg36TwH55qqBsOyT/kbDc
	 9p0YJYxo3/6t0HcJmBtjkTbYRFZIBZw/+AWCd0p9xItzFm/4/Fj0kYyKCbNBEsPv4u
	 wVWgp9I0hR5sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6427C982D8;
	Fri, 18 Sep 2026 13:28:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 18 Sep 2026 23:28:31 +1000
Subject: [PATCH v3 01/10] dt-bindings: mailbox: apple: Add M3 ASC mailbox
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-apple-mtp-keyboard-final-v3-1-e356464e454b@gmail.com>
References: <20260918-apple-mtp-keyboard-final-v3-0-e356464e454b@gmail.com>
In-Reply-To: <20260918-apple-mtp-keyboard-final-v3-0-e356464e454b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738118; l=1133;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=jWZaHgDdQBahv3cP0BkPbF81okNWtgFAdgZ27z/Vurk=;
 b=A5yWgABN5ixdoi+/6yhNozlTx8zVWdg9kL3kOjBC64ywumlXwBigB/u6lc1FxBPOcZCYYlIFC
 Ovu2lAvNgNLBWd8KOq7jAKJb5fYfhymPAjI2djCTJgcsC79ioUheCxT
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



