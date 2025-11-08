Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C529CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p7uhLo/agwhBgHHuGTDmQCEG8rXbE6aWjg4WrceCqds=; b=vdNN3Bj7Q93WURTKbvNQAuAPBI
	DNx+1vSNrdkRJ7i9drL34z06N00Nbvr1Dmab6MBPqx+qB+cvExbuk9TwbQ5N50sut4YAm5zJzao1E
	+SV3go3QYAS9v3OKC+vrJ7PJNwJwXzgQhW5p/xNtIEblS07wMMDaU/9M5XDucTerFp7x6aUywmiZ3
	UkTJ/dXxh6UXN+5AMQVKrGFHIz5RdFVP4h6EV+FtNTWQHx2uWKMgWpY4tGEPLxi5JWGdoRM49gMgf
	n/eCPbvrFDwmu+j0DoABEfIsKq8rQpkWV3R4DZbwiT0zoQjVbw1MQuBamyoUqLDx77mgjDTrKWFxR
	iRuDP2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHhIX-000000034nr-0eEl;
	Sat, 08 Nov 2025 11:40:01 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHhIT-000000034ll-18sg;
	Sat, 08 Nov 2025 11:39:59 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id B39E55FE85;
	Sat,  8 Nov 2025 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762601993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p7uhLo/agwhBgHHuGTDmQCEG8rXbE6aWjg4WrceCqds=;
	b=APTqCz1Jc5s6V9bo+Co9k6atAjhC8MSQ8UIbwhAgzwkK1lYFMnKX8RWZMJvtbQRHJvEd1L
	n6NXXf7tB2w4lrI9CxYR176AZGo/swW3YjHyOiiHx+Ia66RCUbBISM55hVUAqyZ5hs6Dy9
	s53BNxko/6xW3qq3oOWFb+dCpoQ6dTQ=
Received: from frank-u24.. (fttx-pool-217.61.148.22.bambit.de [217.61.148.22])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 72F171226CD;
	Sat,  8 Nov 2025 11:39:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC net-next 0/3] Add RSS and LRO support
Date: Sat,  8 Nov 2025 12:39:16 +0100
Message-ID: <20251108113926.102054-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_033957_736941_9101FA14 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Frank Wunderlich <frank-w@public-files.de>

This series is currently only for discussion to get the upported SDK driver
changes in a good shape.
To use it some other parts are still missing like USXGMII PCS support on
mt7988.

patches are upported from mtk SDK:
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-08-mtk_eth_soc-add-register-definitions-for-rss-lro-reg.patch
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-09-mtk_eth_soc-add-rss-support.patch
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-10-mtk_eth_soc-add-hw-lro-support.patch

RSS / LRO

HW-acceleration for ending traffic. For routed traffic PPE is needed and
hw offloading in nftables.
Bridged traffic may need additional changes (openwrt use bridger utility).

RSS (Receive Side Scaling)

using 4 additional IRQ for spreading load

cat /proc/interrupts | grep ethernet

echo 1 > /proc/irq/105/smp_affinity
echo 2 > /proc/irq/106/smp_affinity
echo 4 > /proc/irq/107/smp_affinity
echo 8 > /proc/irq/108/smp_affinity

moving tx frame-engine irq to different cpu (here 3rd)
echo 4 > /proc/irq/103/smp_affinity

disable RPS (Receive Packet Steering) for all macs:

echo 0 > /sys/devices/platform/soc/15100000.ethernet/net/eth0/queues/rx-0/rps_cpus

pay attention on iperf-version (iperf 3.17 is ok, 3.12 is not)

traffic must be created using multiple streams so that it can be splitted, so use
multithreaded iperf3

on R4: bin/iperf3 -s
on the other side: iperf3 -c 192.168.1.1 -i 1 -P 4

you should reach ~9.3 GBit/s

and see spreading load over CPU cores

root@bpi-r4-phy-8G:~# cat /proc/interrupts | grep eth
103: 20 198366 0 0 GICv3 229 Level 15100000.ethernet
105: 3611 0 0 0 GICv3 221 Level 15100000.ethernet, 15100000.ethernet
106: 2 6842 0 0 GICv3 222 Level 15100000.ethernet, 15100000.ethernet
107: 4 0 27643 0 GICv3 223 Level 15100000.ethernet, 15100000.ethernet
108: 3 0 0 27925 GICv3 224 Level 15100000.ethernet, 15100000.ethernet

using the iperf3 from debian bookworm (3.12) results in only 6.7GBit/s, so
newer version is needed (not tested yet in trixie).

LRO(Large Receive Offload)

Add HW LRO RX rule:

ethtool -N [interface] flow-type tcp4 dst-ip [IP] action 0 loc [0/1]

Delete HW LRO RX rule:

ethtool -N [interface] delete [0/1]

Enable/Disable HW LRO rule:

ethtool -K [interface] lro [on | off]

Show the current offload features:

ethtool -k [interface]

example:

ethtool -N eth2 flow-type tcp4 dst-ip 192.168.1.1 action 0 loc 0
ethtool -K eth2 lro on ethtool -k eth2

using iperf(2) instead of iperf3 to reach full traffic!

verify with propritary debugfs (not part of this series)

Enable HW LRO rings
echo 4 1 > /proc/mtketh/hw_lro_auto_tlb
Enable HW LRO statistics
echo 5 1 > /proc/mtketh/hw_lro_auto_tlb

cat /proc/mtketh/hw_lro_stats

Mason Chang (3):
  net: ethernet: mtk_eth_soc: Add register definitions for RSS and LRO
  net: ethernet: mtk_eth_soc: Add RSS support
  net: ethernet: mtk_eth_soc: Add LRO support

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 770 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 171 +++--
 2 files changed, 757 insertions(+), 184 deletions(-)

-- 
2.43.0


