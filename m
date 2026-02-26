Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C06FC591F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiNhnp/UpdXltyD3LOF3MjASPAeJbDVta/vtdwARuIU=; b=w9i83Ttjjz92vOcjknqsEI8kc/
	7wls4icauw/jHkMjqfwpC73uJ7btJaqNwVm9sH9g0IIZ1L67aLRa4Zc9UPQqnTJGirEUfUKOpuxnl
	T6UfYuKE8yYx1TvSgPhQYPu7CTr3LS9kd6cEVcCTa9azH278l9IOPZnuTX3clXN/GysGfVvLndvdD
	1t+oYIsmbKftnkEtrCmccZdzRCWB1BNfb4R+g+dkk87NpjpGy4yB6Uj311K/HApE9X3Bf8qS2APkZ
	SuONinuqKN8Qk7zDDPtN4rJMhTBEGlLS4MzOUeu8zINOElDv/bNI5k5CekaSip+c5HXf5hnCkTqmm
	lXkPGWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYti-00000005x8K-043I;
	Thu, 26 Feb 2026 10:47:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYtc-00000005x2o-2jM3;
	Thu, 26 Feb 2026 10:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102821;
	bh=JlJr368Iduqmofj7bAqR0psZwFk+j7JbEHb1QjmEwow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DTUp6uPwrbPSHPVG7NghL0GBJle477+8UiwG7Q+Ab8CC6b29QnyMoocSOe8YBUdWS
	 CslAiWhBzmucgw/+chnJ1PdgnoU8wSWJx2AdJi1JHtEb3Cl5HNGeqptCjO3JEOpx2n
	 mbbpCzJvjfBVgThED2STvtiCsvOnDaMxdZSVJmM8DFGAuegvgKOstFAVhtkN04u5nv
	 ClBnKxMj1uh+fR5X4GK62c1yl4Nv6zF10tZqaXrIFFxgQgTvvn9ZGU8V/xy9t9vK+n
	 WalfxY2Llv5gMg8VALJJF8NARockUq+lrUYMzifIqTSFZOhLPpyAXxxkgx/8t6pAQD
	 CvvELNk2nwSMg==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A84FC17E0BA2;
	Thu, 26 Feb 2026 11:47:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 26 Feb 2026 12:46:54 +0200
Subject: [PATCH v4 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vdec-reg-order-rk3576-v4-2-b8d72dc75250@collabora.com>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
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
X-CRM114-CacheID: sfid-20260226_024704_830716_FBC7339B 
X-CRM114-Status: GOOD (  10.50  )
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

Provide the register blocks using the 'link,function,cache' listing,
which follows the address-based ordering and, implicitly, ensures the
unit address points to the first register range.

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


