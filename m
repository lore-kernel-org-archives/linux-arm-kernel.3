Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07774CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJNcRjw5toGkbDMbVP0D+FBSoxAKho17jgy82++k1Xw=; b=3tKVtoIqYmxi+FsXIVhZGycoZp
	NDt94v4eHXgljEo5SlJsEIfxCuHz7yoXQ0MWaq2qBoAXzxpy3g10I8VQUE2G5ipODUuFmLAea8vzT
	1bc9QA9ibdIjqWCvxEUeR2k7b6ClorjMpWYaNTLd02kgNrNH0Zwgvb4+qE01J45D1jYmcxR1Gyxs9
	/8MI7q1jfKct2PuaLd6nkCK3SSl+XAT2Xl+VGZ7wIb6ODN12db6qNNM4ZTA8oByk/SEEfQO0BbbYt
	88KEOFvKkRsfadplMT6Y1anB3J+KEfQhJ8K1J4IJrVCe39LnE17ku86B6sErsWHgGtBOCo0izFGLb
	GTX78O6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4Cx-00000005lsh-2yjG;
	Sun, 24 Aug 2025 06:28:03 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq40G-00000005lAr-3R3b;
	Sun, 24 Aug 2025 06:14:56 +0000
Message-ID: <277661e8-dd75-475e-b798-b384a66c7a93@infradead.org>
Date: Sat, 23 Aug 2025 23:14:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: fix stmmac_simple_pm_ops build
 errors
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
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



On 8/20/25 7:30 AM, Russell King (Oracle) wrote:
> The kernel test robot reports that various drivers have an undefined
> reference to stmmac_simple_pm_ops. This is caused by
> EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
> and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
> which still defines the struct non-static.
> 
> Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
> means we always define stmmac_simple_pm_ops, and it will always be
> visible for dwmac-* to reference whether modular or built-in.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508132158.dEwQdick-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508140029.V6tDuUxc-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508161406.RwQuZBkA-lkp@intel.com/
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a55e43804670..fa3d26c28502 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8024,8 +8024,9 @@ int stmmac_resume(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(stmmac_resume);
>  
> -EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend,
> -			     stmmac_resume);
> +/* This is not the same as EXPORT_GPL_SIMPLE_DEV_PM_OPS() when CONFIG_PM=n */
> +DEFINE_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend, stmmac_resume);
> +EXPORT_SYMBOL_GPL(stmmac_simple_pm_ops);
>  
>  #ifndef MODULE
>  static int __init stmmac_cmdline_opt(char *str)

-- 
~Randy

