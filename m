Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAB0CD582D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALumBkGddtKvNohcCnsa7ZVOi9b8CPlq1/XdAqXopd8=; b=vPr49iEkBUpVbUtfCM4LgnVbJY
	rkWfHpxtg9qBtfOAsrWrGymtnhdFZ2INrDx5UdlTeeAKRkSrlyCosqIH06xJ0JT/0zuwuGbtOlXGW
	c3QhnCbGy0R4e5UDdrFjUhdmEZ7u8vKvCkdmJgBaYqsgfdJ9iDb0zngFj2z7/Cj++L1FyovDDcPIR
	gLYD6ycxE6AVOA1PSYILNGcHnqecN/5RQhnmijh09zbGgmg1OXuHAOOQhkm+M7VVM5YJB9O6B3xF8
	3w6KvTUs+7SnA9wCF5kkpX+oeM63StZle3ckLBzfGga2zT/NgVSs9wue+0TXjqfqm8z9pzd9TxlVb
	DMv/doMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQUm-0000000EezT-14wB;
	Wed, 07 Jan 2026 10:10:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQUg-0000000EeqQ-25Q8;
	Wed, 07 Jan 2026 10:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767780619;
	bh=kfoyO6mLrJT+5jwg7vHiUeoqvatV7KVxcH5i/FCsdRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACCm6TYmcyzu/GYMm3AhxMcG8OHrYxyaC6iWb2Skj903U+DZvSlbbfNaOva32Uqdh
	 h9/b3Ecl6xgR/TW9GgHdC0xao16/Ebryvi0Kfo+SHhHa6Lf5qrCtNhCZH1yCLao3g+
	 N8GEsqi6qJNwYXQ7DfFZlg/3BqwZgnmB6d+mhMptwOE/aSY9Gaog+iJ2pmalA8RByT
	 /SS5EaXV4X3Ts7MhlCQEVU99mUyA3wqr7ePdThasYIaI708eDJHZCktd6SzzOv5aVH
	 WbHteMEzAXX4uiB9/bKFyFDBnIgSil5O0laFRi7hnt5sHN/dqe+h0w0MavYUvJ5+CH
	 spOkz1OFfn0EQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7e36:2305:d47f:6e43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A635417E36C3;
	Wed,  7 Jan 2026 11:10:18 +0100 (CET)
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
Subject: [PATCH v11 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed,  7 Jan 2026 11:09:57 +0100
Message-ID: <20260107101005.84039-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_021022_694472_CA3BCCB0 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
This hardware block could be found in Radxa Rock 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..4751f7fa8bb0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1525,6 +1525,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


