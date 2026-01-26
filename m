Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E421D13C34
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1fungMRqIwEEtD67RLo/MLCBER66VTGyBP2jUS9E34=; b=wMthz8qghMGlyBs6Sut+M8kzUp
	TiD7s8Q6qB75L/12asA2ndzZ2j+7J917isChI2eVbABcT5gCqOqEPIv+a5QxRpTjvQkXxDDOqEMN5
	bkvLGlbsgcpvhy5WB/le7gTP4lbXw1LWfG44jM75v4h1BTJo6jbJCKL60E3eCIhh2nfl05g/n7R9l
	OMJc3Odbq8WwXZD3UXHhJYBu/DIuK3r4uKV1LnQAutTatCk4/4JwCbpTwCD4dOTswpuMlbMYSIXko
	mYRes9BMpina59dw7ad06shU9PJHKXe3kUp8nt8Fe5kQizg9bUFJXgOTVIC3NEdfZv0uZqaCgaC0n
	hK9MkJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOTz-0000000Cm6q-07CT;
	Mon, 26 Jan 2026 15:26:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOTw-0000000Cm6P-0ld7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 167EF401B4;
	Mon, 26 Jan 2026 15:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41F6C116C6;
	Mon, 26 Jan 2026 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769441182;
	bh=SRqS+y38YIXOhs6ehnUotQdiVYwta8kYRuUNmf2OMmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uFnm4LGpkWz+9rGWqbjbTkYhQlIVZdBW/EwyRtekVDrdQ1caR9uQeZXFYebihiuw4
	 vuDoe8RjTmdTy83+0hhR7SGWq2uhBFceEsM3x6LmeusdsI1lV/opnKHQt2OZ0iGZIz
	 DkEbKRbdj07Bno5AJp5maVzQenSlEkStldiC1lP9cN/t5AW4i8xNTxf75aFGzTDG7Q
	 hkpyFTm2JsgOYbRctdhgBdHNZi6VO1hYJyIINWKIFJoqRNFORhn7/M6voK4B/0Cwnh
	 +wcllBCvVA3LuTz9Qcm+huRUXFUoc1zTvuYWPHFg+m7J0+ABAAxcmE5ajVaqH9Xrv3
	 4VxmMxAekA34Q==
From: Simon Horman <horms@kernel.org>
To: dan.carpenter@linaro.org
Cc: Simon Horman <horms@kernel.org>,
	robh@kernel.org,
	kuba@kernel.org,
	festevam@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	shawnguo@kernel.org,
	mbrugger@suse.com,
	mcoquelin.stm32@gmail.com,
	linaro-s32@linaro.org,
	davem@davemloft.net,
	s.hauer@pengutronix.de,
	edumazet@google.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	Frank.li@nxp.com,
	chester62515@gmail.com,
	netdev@vger.kernel.org,
	kernel@pengutronix.de,
	pabeni@redhat.com,
	jan.petrous@oss.nxp.com,
	linux-stm32@st-md-mailman.stormreply.com,
	s32@nxp.com
Subject: Re: [v4,1/3] net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
Date: Mon, 26 Jan 2026 15:24:30 +0000
Message-ID: <20260126152430.1390514-1-horms@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_072624_275932_7E3582E2 
X-CRM114-Status: GOOD (  12.52  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
    net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII

This commit adds syscon/regmap support for accessing the GMAC_0_CTRL_STS
register on s32 chipsets, while maintaining backwards compatibility with
the existing direct MMIO approach for older device trees.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..2e6bb41f49e1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c

[ ... ]

> @@ -40,7 +44,10 @@ struct s32_priv_data {
>
>  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
>  {
> -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	if (gmac->ctrl_sts)
> +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	else
> +		regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);

Should the regmap_write() return value be checked here? The function
returns int and the caller s32_gmac_init() checks the return value
expecting errors to be propagated. For comparison, dwmac-sun55i.c in
sun55i_gmac200_set_syscon() does check regmap_write() return value:

    ret = regmap_write(regmap, SYSCON_REG, reg);
    if (ret < 0)
        return dev_err_probe(dev, ret, "Failed to write to syscon\n");

>
>  	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
>
>  	return 0;

[ ... ]

