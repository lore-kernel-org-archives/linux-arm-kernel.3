Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B1BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aUGe2AbRfw5KMjZoEFENX0hTvgZBr0eB6GdsLXur/n4=; b=EQCZBNVsDB5lq62fFBAosplFum
	E9voAOGeMagkqMAZzcSecXQdjQEOXFhSYg+lO6Za0huEMJy8ogwOL8NushKPRuwh7Xbhu93rkj+vf
	V4vU5DC/iCKUSAlF0gVE3Gqtc5b6DvIsJubIlzlWBVT8LSKTjqUAfwoICc9KNSoFqlfBGAeVSUoai
	ucQVofwVtWK3m5Zx7OGInUBMDi1eNq1mRxy4oEVctHYs374BRSXWlDl+gidXB+IfoQvcOSae2vp4U
	Vmj7DVNNlaAOmsBLnojkXplE86iJEPiASlcO7G/zY3DbQv76Yzf3wWegVNvNBhDNivbTJTMuDA3rX
	A8tQ5Xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrTw-0000000BpFm-2u8I;
	Thu, 09 Jan 2025 12:17:48 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrSj-0000000Bp4a-0VkK;
	Thu, 09 Jan 2025 12:16:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 509CGJKP041635;
	Thu, 9 Jan 2025 06:16:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736424979;
	bh=aUGe2AbRfw5KMjZoEFENX0hTvgZBr0eB6GdsLXur/n4=;
	h=From:To:CC:Subject:Date;
	b=LWiCXYUOFuP5H7+1Z0EGWnPZIEnql4n6GY7TOfE8il7zWB4hUnP8KX/gbC1zd30xy
	 V5bXDuewZXi4nTcKnEkE2mJ7IpMcVBBTyV94EOMb7PZgctQtLcX4hij1Gd8DwkhflE
	 VYMjbuzm13Yydp74GyT1yYV2dmqQgnJpezkrgsiA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509CGJEn011933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 06:16:19 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 06:16:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 06:16:18 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509CGE6L120193;
	Thu, 9 Jan 2025 06:16:15 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <sjakhade@cadence.com>,
        <rogerq@kernel.org>, <thomas.richard@bootlin.com>,
        <christophe.jaillet@wanadoo.fr>, <u.kleine-koenig@baylibre.com>,
        <eballetb@redhat.com>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 0/2] Enable PCIe Multilink and USB support in Cadence Torrent SERDES driver
Date: Thu, 9 Jan 2025 17:46:01 +0530
Message-ID: <20250109121614.754466-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_041633_269738_DF55D94C 
X-CRM114-Status: GOOD (  13.16  )
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

Hello,

This series adds support for standalone PCIe Multilink configuration
along with the support for PCIe Multilink + USB configuration in the
Torrent SERDES driver.

Series is based on linux-next tagged next-20250109.

v2:
https://lore.kernel.org/r/20250106131925.263240-1-s-vadapalli@ti.com/
Changes since v2:
- Rebased series on next-20250109.
- Based on feedback received from:
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  a) "const" has been used wherever applicable i.e.:
  s/static struct cdns_reg_pairs/static const struct cdns_reg_pairs
  s/static struct cdns_torrent_vals/static const struct cdns_torrent_vals
  b) Commenting style in patch 2 has been fixed.

v1:
https://lore.kernel.org/r/20240615093433.3659829-1-s-vadapalli@ti.com/
Changes since v1:
- Rebased series on next-20250106.
- Significant changes have been made in the second patch of the series
  in the process of rebasing. Support for 3 or more links was introduced
  and this series had to be modified to be compatible with those changes.
- Added "Co-developed-by" tag in the second patch since some of the
  changes in this series in the process of rebasing were made by me
  which are quite different from the v1 version of the patch.
- Due to these changes, I have *not* collected the "Tested-by" tag on the
  v1 series from Enric Balletbo i Serra <eballetbo@redhat.com>
  and I hope that this series can be tested.

***NOTE***
Since I don't have the hardware required to validate PCIe Multilink +
USB functionality, kindly *do not merge* this series until it gets a
"Tested-by" tag with proper validation of the functionality.

Regards,
Siddharth.

Swapnil Jakhade (2):
  phy: cadence-torrent: Add PCIe multilink configuration for 100 MHz
    refclk
  phy: cadence-torrent: Add PCIe multilink + USB with same SSC register
    config for 100 MHz refclk

 drivers/phy/cadence/phy-cadence-torrent.c | 288 +++++++++++++++++++++-
 1 file changed, 279 insertions(+), 9 deletions(-)

-- 
2.43.0


