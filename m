Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209ECC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYBI5G7dnFgeNU8t5oolA0YvlhaF0Hy1jKHaYVc6xMI=; b=mUGiTXpkni1vk28NJ7T4vbXkS3
	1A7A467vGOvEvW/xgeoONdhUQ8tITzeb0d2Rtq0RiO5KH0bSW3tZqtR59LbSCpd/0HXLRaNoQYDZO
	J0QCcxke9/fPDk1+mQ5B5GH8MyjnUgPSAvpp6YZ/tNsRv0640/ZZF7GOqQw26/+XN5/oAQCoN03/c
	VmlVhcjkZ3ay0NKulbdQkNfwmcy5fvYQ/yTzJ69JtKKWbR5uY4Zj4ExS7g4leUKX2GC32ODnhFa/X
	dTcAWDsHdHkvha8WgaPPwQ7qsV4GhVUFnDZQHbSoRHFc8eALx0o/YUQEVBYoRzDrc6XzVhU/iKFBg
	7oc4n/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzI1x-00000000yrs-2OKH;
	Mon, 31 Mar 2025 16:30:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzI0E-00000000yf7-3Qto;
	Mon, 31 Mar 2025 16:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCB795C5890;
	Mon, 31 Mar 2025 16:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1DAC4CEE3;
	Mon, 31 Mar 2025 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743438525;
	bh=1i742vZv2sx1qDfIbzIYvJDqm4EeP2nZrnt0i1dtyJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCTXOpW41tk5+HQg9zM/GOJ4MRzAwOUbGjv7gAuvkEWiF2F8+r0WQ/8fuxImUu76q
	 mJ0ZbVGvyQ9L9lvsXCIluqu+mBVb2UnG1d6hMbIKDJLkckGAc8NpuIPv/RpiViW7Bn
	 frBVBb1T74XS5WOLBJlvYThNk5HcU8yNyevmnwk1ZdxwqF9NGuWrQ1edN4BnKY+Kuy
	 bBwqF2Sa6K7+0esyTbw3OOIacNTrxsz34DaCbCZSuUOeoUmKYUjpQtAJBItAym2hx1
	 vFnwf6uF2YLXiHJUn2KFPa7CdyRESV7vTMjxFkS/fHu055h1njA8/NFny6cR6kgwC/
	 tuGSK4MIe7m2g==
Date: Mon, 31 Mar 2025 17:28:41 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <20250331162841.GD185681@horms.kernel.org>
References: <20250331-airoha-validate-egress-gdm-port-v3-1-c14e6ba9733a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331-airoha-validate-egress-gdm-port-v3-1-c14e6ba9733a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_092846_938226_58945D65 
X-CRM114-Status: GOOD (  24.74  )
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

On Mon, Mar 31, 2025 at 12:14:09PM +0200, Lorenzo Bianconi wrote:
> Device pointer in airoha_ppe_foe_entry_prepare routine is not strictly
> necessary a device allocated by airoha_eth driver since it is an egress

nit: I think it would be clearer if "necessary" was dropped from the line
     above.

> device and the flowtable can contain even wlan, pppoe or vlan devices.
> E.g:
> 
> flowtable ft {
>         hook ingress priority filter
>         devices = { eth1, lan1, lan2, lan3, lan4, wlan0 }
>         flags offload                               ^
>                                                     |
>                      "not allocated by airoha_eth" --
> }
> 
> In this case airoha_get_dsa_port() will just return the original device
> pointer and we can't assume netdev priv pointer points to an
> airoha_gdm_port struct.
> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
> routine before accessing net_device priv pointer.
> 
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v3:
> - Rebase on top of net tree
> - Fix commit log
> - Link to v2: https://lore.kernel.org/r/20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org
> 
> Changes in v2:
> - Avoid checking netdev_priv pointer since it is always not NULL
> - Link to v1: https://lore.kernel.org/r/20250312-airoha-flowtable-null-ptr-fix-v1-1-6363fab884d0@kernel.org
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 13 +++++++++++++
>  drivers/net/ethernet/airoha/airoha_eth.h |  3 +++
>  drivers/net/ethernet/airoha/airoha_ppe.c | 10 ++++++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index c0a642568ac115ea9df6fbaf7133627a4405a36c..bf9c882e9c8b087dbf5e907636547a0117d1b96a 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2454,6 +2454,19 @@ static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
>  	}
>  }
>  
> +int airoha_is_valid_gdm_port(struct airoha_eth *eth,
> +			     struct airoha_gdm_port *port)

nit: given the name of the function, perhaps returning a bool is more
     appropriate.

> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
> +		if (eth->ports[i] == port)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +

...

