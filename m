Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3164C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwsNs4rTkCq+1gD7AYy++hzMPwVpqQxCJeslYKSIXTY=; b=m+FTzYV7lFq+FRx6W8ufbtE6W5
	rVA5bAOWGCBiW1zTDA9vb+ft7LuI3LZOu3lvMlFxurq9tEfJU1f7WRHn+bQxKL+RI1TQQF4FAv3Rv
	oOOxwGhI+uOEQdYJGFniwRMZBqhZrji62RBPOCUIp7eQdtjW5zRvWg4hfb67AOceG2Kcr8s+phJ+7
	5aw8nm85AxbxmOe4bJzkn89DvY2484pdAXpm5l0/n8qIWDLs73kOiXUp16YpGsH5mlmGespQm1eqg
	Y47JYu/xvS5aAkw42l92mBNVYjQSCiZcc3IjpTybgH7WHm3s/t2Dg+xeDEwx/xkVj9Ye9T0pQpUAD
	WN/JA2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk680-00000005eO6-3ItI;
	Mon, 17 Feb 2025 18:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk66Y-00000005eA3-12Q3;
	Mon, 17 Feb 2025 18:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EwsNs4rTkCq+1gD7AYy++hzMPwVpqQxCJeslYKSIXTY=; b=QDX1P+ctaBzPfHZ8Sa9jxwJs8L
	JcSMki5tqUx/DA2/nE8aNpazpnrlbUdO7Oozd/YPLGylqFTgK7YcYisKBLboJM5CuPXAxjX9AG7fN
	5OkcnlCnQCXQKGB27w0TtSHJeFF3fo17Ve02FlfBeW6hyNvmw5McT0qEnIpbI9MnaFw7RjnAORosH
	hhv+Lk12e1atry5kVnWnLf+PuYeWMUM9ZER0dDM4n8EkNOSUJbH7l65WRVxu+kqNJVMhNegtUjU5F
	QVBrezmjIsSbPcIJmCk/pYeuxAMbTVXKgW1mDnclVl4GAlnpoLeS6DQfV3/rXvzOsiY/hUVTpVrkR
	400er2XA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk66V-00000001sDf-1NbX;
	Mon, 17 Feb 2025 18:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7513AA40FC9;
	Mon, 17 Feb 2025 18:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBF9C4CED1;
	Mon, 17 Feb 2025 18:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739817863;
	bh=hvJmtOA0hWqdrwewer4IWWSTXNheMWESg95g21xhQrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECO4WBLVH6vcxQaP1em3PQFuRdPLwaJyGRECgte5JxlUQg1SE2w9c4ZETGj9bYn96
	 BTxsCXe7x/dvdDGteIZHJdpiOG7cqvSrAUvROo4x7h//C6W72zLNRrXmpAVGYJSQVd
	 NhuVpbUduXFTY1QwO8PYkH2qLBh+VysqtAdmV5zv09bXnmko1+2PNaJV07deqxLvV2
	 U6vV0ZMgVKT7Hb1K24nZixUabg0/URFZyN+GKFzuHCO7HGHcKYKQhutA6vhjjQzDXj
	 p13Lzp5sAPXkhyZhb5shtiSB5kfHYMB3f6nUIp4nwXYvajhQ4AWQ96vq7kM23OOofk
	 yNsY0nMF/bBSA==
Date: Mon, 17 Feb 2025 18:44:16 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v4 16/16] net: airoha: Introduce PPE debugfs
 support
Message-ID: <20250217184416.GQ1615191@kernel.org>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
 <20250213-airoha-en7581-flowtable-offload-v4-16-b69ca16d74db@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-airoha-en7581-flowtable-offload-v4-16-b69ca16d74db@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_184427_677407_43B6DEA3 
X-CRM114-Status: GOOD (  17.94  )
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

On Thu, Feb 13, 2025 at 04:34:35PM +0100, Lorenzo Bianconi wrote:
> Similar to PPE support for Mediatek devices, introduce PPE debugfs
> in order to dump binded and unbinded flows.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

> diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c

...

