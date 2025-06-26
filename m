Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78397C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v4xN43MYu3e3S0oexgiTVn3iIbbwbmNw+3LdQPITQ9s=; b=fqTU1iPxAfn7FqohW97hdhceBU
	+ey35B4SMABaQGXU36ANQDrR3BYX/bwdxp1NCVZY/FiODUptOzRdDd66q/igL98xytxBvqKN32nWS
	nnW4bgkxxKfQzqVQ9fyQGVEGBo6gWDAxc1PO5TL7PkA4TSomdF7HxVOnJYhtmQiAIvnWA9RNUPlMh
	Id3acGDnMoam9y4ukrmu4fj8WXB61ZXIMbquX+REpu1QUQv3NCoYOHjRGubM+1szQsmHZq8JHMU3X
	VVK0XXnpfyxr4F9JPRZHjOGij+0VHVOWu4zAVYhxx4ckgBblUzQ2b8Yubz1w+KKG/8WxRZO1v3P9y
	/QqiRXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrSE-0000000CT2L-3BkJ;
	Thu, 26 Jun 2025 18:36:10 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrC8-0000000CRZ3-2d03
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 18:19:33 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QG6Ak2025531;
	Thu, 26 Jun 2025 20:19:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=v4xN43MYu3e3S0oexgiTVn
	3iIbbwbmNw+3LdQPITQ9s=; b=UfkC2P/IykYF5tUIvNYKlakfc/jQsk7sbMry14
	CpFISpfAe/7UADp8LrZfoJo4JDLQF7Iwxw8VE0I8YZu78MPG9s9x5MNCffwVkJKV
	Opzevu9WwtdPeoGVtJkiglWOvYxwJ/diU22cSbgLyyxhorRIbA6UdduPqjlw1qA6
	BLHpPVwotIrJaGfWrw6px1xeAxLYC3ozWYZEy8kTQhrTPWbAqEFWSUR1JfCqHZ54
	6q2bbYW8FkSv4oEM9crQzD9Ta85vltZjcRsGzwWlj72zVLi+IIfGwIIlBVsJSrhk
	3CA3VsmVWsl2sovE0OUZVKJjiNufHxH3xa8yDzEDkQtDOWDg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbysfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 20:19:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF59540055;
	Thu, 26 Jun 2025 20:18:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FC45BAE253;
	Thu, 26 Jun 2025 20:15:41 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 20:15:40 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 0/2] Add pinctrl_pm_select_init_state helper function
Date: Thu, 26 Jun 2025 20:15:35 +0200
Message-ID: <20250626181537.1872159-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
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
X-CRM114-CacheID: sfid-20250626_111932_931119_0FBBE293 
X-CRM114-Status: UNSURE (   7.81  )
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

Some platforms need to set the pinctrl to an initial state during
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


