Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6108ACA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw3PB1cASzqxZG3rj2OkZzQzyWd2jZNNHHzzORJCH3w=; b=fW8pMYTxDmF9Qr87RZYJRb6R+M
	7nspSW6fYBweDRctN07/BzSueiqGUl7VtwrOTOEO6LOBE5zIzyoa1Egq38Vz3KNG1Tyyd1juK1VWE
	yNBmSD9w2C8S6ch0bQZE8ebMDZ+/lASujJQBzh9EFK8fRypuYImqxpykl2o9KLi7+eyj681ZLEaat
	Ujlq98+TxXtORxJkEhwSHpcaIQYFfLt8Z0tFY5OzJ3w0iYPpU62QP9/SJjUwSlYQiaUe33wjNT3aE
	731RFML1cUhbJisZ0kwmJGD8/X5p7Ce+Dfp/mdT0qKcitxqpF6CugsTjfAbkUCEqPKtqEwCLY4g8/
	mhr8WcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoIQ-00000005D7B-0aeI;
	Wed, 30 Sep 2026 07:00:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoIO-00000005D65-2FXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C340743EBD;
	Wed, 30 Sep 2026 07:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0F0CC4AF14;
	Wed, 30 Sep 2026 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790751603;
	bh=me0/GaYRhRGsLTRt0o/xOAdYgAPd8saMs5gs1pazfMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eBiiYx1iUpFLgCs3jPyyLsZR9BoZkOENFXPvq3ecvlkQNGSeSI9XWjINwi7BrTAdp
	 55IgCDowjZJjY3pPgWvzwrMoPILR41AIfffMjNYCVZVQ0YGTx8CgoQY5K1V0vg9iPp
	 g6Hop6zLVODjowEapVFM/1RPcp8KB6P7hmWdVSRLC/ZjZa3EPF++b0Gf0k9cyXZ/Od
	 WdmT7LsPkYoKNkWvx4PWQ4Ak/qtwR9oXmOXRx4gn+kyc0eszAwRvc6t7wyMtqaHbD3
	 naZqyen/S57ZYy/PFrRus7h/YKQEPSquC72/73x9JAztVR+ayXQeY8HFAfHLhkryGa
	 Qfh2XOeslNuwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC888CA5FC2;
	Wed, 30 Sep 2026 07:00:02 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 30 Sep 2026 10:00:02 +0300
Subject: [PATCH RFC 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-cs75xx-v1-3-4617c4463529@gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751600; l=1236;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=zHs4d0oCr/fkCjW2IncoLpYzn3PsYpvSJVPGzM+249Y=;
 b=5NGp1Z9mv2h2Aiqk1msw4SDQyLOh8bIopneUpk9z2/71v/F+jOsc6UszjLI5N6VAxuYLJ8g2j
 aJRpOJj1wZlB3JO04HulAycLiCjFcGXIKZCahBcJ84HQ+Wlbe5HNL3d
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

On the CS7542 the bootloader parks the secondary Cortex-A9 core in a loop
that waits for an event and then jumps to the address found in a global
software register. Add the "cortina,cs7542-smp" enable method for it and,
as with the other release-address based methods, require cpu-release-addr
to point at that register.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70dac..7a394c500d6 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -269,6 +269,7 @@ properties:
           - brcm,bcm63138
           - brcm,bcm-nsp-smp
           - brcm,brahma-b15
+          - cortina,cs7542-smp
           - marvell,armada-375-smp
           - marvell,armada-380-smp
           - marvell,armada-390-smp
@@ -484,6 +485,7 @@ allOf:
         enable-method:
           enum:
             - spin-table
+            - cortina,cs7542-smp
             - renesas,r9a06g032-smp
       required:
         - enable-method

-- 
2.53.0



