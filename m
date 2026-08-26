Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A6CC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J+94by0KWzCTNzt3+OAztwAe1j7eQMzuqcXsoony+k=; b=CFdk7a3NMV0QJDda08MJmC9qok
	OPF5uahPr8Ag+9PNxwnZEg2p29SfiliBSG9LFchVrvBwRH6Dkcb7L5KciwPE5I2FhPcVqhZVkwx2Q
	1IXkZNtLac1CzkK8zRDENaoQx9zKCZYGwRG04UdmFUwOZRvfB6oBXe8RN8+5tEiNVmYT625UF8ids
	WAM29Rk9iHIfTtpxmfWC0C9FKS7wb8b4RVvULHTZRMjhCb/23fJTKyGzgVklXaM0GREzlENYQcBz+
	WfC8g6TgqoQ9cZrF4gZbU9KhfPaYtaTxSKDYEcbblC+Flf6yX6mBEjlXudvnS0TBHR/pL9NKPl+kU
	ZUCa0PnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIF5-00000002rrz-1qwX;
	Wed, 26 Aug 2026 18:20:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIF2-00000002rra-1B5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 18:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3J+94by0KWzCTNzt3+OAztwAe1j7eQMzuqcXsoony+k=; b=FLBJ7HbfjXV/nWArtIMk0naaBp
	Lak8kevUYOs+7jaUtJtXYoaZza1a2H5oLM4cow+hDurvz+i64tvoBVHRWKn3O23zIWOkzFny3bxkc
	8mBMkuFGBRquhShfDvV+NzPdILWQzRIfRMBGEl/bSNSHYQAN1zkEPE0gxf2yLiDBdU4E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzIEc-001Yfz-Dj; Wed, 26 Aug 2026 20:20:26 +0200
Date: Wed, 26 Aug 2026 20:20:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net 2/6] net: stmmac: dwmac1000: Account for the primary
 MAC address for UC filtering
Message-ID: <3c8d8053-fa47-4a2b-839f-592c45b0e080@lunn.ch>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
 <20260826140500.616466-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826140500.616466-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_112052_351915_63F941E5 
X-CRM114-Status: GOOD (  10.77  )
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

On Wed, Aug 26, 2026 at 04:04:54PM +0200, Maxime Chevallier wrote:
> The same filter slots are used to store the main MAC address as well as
> the address for the unicast filter. Let's account for that when deciding
> whether or not to use promisc when programming the UC list in hardware.
> 
> Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

