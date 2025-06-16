Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB27AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5i3+6MceKfZkPIPthlqzU0kOos8h6d0+eZ5gSTwLJu4=; b=WKz6ApgvEZFSjbRZLZW+3GBuob
	G1eJQBQgJuUKG7a5YfHls973Fi2I04ioIsxYmfR7ji66OnUh/j2Ln8VaDPb+XrLHB4OA2bILnjw3i
	YozdyXC/2c/nVw5fHS/10D9oJ7HWUZO8WToB8Nbs0U/EKmRkHCAS2g9utZO05G6szYFO9ZiDxNPZQ
	6GNLgbCLjjzzX/bttqhbEgY4Eu9ViLXfiM9uP+oyDA78sKn6oJWotHl5eQ+sw7fkw8Irtesgd9l+w
	2/gwRM1eoBTp7DN/srWlJFmb7KEcp45/N+ML9Yah48h609ppV5XKB+2xMWBhbE+obeoj1K3JIaXYa
	Dd7fDBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3f2-00000003YXD-3bRk;
	Mon, 16 Jun 2025 06:49:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3co-00000003YIH-1NAj;
	Mon, 16 Jun 2025 06:47:23 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55G6lAgF2522816;
	Mon, 16 Jun 2025 01:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750056430;
	bh=5i3+6MceKfZkPIPthlqzU0kOos8h6d0+eZ5gSTwLJu4=;
	h=From:To:CC:Subject:Date;
	b=LjsXAM9vGoHAH5U3UMNoEJQbQXqFe4sixwMcEc4feP7dtV+zEnxi3+OQJdLrKLUID
	 wMgZIoxBXxmuey2m5wJT2vjkMzDoWblWKx7UKx5smsNYDQXswM31vgoXGyrRfzlWfg
	 vFMTdQfRk3kzFMCE8uMTsSHyB4DPZQP3WbUrwKQQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55G6lAwt570542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 01:47:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 01:47:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 01:47:10 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55G6l6Cm3805820;
	Mon, 16 Jun 2025 01:47:06 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <sjakhade@cadence.com>,
        <rogerq@kernel.org>, <christophe.jaillet@wanadoo.fr>,
        <u.kleine-koenig@baylibre.com>, <eballetb@redhat.com>,
        <make24@iscas.ac.cn>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 0/2] Enable PCIe Multilink and USB support in Cadence Torrent SERDES driver
Date: Mon, 16 Jun 2025 12:17:03 +0530
Message-ID: <20250616064705.3225758-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_234722_451748_D5BE8FC2 
X-CRM114-Status: GOOD (  12.44  )
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

Series is based on linux-next tagged next-20250616.

v3:
https://lore.kernel.org/r/20250109121614.754466-1-s-vadapalli@ti.com/
Changes since v3:
- Rebased series on next-20250616.
- Collected Reviewed-by tags from:
  Roger Quadros <rogerq@kernel.org>

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
2.34.1


