Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+q0UGKMhrkM4aWPBsRVnBJ4VnnfQGmAhhdPmIMEDHX4=; b=1W/9Bid6wqakuyXIdTFaz4VQaA
	5M/+V+wrB3c7PjrQDvnMdM1qMYrM1N6pChwRXa7Falp6nLfLPNG2iyuv6QLwlfZbsSvWG9TOKpGDV
	HoG5VXDSlFX5B4/aTP1jStUDt3AzX7yku0RxGoFvUxsejKCbgzgORxnN1pd0z5yWyKSEqfAwwtFxJ
	RfOVmjdOwZuAqu/4sA4UAfL3qcOwe1gpgNDYbKNuHlH2LSicSmtTMZ6KgXZNnhgQs67MqSNfg5GBi
	xc+aHuB6BXJj0FwYNS8M20i5ssLKN+CCCIemKYVmPtN177DZ1F0mWMzekZU70y3n89ppxj9FFg17d
	POAqXJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAQ1-00000005q9X-0tyv;
	Tue, 08 Jul 2025 15:39:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA6v-00000005lZy-1Jdc;
	Tue, 08 Jul 2025 15:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751987994;
	bh=ldW+8NLIWI9EH03+6vgdJz7W7PLDyT0T4sDDOhAg+Wg=;
	h=From:To:Cc:Subject:Date:From;
	b=O+CkKxN93ev5LYgwxsRmUCBdvNE/oYc0sqGBkbZ1MUyp44t3xf4+NPkhZT6wvE942
	 jQ/tj8uxiQfjqptkJKJStnaUiKXwJKTvulWEPCu0ZbhwOA/0X1qFKSqOAjcHPeCQBm
	 uWUk+hibDaS74i0MBmV7/X18hRMViszziMfnInJi918cH9kY54UH6owlK0xZKgNJlH
	 HPKFSL7JsPB9irr6cg2AKGycNpMJEMViNXGZkVGSfz4duo5WkxqyCPsKRbYEhqTURo
	 GtX6MdeoBXv55dm/xfBErTeENjeudFeY7E7lkhxFXrdjOdqo2aYWLjnK9kiYpOCpRr
	 5C08OcXMP3upQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E28017E0456;
	Tue,  8 Jul 2025 17:19:53 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Tue,  8 Jul 2025 11:19:33 -0400
Message-ID: <20250708151946.374349-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_081957_506691_04ED7060 
X-CRM114-Status: GOOD (  15.03  )
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

These variants are found respectively in the RK3588 and RK3576 SoCs.
This patch only adds support for H264 and H265 in both variants.

As there is a considerable part of the code that can be shared with the
already supported rkvdec decoder driver, the support for these variants
is added here rather than writing a new driver.

This patch set uses the newly introduced EXT_SPS_RPS v4l2 control for
HEVC [1].
Therefore, a patched version of userpace tools is needed for HEVC
support (currently only added for GStreamer[2])

This patch set also depends on the preparation patch set sent earlier [3]
as well as the iommu restore fix [4] (already merged in linux-media) and
Nicolas Frattaroli's bitmap patch [5] to support setting registers that
uses upper 16 bits as masks.

[1]: https://lore.kernel.org/all/20250623160722.55938-7-detlev.casanova@collabora.com/
[2]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[3]: https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@collabora.com/
[4]: https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@collabora.com/
[5]: https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com/

Detlev Casanova (12):
  media: rkvdec: Switch to using structs instead of writel
  media: rkvdec: Move cabac table to its own source file
  media: rkvdec: Use structs to represent the HW RPS
  media: rkvdec: Move h264 functions to common file
  media: rkvdec: Add per variant configuration
  media: rkvdec: Add RCB and SRAM support
  media: rkvdec: Support per-variant interrupt handler
  media: rkvdec: Enable all clocks without naming them
  media: rkvdec: Add H264 support for the VDPU381 variant
  media: rkvdec: Add H264 support for the VDPU383 variant
  media: rkvdec: Add HEVC support for the VDPU381 variant
  media: rkvdec: Add HEVC support for the VDPU383 variant

 .../media/platform/rockchip/rkvdec/Kconfig    |    1 +
 .../media/platform/rockchip/rkvdec/Makefile   |   13 +-
 .../platform/rockchip/rkvdec/rkvdec-cabac.c   | 3944 +++++++++++++++++
 .../rockchip/rkvdec/rkvdec-h264-common.c      |  253 ++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |   81 +
 .../platform/rockchip/rkvdec/rkvdec-h264.c    |  891 +---
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  331 ++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |   99 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     |  175 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |   29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |  567 ++-
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |  469 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |  425 ++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     |  583 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |  687 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     |  284 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |  230 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  565 ++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   39 +
 20 files changed, 9073 insertions(+), 1189 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h

-- 
2.50.0


