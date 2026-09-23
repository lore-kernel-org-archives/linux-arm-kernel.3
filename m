Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D856C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PckSLxc5fmGOmfYCwGJBVkV6mStQJhnt+07SFJ6nFvw=; b=Gp7xcGoMzHr60p5yG8/YI4SLra
	lA+k9E+d3fgj1zfvK8qzJDJhpbeIMPm7NdRkOh4vBtCCCvbvVIt4KoQ2j4nrLp5/lEgb/+Vn4+4Py
	nGtiro8PokTWdLUK8NNutblaxKgtg9+R4qyXFuiPpp0GSfIKsB2EBxBcPaUxRn0L7B0ExkWqf6823
	Fx/QMwOhq+KCmBdI1mGHlM/e9sWm4+aBr5FocgNxzQvslrA53sSyhWaoO1dPTkHE7smeKrx6EtFIp
	c/HAlor3x5TBRWwXwE4IwP6ifuREFfMD4E+JVhcOpPZ/Rtzv29rAumlkr9P1OeAq/y/ii18yn4bX1
	bAs8CoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MYI-00000008JzF-1Q35;
	Wed, 23 Sep 2026 12:58:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MYG-00000008Jyf-3r4q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 12:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PckSLxc5fmGOmfYCwGJBVkV6mStQJhnt+07SFJ6nFvw=; b=oqEX/PI+Upq7e1A6mCfI6mUpEG
	h2NNcyVn1VOtO3pI277z7aQitbnhwDTrpGItPJWJb53Z3eZRZdMJon0wN60rPj6iKXnAf6KE+Duo7
	eqKDC3yrdIG8Hh2tacYfwRgIZYtlIMqxIoj3OdqS57GcS7Pj+qkzYvFhBvntwZ8RM38nFEcS2ffGX
	ItefpxbSvudE2l36Ej7rvHiWk6wBdXRBTR/mebEDf97xdifg1jkMXELCDt9xmiR1FRcXZcWL6cxk6
	JKjv24/YFlw/CPPjTMtwTXKF6xM4vPewsh1ATDEKLoqBAGptn5Cq9N943Ax7HoVYu8lg+qCvpZcuS
	aVONz2dA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9MYD-0000000EmFk-38wf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PckSLxc5fmGOmfYCwGJBVkV6mStQJhnt+07SFJ6nFvw=; b=k9TLKfi5As9IyHEAGalTESGe/4
	bybHd2PePTKD1Bk5p5O02g5B7jyQD+36uOqgxA8kT12BBLYOQYz50sh7MLEQ/umPCNAF4Vftsk8Ie
	qhuR2Y/PgpA3dyDg5H11vT/HfovN7jttiJTWuSygCAcY39TLQsTjjHMIyrggM5OGyGoU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9MY3-006o5K-Uy; Wed, 23 Sep 2026 14:58:07 +0200
Date: Wed, 23 Sep 2026 14:58:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
	mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] net: stmmac: support low-speed USXGMII validation
Message-ID: <828e6cff-79d2-4349-805f-cca927f7b908@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
 <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_135818_342777_65E31B13 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 091c9b57388fa..58ca296fc4420 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -23,6 +23,12 @@ static const int xpcs_usxgmii_features[] = {
>  	ETHTOOL_LINK_MODE_Pause_BIT,
>  	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
>  	ETHTOOL_LINK_MODE_Autoneg_BIT,
> +	ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_10000baseT_Full_BIT,

What does T in 10000baseT mean?

>  	ETHTOOL_LINK_MODE_1000baseKX_Full_BIT,
>  	ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT,
>  	ETHTOOL_LINK_MODE_10000baseKR_Full_BIT,

Compare and contract with KX.

	Andrew

