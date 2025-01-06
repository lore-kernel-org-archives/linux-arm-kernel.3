Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB3CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qUdI85nqjSCOrYYsWsD8yM89V/vw/mRCwPvRUJJvaDM=; b=vzTe+2g6GCRIzSDQ48/gCc3CS8
	3W66Q7raL88H9H62u2huEzjQVF11P9EpCvHh/wijraGrk/pXy/NTinT5y1WFAFlfsFjfIxeIGyXDR
	B994GWS/xIu5TYX47gnx9FhQd+m9ObbiR9dLvR555hGK2G+PZ3RQIv5tgAvgWRfFnZKibbIDlBw3s
	Qn5BA7GchMPyDt1029sgOV92zFFojW08BFpXVobuMze5+hAKbeCMFB9M7cA8gH8rhzVeSfDbwjIjC
	n1lDi0Mz9LMJFRKVvl9ewLj+DASu37hOrQfbLjtnzyIgiidXxtegWxTu5Xgf1hhypPb+WCOWi3rDF
	8F2fvOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn3t-00000001Nm2-28FW;
	Mon, 06 Jan 2025 13:22:29 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn1D-00000001NFU-3Tgk;
	Mon, 06 Jan 2025 13:19:45 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506DJUrq2490416
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 07:19:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736169570;
	bh=qUdI85nqjSCOrYYsWsD8yM89V/vw/mRCwPvRUJJvaDM=;
	h=From:To:CC:Subject:Date;
	b=fn4VqEVcRZkhURqzfbrxDDi58045KuW1iZAi+76okvsvW4lAhUE8iOvdkfKpdOlL9
	 22YrlrM2ZpJR2xq61gw1VaARF8OF4nHqrDe1PStfh9XzNfevHDXjt7OckWLHMQDtrN
	 aRcMpvsj3kDH2tle2qFsVq7ovt1StELLvALRVbeQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506DJUEj094710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 07:19:30 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 07:19:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 07:19:30 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506DJPwN022390;
	Mon, 6 Jan 2025 07:19:26 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <sjakhade@cadence.com>,
        <rogerq@kernel.org>, <thomas.richard@bootlin.com>,
        <christophe.jaillet@wanadoo.fr>, <u.kleine-koenig@baylibre.com>,
        <eballetb@redhat.com>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/2] Enable PCIe Multilink and USB support in Cadence Torrent SERDES driver
Date: Mon, 6 Jan 2025 18:49:16 +0530
Message-ID: <20250106131925.263240-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_051943_956957_BA004E13 
X-CRM114-Status: GOOD (  13.99  )
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

Series is based on linux-next tagged next-20250106.

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

I have sanity tested this series on AM69-SK, validating the following:
- Boot
- SERDES0 PLLs being locked for PCIe Multilink + USB configuration:
  PCIe1 x2 -> Lanes 0 and 1 of SERDES0 -> Link 1 (Subnode 1)
  PCIe3 x1 -> Lane 2 of SERDES0 -> Link 2 (Subnode 2)
  USB -> Lane 3 of SERDES0 -> Link 3 (Subnode 3)

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


