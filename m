Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D16C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=THMlj3AhMYULtOmiSh+mVB/En26gWO8Blx9/pCJw39Q=; b=fJXGUlZxBAtoUjDCQftw/k/LlU
	cK5dNLaE45M4dn10jEMypYO2AAH47A0eShrrfgk7QtQb0PzUDNaXrlUpszLz2qiL3P+TNKBhWd+34
	zXMJOquTRDx4luAnnkl/2tEZ5h3Uk5djwR3G3F7h/gK6XTAV/LBaOo6V5xc/HilgAL86g0/6pMtdR
	X1ApyeFdhQfHopXKOQXXr6PNY2i1as8ZLUy3kJXSq3QaqPaccoTyaHB43laJiMbgqM4FH0uIWpF/i
	4SRg7lMr/+RoYrpRrWaUKqzNZea8UVYgP8eqPilguUGv7q3T/xrd8whK5AzbXxNroJUfi4XDsZcf4
	56h/jSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmw0-00000007fd1-0HfV;
	Sun, 18 May 2025 22:56:44 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmtz-00000007fQU-27Wo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1747608879;
 bh=THMlj3AhMYULtOmiSh+mVB/En26gWO8Blx9/pCJw39Q=;
 b=ZQuUIrLJPoXRWtx8YX6XHKHgAMy4K0Ry4sK8eV9dzyHWX+9CbY7+Qurt4IotcoXn82EK2O9t1
 nQm1dmatG6RVaSYk4EjvunXEcVCHJFjSd+MvGwwY8xuxa50WpqaxCtE5f5qjVHTAo5eQA0df6yU
 aNEN9C7F7YpfQnwvYuc97NY22MWsang+4kAWSbPuwr/Nt/jDTfQLBzUrvfPwZo4ZH2A8rmYj9ey
 ndlDXYt49yLtZDiLu89rksuy3sx7niB5170j1rvcBQowopbrE43MxGJneri60wfk+nxOcBkTjFN
 eYRduwOww5VbjLV4x6i6UdM6U0j9OxaFYms6I6BlvI/g==
X-Forward-Email-ID: 682a6529db63046e3392f299
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/3] rockchip: Add GPU support for RK3528
Date: Sun, 18 May 2025 22:54:10 +0000
Message-ID: <20250518225418.682182-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_155439_583172_C623613A 
X-CRM114-Status: GOOD (  12.87  )
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

This series adds support for the Mali-450 MP2 GPU in the RK3528 SoC.

The clock used for the GPU can use normal PLL to support a rate of 100,
300 or 500 MHz. Or it can use PVTPLL to reach rates up to 800 MHz.

The TF-A SCMI_CLK_GPU is used to switch use between normal PLL and
PVTPLL. When a rate of up to 300 MHz is requested TF-A switch to use
normal PLL, and for rates above 300 MHz the PVTPLL is used.

The PVTPLL can only operate when the power domain, regulators and clocks
are enabled, an opp-suspend for 300 MHz is used to ensure normal PLL is
selected before GPU is PM runtime suspended.

Driver init at boot:

  lima ff700000.gpu: gp - mali450 version major 0 minor 0
  lima ff700000.gpu: pp0 - mali450 version major 0 minor 0
  lima ff700000.gpu: pp1 - mali450 version major 0 minor 0
  lima ff700000.gpu: l2_cache0 8K, 4-way, 64byte cache line, 128bit external bus
  lima ff700000.gpu: l2_cache1 64K, 4-way, 64byte cache line, 128bit external bus
  lima ff700000.gpu: bus rate = 297000000
  lima ff700000.gpu: mod rate = 300000000
  [drm] Initialized lima 1.1.0 for ff700000.gpu n minor 0

