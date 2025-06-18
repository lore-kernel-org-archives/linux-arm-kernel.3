Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28691C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0GvrF5UwjnnYBlQNx0lPww/BP19X0MBtTi4QaHF4ng=; b=VQCdqjyGEx7HhoytCIbnlfe71y
	1zDUr3DeK3FvIe2BrFKitq5IV7w1Qkd0B7D7zs1yei08qxmeRSWeiU/M7muIYEUfd9r/h6go/mgXI
	JLMKYCiVgjLNTsRk69XjQBOgE4GxaSSn/nu672xiadm10UE42TObLngujgfKxy2z1lmC8nU1Xa6Mx
	RfhXotlMxick5sf7mzW8Wqu991xLtdTpU9KQfCSXPEb9iqvT5WP6hWs7x6jl+Cv3nZFcOy1hYhxIN
	wgDWe8CLmTfA8BequgR/MSsiMSKMq2QNw8i1WBhhegWeYNnKo6iEZyoIFUc6iDVVydf2MXMBey1WL
	8F4F6rrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyKg-0000000BCox-2M7u;
	Wed, 18 Jun 2025 19:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxbh-0000000B5IF-1yaQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93B7E61F1F;
	Wed, 18 Jun 2025 18:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C8EC4CEE7;
	Wed, 18 Jun 2025 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750271636;
	bh=kpSEGRfAU9fOVbtCMrVZ+rQ1aeDB+P7Ft42jygFEEhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3Ej2aul6fOJdod+0Bbxj0EYeWA1n+Nq1rRrj2roqfVx8U5wc9HLvaFtQ/Gl+sX87
	 DVlw0BCrspfewDTpmNpbKVx5NKWLTN6j3JaLhozqVKHvBJRbJrAeiHFjzJANJcHvru
	 ady7/4IUV0NdKjQIe1n6y1eQPhCTWlo3fImZ/x7KWqP4G7Pi7Voyo3jMtMZaU7TS1g
	 2Z8fBPysGH7TIfjr3E84ZogDi7vPuFu4iBSlaUrSlAiuJTiQMrAe29qWgU6+tzKTRt
	 Da8MhNQmLQ0fOi+ywjmv1dXi7e4bx7W2YI+ojHWczLCnBetGloAn07w6VGIrBPt1LS
	 EN19s6tQH1ViA==
Date: Wed, 18 Jun 2025 19:33:51 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: loongson1: get ls1b resource
 only once
Message-ID: <20250618183351.GX1699@horms.kernel.org>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
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

On Wed, Jun 18, 2025 at 11:41:14AM +0100, Russell King (Oracle) wrote:
> ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
> which GMAC block is being used. Move this to a separate setup() function
> that only runs at probe time, so it can sensibly behave with an
> unrecognised resource adress. Use this to set a MAC index (id) which is
> then used in place of testing the base address.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


