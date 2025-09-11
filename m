Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6D8CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78saqbBV7l7amg+T7GZYrtVBXo8ffvbG+RF5wZUGKuQ=; b=eEOjSpiBfjRIZAOL9GugxhcfDn
	1dI/13l0VQ7XuYji5BBwQQV4qPaxyozyYHe252FwZRO6khKxydk7w9tDpLjwNO7j5GHCoPtNGGOCo
	CXP07AJTjhvHBCs+ZgohjTzzFNxv283DGLlIwEjSbloia2bAW4xs8kllt5N9vA4xBMBwRJyrWBef7
	JSzt0k08q1U2h/YC+WkfC++AZsUYFPgEgNa+ogndmlTTtzmta/iPDKpfzD6WWLJYnlfTySUjooL9U
	0E6t6xyaP52snbY201S8gIKD6+M5gTqrKTX1Yyqvz0VkYKJhM3k+dFxN+DWpbYz3YzHjsdANsrglb
	o7786lCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfbt-00000002ikl-1EDr;
	Thu, 11 Sep 2025 11:37:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfbm-00000002ieO-1jYI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:36:59 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BBaUED793666;
	Thu, 11 Sep 2025 06:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757590590;
	bh=78saqbBV7l7amg+T7GZYrtVBXo8ffvbG+RF5wZUGKuQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hOfDKkMmxr580oGsCMt4qLsxC/JdOJSSOH6HAXjmH4wLKLlMk/EhVPMVUgwjQAovq
	 Ju1gdfKhxfgyemDxuACApHGu8RoKrW/C/8qTj0UqA4oUdIXZ3NuEEyg5jKr5m312wl
	 RSpA7jo9VlnvcIQfC8En1GqcVEJZs7PAuF+2BLD8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BBaURW1027202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 06:36:30 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 06:36:30 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 06:36:30 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BBaUha1015163;
	Thu, 11 Sep 2025 06:36:30 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58BBaTgj032087;
	Thu, 11 Sep 2025 06:36:29 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        MD Danish Anwar
	<danishanwar@ti.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>, Xin Guo <guoxin09@huawei.com>,
        Michael Ellerman
	<mpe@ellerman.id.au>, Fan Gong <gongfan1@huawei.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Lukas Bulwahn
	<lukas.bulwahn@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH net-next v4 6/7] MAINTAINERS: Add entry for RPMSG Ethernet driver
Date: Thu, 11 Sep 2025 17:06:11 +0530
Message-ID: <20250911113612.2598643-7-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911113612.2598643-1-danishanwar@ti.com>
References: <20250911113612.2598643-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_043658_584889_583BD3AB 
X-CRM114-Status: GOOD (  11.61  )
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

Add an entry to MAINTAINERS file for the rpmsg_eth driver with
appropriate maintainer information and mailing list.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3907f0c1243..9fd0f6a602d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22001,6 +22001,12 @@ L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 F:	drivers/tty/rpmsg_tty.c
 
+RPMSG ETHERNET DRIVER
+M:	MD Danish Anwar <danishanwar@ti.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/ethernet/rpmsg_eth*
+
 RTASE ETHERNET DRIVER
 M:	Justin Lai <justinlai0215@realtek.com>
 M:	Larry Chiu <larry.chiu@realtek.com>
-- 
2.34.1


