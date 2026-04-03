Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58DED6AAFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHN35TomyIfPRPkIHCYjF92GnIolLjpfIctUwiX3YtU=; b=MXA6cRkaPrwjLngSKMn+RoO0cP
	LbElGzts8JMiMcIdkmiC7qeq7ZnTS/SU9/ZSyo6i+6W18ondF0+qkD9jG5kX0RZ6/OM0ItTE2+QhO
	feStnZHyVuOM9fT5GHlScC+2Z/3cd3hfam21d8MDwq0Pa/ocp5UgpL5Bl+pGInxHdfBgd2ULIPJrq
	+steCK9ypfGusF+p4caSfUB3lw9htLD1eY0EqVZpPWSuJILcSgaeJ07arZQfATGBR9FV+eSyjGlwz
	VRT9EZnJtaLX2j7GhbuVaF82aputFkBSDzyVSXWWvvcwSBP0ywNftvQhg9HwTnz1L5Tw0pXRxIJo5
	2sYs5kZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAU-000000011zC-2O3q;
	Fri, 03 Apr 2026 01:17:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAS-000000011vF-0x2t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCCBE44017;
	Fri,  3 Apr 2026 01:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7FAC2BCB0;
	Fri,  3 Apr 2026 01:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179067;
	bh=Rg13dO41JuHb3wyGXv+CMSlZCAw+nSPFyVhUygIx8Ks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NBRbUbgk+bgMpenm2PErPtlkiQ/rZme/dpiQyoIhg3+DqVf0+OSNzpbAxKMpXCC3p
	 ZrxFUhlyAI22ZzXD8J8+n1t8F6Yq8ePqyxvLAqCn9ZangWFa4SWSiaBnPZqDyT/xJr
	 NhiwEFrprH+XoPogoimKWIoo1LmRXzS/fu8x/bwhO5F99a7XKsYWsyf+CIbF5wa8sF
	 Hylqd+NfeB0bEMnAmxTXmOlAvWbAWyoKvR4XA4Y2CoO3CrY8Ym38vHHYzVVw0nyJ8N
	 0GVmzGLC5p458zzb7GGrHVUANijvaFvFuXjUqqTqgZmlIFsk0u+lUUveqv+OMXpRuT
	 3Ji4GDB7LngOg==
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
Subject: Re: [PATCH v4 net-next 13/14] net: dsa: netc: initialize buffer bool table and implement flow-control
Date: Thu,  2 Apr 2026 18:17:45 -0700
Message-ID: <20260403011745.1795759-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-14-wei.fang@nxp.com>
References: <20260331113025.1566878-14-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_181748_336499_EB550BE5 
X-CRM114-Status: GOOD (  18.18  )
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
net: dsa: netc: initialize buffer bool table and implement flow-control

This commit adds buffer pool initialization and flow control support for the
NXP netc switch. It maps frame priorities to specific buffer pools and
configures transmission pause thresholds.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> index 3609d83ac363..688dceb486c2 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -386,6 +388,15 @@ static void netc_port_fixed_config(struct netc_port *np)
>  	/* Enable L2 and L3 DOS */
>  	netc_port_rmw(np, NETC_PCR, PCR_L2DOSE | PCR_L3DOSE,
>  		      PCR_L2DOSE | PCR_L3DOSE);
> +
> +	/* Set the quanta value of TX PAUSE frame */
> +	netc_mac_port_wr(np, NETC_PM_PAUSE_QUANTA(0), pqnt);
> +
> +	/* When a quanta timer counts down and reaches this value,
> +	 * the MAC sends a refresh PAUSE frame with the programmed
> +	 * full quanta value if a pause condition still exists.
> +	 */
> +	netc_mac_port_wr(np, NETC_PM_PAUSE_TRHESH(0), qth);

This isn't a bug, but there's a typo in the macro name (TRHESH instead of
THRESH).

[ ... ]
> +static u32 netc_get_buffer_pool_num(struct netc_switch *priv)
> +{
> +	/* The BPCAPR register is a read only register, the hardware
> +	 * guarantees that the BPCAPR_NUM_BP field will not be 0.
> +	 */
> +	return netc_base_rd(&priv->regs, NETC_BPCAPR) & BPCAPR_NUM_BP;
> +}
[ ... ]
> +static void netc_ipv_to_buffer_pool_mapping(struct netc_switch *priv)
> +{
> +	int bp_per_port = priv->num_bp / priv->info->num_ports;
> +	int q = NETC_IPV_NUM / bp_per_port;
> +	int r = NETC_IPV_NUM % bp_per_port;

If the hardware register read in netc_get_buffer_pool_num() returns a value
smaller than priv->info->num_ports (for instance, during a bus error or
reset state), bp_per_port will evaluate to 0.

Can this lead to a division by zero panic here?

Should priv->num_bp be validated against the number of ports before
performing this calculation to ensure the driver fails gracefully if the
hardware returns an unexpected value?

[ ... ]
> diff --git a/drivers/net/dsa/netc/netc_switch_hw.h b/drivers/net/dsa/netc/netc_switch_hw.h
> index c6a0c0a8ff8a..1e1c0d279a21 100644
> --- a/drivers/net/dsa/netc/netc_switch_hw.h
> +++ b/drivers/net/dsa/netc/netc_switch_hw.h
[ ... ]
> @@ -145,6 +152,12 @@ enum netc_stg_stage {
>  #define NETC_PM_IEVENT(a)		(0x1040 + (a) * 0x400)
>  #define  PM_IEVENT_RX_EMPTY		BIT(6)
>  
> +#define NETC_PM_PAUSE_QUANTA(a)		(0x1054 + (a) * 0x400)
> +#define  PAUSE_QUANTA_PQNT		GENMASK(15, 0)
> +
> +#define NETC_PM_PAUSE_TRHESH(a)		(0x1064 + (a) * 0x400)
> +#define  PAUSE_TRHESH_QTH		GENMASK(15, 0)

This isn't a bug, but there's a typo in the macro names here as well
(TRHESH instead of THRESH).

