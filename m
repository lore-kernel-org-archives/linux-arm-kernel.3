Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6447EC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HM4pCZX/u/AItq7CG4/ehnOBNnkNRfGxqQnu+eiBq7A=; b=0YT/1+oRRbwNZaFt5rPBnOVQoB
	UiofSdiZN6APNffcVBlKG/YA6P5VOy3w8iLPxENvefMOKJ7dLuTmBskRCnCXq49cI8Y4nPKI+gxWo
	/0BTh36ZWhsWwGADh/2cdvmU52Gj3lHqCQJW0HQbawXFgCIhcUUSSl2iViLNNMH68W+E1PKIoZLoz
	BQiDRPKLnbifrh9JDkukbg/WZQWa5ovZAfGoIfO/9QIrOALGTE9d6T1D9XrHHsu167Bx/lDnVXMQg
	YhKZvvCWjhBXims+ILZh8YfMJVlgfODBxOxpjbjYZstSoMukz7yKaH2WCE5jzR2MnJe9DsOUkXNlL
	RwtuwjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOSp-00000001LJY-1Zib;
	Tue, 04 Feb 2025 19:20:03 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOBm-00000001JA6-3OJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695747; x=1770231747;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PIUhX8VO7CVtWRpn/eEYy31OEeX931JlqTLJkQNGe1s=;
  b=Zsxc6f77ANzF0CEyttVad9O63DRHTBM0iG7zBTF1hfPEh3YzaXcfLVWq
   K3lIFBlJMM4EnzV0Nme5mXswYSd+nAV3CLwJNpS0ORFO6JshJ5eVLRa7l
   ak0Ev3NYgNCbF0KYQL0SqfDJ2I8B49ISx+gTHc8EfWbTychjmQomplQfa
   UIxMr/MkYHuIuz9pAYhFyyXM08D0s4O63oeEWYZqxICPYUm68RXz1dMUi
   P07c8xznssCL+I/O9vl0bRPAnPZBLNo43RyG353hmWpaXeqhRgms1ueMT
   WTSDU5fJ79kkf5ML96+gqDTO0RWvyEv1SRre5k7hCIOuRjIA+kicqmXSA
   w==;
X-CSE-ConnectionGUID: XtNm8x/NSyCjCHiqvfSoTw==
X-CSE-MsgGUID: TbMR6GNtQempYiOW/UMoUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39501843"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39501843"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:02:24 -0800
X-CSE-ConnectionGUID: KYHkNRC2TAWmTutTJ+2Njw==
X-CSE-MsgGUID: HKlAmOEuQUqHsDs6KkJcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141542481"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 11:02:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 82086299; Tue, 04 Feb 2025 21:02:20 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] gpio: xilinx: Replace custom bitmap APIs
Date: Tue,  4 Feb 2025 21:00:46 +0200
Message-ID: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_110226_861814_F739D78C 
X-CRM114-Status: UNSURE (   6.77  )
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

Relatively recently bitmap APIs gain a few new calls which may help
to convert the GPIO Xilinx driver to use them and become shorter and
nicer. This mini-series does exactly that.

Andy Shevchenko (2):
  gpio: xilinx: Use better bitmap APIs where appropriate
  gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()

 drivers/gpio/gpio-xilinx.c | 96 ++++++++++++++------------------------
 1 file changed, 34 insertions(+), 62 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


