Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D8DEE0ADC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4QE+5u7IKXQ56J+UI6fOeWNJGfn+xPZSkNKWVeSjBg=; b=S50FZU1pL40Wx1I9E3//pH7ZqH
	OPy4787RVjmeeLIWfxdxetwcw0K5UyouMLl4+RrOjOpd/I0zsN7C8nmlO1yxM2hQlOK413aGyZsW8
	8A0476F52w0g9sl7MXIcB42gZIAht9bYhjlW7k4syqpitccyl6IHE0BTu2zOdcRTNVomRfoAVjwTD
	uiy1A04MdY4wZAsDg4SXdK6tnzTNCAPMQWawT8fzWsFbmPCJaIviqSL5daYhCm7gLaDCCf4PtVObZ
	6dSkt2wLmNnYese2DJuxEu97jYX+ZGnv54TQiwKc+d1vzIkBDDCSTb/DzITaIZM0MXxErehKJDruc
	m7J5SK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojDc-0000000CXEs-3O76;
	Sat, 07 Feb 2026 14:23:28 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojDZ-0000000CXES-2TU5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 14:23:27 +0000
Message-ID: <a736746b-aaa6-4b55-b360-5ad737567e63@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770474198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4QE+5u7IKXQ56J+UI6fOeWNJGfn+xPZSkNKWVeSjBg=;
	b=tO0Piah9mSn6pa9D79ouTMriEFSS8fJHl8ekqOTiwIbuefn1H4fy8/Fbl1yi8GeFHvm9cc
	evZgolb42sDjr2vSXhPM0NODYG0OMujbPRlOahY1dMXRWG7S129JfTWgesg/TK4EpQy0hM
	h4cDzZPplu20gcXmQUE14JAfj8B3/Uw=
Date: Sat, 7 Feb 2026 14:23:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sneh Shah <quic_snehshah@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>
References: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_062325_877226_44A72405 
X-CRM114-Status: GOOD (  13.06  )
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

On 06/02/2026 17:19, Russell King (Oracle) wrote:
> Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
> was missing calling phy_exit() and phy_power_off() at appropriate
> failure points.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..af8204c0e188 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -659,10 +659,18 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>   		return ret;
>   
>   	ret = phy_power_on(ethqos->serdes_phy);
> -	if (ret)
> +	if (ret) {
> +		phy_exit(ethqos->serdes_phy);
>   		return ret;
> +	}
>   
> -	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	if (ret) {
> +		phy_power_off(ethqos->serdes_phy);
> +		phy_exit(ethqos->serdes_phy);
> +	}
> +
> +	return ret;
>   }
>   
>   static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

