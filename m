Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD3C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLhhUntP2UZd7usambWoY0dwKj1ntPIBjjB55O/+Cfo=; b=3rYcd5+MVyMgioZQU3g3HyY9os
	4CXsmF9U+EO23ppAKcKtf95yikp0K853vFDZjMPI78BFbJZ1qqAZtEraE/vW5b7ZpMmJpMW9SpE7l
	CKpu3sEg7j7lQ78+nKvzWSPAkm1XVr5Q/xiuK78pQcpP3me1db4eQ4DdocSFr+sXvXdwknC1vK/9C
	5uDAbip8VsKyiY/0KFLafw0go5+gmBrTVw3MqQvgmSrhzWitQVfuK/qah1R0wD7fyJ5aaoOSi7vz3
	IYr+/lqSnT3FmLznCEoCnkQNkobhmg/X/VuS4cLTbMub60z8jB8IVTsgHQJ2CcQvWl0oZ/FFov+XX
	YXVs373A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Kn-0000000AsjN-3p7Z;
	Thu, 17 Sep 2026 08:19:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Kl-0000000Asib-482L;
	Thu, 17 Sep 2026 08:19:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F6F1600D4;
	Thu, 17 Sep 2026 08:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7311F000FF;
	Thu, 17 Sep 2026 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633147;
	bh=TLhhUntP2UZd7usambWoY0dwKj1ntPIBjjB55O/+Cfo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CJn7AYvy9IBI2JLMN/hlKubM4BWIpnkD5dgJ/udfIJGEmK2hMH2R7FWZkRHzLhPv4
	 Ltgp6qlU5FKFa8R0v4Bv2rWrZOkjOSgJ/RlTpXSjQ68jVO/RyfWXLCkhUiURZJILnY
	 A5jT0iNk/ZNUh8kDHI2tCuDB7Kn5pvHrRpgpQel9FDeWhnM6XvH42lHJNY8+2ZT3/A
	 DZPdimsp2A/NeQKdoxBTqcWgMazI6VDHvM2VJYbGj8a3sMrvDUxzTWn8cXzY+DOUeF
	 aAOJExkVKAJirw04SnxV2bCBkiiQoI8Eg0mlOhaGdp31o70i69dyfK4ncApxcRQ2DA
	 v+yf3HzFoJGCw==
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
From: netdev-bot+sashiko@kernel.org
To: lgs201920130244@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Date: Thu, 17 Sep 2026 08:19:05 +0000
Message-ID: <178963314597.22033.1751942424673544030@kernel.org>
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 2 (1) · Medium: 0 · Low: 0

- [High] mtk_remove() now calls mtk_ppe_deinit(eth)
  (drivers/net/ethernet/mediatek/mtk_eth_soc.c:5409) *before*…
- [High] The patch closes only half of the leak it claims to fix.

Pre-existing issues:
- [High] mtk_ppe_init() registers per-PPE debugfs entries via
  mtk_ppe_debugfs_init() (mtk_ppe.c:934), which creates a top-level…

--

net: mediatek: fix PPE resource leak on remove

This adds a mtk_ppe_deinit(eth) call to mtk_remove() so that the l2_flows
rhashtables allocated by mtk_ppe_init() are released on device removal, the
way the probe error unwind already does.  A few questions about the placement
and the completeness of the teardown below.

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index fd7a49ae88d01..903dac36ccf10 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5406,6 +5406,7 @@ static void mtk_remove(struct platform_device *pdev)
>  
>  	netif_napi_del(&eth->tx_napi);
>  	netif_napi_del(&eth->rx_napi);
> +	mtk_ppe_deinit(eth);

[Severity: High]
Can this destroy ppe[i]->l2_flows while the netdevs are still registered and
their flow offload callbacks are still live?

mtk_ppe_deinit() only calls rhashtable_destroy(), which frees the bucket
table and leaves ht->tbl dangling, while eth->ppe[i] stays non-NULL:

drivers/net/ethernet/mediatek/mtk_ppe.c:mtk_ppe_deinit() {
	for (i = 0; i < ARRAY_SIZE(eth->ppe); i++) {
		if (!eth->ppe[i])
			return;
		rhashtable_destroy(&eth->ppe[i]->l2_flows);
	}
}

The unregister_netdev() calls only happen afterwards, in mtk_cleanup() ->
mtk_unreg_dev(), and unregistering a device with offloaded flower rules
replays the removals back into the driver:

unregister_netdev() -> dev_shutdown() -> tcf_block_offload_unbind() ->
tcf_block_unbind() -> tcf_block_playback_offloads(..., add=false) ->
fl_reoffload()

