Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96348CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXn703aOIjISemvjW7SqSYgESFNqSmJXUCU165M1Fr8=; b=cNZEseXEnHu1Gm8m3DKxjn5yTb
	DQi2SjLuak0qy4UfJlqzbsxzaLBOBtIdzRtsMYYU/2Tb6JRroPV/v+fK5Cq7TN6lQDlQM4PWG9rkL
	haapV7O7wBNzvCZLlmA/wn3gRGEhRQDm82F9ntJJGYZnyFYYZvrVlaACa1AD8ZhRIoHg+zva163fa
	XvEroGyijgHMdtDtW1uGHOYEhyI5YWKT2+Qe9MjvFvI0F8mcrm031bfNXVXKVHOFj0JpJ+e/QF7Bm
	+44X3Rm2xJTiKdV813xXyFrzfw8WdDkmnWS7OhTJW4o8JS5zKJWfqBg/qd2A+xKdkPOJ6zFxLw0Bv
	dHXFz6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCek8-0000000Bpba-3fGW;
	Fri, 02 Oct 2026 15:00:12 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCek0-0000000BpR0-1Sqa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:00:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19413A4AB8;
	Fri,  2 Oct 2026 16:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1790953193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pXn703aOIjISemvjW7SqSYgESFNqSmJXUCU165M1Fr8=;
	b=hiYO379a2JrVAMN12K+8M4nzv4aoMDawt/E/KmtAWiumBOaJXZ39gvhfuXkRj4zeZBnmdt
	u2P9So1KX+/VmAyvQzURenGsqL+NFRrj9JNGUsmKjx/WSGCh15gvHFnCIRKwA0GNC8tkxq
	796xpxuzYZcJWmjnafK0pynf5N4P/+5f1HkB9s01q4APJwN+IjCSCcVyy3qhkL7uKzTc95
	TQr9NJBdDF9BS4laG+WJiQPNqRlfHcrWluflKz528lsRy+hgCnGzSOJTTvWYsBEJ4tdmf+
	daeBNC1XcB1+Ob0IppU2HipznxklPjF3JQYoEzMgtrzxrhCLUdRxN8TSRraZyA==
MIME-Version: 1.0
Date: Fri, 02 Oct 2026 16:59:46 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Jitendra Vegiraju
 <jitendra.vegiraju@broadcom.com>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Peter Robinson
 <pbrobinson@gmail.com>, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 1/3] net: rss: Require indir table size or
 hash key size to support RSS
In-Reply-To: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
 <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
Message-ID: <da1589545fdaf4f3c7ed3b0059366bcf@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080005_394624_AF45D4DC 
X-CRM114-Status: GOOD (  15.65  )
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

Hi Maxime

On 2.10.2026 16:28, Maxime Chevallier wrote:
> A point can be made that devices that report a 0-size indirection table
> and 0-length key size don't really support RSS. Let's return 
> -EOPNOTSUPP
> in that case, and skip these devices during DUMP requests.
> 
> This however also reports -ENOTSUPP for devices that only supports flow
> hash fields ops now.

nit: -EOPNOTSUPP

> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  net/ethtool/ioctl.c | 6 ++++++
>  net/ethtool/rss.c   | 7 +++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
> index 27b0e2e275dc..d32b403c8d3a 100644
> --- a/net/ethtool/ioctl.c
> +++ b/net/ethtool/ioctl.c
> @@ -1444,6 +1444,9 @@ static noinline_for_stack int 
> ethtool_get_rxfh(struct net_device *dev,
>  	if (ops->get_rxfh_key_size)
>  		rxfh_dev.key_size = ops->get_rxfh_key_size(dev);
> 
> +	if (!rxfh_dev.indir_size && !rxfh_dev.key_size)
> +		return -EOPNOTSUPP;
> +
>  	if (copy_from_user(&rxfh, useraddr, sizeof(rxfh)))
>  		return -EFAULT;
>  	user_indir_size = rxfh.indir_size;
> @@ -1554,6 +1557,9 @@ static noinline_for_stack int 
> ethtool_set_rxfh(struct net_device *dev,
>  	if (ops->get_rxfh_key_size)
>  		dev_key_size = ops->get_rxfh_key_size(dev);
> 
> +	if (!dev_indir_size && !dev_key_size)
> +		return -EOPNOTSUPP;
> +
>  	if (copy_from_user(&rxfh, useraddr, sizeof(rxfh)))
>  		return -EFAULT;
> 
> diff --git a/net/ethtool/rss.c b/net/ethtool/rss.c
> index d4a1a4724b67..cb9bead0cedd 100644
> --- a/net/ethtool/rss.c
> +++ b/net/ethtool/rss.c
> @@ -129,6 +129,9 @@ rss_get_data_alloc(struct net_device *dev, struct 
> rss_reply_data *data)
>  	if (ops->get_rxfh_key_size)
>  		data->hkey_size = ops->get_rxfh_key_size(dev);
> 
> +	if (!data->indir_size && !data->hkey_size)
> +		return -EOPNOTSUPP;
> +
>  	indir_bytes = data->indir_size * sizeof(u32);
>  	total_size = indir_bytes + data->hkey_size;
>  	rss_config = kzalloc(total_size, GFP_KERNEL);
> @@ -449,7 +452,7 @@ rss_dump_one_dev(struct sk_buff *skb, struct 
> netlink_callback *cb,
> 
>  	if (!ctx->ctx_idx) {
>  		ret = rss_dump_one_ctx(skb, cb, dev, 0);
> -		if (ret)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  		ctx->ctx_idx++;
>  	}
> @@ -457,7 +460,7 @@ rss_dump_one_dev(struct sk_buff *skb, struct 
> netlink_callback *cb,
>  	for (; xa_find(&dev->ethtool->rss_ctx, &ctx->ctx_idx,
>  		       ULONG_MAX, XA_PRESENT); ctx->ctx_idx++) {
>  		ret = rss_dump_one_ctx(skb, cb, dev, ctx->ctx_idx);
> -		if (ret)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  	}
>  	ctx->ctx_idx = ctx->start_ctx;

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

