Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F8ECFD36C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 04:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjgsji6NIO1AJ+MpLhS7DuVHBfbsnq65z0CtkFjIVAU=; b=dE5tGQQqyo3utyhArgH4qg4Tsl
	7GXFj3nYtUpgbYICrWgVxFNjlt9SKXiE/tus4EYngaXSSXdwM3YEduTTYuWDreGb5IvdgLZkndsvj
	i+P5xvgTeWzhir7RXvk0VVU2rORoitAl46BTbPa3coiag7VKSRshd2E/QnUCayNaVndbnNkKbj9xG
	2XZ4jCe3uidLZCQByiDOduHGYBYXMAVuCRBHGjk9cxrqlsoIXbn73rndW6Hl8GgIrh7hVMB8BrJys
	K3+LF+6ZcGSBsb5n5aX+pNsTag08nNMIm8ZeuTiKzWAeR2Zerj4MvlZXQerYmy5NpyaTILZwf8FGW
	CggdA+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNkH1-0000000CimZ-1PTW;
	Tue, 25 Nov 2025 04:03:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNkGz-0000000Cim9-0cwy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 04:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C179B43F97;
	Tue, 25 Nov 2025 04:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B505EC116B1;
	Tue, 25 Nov 2025 04:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764043404;
	bh=XLBIfGui6Ncp8WpCQDz4sno0DUbqdodDsliQ475QYTQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mTSDPlS0RW6oJGk4Qc0IkYPJzT3rXZ3axSV/X20y7OT7GKAyCg/AbCdQPSC/IdT55
	 HLJNlzncvEaegEXORF1v/86tNZ0WQlIV7MF2RlejCbWOhQJB6YYQfTiV3UIdpGtuKC
	 jAw88fXeTYRn55jjmMOcq7ixy6ncYm+WXUnneI7jJkmarcwM1TQHQuARgm7W68FtuZ
	 yAtb9XCkNsIoZgIKjrzZlSwza0PkYl/T0nQAL88JVVAHm34nGgtg7Wbqee2XBQ9qZ6
	 z1MdaxF4b+aw0yb5QDEfoYNOaY2o+K1CKqqFPyIKxyksCCM9fiZOizH2JMVIGg3kdn
	 bFVKjoN3yY11w==
Date: Mon, 24 Nov 2025 20:03:22 -0800
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
Subject: Re: [PATCH net-next v6 2/3] net: ti: icssm-prueth: Adds switchdev
 support for icssm_prueth driver
Message-ID: <20251124200322.615773bb@kernel.org>
In-Reply-To: <20251124135800.2219431-3-parvathi@couthit.com>
References: <20251124135800.2219431-1-parvathi@couthit.com>
	<20251124135800.2219431-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_200325_214413_5A68E306 
X-CRM114-Status: GOOD (  14.16  )
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

On Mon, 24 Nov 2025 19:25:11 +0530 Parvathi Pudi wrote:
> Subject: [PATCH net-next v6 2/3] net: ti: icssm-prueth: Adds switchdev support for icssm_prueth driver

Adds -> Add

> This patch adds support for offloading the RSTP switch feature to the

s/This patch adds/Add/

imperative mood, please..

> +static void icssm_prueth_sw_fdb_work(struct work_struct *work)
> +{
> +	struct icssm_prueth_sw_fdb_work *fdb_work =
> +		container_of(work, struct icssm_prueth_sw_fdb_work, work);
> +	struct prueth_emac *emac = fdb_work->emac;
> +
> +	rtnl_lock();
> +
> +	/* Interface is not up */
> +	if (!emac->prueth->fdb_tbl)
> +		goto free;
> +
> +	switch (fdb_work->event) {
> +	case FDB_LEARN:
> +		icssm_prueth_sw_insert_fdb_entry(emac, fdb_work->addr, 0);
> +		break;
> +	case FDB_PURGE:
> +		icssm_prueth_sw_do_purge_fdb(emac);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +free:
> +	rtnl_unlock();
> +	kfree(fdb_work);
> +	dev_put(emac->ndev);

please use netdev_put() and a netdev tracker

> +}
> +
> +int icssm_prueth_sw_learn_fdb(struct prueth_emac *emac, u8 *src_mac)
> +{
> +	struct icssm_prueth_sw_fdb_work *fdb_work;
> +
> +	fdb_work = kzalloc(sizeof(*fdb_work), GFP_ATOMIC);
> +	if (WARN_ON(!fdb_work))
> +		return -ENOMEM;
> +
> +	INIT_WORK(&fdb_work->work, icssm_prueth_sw_fdb_work);
> +
> +	fdb_work->event = FDB_LEARN;
> +	fdb_work->emac  = emac;
> +	ether_addr_copy(fdb_work->addr, src_mac);
> +
> +	dev_hold(emac->ndev);

same here.

This significantly helps debugging in case some code leaks a reference.
-- 
pw-bot: cr

