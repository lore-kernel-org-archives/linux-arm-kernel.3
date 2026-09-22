Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79AFC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0JlreyEJJ3u2gi6KYmZFs3Q667NRJY6xEL00ZUN48k=; b=44hTciz8/dNaUzglH+sfIskAb/
	GM1/5R9t7BDNZfaiY6Jzh8RQlOxOFbRJi+/oGYZ9JuLESGKhDyl2RADhMITAtza+UkvY7CLncmJ7B
	xOwWzFF5wR0s0/8aqEOvMZtIngL55ejNg7Tg6fSdQ6WjqVgXbedpFZwBWL0cyU0aH+aTKFALunVcv
	HILpUyTctT51wKXJXpFMeSwJFpKA7Af+ScJXEtNz3HnrHYSO9MD3et9BEnwfVWJjBuNcLev5fqwLg
	dl0Yv9KT+/JGxBgQqv+urHH7Q+jUs5FGbWXovFdh8JDTlfLg3SoyzzIyG65XyME/zMclkzBohQnAj
	ZU5/fHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Kq-00000006e1k-3AZe;
	Tue, 22 Sep 2026 21:47:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Kn-00000006e1K-20wO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:47:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EF551A0FD8;
	Tue, 22 Sep 2026 21:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5579D60580;
	Tue, 22 Sep 2026 21:47:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DD6710328B89;
	Tue, 22 Sep 2026 23:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790113640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m0JlreyEJJ3u2gi6KYmZFs3Q667NRJY6xEL00ZUN48k=;
	b=GkzVjr1KUbIzep8704/Oq868HuBRpjy+UE1zRrlKJFA84olbhB5nE+cSD4yyzfdBX3E43S
	laXVPESvop1qvxsmpSLLADC6KmQp4ER+hey5ZR9XGqIFd3TM8GTfL46EQj4hNC1Qol6AQ8
	1cdApNAHu0Pkj2FD6nBnnuRIX2oP+iExIHsG/JlbH1lWiQSDPTV0s49sHMVH7ffaFGauoO
	EapgmWWjn38kySHKIXHWlVFgTtmVosdpxkKonu62c5BjurblPAt05ngUXeLwGtmpp+RdH5
	pdlSKIqJ3zjfxwpcSmFezYfmn4ekqIcHrcuUT5RTgHK/OJlYKRjOfgUDhL96EA==
Message-ID: <59edcef4-6b2c-403e-bc36-1e4e222231c3@bootlin.com>
Date: Tue, 22 Sep 2026 23:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/3] net: stmmac: close the interface after failed
 hardware resume
To: James Hilliard <james.hilliard1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>,
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
 <20260921-submit-stmmac-reset-fixes-v1-v1-3-87a4e431ee00@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-3-87a4e431ee00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_144729_701120_F898E68E 
X-CRM114-Status: GOOD (  25.82  )
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

Hi,

On 9/21/26 18:54, James Hilliard wrote:
> System suspend disables NAPI and suspends phylink but retains the IRQs
> and DMA resources. If hardware setup fails during resume, the interface
> remains administratively up with NAPI still disabled. Closing it later
> calls napi_disable() a second time and can hang indefinitely.
> 
> On hardware-setup failure, stop DMA and disable the MAC, then release the
> suspended data path without repeating NAPI disable. Stop phylink directly
> from its suspended state rather than restarting the link on hardware
> which failed to resume. Drop the driver mutex before teardown, retaining
> RTNL across cleanup and network-core close.
> 
> Close the netdev to detach the PHY, release its runtime-PM reference and
> clear its administrative state. Reattach the now-down netdev so a later
> open can allocate new resources and retry. Preserve the original resume
> error and leave successful resume unchanged.

So this changes the admin state of the interface upon resume failure ?

using netif_close() in drivers is not common at all, only 3 drivers do that,
and among that, fbnic does that for the selftests...

Let's instead focus on making the state coherent.

Before entering suspend, interface is up and running. suspend happens, then
resume, and something goes wrong. As you mention, the next logical step as
the interface is now dead is to bring it down, and freshly set it back up.

I'd say, either the __stmmac_open / __stmmac_release are not at the right 
granularity, or there's an ordering issue, but we should focus on making
sure down'ing the interface after such a failure puts it back in a clean
state. I'm not really convinced with the boolean to the release indicating
if something's already cleaned or not.

Maxime> 
> Fixes: 6896c2449a18 ("net: stmmac: Check stmmac_hw_setup() in stmmac_resume()")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 29 ++++++++++++++++-------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 44b59d0f56b5..87cb0978ed6a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4245,7 +4245,7 @@ static int stmmac_open(struct net_device *dev)
>  	return ret;
>  }
>  
> -static void __stmmac_release(struct net_device *dev)
> +static void __stmmac_release(struct net_device *dev, bool napi_disabled)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u8 chan;
> @@ -4258,7 +4258,9 @@ static void __stmmac_release(struct net_device *dev)
>  	/* Stop and disconnect the PHY */
>  	phylink_stop(priv->phylink);
>  
> -	stmmac_disable_all_queues(priv);
> +	/* Suspend has already disabled NAPI when hardware resume fails. */
> +	if (!napi_disabled)
> +		stmmac_disable_all_queues(priv);
>  
>  	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
> @@ -4297,7 +4299,7 @@ static int stmmac_release(struct net_device *dev)
>  	if (device_may_wakeup(priv->device))
>  		phylink_speed_down(priv->phylink, false);
>  
> -	__stmmac_release(dev);
> +	__stmmac_release(dev, false);
>  
>  	stmmac_legacy_serdes_power_down(priv);
>  	phylink_disconnect_phy(priv->phylink);
> @@ -6174,7 +6176,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
>  			return PTR_ERR(dma_conf);
>  		}
>  
> -		__stmmac_release(dev);
> +		__stmmac_release(dev, false);
>  
>  		ret = __stmmac_open(dev, dma_conf);
>  		if (ret) {
> @@ -8356,10 +8358,7 @@ int stmmac_resume(struct device *dev)
>  	ret = stmmac_hw_setup(ndev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -		stmmac_legacy_serdes_power_down(priv);
> -		mutex_unlock(&priv->lock);
> -		rtnl_unlock();
> -		return ret;
> +		goto error_stop_dma;
>  	}
>  
>  	stmmac_init_timestamping(priv);
> @@ -8386,6 +8385,20 @@ int stmmac_resume(struct device *dev)
>  	netif_device_attach(ndev);
>  
>  	return 0;
> +
> +error_stop_dma:
> +	stmmac_stop_all_dma(priv);
> +	stmmac_mac_set(priv, priv->ioaddr, false);
> +	mutex_unlock(&priv->lock);
> +	/* Release the suspended data path before ndo_stop(), which must not
> +	 * disable NAPI or free these resources a second time.
> +	 */
> +	__stmmac_release(ndev, true);
> +	netif_close(ndev);
> +	netif_device_attach(ndev);
> +	rtnl_unlock();
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_resume);
>  
> 


