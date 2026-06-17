Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F8CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTX+G1brkX1DXdkMsu+ZUULVkBS5SUKuLjC/zfb0+Pg=; b=q/8P7SSG51dMgvWskEJ52PDzhT
	OoJQKBiCtp9TzLkzlXM6o03vWPeepBCyWU4WTrNT28yArtuueCAYLVpYuccDGz9uA5BnFOZd1eA4j
	lXQwZ2EyAr5aEpV4J9gUEKF60UkPeW9ovaDPHqLnDFCE6xBxS/jh2JkfIo6kSmQwhCSqcJNspX+cN
	i0FpeATFcPOz8ZnhZDYCEU5SUWVhOMUUGCxS4Msrq95NYopG7qN/3b3DOewVCjdFUeanS1QeNOcsW
	i/tgQ5KEVejrKJxuUsrT8f5vNAv2x6zlY1Y8IMQTOL1fwPWqQ8R3tKNcTeHP5IH1JlHXlvWtNoAL5
	B5/CwkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmt6-0000000GyA4-17eB;
	Wed, 17 Jun 2026 09:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmt4-0000000Gy9A-47pH;
	Wed, 17 Jun 2026 09:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 965EE445CF;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6755BC4AF0F;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781689726;
	bh=7RJjhSRLrORuQ7QpJYxJUaa7YME47dK6mHpkFjegxhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gbPLBs8YUPI0ybhirSX0tF0h3sEX/w4iqUWf+HteIvQZsOu7YiIpE7Saw7lx3zfCY
	 N3eGoOFH5Oo3Ia/zOQqs4/bYMb0S6W8ebVqa3X2V4mlWhU20GUgU2kvpOlq5Yod0A5
	 LS7mX0N/vfur4nE4Fw5fNwniDG8zJk8KOcFXnp5c4tuY0/ITD3OmzDulRPjrmCiW0M
	 OH/vWIWKGz710dTwyr4djWWvyV38VTaie6YoR49Cw6ZUiVGtqRGEr/CxSYP7or9yKH
	 OugxJNwqGod+zlxVBaZ52WFAaYLSJP4R6uNCss4n8VF5oTYQe0tOfMrakUQ8WMmA39
	 8q0DVEuMjrNKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C00ECD98F7;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 17 Jun 2026 12:48:47 +0300
Subject: [PATCH v2 4/4] ARM: dts: mediatek: mt6323: add EFUSE support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt6323-nvmem-v2-4-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
In-Reply-To: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781689724; l=771;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=oXee/GlWmV/sWGn0ruKkyx1IqiA7OAnfJd9/nLpO/3U=;
 b=6uJ+OZO8oqJesmSmMdNsRIguN121Z4j27szzh4KE0Z0Nj6L1qqciqKuThetTt4Kbu75gr84f9
 P91XQBn/A4IA3FmGiNPF9ltC/pq9iIcMVD/PB92MMsCc54p+dAAF6M+
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 efuse.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c230c865116d..807e000a7ff6 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -14,6 +14,10 @@ pmic: mt6323 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		efuse {
+			compatible = "mediatek,mt6323-efuse";
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.54.0



