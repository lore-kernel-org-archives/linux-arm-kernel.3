Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8ABEC1130
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozwi+4fYCkUXrixKX6PlDisTYF+zE4htpmrIz1L5yV4=; b=x70Yv1U/49dl3nX1G5XqNpJg41
	jwu3Ec8WJPJNPibVB16fqdI7n9z3rkHjf0+gPMfrewQV8+9yiIZXlmScgt0b2n8tw6Fgcpd1cLJ4P
	0cVoVvmwamDgbJMnOpf2QsTaSX47CrdE77xiwnm5RXwPMxcNYwMuTMjoVhIsYCHEuFf+vFWWDwr1U
	/e+/IiF3zGktc47IiT2FISssO5E5z49vrsYBHKStp9u9Y7AGlRtluYp1JZ5maN7LjbdhSjAQ85ACR
	xeCKETYLl0PyeTt8Tb0a0CycYGxU/QgG3rLQd11/NdpDrEP+8JJFXLQWYXjjqnZ8J7fbmJ04FXNHL
	D7/2YOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubwx-00000000x8V-3Zlm;
	Mon, 23 Feb 2026 19:50:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubws-00000000x4v-0Nvh;
	Mon, 23 Feb 2026 19:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771876226;
	bh=DVqWHhO2vekM/Lyr+DkEFvD5OTdKFK/9NQLT0FSko0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pMrZvIuwZhI/VHfogPLlmsh6PUF16Q2b10JvZZV9h1Poqy8sKo22jH15uWwln4kGi
	 HMolNQmg64Q7QIknqLlOKpjQipkehJVXzMYCpg+riLGQEACa3U3+JEDcKjnmQ+wq/7
	 xpxjVhkWL2SgR1P+byAUY6zU/k/SaB0/tLZUkPRBbrLLQqapAtvMLJW1INaUMs49EU
	 5atn8hZatNNAem6r9069NkMN/mRe1XtDSzv2MJVUiy7xXvOO+mJL74R3c+n6l2JZAI
	 pjDAI+qu/kosGW+eJhj6D9KqYcaOCkFKdqm8QikI8xndM+AtuPJVu/2ysQ5aONC+u9
	 wDZqv+0YPU8iQ==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD72817E0844;
	Mon, 23 Feb 2026 20:50:26 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 23 Feb 2026 21:49:50 +0200
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_115030_281448_7B25E238 
X-CRM114-Status: UNSURE (   9.95  )
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

Provide the register blocks in the expected address-based order.

Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 49ccdf12ef7e..45eb0d053a6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
 
 		vdec: video-codec@27b00000 {
 			compatible = "rockchip,rk3576-vdec";
-			reg = <0x0 0x27b00100 0x0 0x500>,
-			      <0x0 0x27b00000 0x0 0x100>,
+			reg = <0x0 0x27b00000 0x0 0x100>,
+			      <0x0 0x27b00100 0x0 0x500>,
 			      <0x0 0x27b00600 0x0 0x100>;
-			reg-names = "function", "link", "cache";
+			reg-names = "link", "function", "cache";
 			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
 				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,

-- 
2.52.0


