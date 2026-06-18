Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97167CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=; b=dZr598aLNQEKdjiZfNzYS5JaHE
	psQpSbteoy7bt++50QZ9ItRryuwSb0QzLy2nSUfA8Rk8SPvdxmHYjOizWByJXY7o3Ud7F49FZhOMP
	XP09iZlzaz5YMYZ2UMPXevPOZCVgdHfJgPW2Thx3QMl3MhYE6cJ/e4iRUjSMN0YiQ9CJaJu9LKM8f
	Ggx5M2YvTJH+trWtnAZnl4oEFZWuhrcL9o6nNYIbHCoh7c/YlyxP9GsPBuMNaSWI+DfvZ6/AJqXDb
	Cm//7udfGVO0zpc3W3Yrip1FyR9nepQQeL1psSEJZRhqcnGh4E4wswo2VcrauincxNqToTBWoM30n
	GwYUXEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6w3-00000000kTp-1QWr;
	Thu, 18 Jun 2026 07:13:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6w1-00000000kTC-2C7t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:13:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c891d27b10eso406873a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781766789; x=1782371589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
        b=aM5rl+7Qe2wmSCkVDUjPnR7l6qOhJOU5K5nc0fxTceOsVY1FFp0tPP2jY1xC1Gs8aN
         SXd0Y4XtVOkgQGxP0iRL8EVCy2o1HL6zzzgnY7tKAQZ8R/C5BgfD82p7HtXrBWZCp+z6
         vCn6Xy0SQZtry5eE8WjmoL2KTzf+ftekDsVf8WJ0cpDrktvOSw3n8bIogKfPB3UW19zQ
         tf2hiS7u3Nyr/yYDnWVWZAPgTSOLSzJIxzQAgIMnZQ2AuizL4n2a/8xPGI/MV09hlqOC
         bSVCSocXCUKOEBseD9Lg9IRsSj+9qBc1TDJYAk1hez4lkjk5puiszbvl14lwAPCjXd/W
         VPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766789; x=1782371589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
        b=qjEaVRbzwaf6PdOcT9pR6RJBkBUUxXJMfzEc6Yipi/reSXBKq0iCPtx3k/d9gv9e4+
         3QUyhL5GHwck4YmVRp6Sd0rYNCHi2xQ0XmWG6ANHsYY1vjXVJ4emZ9gexZB3kIkGThRV
         InyeXlBxeqqBlTLIlXpN4K9RmXBhvdp+NimDf909oceVatwtZjGD86e9XU0ytiZG4JVn
         pWu1le2JPerEKl0fjxkQ4WWDy2DqoRrbNULyis3XIp/G/ngo9iCluZ2WxbM47hdpVbAA
         CKlEJObRu+85d31SokOg6i/ekES6AWgoZNsyOo1t/EcuiXwf6thmop10vsEvfc912Aa4
         bGrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/A7/cYL4kIcnyxUpl1h16AcgWop7e4cpLiGNNpPwx7xxpUlcQ6MYswdVxqisBak3rqOBltZ+l8S4MA3Ll/398L@lists.infradead.org
X-Gm-Message-State: AOJu0YytacmUJXPDrPPYC6Ftx8UYiV3AMN3lOQWVOPTL9en/N19EEFbC
	WXQyGYwoYqWzW9a15X52uijMY6xQKOiwqK/+9eKT8ZNj+TnNJJ0B+HnB
X-Gm-Gg: Acq92OEwk8zI7+Rw8ZkvMt4c1p0hFJzq9O7zv1Ai6g9ZDpq9OiDgiN309QFDPlSjIfG
	mm+HjcHS61Qwx++e5gVV6Jjuqxa+i5chzAdKeeCZiQNWvOp5bUM5hagKpTpG/nDeD7TqfiHbhNU
	vO9YTcyBPUnsHO6sh/BzwtQwLsZk1WXj4xQEBLTgbfLqF+zXSoKr7ZnBBmKKVBTX3Tg+3q7G5sz
	Qqz5OKAs4J+ZXccDqHfq0SdHai07I1OgLQdq+gEc27Eznt4352vvRa1o7/trgdNm759SjM3dj41
	SVTbC+sdlXDQiOfLI7WDj8c/XyEUXeUd/12WwX7MLc/ZjUw9H26e6XQbYG9c7jiOaM2yHBL4pU2
	bStMW4UpnKpO5eVXkmL2LuCMUpsrLLdYxNrNBZh6EEZPZnbPM1efyA53WsegiI4eV
X-Received: by 2002:a05:6a20:c991:b0:3b4:65ac:e2e3 with SMTP id adf61e73a8af0-3b9e5b2381dmr3247768637.5.1781766788479;
        Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c889356266dsm3221211a12.6.2026.06.18.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:12:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yixun Lan <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register
 definition
Message-ID: <ajOZnO_dFg20VnEc@inochi.infowork>
References: <20260618064143.1102179-1-inochiama@gmail.com>
 <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_001309_566300_C48CCCF9 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, Jun 18, 2026 at 09:03:21AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 6/18/26 08:41, Inochi Amaoto wrote:
> > There register layout of the phy ctrl register has something wrong,
> > fix it to match the right layout
> > 
> > Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > index 223754cc5c79..6feffaa3ef3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > @@ -18,10 +18,12 @@
> >  #include "stmmac_platform.h"
> >  
> >  /* ctrl register bits */
> > -#define CTRL_PHY_INTF_RGMII		BIT(3)
> > -#define CTRL_PHY_INTF_MII		BIT(4)
> > -#define CTRL_WAKE_IRQ_EN		BIT(9)
> > -#define CTRL_PHY_IRQ_EN			BIT(12)
> > +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> > +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> > +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> > +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> > +#define CTRL_PHY_IRQ_EN			BIT(9)
> > +#define CTRL_WAKE_IRQ_EN		BIT(12)
> 
> Looks like you're fixing 2 things there :
> 
>  -> Wake on Lan probably didn't work before, as the wake irq was apparently wrong.

I guess the vendor firmware and uboot may do something for it, 
but the irq is wrong actually.

>  -> The MII mode selection apparently also changes, but maybe you don't have a
>     MII board around to test this ?
> 

Actually, the only board of the K3 is the pico-itx board, and it only has
a RGMII phy. I even doube the spacemit vendor has not tested the MII phy
well....

> Is it possible you address these issues independently (i.e. split this in 2 patches) ?
> That way, if we ever revert one, we won't re-break the other thing that was broken.
> 
> 

Yes, it is fine for me to split it. I will send it in a few days.

Regards,
Inochi

