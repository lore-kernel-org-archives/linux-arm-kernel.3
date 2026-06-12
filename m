Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFA2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPpIsBtDcxeyuYuQ25LVg8EOPmF+Ro2VJ4qeV5pRMhI=; b=kmx8fActAsK2lq4vcaBSuZautY
	XRf1FVo9Auz64A7I7iPYLGMYV7YtJBFMtj7Ri8Ym4os9uDvackGxh3Ii3lTdh6/SxMTLETGkjg3il
	Yd0rprvVlC6trkusAbyfcmDDmN3RZ7Zm4R67gLMIGMzbq+xmaUM3CIT6SQ4kfukyTWDnTjfmDC51a
	BNqR9V4jqvLjyl+FUK7Rxpf1AQKdZe9AcYMyx/u5KlZLNM2YIc0IJytI2jHMskEAFGMMkaO3VGKew
	ISZFpJ9AdHIhO0ctzAxI/QQFSYwXzYzcfqqtPbaGn25Af25XzShw33qnCcl0zALT7A4puu+uIL33N
	znsttaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1AC-0000000Aso1-2UPo;
	Fri, 12 Jun 2026 12:39:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1A7-0000000Asj4-42Bq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781267943; x=1812803943;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=kEeUsqRoDht0JsLNg8VqZNek9FXwge3FrFv+uF0ARqg=;
  b=J5hUa8YB9ylzBOdRwOrKQz1XUA3Vabsnb5ndJvZbsom0ZFgR8xXjQNKT
   fUYuwYF5Ov3PmsO8IhdQC7AfEKINDQc3KyyedYCjKNfuaWYFQSpUh7aHb
   FdtujC3jNFHvAuzR7k5zeDpYQ1OUv3PNzByjCNVtAt3rgUYcnzKOlryOv
   PWHiqqeUHk4306VMORyyy1hl9cKdRaLtOd8lw+4HoRzMGN0OdP/CGPU0y
   sCvG4YbZZ4L0pQ8gJzWHoR3m8xCipDG538nmk/7JCJ4H4kNGOVhQzk70f
   GQMrdfAQNi6xeQnRPOFR4w5sFtISDGElNp8tDzAjMkG4breChPttUEC8m
   A==;
X-CSE-ConnectionGUID: fXak9KnAQbCITrswHQFl3w==
X-CSE-MsgGUID: 9nckSlZ2Q3y/Py4seiqz2g==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="68073266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:39:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 12 Jun 2026 05:39:02 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 05:39:00 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Fri, 12 Jun 2026 14:37:18 +0200
Subject: [PATCH net-next 9/9] net: sparx5: add neighbour event handling for
 L3 routing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260612-sparx5_l3_routing-v1-9-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
In-Reply-To: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Machon
	<daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053904_022787_4D0852DE 
X-CRM114-Status: GOOD (  15.71  )
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

Register a netevent notifier to handle NETEVENT_NEIGH_UPDATE events,
completing the L3 unicast forwarding data path:

- When ARP/NDP resolves a neighbour, update the hardware ARP table entry
  with the resolved MAC address and notify all linked nexthops to
  refresh their ECMP forwarding state.

- When a neighbour becomes unreachable, tear down the hardware ARP entry
  and mark linked nexthops as unresolved so traffic traps to the CPU.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_router.c  | 108 ++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
index 5f6b4288755e..4e8950d6535f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
@@ -2525,6 +2525,104 @@ static int sparx5_rr_fib_event(struct notifier_block *nb, unsigned long event,
 	return NOTIFY_BAD;
 }
 
