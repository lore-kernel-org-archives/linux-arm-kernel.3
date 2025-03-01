Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22366C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awgv7+j/82T6iN87Jx+bQIhYPf4c4/82Evm52nBfYmk=; b=BaTcGLWPqEL4NP8EvVNN9zbE2c
	ViPH8+KXmmK1xplsl5l0JOy3XSJJ7OLWN34e98kDzNzZLmEBFn0In2qNzZD269QlVm3pXzktNEXLc
	TIrDSIOuQYt6XEjn9MlSUYuwgnyzr9naQH/DiToBI5Ly3mQqI6/gEP67i3f+Gm9ix1mDjFZ0jy0YB
	80lM+var83CLBd44osL7tMv9c0boNzIMDV6CkpvGhL2LQwQ4lBtKAE5ELwpF17xccbND9aTKaOCri
	HB8vmKWP8+IUpoO5zxVUlQz8mkotuwUJrWbRF2sOu9IAxdIBVw/5cVthBPhhPHZqGnp5lkIAvMXMp
	JaL4Enlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKOH-0000000DmXl-13QP;
	Sat, 01 Mar 2025 10:48:17 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKJq-0000000Dls6-1C71;
	Sat, 01 Mar 2025 10:43:43 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5D34A25DBB;
	Sat,  1 Mar 2025 11:43:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4hbEaM-UyVA; Sat,  1 Mar 2025 11:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740825816; bh=IcxoBNMF866xo6B/pUEpfJhgIiq85yQkiPhUYjcLSRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hoFZ7TZghC1eDtUuv1kanXee1IlKgZYG9RzjcQosospzlwi/nBsgFwbcx2Cb9Kfa8
	 6fEPDf5ErFx5EoJgM6Pcw9OvS0PDlvuGoI3iUgINjn0hfTc2GGX1WSmihcmNgp2pIQ
	 vw6Iyqcdb0DITFJr4sZZFC9ECPB0eMYvxxa0PI5eQrtV+5CDh7m0gl04HNuOWxrS6L
	 Sk9/WAG1V/AsSpfdgZlk3/XUfRTYs0kVu8jkCrc83uShORJoBDH9MYzGii/c+4+xtk
	 6t9n9StLL0rOBc/fSQMrAkpdk7o+exCN9X3V60TPDEu9hlW3/J889yWrFcPVXLXgcu
	 eqDQZG+xCCjxg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/8] dt-bindings: soc: rockchip: Add RK3528 VPU GRF syscon
Date: Sat,  1 Mar 2025 10:42:44 +0000
Message-ID: <20250301104250.36295-3-ziyao@disroot.org>
In-Reply-To: <20250301104250.36295-1-ziyao@disroot.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_024342_450937_F05AB065 
X-CRM114-Status: UNSURE (   8.27  )
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

Add compatible string for VPU GRF found on RK3528 SoC.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7936be79159e..d43c3f7e74fa 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - rockchip,rk3288-sgrf
               - rockchip,rk3528-vo-grf
+              - rockchip,rk3528-vpu-grf
               - rockchip,rk3566-pipe-grf
               - rockchip,rk3568-pcie3-phy-grf
               - rockchip,rk3568-pipe-grf
-- 
2.48.1


