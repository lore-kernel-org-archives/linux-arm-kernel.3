Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A26ED116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDJewGiFdBgZdBJlRIzEbFkuxn5iTLauyRjo7rbEnes=; b=O4xdRb1V8UrSsguVxrtK0GgYJO
	ohfc13yt99BxA9OBHdvIJOuKnHgBO+z7CF1b7llC7+TM1F9/iJYsDPf++POuIyPP7+XmeeSZuZ9FQ
	UOEUCgiyorHtcl38gVy7bQbVIJ3v+d3PqJOoFRuuy74M1WJ5IR6oU40H4J75ikcwlt/fjeIs5XJpi
	qW8tOvNTOZ48fgySaMywBuwr9PWwXwJYFhqA2yMayKhSObjcMCpQ18gOTOhn6rrx5cNhrvM3x+IkD
	muH6y9+qQLHs5J/lCPQZwykx5XWzzydlhjJxG9lAbodOwMSSsI9rbEooREprV/VT/3W4Ia8HgieZ9
	Q4NmBabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQCCJ-00000004a9C-1HHC;
	Mon, 01 Dec 2025 22:16:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQCCG-00000004a8s-3TSl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 22:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BA5E40A02;
	Mon,  1 Dec 2025 22:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FB7C4CEF1;
	Mon,  1 Dec 2025 22:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764627400;
	bh=Y5DXQhCcAA3uAQApHosfzKwCVgNUTGcLBLCzMK7rFYA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cJN+CSLUNy5QDd3ER0bYvT9C4PV9ONNGYQdGGYyw/enTuSyOCUuL0O7Wfn9//CzT/
	 S3AzLMoK6HNzctpwqjHUAF8s08ygOjp4mSX0djPyeksLZQk+9nEWc751ScWHs6IMDi
	 d0/af/j1V0rBjo7QrPcQgV9c4cngItV5N2ekWOQ8N8j49Bg+0WlGTG7IF3mTFn0QSl
	 FeC3CleOEhgQhkdhPTa6eIN+W8TL2nsIRZnFXLO1yNdE6s/7wT9QwXypo218/2+C4G
	 erfzPuny75bfKIxfb38hiCt/f+oyFrpKIWD5Wcfu8DV3K5DzShAH2CETeEgn1ytiZ+
	 klW1xo8xUXiUA==
Date: Mon, 1 Dec 2025 14:16:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 pmohan@couthit.com, basharath@couthit.com, afd@ti.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
 horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
 mohan@couthit.com
Subject: Re: [PATCH net-next v8 2/3] net: ti: icssm-prueth: Add switchdev
 support for icssm_prueth driver
Message-ID: <20251201141638.00a986dd@kernel.org>
In-Reply-To: <20251126163056.2697668-3-parvathi@couthit.com>
References: <20251126163056.2697668-1-parvathi@couthit.com>
	<20251126163056.2697668-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_141640_911835_4921ADC9 
X-CRM114-Status: GOOD (  11.74  )
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

On Wed, 26 Nov 2025 21:57:13 +0530 Parvathi Pudi wrote:
> + */
> +static void icssm_prueth_sw_switchdev_event_work(struct work_struct *work)
> +{
> +	struct icssm_prueth_sw_switchdev_event_work *switchdev_work =
> +		container_of(work,
> +			     struct icssm_prueth_sw_switchdev_event_work, work);

Consider using shorter type names.

> +	struct prueth_emac *emac = switchdev_work->emac;
> +	struct switchdev_notifier_fdb_info *fdb;
> +	struct prueth *prueth = emac->prueth;
> +	int port = emac->port_id;
> +
> +	rtnl_lock();
> +
> +	/* Interface is not up */
> +	if (!emac->prueth->fdb_tbl) {
> +		rtnl_unlock();

Are you not leaking the device reference here?

> +		return;
> +	}
> +
> +	switch (switchdev_work->event) {
> +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> +		fdb = &switchdev_work->fdb_info;
> +		dev_dbg(prueth->dev,
> +			"prueth fdb add: MACID = %pM vid = %u flags = %u -- port %d\n",
> +			fdb->addr, fdb->vid, fdb->added_by_user, port);
> +
> +		if (!fdb->added_by_user)
> +			break;
> +
> +		if (fdb->is_local)
> +			break;
> +
> +		icssm_prueth_sw_fdb_add(emac, fdb);
> +		icssm_prueth_sw_fdb_offload_notify(emac->ndev, fdb);
> +		break;
> +	case SWITCHDEV_FDB_DEL_TO_DEVICE:
> +		fdb = &switchdev_work->fdb_info;
> +		dev_dbg(prueth->dev,
> +			"prueth fdb del: MACID = %pM vid = %u flags = %u -- port %d\n",
> +			fdb->addr, fdb->vid, fdb->added_by_user, port);
> +
> +		if (fdb->is_local)
> +			break;
> +
> +		icssm_prueth_sw_fdb_del(emac, fdb);
> +		break;
> +	default:
> +		break;
> +	}
> +	rtnl_unlock();
> +
> +	netdev_put(emac->ndev, &switchdev_work->ndev_tracker);
> +	kfree(switchdev_work->fdb_info.addr);
> +	kfree(switchdev_work);
-- 
pw-bot: cr

