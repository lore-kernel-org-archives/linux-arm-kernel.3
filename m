Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1CBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CdL/+PjoujWaXbjx9Z6DltuQ+LmtMfq1I7St4x1lKEY=; b=qYE1qDqi9ILdJ0K1kLzoy5aPye
	s31DmRanLBGpZd43gaVtZ6tNagIsiXa3fiB4oc2AP8li05LhgR8Pc0uhSeGAZ7sdIodVZyHAO7Ey5
	ZI3oOnkUVVFnZQ9sHlFi2kxmF9NMYPyzMnBIl4W8413qFl5fCsjfONNiVwy6O5MF2+wAo1P6BBCwK
	dnmSdCnjVDb9Xup5e87lmRmZ+YIy52Wv17dlGlGKpOPgFUfbFt6m3vtDZM0viszpnWBXzbAcCir9l
	omrgVJxmcbQQ8UI0vII0bdP+IPPhWRvttex0kuOplerH8d6xEL/3mY6Tl7PZDOL3tnN+h49pyv4D0
	28dGT42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Xu-000000026RC-1dAe;
	Mon, 17 Mar 2025 10:18:10 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7WD-000000025t0-2Wrx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:16:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HAFwoe2248052
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 05:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742206558;
	bh=CdL/+PjoujWaXbjx9Z6DltuQ+LmtMfq1I7St4x1lKEY=;
	h=From:To:CC:Subject:Date;
	b=rT/d7l02DwVXTVZQuvKIJ+3ad/PDz83E7BSa7gcBKo2nU+yI6hfuzsSCmCXOBOHmm
	 bDtR3pUj15YvCnsyAkveGhBN9+SZihUJzJs7P+p/P0agV9U3MYU35+qnaCGFiwddjx
	 XXyx9LwyDVSf4SCr3Hx3grzS7ijrmraDOyvt4vSU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HAFwEU076244;
	Mon, 17 Mar 2025 05:15:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 05:15:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 05:15:57 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HAFvM6036212;
	Mon, 17 Mar 2025 05:15:57 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52HAFugA019281;
	Mon, 17 Mar 2025 05:15:57 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kory.maincent@bootlin.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next 0/3] Bug fixes from XDP and perout series
Date: Mon, 17 Mar 2025 15:45:47 +0530
Message-ID: <20250317101551.1005706-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_031625_754617_33A02102 
X-CRM114-Status: UNSURE (   8.07  )
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


base-commit: bfc6c67ec2d64d0ca4e5cc3e1ac84298a10b8d62
-- 
2.43.0


