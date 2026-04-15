Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D4FA0C3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X9bPvF7mcCsydL00AhN1PlF3dx362Gk/jDYdD7cQsKU=; b=H1QXGMsI6SaB9bgNwoJltd9fQh
	VCwUCtVEl4DveH+61jFqcqfhOfFftuHPCthDUp63UYV7MgkID2DRhcPbrtyakgU2kwj2xXEEFtfVc
	wb3t/ipZNE7giwFWn2NJ7ku2SPy7pEo0jBGArvTkZFCjWehh+lTtxUeDbC9JI39WJJwzo9BdR3KdD
	QBc0ne3ueqiEM6zLRTm/uYnXAwGvIU2cs2vG4glL5U9aDew605KXMQL8zweP66PBkullgpL44/3/z
	CuXTERazYjB2FOtc2CGQ0S18mFUzzoXQauIU/YpRPfIJjFnB+9Qoi9ipWoORvf8yxm8aDP4VMa3Ua
	UMNKPYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubQ-00000000iYJ-445I;
	Wed, 15 Apr 2026 07:24:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubO-00000000iX7-0lXO;
	Wed, 15 Apr 2026 07:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776237835;
	bh=eRo0+yo2ngViAuu3brKHy0pNsCzdGRzaTCVPZgYzQas=;
	h=From:To:Cc:Subject:Date:From;
	b=BzYMpl5uKa165kt3aF5stFxo0UVLEHO8DhDP91xqtKCnaYPLoCsEgE0+k8bSN6rlT
	 mbOiLBmrV2T3/0exac42/PcEHGq86SeWjebaECc0ftugy58MTiIy1Pr3i8KYr+9zmr
	 g8s8jhT1xPqiCy+MXNwE/WmRYRmoxJXRnEPlPMGvhC6OUIdNRfrfnz6f7bdPMOuJyF
	 vRC3QCGx84TL0Ij3DYyInMpRKV8KeSjZ7l+HRYmq3TNauBJPpE+ko32s0lkhFPVP+D
	 PpkwmHBihwif05WfVOS8CKEga6DmHsf7VDRaMB9cneBAe4jbU3MOjhXa7PEnFEFNLC
	 iE+WOCPKKZVGQ==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B967617E131B;
	Wed, 15 Apr 2026 09:23:54 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v14 0/5] Add support for Verisilicon IOMMU used by media codec blocks
Date: Wed, 15 Apr 2026 09:23:36 +0200
Message-ID: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_002358_368485_014D91E5 
X-CRM114-Status: GOOD (  17.95  )
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

Hi all,

This patch series adds support for the Verisilicon IOMMU, which is found in front
of hardware encoder and decoder blocks in several SoCs using Verisilicon IP. 
A first implementation of this IOMMU is available on the Rockchip RK3588 SoC.

Rockchip provides a driver for this hardware in their 6.1 kernel branch:
https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c

This series includes:
- a new binding for the Verisilicon IOMMU
- a driver implementation
- DT updates for RK3588

The driver was forward-ported from Rockchip’s 6.1 implementation, 
the prefix was renamed to vsi for generality, and several fixes were
applied.

AV1 decoding was tested using the stateless VPU driver and Fluster.
The test results show a score of 205/239, which confirms that no
regressions were introduced by this series.

Feedback and testing welcome.

changes in version 14:
 - Flush TLB after each map/unmap operations.
 - Remove vsi_iommu_restore_ctx() and do not touch Verisilicon stateless
   video decoder.
 - Allow to build the driver as a module.

changes in version 13:
 - On top the driver file explicit why the hardware is different than Rockchip IOMMU
 - Document why vsi_iommu_restore_ctx() is needed when using Verisilicon
   stateless video decoder.

changes in version 12:
- Remove useless vsi_iommu_flush_tlb_all()
- Merge MAINTAINERS changes in the patch introducing VSI iommu driver


Benjamin Gaignard (5):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
  arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
  arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588

 .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/vsi-iommu.c                     | 796 ++++++++++++++++++
 8 files changed, 901 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c

-- 
2.43.0


