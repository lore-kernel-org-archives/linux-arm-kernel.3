Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F1C10A88FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOaBzBZ6vFC1cWJztibQu1Tg6emIBBjdIHsJXRTDpbo=; b=27DPClNPEZyM1azrRe67QgCZdS
	YYyxJWfT/b6S+XQ8nMVK1/wSG3gWEHQm4iC2g/H/OtVvqkZjon2mPHixhSkEE8XGVlh4Hjc36xSZc
	nxOJWgM38U5VeoZfptwzE13lBKTGA8OwaPpfEKqyDVjNQcTw8fSs1J+a9WM+sFVbF331QAN19iAMq
	3tWSV66hZw3h5tgyAEBaRvAnHyyQ9vrX9LbpXkz7yBhH7FwCqLh0y4M7qGH4j0aVR+gwkgQSxYO12
	qkz48V+5bhi/B3xYIX7e0kcwdiVtHVnu/mScmNjdTYG+u3sR47lyE4AcNGzDQx6GWWajfRjOwe23j
	dXbN3NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5p4o-0000000605v-3JKg;
	Thu, 26 Mar 2026 18:05:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5p4l-0000000605F-47dv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB77A43FD8;
	Thu, 26 Mar 2026 18:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FD9C2BCB1;
	Thu, 26 Mar 2026 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774548298;
	bh=qpAtIegWs0nrmgQYz8seyUU8RILvB8VXDiR3yGSyW2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYRvSGgspK+mulzMUQ36UxRvcUstR5rZzn14ac570iMtTy/LIGM/WQmEhR+gRXN8A
	 OyF2HSQocuufy7SRk9CWmxP9fphI0+iEJL9AEV2S91N39YljfkYPAh80tEdxd+kdK1
	 pSKPPdPmWRXAd/zvgMddZWG4hFtEs4meYtL17T+6LL3p6TsdIRK1ci96GS7/zqrpH1
	 lBU/4gQHH6CIEQ1FpFAt19qNfM1qE//Co9Av44XginlsW4ygFksy0DMfnXqbjO7siB
	 d70mCpW42qPFJIXAmGeREuclg8pj3VFN9Afkzd9piMbjQbNuuiIvgdCnL45CAVfF/l
	 +cPqdmU3sNN4Q==
Date: Thu, 26 Mar 2026 18:04:53 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <20260326180453.GU111839@horms.kernel.org>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_110500_042421_18345D72 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> Since ethqos_fix_mac_speed() is called via a function pointer, and only
> indirects via the configure_func function pointer, eliminate this
> unnecessary indirection.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

...

> @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
>  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
>  }
>  
> -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> -				 int speed, unsigned int mode)
> -{
> -	struct qcom_ethqos *ethqos = priv;
> -
> -	ethqos->configure_func(ethqos, interface, speed);
> -}
> -
>  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>  {
>  	struct qcom_ethqos *ethqos = priv;

Hi Russell,

FYI, AI generated review reports that the comment in ethqos_clks_config()
that references ethqos_fix_mac_speed() should also be updated.

...

