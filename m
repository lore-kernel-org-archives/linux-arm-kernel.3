Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91993C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11yOC0xBtLrR48kPHbjyx49hKbhUR9JVSCNhFRbbv1M=; b=CKDoRk0ieip8DrTQPy5WKlPceC
	PqdBemA1+IoZ7D/l3jVjUnXf3ZxjkfULFAEQIQWVM1z4PJJvWMN42zYbJEctYC13GGezCuCjC6Pd6
	aqdznBGkQLeIP6h3VcDScEDqzizX3mLrAQ1DBGRZwDBTx+nQN0YUnes3mbC4p4cY6rjfNj8hAoLW0
	j7ifsgO4Ogz3/q3o5W2aZTvxC6hhLNdbkC8KkCFKhi1MceOhvyYHjk7cZr7CDjsCdHeHXdVernHq9
	sd1y0+IpxajzC8Dk0HyBydBB4i/4WThy7FDVQNqUzHW2iKC/K//mwET+Fku1sjr2BAL7GWoWcpn49
	9gLYKYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgV7b-0000000ACkH-2d0x;
	Sun, 05 Jul 2026 22:15:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgV7Z-0000000ACjD-2ddh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 22:15:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C98A3600BB;
	Sun,  5 Jul 2026 22:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DFB1F000E9;
	Sun,  5 Jul 2026 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783289728;
	bh=11yOC0xBtLrR48kPHbjyx49hKbhUR9JVSCNhFRbbv1M=;
	h=From:Date:Subject:To:Cc;
	b=C5ImS2oDsK4ztlCK2n2lRz5+vFc6Vm+tWzW8kDPfGJ5yjM5XKgpmAVI95O33T3TsV
	 6ead3aHOLsMYqRLCiXh2fXD+j99UYzkTIQraZVgg5dT7+DYlEUI1MrNX+FczN93eQ+
	 3JPDywXkTs8LIVYT4ML1cW0xNiXT5jyZf1HTnAI8LxgTxmf2L+ByIWiD8kzunm08IP
	 xK0RhS6uDV7zRqDZdbhNRRWgKrp+tGQuX7+TMOafytzZUOIPRoNjIYeedEfvNiPaJd
	 LUPVRWB83FjYE4Vca5h8wdB5ym46SE48xslcGa4kbJY9hvtkj5yzXzRbBfO2Rz5q4o
	 B9qhEshmlenVA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 06 Jul 2026 00:15:24 +0200
Subject: [PATCH] RFC: ARM: dts: ixp4xx: Fix interrupt-map weirdness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ixp4xx-dts-gpio-cells-v1-1-98fa3ba0ad2d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJKYjiVQwLbH9hDIGmg6QJ4
 e5WXX6L93ZSRIHSrdgpYhOVZc4oTwW5sZ8HsPhsssY25mLOLCnUKbFflYcgCztMkzK8Lau69bD
 tlXIbIp6Sft9797e+Hy+49Tuj4/gAioL1bXkAAAA=
X-Change-ID: 20260705-ixp4xx-dts-gpio-cells-ed21349de298
To: Imre Kaloz <kaloz@openwrt.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

Building the DTBs for IXP4xx results in a few thousand lines
of this:

arch/arm/boot/dts/intel/ixp/intel-ixp42x-adi-coyote.dts:68.4-78.31:
  Warning (interrupt_map): /soc/pci@c0000000:interrupt-map:
  Missing property '#address-cells' in node /soc/gpio@c8004000,
  using 0 as fallback
(...)

I don't understand why an *interrupt* map needs address-cells, but
I suppose I am missing something. I have not seen this before but
it started appearing.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 0adeccabd4fe..b6ef98a88c4e 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -114,6 +114,7 @@ gpio0: gpio@c8004000 {
 			reg = <0xc8004000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			#address-cells = <0>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260705-ixp4xx-dts-gpio-cells-ed21349de298

Best regards,
--  
Linus Walleij <linusw@kernel.org>


