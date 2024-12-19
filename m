Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68A3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21yH8kTxTXiJepnMXWLHpDX0nuBVoMNIWb6N5q4g6wg=; b=W4LDOwhhRrEJP1znkYKHLxO6kI
	VaGJ7UsqePbzx1GFmwfuukwJ3QGzl5CvpmgOnikzf5qOI627dX5We6oYVcnSHhK1CXPPZieQ/0c5/
	QpUV62lhlHmyUtznuOoXyhIvLCSa4kNK88yztWB7YREfBU/DGzp91DhwFm7WieC1Ow9KltY3WLbzs
	lwzoY9YKb9VYovwiTh9gCyeNsOVrl7miaYJYAgXkQT/8C8Tf4aMFX/pWsWMlBi9QZ14G6PoSF8dtq
	eLDXOe6PfWQoKXC3yJLXPp7PPAtaWlpmhGgH+vrOd44FaSoAPciY/gkyGmGCKJ8y2Z7LUb39H6+Iu
	Is0ctRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKQD-00000002Zwz-1wLC;
	Thu, 19 Dec 2024 17:34:49 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKNw-00000002ZWg-37NE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:32:30 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJCiDYn013947;
	Thu, 19 Dec 2024 18:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	21yH8kTxTXiJepnMXWLHpDX0nuBVoMNIWb6N5q4g6wg=; b=WpTm82swAWXYvkTS
	im+8apQBplwJRX4IStRWD8meJdWEmZYF/7P8sUY03YtPZJAw+rIlABGLueSWmT2d
	oSMCPDTXgppeLmhP82bLpRj6d8lWKCXfLybxtP713Oo2KnnQ4LbFK7kerF+JuEVN
	SwdXanN14fvzHJ3B3wvKQRgiw7Ln3x4iCrMj1Og+vZInxcr0WiYz4PwWkeadSSfz
	RMDJ6GHOUf41QP3KwjMyFqOiTwaERfOjixEFej/pwaP+HOEKDoij17/6AWKpMtTr
	GkxaOwiCe/0TWS3fwolmqpBO+Csi9nlcRshjXRZkoUGgZkrG6j64XfxndmWHsX4k
	HQ73QA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mhad9vgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5232140057;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 645DD2839E5;
	Thu, 19 Dec 2024 18:30:02 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:30:02 +0100
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
Subject: [PATCH 7/7] ARM: configs: stm32: Disable CONFIG_GCC_PLUGINS in STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:34 +0100
Message-ID: <20241219172934.3010875-8-patrice.chotard@foss.st.com>
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
X-CRM114-CacheID: sfid-20241219_093229_224348_7E12594F 
X-CRM114-Status: GOOD (  10.93  )
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

Disable CONFIG_GCC_PLUGINS in stm32_defconfig.
It will reduce the kernel image size for these platform which
embeds a low amount of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index dbe36a59a796..77048b5e1ec4 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -24,6 +24,7 @@ CONFIG_DRAM_BASE=0x90000000
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
 # CONFIG_SUSPEND is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
-- 
2.25.1


