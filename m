Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEDEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 22:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZOY+VD/ZDT6Ubghvl2iEKCAJZ/RRCH2WxMpO8jS3lDY=; b=4vIeTzWz/Tjk1HeBLE09vj7A1G
	99+8ro0VCn+YcxNKYaSYB6l1hwzLnvCYcOvwqpmrysLBFAzHOygQnMexGGDILqB/XAlNa/cbF47lo
	Nx8kvwmUy1E+tbD+gsrdXNN323FJ3ZJJhlxjxpi4pjFEiEuR54zFLs/4fJnV5VEMXrVyYtkEK4U+5
	SUXivkuTrA7sh//yLbxUDbL3h6Q6WItzEBdbk7vUES94EJkJn/e2unjJ0Xw95od62hwB/4bN8e9eR
	vMGFEFUpAH0ZTCy7fbpRTPSwECIJ5+rZzkCGmhm8GofUEijTA0FojLDJBiDLqC5AjpS488NRgZmpY
	FzQ92Vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk9V7-00000001ehN-0HlJ;
	Thu, 07 Aug 2025 22:54:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk9Sa-00000001eOA-2c8n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 22:51:45 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577Mpc5X410651;
	Thu, 7 Aug 2025 17:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754607098;
	bh=ZOY+VD/ZDT6Ubghvl2iEKCAJZ/RRCH2WxMpO8jS3lDY=;
	h=From:To:CC:Subject:Date;
	b=wClrZvayjyvXYXPm+dvkgIp4el+7u5hKIQFk1qeFmpDGsq+DXEu9MpuwI95FlG53M
	 snUR2x/UVNZBir4NUHOoN9Apbz2nFaE4O7VXDErAvVqncY67o3PH1orwIllLtPLhzG
	 9LxWGXANeEXcp9/h5dVE8fArPc5ka+IVjRjaV7M0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 577MpcCn477040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 17:51:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 17:51:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 17:51:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 577MpcBj2086622;
	Thu, 7 Aug 2025 17:51:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf
 Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v2 0/2] Add support for AM62P SR1.2
Date: Thu, 7 Aug 2025 17:51:36 -0500
Message-ID: <20250807225138.1228333-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_155144_706197_47A933C3 
X-CRM114-Status: GOOD (  11.36  )
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

This patch series adds support for the AM62P SR1.2 silicon revision by
adding logic in k3-socinfo to detect AM62P variants.

This also disables HS400 support for AM62P SR1.0 and SR1.1 in sdhci host
driver and enable by default for AM62P SR1.2.

Tested against AM62P SR1.2, SR1.1, SR1.0 and AM62X SK.
Log for AM62P SR1.2:
https://gist.github.com/jmenti/3d605dcd9445c2fac86c626bfa519103

Changes since v1:
- Drop binding and DT patches 
- Move disable HS400 print to sdhci_am654_init & only print if caps are
  already enabled, according to Andrew's review
- Completely refactor/change patch 2/4 for k3-socinfo to not add a new
  item to reg property, find GP_SW as an offset of JTAG ID. This approach
  is based off-of Krzysztof's review.

Link to v1:
https://lore.kernel.org/linux-mmc/20250805234950.3781367-1-jm@ti.com

Judith Mendez (2):
  soc: ti: k3-socinfo: Add support for AM62P variants
  mmc: sdhci_am654: Disable HS400 for AM62P SR1.0 and SR1.1

 drivers/mmc/host/sdhci_am654.c | 18 ++++++++++++++++++
 drivers/soc/ti/k3-socinfo.c    | 27 +++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

--
2.49.0


