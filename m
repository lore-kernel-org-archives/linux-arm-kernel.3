Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062DEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8d0M5vH214nW5hWYmS4DvqlNBlCNRLTZNSi1A6vgKkE=; b=laRUvrvD4eDIya6s3NNs0Jqtok
	itF6Juc4xFIS9wE7K9Mvcof6YdsJvvYy98kkqM6KTJIdzkXMF6CfkZsOOzxCvW4NacLILGN6wwxrm
	mKoHhAAeAe+N0w3CWTC3UorQPDhBtce0MBOX9xnDO+1DBvjmXi4KM+lyEp7R9Qh/cOqwtL9VUnBIa
	R+i+kC57HGgEpGiPNpBqzpu+d5jfMG4ueyM3P4WXbrElsTSpt5BQ/M4d9uY/CYPqeuUp0hBm4Dria
	qs2toM8PxhPRSz8Cz4cbgBzD/j/rwPv3Yqruz5NPialtAyFMKgKHqbLymVN0aeGs0o/AgbDqWWNYS
	e4udnJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcbT-00000004x51-1zfv;
	Fri, 20 Dec 2024 12:59:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcZA-00000004wjP-3BYw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:57:19 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdHQF005325;
	Fri, 20 Dec 2024 13:57:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8d0M5vH214nW5hWYmS4DvqlNBlCNRLTZNSi1A6vgKkE=; b=3TRX3D/PmM4vGP5E
	YjDqSrLncoXckuU/gmpLex+umB8CExH3JyRoyBdS59MRjXMdaPo8fZzXoPhhelLl
	9TyXLkB9ALX3RSq6yHZrMdM1YWy0ZPbsPm3V8lkpSXynaF/u9YM3BO3Aeka+xtmz
	MyCxr/8IV8d+OmjA95NxX5y39+ksYs0fbKR8oUFfdpkkNc8AYJeyUIdw/sYAKwxB
	SJ3t64+eQWRvjfyNarG+sf/8yMzkn8bLbWFNyjsq0dkvkEfWrCKGu07AoWERj61h
	T/z+jS9jPYJArss1zA/9fkJntOlngq7gqQ7z5ODHPsthWZkFsGZ+LRhJvGq7VoB3
	hQr1rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n4vu1b2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1171640052;
	Fri, 20 Dec 2024 13:55:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 668A427665D;
	Fri, 20 Dec 2024 13:55:12 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:12 +0100
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
Subject: [PATCH v2 3/4] ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
Date: Fri, 20 Dec 2024 13:55:05 +0100
Message-ID: <20241220125506.3157268-4-patrice.chotard@foss.st.com>
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
X-CRM114-CacheID: sfid-20241220_045717_458075_FC0C078B 
X-CRM114-Status: GOOD (  10.20  )
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

Since 1c92d4a0edcf ("ARM: configs: stm32: Enable MMC_ARMMMCI and EXT3_FS support")
CRYPTO is selected by EXT3_FS, so CRYPTO can be removed in stm32_defconfig.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index be7b63036730..d62a0c0b7ce5 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -75,4 +75,3 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SLUB_DEBUG is not set
-CONFIG_CRYPTO=y
-- 
2.25.1