> +static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
> +				       bool bind)
> +{
> +	static const char *const ppe_type_str[] = {
> +		[PPE_PKT_TYPE_IPV4_HNAPT] = "IPv4 5T",
> +		[PPE_PKT_TYPE_IPV4_ROUTE] = "IPv4 3T",
> +		[PPE_PKT_TYPE_BRIDGE] = "L2B",
> +		[PPE_PKT_TYPE_IPV4_DSLITE] = "DS-LITE",
> +		[PPE_PKT_TYPE_IPV6_ROUTE_3T] = "IPv6 3T",
> +		[PPE_PKT_TYPE_IPV6_ROUTE_5T] = "IPv6 5T",
> +		[PPE_PKT_TYPE_IPV6_6RD] = "6RD",
> +	};
> +	static const char *const ppe_state_str[] = {
> +		[AIROHA_FOE_STATE_INVALID] = "INV",
> +		[AIROHA_FOE_STATE_UNBIND] = "UNB",
> +		[AIROHA_FOE_STATE_BIND] = "BND",
> +		[AIROHA_FOE_STATE_FIN] = "FIN",
> +	};
> +	struct airoha_ppe *ppe = m->private;
> +	int i;
> +
> +	for (i = 0; i < PPE_NUM_ENTRIES; i++) {
> +		const char *state_str, *type_str = "UNKNOWN";
> +		u16 *src_port = NULL, *dest_port = NULL;
> +		struct airoha_foe_mac_info_common *l2;
> +		unsigned char h_source[ETH_ALEN] = {};
> +		unsigned char h_dest[ETH_ALEN];
> +		struct airoha_foe_entry *hwe;
> +		u32 type, state, ib2, data;
> +		void *src_addr, *dest_addr;
> +		bool ipv6 = false;
> +
> +		hwe = airoha_ppe_foe_get_entry(ppe, i);
> +		if (!hwe)
> +			continue;
> +
> +		state = FIELD_GET(AIROHA_FOE_IB1_STATE, hwe->ib1);
> +		if (!state)
> +			continue;
> +
> +		if (bind && state != AIROHA_FOE_STATE_BIND)
> +			continue;
> +
> +		state_str = ppe_state_str[state % ARRAY_SIZE(ppe_state_str)];
> +		type = FIELD_GET(AIROHA_FOE_IB1_PACKET_TYPE, hwe->ib1);
> +		if (type < ARRAY_SIZE(ppe_type_str) && ppe_type_str[type])
> +			type_str = ppe_type_str[type];
> +
> +		seq_printf(m, "%05x %s %7s", i, state_str, type_str);
> +
> +		switch (type) {
> +		case PPE_PKT_TYPE_IPV4_HNAPT:
> +		case PPE_PKT_TYPE_IPV4_DSLITE:
> +			src_port = &hwe->ipv4.orig_tuple.src_port;
> +			dest_port = &hwe->ipv4.orig_tuple.dest_port;
> +			fallthrough;
> +		case PPE_PKT_TYPE_IPV4_ROUTE:
> +			src_addr = &hwe->ipv4.orig_tuple.src_ip;
> +			dest_addr = &hwe->ipv4.orig_tuple.dest_ip;
> +			break;
> +		case PPE_PKT_TYPE_IPV6_ROUTE_5T:
> +			src_port = &hwe->ipv6.src_port;
> +			dest_port = &hwe->ipv6.dest_port;
> +			fallthrough;
> +		case PPE_PKT_TYPE_IPV6_ROUTE_3T:
> +		case PPE_PKT_TYPE_IPV6_6RD:
> +			src_addr = &hwe->ipv6.src_ip;
> +			dest_addr = &hwe->ipv6.dest_ip;
> +			ipv6 = true;
> +			break;
> +		}

Hi Lorenzo,

Perhaps it can't happen, but if type is not one of the cases handled
by the switch statement above then src_addr and dest_addr will
be used while uninitialised by the call to airoha_debugfs_ppe_print_tuple()
below.

Flagged by Smatch.

> +
> +		seq_puts(m, " orig=");
> +		airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
> +					       src_port, dest_port, ipv6);
> +
> +		switch (type) {
> +		case PPE_PKT_TYPE_IPV4_HNAPT:
> +		case PPE_PKT_TYPE_IPV4_DSLITE:
> +			src_port = &hwe->ipv4.new_tuple.src_port;
> +			dest_port = &hwe->ipv4.new_tuple.dest_port;
> +			fallthrough;
> +		case PPE_PKT_TYPE_IPV4_ROUTE:
> +			src_addr = &hwe->ipv4.new_tuple.src_ip;
> +			dest_addr = &hwe->ipv4.new_tuple.dest_ip;
> +			seq_puts(m, " new=");
> +			airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
> +						       src_port, dest_port,
> +						       ipv6);
> +			break;
> +		}
> +
> +		if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
> +			data = hwe->ipv6.data;
> +			ib2 = hwe->ipv6.ib2;
> +			l2 = &hwe->ipv6.l2;
> +		} else {
> +			data = hwe->ipv4.data;
> +			ib2 = hwe->ipv4.ib2;
> +			l2 = &hwe->ipv4.l2.common;
> +			*((__be16 *)&h_source[4]) =
> +				cpu_to_be16(hwe->ipv4.l2.src_mac_lo);
> +		}
> +
> +		*((__be32 *)h_dest) = cpu_to_be32(l2->dest_mac_hi);
> +		*((__be16 *)&h_dest[4]) = cpu_to_be16(l2->dest_mac_lo);
> +		*((__be32 *)h_source) = cpu_to_be32(l2->src_mac_hi);
> +
> +		seq_printf(m, " eth=%pM->%pM etype=%04x data=%08x"
> +			      " vlan=%d,%d ib1=%08x ib2=%08x\n",
> +			   h_source, h_dest, l2->etype, data,
> +			   l2->vlan1, l2->vlan2, hwe->ib1, ib2);
> +	}
> +
> +	return 0;
> +}

...

