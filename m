Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545B0EA8109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWvUhRqt1hN18rXGP932XQa3bmQweHVVpefpm4V28X0=; b=F7f/U4EvMNx82brPJZ58xodCyB
	b4WfXRzjAB5GprpQPC+ui/JJ8lzlqruXmNbWQ4q1gKVBMZaPHxqktr5caukl1/a2qzNHZY1/neUpx
	xunV+PRQp4ncj41nn2LHgwRJkJLxj6+LfoHssdbDwXy0rKyBpcNp0kUY/2Lm0pED2I6YPoKBjYBSJ
	ywI2mI+gFkNFPeKE65fN0xsoyBuPBtZ3FS0JnOoKXcUyJmtu32Da08KuzyYLmWWqTQ0EHwU5fyQWA
	pNkUKCuWfnrlUmlk7ID0mX1AE9dx4S51Yvspy89NelyDtNd2Cq91zZufueOUHx6ep5ee2dykYqgeL
	2spDy1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmmB-0000000Gw0P-3K86;
	Tue, 10 Feb 2026 12:23:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmm8-0000000GvzX-17Dk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 12:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770726205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWvUhRqt1hN18rXGP932XQa3bmQweHVVpefpm4V28X0=;
	b=aqAKfLzX1zzHnLbN2H4e8//+ama2KNMvoXxj4k0WNKfx0o+kPxQF16wC9U+aoJhbM9c38H
	M6U+qIMRXa6GNBoxUnY/mD36Hw14pIF03wSDj18Y8oNo53EI29Tk/MNBbnnQaNTV23K9qX
	OXVgv4CGAq+2E4oDvsu9lOM+FwDDu9o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-OsdPLmcGNzCSDwgja8J2SA-1; Tue, 10 Feb 2026 07:23:21 -0500
X-MC-Unique: OsdPLmcGNzCSDwgja8J2SA-1
X-Mimecast-MFC-AGG-ID: OsdPLmcGNzCSDwgja8J2SA_1770726200
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so32489015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 04:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726200; x=1771331000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWvUhRqt1hN18rXGP932XQa3bmQweHVVpefpm4V28X0=;
        b=Nyj2biD4bGj1qsImWTYH6rsK3mSvuCfgCf9QSAlT6UELvV+eU5wP2aFrhE3zYhsfNk
         kSxTbeFWddOPenYpS2O6F4XaXhkL60iYDN5+VBgzfzb5lobR7Wh24wxGeCsiCxow77OL
         adByxlcDfoFM8HO1JLqeLcO7g4Rx+vs464nBs5chywuf/nau76tEJtH2DmWcHZF0HhUW
         OMSvNNsqJDSkUoNaRaREZ6oA3VDoEKx7eEjvSEMz7DNaEZNkf+pw1WnW1JOm/FoDFK9V
         Nk2BfVMYfNutB0yWtA9el6PKIYpE0pNtGyBi5qkuhto1ZBIvchugTG0xgS/qbtQW2gXA
         VjtA==
X-Gm-Message-State: AOJu0Yxj2cE7ifqX1cscaMn9fnYrfBNv0uedvJrQO2/cMXe9lftZzxbZ
	zoq6q/9iH513an6ltqN1ULVDCT3kvcKUNY04jvZnFQbxV9m7RTGotVmBU8uJLeVjSvFxp/z/Ecq
	QsIWR5xDsI2mEfLLu8ohDDGWnIWsYPaADRru83Z3tbA75ChQgx0uvMYxQIzFK81cVKyp/hxOq63
	JDT4Ie3wTZ
X-Gm-Gg: AZuq6aJ86Zet39zWv6g6SpyusA/LumXtnlDPszIEMFZeLyOBYVnGUTG8sD6digrEHCS
	HcluiOiOr5UXk1Rn+ifHTBn52r5ZhqrDhq+uu6WQGEWh3Rs747R1Z5Glb/kfFtiIER+sTBCaQJ0
	MH11nI36KfLJMeHMztlwgWWpIsICZ/0DsLxDRu9ALIIre+A42IQ3slGlOxaHocEbPN1vQ7kuwsg
	osuWH06psylckZgk3WWQHs7nRWGq7NYspSW87F5xGS3C3BkgAthIzUnkRXCKNj4+Qr0N8R0bszb
	Xchv1QxRP6bwf5A+31hJcKGA8oul/QyAouT7SFzbMNQEMuRoEqo8Z3lOTpCeHN7VU88OMe4pgA+
	iWrLbhS636RDlqBA2+xQUCqo=
