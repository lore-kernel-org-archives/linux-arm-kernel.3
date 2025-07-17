Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF16C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dsr9dRbVAldNjV8JKgEZYv9SvaMuV8zTMgrBYyOwtvE=; b=odzlz39+ieRQpWZeXBu5b5eeA3
	n1zmZgdU0Zvn6JEgkViO06ooqHtGVOHt0WSk8sJq6Fr8QxW7I0Q8ZNn74GmeV/DXx5bryvkfQLF5O
	mUFZmpkcksqoVi99v0cWYlVGnoJcDVbOLTvqTtQS8o6Ofs9/pkxssGKYf/BmcN04KOtzNsQtZlit/
	wtPgHkfU7pM5Iji5ObFISAlPae1jgNKHb7xV35ddb4EQSxV2zzyyrpoUj5tNPnh4hVORhmccHg2X5
	lRbuFcPUr2GkpmIG+N8Ma1LloztBtvJrkBnDCIuPzcqigEkNp4Q3QIIs8uZQUk2yMBFK5IzAjmmU3
	DZuZ6Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL1r-00000009jzp-0hpn;
	Thu, 17 Jul 2025 09:35:51 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKTt-00000009ezx-2hFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dsr9dRbVAldNjV8JKgEZYv9SvaMuV8zTMgrBYyOwtvE=; b=Ne0VSSo1FLMDjFtkk3AAUBO5xK
	pTqhbA0WtSEWXzGsjQ9zMWPhGJPBdZs0rj5gEFVGGscS0TVlWNbFMQna8knEIof9bjUXTMcpoFAW9
	s+XZji/MfUzftQXCOFDAAebFBP60xagu34eHu5Pcoi7RvfnesdqDwk1GiARfXnyzOE21NGOdmjAaz
	ahO/BCLMzXImHsBQi6pJYKKNaKBZCDwsEhuTRoOlYrRMO3ct1crtcglsT5jvA/XuuOSYKC8QN6um4
	iGPGgbcgZOkMSbCEbbOgRvT/JyUNDjBLHYkEsm4K6DgLKcHWvshJAds9DcSVCu0g7pJy2hFKLCtpm
	4JxFgFDA==;
Received: from [89.212.21.243] (port=53282 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ucKTp-00DbO3-1Q;
	Thu, 17 Jul 2025 11:00:40 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 0/2] Populate of_node for i.MX netdevs
Date: Thu, 17 Jul 2025 11:00:35 +0200
Message-Id: <20250717090037.4097520-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_020046_157682_96E5F259 
X-CRM114-Status: UNSURE (   2.85  )
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

Recently when working on predictable network names for i.MX SoCs, it
was discovered that of_node sysfs properties are missing for FEC and
EQOS interfaces.

Without this, udev is unable to expose the OF_* properties (OF_NAME,
OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) and thus we cannot identify
interface based on those properties.

Fix this by populating netdev of_node in respective drivers.

Result:

$ ls -l /sys/class/net/end1/of_node
/sys/class/net/end1/of_node -> 
'../../../../../../../firmware/devicetree/base/soc@0/bus@42800000/ethernet@428a0000'/
$ ls -l /sys/class/net/end0/of_node                                                                              
/sys/class/net/end0/of_node -> 
'../../../../../../../firmware/devicetree/base/soc@0/bus@42800000/ethernet@42890000'/

$ udevadm info /sys/class/net/end0
P: /devices/platform/soc@0/42800000.bus/42890000.ethernet/net/end0
M: end0
R: 0
U: net
I: 2
E: DEVPATH=/devices/platform/soc@0/42800000.bus/42890000.ethernet/net/end0
E: SUBSYSTEM=net
E: OF_NAME=ethernet
E: OF_FULLNAME=/soc@0/bus@42800000/ethernet@42890000
E: OF_COMPATIBLE_0=fsl,imx93-fec
E: OF_COMPATIBLE_1=fsl,imx8mq-fec
E: OF_COMPATIBLE_2=fsl,imx6sx-fec
E: OF_COMPATIBLE_N=3
E: OF_ALIAS_0=ethernet0
E: INTERFACE=end0
E: IFINDEX=2
E: USEC_INITIALIZED=5227083
E: ID_NET_DRIVER=fec
E: ID_NET_NAMING_SCHEME=latest
E: ID_NET_NAME_MAC=enx502df44dbd5e
E: ID_NET_NAME_ONBOARD=end0
E: ID_PATH=platform-42890000.ethernet
E: ID_PATH_TAG=platform-42890000_ethernet
E: SYSTEMD_ALIAS=/sys/subsystem/net/devices/end0
E: TAGS=:systemd:
E: CURRENT_TAGS=:systemd:

$ udevadm info /sys/class/net/end1
P: /devices/platform/soc@0/42800000.bus/428a0000.ethernet/net/end1
M: end1
R: 1
U: net
I: 3
E: DEVPATH=/devices/platform/soc@0/42800000.bus/428a0000.ethernet/net/end1
E: SUBSYSTEM=net
E: OF_NAME=ethernet
E: OF_FULLNAME=/soc@0/bus@42800000/ethernet@428a0000
E: OF_COMPATIBLE_0=nxp,imx93-dwmac-eqos
E: OF_COMPATIBLE_1=snps,dwmac-5.10a
E: OF_COMPATIBLE_N=2
E: OF_ALIAS_0=ethernet1
E: INTERFACE=end1
E: IFINDEX=3
E: USEC_INITIALIZED=5370305
E: ID_NET_NAMING_SCHEME=latest
E: ID_NET_NAME_MAC=enx502df44dbd5f
E: ID_NET_NAME_ONBOARD=end1
E: ID_PATH=platform-428a0000.ethernet
E: ID_PATH_TAG=platform-428a0000_ethernet
E: SYSTEMD_ALIAS=/sys/subsystem/net/devices/end1
E: TAGS=:systemd:
E: CURRENT_TAGS=:systemd:


Primoz Fiser (2):
  net: fec: fec_probe(): Populate netdev of_node
  net: stmmac: Populate netdev of_node

 drivers/net/ethernet/freescale/fec_main.c         | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1


