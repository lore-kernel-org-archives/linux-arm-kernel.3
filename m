Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6D4D29FB0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dkLZdfHad0BvKfYRCTi1v7nlEmkz9+TB8S+Kq67QAis=; b=jYYdkThbgWIVfyXrbQYFQfYPE+
	SKBMKv7cyeCWZWU/04A89fLhtSqES5DhJR/k7wvYSEodvQ7GabrADex8G4YK+PeRNBrlJ/edbzq3n
	J8HRtIH0gUWjgAWziiuOo+so1738JfnrIJFooClb1W3EaxJDzV2aDm82ZpI4Hx3cHmaPNQscaj52l
	HKCSVdyuKHh4M697ZB4diw7i9O0liJqJeMTJ6+3CEPMyRM4cz40bb6634WA03oB2X72iule1jA3zj
	pZwCzYJn7oXnvWot+WEpbzlbphhWwb+ATmds0lf1JuQEKeiec8qFCIFCfvmeT2ABtRYjMj2m8hPk0
	fUd4JJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8agm-000000029YY-0RaL;
	Wed, 06 Nov 2024 07:42:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aeu-000000028ri-023P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:40:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A67elLw017749;
	Wed, 6 Nov 2024 01:40:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730878847;
	bh=dkLZdfHad0BvKfYRCTi1v7nlEmkz9+TB8S+Kq67QAis=;
	h=From:To:CC:Subject:Date;
	b=uaJaysG9L3CXJigKp/2PPoUI4evbSyGirFRIIw2EJ0pMpM8LD+x5J3Y/vzFlhdFbp
	 +ZlEE5TtRPC+RXSq0WCvfeH0twaMD2+lMmRKTAI/5nCaEhlToVleWyPZxFLioPlEaG
	 RwsUgQy/jgEWP120DXuWz+TM1r4o3rO+dqBMOMIA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A67elYO054237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 01:40:47 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 01:40:46 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 01:40:46 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A67ekts010485;
	Wed, 6 Nov 2024 01:40:46 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A67ejXK014385;
	Wed, 6 Nov 2024 01:40:46 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <m-karicheri2@ti.com>, <m-malladi@ti.com>,
        <jan.kiszka@siemens.com>, <javier.carrasco.cruz@gmail.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 0/2] IEP clock module bug fixes
Date: Wed, 6 Nov 2024 13:10:38 +0530
Message-ID: <20241106074040.3361730-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_234056_414514_CC239FDB 
X-CRM114-Status: GOOD (  10.58  )
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

Hi All,
This series has some bug fixes for IEP module needed by PPS and
timesync operations.

Patch 1/2 fixes firmware load sequence to ensure IEP module
is always running when either of the ethernet interfaces is up.

Patch 2/2 fixes distorted PPS signal when the ethernet interfaces
are brough down and up. This patch also fixes enabling PPS signal
after bringing the interface up, without disabling PPS.

MD Danish Anwar (1):
  net: ti: icssg-prueth: Fix firmware load sequence.

Meghana Malladi (1):
  net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during
    iep_init

 drivers/net/ethernet/ti/icssg/icss_iep.c     | 10 ++++
 drivers/net/ethernet/ti/icssg/icssg_config.c | 28 ++++++++++
 drivers/net/ethernet/ti/icssg/icssg_config.h |  1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 58 ++++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  1 +
 5 files changed, 87 insertions(+), 11 deletions(-)


base-commit: 73840ca5ef361f143b89edd5368a1aa8c2979241
-- 
2.25.1