+static void sparx5_rr_neigh_event_work(struct work_struct *work)
+{
+	struct sparx5_rr_netevent_work *net_work =
+		container_of(work, struct sparx5_rr_netevent_work, work);
+	unsigned char hwaddr[ETH_ALEN] __aligned(2);
+	struct sparx5 *sparx5 = net_work->sparx5;
+	struct neighbour *n = net_work->neigh;
+	struct sparx5_rr_neigh_key key = { };
+	struct sparx5_rr_neigh_entry *entry;
+	bool entry_connected;
+	u8 nud_state, dead;
+
+	sparx5_rr_nb2neigh_key(n, &key);
+
+	/* Frames with link-local dip are trapped, so ignore the neighbour. */
+	if (key.iaddr.version == SPARX5_IPV6 &&
+	    ipv6_addr_type(&key.iaddr.ipv6) & IPV6_ADDR_LINKLOCAL)
+		goto out;
+
+	/* If n changes after this read section, we will get another neigh
+	 * event, which is processed after the current one.
+	 */
+	read_lock_bh(&n->lock);
+	ether_addr_copy(hwaddr, n->ha);
+	nud_state = n->nud_state;
+	dead = n->dead;
+	read_unlock_bh(&n->lock);
+
+	mutex_lock(&sparx5->router->lock);
+
+	entry_connected = nud_state & NUD_VALID && !dead;
+	entry = sparx5_rr_neigh_entry_lookup(sparx5, &key);
+	if (!entry_connected && !entry)
+		goto out_mutex;
+
+	if (!entry) {
+		entry = sparx5_rr_neigh_entry_create(sparx5, &key);
+		if (IS_ERR(entry))
+			goto out_mutex;
+	}
+
+	if (entry->connected && entry_connected &&
+	    ether_addr_equal(entry->hwaddr, hwaddr))
+		goto out_mutex;
+
+	ether_addr_copy(entry->hwaddr, hwaddr);
+	sparx5_rr_neigh_entry_update(sparx5, entry, entry_connected);
+	sparx5_rr_nexthops_update_notify(sparx5, entry, entry_connected);
+	if (!entry_connected)
+		sparx5_rr_neigh_entry_put(sparx5, entry);
+
+out_mutex:
+	mutex_unlock(&sparx5->router->lock);
+out:
+	neigh_release(n);
+	kfree(net_work);
+}
+
+/* Handle neighbour update events. Used to manage neigh_entries. Called in
+ * atomic context, with rcu_read_lock().
+ */
+static int sparx5_rr_netevent_event(struct notifier_block *nb,
+				    unsigned long event, void *ptr)
+{
+	struct sparx5_rr_netevent_work *net_work;
+	struct sparx5_router *router;
+	struct sparx5_port *port;
+	struct neighbour *n;
+
+	router = container_of(nb, struct sparx5_router, netevent_nb);
+
+	switch (event) {
+	case NETEVENT_NEIGH_UPDATE:
+		n = ptr;
+
+		if (n->tbl->family != AF_INET && n->tbl->family != AF_INET6)
+			return NOTIFY_DONE;
+
+		port = sparx5_port_dev_lower_find(n->dev);
+		if (!port)
+			return NOTIFY_DONE;
+
+		net_work = kzalloc_obj(*net_work, GFP_ATOMIC);
+		if (!net_work)
+			return NOTIFY_BAD;
+
+		INIT_WORK(&net_work->work, sparx5_rr_neigh_event_work);
+		net_work->sparx5 = router->sparx5;
+		net_work->neigh = neigh_clone(n);
+		net_work->event = event;
+		sparx5_rr_schedule_work(router->sparx5, &net_work->work);
+
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_DONE;
+};
+
 static void sparx5_rr_leg_base_mac_set(struct sparx5 *sparx5,
 				       unsigned char mac[ETH_ALEN])
 {
@@ -2903,10 +3001,15 @@ int sparx5_rr_router_init(struct sparx5 *sparx5)
 		 ANA_ACL_VCAP_S2_MISC_CTRL_ACL_RT_SEL, sparx5,
 		 ANA_ACL_VCAP_S2_MISC_CTRL);
 
+	r->netevent_nb.notifier_call = sparx5_rr_netevent_event;
+	err = register_netevent_notifier(&r->netevent_nb);
+	if (err)
+		goto err_workqueue_destroy;
+
 	r->fib_nb.notifier_call = sparx5_rr_fib_event;
 	err = register_fib_notifier(&init_net, &r->fib_nb, NULL, NULL);
 	if (err)
-		goto err_workqueue_destroy;
+		goto err_unreg_netevent_notifier;
 
 	r->inetaddr_nb.notifier_call = sparx5_rr_inetaddr_event;
 	err = register_inetaddr_notifier(&r->inetaddr_nb);
@@ -2945,6 +3048,8 @@ int sparx5_rr_router_init(struct sparx5 *sparx5)
 	unregister_inetaddr_notifier(&r->inetaddr_nb);
 err_unreg_fib_notifier:
 	unregister_fib_notifier(&init_net, &r->fib_nb);
+err_unreg_netevent_notifier:
+	unregister_netevent_notifier(&r->netevent_nb);
 err_workqueue_destroy:
 	destroy_workqueue(r->sparx5_router_owq);
 err_fib_ht_destroy:
@@ -2979,6 +3084,7 @@ void sparx5_rr_router_deinit(struct sparx5 *sparx5)
 	unregister_inetaddr_validator_notifier(&router->inetaddr_valid_nb);
 	unregister_inetaddr_notifier(&router->inetaddr_nb);
 	unregister_fib_notifier(&init_net, &router->fib_nb);
+	unregister_netevent_notifier(&router->netevent_nb);
 	destroy_workqueue(router->sparx5_router_owq);
 	sparx5_rr_fib_flush(sparx5);
 	rhashtable_destroy(&router->fib_ht);

-- 
2.52.0


