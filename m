Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79F606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eTDK7yBO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c0Uw+g2EwxMMpWbp4sFtotQBIYOiTAKEyRcbgueiNig=; b=eTDK7yBOG3xwkooRzmM/EZJt2H
	nDo9I+284ucKMKLsOUZJ26WhARMa2yMRxPSVwChoL6YFRsFTc8QzmigqBuf7x9UBH0BYxXKHdakFM
	qBtqrKWGH2BDmV+Mo//+/ob4Gsqh4/+ptGhyyjfBYLVyrfXqiiGhNBsXqkncRoKaj4wHhXc1HVdxo
	zZ+aVzuaavR2l1QgEplzqQxPDHX0ve+HmjSyytqa6uYSWkcnoAHmC3MQSL0Z/mlyZcP1h7dnhWz0j
	frEngo/RmzqEUU9CJV/vpaf0fZPKTO9M3bfielywrLkMR4MvUNmy4SCWpQayFPynsDm08J115KZsZ
	b2L1lzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOavO-00000005TBt-0hlW;
	Wed, 04 Nov 2026 13:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOavM-00000005TBn-4C3s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:21:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A93C24038F;
	Wed,  4 Nov 2026 13:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897A71F000C1;
	Wed,  4 Nov 2026 13:21:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v7.4-rc1
Date: Wed,  4 Nov 2026 14:21:03 +0100
Message-ID: <d3335368d073f91745c2d24ffd462b11ed18f275.1793798428.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_SPI_SH_MSIOF=y (moved in commit d696b9109d2315fc ("spi:
    Fix the section ordering in accordance with the comment")),
  - Disable CONFIG_DRM_RCAR_USE_DSC (defaults to yes since commit
    c217ce005b232899 ("drm/rcar-du: dsc: Add rudimentary Renesas R-Car
    V4H DSC driver"), but only used on R-Car V4H),
  - Enable RZ/N1 timer support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.5.
---
 arch/arm/configs/shmobile_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 58059f943a9b307c..3683276dd82ebd26 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -94,8 +94,8 @@ CONFIG_I2C_RCAR=y
 CONFIG_I2C_SLAVE_EEPROM=y
 CONFIG_SPI=y
 CONFIG_SPI_RSPI=y
-CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SH_HSPI=y
+CONFIG_SPI_SH_MSIOF=y
 CONFIG_PINCTRL_RZA1=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_RZN1=y
@@ -149,6 +149,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_RCAR_DU=y
+# CONFIG_DRM_RCAR_USE_DSC is not set
 # CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
 CONFIG_DRM_SHMOBILE=y
 CONFIG_FB_DEVICE=y
@@ -199,6 +200,7 @@ CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
+CONFIG_RZN1_TIMER=y
 CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
-- 
2.43.0


