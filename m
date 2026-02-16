Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D556E63F3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A5x9W9JmmOSorhqlD413hHZqtOfOOYh/RoEyxxqd0Jc=; b=fq6KD17b/ubWLrtvz4heN3g52G
	EFkq4D2rQQwXlrR9cdaqxOwXO2Q+iC0sAuzEV+TMw0/MI9J8hu5nz9bCsaA8wG9glBpXdUJjiFnmz
	HkTbVUkur/aL1OQpmjqUaqtEL+CxZqzRK+D4j7NlV5WrbVz4tGxCLJdt6OQMT3bv7CS6ieQt871yB
	fpiScwMV9a7wX2//1Q2gE6OyVMP7GSsWQhAjY4o2mKCvYxl8pgIMLE6PkmuI80V6cjxVQr0y/YWbo
	E+/Y13n/Lf6Htu2YkDmwj9hQAKtonKJWOgyn7n44crmBlV8T5J/lVisUgi551IGktJ8jQ3AkGfXf/
	UJaE/7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvGm-00000006Ihq-0LX8;
	Mon, 16 Feb 2026 09:51:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvGi-00000006Ifv-3AYY;
	Mon, 16 Feb 2026 09:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771235510;
	bh=biCcOHqP+do8XFkuUeXeQflxOQhc4E8/7vo1QY8UTEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=X8Y+sCYznSOAKhUXvQM3fp9wFg6Wz2ou1+E3XMf8lilRg4/15XJJ6SjTbTDut3ljm
	 6izl9yhMNJqEt5LzmT+pKLFKpYDJvhzlnyNsXWTx4RlsdyMVJ3EGjvd/zpSdqOk1uV
	 3FqXraOjn9Ekj5mhQxIUHQWWrnpXq51PVp2Bou6QyyUKXJW5xZjteWcZVev6UX+0HA
	 5gnQ24hodfAmolyGuGgzznQr2nqrWIxfeL1wip/Pns/o9dBO0I/In45K/ZqT9Ou4c8
	 VWkqmtXMyTjdlYccZuNTgGp+vHFxzR9TMQZhW1ubboNAGhjGPS1ARmykSkx26jZif3
	 rn7quSEv/IcxA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f6d2:8ed9:560e:4f27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92A7217E12E9;
	Mon, 16 Feb 2026 10:51:49 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v13 0/6] Add support for Verisilicon IOMMU used by media
Date: Mon, 16 Feb 2026 10:51:32 +0100
Message-ID: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_015152_954538_2EAA144E 
X-CRM114-Status: GOOD (  18.13  )
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

This patch series adds support for the Verisilicon IOMMU, which is found
in front
of hardware encoder and decoder blocks in several SoCs using Verisilicon
IP. 
A first implementation of this IOMMU is available on the Rockchip RK3588
SoC.

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

changes in version 13:
 - On top the driver file explicit why the hardware is different than Rockchip IOMMU
 - Document why vsi_iommu_restore_ctx() is needed when using Verisilicon
   stateless video decoder.

changes in version 12:
- Remove useless vsi_iommu_flush_tlb_all()
- Merge MAINTAINERS changes in the patch introducing VSI iommu driver

changes in version 11:
- Fix dependency issue when decoder driver is build as module.

changes in version 10:
- Update vsi_iommu_identity_attach() and vsi_iommu_attach_device()
  prototypes.
- Fix build as module issue when Verisilicon video decoder is built-in.
- Rebase on master branch.

changes in version 9:
- removing blanks lines.

Benjamin Gaignard (6):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
  media: verisilicon: AV1: Restore IOMMU context before decoding a frame
  arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
  arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588

 .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/vsi-iommu.c                     | 794 ++++++++++++++++++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  15 +
 include/linux/vsi-iommu.h                     |  21 +
 10 files changed, 935 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c
 create mode 100644 include/linux/vsi-iommu.h

-- 
2.43.0


