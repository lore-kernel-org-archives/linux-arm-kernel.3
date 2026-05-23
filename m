Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8808CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 02:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WKrz7vc9STJ7Mp+8h8Ot/78gKtBGE55ZCaRuTUygMk=; b=uro2bAkv4DPZkS1dZD50vdfMeK
	xhq3e44pJPYt7mIWmfvHDI8O1H0QL4ra39wt4GPf8fvr604Uiq8A+ru9otQgff1JxdSyN6vRGMllG
	Rdzvh8x1tvFQF6c8kd0d66QPLuJ22XTz5qzOEVYzrVmGIK/J9doeJRDIKvNn2nFE8efR5orjrwtT+
	sSgB/af/gBrE3TozNQeushJy+Ek8HxbangTtmEWqOLTQa16ZKYXjGzMGUoZ7oEgbKjqYxLjhRRQMz
	E9iwFmfR5bxT3+JKJmtig1T03z1vlUwuEnCAcZ+HcSnHQEVKqBvpF5mWeajB+p/jkyzG6G+XDgCQQ
	lDEDZrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbgB-0000000CUau-3Y5u;
	Sat, 23 May 2026 02:01:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbg9-0000000CUaC-0H44
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 02:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2051434B4;
	Sat, 23 May 2026 02:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4121F000E9;
	Sat, 23 May 2026 02:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779501687;
	bh=6WKrz7vc9STJ7Mp+8h8Ot/78gKtBGE55ZCaRuTUygMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Lu8qzSzUR56qKtBo5J5tVbOBq2fLHEbGuJvGbwBYT7tma9sadRmPhQLEQLdia87v3
	 Bc2kr0+HlGhfMIdGrUcPDem8YTZTZUcNi+q0hrcxFNA0E3aW6KvhCNgwDr4xu8cp1w
	 j6meQHhvKD9l1sReRcGE1ZFiaRlRIznR+XML7oZHwPQj89+0MuWxYSkhvRm6T7B492
	 Ed+kM7H9ritAuVwKmFMZwnAi54HaH+1MYEUSPIK0R26n+3sSRXfehqcRv/lz4bdQfE
	 dKli06o6ymyCJR9BA5Pho/QY1PLMDRodszvdZYDdUuyI5cUygwjcYycC94JvaBE1g7
	 aun38acPBJhFA==
Date: Fri, 22 May 2026 19:01:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen
 Hegelund <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
 "Alexei Starovoitov" <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, "Jesper Dangaard Brouer" <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Herve Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v5 11/13] net: lan966x: add PCIe FDMA XDP
 support
Message-ID: <20260522190126.0f2d6587@kernel.org>
In-Reply-To: <20260520-lan966x-pci-fdma-v5-11-ca56197ae05b@microchip.com>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
	<20260520-lan966x-pci-fdma-v5-11-ca56197ae05b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_190129_132261_B7D4367E 
X-CRM114-Status: GOOD (  15.06  )
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

On Wed, 20 May 2026 10:12:23 +0200 Daniel Machon wrote:
>  #if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
>  extern const struct lan966x_fdma_ops lan966x_fdma_pci_ops;
> +
> +static inline bool lan966x_is_pci(struct lan966x *lan966x)
> +{
> +	return lan966x->ops == &lan966x_fdma_pci_ops;

	return IS_ENABLED(CONFIG_MCHP_LAN966X_PCI) && 
		lan966x->ops == &lan966x_fdma_pci_ops;

compiler will eliminate the reference to the ops as dead code
and linker will not complain that its object is missing.

> +}
> +#else
> +static inline bool lan966x_is_pci(struct lan966x *lan966x)
> +{
> +	return false;
> +}
>  #endif
>  
>  int lan966x_lag_port_join(struct lan966x_port *port,
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
> index 9ee61db8690b..b470f731e25c 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
> @@ -24,6 +24,16 @@ static int lan966x_xdp_setup(struct net_device *dev, struct netdev_bpf *xdp)
>  	old_prog = xchg(&port->xdp_prog, xdp->prog);
>  	new_xdp = lan966x_xdp_present(lan966x);
>  
> +	/* PCIe FDMA uses contiguous buffers, so no page_pool reload
> +	 * is needed. Drain NAPI before freeing the old program so
> +	 * no in-flight poll holds a stale pointer.
> +	 */

Not sure what this does. BPF programs are under RCU, they are not
immediately freed (if that's that you mean..)

> +	if (lan966x_is_pci(lan966x)) {
> +		if (old_prog)
> +			napi_synchronize(&lan966x->napi);
> +		goto out;
> +	}

