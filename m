Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9299ECA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I19BJzOlrTy3rbIT0DbZIyhSdbAvJz2UH8bWTicEpME=; b=K7HusGedIoaaTq1GiWRaNrJgy4
	aXc/hSVT3xuwYe1rzHZFfcI/PAwI1a7Iuy/s+EXIw+W1XOE0Wr+w419MjN6OBY8qbDpDOGNiyNF45
	sDFLQZSnRvWEaswzMaiHk4/VaOaJZTedPS/8LiiXVIgCTmqvlqQK4gQritMnbNpesnAzSXLJ/Vt4G
	C13cGXsfNaKOZdt7t/AzIogh71FvRnGMQMq0DRnjHGNuEI8Cuq4KPV7nMTi+3Tq5//N8c2j4Sv8M3
	xbMX+V22twplRYoRmvyxyuh9Yo3pljCkyvmsVM7dcJWCHYcAoSRmmD+tigcrNjJ2XIXcuhog7N41P
	IY6DkR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmxo-00000004KHo-23Mi;
	Thu, 08 Oct 2026 12:11:08 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmxk-00000004KGJ-45an;
	Thu, 08 Oct 2026 12:11:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=I19BJzOlrTy3rbIT0DbZIyhSdbAvJz2UH8bWTicEpME=;
	b=vCpXiLZT8xamRpJDaL2SNiNrsqQj4WNMGZnDX+KfBzHt/y3W1laRffiIIFYcZDIQZX2ByKx+P
	Z6Y+HBwhu3opo8ObKKkoIAlCQbgqaiAFsOrOdjWUqRBVm9rsecFweIt7SBrTR7+5KVViaWZK4BZ
	SGbZghZUcgFQgJdDTS0JPq8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j0pRk0dC3zRhXL;
	Thu,  8 Oct 2026 19:58:42 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 04AA6202E6;
	Thu,  8 Oct 2026 20:10:53 +0800 (CST)
Received: from [10.67.121.233] (10.67.121.233) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 8 Oct 2026 20:10:51 +0800
Message-ID: <66755d59-c6e5-4815-ae67-faf8ec0f6198@huawei.com>
Date: Thu, 8 Oct 2026 20:10:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Ciprian Regus <ciprian.regus@analog.com>, Andreas Larsson
	<andreas@gaisler.com>, Jian Shen <shenjian15@huawei.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>, MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>, Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-actions@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 00/10] net: Move setting of netops to fix crash
To: David Yang <mmyangfl@gmail.com>, <netdev@vger.kernel.org>
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.233]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo500018.china.huawei.com (7.202.195.199)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_051105_680131_900E1DDC 
X-CRM114-Status: GOOD (  11.65  )
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


on 2026/10/8 10:26, David Yang wrote:
> Commit ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev()
> locking assertion") put a netdev_need_ops_lock() check on the
> phy_attach_direct() path, in phy_link_topo_add_phy(). With
> CONFIG_NET_SHAPER enabled netdev_need_ops_lock() reads
> dev->netdev_ops->net_shaper_ops, so any driver that connects a PHY
> before assigning ndev->netdev_ops now dies with a NULL pointer
> dereference at probe time. The breakage showed up in v7.3-rc1.
>
> ibm/emac was hit first and fixed by commit 7c9f391ec89c ("net: emac:
> move setting of netops to fix crash"). These ten patches apply the
> same one-line move to the remaining in-tree drivers whose probe path
> attaches a PHY before filling in netdev_ops:
>
>    1. hisilicon/hisi_femac   (crash reproduced on hardware)
>    2. hisilicon/hip04
>    3. actions/owl-emac
>    4. adi/adin1140
>    5. marvell/mv643xx_eth
>    6. amd/au1000_eth
>    7. ethoc
>    8. aeroflex/greth
>    9. ti/icssm-prueth
>   10. microchip/lan865x      (attach happens inside oa_tc6_init())
>
> Only patch 1 was reproduced and verified on hardware; patches 2-10
> were found by source inspection and are neither build nor boot
> tested.
>
> Note that ti/netcp_ethss and cavium/thunder_bgx attach a PHY to
> netdevs that never get a netdev_ops at all (dummy netdevs), so they
> cannot be fixed by reordering and are not addressed here.
>
> David Yang (10):
>    net: hisilicon: hisi_femac: Move setting of netops to fix crash
>    net: hisilicon: hip04_eth: Move setting of netops to fix crash
>    net: ethernet: actions: Move setting of netops to fix crash
>    net: ethernet: adi: Move setting of netops to fix crash
>    net: mv643xx: move setting of netops to fix crash
>    net: au1000: move setting of netops to fix crash
>    net: ethoc: move setting of netops to fix crash
>    net: ethernet: aeroflex: move setting of netops to fix crash
>    net: ti: icssm-prueth: Move setting of netops to fix crash
>    microchip: lan865x: move setting of netops to fix crash

Why isn't the subject of the last patch "net: microchip: lan865x..."
But overall, it's okay.

Reviewed-by: Jijie Shao <shaojijie@huawei.com>


>
>   drivers/net/ethernet/actions/owl-emac.c          | 3 ++-
>   drivers/net/ethernet/adi/adin1140.c              | 3 ++-
>   drivers/net/ethernet/aeroflex/greth.c            | 3 ++-
>   drivers/net/ethernet/amd/au1000_eth.c            | 3 ++-
>   drivers/net/ethernet/ethoc.c                     | 3 ++-
>   drivers/net/ethernet/hisilicon/hip04_eth.c       | 3 ++-
>   drivers/net/ethernet/hisilicon/hisi_femac.c      | 3 ++-
>   drivers/net/ethernet/marvell/mv643xx_eth.c       | 4 ++--
>   drivers/net/ethernet/microchip/lan865x/lan865x.c | 3 ++-
>   drivers/net/ethernet/ti/icssm/icssm_prueth.c     | 3 ++-
>   10 files changed, 20 insertions(+), 11 deletions(-)
>

