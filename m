Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DFDC7115F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVSh6W1jvU4SZ0KbskCYR2QuANoghn7xy6q8bzsz+AA=; b=pWHbb9FoBuVK8OurSqO6BWe69S
	4E9bUO/htWZRAlmfkjMN9WcVNbNGcCz+KO9bVwqIGaCIbyo7dlu2TEuzjsOL+BPxiUGzbcFG913cN
	rF9PFRqVo9n3L7daKysePORjLtTN/BTb2oBMZTN+2Of3AoZDbXP/tYbMT2/FFmhFy9AksRcfKeNvs
	zF760H7P6fDwdQLlKc8uH54dEYeXcZ9xl0JqQk9lvIAjk2M3UA04qglHu/0ivbGSHZIvuPEOKCZZg
	2B2gTl2N/Fc+xKDvEVqh3GphR7U4RwvkobwgdaPTHFc0LGxwHpllrOU+Indhh6qm1blIo69FKQPo5
	mSCBS5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLJ-000000054oF-2LmE;
	Mon, 16 Jun 2025 17:09:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBFw-00000004lsC-2A22;
	Mon, 16 Jun 2025 14:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750085773;
	bh=IPS5pyYgHpxPgbxv/IHzWa6tUPv1UYhANfe/623koZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=BxVRxFhVDcNmrDeC1P7uctqpOqyITQjUmL2LbGMF+iJg8NMWcE3x08UyLK1IYq8Xz
	 9dcQrJltVxmVug43XszNFWEAHtwAm+hhX44hB0teZVItmBmKhG58IJ/K2yPCSB0PBs
	 jt9KA4RjtPoUcF/w3CAWGVGW5uv49wFMF+YzpC3xQQP8CQgVD+KokYwALEAHpZN4Us
	 mRWFOv6TQxj7Vw+KgWfHtxP48Xh2kMN7modxcVvNbYXQSpCVMwtyOHhLybmEsqN8nY
	 PQHep9xrChhiclR2SMiAN1LHp5GDgCu7SdZv0hTY2ZwuCbFWHQpzGlBPAZGWSM14XP
	 UefVISx0bXPnw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4811:e81c:4b33:730c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE19517E088C;
	Mon, 16 Jun 2025 16:56:12 +0200 (CEST)
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
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 0/5] Add support for Verisilicon IOMMU used by media codec blocks
Date: Mon, 16 Jun 2025 16:55:48 +0200
Message-ID: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_075616_712316_00F32C4C 
X-CRM114-Status: GOOD (  15.83  )
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
- a basic driver implementation
- DT updates for RK3588
- integration with the Verisilicon VPU driver.

The driver was forward-ported from Rockchip’s 6.1 implementation, 
the prefix was renamed to vsi for generality, and several fixes were applied.

AV1 decoding was tested using the stateless VPU driver and Fluster.
The test results show a score of 205/239, which confirms that no regressions
were introduced by this series.

Feedback and testing welcome.

Thanks,
Benjamin

Benjamin Gaignard (5):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
  arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
  media: verisilicon: Flush IOMMU before decoding a frame

 .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 drivers/iommu/Kconfig                         |   8 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/vsi-iommu.c                     | 900 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_drv.c   |  11 +
 7 files changed, 1004 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c

-- 
2.43.0


