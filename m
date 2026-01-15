Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D8DD44C60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiWQl3af/62TGWr0WjMhGelheVUSaf6JrH170IRFLws=; b=Gh7n5ErXOWkzlnUg/bRhB5Wcet
	5jMje9kBtHJ/Eeh9m42cPwPQdHSgsQlAlkLaZL1Dju7PK4+ZpaLaj541b+NFbTphyMqycrC5qIbTc
	9+xJAs03xiq80hzwRmGN0sWZyLabL5dx5+44hD504qEh5vlVOEwcFdmhv2noToOh1VyRN/+NZYTl+
	8qtpghlayAC9S95wp1NXBepj0jxVt0EEZUJmmAENKN4IzVV6fZ0bMtkAv+oZxW3raUO/EO+xBCg9+
	YwiXwuDuu4k3pK+dWOgV8rmO6Fefrh9PotnMrR0dHiOl3QpYt0yAf0QRYmVnDvMCdQkVobkx+7oDO
	4mHWJihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOn7-0000000CYOu-0LKB;
	Thu, 15 Jan 2026 14:57:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOn4-0000000CYNo-3nhv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C40142A2E;
	Thu, 15 Jan 2026 14:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E4AC116D0;
	Thu, 15 Jan 2026 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768489057;
	bh=ikCvdOXi3FprM5XeYlF5j+h1c627PrYNjEIksGSN63U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlSnY+wNH4LqKcXJ2MRlFDUISiNZuAB1mAjqkVlqcJNlJChcmrxrif0kWS5qipu67
	 2fKSrtqHbwKa+0Sj1AzvuOi6VUSeSp8EPTrPcWPvv05faBO5kj9WSgqFfcvxcul46T
	 UAjmlFtBA8IQU2J+jtN6fLMHrSFA0MrX2iuWWPcEUCTN7h011EvACFTlDa/+g5yUdu
	 zYQAoLtyQZOwuW5Ib0NBeZLKrCX1xgJARCcA8rDjXerrSHIMhdnWZsE3Vce1zc/OWO
	 gBo6YXCctfSPvfh5AE0noWgFT8EYR5pejOqHDitfjr9mYV9rUy7a7Q1Expt0Q4yqBX
	 AEMb2yxvonClQ==
Date: Thu, 15 Jan 2026 14:57:32 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vadim.fedorenko@linux.dev, jacob.e.keller@intel.com, afd@ti.com,
	pmohan@couthit.com, basharath@couthit.com, vladimir.oltean@nxp.com,
	rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next 1/2] net: ti: icssg-prueth: Add Frame Preemption
 MAC Merge support
Message-ID: <aWkAXHXHHOD9SDBt@horms.kernel.org>
References: <20260107125111.2372254-1-m-malladi@ti.com>
 <20260107125111.2372254-2-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107125111.2372254-2-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065738_979575_CBFD2539 
X-CRM114-Status: GOOD (  18.07  )
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

On Wed, Jan 07, 2026 at 06:21:10PM +0530, Meghana Malladi wrote:
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

...

>  /* The buf includes headroom compatible with both skb and xdpf */
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.c b/drivers/net/ethernet/ti/icssg/icssg_qos.c

...

> +static int emac_tc_setup_mqprio(struct net_device *ndev, void *type_data)
> +{
> +	struct tc_mqprio_qopt_offload *mqprio = type_data;
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_mqprio *p_mqprio;
> +	int ret;
> +
> +	if (mqprio->qopt.hw == TC_MQPRIO_HW_OFFLOAD_TCS)
> +		return -EOPNOTSUPP;
> +
> +	if (!mqprio->qopt.num_tc) {
> +		netdev_reset_tc(ndev);
> +		p_mqprio->preemptible_tcs = 0;

Hi MD & Meghana,

p_mqprio is dereferenced here.
But it isn't initialised yet.

Flagged by Clang 21.1.7 W=1 build for arm64.

> +		return 0;
> +	}
> +
> +	ret = prueth_mqprio_validate(ndev, mqprio);
> +	if (ret)
> +		return ret;
> +
> +	p_mqprio = &emac->qos.mqprio;
> +	memcpy(&p_mqprio->mqprio, mqprio, sizeof(*mqprio));
> +	netdev_set_num_tc(ndev, mqprio->qopt.num_tc);
> +
> +	return 0;
> +}

...

