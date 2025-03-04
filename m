Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B06AC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lNe+MRgzHHHs1aTDaEH9R1smMuYuwJxzycPtlvXhGEM=; b=rvvUYqZRQoPSnEoDY5MSLOWNdo
	i1Xu7SvIQJoNgOIilcGYksFX7Tl/prPzg014odTQbIKYxnZZ6XzQLc/EQp2GIMc3rUnaGOrGPfG/x
	UfkHwDC749J9/ZTZIecylpJO+fzr1sJ5yvKGXxr0rb2V7KX4l532kHqgbuPJ7vVM3aXZ/xaQieKoQ
	dHTTCuoKtcmDu58pGlRZz88FdOUKt9ipUMwD0ixZzko2Bi06la7ukqyyX23la9S2MuCCeqRbvZOof
	GOpWl/f1+n59uXgeh/+eE96C3HRmquLN4oC+GvhX5zHWkZ/Iw8Jk64HKvEZlSBwp5gJCaPDIFhT9+
	CPPfYExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4u-00000004Wjn-2YbV;
	Tue, 04 Mar 2025 12:08:52 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPyT-00000004ImX-0B4w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:58:11 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524Aw1RV3625146
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Mar 2025 04:58:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741085881;
	bh=lNe+MRgzHHHs1aTDaEH9R1smMuYuwJxzycPtlvXhGEM=;
	h=From:To:CC:Subject:Date;
	b=rMw6y7wrvZBPP+r1BP9bYM/PxKatgtKryTO/UXNNOu3FdLMvXL/OZWGaFtL6vmPqx
	 6kR3If52bykURMlc/+FQDaMCiiRC2jgFX2j2IGUMLWc2PS66PGP+OqkhasF9RWdZy0
	 d2GPlfBENaD9vOX+mqmOGj8qhstnjHIkoY8SGOyU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524Aw1K5067940;
	Tue, 4 Mar 2025 04:58:01 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 04:58:01 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 04:58:01 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524Aw1xq027462;
	Tue, 4 Mar 2025 04:58:01 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 524Aw0DC016815;
	Tue, 4 Mar 2025 04:58:01 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <m-malladi@ti.com>, <horms@kernel.org>, <richardcochran@gmail.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v4 0/2] Add perout configuration support in IEP driver
Date: Tue, 4 Mar 2025 16:27:51 +0530
Message-ID: <20250304105753.1552159-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025809_123732_C90E4B10 
X-CRM114-Status: UNSURE (   9.55  )
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

IEP driver supported both perout and pps signal generation
but perout feature is faulty with half-cooked support
due to some missing configuration. Hence perout feature is
removed as a bug fix. This patch series adds back this feature
which configures perout signal based on the arguments passed
by the perout request.

This patch series is continuation to the bug fix: 
https://lore.kernel.org/all/20250227092441.1848419-1-m-malladi@ti.com/
as suggested by Jakub Kicinski and Jacob Keller:
https://lore.kernel.org/all/20250220172410.025b96d6@kernel.org/

v3:https://lore.kernel.org/all/20250303135124.632845-1-m-malladi@ti.com/

Meghana Malladi (2):
  net: ti: icss-iep: Add pwidth configuration for perout signal
  net: ti: icss-iep: Add phase offset configuration for perout signal

 drivers/net/ethernet/ti/icssg/icss_iep.c | 63 ++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)


base-commit: f77f12010f67259bd0e1ad18877ed27c721b627a
-- 
2.43.0


