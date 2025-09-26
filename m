Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA3CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYZfr//Bfqxv9oWEwbXnSHi/jHGgfXUjP7T38Ql0LCY=; b=YgoEdf3ygyYyRQNBYWC9bZCiuv
	RqUaQxTCPdcoNdt1mvKuw9VoqctGQYd0EHo+gWrOZGMi7GRC1RHesaE97Y0a5OY0wcUZY4PJ7TKYG
	4EaLFf5mFUQGOUlX659VgCoFno8gkNHei6ao5IHWP2c5b24VHtPdKnBw9TFfvscDXKmQlT6fjexXi
	3lA5TYo/iPIdK6plQ9vkafGi3Ac1ZGa0cxobYuKr0hzJJWSzfZ4hVLRVfaGXuqYyM9LhT/v480WZ+
	AJNA5nGRaOrMg/wzF0yep4NifPO3Bc5SLv4hAC46tBsVuI0QrLhBXKFcB3Q0BSB13JEgwdCsvtcRz
	U+2J6sPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2D2t-00000003Y5z-0X1l;
	Fri, 26 Sep 2025 18:19:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2D2r-00000003Y4W-2RWl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 18:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFF4661F24;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B71C4CEF4;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758910788;
	bh=0CgND4WO16EtwUc3Nse3AAY8I+x8THVa8IhQIsivJLs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EFqQZElBdFonxbZXptHxBGcF7HN72o2kHiE88vBtKb9UJLOLs7JAhSIjcjTBoYI+X
	 7+psEOnYSFC6rlh9JSWxyYAmyOUnp4O4NgEkT3/RWBDZVQ6yvKE+IHBrPCYoA/UfT9
	 vf6DCunRU1iF14XAzo5Ctg5IqSTcmI5B7yrC/kxDXWx3KiqquRl0UAwZfAIFw1qM81
	 tt7KVbLYQdz8i1zZloLF+NE9e2VQQiOmLOl6z5YOr5QsZReG7pigdz0yhr6BsbLDtX
	 EpjIs+bghQqJNPfjiL0Z5U1RTQj7bHMqx62lR8MOXEcLtoHQWLy3cSgBPagEat/w/J
	 +LI1Tv+bDexKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450B9CAC5B9;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH v4 0/4] usb: dwc3: add layerscape platform driver use
 flatten dwc3 core
Date: Fri, 26 Sep 2025 14:19:39 -0400
Message-Id: <20250926-ls_dma_coherence-v4-0-21e9c6bdb5cb@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzZ1mgC/33OQQqDMBAF0KtI1k2JiR1rV71HKWImYw3UKEkRi
 3j3Rje1IF3+gff/TCyQtxTYJZmYp8EG27kYskPCsKncg7g1MTMp5EmAkPwZStNWJXYNeXJIHBV
 KDXVeGC1ZZL2n2o5r5e0ec2PDq/PvdWFIl+ufsiHlgiPk2TkzUGnIrm7sj9i1bKka5JcXUu1wu
 XBSaQ6qAG30L1dbDjtcRR7/0ikKJNCb9XmeP6x5Tm0sAQAA
X-Change-ID: 20250602-ls_dma_coherence-c3c2b6f79db2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758910787; l=3727;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0CgND4WO16EtwUc3Nse3AAY8I+x8THVa8IhQIsivJLs=;
 b=f4VguHT7W5iuk/7l2407RYWfAHOiiw0M3T09v5A7GJ5UaA1ZSGrZAWbO1/F5s3AyWLcNfz3mO
 8HMzO79XgAlCYvA/HomfsHs5YAzTSKipm2h0N88JNE1Bx7i121o/vlJ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add layerscape platform driver use flatten dwc3 core to enable dma-coherence.
It needs set gsburstcfg0 to 0x2222.

There are some several try before:
[1] https://lore.kernel.org/imx/20240710-ls-dwc-v1-0-62f8cbed31d7@nxp.com/
[2] https://lore.kernel.org/imx/20240123170206.3702413-1-Frank.Li@nxp.com/

[2]: add new property, which was reject because there are no varience in
the soc. Fortunately the below commit resolve this problem by use software
managed property.

d504bfa6cfd1a usb: dwc3: enable CCI support for AMD-xilinx DWC3 controller

[1] was reject because there are not actually dwc wrap at layerscape
platform. Fortunately Bjorn Andersson's below patch to make it possible
by use correct dts dwc3 node layer out.

613a2e655d4dc usb: dwc3: core: Expose core driver as library

This resolve problem [1] and [2] by use flatten dwc3 core library.

1. add soc specific compatible string at dt-binding.
2. create platform driver for layerscape chips and pass down gsbuscfg0 if
dma-coherence enabled.
3. update layerscape dts files.

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: bjorn.andersson@oss.qualcomm.com
Cc: imx@lists.linux.dev

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- Use flatten properties, instead of use dt pass down information to core.
- Link to v3: https://lore.kernel.org/r/20250926-ls_dma_coherence-v3-0-602b1c0ce6b4@nxp.com

Changes in v3:
- skipped, accident sendout
- Link to v2: https://lore.kernel.org/r/20250923-ls_dma_coherence-v2-0-ce3176396bdb@nxp.com

Changes in v2:
- base on drivers/usb/dwc3/dwc3-generic-plat.c

commit e0b6dc00c701e600e655417aab1e100b73de821a
Author: Ze Huang <huang.ze@linux.dev>
Date:   Sat Sep 13 00:53:48 2025 +0800

    usb: dwc3: add generic driver to support flattened

    To support flattened dwc3 dt model and drop the glue layer, introduce the
    `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
    and offers an alternative to the existing glue driver `dwc3-of-simple`.

- Link to v1: https://lore.kernel.org/r/20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com

---
Frank Li (4):
      dt-bindings: usb: add missed compatible string for arm64 layerscape
      usb: dwc3: Add software-managed properties for flattened model
      usb: dwc3: dwc3-generic-plat: Add layerscape dwc3 support
      arm64: dts: layerscape: add dma-coherent for usb node

 .../devicetree/bindings/usb/fsl,ls1028a.yaml       | 33 ++++++++++++----------
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  3 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  8 ++++--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  9 ++++--
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  9 ++++--
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  8 ++++--
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  8 ++++--
 drivers/usb/dwc3/core.c                            | 12 ++++++--
 drivers/usb/dwc3/dwc3-generic-plat.c               | 14 +++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |  1 +
 drivers/usb/dwc3/glue.h                            | 14 +++++++++
 11 files changed, 89 insertions(+), 30 deletions(-)
---
base-commit: c45d2c21b3889c520bf141d576eaecb25666895c
change-id: 20250602-ls_dma_coherence-c3c2b6f79db2

Best regards,
--
Frank Li <Frank.Li@nxp.com>



