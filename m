Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F4CFC269
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qn8oEqQjcmd6CEjxpqT3b2zYZp/Y/5mbvScnLweKkFw=; b=gWc+jyG3ZbnJMKkUVRzMIyrjMD
	8Dpr75WdSqeeyXDhreOEqmspWi2OVnKWwhPpF7UsVjV5fWvGocM3qdEihtU2xzpgAlkJnHRZdD4yx
	8GhN2Wd0IpVr4zChQJlvWKGNxJRcsefxHWiHbFqIgBA4fjodmrnFaynfGqN0aLc3E10j6PULKzgVD
	ttYlxvAvB63KsAjItqRooliOJyPgOyz+W3/t0AwRnqV4eWAD/VNK/9ec6eDeOENZxdS+UZseBEw5B
	4BDGHG2HuuEeMJAl4aH4AbV0ehotHjONb/nRbeSiZIf+pSnArF2ZBb6q2oJME7hq0aGTFRw++fqjz
	M0cfJuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPs8-00000008LE2-2q3p;
	Fri, 21 Nov 2025 12:04:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPs4-00000008LD1-38mb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 12:04:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64D1A4E41831;
	Fri, 21 Nov 2025 12:04:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A6D760719;
	Fri, 21 Nov 2025 12:04:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA70310371CF6;
	Fri, 21 Nov 2025 13:04:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763726647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qn8oEqQjcmd6CEjxpqT3b2zYZp/Y/5mbvScnLweKkFw=;
	b=n5935cNgfgt/0SF2ev9crcoHzpfkF0g6foJM3k7UmpMwTDk86jFs3UAeEj1LqKVdKITqwQ
	EbJ9O/jKx4bmFHRpuN9JwYl2EXIcGxJXmIxDm9ToYFTBPCdaAJfRI8lC3ly77Zklij9e12
	Gay1jhrRaWeniUh8nV42T8Wb/211FDXCW7Ui2lu3tSSYWKG6oAZ5iD7w+wuYlp1+cZYbxu
	qFl19DUhLy3KRzA+FnsTwrNuBUhVd5e3Jwilo65wWaptX5rkLQtyzhmc9xW53zTwicKpaL
	81/pe2Wk49SR/i7igajQHrxFt6dKwfw0QVnz2OxaV6LCtXBzHMzFTWBgMtiFHw==
Message-ID: <0423d36b-05fa-4a2b-858c-e6ef5ff1560d@bootlin.com>
Date: Fri, 21 Nov 2025 13:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: move stmmac_mac_finish() after
 stmmac_mac_config()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1vMNoX-0000000FTBd-3Oup@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vMNoX-0000000FTBd-3Oup@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_040413_112672_BE402E42 
X-CRM114-Status: GOOD (  16.08  )
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

Hi Russell,

On 21/11/2025 10:52, Russell King (Oracle) wrote:
> Keep the functions and initialisers in the same order that they exist
> in phylink_mac_ops. This is the preferred order for phylink methods
> as it arranges the configuration methods by called order.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 970c670fc302..d16e522c1e7d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -932,7 +932,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  
>  	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> +		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> +				       interface);

This is just a line wrap, I don't really see the connexion with the
commit log :( Some missing hunks in the commit maybe ?

Maxime

>  
>  	return 0;
>  }


