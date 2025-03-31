Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76547C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UG5ANPgLPIpcH9YcOKSnG3Popb9NZmtFQ7SqTTyJy0=; b=OW6EpwIRPtNiG59jtCMI1XbCHO
	GzoXlIo2LGWKdM/yGzC7P0Ae3gbdV9m7gmVEMtsWWdSaPthKsPJI1DK8qsnFidoUFVs7GHepm3dbJ
	18i2FQDEChtuHRbrQvwZF5yoRzCeHxneVANvZFaKU7CJwF2YvLiDXT39ZSuHObwvtRZUYx5yg6usQ
	PFmZzcmzCIk1ru0nxjan436var4iHxK54MwgjqEXR/q26s0hexLYM9enqYH3AuL2kX2iVtdDpuOkP
	3p0nxfTticSjIRDXQWc1y4Py+XP4P8OJhfL+ny0PPNnACSLhcLVRc411PBS7OhIsTkL5uC4Hj7nQs
	yPV0lqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz92u-0000000H8td-4Aqc;
	Mon, 31 Mar 2025 06:54:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz91D-0000000H8j5-0jS0;
	Mon, 31 Mar 2025 06:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A147A42E8F;
	Mon, 31 Mar 2025 06:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2D5C4CEE3;
	Mon, 31 Mar 2025 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743403989;
	bh=FAP1uFngi3txu2jcmcowfO+bhV84fsioCaY71nIE/+o=;
	h=From:Date:Subject:To:Cc:From;
	b=BAuq3V7b0YUom6d2OXCQJUo4Hh6iKc8hOW2pdnRqaqZCj1x8efk9SWjEIUZXOxlgY
	 x+m3n2OwYUHyjHbarz9ATAdvW4LDPu24EWfUS5XVF88nVEL0tccc7YDyl/xE093UeR
	 7dPjfOyH/yf6GsuW1vG1NF5g4fEBJGiNgrOnQj47bQtxtWdT4zPFsFwX4Kh/p780wV
	 5nz50asv6x3TunjTeq4ndb+9JtFPh0pU9Jyat0TybkCgjM6wImUDBGfJ0v1K6XDrlD
	 9SzzpaTJx9gTHmQ8MyiCnaGSi23l1q1hh8us9S0IVHPnvwon1xYVCIQsu2gB6sdm0J
	 6HVH5xLbzCjuw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 31 Mar 2025 08:52:53 +0200
Subject: [PATCH net] net: airoha: Fix qid report in
 airoha_tc_get_htb_get_leaf_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMQ76mcC/x2NQQqAIBAAvxJ7bqG0sPpKdNBccyGyNCKI/p50n
 DnMPJAoMiUYigciXZw4bBnqsoDZ620hZJsZRCXaSsoaNcfgNfrT4GE5zRicW4O2aGlFxzcqRU0
 nVG+kVJAze6Ss/8U4ve8HaxOvvnIAAAA=
X-Change-ID: 20250331-airoha-htb-qdisc-offload-del-fix-77e48279b337
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_235311_348347_D92E361A 
X-CRM114-Status: GOOD (  10.24  )
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

Fix the following kernel warning deleting HTB offloaded leafs and/or root
HTB qdisc in airoha_eth driver properly reporting qid in
airoha_tc_get_htb_get_leaf_queue routine.

$tc qdisc replace dev eth1 root handle 10: htb offload
$tc class add dev eth1 arent 10: classid 10:4 htb rate 100mbit ceil 100mbit
$tc qdisc replace dev eth1 parent 10:4 handle 4: ets bands 8 \
 quanta 1514 3028 4542 6056 7570 9084 10598 12112
$tc qdisc del dev eth1 root

[   55.827864] ------------[ cut here ]------------
[   55.832493] WARNING: CPU: 3 PID: 2678 at 0xffffffc0798695a4
[   55.956510] CPU: 3 PID: 2678 Comm: tc Tainted: G           O 6.6.71 #0
[   55.963557] Hardware name: Airoha AN7581 Evaluation Board (DT)
[   55.969383] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   55.976344] pc : 0xffffffc0798695a4
[   55.979851] lr : 0xffffffc079869a20
[   55.983358] sp : ffffffc0850536a0
[   55.986665] x29: ffffffc0850536a0 x28: 0000000000000024 x27: 0000000000000001
[   55.993800] x26: 0000000000000000 x25: ffffff8008b19000 x24: ffffff800222e800
[   56.000935] x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8008b19000
[   56.008071] x20: ffffff8002225800 x19: ffffff800379d000 x18: 0000000000000000
[   56.015206] x17: ffffffbf9ea59000 x16: ffffffc080018000 x15: 0000000000000000
[   56.022342] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000001
[   56.029478] x11: ffffffc081471008 x10: ffffffc081575a98 x9 : 0000000000000000
[   56.036614] x8 : ffffffc08167fd40 x7 : ffffffc08069e104 x6 : ffffff8007f86000
[   56.043748] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
[   56.050884] x2 : 0000000000000000 x1 : 0000000000000250 x0 : ffffff800222c000
[   56.058020] Call trace:
[   56.060459]  0xffffffc0798695a4
[   56.063618]  0xffffffc079869a20
[   56.066777]  __qdisc_destroy+0x40/0xa0
[   56.070528]  qdisc_put+0x54/0x6c
[   56.073748]  qdisc_graft+0x41c/0x648
[   56.077324]  tc_get_qdisc+0x168/0x2f8
[   56.080978]  rtnetlink_rcv_msg+0x230/0x330
[   56.085076]  netlink_rcv_skb+0x5c/0x128
[   56.088913]  rtnetlink_rcv+0x14/0x1c
[   56.092490]  netlink_unicast+0x1e0/0x2c8
[   56.096413]  netlink_sendmsg+0x198/0x3c8
[   56.100337]  ____sys_sendmsg+0x1c4/0x274
[   56.104261]  ___sys_sendmsg+0x7c/0xc0
[   56.107924]  __sys_sendmsg+0x44/0x98
[   56.111492]  __arm64_sys_sendmsg+0x20/0x28
[   56.115580]  invoke_syscall.constprop.0+0x58/0xfc
[   56.120285]  do_el0_svc+0x3c/0xbc
[   56.123592]  el0_svc+0x18/0x4c
[   56.126647]  el0t_64_sync_handler+0x118/0x124
[   56.131005]  el0t_64_sync+0x150/0x154
[   56.134660] ---[ end trace 0000000000000000 ]---

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c0a642568ac115ea9df6fbaf7133627a4405a36c..20a96cafc748e97a8ff9ab33a5be71ab62e8c9c5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2358,7 +2358,7 @@ static int airoha_tc_get_htb_get_leaf_queue(struct airoha_gdm_port *port,
 		return -EINVAL;
 	}
 
-	opt->qid = channel;
+	opt->qid = AIROHA_NUM_TX_RING + channel;
 
 	return 0;
 }

---
base-commit: 2ea396448f26d0d7d66224cb56500a6789c7ed07
change-id: 20250331-airoha-htb-qdisc-offload-del-fix-77e48279b337

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


