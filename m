Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BB2CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcVMv81811zZuAv2FuonuKSFUIjIBAqY9YBibiFltS4=; b=43PT7ndZl4FXQB0kRJosrhn6vI
	yVrgXQ9MYiyzXHks9/TKFt2jUckajxOgmplKJZU25NcPMIbeJ3ZDSDakQ1upSJsD12GnttYcAE0y9
	jgH+4K7KojMTWlASc3WyEooYqLXG9PZE9BUfVOIWS3pOjIQM7ZmGpVEiQKwa+bq/+SxtqFkFYVl1Z
	3cK8JJ3JMXuXUlGeygO3BhtjyJ4Bl9OkE0v/6kTrajPX8Pu1PjsfeU9JyX/+PGvZ6DMcu9tK6H0s9
	drSHchMT1iKz0N4qdYA5yMIQLO1vgE0+q7tBSpqD9vm8XOd5w1pVtGm4hE1xVcFQ71rTBOQIYY1lx
	/9nwIE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFX1g-000000086DC-3fRG;
	Sat, 10 Oct 2026 13:22:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFX1e-000000086CE-03C3;
	Sat, 10 Oct 2026 13:22:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791638521; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dD2gFjlbKNoAl8LTV75sK9VXGb7c7D2nja/IdlD13MvBaNvNn4+3enQUGEPSn1bVUpnv4GH5D006AzpsHyb6NIqR1eCxNqvngLW+xust6QHTsdJ2QaQdBsZidF3RyKmDzxMO1MlfBrPvb8iCrnR9qVANLFCGDc78+0ed154BUMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791638521; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kcVMv81811zZuAv2FuonuKSFUIjIBAqY9YBibiFltS4=; 
	b=XyjSZBsJxu0e6lteqZ47727sNylQS80cuJcxtpX9oUqsmo+pAfboKegDpMlyZ2eXcM9nB590ERRPgGNgQ40vx+n2QPIb8rX6/9WnplcC/vLB8KP4i0P4210hjdhDs9qEQjls4LX+RTxfrDjfFIhdr7+4G6ZlFzWAYwbwMXUrM74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791638521;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kcVMv81811zZuAv2FuonuKSFUIjIBAqY9YBibiFltS4=;
	b=SFlalIgSeP3zaMP6VPGO7p4PDiu3c6Eqoa8nkuvLg9ifm2r7sLMsqkKF/zIul6Cb
	C7NfoS9w5Gd+EHYW16ky0t8G1IdtnJPu1vAakoNQtDI5TxuecoHB7n7C4mz94aGNLse
	rPlpxc24X2XblYNlB4ms6gA6JM4iL/alk6pPR+Gs=
Received: by smtp.zohomail.com with SMTPS id 1791638520514317.5735096552768;
	Sat, 10 Oct 2026 06:22:00 -0700 (PDT)
Message-ID: <c746c60f-cc12-4827-bef2-1d1d6f605d0b@collabora.com>
Date: Sat, 10 Oct 2026 15:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] phy: rockchip-samsung-dcphy: Factor the
 transmitter teardown into a helper
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-5-f1797634233d@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-5-f1797634233d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_062210_128199_94A74AC6 
X-CRM114-Status: GOOD (  19.65  )
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

Hi Jason,

Thank you for your work!

On 8/21/26 14:02, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> The transmitter's power-on path is in samsung_mipi_dphy_tx_power_on(),
> but the power_off callback still does the teardown itself.
> 
> Move the teardown into samsung_mipi_dphy_tx_power_off(), so that
> power-on and power-off are a matching pair. Both callbacks then have a
> type switch whose arms are plain returns. Turn each into an early guard
> for the not yet supported C-PHY and drop the unreachable trailing
> return.
> 
> No functional change intended.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 31 ++++++++++-------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index f58907dec733..5d9d44a1d6a2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1361,37 +1361,34 @@ static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
>  	return 0;
>  }
>  
> +static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
> +{
> +	samsung_mipi_dphy_tx_lane_disable(samsung);
> +	samsung_mipi_dcphy_pll_disable(samsung);
> +
> +	return 0;
> +}
> +
>  static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	switch (samsung->type) {
> -	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_tx_power_on(samsung);
> -	default:
> -		/* CPHY part to be implemented later */
> +	/* CPHY part to be implemented later */
> +	if (samsung->type != PHY_TYPE_DPHY)
>  		return -EOPNOTSUPP;
> -	}

What is the value of doing that? Personally I'd leave the switch.

Best regards,
Michael

>  
> -	return 0;
> +	return samsung_mipi_dphy_tx_power_on(samsung);
>  }
>  
>  static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	switch (samsung->type) {
> -	case PHY_TYPE_DPHY:
> -		samsung_mipi_dphy_tx_lane_disable(samsung);
> -		break;
> -	default:
> -		/* CPHY part to be implemented later */
> +	/* CPHY part to be implemented later */
> +	if (samsung->type != PHY_TYPE_DPHY)
>  		return -EOPNOTSUPP;
> -	}
>  
> -	samsung_mipi_dcphy_pll_disable(samsung);
> -
> -	return 0;
> +	return samsung_mipi_dphy_tx_power_off(samsung);
>  }
>  
>  static int
> 


