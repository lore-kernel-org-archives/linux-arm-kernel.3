Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9CCC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwwi92ajr3Hx7+OnqQ/c83G/3mwouq+VJfJgJebS2Lg=; b=vbxeZXbI+/cOEaZi3go2+UoCID
	BprTi4xu4zadVUKpVDqLyWjdfYPXhJ88tBEwVL9Ouj+zAsaQ2AJFtrlUjV2y/nysindKk+unmwo89
	EWWB7jGg2d+v/ZCjdIv2GTJ7xZi9BOBU8aE5DQGHTG548VRhww5Yj5lxwdhq+3k/hh1MCV8Vx9BAK
	sG0FS+ziO3u4EgtrVTwyRhEs4excFcMJUMhPo3U965Er2ryZY0e/aktpudhiLamINtwobaNOWas51
	NFG2b9RqzJ8tYznFt/W9hCHJBYKDdjwH2IR3pZYfx69sAWHnOp/HOLFN0VR0vfepPgKXx2C0MVoNM
	8eVNijIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrSE-0000000CT1y-0uhi;
	Thu, 26 Jun 2025 18:36:10 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrC0-0000000CRXz-2SfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 18:19:26 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QEfP7w009706;
	Thu, 26 Jun 2025 20:19:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dwwi92ajr3Hx7+OnqQ/c83G/3mwouq+VJfJgJebS2Lg=; b=l2nsoshpGQzKnfk2
	5EJJstithUE9ie/HPh8xhyHxqoo4BdiwOjbZ4AJZns45OgXcqBt6O6uwUjx0OKw8
	DhmTMviM0SokrBSW1gae/wKfBoi9MbbjdENTfzfTPdoWnTEHmzRSE3rD+vzqxw40
	bMfrrjb22OrGvFFQzun3HcXLK2wpPdki9GOgPIZbrYDhktnEuye3zRbUkErMbrjK
	GzVCn+zoOFhCdSRMWQxjq4H6QmJsRNsLfvrTi5A/NatrX4XP+Z1h/0gEh3H4cZUA
	jivIs7+7mqV7xx8CTWms/OQ3smU6Ub7zZt1/cAZQzU+ZB6s6cNTovHaMyx/2hvmO
	nnV/xQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e7ppn921-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 20:19:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD4BE40054;
	Thu, 26 Jun 2025 20:18:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53327BAE27C;
	Thu, 26 Jun 2025 20:15:46 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 20:15:46 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] PCI: stm32: use pinctrl_pm_select_init_state() in stm32_pcie_resume_noirq()
Date: Thu, 26 Jun 2025 20:15:37 +0200
Message-ID: <20250626181537.1872159-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626181537.1872159-1-christian.bruel@foss.st.com>
References: <20250626181537.1872159-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_111924_892946_AA0AC769 
X-CRM114-Status: GOOD (  14.77  )
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

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Reported-by: Bjorn Helgaas <bhelgaas@google.com>  
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 50fae5f5ced2..c1d803dc3778 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -28,6 +28,7 @@ struct stm32_pcie {
 	struct clk *clk;
 	struct gpio_desc *perst_gpio;
 	struct gpio_desc *wake_gpio;
+	bool   have_pinctrl_init;
 };
 
 static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
@@ -91,10 +92,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
 	/*
 	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
 	 * thus if no device is present, must force it low with an init pinmux
-	 * to be able to access the DBI registers.
+	 * if present to be able to access the DBI registers.
 	 */
-	if (!IS_ERR(dev->pins->init_state))
-		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
+	if (stm32_pcie->have_pinctrl_init)
+		ret = pinctrl_pm_select_init_state(dev);
 	else
 		ret = pinctrl_pm_select_default_state(dev);
 
@@ -274,6 +275,9 @@ static int stm32_pcie_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
 				     "Failed to get PCIe reset\n");
 
+	if (device_property_match_string(dev, "pinctrl-names", PINCTRL_STATE_INIT) >= 0)
+		stm32_pcie->have_pinctrl_init = true;
+
 	ret = stm32_pcie_parse_port(stm32_pcie);
 	if (ret)
 		return ret;
-- 
2.34.1


