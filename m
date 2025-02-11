Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28476C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3LvUAOKH0qzhj1HGQSw+DZIp75MrFyzlwS0y8eYZNrg=; b=VHz+6VvR1RVDamL25D0JySGhOG
	le/ka+brMyZ7svb4mq0crfFnW0qKb5pM0Jks+uAIpMpVfCphqey+Z6zFD2v2pcwQVWnKDCJruCPAo
	G5tD+ya6zkWgxeAbssLJsnBpVuYcHpAtSXQA+ZUgMZQ6q08Nd0ACk8jHNexMUxD/7J4kDs5gbjBir
	UYrsJ8uUA/CEgcKIyRoQYtyYLYHUouo0j929xIo2Zr/5poHlt2CZzelenvj9EBL5lp/1j4rH9srg0
	yBR9FRBtv1Yzj5SFatErRWpi54ppaOZYxYOqDcpg/Rq5sQAN8trGL9BUNCvjDxs554HCe0wA1+zR3
	SSunHHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thndk-00000003NCT-08sZ;
	Tue, 11 Feb 2025 10:37:16 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thncK-00000003Mwn-0HT0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:35:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BAZYJq3587965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 04:35:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739270134;
	bh=3LvUAOKH0qzhj1HGQSw+DZIp75MrFyzlwS0y8eYZNrg=;
	h=From:To:CC:Subject:Date;
	b=Y0kvPOqPFYEXdT9B2Xrl2r4HiNpdJqRC02ek2eaShc+3urlAa9dNGGV0gbqfbB2IO
	 z4DmsxlcvrQZ63yNwEqwafHJ+8BT+QGbhXmDlKd+ZcAKH702EeSIDTe34YlwNbnMXU
	 IyHYKXFjs3Ip+4iOud4tkXjSpRTMJE5evE4FnCEQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BAZYC7073762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 04:35:34 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 04:35:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 04:35:33 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BAZX8g023808;
	Tue, 11 Feb 2025 04:35:33 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51BAZWAo014179;
	Tue, 11 Feb 2025 04:35:32 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <m-malladi@ti.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 0/2] Fixes for perout configuration in IEP driver
Date: Tue, 11 Feb 2025 16:05:25 +0530
Message-ID: <20250211103527.923849-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_023548_151016_9B84703E 
X-CRM114-Status: UNSURE (   8.61  )
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

IEP driver supports both pps and perout signal generation using testptp
application. Currently the driver is missing to incorporate the perout
signal configuration. This series introduces fixes in the driver to
configure perout signal based on the arguments passed by the perout
request.

Meghana Malladi (2):
  net: ti: icss-iep: Fix pwidth configuration for perout signal
  net: ti: icss-iep: Fix phase offset configuration for perout signal

 drivers/net/ethernet/ti/icssg/icss_iep.c | 44 ++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)


base-commit: 8e248f2dbb1885647e259837d38200942f3591a3
-- 
2.43.0


