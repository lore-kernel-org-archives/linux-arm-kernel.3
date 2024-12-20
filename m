Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66AFE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8WoBJmcAmbZ0wLHZLxdN/OSK3SKi8ys6Ax7NXu3UwDA=; b=Thb8TsW2nBXRg95rKiOoMbQu7E
	Dsqf1eR1i1l+PdnZ3133aAAcA3k6riiQ6aPz3U8OtxjYAT8Jawex6CvRYLDdClyp0w613N8e9pYlx
	5G1dtCr4nKoN8fYi7EBnAbKWW+pIf1dKQb9SvU2q5ixTIgIYc/p5qDW8zQ9LzXJdAQg3NOEVYObbm
	2npe3v6RODj3d3Ttx8e4wgR2LC51Ok55Ul/PZuwDjjKRWGhvQ4PVMAByMzp7wfBpT1V/0gLx4pJbF
	TyN5Z9IGiJy7TvkZMFwz5wFh+6ocaNMeucCvGKv3WzDMLxqfaGt1J5F9VaY0CNIVTaeBvlk11NpaI
	QzjJDIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa3M-00000004YZa-2dEf;
	Fri, 20 Dec 2024 10:16:16 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZss-00000004WLc-0vKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:05:27 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKA5Cch445978
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 04:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734689112;
	bh=8WoBJmcAmbZ0wLHZLxdN/OSK3SKi8ys6Ax7NXu3UwDA=;
	h=From:To:CC:Subject:Date;
	b=do7pJTJ17YfBglWNHAjgF832lT2KiGmOfoNs35gXg5Gok+bVM8cx17vW5HyZmTogE
	 9pVDYzoaH7w/0ab/jk4+ZN4sZ4dle568SGgbmCsvEtECfyLvmnzHHpZDfU+CSArL7a
	 HY9Dv/1kT1DzfS6VfAuSOQXXZN9Z1bqyHzwTmJc8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKA5Ch1118991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 04:05:12 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 04:05:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 04:05:11 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKA5Bma081410;
	Fri, 20 Dec 2024 04:05:11 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BKA5Bj6003715;
	Fri, 20 Dec 2024 04:05:11 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <tony@atomide.com>, <s-anna@ti.com>, <horms@kernel.org>,
        <danishanwar@ti.com>, <ssantosh@kernel.org>, <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
Subject: [PATCH v2 0/2] Fix compilation errors with pruss APIs
Date: Fri, 20 Dec 2024 15:35:06 +0530
Message-ID: <20241220100508.1554309-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020526_344363_497D51D8 
X-CRM114-Status: UNSURE (   8.77  )
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

The APIs in 'include/linux/pruss_driver.h' produce compilation errors and
warnings when config symbol CONFIG_TI_PRUSS is not enabled.

This series fixes those errors / warnings.

Also the header file 'include/linux/pruss_driver.h' is orphan and has no
entry in MAINTAINERS file.

v2 - v1:
*) Collected RB tag from Roger for PATCH 1/2
*) Fixed typo in PATCH 2/2 as suggested by Roger.

v1 https://lore.kernel.org/all/20241218104424.1257880-1-danishanwar@ti.com/

MD Danish Anwar (2):
  soc: ti: pruss: Fix pruss APIs
  MAINTAINERS: Add entry for linux/pruss_driver.h

 MAINTAINERS                  |  1 +
 include/linux/pruss_driver.h | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)


base-commit: 8503810115fbff903f626adc0788daa048302bc0
-- 
2.34.1


