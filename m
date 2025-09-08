Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D4CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Si1lSyehp6dRplkyhObpn2czYygsqhamU+NNCG1asbQ=; b=Vj/z4kEOpnYjUQl/IATNrpOSSy
	AvaHcd9IxQG59VLdirhDYySv778H08GSDlh+KTLYTIjH9qod2LY/rU3oRYRGjboV98PtPhexn3syt
	W17ymwYklGqivNWDUAQpYPC4HvF6XFvoVtY0MJ8pUpsVqM5xZHAiyVhYRRDdUSJv8ykXVgBft7UJY
	UezEtnDpa2OFhHSyNKoPRP63wsc4D3dbRPM9a5eX7w8hEHJMCzStLWeA5K3jcCbqt7DO/EoEPLRXP
	oJSBseruIddklo+Ka39GHHSbK2YV7T5crj4Oaei9ON9I8gTaRBJ1CsA2AqcvAmVcvcJY0dD/g7TbX
	qtwKNxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYZo-0000000GBob-3gFl;
	Mon, 08 Sep 2025 09:54:20 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXrP-0000000FuzZ-1lSU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 09:08:28 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58898460071990;
	Mon, 8 Sep 2025 04:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757322484;
	bh=Si1lSyehp6dRplkyhObpn2czYygsqhamU+NNCG1asbQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AV4y3brD+tzahFqsFzrEy+zaq8nCMR7TeldohLP0AKv6RksPCkjgOH+r0/LPSBEsL
	 y5c1usMTM3CG/xt9DnaCH5vaptD1ef/PSJJYXVenONXR+CWPUAv//yqkiRwJXO0HbN
	 TAC1jARl5H7dWsK/DlwokM7v/anilxQilwaxdFI4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588984L62303172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 04:08:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 04:08:03 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 04:08:03 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588983a72355920;
	Mon, 8 Sep 2025 04:08:03 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 588983tA023048;
	Mon, 8 Sep 2025 04:08:03 -0500
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
        Luo Jie
	<quic_luoj@quicinc.com>, Fan Gong <gongfan1@huawei.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Lee Trager
	<lee@trager.us>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH net-next v3 6/7] MAINTAINERS: Add entry for RPMSG Ethernet driver
Date: Mon, 8 Sep 2025 14:37:45 +0530
Message-ID: <20250908090746.862407-7-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908090746.862407-1-danishanwar@ti.com>
References: <20250908090746.862407-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_020827_552196_C6009D8E 
X-CRM114-Status: GOOD (  11.55  )
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
index b81595e9ea95..76ffc506c87c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22002,6 +22002,12 @@ L:	linux-remoteproc@vger.kernel.org
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


