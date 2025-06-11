Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3998CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsD0r2ubczrvxe7E6Hz3oR1VDIOnDQXAzS4kwGFiDY0=; b=2XDn/bjOnYyMy2ZYpXKOLivEot
	9nSxA0ugDTn3abY0vATukw8EUm8/9a5OjXrZtMfjayUW0u8KqQpaK1zhXUaZjJ2XopuAVLszNDP0y
	cf6L29fI2EmE3DD0qadXUoEI7ivmSJj7Px3Gt7gEacPG+jGF9v/mpU/wlWkLnh0qtYt+hmMC4UsXF
	lA5fpUYM5caL1QbMwrvkhZQdIAoFU/1T5Wf1iFiy/NXciMyyBT5OeouykJEHqA7u35K4HznhvF33l
	cBDfe0+M3LwVj7OttgrntR2aKIkwnE/n1V2m0sShCDG9AYya5vWVTni6WDsUV937iKujxA0NxQWiw
	U8juuYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnD-0000000ADO7-2gZB;
	Wed, 11 Jun 2025 14:51:07 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIib-00000009cQF-0IaV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:30:08 +0000
Message-ID: <cdcd54ff-ff67-4ad8-8aa7-baa711928242@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749637792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsD0r2ubczrvxe7E6Hz3oR1VDIOnDQXAzS4kwGFiDY0=;
	b=fRSPguXxdP+bxFKXzw8IXPvBDS7PNhulrJ5AKNaVBxE/HU5Sy8+bASY2d9tYSO8RYqBZ9Y
	OpqAXd/4ejqf/HgKyaGjLGSfkBizkMG/JrEgEFI7RHEL4hePKPX68ihcfBIQpWBtJrwZle
	LX45PMC+xyaBy+CAu+fxUDRdbDXZk9s=
Date: Wed, 11 Jun 2025 11:29:46 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v8 06/11] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ssantosh@kernel.org,
 richardcochran@gmail.com, s.hauer@pengutronix.de, m-karicheri2@ti.com,
 glaroque@baylibre.com, afd@ti.com, saikrishnag@marvell.com,
 m-malladi@ti.com, jacob.e.keller@intel.com, diogo.ivo@siemens.com,
 javier.carrasco.cruz@gmail.com, horms@kernel.org, s-anna@ti.com,
 basharath@couthit.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250610105721.3063503-1-parvathi@couthit.com>
 <20250610123245.3063659-7-parvathi@couthit.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250610123245.3063659-7-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_033007_583754_8B604E25 
X-CRM114-Status: GOOD (  22.48  )
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

On 10/06/2025 13:32, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
> 
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
> 
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
> 
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
> 
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>   drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>   drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  23 +
>   drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>   drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>   .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>   5 files changed, 602 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h

[...]

> @@ -732,9 +949,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
>   		src_addr += actual_pkt_len;
>   	}
>   
> +	if (pkt_info->timestamp) {
> +		src_addr = (void *)PTR_ALIGN((uintptr_t)src_addr,
> +					   ICSS_BLOCK_SIZE);
> +		dst_addr = &ts;
> +		memcpy(dst_addr, src_addr, sizeof(ts));
> +	}
> +
>   	if (!pkt_info->sv_frame) {
>   		skb_put(skb, actual_pkt_len);
>   
> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
> +		    pkt_info->timestamp) {
> +			ssh = skb_hwtstamps(skb);
> +			memset(ssh, 0, sizeof(*ssh));
> +			ssh->hwtstamp = ns_to_ktime(ts);
> +		}
>   		/* send packet up the stack */
>   		skb->protocol = eth_type_trans(skb, ndev);
>   		netif_receive_skb(skb);

Could you please explain why do you need to copy timestamp to a
temporary variable if you won't use it in some cases? I believe these
2 blocks should be placed under the last if condition and simplified a
bit, like

+		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
+		    pkt_info->timestamp) {
+			src_addr = (void*)PTR_ALIGN((uintptr_t)src_addr,
+					   ICSS_BLOCK_SIZE);
+			memcpy(&ts, src_addr, sizeof(ts));
+			ssh = skb_hwtstamps(skb);
+			ssh->hwtstamp = ns_to_ktime(ts);
+		}

This will avoid useless copy when the packet will be dropped anyway, WDYT?

