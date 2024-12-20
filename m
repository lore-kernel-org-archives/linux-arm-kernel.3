Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BERTRdJsOJsjc7Droogh0Gz4DIEsg0qJokIFOHXa3TA=; b=d8kbrKiOfZ3Qwc9Zl8mezQi14m
	2ON3DEAvieoq1IV3Xyxt7xJ9PMnlpjvkw7Hj/e1hJ9IL4xypdenqzwsCBE3z/qiWeV1QfC5Gy/WDb
	LDZuEuw6kAdZ08eAKjTY1RXEM8+y3Ryp90anPko2gWn4kdcIgETm+Ajrj0mE4OANGg5crAadYv4sQ
	KjVnsvbAJg0FPzJVjwjwWUVILR0zIjUpwX6kB2cVflwQiiznPwC9Qc4bOGesVvc/82699nJDc5yK3
	n/LTjdxdNfLhgdChNjHCZFMT3cMjhRnk+ukXc3gcLtgA6em0idwkEKZVtVjtmcqQjy2PM3eUTBr4o
	Iy+XhP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcer-00000004xXd-1hE3;
	Fri, 20 Dec 2024 13:03:09 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcZB-00000004wjb-49g0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:57:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdEt6003932;
	Fri, 20 Dec 2024 13:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BERTRdJsOJsjc7Droogh0Gz4DIEsg0qJokIFOHXa3TA=; b=SS51Pb5D1AeLh9Uh
	SNWh2i/3xXF8obEixGdH6EK5QYg9/EJxZ4djMstUuTINuCAzfnFE11HwHK5/G1Sx
	dmv8Asd9lVRE0eeEer4P6fi9p7WJOshaGWB36j5tS5NgYVhk+p4zPX7s1L0dJ63Y
	NBJL+rL4u9gQuK0FgzonGu+lqbvcekZzF8JKcNtEKL27q0Ecyxx3sbjZRssDc/Vr
	s78ACdIAYvl0JKRjos99NBtYGuGf15M3fU1NEbOPNGkL3Nu9/5aHba8MRELspltk
	aP+T/z7laqzNB3hhbU7HwqwbZcg606liFxuKO1VglSPYcoDHZiUw6Rz7HpQilVz1
	GO1qiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34bsrpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F54E40051;
	Fri, 20 Dec 2024 13:55:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC5A727664A;
	Fri, 20 Dec 2024 13:55:10 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:10 +0100
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
Subject: [PATCH v2 1/4] ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32 defconfig
Date: Fri, 20 Dec 2024 13:55:03 +0100
Message-ID: <20241220125506.3157268-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
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
X-CRM114-CacheID: sfid-20241220_045718_328831_FB9839CB 
X-CRM114-Status: GOOD (  10.01  )
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

Running make savedefconfig highlights some useless flags.

Remove FLASH_MEM_BASE and FLASH_SIZE as these 2 flags are only
used by CPU_ARM740T,CPU_ARM940T and CPU_ARM946E which is not the
case here for CPU_V7M.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 3baec075d1ef..973bf7c8236b 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -18,8 +18,6 @@ CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
 CONFIG_SET_MEM_PARAM=y
 CONFIG_DRAM_BASE=0x90000000
-CONFIG_FLASH_MEM_BASE=0x08000000
-CONFIG_FLASH_SIZE=0x00200000
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
-- 
2.25.1


