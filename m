Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94DBC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dAVX+44dO9At7miE30ODCerFhSgcdp/gL2lpRm9pCDk=; b=hN2fi4cbFao9fEKC3wBP5UgahN
	hU6C8/DsnNC3Pzra58i1cNxGryOU9B70I5d0QDD3aY7rKwUV9cEbIdBfEEWVNwaXmUJAJpuzIfMDA
	Q7LSzxG41mblJuhHoJZDUVKgF77IQFXnyR65t2UzO2PqgDFj32hf0Vusq7vpqx0T6Cgiv9HhDf+v6
	YT0VjIsIws61VZy1HE1+FhcCAFR5KCmFIJyxphSW22611QMcPOFlvjhBi5k50Qx0rafc2vby93HWC
	MqY5otZVlomp9Q0P8IIrgcWvIZh/2SpnQ99R8VWiYlL1UliyR/qOZWOJdTcV6/psExFPEbfZQKms6
	LzSsEw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ7t-00000005acQ-0ox3;
	Wed, 21 Jan 2026 14:24:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ7l-00000005aYR-11c3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A7D040DDE;
	Wed, 21 Jan 2026 14:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C563C4CEF1;
	Wed, 21 Jan 2026 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769005436;
	bh=B5sSQisIlXD4nZ3RrXRQtajYlHIWif9ztQX/M/g69EA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SfOipWvpBWOHqHLsX6uq7KtY0lJsMZxhIllpbnfKPdVysw7RQTfXPdiog2POsOlN1
	 oSqGrNTwVLbhPPJDnjizrnXWEkui6KkySd18r64//lyhIT2NUmhGnu3YENRfjpQ79G
	 FDEdMM9PxMkKOxouyQlV9duFjoBjEZpP5gk41qOSXyvuaKyla4sOjPopWO6S33700D
	 5vqKpo3rI9KlaJ92BmNS2R0BqkdSBHdvftNSw/Czk2r5VFFQH+wq/zewhvgXfyZSJF
	 W30H90NtEiKrI46J0EfQBpRR+GSfIUGgMoA9kpor7Xa1JtiBXapeMYRewiVesH3sWz
	 Ci8P3b/Ti5wHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205FDC44502;
	Wed, 21 Jan 2026 14:23:56 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH RFC v2 0/4] Support multi-channel IRQs in stmmac platform
 drivers
Date: Wed, 21 Jan 2026 15:23:34 +0100
Message-Id: <20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbhcGkC/2WNQQ6CMBREr0L+2pK2QrWuTEw8gFtDCJZWfmIpt
 ogY0rvb4NLlm8m8WSBojzrAIVvA6wkDuj4B32Sguqa/a4JtYuCUl4xTSdq3bVRtX48Ra/RPItu
 9EbQQXCkGaTV4bXBejVe4nE9QpbDDMDr/WV8mtlY/ISv+hBMjlGxFKXhzo1qa3dGFkPfzkCtno
 YoxfgGY+nkStQAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769005434; l=2399;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=B5sSQisIlXD4nZ3RrXRQtajYlHIWif9ztQX/M/g69EA=;
 b=pgjYDJ88uMv/4DQOQtw/xXYRyF4ixkVKWEeXizqK7gttm+9hvXWp8ZGRCTrjfTcOhFQNNsezZ
 WZerk30IkCjCBuYFC61kg7HBiw2PtFwLmi7+HeTJX+Y0p2kH0fJkaV1
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_062357_335157_ECB3ADF6 
X-CRM114-Status: GOOD (  11.05  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The stmmac core supports two interrupt modes, controlled by the
flag STMMAC_FLAG_MULTI_MSI_EN:

- When the flag is set, the driver uses multi-channel IRQ mode (Multi-IRQ).
- Otherwise, a single IRQ line is requested (aka MAC-IRQ):

static int stmmac_request_irq(struct net_device *dev)
{
        /* Request the IRQ lines */
        if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
                ret = stmmac_request_irq_multi_msi(dev);
        else
                ret = stmmac_request_irq_single(dev);
}

At present, only PCI drivers (Intel and Loongson) make use of the Multi-IRQ
mode. This concept can be extended to DT-based embedded glue drivers
(dwmac-xxx.c).

This series adds support for reading per-channel IRQs from the DT node and
reuses the existing STMMAC_FLAG_MULTI_MSI_EN flag to enable multi-IRQ
operation in platform drivers.

The final decision if Multi-IRQ gets enabled remains on glue driver
to allow implementing any reguirements/limitions the focused platform
needs.

NXP S32G2/S32G3/S32R SoCs integrate the DWMAC IP with multi-channel
interrupt support. The dwmac-s32.c driver change is provided as an example of
enabling multi-IRQ mode for non-PCI drivers.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
Changes in v2:
- Fixed incorrect buffer len for 'rx-queue-%d' property check
- Added backward compatibility to not break old settings
- Fixed DT example in yaml
- Link to v1: https://lore.kernel.org/r/20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com

---
Jan Petrous (OSS) (4):
      net: stmmac: platform: read channels irq
      dt-bindings: net: nxp,s32-dwmac: Declare per-queue interrupts
      arm64: dts: s32: set Ethernet channel irqs
      stmmac: s32: enable support for Multi-IRQ mode

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 42 +++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 26 ++++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 26 ++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 13 ++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 38 +++++++++++++++++++-
 5 files changed, 132 insertions(+), 13 deletions(-)
---
base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
change-id: 20251209-dwmac_multi_irq-9d8f60462cc1

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



