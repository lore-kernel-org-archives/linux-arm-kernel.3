Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B15EE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKHVyc5wlCGAnuBxZEeKCXjLSCoZxrTkiUnw5E9FRpc=; b=KV3TvUaXjOHJhwKfT8N2QdG575
	cjTj8v5DIDUsizJWHjuWFW7XkNC8TVv495ymEBiR62C9/G7HrkbKTF1NhspeA/Bb8fDkwTyO5/rwE
	T/SLhrT8N/t+52aoCyaRDAKpxi32lD2gGpGpiwt8kq9CVizyWZguFgwUS2OF7cL0DioUJDvmR2YQh
	5vsCDEjzFT2ASzLv1QNqkTgvbHstR0ZKv6qMu8+0zAKyxB0GqWHRouuWlSdRJqjwaO/swMyW4YDLE
	8DoRPdvAChQpMKGNR83GuG8/iqTeGFRbvVr53XUMDy5abRkbt/5m+VwCryyNobQbXAOgV28g+qROk
	pDOt1mWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa4T-00000004Yo6-1Oam;
	Fri, 20 Dec 2024 10:17:25 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZst-00000004WM8-2AkM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:05:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKA5G7u142880
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 04:05:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734689116;
	bh=GKHVyc5wlCGAnuBxZEeKCXjLSCoZxrTkiUnw5E9FRpc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WF+Z+zQMeE1YOis1bFQAMI3cxz/x9XNdDSy28et6ZZudSK5Y6ZYHaYZEyM/tXyML/
	 VKKbSbTUZL4MC6VM7oHEYQ2vWPIiWpxDVAF6HyPBOpVJ9AHt+/P7o0uWeJbL+/UWVe
	 JcOW+cbi49DnFY4l3kqSOIEsCS0ryEVcYiWuRSsQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKA5GbD042727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 04:05:16 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 04:05:15 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 04:05:15 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKA5FJo064249;
	Fri, 20 Dec 2024 04:05:15 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BKA5Emi003738;
	Fri, 20 Dec 2024 04:05:15 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <tony@atomide.com>, <s-anna@ti.com>, <horms@kernel.org>,
        <danishanwar@ti.com>, <ssantosh@kernel.org>, <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
Subject: [PATCH v2 2/2] MAINTAINERS: Add entry for linux/pruss_driver.h
Date: Fri, 20 Dec 2024 15:35:08 +0530
Message-ID: <20241220100508.1554309-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220100508.1554309-1-danishanwar@ti.com>
References: <20241220100508.1554309-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020527_615155_A3730172 
X-CRM114-Status: UNSURE (   9.28  )
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

include/linux/pruss_driver.h is an orphan file. Add entry for this in
the MAINTAINERS file.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c67f868ea1c9..2d4c883cb06a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23644,6 +23644,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
 F:	Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
 F:	drivers/pmdomain/ti/omap_prm.c
 F:	drivers/soc/ti/*
+F:	include/linux/pruss_driver.h
 
 TI LM49xxx FAMILY ASoC CODEC DRIVERS
 M:	M R Swami Reddy <mr.swami.reddy@ti.com>
-- 
2.34.1


