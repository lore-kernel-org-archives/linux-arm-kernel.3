Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36883CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fobgLX3NRdIxRw7hQBBOhJlJ04lt8DaM/uWv8FFpskk=; b=xbJspFPT/0Lg/ugcM+32o0w67Z
	95fRCWY0jmka2+brVUsd1Gfh04ViRlm8TF6ckmgTrhwvy3IH+Od05nxrwpyea1EDshQEYWZnhjQic
	lCKYeatQVcZwA+fAWLwBD7De543Rv44SSb4KhXiackz3VY6PA9lzoRTqFAD8zY+oF0hRmEYLBpuk6
	1A4zDmTyc/uRieItIKDEtgFJyHIjBVWgyEVNVrs7gdWQVurjH9IQyKYAivnve9Kvd994RajVCho2o
	oQDKm4T64eEJjR6zV8FqWPCepRtBCyZV1+9Skf+VgMRceXPQA8FqdZSygBF0Ju3rkcNEROHSlEzU/
	Ev7ufKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIvC-0000000GAgx-0km0;
	Wed, 27 Aug 2025 16:22:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGqw-0000000FhPY-1U2J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4C4560267;
	Wed, 27 Aug 2025 14:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EC2C4CEEB;
	Wed, 27 Aug 2025 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756303817;
	bh=2mnJ7BqJjiKjx1k4qNtB2x+XuREt1qIWZU2G+JEvDYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs1AvK3MHePNswMm6fIRkInIPsAjmB9ZTarTGIqrbDf6TDRPklhaKpz6KMOzZc0rj
	 TOWKFa5uGXQKmyx++paphCGl7qMRqyj+3jiYTuzqaAfGqt1NmHeyrceTnmP89GCyAp
	 2yfKNrvJRCjIZToLvvqvQWVe5fqZufxRk5O7zTlsCS8jYsXtNpi9YQh8aCqd2Vm8ra
	 SRR7FX7syFNR66wbDiiTPOJL/I1QDr3HDg1ScdMEMvJpeMwgLr0kA0BXIfKRVuSWnT
	 YnaXRgrVxR23F2Pt9TShg9P1JzIvomO08f6IqC+MKYgDReEcPbkvWkf13JtKb+8Vik
	 MR4pvvreMt1jg==
Date: Wed, 27 Aug 2025 15:10:09 +0100
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <20250827141009.GB5652@horms.kernel.org>
References: <20250814135832.174911-1-maxime.chevallier@bootlin.com>
 <20250814135832.174911-9-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135832.174911-9-maxime.chevallier@bootlin.com>
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

On Thu, Aug 14, 2025 at 03:58:23PM +0200, Maxime Chevallier wrote:

...

> diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> index f47ac5f5ef9e..697721a6239f 100644
> --- a/include/linux/phy_port.h
> +++ b/include/linux/phy_port.h
> @@ -67,6 +67,7 @@ struct phy_port {
>  	unsigned int not_described:1;
>  	unsigned int active:1;
>  	unsigned int is_mii:1;
> +	unsigned int is_sfp:1;

nit: Please also add is_spf to the Kernel doc for this structure.


>  };
>  
>  struct phy_port *phy_port_alloc(void);
> -- 
> 2.49.0
> 

