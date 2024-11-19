Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0666D62068
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYp2EhsrOy+fm7DQ5XYuyvMYHISzNVIRGVyJH9Vl8BI=; b=RtwN4gs2mbWpd7tWqIi/McQPi0
	vAP5rwsjcNjFo3p4O3tygsR/9iwEc34rAAzo33rb8kHP2stk2wEf0CKwDcL8j25ExvD9scPLQluuK
	T5xkBNbila4A2a8kiReibanx2T1vimOuZT5a7nciQFXSr5rTH/uUKAAq5ygueCrQ1FxMYWQ29U5is
	x5UGfGowxDPWkdqFH6ichJRlbfuij7Y7BIgWYg8xki7ceb73AGJTfbt3Spk58M6xrgxGDHPW7PDkt
	TwstTJee48Hh6oX+l4Zw6J+s0KKQPuU2pGobMYsTxTZLT9+HqjZnLgi348rX2WvdzT+RCt0KdH9NL
	oMKMoqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRbY-0000000D8u5-1e31;
	Tue, 19 Nov 2024 17:01:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRLg-0000000D4qI-2dY5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UYp2EhsrOy+fm7DQ5XYuyvMYHISzNVIRGVyJH9Vl8BI=; b=Zmv3nVP0B0d3Sm1BxqXb2DIPt4
	alK7Wh8STHt1wmp0zhZjw7IdsZInbIzrFuprq3YjeSq88L1RFEP4SDHCDzLLiijbBCdjRCB4VaKE1
	DOL61uLfQMok5ZGT6CXliwmaGQVNTzdH0CczIK2Dv4dHwr5XLTddCO9YmPXJbHSMLvrP/mZpe0Ulj
	R6vfVR2G7c2L/9Ti+RR9GcXe3TaLDgFxfDY7b7uGzFy4TAsEtiRWA3zSjG94vlwwpb+43buH7X4af
	3EYFu2p7OqtT9XWyMMb4tYEGCrRQQ0Q6JP614+QFmpPcEP4LPgoGZARKCeo/69Hji0aJH278xGN4V
	dT2XJiZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDRLK-0003zE-2T;
	Tue, 19 Nov 2024 16:44:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDRLI-0006DJ-0E;
	Tue, 19 Nov 2024 16:44:44 +0000
Date: Tue, 19 Nov 2024 16:44:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v5 07/16] net: dwmac-intel-plat: Use helper rgmii_clock
Message-ID: <ZzzAe8s2UgPYHnkv@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-7-7dcc90fcffef@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-7-7dcc90fcffef@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084508_666012_53891830 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 04:00:13PM +0100, Jan Petrous via B4 Relay wrote:
> @@ -31,27 +31,15 @@ struct intel_dwmac_data {
>  static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct intel_dwmac *dwmac = priv;
> -	unsigned long rate;
> +	long rate;
>  	int ret;

So the following becomes:

>  
>  	rate = clk_get_rate(dwmac->tx_clk);
>  
> +	rate = rgmii_clock(speed);
> +	if (rate < 0) {
>  		dev_err(dwmac->dev, "Invalid speed\n");
> +		return;
>  	}

Now that I've removed the deleted lines, we can see that the
clk_get_rate() call there is now redundant. Please remove in
this change.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

