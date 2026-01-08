Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99816D232C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQoEzCSVqPyi6+KMA/unchdwfOcJY4pXKlBYZeTt5hs=; b=O3LgauNWECjvBhiSQQh1S/4vxE
	UCs4XnFAG6LQRTzIEQ0TAsXCz2zmWtBYW1ta9dtw2iKLdEC4Ao5BUb5l8L9/jcy23U/6mv+bElNBc
	rqnss0vdFSIvTza+wTmCuZDcjVPRsNVOn4iNNVNQaX9qmLovwiiJ0EQZyi12qDQPYQgTxOv3chJKq
	b6C+sTzL08Pa6f4fwZuttjXLEWOuWHUL/i3lnFMlbH2ZKAj7HhD5eNOoIRz3nFOXYQRtWGfMXX6ZA
	MtsM0W3KIt4CgWtIX67IFOztz14/7bWksnsYWynH3zj0H1iasu044lEd2M1dXrR7t0EEusgl699+t
	XeE0HA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyst-00000000y02-1UYv;
	Thu, 08 Jan 2026 22:53:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyss-00000000xze-1jC0;
	Thu, 08 Jan 2026 22:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27D3260130;
	Thu,  8 Jan 2026 22:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69EBC116C6;
	Thu,  8 Jan 2026 22:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767912816;
	bh=2sZpikIF2a6wvySDojngzYZtfZ3NdwmeMrSs/cDnWi4=;
	h=From:To:Cc:Subject:Date:From;
	b=hpD9j2hub5ofuvHRQBkdBsv3ZM49CDeVCITQTKYjWSXceLZ+iL8t8JT3esJp3CkPP
	 d2vKjHQ9YckGXjOpGau2SpCzVP7EwY9nbVWqjB/amjX8n7ngABUmZZK6+LoMM6/7v/
	 cuQ4sGgMfJqPfrAqeAuYbaXWSAEWIgJG8qPjLejqPQRsYM3M4Ol+SDCAmKDTrG1fFl
	 nLDp9bc/ZQtW6oM+LHKtv0MqJHTq5FQFJDuZGRYGIpexs0QPn1AKBY+EkfsfB3Gp2M
	 +vB8fa+Rv9VGObOxC62/S/+/5vCB1t3GBY3mPJzwYca+5ZjU3GX3m6jS9shXrV0g9S
	 j7byI+9QlW3tA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] dt-bindings: net: rockchip-dwmac: Allow "dma-coherent"
Date: Thu,  8 Jan 2026 16:53:18 -0600
Message-ID: <20260108225318.1325114-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The GMAC is coherent on RK3576, so allow the "dma-coherent" property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index d17112527dab..80c252845349 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -85,6 +85,8 @@ properties:
         - clk_mac_refout
         - clk_mac_speed
 
+  dma-coherent: true
+
   clock_in_out:
     description:
       For RGMII, it must be "input", means main clock(125MHz)
-- 
2.51.0


