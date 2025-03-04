Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADFC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apUO8liZA4G50u6YjEMQtyaVd6q3v/iNBbpuioqgWKA=; b=WDI6XerxY24lZUIyuvphfvyZqf
	UYN7t7Rf+Owgbf5mr7smh5QkE4inL0M/UwVyz8z+uG4wIhObtrdrTkKkyD1rqu3AIWhbMDKQ+P3A7
	4XOQkJeN+lDXtTCcALdBjWkziFWaIkExqhEcLABrTVRXpeKVcROYC7gILWCL+uVs9n0w3U1FEe3I/
	1Y9PMMTjBsZy8fGeM6rT8Xua57RFG8W9ibIp+lMjHF5ZIkaJan7Aku2A3lhd2qWbk5UAgh2QOE1C4
	Bc5hDnMJwIEiMaigy8r3pIZ8Y1g3vyIopGBx6YY5LsJb/brQeFFkbHlfpNELuJSaWoBOABSHWZrzP
	/21qDuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpH47-00000002laB-34sP;
	Tue, 04 Mar 2025 01:27:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpH2Y-00000002lL5-0Aj0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:25:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71559A4520B;
	Tue,  4 Mar 2025 01:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A250C4CEE4;
	Tue,  4 Mar 2025 01:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741051545;
	bh=V+AR8dH+t6wF0pag9HBom6C8kvjl0abK03bDTDbhgus=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Iie1xK3ZssJi2y780Ojr9j8a6wVbrQsYpN1DUXNwRXsqH+k5jAeLV42Vryi1kOEG+
	 hB/ncQZa656pbfQXYLnjBjrOw29+2BIpnQ/htvg0p6VqeEe9rK6vtY3uEIyrM1wEJy
	 6ZIHsvV66Qq998PaXNlkAgS1uFstqSki0f7Ni48+uteJr1L/t0FYSFjoxRqR4WFKWm
	 H9OQvIFNNrr9gBvuXEuiEj+I4GKi9fjUoi4OcG0UhURgqD4ipA8ld/AyT6eQtahLxb
	 GUhVTdMp9sO8sjBSOrkWOB6V22aKZNHrimZklojiEkwzlvOh7fUozPVoG/7ilw/c8/
	 49yyaym+R/2TQ==
Date: Mon, 3 Mar 2025 17:25:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Meghana Malladi <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David
 S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add ICSSG FW Stats
Message-ID: <20250303172543.249a4fc2@kernel.org>
In-Reply-To: <20250227093712.2130561-1-danishanwar@ti.com>
References: <20250227093712.2130561-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_172546_144482_3884A606 
X-CRM114-Status: GOOD (  13.79  )
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

On Thu, 27 Feb 2025 15:07:12 +0530 MD Danish Anwar wrote:
> +	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG),
> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR),
> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX),
> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK),
> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX),

I presume frame preemption is implemented in silicon? If yes -
what makes these "FW statistics"? Does the FW collect them from 
the device or the frames are for FW? 

> +	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR),
> +	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF),
> +	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF),
> +	ICSSG_PA_STATS(FW_RX_EXP_FRAG_Q_DROP),
> +	ICSSG_PA_STATS(FW_RX_FIFO_OVERRUN),
> +	ICSSG_PA_STATS(FW_CUT_THR_PKT),
> +	ICSSG_PA_STATS(FW_HOST_RX_PKT_CNT),
> +	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT),
> +	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW),
> +	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
>  };
>  
>  #endif /* __NET_TI_ICSSG_STATS_H */
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
> index 424a7e945ea8..d30203a0978c 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
> @@ -231,4 +231,109 @@
>  /* Start of 32 bits PA_STAT counters */
>  #define PA_STAT_32b_START_OFFSET                           0x0080
>  
> +/* Diagnostic error counter which increments when RTU drops a locally injected
> + * packet due to port disabled or rule violation.
> + */
> +#define FW_RTU_PKT_DROP		0x0088
> +
> +/* Tx Queue Overflow Counters */
> +#define FW_Q0_OVERFLOW		0x0090
> +#define FW_Q1_OVERFLOW		0x0098
> +#define FW_Q2_OVERFLOW		0x00A0
> +#define FW_Q3_OVERFLOW		0x00A8
> +#define FW_Q4_OVERFLOW		0x00B0
> +#define FW_Q5_OVERFLOW		0x00B8
> +#define FW_Q6_OVERFLOW		0x00C0
> +#define FW_Q7_OVERFLOW		0x00C8
> +
> +/* Incremented if a packet is dropped at PRU because of a rule violation */
> +#define FW_DROPPED_PKT		0x00F8

Instead of adding comments here please add a file under
Documentation/networking/device_drivers/ with the explanations.
That's far more likely to be discovered by users, no?
-- 
pw-bot: cr

