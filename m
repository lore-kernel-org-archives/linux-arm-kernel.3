Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DFC55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzrJkwrJfsf2rrodj1Wh/NjOkI2xIwXy72z2ZA+RwDE=; b=mjSpFJdfl82qcnDIQWDghQnknc
	CeotDvDc3mivKFtm1mN/WXlQqAw5pys7JyP+KB3NC8UNTkx6oEf1n/43mU8cY7mseQIIw8VSNm79X
	LJz9I3n7kENDJpurekk4I2ZIz9nRYAo539rkWi+MXoyGb9chJtsBnxhucUH1Ps9Mbu32di04RmoUL
	VQwbxxCYRH/fwhy9wxVBfscOrhJ4ysoZmhjS7zDA0HdGHf04+n3eCjT/P1L97rHfSefXdMhG15FEB
	o5zx2HqL9CCjaa2oUg8J1iD5034sXihlW8Ju1jxpT+i/FFntzpYJt/xGqKbgB7QZcdFUjGMmcs8pa
	HDDdjpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzGJ-00000000V7D-23CD;
	Mon, 03 Aug 2026 20:27:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzGF-00000000V6K-3bUg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 20:27:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 814911A13E0;
	Mon,  3 Aug 2026 20:27:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E6066029B;
	Mon,  3 Aug 2026 20:27:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC6FB11C31895;
	Mon,  3 Aug 2026 22:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785788857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BzrJkwrJfsf2rrodj1Wh/NjOkI2xIwXy72z2ZA+RwDE=;
	b=nOquFb8lsI+2DkBXVoUXBrPHiv8VeEDfnU9qRa9kdgYnLrJll52PYpxHkwCslubu3N+hCJ
	tWOGsLtMoq2V7p6nutpNrRqsHJCWU/UJ0eghwfOT8Wd+3Vgz6dbvMivgaYNHAhT6nU6YEA
	IsEdu64pL5LnCctzaq/WMLDzxCv+7bFSI8D8QOym5DAke7rjuMSQUR+XO96KpvpLtKois7
	OId2/u38wA72ZS9WBvaDaKV5Pr1yRl+r2s5yTgoMAG5pS5ATA9hLHk7teTaZHEPlloL9p9
	1f+7CaAjx9rUoUnSFex/snQlTcAzN+6B4ak2RpdqfXSYIBQJqW+xlJuF+lo2Nw==
Message-ID: <a12aaa08-d6d8-4710-a053-6eb06c7c62cb@bootlin.com>
Date: Mon, 3 Aug 2026 22:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: remove ptpaddr/mmcaddr/estaddr "safe"
 initialization
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260803135745.12600-1-jszhang@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260803135745.12600-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_132748_046834_3197C7C6 
X-CRM114-Status: GOOD (  14.08  )
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

Hi,

Don't forget to put the tree name in the subject please :

https://docs.kernel.org/process/maintainer-netdev.html

That one's for net-next, thanks for the cleanup

On 8/3/26 15:57, Jisheng Zhang wrote:
> These so called "safe" initializations aren't needed any more from
> sometime, but the unnecessaries are obvious after recent clean up
> by Russell. The code will correctly initialize them after getting
> the correct stmmac_hwif_entry by calling stmmac_hwif_find().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 511b0fd5e834..265671170bf6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -328,18 +328,6 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
>  	/* Save ID for later use */
>  	priv->synopsys_id = version.snpsver;
>  
> -	/* Lets assume some safe values first */
> -	if (core_type == DWMAC_CORE_GMAC4) {
> -		priv->ptpaddr = priv->ioaddr + PTP_GMAC4_OFFSET;
> -		priv->mmcaddr = priv->ioaddr + MMC_GMAC4_OFFSET;
> -		priv->estaddr = priv->ioaddr + EST_GMAC4_OFFSET;
> -	} else {
> -		priv->ptpaddr = priv->ioaddr + PTP_GMAC3_X_OFFSET;
> -		priv->mmcaddr = priv->ioaddr + MMC_GMAC3_X_OFFSET;
> -		if (core_type == DWMAC_CORE_XGMAC)
> -			priv->estaddr = priv->ioaddr + EST_XGMAC_OFFSET;
> -	}
> -
>  	mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
>  	if (!mac)
>  		return -ENOMEM;

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

