Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C81C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH5+4XXFN9MnV7T9lfahZWTvXJLBFXDIHb5Miv6+HGM=; b=MiXtWcI3WDV/mn/qYEPPR200YX
	tgStbKqrGLARAdnkH5KGfJxLVLLdmAtcjNrH4qcmjEkM9Uk/VP1l082FMLQ/FY9WH6YMCoHFpxk3q
	5PHejdl/rJi3Z4LpHJ1M53bTlHyGB4Q0Gb1fNERi8nSy/gfDVUBY0Kjc28tFj5pVyD7qmG26j9+1H
	z+TnBO4zGNnFq9uoTmVUaFXjMiIJQZMFvFgIZiPd/0ZfZj+T3HnmMyTtbhsujON7GT613NYdhPRjr
	w2QkaXwPNa3jUA8WscL6CxUKb0iOqQ6IfSGuu+tLlQiaGmaQ9dELVRPe+F6UOYkMTv9GG2FcPxFCD
	RD0aN05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7bE-000000027Tf-3izI;
	Mon, 17 Mar 2025 10:21:36 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7WF-000000025u8-20yT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:16:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HAG7sZ2248072
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 05:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742206567;
	bh=BH5+4XXFN9MnV7T9lfahZWTvXJLBFXDIHb5Miv6+HGM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l7TxtPXeVecfVCEodrxntREiLHgSdZQK7Qrm4CXmNynRdIs26O95TkRCtZ/ceRyPn
	 SyWNGAo5RLOKe0hlU1yz29Gkwc99Kfu12NqbOrs+co4EiZkh1Ro9qhQf5vnhj0rlW2
	 BseF7gIlJHU76s1fdsjO80QSA0cEjkmUP+MO1npY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HAG7e6000531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 05:16:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 05:16:06 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 05:16:06 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HAG6Is075321;
	Mon, 17 Mar 2025 05:16:06 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52HAG5Lj019302;
	Mon, 17 Mar 2025 05:16:06 -0500
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
Subject: [PATCH net-next 3/3] net: ti: icss-iep: Fix possible NULL pointer dereference for perout request
Date: Mon, 17 Mar 2025 15:45:50 +0530
Message-ID: <20250317101551.1005706-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317101551.1005706-1-m-malladi@ti.com>
References: <20250317101551.1005706-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_031627_632582_A9CEC3E4 
X-CRM114-Status: GOOD (  13.07  )
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

Whenever there is a perout request from the user application,
kernel receives req structure containing the configuration info
for that req. Add NULL pointer handling for perout request if
that req struct points to NULL.

Fixes: e5b456a14215 ("net: ti: icss-iep: Add pwidth configuration for perout signal")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icss_iep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index b4a34c57b7b4..aeebdc4c121e 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -498,6 +498,10 @@ static int icss_iep_perout_enable(struct icss_iep *iep,
 {
 	int ret = 0;
 
+	/* Return error if the req is NULL */
+	if (!req)
+		return -EINVAL;
+
 	/* Reject requests with unsupported flags */
 	if (req->flags & ~(PTP_PEROUT_DUTY_CYCLE |
 			  PTP_PEROUT_PHASE))
-- 
2.43.0


