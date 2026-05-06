Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B91CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzrcvTbRhKItqxVtGw/Ehmk7oDXWbfbiicyIA0V+D4Q=; b=zqY3Hed1+MtfWSFjPSHbni/Qxv
	IpgBDXjb7JNJaO7AVZUmmdPBHUN/72NfIJroNEy6ihVYbABBqbNGd1O3SK9gbSdi4AoXwF+0ebPon
	eps6nDZjZNJQddIJyyVo2zWcM15kyR8WNsqoPI7yak3YlRKPG69XAubCgxF4/VS4FefOiJ055VhTJ
	0hg6wSh4cNWmV1DluVpdYSqkz/TEKoQIrGYZoqicDB3cosu7X1kfo9O5/2MIrTlMiek23lXBMDm3d
	Yqge7fLESo364kBs6vLVrO7xTwE4Dxsm97plG20JHTL6E6xpq4QwTv8UrqlDcydKF/AmJ19fIAq/9
	bEGVKSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyF-00000000E9V-0S1y;
	Wed, 06 May 2026 08:51:07 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyE-00000000Dp9-1OKN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778057466; x=1809593466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DDptMACMAhm7xTMfOgYU9QZU6xrY7e8N4931prIpECk=;
  b=XkJkjBwnfWAp2TfrMTZPegR7UE8aXNF2vXJkDSzYT2WEZdcd999uc1D9
   UUouekewMXmo39b4QjPF1SvUtKaEzNuynOeUw501HrQhkm8y1rOwx2KPG
   Wks2Vvzj80tkXP6V5Z9CLKDMZAdikEu2psCMus1GteT6kUOUXEqxR/nLI
   C4z+qxBoZpBePBtGeXpqmgX2oaRsuOec4kmOI+yU8X/vi3/eq3dHdFMiH
   HSJ51ZU7WwHMa8B2OqyYLUSG4gHPPG6axUD1uoide/i9OJRFqXcoFMW81
   +3rsd4hVxk5wgRwUe3NDPvzQXcmUhdAF1UHyCDh5yet+uERtDwQ7XuJiv
   Q==;
X-CSE-ConnectionGUID: yHpQG/y9QSWuTdV15gzZpg==
X-CSE-MsgGUID: ueuVKbaHR4eChJyFo7x4Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78869734"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78869734"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:49:05 -0700
X-CSE-ConnectionGUID: dRHWd1i0THy38j8bVbWNBQ==
X-CSE-MsgGUID: 3hj1c6WUSwy63w4M3JmUpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259510103"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2026 01:49:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F24BD98; Wed, 06 May 2026 10:48:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Niklas Cassel <cassel@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v1 1/4] PCI: amd-mdb: Use the right GPIO header
Date: Wed,  6 May 2026 10:47:24 +0200
Message-ID: <20260506084858.867884-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
References: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015106_406374_E8743D4C 
X-CRM114-Status: GOOD (  11.67  )
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

The driver includes the legacy GPIO header <linux/gpio.h> but does not
use any symbols from it and actually wants <linux/gpio/consumer.h>,
so fix this up.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pcie-amd-mdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-amd-mdb.c b/drivers/pci/controller/dwc/pcie-amd-mdb.c
index 7e50e11fbffd..88208e967201 100644
--- a/drivers/pci/controller/dwc/pcie-amd-mdb.c
+++ b/drivers/pci/controller/dwc/pcie-amd-mdb.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
-- 
2.50.1


