Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B2E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4XcTbpcGauMKxbs/Ay2DbwbTbwP1rhksRd5dIJE9SlY=; b=V/jagy2EyFwiNtS0optEXSrT8J
	DvXqsHyNkxRfP2Y8KuN3SgW9p6+fMMWNZLRdvl0/Lk8PsWRj6qVTFZB7q3qEttPXD9i9ahp7Q9XA7
	T5S3KWzQ/nCOkh01QMpA4orTueD93hzAnUvFT1EAbVsjaTFxCQ5NNhHxOT9thq1nuW7R/843PTkV+
	PJw7dJfxvUGITmuUariSGyYS5bAz1ZW9uveE2hSgmAUqEh4uP6++aItu9j8Y+tXkJ8azRYxsH9HEV
	PHqF1g+v5OZoFM69Zg8v5k9/bSfiIiiN4AGxerA7S2pvloBTrkfwUAtL8uClMUYMws3iemJjsgYyH
	NSpRxE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNI3-0000000F4mD-13n5;
	Wed, 11 Dec 2024 14:02:11 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNG0-0000000F4MG-0N1e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:00:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BBDxjSF106862;
	Wed, 11 Dec 2024 07:59:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733925585;
	bh=4XcTbpcGauMKxbs/Ay2DbwbTbwP1rhksRd5dIJE9SlY=;
	h=From:To:CC:Subject:Date;
	b=CPSEcCXwxCg6O6so7Sd+k4006tZ9fRJOe4zhNmx0zu7s/tmsMHpNbyM6Bo+Ela/Av
	 WnJjQ+JDXfBRTn4utba9Au5iQkW9iDWKLN5EhL7wyce89WdY/BpZlmtFO39whlX7oa
	 P1ELeOSFtnlg2c1oD5wgtSPaFjGjOpLs88a0GANo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BBDxjlo129051;
	Wed, 11 Dec 2024 07:59:45 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Dec 2024 07:59:45 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Dec 2024 07:59:45 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BBDxjeL024826;
	Wed, 11 Dec 2024 07:59:45 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BBDxi7Q023882;
	Wed, 11 Dec 2024 07:59:45 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <matthias.schiffer@ew.tq-group.com>, <robh@kernel.org>,
        <u.kleine-koenig@baylibre.com>, <dan.carpenter@linaro.org>,
        <javier.carrasco.cruz@gmail.com>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v4 0/2] IEP clock module bug fixes
Date: Wed, 11 Dec 2024 19:29:39 +0530
Message-ID: <20241211135941.1800240-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_060004_216947_6AF72390 
X-CRM114-Status: UNSURE (   9.40  )
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

Hi All,
This series has some bug fixes for IEP module needed by PPS and
timesync operations.

Patch 1/2 fixes firmware load sequence to run all the firmwares
when either of the ethernet interfaces is up. Move all the code
common for firmware bringup under common functions.

Patch 2/2 fixes distorted PPS signal when the ethernet interfaces
are brough down and up. This patch also fixes enabling PPS signal
after bringing the interface up, without disabling PPS.

MD Danish Anwar (1):
  net: ti: icssg-prueth: Fix firmware load sequence.

Meghana Malladi (1):
  net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during
    iep_init

 drivers/net/ethernet/ti/icssg/icss_iep.c      |   9 +
 drivers/net/ethernet/ti/icssg/icssg_common.c  |   1 -
 drivers/net/ethernet/ti/icssg/icssg_config.c  |  41 ++--
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 200 ++++++++++++------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   6 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |   1 -
 7 files changed, 179 insertions(+), 80 deletions(-)


base-commit: dfc14664794a4706e0c2186a0c082386e6b14c4d
-- 
2.25.1


