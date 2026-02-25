Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F836F55425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHQn+1Y/RIDhNOnBfVs8UJp1iuSINWhCXc6zerNQ2ZU=; b=yVmaR9GaTMcYdptu+WcJ4d+8Zy
	H+XdHHnoOUIRlkhHXYduMPP8EXoxuU+pSVxcZSsT0k7pP5AbXDvEQYFu1vwSzJb6fxnNjAqD5p5EW
	2Whs7OdCpIRVvXdbshQuYJ6/WLMhSpX9GYXe+CT2X7npru3rUqtl9YqC4pdzTDPDllYXCeQn8CaKm
	ttCULodBrBUavXL9OF+TQ+7PhDKVfNSESxDytMX13hBBb4xQxOf+2CLn6hzNKbxwSPs0/DnbCa6Yg
	pKauu1FzIKGJF67qMgWq0wsOvfpvKTsrMARSS6Ao4X5c8SmgbfAKOm5qLlWlTWp+6zNEpCpKMIEkZ
	JCbrbyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3QW-000000031Ah-1SL6;
	Wed, 25 Feb 2026 01:10:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3QV-000000031Aa-33oV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFB8860018;
	Wed, 25 Feb 2026 01:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBC9C116D0;
	Wed, 25 Feb 2026 01:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771981854;
	bh=sb7j1FL99ZUX0T3ABzAAqtzGtBkmFP7NpZyq2s72B98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J9E+hMv4EGdU3/NuAZQTjdWRKpEKG6PRrzMaedXu8Lx74VL8BSCUAtB/DDU6jwaFf
	 B+O527/W3ACnovLfqx/LpN7nIZoKIcOgqSaDWyX7tTomyta4oeEme75rzMDoDCr5Bq
	 3T99R7rEDOlr3zqD4jO0ufHCE0xLPjdh/78SiSOoGkQuWEo25PTESlDQIyIRlyaOXI
	 qdR98BSi8EQzxU/rUureK3Qthuyudm37g3ZbydhUoZGkMbjE71HQmr+V96KtR4YqsP
	 rmXXej1yZvAPWrbkQieDoWQHQBqi+1CXi6NvmA7UYshYh97NZIivQ7P4BLY7GLWKL/
	 ETsVknfyOsCNQ==
Date: Tue, 24 Feb 2026 17:10:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank
 Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <20260224171052.27bebff0@kernel.org>
In-Reply-To: <E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
	<E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 23 Feb 2026 09:34:51 +0000 Russell King (Oracle) wrote:
>  	switch (speed) {
>  	case SPEED_2500:
> -		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -			      RGMII_IO_MACRO_CONFIG2);
> -		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> -		ethqos_pcs_set_inband(priv, false);
> -		break;
>  	case SPEED_1000:
>  		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
> -		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> -		ethqos_pcs_set_inband(priv, true);

Not clear to me why rgmii_setmask() goes away in the 2.5G case?
Just checking it's intentional..

