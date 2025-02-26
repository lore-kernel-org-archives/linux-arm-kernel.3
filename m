Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BC6C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=; b=PrQRI9iwXyQxGrW0OJ8Bmo9qz7
	ObRaE5Iqdwn6PcI+RuPPQfGddPkczL2Nwl/ieP0DbXS0Ezr5t8jkRccpiBck2Fitmfi/osYajLH2x
	CGN67hbNnvBfpyLB6DJiwYklQi+cQJvqXBmW3+HczK1RYDxBz7ejTSAbytjNkT1JGe8WOlFlM/gZ1
	KLQtWXnNEusCFOXxCYD0NcVgAD9SQ2SlyZD+Lhm6VCEid3JL9XALmd06sylXC8p87wqNYZ8TuqQCp
	+fI0NeasrrNzW/Tgxphk52vere9scPYiBQs5DftVPd+wW6xZfrOURWNTCsVeYeJzIXaIbR6IEUQ0Z
	t5fjTgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7QC-00000002CmU-2DqI;
	Wed, 26 Feb 2025 02:45:16 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7Of-00000002CVi-3SMR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 02:43:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fe82414cf7so427291a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 18:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740537820; x=1741142620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=;
        b=Id8C2di6KTYmst5AeAJYSvWDETCDuDMuy+1bNrmVhOacL4uF66OFfC1boTEfdXu4AI
         daHZkvJhkJQg/99I6fwrJZmWu2AzyYrZ88fk+vO1mKuXs+NTYMvzz3BDmBZSUtlktUdw
         tFYGTKGxRLdmgJi6nXcCgErPZQ04gtR5B75WyvEvttxxBXvcXX/nLF4i1iFokWYVCZ+9
         colUvxiE0ly+deHvEFOBQVTEVF7eIFIvVOQtxItuLs1NcyRhBbE+XNl7DblgTSK6zmq5
         k/vZNNlkR09H1U2xG3fEB9xmzhOvDKSOUX87nF0jngVQjXr0wFOKl9R1O0DQGssHuLmq
         djUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537820; x=1741142620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=;
        b=ACGqxrv5xIKPD1aVNPUPIz+LQCosUy/GPLbAGqC6P8Dh0ualb8uRsRdFPivHyVN0lq
         iDPssJ8UVn9LYo7450chd9NF3zLbOLiBXKPYC1cQo9SlkbGCY24HelIa+7fasuIMHeXB
         uFT/M/EdXD9t73P/m6+45SfbjKaoIMWiuhwxcaixXqAs1qimopPS9f75OJac5gj22Gvs
         mP5xv8u37+bxv4IJaObBwx3GjiUSWLH0AC53D40XTAeX8+1VvHueb4IJRYPHHag1Cypq
         F2xoTh1V8/BeOUiuGcQ9j645tZpvBAoSn0mFCs1xSgnLXynxjtuY68dpSiJNZ1/Q9QAh
         NXjg==
X-Forwarded-Encrypted: i=1; AJvYcCXdk+f8dcEWY+OcB2bVIG5+FE95kT0Ffs93gkynrmazuXyUNscqVEiryGyRww6Hg7oLDN7fZ4A++psg1HuLrsYb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf8t5P7not+7xOr8cXswue8C/3/bxc5hkK5+6ao8p6U166zlYj
	zyInG5y6RT0nbcpQHXz5mdac64uEAMwTUGSiRBtgRnYzHoWEIm3F
X-Gm-Gg: ASbGncu6+GTkC/tjEOlElBkydYVZTizZxhUWPxwIIYnx5nxasU5FBfqoyNRPHAm1uEU
	F+zafzyM5P+SyvXo6H3DJ+eOBgafH0VLWkWc6XiEItxElGp5OkQJt5amrLDA/A9qWMclOXjgT2h
	KgzVaNcHAzmjnZe8PR6G2ayfKy0FoBuA3dZkoVSrolB+nzItiPoUCTcHxfpkoxvThNCJUS4dA/Y
	1h1zhQCsKFnjCv//OTk2y0m4wQNksASOddX9u1wy/P3KgMM/I3cH/T4qzH84UcW1xHN29cis5lt
	/kSizy0lx+2mnazbS+QWiVU=
X-Google-Smtp-Source: AGHT+IHqWiTmKahLoNDEtQkn8Ysj7aO7VlP6FoYVWXaVQHY/r9/BHTTRDx4CPzCNopfHUXBmu0dRbg==
X-Received: by 2002:a17:90b:53c3:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2fe68adedc1mr8899627a91.13.1740537820375;
        Tue, 25 Feb 2025 18:43:40 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2b85sm326939a91.26.2025.02.25.18.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:43:40 -0800 (PST)
Date: Wed, 26 Feb 2025 10:43:26 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Emil
 Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Inochi Amaoto
 <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>,
 netdev@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni
 <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <treding@nvidia.com>, hailong.fan@siengine.com,
 2694439648@qq.com
Subject: Re: net: stmmac: weirdness in stmmac_hw_setup()
Message-ID: <20250226104326.0000766e@gmail.com>
In-Reply-To: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
References: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_184341_866514_E390E696 
X-CRM114-Status: GOOD (  21.98  )
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

On Thu, 20 Feb 2025 16:17:43 +0000, "Russell King (Oracle)" wrote:

> While looking through the stmmac driver, I've come across some
> weirdness in stmmac_hw_setup() which looks completely barmy to me.
> 
> It seems that it follows the initialisation suggested by Synopsys
> (as best I can determine from the iMX8MP documentation), even going
> as far as to *enable* transmit and receive *before* the network
> device has been administratively brought up. stmmac_hw_setup() does
> this:
> 
>         /* Enable the MAC Rx/Tx */
>         stmmac_mac_set(priv, priv->ioaddr, true);
> 
> which sets the TE and RE bits in the MAC configuration register.
> 
> This means that if the network link is active, packets will start
> to be received and will be placed into the receive descriptors.
> 
> We won't transmit anything because we won't be placing packets in
> the transmit descriptors to be transmitted.
> 
> However, this in stmmac_hw_setup() is just wrong. Can it be deleted
> as per the below?
> Tested-by: Thierry Reding <treding@nvidia.com>
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c2913f003fe6..d6e492f523f5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3493,9 +3493,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  

A better fix here:
https://lore.kernel.org/all/tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com/

I can reproduce and confirm that patch works well.
I was going to leave a Tested-by: tag on that patch if everything looks good enough,
but the author (now copied) never come back.

