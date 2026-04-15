Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEA3FA0C3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kKxobWAkrfDZROr26jM62M1axFtbRxASh3vcvVg/sc=; b=0LVcCNx09cs4psWX1uCPFODSt4
	br8o6cFX0cppFobGsa+wM5B9GIueDaTp2BuZ2614s9dI/TYvJFmoqlX/hYgy5L2sXTlQkLCG7bDGt
	42LrxrMM1AgicuZiI+doqJdzSow/thDpdLllm/bloarPKmPBZI2XjaL/tANVaiv/+eQD4f5fgxJxn
	lbSjmKAN9yZV+tY7jHuXxqh6zOEflFTP6zTC3wZQ86qG230Iz/cxWz77ZCFzCl8mDU0SHKhChQhoA
	f9h5klHSPwuZeqqVG2AEBNbSJZpftoboqb9xvmhbYXDEjZuvYGBXH6RWaLVbkcW+8XsoZ9SJ9h9Y1
	8EG5EzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubW-00000000ibM-12nC;
	Wed, 15 Apr 2026 07:24:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubS-00000000iYH-1DQb;
	Wed, 15 Apr 2026 07:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776237837;
	bh=xq0NdgL1l0loSI+nYSoGevbj/g7OgzAQZIHb15BgSgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kxwvc+cIAiSunnmoPcL8rhk101yoZ2cnPxwWQqYtanKdl6pfGjrgBV7Hm+0WuHlK/
	 TmG7pckOBUtrXLTrYtwNnbUgBdE9bSIFxoFPqo8yXOyy1ahFApLpEKYDWlEScrj4Mw
	 +9vxA2OmPvPfnFPiXvwbsJu3iEIAUjrmLhJruKmANGjYztd3kVL+LiS+5dKhtHttbV
	 OFoDpCW6OdkS4gA1wE1WmCUhI1j9wcPiKpXbsc8lk89k4Tn55npJ8niaHEiaNJnf1n
	 vhAxqiVHDjyHCRup9jKsFYJNdYQupFiM+JwtuXcww1jNcsJ0ipWZ1OlTQ3N9rNRSle
	 UJBycQWFA38yQ==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62A0717E144F;
	Wed, 15 Apr 2026 09:23:57 +0200 (CEST)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v14 5/5] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed, 15 Apr 2026 09:23:41 +0200
Message-ID: <20260415072349.44237-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
References: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_002402_501472_FE419135 
X-CRM114-Status: UNSURE (   8.08  )
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
This hardware block could be found in Radxa ROCK 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..b97f5008f6be 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1592,6 +1592,7 @@ CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
 CONFIG_APPLE_DART=m
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


