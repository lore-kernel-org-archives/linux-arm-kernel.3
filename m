Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DF4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxF4Em4dXaaYuu8ttEyg/Hrq7g1rsZMJeJFp3mKDuWk=; b=381uf1s7GWHjLtpc15ZQQ00xsK
	ibHXq5g56tv6H9svO2eP0b+j8FBi6lwW6EZaYVDBdbD1zl4LP4PJpadF1gsiIeNCFrn+e/pZo4Ljb
	PC36N80ljYOSiCFhCVO0N5S+VatlAMDfCtTol4/gj1dxgFwY+IGH59eE03nuaPiNhDD/TssE/5r2a
	D1xnK4rAleK/Ew9+1NNrW4XTYjzTQ0HshzWmsgtVHLWr9OatIx0+hLiC7IbAQRy3u3KZb5yN4c0fl
	BvpvbEDBl0hMlEzETEvBX1LbeC4w3wecg9HVXuNb/Dw1VeY4iB4YUQI25mVDPx7YDnu004m2RZSzx
	K2F3ko6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NE1-00000004lAq-1Bx4;
	Thu, 16 Oct 2025 12:36:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NDy-00000004lAU-44XZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A348943394;
	Thu, 16 Oct 2025 12:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7D2C113D0;
	Thu, 16 Oct 2025 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760618214;
	bh=rWo5L43Wc3sm+4xT2/uBYLFVmx0bMIQ/PWAvIzOWufU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwiTDTK0gLGZXQE1l0ADMryUJjR9GTZMa2eNNVrsEHwO61+qcOveY91BrUHlsy3jD
	 bs+Os5OmP32KJuLwI3/cCeT3bu4jorr2kobS7TZnEeRdfqM6hyb5cBk4k0lq+OlpX+
	 2vFK9Ss54Cs765ahcx19wfI7VfnAIKuuqZaZOE71YajqeI6PgkU1TdKDrj5ghfT/Vb
	 PnBn4wvJAFlyVQP1MYmsY9zv+uFM73Y+OyQJ50fxehDvxSqRega70Utmw+S3sCYTkr
	 WDZzLC+KSXxVsxxeLkEXIHi6VlHruA397fKOorRpSTFoEm3hLJJas9gj123k/GKor+
	 5dvPxGnSOqlyA==
Date: Thu, 16 Oct 2025 13:36:48 +0100
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
 value of phy_power_on()
Message-ID: <aPDm4OMiM7Ug9rDf@horms.kernel.org>
References: <20251015051446.2677-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015051446.2677-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_053655_028435_247A70A0 
X-CRM114-Status: GOOD (  24.94  )
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

On Tue, Oct 14, 2025 at 10:14:46PM -0700, Lizhe wrote:
> 'phy_power_on' is a local scope one within the driver, since the
> return value of the phy_power_on() function is always 0, checking
> its return value is redundant.
> 
> the function name 'phy_power_on()' conflicts with the existing
> phy_power_on() function in the PHY subsystem. a suitable alternative
> name would be rk_phy_power_set(), particularly since when the
> second argument is false, this function actually powers off the PHY

This is two changes. I would lean towards splitting it into
two patches (in a single patch-set).

> 
> Signed-off-by: Lizhe <sensor1010@163.com>

Also, in future, please wait 24h between posting revisions of a patchset.
And note revisions in the subject, like this:

  Subject: [PATCH net-next v2] ...

https://docs.kernel.org/process/maintainer-netdev.html

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 51ea0caf16c1..ac3324430b2d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>  	return 0;
>  }
>  
> -static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
> +static void rk_phy_power_set(struct rk_priv_data *bsp_priv, bool enable)
>  {
>  	struct regulator *ldo = bsp_priv->regulator;
>  	struct device *dev = bsp_priv->dev;
> -	int ret;
>  
>  	if (enable) {
> -		ret = regulator_enable(ldo);
> -		if (ret)
> +		if (regulator_enable(ldo))
>  			dev_err(dev, "fail to enable phy-supply\n");
>  	} else {
> -		ret = regulator_disable(ldo);
> -		if (ret)
> +		if (regulator_disable(ldo))
>  			dev_err(dev, "fail to disable phy-supply\n");

The 'ret' changes above don't relate to the patch description.
I'd leave this be. But if you really want to go this way
I think it would be a separate patch.

>  	}
> -
> -	return 0;
>  }
>  
>  static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,

-- 
pw-bot: changes-requested