X-Received: by 2002:a05:600c:3487:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483507cff88mr28917855e9.3.1770726199933;
        Tue, 10 Feb 2026 04:23:19 -0800 (PST)
X-Received: by 2002:a05:600c:3487:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483507cff88mr28917395e9.3.1770726199404;
        Tue, 10 Feb 2026 04:23:19 -0800 (PST)
Received: from [192.168.88.32] ([150.228.25.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm120865445e9.11.2026.02.10.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 04:23:18 -0800 (PST)
Message-ID: <2b7263db-ac5e-4eda-a599-2535242be24a@redhat.com>
Date: Tue, 10 Feb 2026 13:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/2] net: ti: icssg-prueth: Add Frame
 Preemption MAC Merge support
To: Meghana Malladi <m-malladi@ti.com>, vadim.fedorenko@linux.dev,
 jacob.e.keller@intel.com, horms@kernel.org, basharath@couthit.com,
 parvathi@couthit.com, afd@ti.com, vladimir.oltean@nxp.com,
 rogerq@kernel.org, danishanwar@ti.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20260205184747.2451816-1-m-malladi@ti.com>
 <20260205184747.2451816-2-m-malladi@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260205184747.2451816-2-m-malladi@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aXCpiHnyuafECCITST1yw8Y4CWjvdvWag22327sphwE_1770726200
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_042328_461252_A261D030 
X-CRM114-Status: GOOD (  40.77  )
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

On 2/5/26 7:47 PM, Meghana Malladi wrote:
> From: MD Danish Anwar <danishanwar@ti.com>
> 
> This patch introduces qos support for the icssg driver. This
> includes adding support to configure mqprio qdisc and IET FPE.
> By default all the queues are marked as express which can be
> overwritten by the mqprio tc mask passed by tc qdisc.
> 
> icssg_config_ietfpe() work thread takes care of configuring
> IET FPE in the firmware and triggering the verify state machine
> based on the MAC Merge sublayer parameters set by the ethtool.
> The firmware handles the cleanup after successful mac verification.
> And in case the remote peer fails to respond to verify command
> before the timeout (5secs), then FPE is disabled by firmware.
> 
> During link up/down, verify state machine gets triggered again
> based on the state of fpe_enabled and fpe_active.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> v3-v1:
> - Move icssg_qos_link_up/down() to if-statement right above as suggested by
> Vadim Fedorenko <vadim.fedorenko@linux.dev>
> - Fix p_mqprio dereference without initialization as flagged by Simon Horman <horms@kernel.org>
> - Following changes as suggested by Vladimir Oltean <vladimir.oltean@nxp.com>:
> * Provide more detailed commit message
> * Fix the ordering of the functions to avoid forward declarations
> * Fix the bug w.r.t scheduling work: fpe_config_task without initialising it
> * Fix the logic for icssg_iet_set_preempt_mask() - configure the queues based on user requests only.
> * Remove prueth_mqprio_validate() as this duplicates what "caps->validate_queue_counts = true" does.
> * Remove clearing PRE_EMPTION_ENABLE_TX on failure which is irrelevant - ACTIVE status never transitions to true.
> * Fix handling of these flags: iet->configured<->iet->fpe_enabled and iet->fpe_enabled<->iet->fpe_active
> * Schedule asynchronous work without waiting for any timeout
> * Remove cancel_fpe_config argument from prueth_qos_iet structure - no reader
> * Remove mentioning "priv flags" in the comments for prueth_qos_iet struct
> 
>  drivers/net/ethernet/ti/Makefile             |   2 +-
>  drivers/net/ethernet/ti/icssg/icssg_config.h |   9 -
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c |   5 +
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
>  drivers/net/ethernet/ti/icssg/icssg_qos.c    | 216 +++++++++++++++++++
>  drivers/net/ethernet/ti/icssg/icssg_qos.h    |  58 +++++
>  6 files changed, 282 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
>  create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h
> 
> diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
> index 6da50f4b7c2e..6893baf47d46 100644
> --- a/drivers/net/ethernet/ti/Makefile
> +++ b/drivers/net/ethernet/ti/Makefile
> @@ -35,7 +35,7 @@ ti-am65-cpsw-nuss-$(CONFIG_TI_K3_AM65_CPSW_SWITCHDEV) += am65-cpsw-switchdev.o
>  obj-$(CONFIG_TI_K3_AM65_CPTS) += am65-cpts.o
>  
>  obj-$(CONFIG_TI_ICSSG_PRUETH) += icssg-prueth.o icssg.o
> -icssg-prueth-y := icssg/icssg_prueth.o icssg/icssg_switchdev.o
> +icssg-prueth-y := icssg/icssg_prueth.o icssg/icssg_switchdev.o icssg/icssg_qos.o
>  
>  obj-$(CONFIG_TI_ICSSG_PRUETH_SR1) += icssg-prueth-sr1.o icssg.o
>  icssg-prueth-sr1-y := icssg/icssg_prueth_sr1.o
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.h b/drivers/net/ethernet/ti/icssg/icssg_config.h
> index 60d69744ffae..1ac202f855ed 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_config.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_config.h
> @@ -323,13 +323,4 @@ struct prueth_fdb_slot {
>  	u8 fid;
>  	u8 fid_c2;
>  } __packed;
> -
> -enum icssg_ietfpe_verify_states {
> -	ICSSG_IETFPE_STATE_UNKNOWN = 0,
> -	ICSSG_IETFPE_STATE_INITIAL,
> -	ICSSG_IETFPE_STATE_VERIFYING,
> -	ICSSG_IETFPE_STATE_SUCCEEDED,
> -	ICSSG_IETFPE_STATE_FAILED,
> -	ICSSG_IETFPE_STATE_DISABLED
> -};
>  #endif /* __NET_TI_ICSSG_CONFIG_H */
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index f65041662173..1e4bc5fd636e 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -374,9 +374,11 @@ static void emac_adjust_link(struct net_device *ndev)
>  			spin_unlock_irqrestore(&emac->lock, flags);
>  			icssg_config_set_speed(emac);
>  			icssg_set_port_state(emac, ICSSG_EMAC_PORT_FORWARD);
> +			icssg_qos_link_up(ndev);
>  
>  		} else {
>  			icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
> +			icssg_qos_link_down(ndev);
>  		}
>  	}
>  
> @@ -967,6 +969,8 @@ static int emac_ndo_open(struct net_device *ndev)
>  	if (ret)
>  		goto destroy_rxq;
>  
> +	icssg_qos_init(ndev);
> +
>  	/* start PHY */
>  	phy_start(ndev->phydev);
>  
> @@ -1421,6 +1425,7 @@ static const struct net_device_ops emac_netdev_ops = {
>  	.ndo_hwtstamp_get = icssg_ndo_get_ts_config,
>  	.ndo_hwtstamp_set = icssg_ndo_set_ts_config,
>  	.ndo_xsk_wakeup = prueth_xsk_wakeup,
> +	.ndo_setup_tc = icssg_qos_ndo_setup_tc,
>  };
>  
>  static int prueth_netdev_init(struct prueth *prueth,
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> index 10eadd356650..7a586038adf8 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -44,6 +44,7 @@
>  #include "icssg_config.h"
>  #include "icss_iep.h"
>  #include "icssg_switch_map.h"
> +#include "icssg_qos.h"
>  
>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
>  #define PRUETH_MIN_PKT_SIZE     (VLAN_ETH_ZLEN)
> @@ -255,6 +256,7 @@ struct prueth_emac {
>  	struct bpf_prog *xdp_prog;
>  	struct xdp_attachment_info xdpi;
>  	int xsk_qid;
> +	struct prueth_qos qos;
>  };
>  
>  /* The buf includes headroom compatible with both skb and xdpf */
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.c b/drivers/net/ethernet/ti/icssg/icssg_qos.c
> new file mode 100644
> index 000000000000..8d17b28357f8
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/icssg/icssg_qos.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Texas Instruments ICSSG PRUETH QoS submodule
> + * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#include "icssg_prueth.h"
> +#include "icssg_switch_map.h"
> +
> +static void icssg_iet_set_preempt_mask(struct prueth_emac *emac, u8 preemptible_tcs)
> +{
> +	void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
> +	struct prueth_qos_mqprio *p_mqprio = &emac->qos.mqprio;
> +	struct tc_mqprio_qopt *qopt = &p_mqprio->mqprio.qopt;
> +	int prempt_mask = 0, i;
> +	u8 tc;
> +
> +	/* Configure the queues based on the preemptible tc map set by the user */
> +	for (tc = 0; tc < p_mqprio->mqprio.qopt.num_tc; tc++) {
> +		/* check if the tc is preemptive or not */
> +		if (preemptible_tcs & BIT(tc)) {
> +			for (i = qopt->offset[tc]; i < qopt->offset[tc] + qopt->count[tc]; i++) {
> +				/* Set all the queues in this tc as preemptive queues */
> +				writeb(BIT(4), config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);
> +				prempt_mask &= ~BIT(i);
> +			}
> +		} else {
> +			/* Set all the queues in this tc as express queues */
> +			for (i = qopt->offset[tc]; i < qopt->offset[tc] + qopt->count[tc]; i++) {
> +				writeb(0, config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);
> +				prempt_mask |= BIT(i);
> +			}
> +		}
> +		writeb(prempt_mask, config + EXPRESS_PRE_EMPTIVE_Q_MASK);
> +		netdev_set_tc_queue(emac->ndev, tc, qopt->count[tc], qopt->offset[tc]);
> +	}
> +}
> +
> +static void icssg_config_ietfpe(struct work_struct *work)
> +{
> +	struct prueth_qos_iet *iet =
> +		container_of(work, struct prueth_qos_iet, fpe_config_task);
> +	void __iomem *config = iet->emac->dram.va + ICSSG_CONFIG_OFFSET;
> +	struct prueth_qos_mqprio *p_mqprio =  &iet->emac->qos.mqprio;
> +	bool enable = !!atomic_read(&iet->enable_fpe_config);
> +	int ret;
> +	u8 val;
> +
> +	if (!netif_running(iet->emac->ndev))
> +		return;
> +
> +	/* Update FPE Tx enable bit (PRE_EMPTION_ACTIVE_TX) if
> +	 * fpe_enabled is set to enable MM in Tx direction
> +	 */
> +	writeb(enable ? 1 : 0, config + PRE_EMPTION_ENABLE_TX);
> +
> +	/* If FPE is to be enabled, first configure MAC Verify state
> +	 * machine in firmware as firmware kicks the Verify process
> +	 * as soon as ICSSG_EMAC_PORT_PREMPT_TX_ENABLE command is
> +	 * received.
> +	 */
> +	if (enable && iet->mac_verify_configure) {
> +		writeb(1, config + PRE_EMPTION_ENABLE_VERIFY);
> +		writew(iet->tx_min_frag_size, config + PRE_EMPTION_ADD_FRAG_SIZE_LOCAL);
> +		writel(iet->verify_time_ms, config + PRE_EMPTION_VERIFY_TIME);
> +	}
> +
> +	/* Send command to enable FPE Tx side. Rx is always enabled */
> +	ret = icssg_set_port_state(iet->emac,
> +				   enable ? ICSSG_EMAC_PORT_PREMPT_TX_ENABLE :
> +					    ICSSG_EMAC_PORT_PREMPT_TX_DISABLE);
> +	if (ret) {
> +		netdev_err(iet->emac->ndev, "TX preempt %s command failed\n",
> +			   str_enable_disable(enable));
> +		writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);
> +		iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
> +		return;
> +	}
> +
> +	if (enable && iet->mac_verify_configure) {
> +		ret = readb_poll_timeout(config + PRE_EMPTION_VERIFY_STATUS, iet->verify_status,
> +					 (iet->verify_status == ICSSG_IETFPE_STATE_SUCCEEDED),
> +					 USEC_PER_MSEC, 5 * USEC_PER_SEC);
> +		if (ret) {
> +			iet->verify_status = ICSSG_IETFPE_STATE_FAILED;
> +			netdev_err(iet->emac->ndev,
> +				   "timeout for MAC Verify: status %x\n",
> +				   iet->verify_status);
> +			return;
> +		}
> +	} else if (enable) {
> +		/* Give f/w some time to update PRE_EMPTION_ACTIVE_TX state */
> +		usleep_range(100, 200);
> +	}
> +
> +	if (enable) {
> +		val = readb(config + PRE_EMPTION_ACTIVE_TX);
> +		if (val != 1) {
> +			netdev_err(iet->emac->ndev,
> +				   "F/w fails to activate IET/FPE\n");
> +			return;
> +		}
> +		iet->fpe_active = true;
> +	} else {
> +		iet->fpe_active = false;
> +	}
> +
> +	netdev_info(iet->emac->ndev, "IET FPE %s successfully\n",
> +		    str_enable_disable(iet->fpe_active));
> +	icssg_iet_set_preempt_mask(iet->emac, p_mqprio->preemptible_tcs);
> +}
> +
> +void icssg_qos_init(struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_iet *iet = &emac->qos.iet;
> +
> +	/* Init work queue for IET MAC verify process */
> +	iet->emac = emac;
> +	INIT_WORK(&iet->fpe_config_task, icssg_config_ietfpe);
> +}
> +
> +static int emac_tc_query_caps(struct net_device *ndev, void *type_data)
> +{
> +	struct tc_query_caps_base *base = type_data;
> +
> +	switch (base->type) {
> +	case TC_SETUP_QDISC_MQPRIO: {
> +		struct tc_mqprio_caps *caps = base->caps;
> +
> +		caps->validate_queue_counts = true;
> +		return 0;
> +	}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int emac_tc_setup_mqprio(struct net_device *ndev, void *type_data)
> +{
> +	struct tc_mqprio_qopt_offload *mqprio = type_data;
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
> +	struct prueth_qos_mqprio *p_mqprio;
> +	u8 num_tc = mqprio->qopt.num_tc;
> +	int tc, offset, count;
> +
> +	p_mqprio = &emac->qos.mqprio;
> +
> +	if (!num_tc) {
> +		netdev_reset_tc(ndev);
> +		p_mqprio->preemptible_tcs = 0;
> +		goto reset_tcs;
> +	}
> +
> +	memcpy(&p_mqprio->mqprio, mqprio, sizeof(*mqprio));
> +	p_mqprio->preemptible_tcs = mqprio->preemptible_tcs;
> +	netdev_set_num_tc(ndev, mqprio->qopt.num_tc);
> +
> +	for (tc = 0; tc < num_tc; tc++) {
> +		count = qopt->count[tc];
> +		offset = qopt->offset[tc];
> +		netdev_set_tc_queue(ndev, tc, count, offset);
> +	}
> +
> +reset_tcs:
> +	icssg_iet_set_preempt_mask(emac, p_mqprio->preemptible_tcs);
> +
> +	return 0;
> +}
> +
> +int icssg_qos_ndo_setup_tc(struct net_device *ndev, enum tc_setup_type type,
> +			   void *type_data)
> +{
> +	switch (type) {
> +	case TC_QUERY_CAPS:
> +		return emac_tc_query_caps(ndev, type_data);
> +	case TC_SETUP_QDISC_MQPRIO:
> +		return emac_tc_setup_mqprio(ndev, type_data);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(icssg_qos_ndo_setup_tc);
> +
> +void icssg_qos_link_up(struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_iet *iet = &emac->qos.iet;
> +
> +	/* Enable FPE if not active but fpe_enabled is true
> +	 * and disable FPE if active but fpe_enabled is false
> +	 */
> +	if (!iet->fpe_active && iet->fpe_enabled) {
> +		/* Schedule IET FPE IET FPE enable */
> +		atomic_set(&iet->enable_fpe_config, 1);
> +	} else if (iet->fpe_active && !iet->fpe_enabled) {
> +		/* Schedule IET FPE IET FPE disable */
> +		atomic_set(&iet->enable_fpe_config, 0);
> +	} else {
> +		return;
> +	}
> +	schedule_work(&iet->fpe_config_task);

AFAICS the scheduled work could still be running at module removal time.
If so, you need to cancel it properly to avoid possible UaF.

/P


