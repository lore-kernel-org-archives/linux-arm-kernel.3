Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2EACCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxnfDRKN9o/tjcf4e+ZHTtKwkTd93J07pUeKthYb3wQ=; b=DnAA5b5XWoH1kLJMmYQCZockk5
	+5mw2oQlsk8gNcGVfEiFP9wMe8B+HXsc2HNz4wrIjaLOmerq50F+l0/n+lmvtWKMheQMNfcuwOtrq
	mx0M3moKHUxHdUN+lAz/b9jOTNGAlPknWOHLJ6rdjYIptGREkyzU49c2qpSL0c3G/dcpwjbWf9FUN
	dKwVSRQg8IYkD6lNjp+Kamgc27fDMS0jkRTYe2q9HpvtX/ALTyiR23jLVWr7xmFJMC/sGwWcwdgci
	CCYSJS3vA2OISpAk04sMvDqGUyfvP+XFwYMP46HsRFCw13HFGLcPyWjP2HS+ai7MWyYJCQ85P5zxo
	ZQ8EiONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n29-0000000HV06-3kFC;
	Tue, 14 Oct 2025 21:58:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n27-0000000HUzk-1x1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 21:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XxnfDRKN9o/tjcf4e+ZHTtKwkTd93J07pUeKthYb3wQ=; b=T7hq7VxWOOfvkWkFQtmY0Wi8lC
	7cGsW2sWrEp7Besg9hJxrhHAmHGlNPU7c8OdSAPZ7WIOBSfsT6ywKvyJWn2JEpBCnOj+J+8OFIUhT
	T7RQnD/y1wjhUC7/IPOXi7IFJGczARkhsurkAGgFagHvjaRakqbZWLil8b9GKZbkSYH8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8n1w-00AxMX-4b; Tue, 14 Oct 2025 23:58:04 +0200
Date: Tue, 14 Oct 2025 23:58:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
	prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
	rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next v3 1/3] net: ti: icssm-prueth: Adds helper
 functions to configure and maintain FDB
Message-ID: <ff651c3d-108b-48f8-b69b-fb0b522edd4e@lunn.ch>
References: <20251014124018.1596900-1-parvathi@couthit.com>
 <20251014124018.1596900-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014124018.1596900-2-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_145815_528499_296B339F 
X-CRM114-Status: GOOD (  24.59  )
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