net/sched/cls_flower.c:fl_reoffload() {
		cls_flower.command = add ?
			FLOW_CLS_REPLACE : FLOW_CLS_DESTROY;

For an MTK_FLOW_TYPE_L2 (bridge) entry that lands back in the already
destroyed table:

mtk_eth_setup_tc_block_cb() -> mtk_flow_offload_cmd() ->
mtk_flow_offload_destroy() -> mtk_foe_entry_clear() ->

drivers/net/ethernet/mediatek/mtk_ppe.c:__mtk_foe_entry_clear() {
	if (entry->type == MTK_FLOW_TYPE_L2) {
		rhashtable_remove_fast(&ppe->l2_flows, &entry->l2_node,
				       mtk_flow_l2_ht_params);

Is there anything preventing a concurrent FLOW_CLS_REPLACE from reaching
mtk_foe_entry_commit_l2() -> rhashtable_lookup_get_insert_fast() on the same
freed table?  mtk_remove() holds neither rtnl nor mtk_flow_offload_mutex.

The same applies to eth->reset.monitor_work and eth->pending_work, which are
only cancelled later, inside mtk_cleanup():

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_cleanup() {
	mtk_sgmii_destroy(eth);
	mtk_unreg_dev(eth);
	mtk_free_dev(eth);
	cancel_work_sync(&eth->pending_work);
	cancel_delayed_work_sync(&eth->reset.monitor_work);

If those re-run mtk_open()/napi_enable(), the receive path reaches
mtk_ppe_check_skb() -> rhashtable_lookup_fast(&ppe->l2_flows) on the freed
table.

The probe unwind orders this the other way around:

err_unreg_netdev:
	mtk_unreg_dev(eth);
err_deinit_ppe:
	mtk_ppe_deinit(eth);

Would placing mtk_ppe_deinit(eth) after mtk_cleanup(eth) match that order?

[Severity: High]
Does this leave eth->flow_table leaked?

mtk_probe() initializes two rhashtables per PPE index: l2_flows inside
mtk_ppe_init(), and eth->flow_table inside mtk_eth_offload_init():

drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_eth_offload_init() {
	if (!eth->ppe[id] || !eth->ppe[id]->foe_table)
		return 0;
	return rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
}

The only two rhashtable_destroy() call sites in
drivers/net/ethernet/mediatek/ are both on ppe->l2_flows, in mtk_ppe_init()'s
error path and in mtk_ppe_deinit(), so eth->flow_table's bucket table is
never freed on unbind either before or after this patch.  Should
mtk_ppe_deinit() (or the remove path) also destroy eth->flow_table?

Two related observations on eth->flow_table:

Only rhashtable_free_and_destroy() does cancel_work_sync(&ht->run_work), so a
pending deferred rehash work item stays pointing into struct mtk_eth, which
is devm_kzalloc'ed in mtk_probe() and freed on detach.

eth->flow_table is a single per-device field, but mtk_eth_offload_init() is
called once per PPE index in the mtk_probe() loop, and ppe_num is 2 on
mt7986/mt7981 and 3 on mt7988.  Does re-running rhashtable_init() on the same
object overwrite and leak the previously allocated bucket table already at
probe time?

[Severity: High]
This isn't a bug introduced by this patch, but since mtk_ppe_deinit() is now
the PPE teardown for the remove path: it has no counterpart for the debugfs
entries created during init.

mtk_ppe_init() ends with mtk_ppe_debugfs_init(ppe, index), and that creates a
top level directory plus two files whose private data is the devm_kzalloc'ed
struct mtk_ppe:

drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:mtk_ppe_debugfs_init() {
	root = debugfs_create_dir(ppe->dirname, NULL);
	debugfs_create_file("entries", S_IRUGO, root, ppe, &mtk_ppe_debugfs_foe_all_fops);
	debugfs_create_file("bind", S_IRUGO, root, ppe, &mtk_ppe_debugfs_foe_bind_fops);

The root dentry is not stored anywhere and there is no debugfs_remove() for
the PPE in the driver (the only debugfs_remove() in
drivers/net/ethernet/mediatek/ is in mtk_wed.c, which does keep
hw->debugfs_dir).  With CONFIG_DEBUG_FS=y, does reading
/sys/kernel/debug/ppe0/entries after unbind dereference the freed struct
mtk_ppe and its freed dmam-allocated foe_table, and does a re-probe collide
with the stale ppe0 directory?  Would adding the debugfs teardown to
mtk_ppe_deinit() be appropriate here?

>  	mtk_cleanup(eth);
>  	free_netdev(eth->dummy_dev);
>  	mtk_mdio_cleanup(eth);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916051618.2904439-1-lgs201920130244%40gmail.com

