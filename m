Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D231AC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3EBhEmBZscK4ru2XBs1IfFH+/V7roC4A+LsEN+X/TH4=; b=b6yzodCkrio/JjpQO6bnQ+oDWr
	mBwvMWCPAZDDa27J83smkRV5WlNmLsXkBW9IR8gIBBGLXvl9kKHQqJxDe57cF1Tn9ZN+kmUOK9la4
	yMyB/+FSp9JAzksW7PafrTGmW0P0a6jZAtvipDiIG82gC8iKbsRIIQ3YJOFtPDuFD/zWwaJSvtFmc
	JWPBUoCVI4MCcjyYT3mM8r94puASL/Qo0TN8uABkhd8rXcOHRmjGaNqY3CurgeLW1iZya7mciJdpf
	5u6cBXN6+VS0+fClIM0Ygq/svMq57WEuKGlDvb076/yWEtjujmv5SAy7L41VRiIh4qbXv5jyWqjbA
	D5p05HoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOa-0000000G8s0-2nYq;
	Mon, 24 Aug 2026 07:47:04 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOI-0000000G8eu-30er
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557606; x=1819093606;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1jPPNsW4oFGQFaKxN1afqS1h40V2DKd4Sm0m0DbDESM=;
  b=U7+n2LCDkAL5piXPNUauQ2nfUGnYRKeu3Hh4c2BR2yzrZe4GHRAEAIsG
   qutPB5CUzbalS6GL9/D7fM/6razmrsKMdZ00sTENRea7MzTx7h2qrWMNz
   2VSBpmnMBL6Fib8eorg/hx3M4ZbU1/NfjtHUFVORHTFTokG3K8wl9sH+0
   n34FXp1h1O37tkm5K85ubvtaVdDixVnxUYQzyEcQcawdblvcEn356cos/
   jwdzr7Vk3UCgLJZtkcSJtQo7VhIADIlznIpUcNyzAjT3n2owc673DlWlV
   lRakH0hNLY6B1Igb57qtNYWXq9emKoB+eUtInIgJS1hsQgOXWS3h0CfmK
   w==;
X-CSE-ConnectionGUID: hGuLGdgdTEil/gWbT9A8Pw==
X-CSE-MsgGUID: CtUIUkkZQkaykc7vuSSIvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203145"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: x3U5ERFEQ/2TgBaCjyxWUw==
X-CSE-MsgGUID: /Exfe8I1Qpim+Ale8Ryd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887916"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BDF7E99; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: [PATCH v1 0/4] gpio: Unify the GPIO controller node check
Date: Mon, 24 Aug 2026 09:42:31 +0200
Message-ID: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004646_851486_A643A01B 
X-CRM114-Status: UNSURE (   7.36  )
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

There are handful of drivers perform the same check in different variations
over and over with a potential to make subtle mistakes. Unify the check by
providing a new helper and convert a few users as an example.

Andy Shevchenko (4):
  gpio: Split fwnode_is_gpiochip() helper
  gpio: shared: Replace open coded fwnode_is_gpiochip()
  pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
  pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()

 drivers/gpio/gpiolib-shared.c          | 6 ++----
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
 drivers/pinctrl/pinctrl-pistachio.c    | 2 +-
 include/linux/gpio/driver.h            | 7 ++++++-
 4 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.50.1