> +void icssm_prueth_sw_fdb_tbl_init(struct prueth *prueth)
> +{
> +	struct fdb_tbl *t = prueth->fdb_tbl;
> +
> +	t->index_a = (struct fdb_index_array_t *)((__force const void *)
> +			prueth->mem[V2_1_FDB_TBL_LOC].va +
> +			V2_1_FDB_TBL_OFFSET);

We have

> +#define V2_1_FDB_TBL_LOC          PRUETH_MEM_SHARED_RAM

and existing code like:

void __iomem *sram_base = prueth->mem[PRUETH_MEM_SHARED_RAM].va;

so it seems like

t->index_a = sram_base + V2_1_FDB_TBL_OFFSET;

with no needs for any casts, since sram_base is a void * so can be
assigned to any pointer type.

And there are lots of cascading defines like:

/* 4 queue descriptors for port 0 (host receive). 32 bytes */
#define HOST_QUEUE_DESC_OFFSET          (HOST_QUEUE_SIZE_ADDR + 16)

/* table offset for queue size:
 * 3 ports * 4 Queues * 1 byte offset = 12 bytes
 */
#define HOST_QUEUE_SIZE_ADDR            (HOST_QUEUE_OFFSET_ADDR + 8)
/* table offset for queue:
 * 4 Queues * 2 byte offset = 8 bytes
 */
#define HOST_QUEUE_OFFSET_ADDR          (HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR + 8)
/* table offset for Host queue descriptors:
 * 1 ports * 4 Queues * 2 byte offset = 8 bytes
 */
#define HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR       (HOST_Q4_RX_CONTEXT_OFFSET + 8)

allowing code like:

	sram = sram_base + HOST_QUEUE_SIZE_ADDR;
	sram = sram_base + HOST_Q1_RX_CONTEXT_OFFSET;
	sram = sram_base + HOST_QUEUE_OFFSET_ADDR;
	sram = sram_base + HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR;
	sram = sram_base + HOST_QUEUE_DESC_OFFSET;

> +	t->mac_tbl_a = (struct fdb_mac_tbl_array_t *)((__force const void *)
> +			t->index_a + FDB_INDEX_TBL_MAX_ENTRIES *
> +			sizeof(struct fdb_index_tbl_entry_t));

So i think this could follow the same pattern, also allowing some of
these casts to be removed.

I just don't like casts, they suggest bad design.

> +static u8 icssm_pru_lock_done(struct fdb_tbl *fdb_tbl)
> +{
> +	return readb((u8 __iomem *)&fdb_tbl->locks->pru_locks);

And maybe the __iomem attribute can be added to struct, either per
member, or at the top level? It is all iomem, so we want sparse to be
able to check all accesses.

> +static int icssm_prueth_sw_fdb_spin_lock(struct fdb_tbl *fdb_tbl)
> +{
> +	u8 done;
> +	int ret;
> +
> +	/* Take the host lock */
> +	writeb(1, (u8 __iomem *)&fdb_tbl->locks->host_lock);
> +
> +	/* Wait for the PRUs to release their locks */
> +	ret = read_poll_timeout(icssm_pru_lock_done, done, done == 0,
> +				1, 10, false, fdb_tbl);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	return 0;

Documentation says:

 * Returns: 0 on success and -ETIMEDOUT upon a timeout.

So no need for the if statement.


> +static s16
> +icssm_prueth_sw_fdb_search(struct fdb_mac_tbl_array_t *mac_tbl,
> +			   struct fdb_index_tbl_entry_t *bucket_info,
> +			   const u8 *mac)
> +{
> +	u8 mac_tbl_idx = bucket_info->bucket_idx;
> +	int i;
> +
> +	for (i = 0; i < bucket_info->bucket_entries; i++, mac_tbl_idx++) {
> +		if (ether_addr_equal(mac,
> +				     mac_tbl->mac_tbl_entry[mac_tbl_idx].mac))
> +			return mac_tbl_idx;
> +	}
> +
> +	return -ENODATA;

It is traditional to return errno in an int. But i don't see why a s16
cannot be used.

> +icssm_prueth_sw_fdb_find_bucket_insert_point(struct fdb_tbl *fdb,
> +					     struct fdb_index_tbl_entry_t
> +					     *bkt_info,
> +					     const u8 *mac, const u8 port)
> +{
> +	struct fdb_mac_tbl_array_t *mac_tbl = fdb->mac_tbl_a;
> +	struct fdb_mac_tbl_entry_t *e;
> +	u8 mac_tbl_idx;
> +	int i, ret;
> +	s8 cmp;
> +
> +	mac_tbl_idx = bkt_info->bucket_idx;
> +
> +	for (i = 0; i < bkt_info->bucket_entries; i++, mac_tbl_idx++) {
> +		e = &mac_tbl->mac_tbl_entry[mac_tbl_idx];
> +		cmp = memcmp(mac, e->mac, ETH_ALEN);
> +		if (cmp < 0) {
> +			return mac_tbl_idx;
> +		} else if (cmp == 0) {
> +			if (e->port != port) {
> +				/* MAC is already in FDB, only port is
> +				 * different. So just update the port.
> +				 * Note: total_entries and bucket_entries
> +				 * remain the same.
> +				 */
> +				ret = icssm_prueth_sw_fdb_spin_lock(fdb);
> +				if (ret) {
> +					pr_err("PRU lock timeout\n");
> +					return -ETIMEDOUT;
> +				}

icssm_prueth_sw_fdb_spin_lock() returns an errno. Don't replace it.

Also, pr_err() is bad practice and probably checkpatch is telling you
this. Ideally you want to indicate which device has an error, so you
should be using dev_err(), or maybe netdev_err().

> +	if (left > 0) {
> +		hash_prev =
> +			icssm_prueth_sw_fdb_hash
> +			(FDB_MAC_TBL_ENTRY(left - 1)->mac);
> +	}

> +		empty_slot_idx =
> +			icssm_prueth_sw_fdb_check_empty_slot_right(mt, mti);

There are a couple of odd indentations like this. I wounder if it
makes sense to shorten the prefix? Do you really need all of
icssm_prueth_sw_fdb_ ?

	Andrew

