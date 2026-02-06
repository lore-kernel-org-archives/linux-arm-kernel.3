Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A93ECD9BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 02:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLsXHIhJMzWyvWjVOqir1bWTmFDM6qixyIhFSn31c/I=; b=K1ZV4oJasgev7VRWe/iaYWFxDR
	OeMgNg7bcD3x2zg1EzlTrB8HA796A2DCWNUZG4y2moa0fFsXsTPt1w1vjxqNs9RxxJFnTglLgY7Rb
	CP4WJerw5iesdMxuiDjfFoN9Y/Y9mpUS/U816Pjninclo/0pXfaTJeGevQ6SNyWcy5j2zNpLEC78z
	cwgiUO+68y0q2LY1rLg7xq8Oc0OLRY8/71gvdNUPgRprC13ausWd1Mm/2jy4N2WHAmzu1CVtBhs1+
	3GTytbcIdpQYd+Ehg6eSXDAAImUNpZ23WmRQngyxz8rOYz/nLVg1XB+RT8KojTrAQ1l9bgroCPsqR
	Nr6uLKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBYZ-0000000Al21-1Ecl;
	Fri, 06 Feb 2026 02:26:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBYY-0000000Al1e-1S1D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 02:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 565AE60125;
	Fri,  6 Feb 2026 02:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1969DC4CEF7;
	Fri,  6 Feb 2026 02:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770344809;
	bh=dj7PTtngi3WPe/OEqWfgcV5GcRGd74xlx6UV8jRooE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s89TTDhBQh3DUhn7lYc3Il5oI0nr308KatTIFDICQzTReclDHwfKifpl/pSIfnT99
	 7AKB/SOA650VekL9CQ1I/TqPyroex8GpG0LHjTNAahpZJpJz7TNrDsz7iVIlocugI7
	 LHEW0K27MyNPIBx3JOzZrUKkbF6moDqs0IfDSX2m11A7ZedBGEng7ebvuxBcdWdZkS
	 gF5SmyrucpMItU5NnjS8Knvin9x/R0M7Qb5D1gcaZOOgHp9Ib/vBi4kppVI5Hg9ffL
	 unmlBsc7iiKNdodIvkMcfQT1VoVu5+zDFfkcjrO3xYb1DmpMN/0jz1dP9itFTO0H2F
	 AxCT7FHyH0XlQ==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	imx@lists.linux.dev,
	andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	davem@davemloft.net,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	horms@kernel.org,
	festevam@gmail.com,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	pabeni@redhat.com,
	shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wahrenst@gmx.net,
	richardcochran@gmail.com,
	s.hauer@pengutronix.de,
	netdev@vger.kernel.org,
	edumazet@google.com,
	robh@kernel.org
Subject: Re: [net-next,v23,5/7] net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver
Date: Thu,  5 Feb 2026 18:26:45 -0800
Message-ID: <20260206022646.3197202-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204232135.1024665-6-lukasz.majewski@mailbox.org>
References: <20260204232135.1024665-6-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver

This patch provides mtip_switch_tx and mtip_switch_rx functions code for
MTIP L2 switch.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 4c64681602d6..61a624f3df2b 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -246,6 +246,39 @@ struct mtip_port_info *mtip_portinfofifo_read(struct switch_enet_private *fep)
>  	return info;
>  }
>
> +static void mtip_atable_get_entry_port_number(struct switch_enet_private *fep,
> +					      unsigned char *mac_addr, u8 *port)
> +{
> +	int block_index, block_index_end, entry;
> +	u32 mac_addr_lo, mac_addr_hi;
> +	u32 read_lo, read_hi;
> +
> +	mac_addr_lo = (u32)((mac_addr[3] << 24) | (mac_addr[2] << 16) |
> +			    (mac_addr[1] << 8) | mac_addr[0]);
> +	mac_addr_hi = (u32)((mac_addr[5] << 8) | (mac_addr[4]));
> +
> +	block_index = GET_BLOCK_PTR(crc8_calc(mac_addr));
> +	block_index_end = block_index + ATABLE_ENTRY_PER_SLOT;
> +
> +	/* now search all the entries in the selected block */
> +	for (entry = block_index; entry < block_index_end; entry++) {
> +		mtip_read_atable(fep, entry, &read_lo, &read_hi);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Can this create a torn read of the address table entry?

mtip_read_atable() performs two separate readl() operations to read a
64-bit address table entry:

    *read_lo = readl(&atable_base[index].lo);
    *read_hi = readl(&atable_base[index].hi);

If another thread holding fep->learn_lock updates the same entry between
these two reads, the lookup would see an inconsistent state (old low word
with new high word, or vice versa).

Looking at the call chain:

    Thread 1 (no lock):
    mtip_switch_rx()->mtip_atable_get_entry_port_number()->mtip_read_atable()

    Thread 2 (lock held):
    mtip_mgnt_timer()->mtip_atable_dynamicms_learn_migration()->
    mtip_update_atable_dynamic1()->mtip_write_atable()

The race could cause a MAC address lookup to fail or match the wrong entry,
delivering packets to the wrong port.

All other functions that read or write the address table acquire
fep->learn_lock before calling mtip_read_atable() or mtip_write_atable().

Should this function also hold the lock during the lookup loop?

> +		*port = MTIP_PORT_FORWARDING_INIT;
> +
> +		if (read_lo == mac_addr_lo &&
> +		    ((read_hi & 0x0000FFFF) ==
> +		     (mac_addr_hi & 0x0000FFFF))) {
> +			/* found the correct address */
> +			if ((read_hi & (1 << 16)) && (!(read_hi & (1 << 17))))
> +				*port = FIELD_GET(AT_PORT_MASK, read_hi);
> +			break;
> +		}
> +	}
> +
> +	dev_dbg(&fep->pdev->dev, "%s: MAC: %pM PORT: 0x%x\n", __func__,
> +		mac_addr, *port);
> +}

[ ... ]

