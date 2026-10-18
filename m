Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268C2CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0RBrDfHQYswJR4a7Thh6gsX6kswQM270GGcj7BYWGg=; b=PyvB7QxnVV9/Se7T/9Kz6K6P8I
	E0zWqBqCAqHUm1Hny1s/WH7wBbkQCjPRvhVFhfV2qGh21kh1yiEAqJ+K2ZHIcIezUZ0rC3tda3QhD
	eC1UZFbEiMY9Na9hC/tNIXpt9p0y4+nz6gFSjaI+dTJXq2bSqYHDApMQOChJ4oGrLiNxxr+pXPiKC
	iS425uHOwVvoEp1MZh+UvhmE88h5+ywyo5hf2Qad8eIERVPctRGeKVQPYI8Rfxif959CR7WdHuXrc
	kX8PEde5TmTxSnhdoExCCevDxjwcvfsbcgHazhgisIGhei5oVHLWXybVGArTvZR9Ri3+Cl/pNps1a
	aoHFmDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQqf-00000005tFl-3vYT;
	Sun, 18 Oct 2026 13:22:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQqe-00000005tFT-1E42
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 13:22:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6247260D80;
	Sun, 18 Oct 2026 13:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2EC1F000C4;
	Sun, 18 Oct 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792329767;
	bh=W0RBrDfHQYswJR4a7Thh6gsX6kswQM270GGcj7BYWGg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AKALa8aktSL3RUnE0w7l9ucGi2bN8Ga8flYPZp4CDwjaU69vbdtwTmHjf3NXMKf9C
	 UQSfBb3K/91DKBX9fZI9SMAxfnvzJdgXhTMZrtZc/XwrlJGQMfafnSbEglEOoKyilw
	 kaG/PudIHWsFHEMUrD6R9Gy8BOW+o1nCEX+mkIEhAFnJuD2TyzMcYDKBEbyKMGikiy
	 +oAPNndphc6e9yRSjk9mBpCv7LutB7NBPcORnu3/iYAVj0q70VOZt1aF5kPBCwzSmh
	 R7y0HvUGNE7mYrSw2jZzSzbdbBrSrUlrzNUsAhXD0aowcFA2B/ndPrVJZKYfg+NosQ
	 zZXWcPT2A1rqA==
Subject: Re: [PATCH net 2/2] net: ti: icssg-prueth: re-apply rx_mode state
 after firmware reboot
From: netdev-bot+sashiko@kernel.org
To: r-kumar12@ti.com
Cc: netdev@vger.kernel.org, danishanwar@ti.com, rogerq@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, jacob.e.keller@intel.com,
 m-malladi@ti.com, vadim.fedorenko@linux.dev, haokexin@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 j-rameshbabu@ti.com, aaron.richard@ti.com, l-chinnannavar@ti.com,
 m-santhoshkadavan@ti.com, k-tiwari1@ti.com, a-dev@ti.com, pratheesh@ti.com
Date: Sun, 18 Oct 2026 13:22:45 +0000
Message-ID: <179232976562.3135.6465502761786922552@kernel.org>
In-Reply-To: <20261014125948.230571-3-r-kumar12@ti.com>
References: <20261014125948.230571-3-r-kumar12@ti.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: silent hardware state loss due to rtnl_trylock failure in
  rx_mode_work
- [Medium] prueth_emac_common_start() now queues rx_mode_work for every
  running port before returning success.
- [Medium] The new schedule_work() loop in prueth_emac_common_start()
  lets the opening port's rx_mode_work run while emac_ndo_open() is…

--

net: ti: icssg-prueth: re-apply rx_mode state after firmware reboot

At the end of prueth_emac_common_start(), this commit re-queues
rx_mode_work for every running port. The aim is to re-apply the
IFF_PROMISC/IFF_ALLMULTI flood state after the PRU/RTU/txPRU firmware
reboots. It also cancels the pending work in the stop_pruss error path.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index cd4c918fe2b89..9d38cbbdaf27f 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -311,6 +311,18 @@ static int prueth_emac_common_start(struct prueth *prueth)
>  	if (ret)
>  		goto disable_class;
>  
> +	/* PRU/RTU/txPRU are up now: re-sync any port
> +	 * config (e.g. flood/promisc flags) that may have been
> +	 * dropped while firmware was still rebooting above.
> +	 */
> +	for (slice = 0; slice < PRUETH_NUM_MACS; slice++) {
> +		emac = prueth->emac[slice];
> +		if (!emac)
> +			continue;
> +		if (netif_running(emac->ndev))
> +			schedule_work(&emac->rx_mode_work);
> +	}

[Severity: High]
Does the VLAN multicast part of the re-sync actually happen when the
work is queued from here?

prueth_emac_common_start() is called with rtnl_lock held in both
paths. It is called from emac_ndo_open() via __dev_open(), and from
icssg_change_mode() via the NETDEV_CHANGEUPPER notifier. The caller
still holds rtnl while it runs icss_iep_init() and the rest of
ndo_open or the mode change.

The work queued here will usually run inside that window. The worker
first sends its icssg_set_port_state() commands, which wait for a
firmware ack. In the non-promisc, non-allmulti case,
emac_ndo_set_rx_mode_work() then ends with:

	if (rtnl_trylock()) {
		vlan_for_each(ndev, icssg_update_vlan_mcast, emac);
		rtnl_unlock();
	}

HSR offload mode does the same with prueth->hsr_dev. If the trylock
fails, the vlan_for_each() call is skipped silently. The work does
not requeue itself, and nothing records that the update was skipped.

