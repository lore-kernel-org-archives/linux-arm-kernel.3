Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A69C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMQIobRAiC9b1s++SknNRneALJeSW+q1BooQBxmWRuE=; b=xVDPckHFJuH2MR670mr8krIdfQ
	b9LVf0K8/qoA4teNc6Ex+foQzbE6fNF0zV2HeYRdDFxtSlOXS/K5CCqHIh2j2K2Sl3NNyf7u+Nn3P
	yXEuCbgmno/rorKTbNxOfU8MlwcvnjbrLA81QkbhXNygLJzaPhL0Os4RBP3hLobgkOzsXxyVz4sQT
	x5L2vZNFD1rhSDzpVnD/0sQR/0RADIzKkpfoWnrJyjIt3oVf8gdZ570kjSEd7TVAEf9VFQEsJPWXe
	HrQqRmG5KUd4NI+MzNLEMGq0ZBUfxeR4RHlEaOO3zzC2QMA7I2rr2oWafe8xoXAE3J/2Eq7kXyySW
	Py1aoGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIL-0000000BL51-3IDw;
	Thu, 13 Feb 2025 14:34:25 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZva-0000000BGnm-2Pb3;
	Thu, 13 Feb 2025 14:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455855; x=1770991855;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ToTyMsihtZioDgRW6E04wgRS/tvQ6CsQiomouIaR97s=;
  b=fscsdpw+4Tfs8baB+993VKylTUOkvC2GTT6RLbwFcNLEWVwnHtJmjrtE
   h9EvUlXxO2mSzQJMYZM9yCR7fFpS0wUb15DhRtsa1DYEnf/MOX63VBEvH
   S0+W/X3u4Rkbc9XVL6sZpwyqx2rEgSgyEOoTaLofFYfZfWx9CdEBijIha
   ADsKk8ZOpXVJjt4y6eOs+0qTG+uj0czIDH+uh9JuxLEbw56j6z9YQmkF9
   VECWLNyoH9TGgpAYyotgL4nBE9ZyBSLL4Nam8fkcCZG786weTmAmRnvFC
   s6hNeydkfjMaiGzqEdcbn1XP0YlBUkAUTVBKJ2zENl1SomX5fsDSkDTfC
   Q==;
X-CSE-ConnectionGUID: P7ajX1LMTtuH4GeYIWS+Wg==
X-CSE-MsgGUID: 8EWOxWLlR6aUvYCPpAhlkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273328"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:54 -0800
X-CSE-ConnectionGUID: 74s6Vg81S52j4/6jpBZxHA==
X-CSE-MsgGUID: femaWunTSu+NHGOUW7Rs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815326"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 214361FD; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 00/10] i2c: busses: Introduce and use i2c_10bit_addr_*_from_msg()
Date: Thu, 13 Feb 2025 16:07:14 +0200
Message-ID: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061054_654477_20446A26 
X-CRM114-Status: UNSURE (   8.04  )
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

For 8-bit addresses we have a helper function, define similar ones
for 10-bit addresses and use it in the drivers. It allows to remove
some boilerplate code.

Fabrizio, I haven't collected your tags as code changed more than 50%, however
semantically the parts you reviewed stay the same.

In v2:
- introduced hi/lo helpers (Geert)
- rewrote series based on the above
- added a couple of new converted drivers

v1: https://lore.kernel.org/r/20250212163359.2407327-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (10):
  i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
  i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
  i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers

 drivers/i2c/busses/i2c-axxia.c    | 21 +++------------------
 drivers/i2c/busses/i2c-bcm-kona.c |  6 +++---
 drivers/i2c/busses/i2c-brcmstb.c  | 11 +++++------
 drivers/i2c/busses/i2c-eg20t.c    | 28 +++++-----------------------
 drivers/i2c/busses/i2c-ibm_iic.c  | 14 ++++++--------
 drivers/i2c/busses/i2c-kempld.c   | 10 +++++-----
 drivers/i2c/busses/i2c-mt7621.c   | 20 ++++++++------------
 drivers/i2c/busses/i2c-mv64xxx.c  | 12 +++---------
 drivers/i2c/busses/i2c-rzv2m.c    | 15 +++++----------
 include/linux/i2c.h               | 14 ++++++++++++++
 10 files changed, 57 insertions(+), 94 deletions(-)

-- 
2.45.1.3035.g276e886db78b


