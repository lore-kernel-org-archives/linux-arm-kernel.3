Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413F4CA0EF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 23:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5FZkf7yfJY6XEYmOmIxiA39WIYOdhrr/pXnTDbrdnQ=; b=cJ49aqgGJFLwo/UJd+BfrDAx3w
	+dmFKfGduQ12hza7EuEnyd8MY3qLKi/hmJfoGk43s3nhP48KfNUAuejhvC5WiXZXrs4XcLIZoUQZm
	RNdXjdvESkHjX1voiQ6sR9IAms8mlINUbxzxygVnBfYLorRU1fH/dLOuHRaspNiEvPLe85YGpICH4
	65avVMopltH9xY79V+paPPYszezltQgrHxNFc6cYWcSzmKHIZOAgYXOtrTjf3oOWWOsqEkFi/DZXN
	ILhLBlv+4M+siwH91b7HODgxeShcpfnvmL2QzchT07zVq12VGV7DDXo9e2vMOE/+XOOg4pnsJ1CfI
	aLx+mUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9GQ-00000008uf3-0wgp;
	Mon, 18 Aug 2025 23:27:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo93j-00000008tTD-11Vz;
	Mon, 18 Aug 2025 23:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5BE35C5EE1;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72660C116C6;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755558873;
	bh=0xx0IJoMzOucP0haOQqdQWmzEebko4LTzBsDTQcA7Mo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ERDuXmB5lB9maQtFAB+RIRVWamyRF2dRwA3I30HdV2xeolXCeNCZ/THEG+sROyiOL
	 x7Qnnpxu9/Go3IMJ9HWrnJu+unEOOCRVx69UxFP6NSmLgEW/KFjC/6XKctPCoQ7R5n
	 Hp8rwWz+QHSMhiPXOn2sQ64HaxLcJkw/9RpY4faz0/Gg7/aQn4MQyo4lgbEghQB7Ff
	 V816OuOFvkiS1gR2AfwWrXHaa8izQfo0oR6vLpyJDzyCSQO7Gr9iM9GRGFZFbl5faN
	 /QWcFoT3Wwz56BMAv8vWE5yh5Ki+oVyZbxGoHLnjl7oEhbTWeGg0gBnfUh3rL/5VMb
	 03DNdJ0McfZSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63104CA0EE4;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 19 Aug 2025 01:00:36 +0200
Subject: [PATCH v2 2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make
 power-domains non-required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v2-2-7a94f079b712@collabora.com>
References: <20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, stable@kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755558041; l=1044;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=Go0u6t1x/ipwgH+GR3AzJirmRWY+4+iYdBgXNBVJROU=;
 b=LRvqcmRsfi+qNcFR50w3OSyZhd3H4xAWaGzAUW/3tRJeUk/K7JfpQIr3eEisnHF/HQXqwjwH2
 2yocIw/v3I4DPtSQxqHpr+kuwYNjhpQJIldjuwHWgLcUy3U7x7opAhA
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_161435_366633_E1A1C26D 
X-CRM114-Status: UNSURE (   8.73  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

There are variants of the Rockchip Innosilicon CSI DPHY (e.g., the RK3568
variant) that are powered on by default as they are part of the ALIVE power
domain.
Remove 'power-domains' from the required properties in order to avoid false
negatives.

Fixes: 22c8e0a69b7f ("dt-bindings: phy: add compatible for rk356x to rockchip-inno-csi-dphy")
Cc: stable@kernel.org
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 5ac994b3c0aa..42da616ae2e3 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -57,7 +57,6 @@ required:
   - clocks
   - clock-names
   - '#phy-cells'
-  - power-domains
   - resets
   - reset-names
   - rockchip,grf

-- 
2.39.5