The firmware restart has just cleared SHRAM, MSMC and the VLAN table.
The per-VLAN multicast entries tracked in emac->vlan_mcast_list are
exactly the state that needs to be reprogrammed.

In the icssg_change_mode() path, this loop is the only thing that
queues rx_mode_work for a port that is already running. For the
opening port, the ndo_set_rx_mode call that __dev_open() makes later
also runs under rtnl. If the trylock loses in these cases, are the
VLAN multicast groups left unprogrammed in the firmware FDB, so that
multicast reception on those VLANs breaks?

The rtnl_trylock() skip existed before this patch. However, the patch
now uses this work as the re-sync mechanism and queues it from
contexts that are known to hold rtnl. That turns the skip from a rare
race into the likely outcome.

Should the worker reschedule itself when rtnl_trylock() fails? Or
could the VLAN multicast re-sync be done directly from the start
path, which already holds rtnl?

[Severity: Medium]
Can the opening port's rx_mode_work now run while emac_ndo_open() is
still sending its own HWQ commands on the same slice?

Before this patch, the work could not run for a port still inside
ndo_open, because __dev_set_rx_mode() requires IFF_UP.

With this loop, take a first open in non-promisc, non-allmulti mode
with pending multicast entries. For example, IPv6 adds 33:33:00:00:00:01
at NETDEV_REGISTER. The work then does:

emac_ndo_set_rx_mode_work()
  __dev_mc_sync()
    icssg_prueth_add_mcast()
      icssg_fdb_lookup()
      icssg_fdb_add_del()

Meanwhile emac_ndo_open() continues with:

	icssg_enable_fw_offload_emac(emac);
	...
	ret = emac_fdb_flow_id_updated(emac);

In switch/HSR mode the first of these sends FDB add commands. The second
always runs. Both paths end up in icssg_send_fdb_msg(), which takes no
lock:

- It pops a command buffer, pushes the command, then polls the response
  queue and takes whichever response comes out first.
- icssg_fdb_lookup() reads its result from the single per-slice
  FDB_CMD_BUFFER in DRAM.
- prueth->icssg_hwcmdseq is incremented non-atomically.

Only icssg_set_port_state() is serialized, by cmd_lock.

With two commands in flight, could the responses get swapped? That
could lead to:

- the seqnum mismatch WARN_ON in emac_fdb_flow_id_updated();
- ndo_open failing because it got another command's status;
- a wrong port_mask written into the FDB/VLAN table from another
  command's lookup data.

The flood commands could also reach the firmware before the RX flow ID
base is configured.

The restart path seems to have a similar window. After
prueth_emac_restart(), icssg_change_mode() calls
icssg_enable_fw_offload(), and the work queued here for both ports may
be running at that point.

> +
>  	emac = prueth->emac[ICSS_SLICE0] ? prueth->emac[ICSS_SLICE0] :
>  	       prueth->emac[ICSS_SLICE1];
>  	ret = icss_iep_init(emac->iep, &prueth_iep_clockops,
> @@ -323,6 +335,11 @@ static int prueth_emac_common_start(struct prueth *prueth)
>  	return 0;
>  
>  stop_pruss:
> +	for (slice = 0; slice < PRUETH_NUM_MACS; slice++) {
> +		emac = prueth->emac[slice];
> +		if (emac)
> +			cancel_work_sync(&emac->rx_mode_work);
> +	}
>  	prueth_emac_stop(prueth);

[Severity: Medium]
The commit message says the cancel is there "so it cannot run after
the cores are stopped again". However, this label is reached only when
icss_iep_init() fails.

Is the newly queued work also cancelled when emac_ndo_open() fails
after prueth_emac_common_start() has already succeeded?

__dev_open() sets __LINK_STATE_START before calling ndo_open. So
netif_running() is already true for the port being opened, and its
rx_mode_work is queued by the loop above.

A later step in emac_ndo_open() can still fail. Examples are
request_threaded_irq() for tx_ts_irq, prueth_create_rxq(),
prueth_create_txq(), or:

	ret = emac_fdb_flow_id_updated(emac);

The error path then ends at:

stop:
	if (!prueth->emacs_initialized)
		prueth_emac_common_stop(prueth);

This shuts down the PRU/RTU/txPRU cores without cancelling
rx_mode_work.

emac_ndo_stop() does call cancel_work_sync(&emac->rx_mode_work) before
prueth_emac_common_stop(). But ndo_stop is not called after a failed
open.

A work item that is still pending or running would then send commands
to halted cores:

- icssg_set_port_state() commands, each timing out with "timeout
  waiting for command done";
- in the non-promisc case, icssg_send_fdb_msg() commands that can poll
  for up to 20 seconds.

The multicast list may also be affected after the failure.
icssg_prueth_add_mcast() always returns 0, so __dev_mc_sync() marks the
addresses as synced.

After a failed open, nothing calls __dev_mc_unsync(). That includes
the stop_pruss path, where cancel_work_sync() cannot undo a sync that
has already completed.

The next successful open clears SHRAM, MSMC and the VLAN table and
reboots the firmware. Its __dev_mc_sync() would then skip the addresses
that are still marked synced.

Could this leave those multicast groups unprogrammed in the firmware
FDB?

Before this patch, the opening port's rx_mode_work could not run during
its own ndo_open, so this problem appears to be new.

>  
>  disable_class:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014125948.230571-1-r-kumar12%40ti.com

