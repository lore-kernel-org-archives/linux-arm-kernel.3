Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F8AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RZ3bqr04nq0KvhOIS+gUumh58sDmf7juaqfkgmz1GfI=; b=j0OokwmU961o4ixfzrDasmE87E
	7KC9Hzmt3U3I2TR7gUHUGSnJbY5zYb5UyYLHyXa3r4o70rpwcFyhTXT9nAwoXc6mthyjKhhiUtd5L
	JFeiqZuIuACpPlhqGXgKP3DjEuViRwlgftQ1ckz1FUERatAWn1TgBv8bciArRHMP+Sr312JsQ4KkR
	/n4/hJKg8Po3ILlGeLJ1qdN9Mdv3L8mC3ROek2HHq0kriIZLVkCMsLQCcfGXJhzRUINso/1xkFgMm
	aA0GUfxYT6IqRmrQBYKo2+vjNtFMIpKl87hkORjD9JnQ6hiCiYrH8/Yt1Tf0FhA/1g6MmZEjy4okv
	gQusHkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkBR-0000000AGxg-0qGy;
	Mon, 23 Dec 2024 15:17:25 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkAD-0000000AGkG-2cS2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:16:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BNFFtE0029151;
	Mon, 23 Dec 2024 09:15:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734966955;
	bh=RZ3bqr04nq0KvhOIS+gUumh58sDmf7juaqfkgmz1GfI=;
	h=From:To:CC:Subject:Date;
	b=oYWHFEgeCFg8nTAlFpNfHpZNsL4pI6Mh0BfB+MC9in7UySczmzRmeU2qDeAHNU+qu
	 juKfTzeDA2DTHe9mCmOpH2A9f8mjyoiF5UJPzj75Lo4kvA1Y/XZiRmVTNIEj3ktB5o
	 ZPTMqUewu4ImCcUYzPnXSix+CvY9+M7y7A2pr3i8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BNFFtJH083429;
	Mon, 23 Dec 2024 09:15:55 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Dec 2024 09:15:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Dec 2024 09:15:54 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BNFFsIp116891;
	Mon, 23 Dec 2024 09:15:54 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BNFFrHn007379;
	Mon, 23 Dec 2024 09:15:54 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <u.kleine-koenig@baylibre.com>, <robh@kernel.org>,
        <matthias.schiffer@ew.tq-group.com>, <jan.kiszka@siemens.com>,
        <dan.carpenter@linaro.org>, <m-malladi@ti.com>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v5 0/2] IEP clock module bug fixes
Date: Mon, 23 Dec 2024 20:45:48 +0530
Message-ID: <20241223151550.237680-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_071609_829858_34785F0D 
X-CRM114-Status: UNSURE (   9.08  )
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

 drivers/net/ethernet/ti/icssg/icss_iep.c      |   8 +
 drivers/net/ethernet/ti/icssg/icssg_common.c  |  25 --
 drivers/net/ethernet/ti/icssg/icssg_config.c  |  41 ++-
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 261 ++++++++++++------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   5 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  24 +-
 7 files changed, 244 insertions(+), 121 deletions(-)


base-commit: 92c932b9946c1e082406aa0515916adb3e662e24
-- 
2.25.1


