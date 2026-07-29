Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD827C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri/Un0MEVq2R5X4SwViYnsBFp4cF+iTbRU5sEtCszTs=; b=diFpMz3IED1YNIuCA/hlFZyGf+
	B5oh3PU852xkgKiYzw0WmJgMMtr7z6GcZ0STpE8nwoGVECcu9LbfcSm1sKn30uG8nP9JXteWREuc5
	v3hFoT+NtQWUPe/xTBRGqA5hlh5LfeuUvWIM0FyXAhATJHaS732BF878r/Syzo7OuRLrXTIVlvN5T
	IKKdDB8JeyN5aCa93TIdaBITI6CgZPP/211wHc6Un/7WNVfLM78TbV6EaUpZ4EKqqw30nkDZRGow3
	2nPhrpIWMZqezjOJyeuiwySDeDzr57mp+lts36Z5u6HIIpeIlcoZ2LxfKIHhNPNvnhGoTjzYoDfcf
	ygyDAkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Xc-000000089Ik-3w1V;
	Wed, 29 Jul 2026 13:41:48 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4XZ-000000089FI-16kR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:41:46 +0000
Message-ID: <59ecaa4e-f111-4dd4-914a-7704990ac58e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785332500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ri/Un0MEVq2R5X4SwViYnsBFp4cF+iTbRU5sEtCszTs=;
	b=lzZyWuW/4KOletf2OQGRdK5gpRSxzpGcK7PXG6tHx6wV+i5jWAxhyIkDSdw5wYnC9al3YI
	dAxDsynJHSa1alN2L8/flus0x/FSmMml1q26Bai3GR2vQz85cQm8DlV9ZahxWH/sxbFAbD
	Jb3yyIOxY/QzPSPozyRoN0U27mlYuk8=
Date: Wed, 29 Jul 2026 14:41:36 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 6/7] net: dsa: netc: add PTP two-step
 timestamping support
To: wei.fang@oss.nxp.com, richardcochran@gmail.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch,
 olteanv@gmail.com
Cc: wei.fang@nxp.com, chleroy@kernel.org, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-7-wei.fang@oss.nxp.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260728104548.3301214-7-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_064145_524815_EF3F431C 
X-CRM114-Status: GOOD (  22.91  )
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

On 28/07/2026 11:45, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> Add two-step TX timestamping and RX timestamping for the NETC switch.
> One-step TX timestamping is not supported yet.
> 
> For RX, install ingress port filter table (IPFT) rules that redirect PTP
> frames to the CPU port. Support L2, L4 over IPv4 and L4 over IPv6, for
> both event and general messages, selected via the hwtstamp rx_filter.
> The hardware prepends a To_Host subtype 1 tag carrying the 64-bit ingress
> timestamp. The tagger extracts it into the skb control buffer, and
> netc_port_rxtstamp() copies it into skb_hwtstamps().
> 
> For two-step TX, clone the skb and allocate a 4-bit timestamp request ID,
> then queue the clone on a per-port list. netc_xmit() emits a To_Port
> subtype 2 tag carrying that ID. The hardware echoes the ID back in a
> generated To_Host subtype 2 response frame together with the 64-bit
> transmit timestamp. The tagger dispatches the ID and timestamp to the
> switch driver through the twostep_tstamp_handler callback registered in
> netc_tagger_data, which matches the queued clone and completes it via
> skb_complete_tx_timestamp(), then frees the response skb. Non-PTP frames
> keep using the To_Port subtype 0 tag on the xmit fast path.
> 
> The two-step response frame carries no payload; its total length is only
> 26 bytes (12 bytes of DMAC and SMAC plus a 14-byte switch tag). By the
> time netc_rcv() sees it, skb->data already points 2 bytes into the switch
> tag, past the TPID shared with the Ethernet header, so skb->len is only
> 12. Since the tag pointer is at (skb->data - 2), the pskb_may_pull() check
> must use NETC_TAG_MAX_LEN - 2 rather than NETC_TAG_MAX_LEN. Otherwise
> pskb_may_pull() drops the response frame and breaks PTP synchronization.
> 
> Add the To_Port subtype 2 and To_Host subtype 1/2 tag structures, extend
> netc_xmit() to select the tag based on ptp_flag in the skb control buffer,
> and add netc_connect()/netc_disconnect() to manage the per-switch
> netc_tagger_data allocation. Grab the PTP timer's pci_dev in netc_setup()
> so get_ts_info() can report its PHC index, and release it in the teardown
> and error paths.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>   drivers/net/dsa/netc/Kconfig         |   1 +
>   drivers/net/dsa/netc/Makefile        |   3 +-
>   drivers/net/dsa/netc/netc_main.c     |  72 +++++
>   drivers/net/dsa/netc/netc_platform.c |   1 +
>   drivers/net/dsa/netc/netc_ptp.c      | 411 +++++++++++++++++++++++++++
>   drivers/net/dsa/netc/netc_switch.h   |  35 +++
>   include/linux/dsa/tag_netc.h         |  23 ++
>   net/dsa/tag_netc.c                   | 120 +++++++-
>   8 files changed, 658 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/net/dsa/netc/netc_ptp.c

[...]

> +int netc_get_ts_info(struct dsa_switch *ds, int port,
> +		     struct kernel_ethtool_ts_info *info)
> +{
> +	struct netc_switch *priv = ds->priv;
> +
> +	info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
> +				SOF_TIMESTAMPING_RX_SOFTWARE |
> +				SOF_TIMESTAMPING_SOFTWARE;

SOF_TIMESTAMPING_RX_SOFTWARE and SOF_TIMESTAMPING_SOFTWARE are available 
by default, no need to add them.

the code doesn't have skb_tx_timestamp() calls, I wonder how is
SOF_TIMESTAMPING_TX_SOFTWARE implemented?

> +
> +	info->phc_index = netc_get_phc_index(priv);
> +	if (info->phc_index < 0)
> +		return 0;
> +
> +	info->so_timestamping |= SOF_TIMESTAMPING_TX_HARDWARE |
> +				 SOF_TIMESTAMPING_RX_HARDWARE |
> +				 SOF_TIMESTAMPING_RAW_HARDWARE;
> +
> +	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
> +
> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_EVENT) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_EVENT);
> +
> +	return 0;
> +}



