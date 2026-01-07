Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9D2CFD65E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61A7r253e06+u+rNHIvmt1qtEkkPMc45kP4G79SpTyE=; b=EyaVcp7uizSJLXHRxXu6ZMLafo
	H8JbinBf3vzrOFP4Tnkec9DqWgkk5qdwvNisvPN8p7mjJMuR++bPFnaW2MXuhEGZe37NAC7jLzjeV
	63k27BtcmyIAe7HBtdIKu5SsLk37YssHkdiLvrbiOfE7z3Azwgu4NhLPSmprbKctKYR8X3sCdkwEl
	Sa9yPU8O79amg+3MGJd2AoxHM3DGTaFD+UZDtDT3h00vR3EKi4Fc75kvC3FYZf9SXwMxmBM4mpTpC
	eBlefRPnlpXWqddKSS9wlk/5/3GwDCEv7E+GHEyLmPvVY6SuG0lacX0s6IWWEvcZSlEaMAtxzWWTe
	MN4Cumnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWT3-0000000FJ8b-3KeS;
	Wed, 07 Jan 2026 16:33:05 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWT0-0000000FJ7f-1f3e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:33:03 +0000
Message-ID: <ac64856a-d283-4f06-b334-f0bb5013a865@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767803577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61A7r253e06+u+rNHIvmt1qtEkkPMc45kP4G79SpTyE=;
	b=dn+EQqKn9gK/JnEb03wgeWezRIzXs4T4rb3GzcRKMuUmuQ71nKxGRS+0KCP+LlZ8X8Hd9e
	GSXWm2ZGoCYMDleeey3p1juY6ygv5+qoTaG9cYLcN+iIV/Zgn9z7njQK4WVdrN7KFHcz1/
	GNexM9fuNDvC8QIfZC6u9jdc2E3aemI=
Date: Wed, 7 Jan 2026 16:32:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] net: ti: icssg-prueth: Add Frame Preemption
 MAC Merge support
To: Meghana Malladi <m-malladi@ti.com>, horms@kernel.org,
 jacob.e.keller@intel.com, afd@ti.com, pmohan@couthit.com,
 basharath@couthit.com, vladimir.oltean@nxp.com, rogerq@kernel.org,
 danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20260107125111.2372254-1-m-malladi@ti.com>
 <20260107125111.2372254-2-m-malladi@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260107125111.2372254-2-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_083302_581685_BB5E9D2B 
X-CRM114-Status: GOOD (  19.49  )
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

On 07/01/2026 12:51, Meghana Malladi wrote:
> This patch adds utility functions to configure firmware to enable
> IET FPE. The highest priority queue is marked as Express queue and
> lower priority queues as pre-emptable, as the default configuration
> which will be overwritten by the mqprio tc mask passed by tc qdisc.
> Driver optionally allow configure the Verify state machine in the
> firmware to check remote peer capability. If remote fails to respond
> to Verify command, then FPE is disabled by firmware and TX FPE active
> status is disabled.
> 
> This also adds the necessary hooks to enable IET/FPE feature in ICSSG
> driver. IET/FPE gets configured when Link is up and gets disabled when link
> goes down or device is stopped.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>   drivers/net/ethernet/ti/Makefile             |   2 +-
>   drivers/net/ethernet/ti/icssg/icssg_prueth.c |   9 +
>   drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
>   drivers/net/ethernet/ti/icssg/icssg_qos.c    | 319 +++++++++++++++++++
>   drivers/net/ethernet/ti/icssg/icssg_qos.h    |  48 +++
>   5 files changed, 379 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
>   create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h
> 
> diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
> index 93c0a4d0e33a..2f588663fdf0 100644
> --- a/drivers/net/ethernet/ti/Makefile
> +++ b/drivers/net/ethernet/ti/Makefile
> @@ -35,7 +35,7 @@ ti-am65-cpsw-nuss-$(CONFIG_TI_K3_AM65_CPSW_SWITCHDEV) += am65-cpsw-switchdev.o
>   obj-$(CONFIG_TI_K3_AM65_CPTS) += am65-cpts.o
>   
>   obj-$(CONFIG_TI_ICSSG_PRUETH) += icssg-prueth.o icssg.o
> -icssg-prueth-y := icssg/icssg_prueth.o icssg/icssg_switchdev.o
> +icssg-prueth-y := icssg/icssg_prueth.o icssg/icssg_switchdev.o icssg/icssg_qos.o
>   
>   obj-$(CONFIG_TI_ICSSG_PRUETH_SR1) += icssg-prueth-sr1.o icssg.o
>   icssg-prueth-sr1-y := icssg/icssg_prueth_sr1.o
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index f65041662173..668177eba3f8 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -378,6 +378,12 @@ static void emac_adjust_link(struct net_device *ndev)
>   		} else {
>   			icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
>   		}
> +
> +		if (emac->link) {
> +			icssg_qos_link_up(ndev);
> +		} else {
> +			icssg_qos_link_down(ndev);
> +		}

I believe this chunk can be incorporated into if-statement right above

>   	}
>   
>   	if (emac->link) {

[...]

