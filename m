Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368ADCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onJggHbGvjz1Hszc6hHJUDtfuACpkeEoDWpS7MYELBo=; b=q1es+ejHBanlrP0CBJPAoRdSON
	8n8l5np9OX8GDq0mLbiS54P2rm6572senPjoInRvK+GDQiRRUvlL0pxbJP+KkN9ONMXfWs7pmXCAN
	jM/PZ6V/OmyihCNIIMZ4G63gpShhV4b3JqX3zsQTPHBJ2e+yv4qvPUN06FGGyhTP1tIcPI7RzuCKF
	xxWa31a1qqo0cX4pqXpxbTaRipMtO/n942i4Cltds70o9ZnBMuVBFwXsFRMwRSvhSR12BaF7zAa0X
	LWz1u6QQJm4U94wjkauwWN3z0j/2wf5bL6KF9cYhu6t9C4nPOpLVel6rWw+/7980m9H62SO/RaFAw
	k2fWsSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xLx-000000011oh-3pPX;
	Wed, 15 Oct 2025 08:59:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xLw-000000011o6-0ZUP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F71362525;
	Wed, 15 Oct 2025 08:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D39BC4CEF8;
	Wed, 15 Oct 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760518763;
	bh=EUYhWksXVGZIMju1edC1CGm/fB7mrhfKVvKphQHqdsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rH+F/PFSbSD5IInXuBF4/jDYiiMZTN23+ow/kLEFM6BYicaDp13195B7+KbDTI4tx
	 qhl2be3E56oVhlCNoJrZACe3iLiwODwZXbjnhIJVlLPZgQyR6PwHbuWuTT0EQ5qmN0
	 68o3n3a8sn21DrcdRfN6su9UF0QA8wFe/ESAf4DfVKcN+aET1TFCDWEB43P8BmhHD0
	 y3zHF6P4eoKJoqI5f3xmaBlmo4z9ivcLLyzynb5Vn8dgMdajJQzJqC662g6RBMyFz2
	 mRef9MD4sI4guKNrC8BZ8truUf0o5P5kllFhvS5pASuefg47i3npqJx0h2dzZQRDc5
	 gX11R2L66LkQA==
Date: Wed, 15 Oct 2025 09:59:18 +0100
From: Simon Horman <horms@kernel.org>
To: Lizhe <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	jonas@kwiboo.se, chaoyi.chen@rock-chips.com,
	david.wu@rock-chips.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dwmac-rk: No need to check the return
 value of the phy_power_on()
Message-ID: <aO9iZiMBs3pUnb77@horms.kernel.org>
References: <20251015040847.6421-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015040847.6421-1-sensor1010@163.com>
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

On Tue, Oct 14, 2025 at 09:08:47PM -0700, Lizhe wrote:
> 'phy_power_on' is a local scope one within the driver, since the return
> value of the phy_power_on() function is always 0, checking its return
> value is redundant.
> 
> the function name 'phy_power_on()' conflicts with the existing
> phy_power_on() function in the PHY subsystem. a suitable alternative
> name would be rk_phy_power_set(), particularly since when the second
> argument is false, this function actually powers off the PHY
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 51ea0caf16c1..9d296bfab013 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>  	return 0;
>  }
>  
> -static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
> +static void rk_phy_power_on(struct rk_priv_data *bsp_priv, bool enable)

Hi Lizhe,

This introduces a compilation error because phy_power_on()
is still used on line 1670.

Perhaps the hunk to update that line got lost somewhere.

-- 
pw-bot: changes-requested

...

