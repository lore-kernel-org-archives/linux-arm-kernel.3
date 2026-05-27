Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07FCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7EaBwtsdPlRjQeziiV/37Nfopb7lDpqCDauSU1czjKs=; b=KQFpBCKH6CtMmvqrCNKxxqjWd/
	NOze+9mDsCCa06su+b91RslMXAXomJPk7jcRJDr8YFEqwice0GGSwUp3vaPqIHTVFuSiLU1oPGGvz
	sNFjwpn4DJhKcajYjN9YZBTPEEgmONkp76VW1nrYtyvy/4LpVMhmyUb1PT694gUwnYxJfuKpc0zTN
	NC9h8Q7TDCLRE01w2pYyU+MYCcDz/+3k/aTChXffz0OdYqQuhZH8l38MrkSGaZEXD+fxc8CifFGJq
	K0mK3fmqUUAKHyN5Y6oHyRZEJzBev3Nj20g8nV7lnz05yKyFqVCeRJ3hqxES56DJStLk3TgZWeMIA
	KnRzkEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9pg-00000003YnH-1Od3;
	Wed, 27 May 2026 08:41:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9pf-00000003Yn7-0LQ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:41:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DAC2600AB;
	Wed, 27 May 2026 08:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F4A1F000E9;
	Wed, 27 May 2026 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871301;
	bh=7EaBwtsdPlRjQeziiV/37Nfopb7lDpqCDauSU1czjKs=;
	h=From:To:Cc:Subject:Date;
	b=ooUVImLnvoEmd4oKrq7Xs+/PE6JbyaHP8zWBqKFTUtaIAL6RoL0wSFSHY5X9OEeDG
	 lLQqZsvD6kufLytQ5MfWForiZ/svMqQdlRowcMUrD1H9pJ+Z7CycTeZRMyZKvirRCt
	 C0XF5yvxy8sTZoENfHmM8FUl0jiw3iNNWbMROvV7YZVubS2lqYmCV5ta/SZ4U6rXOz
	 sTbeXdR7GYOdwrG4dU+ASQ7dgGDrEXeD8xyjQQa561P6Lp+HLgurm7Se0cYhKIDljX
	 K768ho+aGbwHtqxu8ecxOIIgrALzZdAHviuIrppgBkqlbBRZhgsVFIDD2d32jto5bx
	 8R6uRSgr0E5yg==
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Date: Wed, 27 May 2026 10:41:35 +0200
Message-ID: <20260527084135.842736-1-mripard@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now that the system and CMA heaps can be built as modules, enable both
as modules in the arm multi_v7_defconfig.

Suggested-by: Andrew Davis <afd@ti.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2891eeba9032..3345a8eb8422 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1073,10 +1073,13 @@ CONFIG_RZN1_DMAMUX=m
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SYSTEM=m
+CONFIG_DMABUF_HEAPS_CMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_STAGING=y
 CONFIG_MFD_NVEC=y
 CONFIG_KEYBOARD_NVEC=y
-- 
2.54.0


