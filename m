Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55858D29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyxaEzyqyS5lKIDacNW7T7d+urySim2NCgPY0l+EqKQ=; b=gK9ptMXj103yK0tDxr5u0fW3qG
	mHJiLPrMCAUNCLOXp4woU2SNJnQUWUGXwGIVmALl1JvtDg3Os6F+5v6jmNLOGiiH5iRN8+f6TBqxU
	H7iKjsaEL6pFDOvU6s5SFyoGowzb6rnZvt2Zdy6gI2kiPI0VH6DXNbvLQUqlb2xst746PEhNtAPZF
	HlvllHSEaJmJkgXja3jiWvavPx/RLgxgN/RaBSWZy4zaRRK3BAthI9ZNIqV1uyDhpbMO90D+n+P0A
	0l8YNDQ0V4YSYZc9e4uP7rWVqxBXblaE9KgnCnMhSokf7l9WzsGWZ5t2tHWo6tbOHxW4xEm2ytIXk
	BV9fARvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpnY-00000002CgE-0mIa;
	Mon, 19 Jan 2026 14:00:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpnX-00000002Cfx-1295
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D14B60160
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 14:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCEAC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831202;
	bh=MIrQUfbJ2zL+AhG7FyLFIXu3ha5qK8PBOAlkOqBeaxM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=DmBFoPiW4Pc3VtOaIkWpHPVKAE20gAXm01sq6FinoEn7pKU+8VYXvxBxEK8DbM1e7
	 DWxsXSHh/+bgMpWIDXLV0+Mziv/8qp7VrRcl7dBAIBaNhdTzZ/+YlGH+KNL5b8s4rr
	 FKRsM1V2mx4aJ740fMIzSAg/D8MmpWBZD1uQqNd2uKSJlCqUdZuW2vRe/xy6mt9Gmj
	 NAK/0767OcfJRt+MvIk+64ZOwQ0bLXzWyGxgBWiA3YdNg3ZbPuJZ0uWxiUQADgdcyU
	 /AxnbgR0DAtPhEeh4t6l1AnvCmJ0XPEZT616W1ec3HaA2v2QBOngVwNL7s7JPEOM0e
	 XWaekRitK7GHQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b710d46ceso4453857e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkVDWB8yCijx+nmPLdqq4nYlslrPx3SnUj8me5m3Cx7nsmifJ3WkQfrLBxrC8nhupiYx7bn0kvfCISvw/BN/kU@lists.infradead.org
X-Gm-Message-State: AOJu0YxvFY9oWPX8Bx/fPbQu5y6Xhl8qZ/blI1c3uc9tGw7zYU73cAKi
	HV0atVZMw+1b1p/6FOQ3480/HBvcLqMSVI1prsJh+rlz4pCIpuu4Pdb959OjiC6zCE5DUihn+uM
	nnBcwele1OqNOYMLNdtO+TeKsRIIHzFhBImhAdaabKQ==
X-Received: by 2002:a05:6512:3d9f:b0:594:347e:e679 with SMTP id
 2adb3069b0e04-59baeee6123mr4166539e87.43.1768831200472; Mon, 19 Jan 2026
 06:00:00 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 13:59:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 13:59:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk> <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 13:59:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mc-URPkVzEc5Cu54bA021+XaDh3-kZZDSKyNt0V1YQB3Q@mail.gmail.com>
X-Gm-Features: AZwV_QgrQLlVOMTh-pKGr5woCaDOT6WzYHt89q8m_3zdKt2vs_AoPCBMlqv3zPI
Message-ID: <CAMRc=Mc-URPkVzEc5Cu54bA021+XaDh3-kZZDSKyNt0V1YQB3Q@mail.gmail.com>
Subject: Re: [PATCH net-next 01/14] net: stmmac: qcom-ethqos: remove mac_base
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 19 Jan 2026 13:33:41 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0826a7bd32ff..869f924f3cde 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> -	void __iomem *mac_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>
>  	unsigned int link_clk_rate;
> @@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>  				     "Failed to map rgmii resource\n");
>
> -	ethqos->mac_base = stmmac_res.addr;
> -
>  	data = of_device_get_match_data(dev);
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
> --
> 2.47.3
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

