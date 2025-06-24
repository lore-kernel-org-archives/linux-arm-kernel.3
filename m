Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA98EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 03:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Znum/S7SRMtmUuuQFj/yP9ccBPH/iQCljK//v5yZGVk=; b=BbIWVjJVXdtrlQ6CIsVo1tRUpX
	mpeM/WkdqEe6SiyJJZ4tv59U+ktJA/Yk2jMlE4q2GEQrs2MGZUBdszjXgcAuyhT1hFLwe0rHdTZ7k
	oqs8Kd56aA2gmsbq2mCvsVQoaagud42naENCnteMVNozXMMBdfaeL0qXfQuNEgu7yYC69fNlqAESw
	gKiB+YaH88pgZdSVGi7Nzx1sb/AUjfe2+wDrcjvXnkow7OMCZk4zreHxd5MZmOTW5Z3eKFTCk2SLT
	yNcErX3IDy+ljCEGCTdiehmI1RSMCMYnTiF5okp/AnAqH6NkaioZO8tcR/uKLJnR9chflDxR0VP0p
	0Y/5UJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuYm-00000004Z5b-1Ev8;
	Tue, 24 Jun 2025 03:43:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuTv-00000004Ygh-1X9u;
	Tue, 24 Jun 2025 03:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Znum/S7SRMtmUuuQFj/yP9ccBPH/iQCljK//v5yZGVk=; b=F0xRqOdlllcPBkWKOm099JHR6q
	r5TEhm1VJeS18vNf3Ygvcw4oiy3nXo+8C3pZbuN8I7L8qHqjPpw6eu+G3JkK2eB5V8XOe3DTlx4/T
	uwduCFVA9QkmisVY8kUGX5g6uiQsFMYJaJsKr/NKe7NRla3JfGUMD8i6OzGokI/iQ7+zLchuQyW0r
	GFZHDrA2w9WYkFeeHG3E+UV+avkqaJ+tYUGS1kIM6JRza1ZC7s3UvGAlHXXJqx7J81FIwuunVigzH
	9aM/Nx6/JD9VTXVa4floV279/Rj4raeeTpEat5NjZr1mfyCpmZT8dZNUIsfWSXubiolkUXXMEdejJ
	B/5U4LEg==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuTs-00000005NST-2OwW;
	Tue, 24 Jun 2025 03:37:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2DC3025C70;
	Tue, 24 Jun 2025 05:37:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heJSJyhvlytP; Tue, 24 Jun 2025 05:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736274; bh=utj6oBPEshKFYwO2HO/ggqVFO3Kb+yCOYzljkrGuNps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cj8iFtp0URBtjAOERfABgOSKtzq7oUscHvrpNVl1OEAHDQzVlT4hv5XFUyRrtQMmf
	 NJDR0n5Kem4lZ7zenOubi0l1yNiqrheS+ddPtbOSrdGHzmEThlYV+KOpxrF15I8pQ5
	 BTGxqDkFuxYZ8uuW5hRwciECaIDG1qcyQm5e4KYkyFpVU98Y/5/AkXpMm4zxDDtBIN
	 AUcdUP8zdi/pY/E0p6osVmEyflJDChaSSSrcX/SsTtklOq8U2gtHj23qWb4soxVl/x
	 /ing0fQl16HAHj3zWelZ80GPR2RdcGgF/oJCPPm7gf6YVrOyyhNLotDCgGz4ZFoIxT
	 zoz7nZN827cQA==
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
Subject: [PATCH v4 1/6] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Tue, 24 Jun 2025 03:37:28 +0000
Message-ID: <20250624033733.50197-2-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_043756_841320_8D6A2327 
X-CRM114-Status: UNSURE (   6.05  )
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
index ccdcc889ba8e..8ddd963838f5 100644
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


