Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE883D6AAFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWpNEhKxuIUUIH6PFW11SdLLFiwsrOODK1OJRBlsTrY=; b=owkXBL5+L5cB/SLth30+w1mHey
	YqHTA8W/Lza9p8BbSTa6PEvGWTdyZYFC7UTA8KUTJsYRyyLA9f1381kkKM93fdOqmIOCfocHC3Wh7
	c+AzB2S8h6qZybP2wp1MwX9PxPNF2LW7Nd1YL1ZYZwmfrVnPWTVdyaK0LsuwINDISsXBU5+ja5tpz
	E0cVmeE/xNji0KmaweOCKtXXa+3U/pLb4DODjEJzb2YtDsxBxKqXJ352J7WVbcAdbvCgVsibeipHK
	Q9gDIIy/yv+8IeXdWfl7iyLy24UQ2BniRVVfDHlADBNNOsaBQ3cncmWJQCSi1RavZ9gqziZqqu78U
	YXN4Vm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAS-000000011vW-0k20;
	Fri, 03 Apr 2026 01:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAP-000000011t0-35if
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69F254177B;
	Fri,  3 Apr 2026 01:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AECCC116C6;
	Fri,  3 Apr 2026 01:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179065;
	bh=ZWTKc9p3eG4j6Nv/uMVUET78oJCOwONglyv3+fN8tCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFimNamVMzqxmN0xN9klnqc6kbFPNAItX3nfPjExbgcJMsZCOs4yH6lbuykfM+lwn
	 q0w8ig+DYX1TSuT7HxIsUS5qYZaN3wbuYqJs0dAfWcu647ZAVHWL488Q3vqzOWcRjq
	 hAdC2QhMd1qXd97OtQZlXY86KxecxUyIFHDuB4N1J/Lo3MVTtkQEtO2NOgZH6AMha0
	 hdah7NG5ewcpBKpyO50DdBr0gH1n7KhfkyLn1tAvy/HUWj01GgAYCUt70P/acfxnQ/
	 uv5DXZkcQfCxhq+zdblLVD8KLP1hCzIQRdWwJXEB8AxFJn4CMPQ8dNhwM146Exyn0v
	 8lCP0+KFM4XSQ==
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 net-next 12/14] net: dsa: netc: add more basic functions support
Date: Thu,  2 Apr 2026 18:17:43 -0700
Message-ID: <20260403011743.1795726-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-13-wei.fang@nxp.com>
References: <20260331113025.1566878-13-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_181745_830860_75A1FB19 
X-CRM114-Status: GOOD (  30.62  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: dsa: netc: add more basic functions support

This patch expands the NETC switch driver with several foundational
features, including FDB and MDB management, STP state handling, MTU
configuration, port setup/teardown, and host flooding support.

At this stage, the driver operates only in standalone port mode. Each
port uses VLAN 0 as its PVID, meaning ingress frames are internally
assigned VID 0 regardless of whether they arrive tagged or untagged.
Note that this does not inject a VLAN 0 header into the frame, the VID
is used purely for subsequent VLAN processing within the switch.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> +static int netc_add_standalone_vlan_entry(struct netc_switch *priv)
> +{
> +	u32 bitmap_stg = VFT_STG_ID(0) | netc_available_port_bitmap(priv);

Does putting all standalone ports into a single shared VLAN 0 break the DSA
isolation requirements?

If a user manually adds a static FDB entry to a standalone port, it is
programmed into VLAN 0. Because all standalone ports reside in this VLAN, a
frame arriving on one standalone port with a matching destination MAC might
be hardware-switched directly to another standalone port, bypassing the CPU.

[ ... ]

> +static int netc_port_set_fdb_entry(struct netc_port *np,
> +				   const unsigned char *addr, u16 vid)
> +{

[ ... ]

> +	/* If the entry already exists, but not on this port, we need to
> +	 * update the port bitmap. In general, it should only be valid
> +	 * for multicast or broadcast address.
> +	 */
> +	port_bitmap ^= BIT(port);
> +	entry->cfge.port_bitmap = cpu_to_le32(port_bitmap);

Can this XOR operation cause multi-port floods during unicast MAC migrations?

When a unicast MAC address moves to a new port, the bridging layer issues an
ADD for the new port. The XOR operation leaves the old port bit set alongside
the new port bit. Does the driver need to differentiate between unicast and
multicast addresses and explicitly overwrite the bitmap for unicast entries?

[ ... ]

> +static int netc_port_del_fdb_entry(struct netc_port *np,
> +				   const unsigned char *addr, u16 vid)
> +{
> +	struct netc_switch *priv = np->switch_priv;
> +	struct ntmp_user *ntmp = &priv->ntmp;
> +	struct netc_fdb_entry *entry;
> +	int port = np->dp->index;
> +	u32 port_bitmap;
> +	int err = 0;
> +
> +	mutex_lock(&priv->fdbt_lock);
> +
> +	entry = netc_lookup_fdb_entry(priv, addr, vid);
> +	if (unlikely(!entry))
> +		goto unlock_fdbt;

Will this prevent dynamically learned FDB entries from being deleted?

Since the CPU port is configured with MLO_HW, the switch hardware dynamically
learns MAC addresses, but they are not added to the software priv->fdb_list.
If a user attempts to delete a dynamic entry, the software lookup will fail
here and return 0 (success), leaving the stale dynamically learned entry
active in hardware.

[ ... ]

> +static int netc_port_change_mtu(struct dsa_switch *ds,
> +				int port, int mtu)
> +{
> +	u32 max_frame_size = mtu + VLAN_ETH_HLEN + ETH_FCS_LEN;
> +	struct netc_port *np = NETC_PORT(ds, port);
> +
> +	if (dsa_is_cpu_port(ds, port))
> +		max_frame_size += NETC_TAG_MAX_LEN;

Does this double-count the DSA tag overhead for the CPU port?

The DSA core computes the CPU port's MTU by adding the tagger overhead before
calling the switch's .port_change_mtu() function. If the maximum MTU of 9582
bytes is requested, the CPU port receives an MTU of 9596. Adding
NETC_TAG_MAX_LEN again here results in 9628 bytes, which exceeds the
hardware limit of 9600 (NETC_MAX_FRAME_LEN) and might lead to truncation.

[ ... ]

> +static int netc_port_fdb_add(struct dsa_switch *ds, int port,
> +			     const unsigned char *addr, u16 vid,
> +			     struct dsa_db db)
> +{
> +	struct netc_port *np = NETC_PORT(ds, port);
> +
> +	/* Currently, we only support standalone port mode, so all VLANs
> +	 * should be converted to NETC_STANDALONE_PVID.
> +	 */
> +	return netc_port_set_fdb_entry(np, addr, NETC_STANDALONE_PVID);
> +}

Is it safe to silently override user-requested VLAN IDs to VLAN 0?

If a user explicitly attempts to configure a MAC address for a specific VLAN,
the hardware is programmed for VLAN 0 and returns success. Should this
instead check if the requested vid is not 0 and not NETC_STANDALONE_PVID,
and return -EOPNOTSUPP to inform the networking stack?

[ ... ]

> +static void netc_port_set_host_flood(struct dsa_switch *ds, int port,
> +				     bool uc, bool mc)
> +{
> +	struct netc_port *np = NETC_PORT(ds, port);
> +
> +	if (np->uc == uc && np->mc == mc)
> +		return;
> +
> +	/* IPFT does not support in-place updates to the KEYE element,
> +	 * so we need to delete the old IPFT entry and then add a new
> +	 * one.
> +	 */
> +	if (np->host_flood)
> +		netc_port_remove_host_flood(np);
> +
> +	if (netc_port_add_host_flood_rule(np, uc, mc))
> +		dev_err(ds->dev, "Failed to add host flood rule on port %d\n",
> +			port);
> +}

Could this permanently lose the host flood configuration if the new rule
addition fails?

If the call to netc_port_add_host_flood_rule() fails (for example, due to
-ENOMEM), the function logs an error and returns, leaving the port entirely
without a host flood rule. Should the driver revert to the previous
configuration on failure to avoid blackholing traffic meant for the CPU?

