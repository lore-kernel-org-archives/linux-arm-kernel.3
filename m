Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF01E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9grDHNlPqw1x/CKbQq0D6QlOnJq+PsfKbzn8Mv8RRsE=; b=n8L0yRHnY8xaFIzLbcQnhF5ALb
	YKCWCUwH0Es13edovQAnO3Oi7tgyDoNeXTaJpjUgwmMXULAshnkQpQIWMfueRBXh2arUOsNAE04ej
	IA5LvHp+ROTxU3Eaz0DC8aGED9ldlpH8Rx8ykZQaaxW/iSEPPx5Z3wb+sT+pTxzmOmP4hsE3gEUKi
	mqda0m7FL95uHspdB8S1tenm8xEFfRMm4tsxxmZN1mzOS9pNOrTlr48zBy0bDa3N0jgDjhVBG9PFu
	BWLEOzcd0N8QN0JJXCQn7dqs5Koyb2n3iX/lt8jMRPX524M9WNbr4MW4f9ej74aDPXYowN2WUK/ny
	hLimGMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKP6-00000002ZjM-39nI;
	Thu, 19 Dec 2024 17:33:40 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKNw-00000002ZWf-2flT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:32:30 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJFYDm7028720;
	Thu, 19 Dec 2024 18:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=9grDHNlPqw1x/CKbQq0D6Q
	lOnJq+PsfKbzn8Mv8RRsE=; b=aapFnS/aIeAZgDgpUzKtvkbzsAkFpxYnrUWJom
	bcxKl0qtlg5B4+VeABJLbnqj8Ti3DAh74KHS8jXeWWTLXW04BT62XC9AgCG1d6cW
	GCWAFKxVREu7eOfxqnZe7EVu4lGUXOIW7qmlgVMbQcHLoPoeq96JGYq9+V9Ka2eT
	haBYbjIVkUlV30/SzRPAP12NjetPYhhUATg+7Ku8KRi6C8M5NZ6qNfAAMh6BY7iL
	UwjSvEvAA5XzN7NduRAI7SdYh2dNVGUY6M34xQpv/yMa3TxQEcmIn/5tvIucWbwc
	XNtq2nmU72sz+dIl2CGOLJAC+8leX520kRC+XMfnvdrxR3Sg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mp8b8dmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5213440053;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5938E285168;
	Thu, 19 Dec 2024 18:29:57 +0100 (CET)
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
Subject: [PATCH 0/7] ARM: config: stm32: Disable useless flags
Date: Thu, 19 Dec 2024 18:29:27 +0100
Message-ID: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
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
X-CRM114-CacheID: sfid-20241219_093229_223137_6C756AF2 
X-CRM114-Status: UNSURE (   7.23  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

*** BLURB HERE ***

Patrice Chotard (7):
  ARM: configs: stm32: run savedefconfig for STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32
    defconfig
  ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_IO_URING in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_POSIX_TIMERS in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_GCC_PLUGINS in STM32 defconfig

 arch/arm/configs/stm32_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1


