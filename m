Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4519C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41F7w2xfYbI9W/hFAjodmkV1CFsZkOmC9VoYg0hPETo=; b=OTWwHTh2teiExja+J/i1HXREx9
	nJ9L+xYXxSB36yaPdujbsft6swg4aLAXPytUuZ7y5lFCu4DZQh3/c9qqhzWTgAxnhryDUsbzViVAd
	TdoBwQffbbPVJx5Ouz1vyWjOJJ15mPLXJMcU60NXN5sz7qKr2fJufoILXC/4evq4PnQRCAzy1jdpC
	8M7egWtEbeuft6iGD/gwTBsKE6w0dmDFM1e0S3qJpBpPTlTYlHO9CPUxwJOnc4x2l2A/dgrGRUf4c
	xq1gSr7HahT3Xc9jT5s5QLXqiIab0aJD8YDjoW6ltHDxUk/P/0qzZsDplvb5oP45ps9c2XS3j9IO9
	JWMNHEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWjl-0000000EAp3-11Y7;
	Fri, 07 Mar 2025 12:23:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWhi-0000000EAa4-2wt3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 12:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1790A45717;
	Fri,  7 Mar 2025 12:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379A9C4CED1;
	Fri,  7 Mar 2025 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741350084;
	bh=n/rX2T7XWYNEB5c47vZqkTQcbFk1cEn+IsmwsxMI8H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4wbIWD+eQgi9iSzdRuy9RPG1IVOA0kvWKjOcAZWjQyfpCe1oTP0d4AyYJJkMI7bx
	 mV+L+WG/USp4nL+oyGB5fWGwSSXGW+joQxc4Bbmx1VlWr4gw2SPnkAy1uCUAZaT3ud
	 WR4TQYjFo6KYOLRepnzgHLP1eNhxmRAnTZ27rx98jQMeqWTeyjqF9f8H4hzQ7ESZSJ
	 QnVzxO2KXa2NJHk3hRPoge4TW4gy0ueua3MjM+7e80Q0cFznNkNf3RZdcNFhPP60cJ
	 37IY+Bpo6V+lW1w4Xfbma4zKAV0ek411E0sfBy0MH/7n7JlWIIMDfAXZijxfw2xceO
	 1QmGPueKe804g==
Date: Fri, 7 Mar 2025 12:21:19 +0000
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next 1/7] net: ethtool: netlink: Allow per-netdevice
 DUMP operations
Message-ID: <20250307122119.GE3666230@kernel.org>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
 <20250305141938.319282-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305141938.319282-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_042126_915759_261A51F8 
X-CRM114-Status: GOOD (  26.11  )
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

On Wed, Mar 05, 2025 at 03:19:31PM +0100, Maxime Chevallier wrote:
> We have a number of netlink commands in the ethnl family that may have
> multiple objects to dump even for a single net_device, including :
> 
>  - PLCA, PSE-PD, phy: one message per PHY device
>  - tsinfo: one message per timestamp source (netdev + phys)
>  - rss: One per RSS context
> 
> To get this behaviour, these netlink commands need to roll a custom
> ->dumpit().
> 
> To prepare making per-netdev DUMP more generic in ethnl, introduce a
> member in the ethnl ops to indicate if a given command may allow
> pernetdev DUMPs (also referred to as filtered DUMPs).
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  net/ethtool/netlink.c | 45 ++++++++++++++++++++++++++++---------------
>  net/ethtool/netlink.h |  1 +
>  2 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> index 734849a57369..0815b28ba32f 100644
> --- a/net/ethtool/netlink.c
> +++ b/net/ethtool/netlink.c
> @@ -578,21 +578,34 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
>  	int ret = 0;
>  
>  	rcu_read_lock();
> -	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> -		dev_hold(dev);
> +	if (ctx->req_info->dev) {
> +		dev = ctx->req_info->dev;
>  		rcu_read_unlock();
> -
> -		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
> -
> +		/* Filtered DUMP request targeted to a single netdev. We already
> +		 * hold a ref to the netdev from ->start()
> +		 */
> +		ret = ethnl_default_dump_one_dev(skb, dev, ctx,
> +						 genl_info_dump(cb));

Hi Maxime,

ethnl_default_dump_one_dev() is called here but it doesn't exist
until the following patch is applied, which breaks bisection.

>  		rcu_read_lock();
> -		dev_put(dev);
> -
> -		if (ret < 0 && ret != -EOPNOTSUPP) {
> -			if (likely(skb->len))
> -				ret = skb->len;
> -			break;
> +		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
> +	} else {
> +		for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> +			dev_hold(dev);
> +			rcu_read_unlock();
> +
> +			ret = ethnl_default_dump_one(skb, dev, ctx,
> +						     genl_info_dump(cb));
> +
> +			rcu_read_lock();
> +			dev_put(dev);
> +
> +			if (ret < 0 && ret != -EOPNOTSUPP) {
> +				if (likely(skb->len))
> +					ret = skb->len;
> +				break;
> +			}
> +			ret = 0;
>  		}
> -		ret = 0;
>  	}
>  	rcu_read_unlock();
>  

...

> diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
> index ec6ab5443a6f..4db27182741f 100644
> --- a/net/ethtool/netlink.h
> +++ b/net/ethtool/netlink.h
> @@ -388,6 +388,7 @@ struct ethnl_request_ops {
>  	unsigned int		req_info_size;
>  	unsigned int		reply_data_size;
>  	bool			allow_nodev_do;
> +	bool			allow_pernetdev_dump;

nit: allow_pernetdev_dump should also be added to the Kernel doc for
     struct ethnl_request_ops

     Flagged by ./scripts/kernel-doc -none

     There also appear to be similar minor issues with subsequent
     patches in this series.

>  	u8			set_ntf_cmd;
>  
>  	int (*parse_request)(struct ethnl_req_info *req_info,
> -- 
> 2.48.1
> 