glmark2-es2-gbm (cebbb63edfba502905470c904f8e6f1c6ce28ba9):

  =======================================================
      glmark2 2023.01
  =======================================================
      GL_VENDOR:      Mesa
      GL_RENDERER:    Mali450
      GL_VERSION:     OpenGL ES 2.0 Mesa 25.0.4
      Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
      Surface Size:  800x600 fullscreen
  =======================================================
  [build] use-vbo=false: FPS: 572 FrameTime: 1.751 ms
  [build] use-vbo=true: FPS: 715 FrameTime: 1.400 ms
  [texture] texture-filter=nearest: FPS: 735 FrameTime: 1.361 ms
  [texture] texture-filter=linear: FPS: 744 FrameTime: 1.346 ms
  [texture] texture-filter=mipmap: FPS: 758 FrameTime: 1.320 ms
  [shading] shading=gouraud: FPS: 444 FrameTime: 2.255 ms
  [shading] shading=blinn-phong-inf: FPS: 442 FrameTime: 2.267 ms
  [shading] shading=phong: FPS: 314 FrameTime: 3.186 ms
  [shading] shading=cel: FPS: 258 FrameTime: 3.877 ms
  [bump] bump-render=high-poly: FPS: 98 FrameTime: 10.279 ms
  [bump] bump-render=normals: FPS: 694 FrameTime: 1.443 ms
  [bump] bump-render=height: FPS: 551 FrameTime: 1.818 ms
  [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 161 FrameTime: 6.246 ms
  [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 47 FrameTime: 21.692 ms
  [pulsar] light=false:quads=5:texture=false: FPS: 1031 FrameTime: 0.970 ms
  [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 78 FrameTime: 12.986 ms
  [desktop] effect=shadow:windows=4: FPS: 331 FrameTime: 3.023 ms
  [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 161 FrameTime: 6.220 ms
  [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 160 FrameTime: 6.285 ms
  [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 237 FrameTime: 4.231 ms
  [ideas] speed=duration: FPS: 184 FrameTime: 5.461 ms
  [jellyfish] <default>: FPS: 200 FrameTime: 5.006 ms
  Error: SceneTerrain requires Vertex Texture Fetch support, but GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS is 0
  [terrain] <default>: Unsupported
  [shadow] <default>: FPS: 214 FrameTime: 4.691 ms
  [refract] <default>: FPS: 23 FrameTime: 43.776 ms
  [conditionals] fragment-steps=0:vertex-steps=0: FPS: 725 FrameTime: 1.380 ms
  [conditionals] fragment-steps=5:vertex-steps=0: FPS: 356 FrameTime: 2.816 ms
  [conditionals] fragment-steps=0:vertex-steps=5: FPS: 728 FrameTime: 1.375 ms
  [function] fragment-complexity=low:fragment-steps=5: FPS: 482 FrameTime: 2.077 ms
  [function] fragment-complexity=medium:fragment-steps=5: FPS: 233 FrameTime: 4.298 ms
  [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 482 FrameTime: 2.079 ms
  [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 482 FrameTime: 2.076 ms
  [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 165 FrameTime: 6.076 ms
  =======================================================
                                    glmark2 Score: 399
  ======================================================

Trying to use a GPU clock rate above 300 MHz when the GPU is PM runtime
suspended may cause the system to freeze or an SError. E.g. trying to
use a different devfreq governor or set min_freq above 300 MHz.

Similar issues also exist on RK3576 and RK3588 when SCMI_CLK_GPU is used
for devfreq, a separate series will be sent to mitigate these issues.

This series depends on patch 1-4 of the series "rockchip: Add power
controller support for RK3528" [1].

[1] https://lore.kernel.org/r/20250518220707.669515-1-jonas@kwiboo.se

Jonas Karlman (3):
  dt-bindings: gpu: mali-utgard: Add Rockchip RK3528 compatible
  arm64: dts: rockchip: Add GPU node for RK3528
  arm64: dts: rockchip: Enable GPU on Radxa E20C

 .../bindings/gpu/arm,mali-utgard.yaml         |  2 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  5 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 58 +++++++++++++++++++
 3 files changed, 65 insertions(+)

-- 
2.49.0


