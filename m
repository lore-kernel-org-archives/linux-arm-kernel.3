Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B84AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNO+GGZXplasfRAWArGUH1YuDelArpF3hLtT+edlG+A=; b=X2vdB19HSZSb/40IiWEpIaG65y
	A0U4lP10L7tDQfF7zWKzZfKpc5U+FwyAcNfDa0zjXSNE2PCS/pGl/kRdEoWnUrbTrD1tS7oU0pj2I
	JBc++Q33hfVLgCkVnBPLhLTTjtjtMk8pW8yWQmhPo9ODUFdkyY5FJPulE3uCFtPyhYZwzNqR0SJq2
	7z1yJ/XQeA6Fsdimvq9+YmZ2pnFGClzuzRCgdEqg4zDqH37RcB3eCPGOYaTUNVBwiEFntHxzQoHup
	gKsbUuY05bjfOBBV2zT3NgsCS4YXHSZzgm16DwWDuATWS6lrd+YAUAa6cofs2u6jixZbVFtMFSswB
	knK+1yTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wrJ-0000000EEHM-1bUA;
	Thu, 24 Apr 2025 13:43:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vWD-0000000E0MY-069y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70AB15C639B;
	Thu, 24 Apr 2025 12:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E330AC4CEE3;
	Thu, 24 Apr 2025 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745497048;
	bh=Fa0JMJmKW07jw7qoCo4mzqLiB0/HwjaZUJP82v+kjAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sjii1C9YSuUdt8xaFxLkC9UA/BiBmfYthu1hg340GoNrnIBIyilWZYrgmN4uYkjSD
	 R5DImLgX4b0nhROVBdLpK/T+AU1fijmW/phyzmqkq9VskN7jHVkFLGwbZHiMTj8jnk
	 UXtFuZz9UlnRzCGuRBVk1YMPQTCMWrpr/1OvvqxiFiNRb6aczVLAzTFY4zZ/jhD2vG
	 ntPPuctiWswMRDm10D8v5tFfM6OuD+mUQpIaRMCFfmxcMtyG+qClKm51w6hqngPTKd
	 54IJ6YVrG7tMCyt6bQu0q/o9xZiSC0gjINFn9AVM0Idr1Tjna99tAB8s7trQWQsC/3
	 XTVvWZfl9+uxA==
Date: Thu, 24 Apr 2025 13:17:21 +0100
From: Simon Horman <horms@kernel.org>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Tien Sung Ang <tien.sung.ang@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v4 2/2] net: stmmac: dwxgmac2: Add support for
 HW-accelerated VLAN stripping
Message-ID: <20250424121721.GF3042781@horms.kernel.org>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-3-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421162930.10237-3-boon.khai.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_051729_102846_F15AE208 
X-CRM114-Status: GOOD (  14.90  )
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

On Tue, Apr 22, 2025 at 12:29:30AM +0800, Boon Khai Ng wrote:
> This patch adds support for MAC level VLAN tag stripping for the
> dwxgmac2 IP. This feature can be configured through ethtool.
> If the rx-vlan-offload is off, then the VLAN tag will be stripped
> by the driver. If the rx-vlan-offload is on then the VLAN tag
> will be stripped by the MAC.
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c

...

> @@ -69,6 +70,21 @@ static int dwxgmac2_get_tx_ls(struct dma_desc *p)
>  	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
>  }
>  
> +static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK);

nit: The outer parentheses are not needed on the line above.

	return le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK;


> +}

...

