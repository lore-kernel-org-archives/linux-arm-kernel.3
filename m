Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D50CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Urf6lSvLEHxGq5qpslGhvNdQkMoQQg3TcT1dQ7VytW8=; b=RlMjEtAO5/W8Bo
	YYEWfrrggH/mgzyGTsdQ4+FngxwCG8DDjpYWxOS4o1GkIH3zyNzxTwAEqkToZQniEqfSIA8/tAJoJ
	GV6cvMmKqId9aSvH5qKvjnXiAcN51hgDmFpTDpnQd7qgkpeHvc84jn0UR0m5gvFgOPeRTpV4hqJgp
	TDu2K7kAHFCnzHb0rGVRc4RiLau1pkeAMlmUEbDk6iqIjFDYSerVT0YxPwE3FEWe9+7uuMTTO1qCb
	W6s3TMKt2L4pB7LZJA1Nhm96otffQYBbv7VnA260Yt+I/7owOO97VP3/iiQEOKs/FjNQXvZsf1PiA
	7GMtmtJd9sM2a6KrSqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ9J-0000000A2H5-0xAM;
	Fri, 07 Feb 2025 15:20:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ7u-0000000A1tJ-1yj8;
	Fri, 07 Feb 2025 15:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738941519;
	bh=44fJtIQ0gYdvGQXGwawdEhtsPL2j7xs2r9jNbZ+Vtw0=;
	h=From:Subject:Date:To:Cc:From;
	b=KTd0mt2IrrUSwBTCizNMCQniCKWZeDNusOe4iVcn9ewVPtP1zXXrqqcv6zqIs4qUw
	 WnH0vsJeI0iPFKyryp2ydJe/a4qHP2PCRuutuuyuGhi6WVpauf6HtwmCmkPPqMHbZu
	 r49+tkOmmq0rxsaHcEAODPGudl7aNxXfFvBCVxi9oqgthUzsrtUJyLWVMtm11QycUW
	 CPg4yWrQPes/ziLmv1Ob6sid9gZCO6uE+3rQ/IiRIA8D/bCPRBHN/qOmitZrbdOXUY
	 16DRaAikVEBJbXMMJ6jgdIf2mEK5Tx4nvp7JCuYnDF3fgwiohruazWxxTBy1sKBmrV
	 roQAL53VyaxiQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CDCE17E0E2C;
	Fri,  7 Feb 2025 16:18:38 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v3 0/3] Add Mali GPU support for Mediatek MT8370 SoC
Date: Fri, 07 Feb 2025 16:18:29 +0100
Message-Id: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUkpmcC/23Oy27DIBAF0F+xWJeKhwdwVv2PKgseQ4JkmwQcK
 1Xkfy91uqiq7OaONGfug1QsCSs5dA9ScE015bkF+dYRf7bzCWkKLRPBBDDOgU6LkZpRnK0bkZ4
 uNyqdijBAtEoG0u4uBWO67+bn8ZkLXm+NXp5L4mxF6vM0peXQYQATOJOoguVg+17EaDQobQajl
 QleWqXaSH6sc6pLLl973ZXv2G8z9aLZyimjzCqnDQ4CvPnweRyty8W+t/e7uIo/imSvFNEUz6E
 PzHAIDv4r27Z9AxcOAGBIAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738941518; l=2371;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=44fJtIQ0gYdvGQXGwawdEhtsPL2j7xs2r9jNbZ+Vtw0=;
 b=voG8FX6KNx/1SJrDn8JfSxWVyFvhjSGqAZ84H2Mw0wUfbIZ013ZF/yul6fMGUYUdHZXAeXyvx
 6YM6REQq4pYDzAfxmwhx2ZhaU8v7+WDWvk//mVIZAS5FtYMqRNMvqIM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_071842_680846_8441FFFB 
X-CRM114-Status: GOOD (  12.75  )
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

I've tested this patchset on a Mediatek Genio 510 EVK board,
with a kernel based on linux-next (tag: next-20250207) plus [1] patch
(not needed for building, only for testing to avoid boot issues on this
board).

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

[1] https://lore.kernel.org/all/20250124191644.2309790-1-robh@kernel.org/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
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

 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                    | 9 +++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c                     | 1 +
 3 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


