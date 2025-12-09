Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5CCD3B7FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V5frvM3/7oJjtQxDVBI3BF6RcCedri9fezaHfrVD5uM=; b=DO+5TcXTfcQEKl
	YJ9r16i8QeyzLGiIumHMuh/Anyz25YUm1v1ps8z2ScKhmIcNHH0Fe7hJiN82OePvsOHNV3Ng/zndx
	+LM5YLi4JmcOCT8Z9owMfgQ+S9F625xfu6HDVH+Ur775PIHb2H5nY/qQtCwnRabTUXo2sKHOpm4pm
	JRnTncgPVjLPynRNrIKFVgEHWtbWl27uE4F56NbRHdOcGZN2hNUdxtg2ovCwOIhJvVE5Ju4z6hqpf
	XOzWSvKttBcbusxgfJihaCXl4nHKya0CLLr8UnnvguWc6qkSmwoOehpXY+rFId0hVpW8nTLHUEa2t
	mMpYXjT443QYSBeEqVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fq-0000000EWZf-3Ic1;
	Tue, 09 Dec 2025 16:34:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fo-0000000EWYH-1b9l;
	Tue, 09 Dec 2025 16:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298084;
	bh=MVyNdWFXaQKj/KOaxhKV47wH1Z8rT4xOoRVTsltB5nM=;
	h=From:Subject:Date:To:Cc:From;
	b=RawSdYFuRr9LPcmeHVv0dZ2nMhAV+zfTDR+K5IcjDFQ62CXFH3hfxUGJ6DZiW+vsR
	 jBa2rGFg+fgBPgu+eH3lAkEHWmYRzQtFetgMC7IaIoufGzmhs5UuIyte7xqchgOxNL
	 yTIIg0bubFCL4TnvExB7eVSnI32lp6E6hFv4c7ACNvGk9Qkmw80AS5vKtF2GfPZsrS
	 nek3CTn7YFt4wjpsKTqRyzAGLa+RAsWOlXUnstIfzCA7t+kJzv9+vgY8o4cOrCjb0T
	 SWSdyDjij/yMVxGatles9PY1UMwGhUfwmDhU373LWCfiDF+g3yq+I1ApmcL20hErT3
	 Wkb2NI/QGO0Bw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDC3317E1292;
	Tue,  9 Dec 2025 17:34:43 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 00/12] Add HDMI support for Mediatek Genio 510/700/1200-EVK
 and Radxa NIO-12L boards
Date: Tue, 09 Dec 2025 17:34:30 +0100
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NywqDMBAAfyXsuQsmxWr9leIhNasukkeTKIL47
 w21x5nDzAGJIlOCThwQaePE3hWQNwHDrN1EyKYwqErVUlV3tHnBiRx7pG3B2VjGtIbgY0bZGF3
 Lh2xVo6EEQqSR91/81V8c6bOWR74kvHUiHLy1nDvhaM/4/zyhP88vGAvUBZ0AAAA=
X-Change-ID: 20251203-mtk-genio-evk-hdmi-support-17da5161827a
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=2982;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=MVyNdWFXaQKj/KOaxhKV47wH1Z8rT4xOoRVTsltB5nM=;
 b=4SOG6oNUo8Am1C5FYpNCoOcCXaIXGUa6p1b7RQpYrj8Ibkvvbi1Xys4s0lYw1PKjqUw+zTaRS
 9/WcUpWb6zDC/sfGToCHRPBWibLvI2v9qwEWtPOqV95xzXe/TOsOOLR
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083448_611675_590D7CCB 
X-CRM114-Status: GOOD (  10.92  )
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

This patch series adds and enables the HDMI output support for the
following boards:
- Mediatek Genio 510-EVK (MT8370)
- Mediatek Genio 700-EVK (MT8390)
- Mediatek Genio 1200-EVK (MT8395)
- Radxa NIO-12L (MT8395)

Patch 1 is a 'mediatek,hdmi-phy' dt-binding fix for MT8195 SoC and a
revised version of [1], that addresses previous feedback from mailing
list ([2]).
Patch 2 was split from [1] into a separate patch and adds a MT8188 SoC
compatible in 'mediatek,hdmi-phy' dt-binding.
Patch 3 documents in 'mediatek,hdmi-phy' dt-binding extra clocks for
MT8195 SoC.
Patch 4 adds all of the nodes that are required to enable HDMI output
for MT8195 SoC and its variant (MT8395).
Patch 5 adds the same but for MT8188 SoC and its variants (MT8370,
MT8390).
Patches 6 to 11 enable HDMI output and sound support for each board.
Patch 12 enables the Mediatek HDMIv2 driver as module in defconfig.

The series is based on linux-next (tag: next-20251209).

[1] https://lore.kernel.org/linux-mediatek/20250724083914.61351-16-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/linux-mediatek/ee525312-bde1-4724-b32f-83be32c87696@kernel.org/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
AngeloGioacchino Del Regno (5):
      dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195
      arm64: dts: mediatek: mt8195: Add DPI1, HDMI, HDMI PHY/DDC nodes
      arm64: dts: mediatek: mt8188: Add DPI1, HDMI, HDMI PHY/DDC nodes
      arm64: dts: mediatek: mt8390-genio-common: Enable HDMI output
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable HDMI output

Louis-Alexis Eyraud (6):
      dt-bindings: phy: mediatek,hdmi-phy: Add support for MT8188 SoC
      arm64: dts: mediatek: mt8390-genio-common: Add HDMI sound output support
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add HDMI sound output support
      arm64: dts: mediatek: mt8395-genio-common: Enable HDMI output
      arm64: dts: mediatek: mt8395-genio-common: Add HDMI sound output support
      arm64: defconfig: Enable Mediatek HDMIv2 driver

Nícolas F. R. A. Prado (1):
      dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195

 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |  43 +++++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |  82 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |  86 ++++++++++++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 150 +++++++++++++++++++++
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 150 +++++++++++++++++++++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 150 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 656 insertions(+), 6 deletions(-)
---
base-commit: 8ebfd5290c6162d65f83f9a8acdbbf243b49a586
change-id: 20251203-mtk-genio-evk-hdmi-support-17da5161827a

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


