Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58583C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=etEqs/tNhcICim1QJPM5x4RqpX9uAdB+M3sqeuuO8Pk=; b=xvMchqFdvNOxue
	ol1BbcSpxqwvvK0WXs8EiiT/gvceVVwjuo4fsIyE/RYGLJRQH3JccZYH9bjEcHYt/ZFIriua+V06m
	/yPbw8mVt4ncwrPXgWzKvmtx7gERxqO6QpjA7hB8ug7nWaHrH0odMjhRgV2lGC2BU3bOwJEkBLjD2
	cyEIRDfjutiyhPRcBpRLWtmrAR8gWF/CL2BiTN7EfCLj5GJfEgJoXVPT3UK/oRetUtSCt5Lz8hIK2
	ycrSu+/1Znm+Myi4y+YxQR86+NoMzvAEszhxYNxVVWx9xo5CpEXxQYfGkoWd1sfsratA3JicnF730
	Rh3UheCL/73vm4Ak2OIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApMa-00000001t3a-0eEg;
	Fri, 02 May 2025 12:19:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApKb-00000001sSF-36w6;
	Fri, 02 May 2025 12:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746188246;
	bh=t4fcEpOMn8VFXMUSYrAeyCSCc3X3quab9Ebysu6G9As=;
	h=From:Subject:Date:To:Cc:From;
	b=b5X9G7ColGprEAQ5Ic///NkrEeDQG9OHjK2d8ZOxgIPDi1JeAWMxdjC3rjQ5xfiqy
	 H+jlGTLC68CJqWPrA2qcNFYsOttDqfBD6/Xb4TPeeyA8uwEmN6MELEC0X4L6A7k/9j
	 QU+E0hWS5z3j1RE2INXf+76x75gM2nturPS+GzYPg3Dok9eJQT9PuQxz6yu9Mvd5Yc
	 QDcywHVz02suO19E7kjEf9OHZCtmcGKgvAGD8ed6KDLI3nJG7axT4d5grAOyzj6JjJ
	 YeNtamX+jlMZx3oT4AYKxNwQG/OgOSR2drHQ+MBCuqMdymy72I0uuOxiR3YoedBZeX
	 PYp4aMYZmOVdw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55BFB17E0147;
	Fri,  2 May 2025 14:17:25 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v5 0/3] Add Mali GPU support for Mediatek MT8370 SoC
Date: Fri, 02 May 2025 14:17:15 +0200
Message-Id: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMu3FGgC/23Oy2rDMBAF0F8xWldFD49lZdX/KF3oMU4EfiSyY
 lKC/72KUmgoWt6Be+7cyYox4EoOzZ1E3MIaljkHeGuIO5n5iDT4nIlgAhjnQKfUS8UozsaOSI/
 nK5W2G0DDYDrpSe6dIw7hVszPr2eOeLlmOj2PxJoVqVumKaRDM+Mt0cIDE+RROIU1LfG7/LTx0
 vid7yrzG6eMMtNZ1aMW4PoPt4yjsUs073mjiJt4USSrKSIrjkPrWc/BW6gp8k8RTNUUmRUFqK1
 mYtCO15T2ReG8prQPRXm0yihwQv5X9n3/AdyGP1S5AQAA
X-Change-ID: 20250115-mt8370-enable-gpu-3b6f595fa63d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746188245; l=7495;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=t4fcEpOMn8VFXMUSYrAeyCSCc3X3quab9Ebysu6G9As=;
 b=ni/uOYzMW4SgDH9zYh3xHAT26uvp7h/im06rBtNBciY+UKxsmEqAbxHnJUl4yer3bb6p+xaUB
 CoJhoBIs5gUAtuFefq+CEfLPNqlFLN+R9kuZLBZC9pyqT8eo9eQyGMy
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_051729_934468_5ECDE24F 
X-CRM114-Status: GOOD (  19.78  )
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

This patchset adds the support of the ARM Mali G57 MC2 GPU (Valhall-JM,
dual core), integrated in the Mediatek MT8370 SoC, to the panfrost
driver and to the mt8370.dtsi include file.

Since v4 patchset was sent, the [1] patchset adds in panfrost driver
the AARCH64_4K page table format support and enablement for Mediatek
SoC with integrated Arm Mali-G57, already supported in panfrost driver
(like MT8188, MT8192, MT8195, MT8390, MT8395...).
As MT8370 SoC is a less powerful variant of MT8390 (same GPU but with
one less core for MT8370), I've reworked the second patch
('drm/panfrost: Add support for Mali on the MT8370 SoC') to enable the
AARCH64_4K mode on this SoC as well by adding specific MT8370 platform
data to set the needed flag.
The previous patch revision uses MT8186 platform data because despite
having different GPU architecture (Mali G52 2EE MC2 for MT8186, making
them not compatible), using the same plaform data, for describing the
same power management features only, was okay.
But now, the platform data also contains the GPU configuration quirk
bitfield that needs to be modified to enable the AARCH64_4K page table
format, and in order not to change MT8186 behaviour, I add specific
MT8370 platform data.
I also dropped previous code-review trailers that this patch got
previously.

