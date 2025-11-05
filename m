Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED71CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2OzL0brLx2/KH15ZALbDxkyreMUC17MmTTZbwtK8jc=; b=dLiYsOwcvICfVFc7jDeIWZw8d8
	NXA5NKDtrI43VhravsBoQWLsp8/LmHyrId7mJXT7RCN7dFJoNEKl+X4zECfrwUfKqksDdZTsBQjz6
	kQjq8nJdDv9PQEQTYvcDXegKtUYIQBT/0cxr4patrHedgo39SoHgjQzbN17OXMj4JvF19pKAcSso4
	k7thLUk42tukEFYigQ9QiwnjkbgO91aKWCilNBI7ZVj4SvC2rnnKv6n4LbOWtHF+rWe76in0Jrnl3
	Bg57aiBLb5D/BW2QEosS8mk/KMWOBjbZmIWL7tEpmq4kcpBBk6yKHXfGcul0zK3e184ch3gNP9K4/
	S7SnJ9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSYq-0000000CrXU-3RPP;
	Wed, 05 Nov 2025 01:43:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSYo-0000000CrXA-2KJN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF3FA434A2;
	Wed,  5 Nov 2025 01:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049E4C4CEF7;
	Wed,  5 Nov 2025 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762307021;
	bh=qyKbep87U6tFaQtgtK+LxswkZ6ORWQIdJGoQUEsxra4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pZaj26OcpSM2Wfs3vWfI0Ac007a31QJlAiOdbJwA3h9bSF8wo7WXk1BJ3vy6nhDmD
	 AIyVK9deZuZm5nsjuj/l4Pz+bEqaybpofAADE8IFSoP1++ZBKQ3MntorIFCsUz4vpc
	 nU8TVvGftXmRZ21mp54PgZ6nqoDU9Ftno6UiFwl19ro3dhSUv4j+bF8AquEtYxVGMq
	 SyuP+R8kK424aE5FVeWh6tJ9I2JetrqWFrlVfGLp5o+cH6OiSdS6ktbYcfo9lwe7iu
	 WEY3XC/HHdUaVPXW8525qmnpJ0Yt9uxrZOFJtXzqrTbBDV2GfS72UQxHiCxHak9pWz
	 IXoibLzD9NQcA==
Date: Tue, 4 Nov 2025 17:43:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Manish Chopra <manishc@marvell.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Kory Maincent
 <kory.maincent@bootlin.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 7/7] qede: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251104174340.5d2d8741@kernel.org>
In-Reply-To: <20251103150952.3538205-8-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
	<20251103150952.3538205-8-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_174342_616257_6535E5CF 
X-CRM114-Status: GOOD (  10.04  )
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

On Mon,  3 Nov 2025 15:09:52 +0000 Vadim Fedorenko wrote:
>  	ptp->hw_ts_ioctl_called = 1;
> -	ptp->tx_type = config.tx_type;
> -	ptp->rx_filter = config.rx_filter;
> +	ptp->tx_type = config->tx_type;
> +	ptp->rx_filter = config->rx_filter;
>  
>  	rc = qede_ptp_cfg_filters(edev);
> -	if (rc)
> +	if (rc) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "One-step timestamping is not supported");
>  		return rc;
> +	}
> +
> +	config->rx_filter = ptp->rx_filter;

Same story as the first patch.
I suppose these drives may predate the advanced tx config options.
Simple fix would be to move the tx_filter validation here instead.

I'll apply 2-6.

