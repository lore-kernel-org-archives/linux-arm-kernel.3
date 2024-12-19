Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C59E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QjQJo0IASjGQ71YyUkuwEl4QEQBkgl8EgGu9PNaoxQ=; b=XT32ySzayeeGW1nTGs9mge7dJX
	JQOWcR06+++QnD8ovuNcRqs7CedLKnFi/YlyqRmO7mq9Cu+p5haU7Q3YInp1Ia99JlnWoBNdb9/xs
	IynGX+1+jpF5hSrs65HK2D5/2lEHOY8ZQKNII35QZxx1Rko5LnITpd5k4+Rc793rcZ3oBkPIgZK6I
	WycSpjXByhSZZyG3dikxwG2jW97VGFidUGSZlzcp7Z1Zfvytpe/0tzwzXPXMFIX9HfTPcno0qi471
	us4+ZG7v0myfoFqVBweR0kFUHtMBxgat3bM4ycf0fZrIBzZ72CtHlQ4yv/DivKYXP9EXpMuKoUJfA
	v9uKqAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKWq-00000002bGm-11kr;
	Thu, 19 Dec 2024 17:41:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKO9-00000002ZaT-3dSX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:32:43 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJD57pO023671;
	Thu, 19 Dec 2024 18:32:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8QjQJo0IASjGQ71YyUkuwEl4QEQBkgl8EgGu9PNaoxQ=; b=JnStwR6VczyKl0+u
	STwY+qfYMV6AAzsVelVTMg5azwoa7Pe0HJbdmKG38pTZ8WmGy8Qs5O7NzO7sUDCx
	r7x8ZZwBh7KjF9jGWSd3sySiewaROx3vjjOgVLESJ35lJZgBuRKjf5jns24P3ekG
	cIanh3AnCMr8CKDfm4Px0h6wF81mlU+M19eIuXOUJPY+XMFtA6cLrxavMomTMr7V
	QPYxJhlycHGH6e4crpdejWKi3Q2JhfZQ7K4ti90DhdBWD04R2T3Zo+3Nymo0nV3r
	oY48xYH30bn9I7ImXeei4rovSIi0gRvrp3l/+O4Dc+ivBOc91bV9C2aBKzg/BzE/
	Yua9Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mm2g9183-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5229C40054;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 187B2285EAC;
	Thu, 19 Dec 2024 18:29:58 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:57 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [PATCH 1/7] ARM: configs: stm32: run savedefconfig for STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:28 +0100
Message-ID: <20241219172934.3010875-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093242_186984_2BEFB0CA 
X-CRM114-Status: GOOD (  10.44  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Run 'make savedefconfig' in order to clean stm32_defconfig.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 3baec075d1ef..d62a0c0b7ce5 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -12,14 +12,11 @@ CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
 CONFIG_SET_MEM_PARAM=y
 CONFIG_DRAM_BASE=0x90000000
-CONFIG_FLASH_MEM_BASE=0x08000000
-CONFIG_FLASH_SIZE=0x00200000
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
@@ -74,10 +71,7 @@ CONFIG_NLS=y
 CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=y
 CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_CRYPTO=y
-- 
2.25.1