I've tested this patchset on a Mediatek Genio 510 EVK board,
with a kernel based on linux-next (tag: next-20250501).

The panfrost driver probed with the following messages:
```
panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
  80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
  Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
[drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
```

Running glmark2-es2-drm is also OK:
```
=======================================================
    glmark2 2023.01
=======================================================
    OpenGL Information
    GL_VENDOR:      Mesa
    GL_RENDERER:    Mali-G57 (Panfrost)
    GL_VERSION:     OpenGL ES 3.1 Mesa 25.0.3-1
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   1200x1920 fullscreen
=======================================================
[build] use-vbo=false: FPS: 952 FrameTime: 1.051 ms
[build] use-vbo=true: FPS: 983 FrameTime: 1.018 ms
[texture] texture-filter=nearest: FPS: 906 FrameTime: 1.105 ms
[texture] texture-filter=linear: FPS: 908 FrameTime: 1.102 ms
[texture] texture-filter=mipmap: FPS: 883 FrameTime: 1.134 ms
[shading] shading=gouraud: FPS: 838 FrameTime: 1.194 ms
[shading] shading=blinn-phong-inf: FPS: 778 FrameTime: 1.287 ms
[shading] shading=phong: FPS: 583 FrameTime: 1.717 ms
[shading] shading=cel: FPS: 553 FrameTime: 1.809 ms
[bump] bump-render=high-poly: FPS: 573 FrameTime: 1.747 ms
[bump] bump-render=normals: FPS: 868 FrameTime: 1.153 ms
[bump] bump-render=height: FPS: 707 FrameTime: 1.415 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 454 FrameTime: 2.204 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 172 FrameTime:
  5.843 ms
[pulsar] light=false:quads=5:texture=false: FPS: 770 FrameTime:
  1.300 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4:
  FPS: 161 FrameTime: 6.235 ms
[desktop] effect=shadow:windows=4: FPS: 484 FrameTime: 2.069 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
  =0.5:update-method=map: FPS: 512 FrameTime: 1.955 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
  =0.5:update-method=subdata: FPS: 513 FrameTime: 1.952 ms
[buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction
  =0.5:update-method=map: FPS: 577 FrameTime: 1.735 ms
[ideas] speed=duration: FPS: 448 FrameTime: 2.235 ms
[jellyfish] <default>: FPS: 226 FrameTime: 4.440 ms
[terrain] <default>: FPS: 38 FrameTime: 26.861 ms
[shadow] <default>: FPS: 328 FrameTime: 3.051 ms
[refract] <default>: FPS: 72 FrameTime: 13.937 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 844 FrameTime:
  1.186 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 685 FrameTime: 
  1.462 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 833 FrameTime:
  1.201 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 830 FrameTime:
  1.205 ms
[function] fragment-complexity=medium:fragment-steps=5: FPS: 525 FrameTime:
  1.905 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 837
  FrameTime: 1.195 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 835 
  FrameTime: 1.199 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 550
  FrameTime: 1.820 ms
=======================================================
                                  glmark2 Score: 611 
=======================================================
```

[1] https://lore.kernel.org/dri-devel/20250324185801.168664-1-ariel.dalessandro@collabora.com/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Changes in v5:
- Rebase on linux-next (tqg: next-2020501)
- Rework 'drm/panfrost: Add support for Mali on the MT8370 SoC' patch
  to have MT8370 support with its AARCH64_4K page table format support enabled 
- Drop code-review trailers from 'drm/panfrost: Add support for Mali on
  the MT8370 SoC' patch due to major changes in content and commit message
- Add ack trailer for 'dt-bindings: gpu: mali-bifrost: Add compatible 
  for MT8370 SoC' patch
- Add glmark2-es2-drm benchmark results in cover letter
- Link to v4: https://lore.kernel.org/r/20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com

Changes in v4:
- Add warning comment in mt8370.dtsi about GPU node override
- Reword "dt-bindings: gpu: mali-bifrost: Add compatible for MT8370
  SoC" commit message
- Add code-review trailers
- Link to v3: https://lore.kernel.org/r/20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com

Changes in v3:
- Rebased on linux-next (tag: next-20250207)
- Remove prerequisite change/patch ids
- Reword commit messages to better explicit compatible needs
- Link to v2: https://lore.kernel.org/r/20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com

Changes in v2:
- Rework "drm/panfrost: Add support for Mali on the MT8370 SoC" to avoid
  data structure duplication, as requested by Krzysztof Kozlowski
- Reword commit messages to use imperative mood and make new compatible
  need more explicit
- Link to v1: https://lore.kernel.org/r/20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com

---
Louis-Alexis Eyraud (3):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
      drm/panfrost: Add support for Mali on the MT8370 SoC
      arm64: dts: mediatek: mt8370: Enable gpu support

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        |  5 ++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                 | 16 ++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c                  | 11 +++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)
---
base-commit: 1c51b1ba38c07e4f999802eb708bf798dd5f5d1b
change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


