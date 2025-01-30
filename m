Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE8FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XM/PJSTpnA2AFwILJb31+OLyIh9mSlnK8aeOeRdkzIg=; b=HWvEGxBe6R/sO7
	rPYCC2zpk4JwJVReTJDm+h2sPFTGCw6yaJul6IoUuaq6fygR2YzIzjPNtqWkjxPWUV7GqGuHO0o7A
	diozMpKNbh1/XDdkTcvQGFD0wXpc8HrcSIQRgRzSVZQlUDhMhepVVgkZtzxGb1vFCQJB0jLNsEU6d
	5Gd08eJyFhFJpKMmepE3rQMvad6msdFWf1XQrbabqQx9+hbeu+4xoc04T41W4ldzoN7al1jmEalWm
	bVs/doWxltSOjqOAMfOo/5Ko4daWKFeqYpBocF0tdKsBiY3XpeBWDWcEkUyu5PPxJI5vwi1UvkZ9J
	Fw10D90dWg1w9LWLSsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTkC-00000008mFy-41iH;
	Thu, 30 Jan 2025 12:34:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTha-00000008lnE-1kug;
	Thu, 30 Jan 2025 12:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738240279;
	bh=BOe8T7yqL2fWxNPADFS1rLyrsJ45Ih63iRFkiHDXmZE=;
	h=From:Subject:Date:To:Cc:From;
	b=K83NvuMqExr+ZhY3w+crCwNhTjyuiKpJ3vafFjv8X7pb377cieVBMc6ZlzU/5k5Wc
	 gyBnr7QKEThKc/BS5nxZ50zY66mG46MzMFL4blZHNidvTn68B0F3++rMC+ptv69gP/
	 7MKjM7YEUUjwiI7a+yp51XP6FJkXAXTuYjjVVH9Z6WRsIn6Vp/hxBdOxgELjs5siVi
	 5cD0xK6FZVkDMYiyV5aTrq/e0TD3ChTTgSUOn5/6kw3N7vXiCvU4VqwAyE9efLwXK8
	 mqR0M/kV3VpdRwqouJD7DSZDMQPMDe4dH78Y4ZnqvAcqP5zbN5Ms3EUuxklLLpPCWR
	 kFP/izdTb3oaw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD7D017E10AA;
	Thu, 30 Jan 2025 13:31:18 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v2 0/3] Add Mali GPU support for Mediatek MT8370 SoC
Date: Thu, 30 Jan 2025 13:30:58 +0100
Message-Id: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAANxm2cC/22PS26EMBBEr4K8jiN/cPNZ5R7RKHKbNmMJ8MRmU
 KIRd48Ds8giy2qpX716sEwpUGZ99WCJtpBDXEpQLxVzV7uMxMNQMlNCGSGl4fPa6kZwWixOxMf
 bnWsEbzrjLeiBlb9bIh++Dub75cyJPu8FvZ5HhjYTd3Gew9pXupEa0BunLXhAaGFoal/LUmOhF
 oDkABt07K9SMTyFNB/W/PGUGmkJkRspuDYgsBVSoO36TbFfj2vIa0zfx9RNHiJPCPyzapNccGF
 LdUudMq59c3GaLMZkX4s6u+z7/gMHFpT6PgEAAA==
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738240278; l=2390;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=BOe8T7yqL2fWxNPADFS1rLyrsJ45Ih63iRFkiHDXmZE=;
 b=rZUUXKvVf0uhJKG72wmAlUlnhiFSWt0wrJxRZ7ymjVMmF3wTWaNQERDW5j+0/jU6Hu9bXI6X2
 3NoKiTJEFXECw8LX1LZCaXD7O558lYtPUesioFfKxa+piRlbHUd0Rvx
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_043122_620932_C95C68F6 
X-CRM114-Status: GOOD (  11.94  )
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
dual core), integrated in the Mediatek MT8370 SoC, to the panfrost driver
and to the mt8370.dtsi include file.

I've testing this patchset on a Mediatek Genio 510 EVK board,
with a kernel based on linux-next (tag: next-20250113) plus [1] patchset.

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

[1] https://lore.kernel.org/linux-mediatek/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
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

 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                    | 9 +++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c                     | 1 +
 3 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d
prerequisite-change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9:v2
prerequisite-patch-id: af53ae39240467340ac4c9cdbc8fdd949c5457a2
prerequisite-patch-id: ca07485956f81c1a40029b48d2b4bcf00d74fc13
prerequisite-patch-id: c34d9870b2c61d87ad8a6facba13d8970682e679
prerequisite-patch-id: 48784acdcdd8b886fdec9f21c9cb88abb327e2e1

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


