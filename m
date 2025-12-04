Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E111FD24440
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yEf34xHass0T0b10s6FQMT0sLObUUkUTpYfcGRnwAwU=; b=Nn3sJ4sa78rYIQKOO2BHFAF4G9
	yHe2wKrU3O81jRX0K6E3xC4aDmD9m4GffojXHmyZBtQXea9kHi4Mh4DQOW56NukiSq/S0RAjML4rx
	aEaO+vgxTJ8VrloRssKEO6Ow2WjBoAusuNnvZg9RaVpY1PCirxhuJJyVwzS/4kPfmKqs7sSLq1JXI
	DWzE7QF4hVGBjJGdOqcJESbWJlyjckKyNVR242WT6jtbam9Md9uFh+VBWvXtwP9OMbA71xLlBDviE
	y1TTia49kPUvrL/rl8rKoSSrNEA7KQmFqTrFEsT85jub/+QDx6eDVZHFbZtI4c068OvHspzNgH4pK
	VIUK3wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCfc-00000008KWc-3M9D;
	Thu, 04 Dec 2025 16:59:08 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCfa-00000008KVQ-0O6S;
	Thu, 04 Dec 2025 16:59:07 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 6EA9A604D8;
	Thu,  4 Dec 2025 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1764867540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yEf34xHass0T0b10s6FQMT0sLObUUkUTpYfcGRnwAwU=;
	b=Dj4w0xlX7NLM+Fzl6FHDzbPflg0O6XePe+A8UwQjldkWgAWVLnpHrtIA4xbBQOA/jtB1a9
	prO8apLdAo099MsGpJ0xCSwmnX2EnXItE02lGa1Ij5VkQacvTk7VZnyw3FfljtNHBDUDR5
	tAKu+iNZW5AipCHWAedSmaVmt0klx1k=
Received: from frank-u24.. (fttx-pool-157.180.225.155.bambit.de [157.180.225.155])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 2BA6B1226EB;
	Thu,  4 Dec 2025 16:59:00 +0000 (UTC)
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
Subject: [RFC v2 0/3] Add RSS and LRO support
Date: Thu,  4 Dec 2025 17:58:42 +0100
Message-ID: <20251204165849.8214-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_085906_333343_F612F18A 
X-CRM114-Status: UNSURE (   9.79  )
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

changes:
  v2:
    - drop wrong change (MTK_CDMP_IG_CTRL is only netsys v1)
    - Fix immutable string IRQ setup (thx to Emilia Schotte)
    - drop links to 6.6 patches/commits in sdk in comments


Mason Chang (3):
  net: ethernet: mtk_eth_soc: Add register definitions for RSS and LRO
  net: ethernet: mtk_eth_soc: Add RSS support
  net: ethernet: mtk_eth_soc: Add LRO support

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 762 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 171 +++--
 2 files changed, 753 insertions(+), 180 deletions(-)

-- 
2.43.0


