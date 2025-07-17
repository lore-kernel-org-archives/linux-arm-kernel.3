Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55507C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 06:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+83B+YVA2IQexnB34FIHCdUO9DtPuBnRUPeGm8YfyI=; b=HmM/fvN06wSk69k+H7uvm3Pfvf
	+6Un4QKpURtMXdttPxhj9A7CjGVXyHluC0wprA2ch7YiFXZ2ETPGvA4RpAMt1RWuROqESf0VkHYtJ
	zzZ6OSp0PxGMILmSAqmqSQWxxGHSVmLDSz/LNOvvlMboHojqKagXtdhBOa9Z5SCwDAOSHvYo2irKW
	57QGWaX45AAR0nwfin0Pr+oHOTBY7uX8VR3t/cZaPJe2y67W1whB6knfxxH8T2U5gK9T9kG4NKH/U
	nnFAg+oVN8adbqgtPYEvvNyXA3iMLWblEF2sjjaq+yLdBC3T+vQtp7yLkhr6JO6dyPvzykumD6ydg
	p7mzdSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIDq-00000009Ixb-0IfK;
	Thu, 17 Jul 2025 06:36:02 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIBO-00000009IfA-2J5J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 06:33:32 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H3JZgc002491;
	Thu, 17 Jul 2025 08:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=9+83B+YVA2IQexnB34FIHC
	dUO9DtPuBnRUPeGm8YfyI=; b=zwpw7zysfZNtRoySikCC+q234YX5RB8Bc8BzOF
	cDtWT+fQfA6T7aEMcOYsHie0mGFDvC0iM1PnRYzbDJz8VmPFGg/EiKdo8e/mp2bZ
	cHvBfFD3aDp/3cZYcs92yl/WIA/jPd7Y2xHOTAJlk7s6ruhI7djq2pszUgTkxJY0
	HbGVr9pHp5ACw82ZsuUgbNQZGE/B+bdndLLupIUGgMBisYqFn9DXvWjPoh90kn5L
	2gbaODDtV+2B7JYH/xvuUt9KlbWmwngjhpBg/tJRo6uYRHSIWeYaK4JgAVa7jE3u
	Wi/lgjE8r6ZI/vVh8CdCGqiPlQpi/YCHGvpFdKOcJ03c6sGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2np3eca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 08:33:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A6D564004C;
	Thu, 17 Jul 2025 08:32:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC0C978C56E;
	Thu, 17 Jul 2025 08:31:10 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 08:31:10 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [RESEND PATCH 0/2] Add pinctrl_pm_select_init_state helper function
Date: Thu, 17 Jul 2025 08:30:40 +0200
Message-ID: <20250717063042.2236524-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_233330_851054_7D732693 
X-CRM114-Status: UNSURE (   8.42  )
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

We have the helper functions pinctrl_pm_select_default_state and
pinctrl_pm_select_sleep_state.
This patch adds the missing pinctrl_pm_select_init_state function.

The STM32MP2 needs to set the pinctrl to an initial state during
pm_resume, just like in probe. To achieve this, the function
pinctrl_pm_select_init_state is added.

This allows a driver to balance pinctrl_pm_select_sleep_state()
with pinctrl_pm_select_default_state() and
pinctrl_pm_select_init_state() in pm_runtime_suspend and pm_runtime_resume.

Christian Bruel (2):
  pinctrl: Add pinctrl_pm_select_init_state helper function
  PCI: stm32: use pinctrl_pm_select_init_state() in
    stm32_pcie_resume_noirq()

 drivers/pci/controller/dwc/pcie-stm32.c | 10 +++++++---
 drivers/pinctrl/core.c                  | 13 +++++++++++++
 include/linux/pinctrl/consumer.h        | 10 ++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)


base-commit: 5a972a01e24b278f7302a834c6eaee5bdac12843
-- 
2.34.1


