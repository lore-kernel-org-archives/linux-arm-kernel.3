Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BE4C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bk3608D6rxkzNDLm9ST/7LvgD+ivNieibH1tUJzFDOA=; b=aD/rW3508PF/gTbd3RVkFTA2Ol
	NHhdDLsGu3psaJan/DpD8HbGrxLuh1MPCwEGZlEIxl+9NP9qPO8rh4RlZOg94WU4/wmS6E4l7O+Zf
	MkugcQNVXKAFvtQh8CXzYUVPNxTHkM5RAUEQDjwdJ40RuN2eHsB6X05IDKV4Z/7wpYi/Rwi3+G4D/
	vnsT2XF+kLsJGQL9ABUO7IMlzOKZ/MozJ4j7sFRWtPHVeoAXtBPwkv5E8Zgl08KLImv6j3scRE5q8
	sx77dzBkC2foherYryiyhzf4RgLWe1QRPIYZhnveb6aduzU9VKNWJLuq5ylltiMgWkpvqFIvpo5P/
	GQQ3lKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3tw-00000009u54-2DTu;
	Mon, 19 May 2025 17:03:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Al-00000009lxX-2PHk;
	Mon, 19 May 2025 16:17:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 29C9E20E0F;
	Mon, 19 May 2025 18:17:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlFv5rkmXtdO; Mon, 19 May 2025 18:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671420; bh=8sxquyspdPCwkWa3NM8zDtB7/EjrEfYBjRyNdR/FFIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fNaeEESmJ15QCe+enopFn6vJ6+3BkIj1kJ/9PDK4HMQKFn7Lhq8zUsPzs4KPrbM0c
	 nNsVGjaHuSVcKsGfYhHCKtdw7Bni+Xq1je2qzpXDCt1TzMSOcr6LLcrhT8k3u2ItN5
	 6//OHPa/qRxJ3UBZcKJVxtqDw9Z4TqQe0BXLPVJzcMofDXMgWvcZhQHbrwuI13p7dw
	 JEWrU/Cn8a/aTpJP1c0I0Z/lEyUqfjYz0M2RJjTilzRvVW/1/pm7lxWVRrvzgtaiq0
	 jtMZTZAw6PTcPdEilrBdF8R7q7w9ePtJWN452sDJxe/XlhMQIFBwlJwFNP+pZ/bsy5
	 ZMP6RuVNnTF9w==
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
Subject: [PATCH v3 1/5] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Mon, 19 May 2025 16:16:07 +0000
Message-ID: <20250519161612.14261-2-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091703_741286_439D5F41 
X-CRM114-Status: UNSURE (   6.70  )
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
index 8cbf5b6772dd..268f72b047d8 100644
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
2.49.0


