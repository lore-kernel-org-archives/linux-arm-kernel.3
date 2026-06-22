Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4938CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5YU1ek1hKhtc/CewB+hEaa4quwElWgeX+xAF+JI5qg=; b=wSwpksxbQ73pvaxWhFfiqk4ay7
	JWcjnMunU4RiA6JMdtX/Xkyyitu9uERxq5Vx1uaEsUv4wiwWgJCkaSvwRgNysbHaB4R9A/X1YCuT5
	LCAInHGPoYaAVOn9Ucguzgzi8Opq9sOa9XRB/g2m85OXzTPotSzekNTsZZF5kUyqUdODJ42dPSuJ3
	lnwCKvY4pwD+tHxTDS++RIHsyM0JqHWiPpwZakIsrJaSWbUmw91OKwjtaG58zYFDziPISxWSKHM71
	S7UevxWvPdG1bthhaum1ex4eZB92yCPbdh2dzDC+jZZqlnGOgScnFYv271h8NhlR05olI8hG6lCue
	SQZt/7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbioT-00000005HAL-1RqC;
	Mon, 22 Jun 2026 17:52:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbioL-00000005H9n-2yln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 17:51:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20BD11A07C5;
	Mon, 22 Jun 2026 17:51:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1B1A601BB;
	Mon, 22 Jun 2026 17:51:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88B5D106C89C5;
	Mon, 22 Jun 2026 19:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782150706; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=S5YU1ek1hKhtc/CewB+hEaa4quwElWgeX+xAF+JI5qg=;
	b=bjPgB5lx1B2g1DC1fdAc26ERdrpILHyBKZ/vz7hWq4rjx81UACjgdxgnp4MysBAJiBXDKC
	UWEpN8G1MT1EZWyQnSKIiA8giPvjQETsoZ0kzs9XdnW4csn9Ai6mnx4dPZKwjsG5RVi16v
	6OtbV3S6hxkz+gnmaMp3cILta5hbTOjFwklOhRM4OuUC9ohDnF7V6Kns4nE0hxeWo1c1Mk
	0D1uQbn+zWUo1YUYx6PeAKLsECC78QYEFQbO33F1jpFgq+iptY48QaC25FM7Q5uLg6w2RZ
	+UAmmDl3pVd60pM35c+JFMS6ZmIR8lwAovj/4EPiaWFzZBrLoaiV1oWFmDSVsg==
Message-ID: <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
Date: Mon, 22 Jun 2026 19:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: fix missed le32_to_cpu()
To: Ben Dooks <ben.dooks@codethink.co.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_105153_899648_6D8A5012 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Ben,

On 6/22/26 16:37, Ben Dooks wrote:
> The print in ndesc_display_ring() sends the des2 and des3
> to the pr_info() without passing them through the relevant
> conversion to cpu order.
> 
> Fix the (prototype) sparse warnings by using le32_to_cpu():
> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 6 (different base types)
> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des2
> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 7 (different base types)
> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des3
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

I agree on the principle, but this isn't a fix so this'll have to wait
until net-next re-opens :)

Thanks,

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/norm_desc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> index c4b613564f87..74c9b7b1fe8f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> @@ -258,7 +258,7 @@ static void ndesc_display_ring(void *head, unsigned int size, bool rx,
>  		pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x",
>  			i, &dma_addr,
>  			(unsigned int)x, (unsigned int)(x >> 32),
> -			p->des2, p->des3);
> +			le32_to_cpu(p->des2), le32_to_cpu(p->des3));
>  		p++;
>  	}
>  	pr_info("\n");


