Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79653C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpE7UNUb3FU02W03SzuqgdflmSnF7YJKG4oW3aDPSPU=; b=k4TcTLd43ebgQA+j4uv8XUGhbx
	1ueGyGWSDV1hmrMsljcxjsojkLe1hC9cjxF4PAa3n9VJMOJbAtCIZLdX35IUDJ5/FtzQr8Te/tX6f
	6UDq/GkqqR42a/2lZ0pFqRA57Gj2Et9fkV1nxxANlcMF8ITFo0QEdBMUowFiNvTni0h3M3y5WblBh
	WRHkgCYXbqCSnmEHoflfthgOxmNsCHfVCLmLfxzUSLqR1nRnOKtfXeVhqd4SSTeZIQuCF24UL+xyg
	traLEyc9jueSOn4IdmC6l3fms1JFhaIFvpsvq4S2D/ayCTnuT00q7saV35p9W9vfUBdTA3asLqvyV
	wE8ZE6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUnz-00000005eLr-3yFH;
	Tue, 18 Mar 2025 11:08:19 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUfe-00000005caQ-14TD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295582; x=1773831582;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vKEf+YzroZXTf7Dw8vrxNUxrVBmoYhWw+uCDzGv6Ue4=;
  b=SH5yoitNJOHHHtP2w8RGvDQ3VdwtQYP6jVz7M9FhXi34gfIvuxqs1l+u
   3/kiu2/R7UvTJhB1DnREBFmtk7DvQi6KP904CHjSocNowEpCnHrguK94h
   w6Ky5d5Jy5+aQ2ZVqkOVDhgUl/XEoYXRH8UiiOA//eF07KkCH8O3dlbT5
   ZJ6mJgERnjii+Sy88Mf1IrWYzHiGd8PcE5cmQMwUbIDODRr1+KyqP3+aw
   23z3iuLO931/ToJthyflNi4zgGL6m6TyVAvtYbVvCrsZ+aQ/qc4q+D8wJ
   Peofh2l4Qr1/0bbM779bqlnIaaHcA0lx2lwgJabyvBn80rkI9Pi4EoCtj
   Q==;
X-CSE-ConnectionGUID: +EGIezvbQGuZgrWVm9bveA==
X-CSE-MsgGUID: 9S2hzYjbSUe7gyhYkAcllQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781773"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781773"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: +VWz2+diTwy2Q3onKOYL2Q==
X-CSE-MsgGUID: EImJDoyzTJi0wDl6BPq+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215698"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C03B517B; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
Date: Tue, 18 Mar 2025 12:57:13 +0200
Message-ID: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035942_321581_46551247 
X-CRM114-Status: UNSURE (   8.15  )
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

Convert Nuvoton drivers to use pin control provided data types
and more of device property APIs.

While doing that, fix one non-critical issue that sparse complains about.

Compile tested only.

In v2:
- fixed compilation errors and warnings (LKP)
- collected tags (Jonathan)

Andy Shevchenko (5):
  pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: nuvoton: Make use of struct pinfunction and
    PINCTRL_PINFUNCTION()
  pinctrl: nuvoton: Convert to use struct group_desc
  pinctrl: nuvoton: Reduce use of OF-specific APIs

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 120 ++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |   1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  44 ++------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  35 ++-----
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  11 +-
 5 files changed, 77 insertions(+), 134 deletions(-)

-- 
2.47.2


