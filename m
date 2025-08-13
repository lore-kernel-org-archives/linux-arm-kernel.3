Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50423CA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PFZKPQG+k1gfjsY3a1ZAOkYj+KM4A3F6NxUPB1WMPvo=; b=AcVsgCLv5u1OjFmz6MI/qEj9LB
	Hjysu3kNma1+zlOHiB7AY/1qipUNTTIGR8je6gtOg0i2sJWpQxhXunWZzpz9Sx55nZRKgMe6VimxZ
	k6erU8UZmZXYqAoM53GvOlTOUtxddGd7gxZ5E/EnqeeSOdQcN6ab72N3CAqcy5Mizskrwha4VO/Lt
	ou1kSZVq/ZajpJEiI5oG5A8o9622z6Ve3i81OL+BsgBnJdgDIEbdYTpsHYUek4TlttzAlq5EWLyye
	F2J3VNdm1G7H5+tBhvdJarrBMGJQdz50cMJeF2LZZkxYS6Uco9iIwJRW+sGO++nrSymLde9HtB40f
	iEBCV0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAq0-0000000DfGC-35W7;
	Wed, 13 Aug 2025 12:44:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA4y-0000000DZWK-19st
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 11:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PFZKPQG+k1gfjsY3a1ZAOkYj+KM4A3F6NxUPB1WMPvo=; b=QZvxOFLBfjFu5w9iQSAxyi7W+u
	0SZot6nD9d2sHW2Sw67FckEUuSS8M2uLvLa7s73tywgSGzMHUen2t59I5kiUvJVljBPNonKsKDbP3
	bsfwJGdZJXZtkDFciQsaSLkFHNoy0j2BSRQLSx4JIFtfuVKur4X7kLu4mHGnxJca/OyJc/O7InMgp
	lqF8h94pa6sjtdDsg76j7C0g6XuScL1qK4Wow0qkzuMRTZ6RmOZ3oh882se1VKJsv7tbLVgwqEcCO
	n09PeXZqajk+KHBO+1dx4fptu2gl6FIahNfs0u1AEn1iPv38tRYzLpPpo+iWJbEmTz77PhtZ5csSl
	LWYE6MPA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA4u-0000000G5Ga-2Wsd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:55:39 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBn5Bn008281;
	Wed, 13 Aug 2025 13:55:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=PFZKPQG+k1gfjsY3a1ZAOk
	Yj+KM4A3F6NxUPB1WMPvo=; b=15NOOiACV8P2LRL/T3X7nWZjJ2DyJJTPufMbmy
	0tVJpCRAlu0UdNJV1KWcgrIuxrzGI6HfioEEaReCJkrNEjkCyjiHPECc2r++KA1f
	SU514XoFEogWxO9wmVEa8zAlEqrKImNsr3aYFJI4YEzC877HS4G1szBlj4X7ZiZo
	NcBpjxyo9U86COA4KQEIwnNAwiwxhycVmn9pY9VgLlveBz1/eP1wd+yCS3zdx9oJ
	ySJv3LqK9CoUs1UOC9Jbrnk+F9ArQ+hsR7BbO2L/24nGzHVA5VGFw9NFhO1KaxVr
	4IwgjNz2Jm4qVL70aZGStpHmdd0Z1ehOxXhCoLd6Wm9JbN8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48duf8xsg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 13:55:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C20314002D;
	Wed, 13 Aug 2025 13:54:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A72073FE23;
	Wed, 13 Aug 2025 13:53:32 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 13:53:31 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH v1] PCI: stm32: use pinctrl_pm_select_init_state() in stm32_pcie_resume_noirq()
Date: Wed, 13 Aug 2025 13:53:19 +0200
Message-ID: <20250813115319.212721-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_125537_045037_4FF9535D 
X-CRM114-Status: GOOD (  14.29  )
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

Replace direct access to dev->pins->init_state with the new helper
pinctrl_pm_select_init_state() to select the init pinctrl state.
This fixes build issues when CONFIG_PINCTRL is not defined.

Depends-on: <20250813081139.93201-3-christian.bruel@foss.st.com>
Reported-by: Bjorn Helgaas <bhelgaas@google.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
Changes in v1:
 - pinctrl_pm_select_init_state() return 0 if the state is not defined.
   No need to test as pinctrl_pm_select_default_state() is called.
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 50fae5f5ced2..8501b9ed0633 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -90,14 +90,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
 
 	/*
 	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
-	 * thus if no device is present, must force it low with an init pinmux
-	 * to be able to access the DBI registers.
+	 * thus if no device is present, must deassert it with a GPIO from
+	 * pinctrl pinmux before accessing the DBI registers.
 	 */
-	if (!IS_ERR(dev->pins->init_state))
-		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
-	else
-		ret = pinctrl_pm_select_default_state(dev);
-
+	ret = pinctrl_pm_select_init_state(dev);
 	if (ret) {
 		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
 		return ret;
-- 
2.34.1


