Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E72CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 18:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTLUk2cykw6OFLMC01Dpv7tO1vfeV3GRVIgXsjbKndY=; b=wg1bGq9XhFqqzLLYenL3z06Vrc
	hu7YTAPFRf8AVOQ2k5wlJCDxqYRBOzbbdtxvn8UkQ7CGtBP34gWE+d+OK0Onnmt5wKEzQewxbtny/
	ZfLnJ0rlqVHMpP6encc4MaMOJEfYcQ3pGurZLjK/yQsUtn0hdQGHhpAdVZdei6pEuCwPz0nGKZEiB
	j4hyotWBtxoYom7aXmpYcqSwuz6XE0GEGFKNatWQBq2efGXgyUwKGBO0UQ9+jgcZEfBNx/5TVE0cy
	J5ZlQT23gZHIpakgDNl/FVSuFUXr+fV9VMJnhAyZn4Iu+BZU4iihEKwpbW7ZJ2tc4btqUZPNxF8rc
	pt1gUbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjQi-0000000BeHe-1u8O;
	Sat, 25 Oct 2025 18:55:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjQg-0000000BeGp-1P2Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 18:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HTLUk2cykw6OFLMC01Dpv7tO1vfeV3GRVIgXsjbKndY=; b=Lhs6jECYFlVfRfYyszEQDhrJrq
	jg1Fd892lnyCUXfBbncAgp8wNRGa+K8ldAOvSc37+1mY8N7cBmgyoQQX1/dCIrOB/G38Nq1XANWdH
	9n89I6dSINhe4p3iswDnfIyqY+lEtoNcc4u7orw4+361uzqVvZBWfrYXcvTMOQZUU68TG5jHJ9RGa
	ec7DDl0fE3L2ZU5bhxI8HliaGmzWMQBwQA19HDc6jMR8Ek+0Y9BdAsPyBu77ck3xXPNcuwYtytH+5
	PGxQgJeijxXPQVw0Qw9UBYhXquKd1JgewO9wsRX2JQ5ThzwCKvFpUKkizcttlSrXEGbo1cPUI8dcn
	X4K7mrpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42836)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCjQU-000000000JQ-2u3H;
	Sat, 25 Oct 2025 19:55:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCjQS-000000003u4-2n3X;
	Sat, 25 Oct 2025 19:55:40 +0100
Date: Sat, 25 Oct 2025 19:55:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>, kernel@pengutronix.de,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 01/10] net: stmmac: dwmac-socfpga: don't set has_gmac
Message-ID: <aP0dLKF8rXk6gU8j@shell.armlinux.org.uk>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-1-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-1-4c4a51159eeb@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_115554_393732_E35D7473 
X-CRM114-Status: GOOD (  15.29  )
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

On Fri, Oct 24, 2025 at 01:49:53PM +0200, Steffen Trumtrar wrote:
> Instead of setting the has_gmac or has_xgmac fields, let
> stmmac_probe_config_dt()) fill these fields according to the more
> generic compatibles.
> 
> Without setting the has_xgmac/has_gmac field correctly, even basic
> functions will fail, because the register offsets are different.

net-next no longer has these has_xgmac/has_gmac fields. This changed
on 22nd October. Please ensure you test your patches against the
latest tree to which you wish them to be applied.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 354f01184e6cc..7ed125dcc73ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -497,7 +497,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
>  	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
>  	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
> -	plat_dat->has_gmac = true;
>  
>  	plat_dat->riwt_off = 1;

In net-next, this code currently looks like:

        plat_dat->pcs_init = socfpga_dwmac_pcs_init;
        plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
        plat_dat->select_pcs = socfpga_dwmac_select_pcs;
        plat_dat->core_type = DWMAC_CORE_GMAC;

        plat_dat->riwt_off = 1;

Thus, this patch will not apply to net-next.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

