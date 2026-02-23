Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40D3EA4FC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ph7qVrxeCDlnU8Y8wGboSiZ3RYERUSXYGTHwmYXKMbY=; b=Pgq62ol64j15VOOX3caS+dVv26
	DbIR/fC/Ti3J1bw5tkjEU92E38ic5IbfReh0Jw/1fZT+saZf4UoKjWDNzn9KVMnnGxFZ2qWPL42PB
	AQUCwjxJIOWLof/+F4Bc+pcmPNb9H5dYynKRhK/Mw3HNf+B7V1CESQgioaXcculh721onPne2ThSC
	0dY9F7pvR2Wj1qllZcssjR1hh5M7X2ALgogzKezsGnYidW90H9SRUms8iHddLxoFrcFIvkFZ4d46J
	zEf/I0KyZLRh6nnMDeiw49dRBgGI/xp6kf6oQ5/jOU1alto8BmvB7EIJa6A5uq2JcVNi0W3qt8yzW
	Qw8Ni61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWS6-00000000Qi9-3DAt;
	Mon, 23 Feb 2026 13:58:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWS0-00000000Qff-03jh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDE6142DC3;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3C61C116C6;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771855094;
	bh=NWu25ePSA9QcgdrFAqYIS8vaWQtv0PHPjTD9T4fKIpQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oIuPjcJ/2aujwT0Bsu10Kn6pU8scyDZ8KkT0BpcoNTR6tDY9TAjVWviG5KbV7MQ+J
	 9Dr94BbS2/UzAfztB+vIEYXN1kXYPDwkSDv8IOO85xKfsNmjAHdF8Vz8UQZo7EFo6M
	 RTiNF3yk5NpPHZGgC/4oG8aGbRZyGH0LU+NUKn0/fzRW84XrJbInXa/T9tieYVF79Q
	 CKO98OvcIQvVIGmHbUADoMvwVoFixqf5TNBtHCKsl5/njAq5SUsUsHm207xgHMKxJu
	 KtlDBeG+xHEPRnQyQzd++iLcaUUJZxI50vxqFfMHI3ERiNVeqMVfhpsZfKBdTlmhRx
	 UAA1LoyaaJ1GA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9062EEA4FA7;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH v5 0/4] Support multi-channel IRQs in stmmac platform
 drivers
Date: Mon, 23 Feb 2026 14:58:03 +0100
Message-Id: <20260223-dwmac_multi_irq-v5-0-8fc699a5fac4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtcnGkC/23N3wrCIBTH8VcZXmfo0Zl21XtEjM1pE9qfdK0i9
 u65KCjs8vuD8zkPFIx3JqBt9kDeTC64vouRrzKkm7I7Guzq2AgI5BSIwvW1LXXRXk6jK5w/Y1V
 LKwgXoDVF8WrwxrrbS9wfYjcujL2/vx5MdFnfFuWJNVFMMBO5gLIiRtnNrg9h3d2Gte5btGgTf
 ARBIpEKsAiVBAWM1GRDU4F9CywVWBS0zpmFykgl/gj8W5CpwKMgwZaMW23Bwq8wz/MTxOL+GXY
 BAAA=
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
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771855093; l=3163;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=NWu25ePSA9QcgdrFAqYIS8vaWQtv0PHPjTD9T4fKIpQ=;
 b=ggA/D4uhdh2cz3CK46Wsz6e4BGn7m9ixXSJy22LIR6S0OgBpSSlBw/JpcdMu1EjiTHSdIxcr+
 PwyGrS8RSrPD/AUuZmkQQEQoXHECYjFSWEcDaZICM7TopiRac1bYQCs
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_055816_139400_3C5936CB 
X-CRM114-Status: GOOD (  11.70  )
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
Changes in v5:
- fixed typo in "symetrical"
- cleaned negative return value on platform_get_irq_byname_optional()
  in stmmac_get_platform_resources()
- rebased on v7.0-rc1
- Link to v4: https://lore.kernel.org/r/20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com

Changes in v4:
- Fixed IRQ reading check
- Made cleaner the IRQ validity (to get AI reviewer happy)
- Fixed minItems of interrupts property in yaml
- Link to v3: https://lore.kernel.org/r/20260123-dwmac_multi_irq-v3-0-cc53f2be8961@oss.nxp.com

Changes in v3:
- removed RFC prefix
- rebased on v6.19-rc6
- fixed forgotten extra line setting to Multi-IRQ unconditionally
- fixed yaml
- Link to v2: https://lore.kernel.org/r/20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com

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

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 26 +++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 26 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 12 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 40 +++++++++++++++++++-
 5 files changed, 135 insertions(+), 13 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251209-dwmac_multi_irq-9d8f60462cc1

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



