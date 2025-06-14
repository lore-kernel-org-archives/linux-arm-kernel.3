Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D925C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+Rleva02pxBGJGUPdSA4tA7/nYAMtqWxe2IVaGtxa4=; b=txozsEXmDBt5hf3Qty/5z0WaF9
	A+ZahZHvcilDvYNTwPJxrIhIjuknKCx13CQogNRZZQYbP1k4NGOLiHBVYSdHJYS6e/3xK82GOcaFG
	A4fw8MyCDaIDHqLy+tjqcp/0///aZmMGKxRczqSnd3u4l82jONvTau3PeEHXMi1yRSU89Dq10/W+3
	xwCCrMtQYuUhwtGdhuIaW4/ZPoV4n504klZMh+d07praaPYP9NeR/GmfGb+b3A5pM4u8np488P8ya
	fKH/h9/fJHl9JLRMI3iKB+MplotRH1wSig0h0v9MfygOGtne2zLzOxQubgaLKeIGHlvWVzNkXPPT4
	S+IShz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQSx5-00000001TlP-3Chc;
	Sat, 14 Jun 2025 15:37:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQSuf-00000001Ta4-1EIs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 15:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A50861126;
	Sat, 14 Jun 2025 15:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FDEC4CEEB;
	Sat, 14 Jun 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749915317;
	bh=d/EY3r7M0Oqj/yKEoNpBZWTyk+esJAhtZ5aqvrMM2to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBrYjt+TsccDL8IyUV+0MyZuV+x2m0KQPMmUzqif+KvB70rMn7led0twGlZSOv+t0
	 wqPvrCyT+uA9Z5XOlOIdI5pcbu5oVCQgUJvstu7ldKG+0EPa0GDztZqOzyorcowOzw
	 4EBw4ObYoPcpy1d2xDYeU7Pz3mRHeHV+//E0H3qunHYBQ0UEorJrMi9euNHELcqIze
	 eBLmuhZ4cmO+hJHlfjLgsN+nBTr783gvtcdcrg6DfSc9sgF8dL8wyoqJdlweEZA1MQ
	 WIpCt2olStUt4E/jeV80IUcYJLSSgGemvn2xJ95HMx53m0jOpHWiESG443k3f+VgZ+
	 KRQOty20KW+zg==
Date: Sat, 14 Jun 2025 16:35:12 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
Message-ID: <20250614153512.GQ414686@horms.kernel.org>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
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

On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks Russell,

The nit below notwithstanding this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e30bdf72331a..2e398574c7a7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
>  	}
>  }
>  
> +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> +{
> +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);

FWIIW, I would have gone for the following, as all the type of
three of the trailing parameters is bool.

	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);

> +}
> +
>  /* On interface toggle MAC registers gets reset.
>   * Configure MAC block for SGMII on ethernet phy link up
>   */

...

