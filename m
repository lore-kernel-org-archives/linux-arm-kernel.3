Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663D5C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J6Ul1FLsyftKxNQEjsWV5e3ecH3RvVGlfo884n4XtIs=; b=tr1iu9J+M/NzgA/tUMqCDbzu8o
	sh+GS+FVjdX60MXThc6S6cwG4fFW3rWgNJQbRO01AvYXfGt455moL1F9AJTarW1SyDUuCnQ0kZ6eU
	qdWlufenF7xTrZ5H4aJWmqk2cwLp72uopASwOutr4RYWjw5aE157rT0RlnmVixAO/3EK2uR4q6kBA
	Ti9fVmMGq7A/F7X6XAC4nPjYLuuxpfXbWCO4Ju8cVkBet9ySlrzC4Fea5+6CE++wHVw+GNzD0LAlE
	VsjDuTW6am47j4FgAxw4krTnLTVvzJZLuhbvcysQ27DEkdtPcntFuTR20ZSVvoWaN/Op6caetfLdd
	CXsoAOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXZl-0000000EEa6-2rYj;
	Fri, 21 Mar 2025 08:17:57 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXVi-0000000EDW0-2I9m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:13:47 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52L8DJaE855070
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 21 Mar 2025 03:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742544799;
	bh=J6Ul1FLsyftKxNQEjsWV5e3ecH3RvVGlfo884n4XtIs=;
	h=From:To:CC:Subject:Date;
	b=BRuJ55FLRFKjpLI5Y0N6l6c/qEFww5dm/6k8FIQgg6lQCjQ5qij8G4Y0zt1u2Rky9
	 E3AmZn4KmXWlwhqpgAWhWgZOn8m5yk59MjFNpXVxmJEEBIBLy87mTrtZfIzNZ8Vg2v
	 jyFlX+7KGLRHxViC/I0y7yhdwnxyxLdblVV1/F7c=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52L8DILb127538;
	Fri, 21 Mar 2025 03:13:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Mar 2025 03:13:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Mar 2025 03:13:18 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52L8DIG6130148;
	Fri, 21 Mar 2025 03:13:18 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52L8DHmX032421;
	Fri, 21 Mar 2025 03:13:17 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kory.maincent@bootlin.com>, <dan.carpenter@linaro.org>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger
 Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v2 0/3] Bug fixes from XDP and perout series
Date: Fri, 21 Mar 2025 13:43:10 +0530
Message-ID: <20250321081313.37112-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_011346_628373_1131C669 
X-CRM114-Status: UNSURE (   8.87  )
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

This patch series consists of bug fixes from the features which recently
got merged into net-next, and haven't been merged to net tree yet.

Patch 2/3 and 3/3 are bug fixes reported by Dan Carpenter
<dan.carpenter@linaro.org> using Smatch static checker.

Meghana Malladi (3):
  net: ti: prueth: Fix kernel warning while bringing down network
    interface
  net: ti: prueth: Fix possible NULL pointer dereference inside
    emac_xmit_xdp_frame()
  net: ti: icss-iep: Fix possible NULL pointer dereference for perout
    request

 drivers/net/ethernet/ti/icssg/icss_iep.c     | 4 ++++
 drivers/net/ethernet/ti/icssg/icssg_common.c | 9 ++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)


base-commit: 6f13bec53a48c7120dc6dc358cacea13251a471f
-- 
2.43.0


