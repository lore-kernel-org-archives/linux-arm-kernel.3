Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235FAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCM2+bfrXhpR+0I+qftc69buLbqEYc2i9DHZhQ382YY=; b=2j2nks95qncgedRjrlejntR0iW
	y01dE+pYj/cU3dzmWwaRQXOlUV2BrXYdfrXx4LQQ1jceOEbHG0SLXwYSMOV9zUUwmOsFzJIbLYcW9
	CwNJFS3vdgIslEVM1M0yqslbvP69i9XttgKzRNY9S7TsiXeh3KQyCCk/GX0YrttwSBvwLfH5DUcT1
	pVglbTNtxiB4xyhh5AqG0KaFHBiFoQUwJtaElO/1nrb7MyOZRXkAKyup4u0V7IArttPt/IXARvoYN
	QGSJRB+0BnXFVcxIKq/g7mbtUO+cxaSGNkUnuuVMzi3j+vou0kemMdXti3aoaTTRUWV/oREs0DQyc
	rXKHVyhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLCk-0000000EFGu-1qST;
	Mon, 28 Jul 2025 10:35:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL7u-0000000EEiE-0RxA;
	Mon, 28 Jul 2025 10:30:39 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CD7D022B59;
	Mon, 28 Jul 2025 12:30:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pu-hSX5CNDgp; Mon, 28 Jul 2025 12:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753698636; bh=Jfm+a3MgKlJehkc71YMruhRwgQp6YcyxJyDDAsg6U9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dj1ravgxkuRYsKVGCSW3SvyFQIM0EK24lPgw+PyZ7UsFuqc1uTmMPVrXup/mrHAkg
	 H6xokRarAW7zexhG8HzfKX+MqNobF8K88y1jZawn3FHl9Sh4wc+ssyZdMMWoBDmF+Z
	 Gw6vAWe4LRlINp8Jdh/hIZbI0ip4MGez/0IUNFumDyeXoXJQx01IKvdWVCtjXaJW+Q
	 2ytRew78fOB1OlugCfvqX59yxJhKwo3UPMCeG6TyyWoFPJv6+XmWRJgjxaMvCU3thV
	 noK/3IEodeyb6y06JxK+L/b56M1W5hNxIfE47wOOu6RgDP6pVCBgcJOTsuqh1JK6mP
	 KMYiBf5SNfcig==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/6] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Mon, 28 Jul 2025 10:29:43 +0000
Message-ID: <20250728102947.38984-3-ziyao@disroot.org>
In-Reply-To: <20250728102947.38984-2-ziyao@disroot.org>
References: <20250728102947.38984-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_033038_321366_2E1EEC9E 
X-CRM114-Status: UNSURE (   6.07  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add compatible string for pipe-phy GRF found on RK3528 SoC, which
controls misc settings for the integrated naneng-combphy.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 1ab0b092e2a5..fe5361713167 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - rockchip,rk3288-sgrf
               - rockchip,rk3528-ioc-grf
+              - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
               - rockchip,rk3528-vpu-grf
               - rockchip,rk3562-ioc-grf
-- 
2.50.1


