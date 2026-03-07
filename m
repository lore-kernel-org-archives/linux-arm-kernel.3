Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1543FC9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik57wtQI0JITE+23AU51z6Ud9QY793AQ76FK53fxLlY=; b=H0fSClX5J49x1OaGbXeQBo4Ar+
	IRW5YKgAkZELDm8uVgA6L7EuRbg0K8hy4YbJNH+IEePqfC+RJ6wI/DnT6AjpecEqRPL3DpAN3EOkz
	+jLwY+o4qyDetIZqNwg5IMrWngim5ZtpbGtqFVtea2JeVioUZs2ZrRvbaKqej6QPizQJGnzfso/xU
	jN77qFOkOLHUuP8F4V6/49Z2oC8iVWNC1ETQK5ZBuCgzT9TJrcpXL1yXZaLFwZDbBO3kSzbO1tLAr
	bvaRqeJvi7kdNRykHm1uXXP1rK5ItzSAlOV0+HLq54huT6zczKowCFBFhU4dnSXWxJiIVKlHIieUm
	hEgFNCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykEm-00000004uyM-1bDL;
	Sat, 07 Mar 2026 05:30:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykEj-00000004uxQ-3vSd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 05:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ik57wtQI0JITE+23AU51z6Ud9QY793AQ76FK53fxLlY=; 
	b=g2ii4N9KFQAhOKSt/sUsywDAz71AUsZxiXkA06nm5n8i8nsEyP25Lb2QjR7V8xCfzFZTopv4W38
	wK528Th6g6MTxXp+4p624HWzekl+mu94/I77vi0IfA43zpceHTcGPoZ7jTiMJfmkMXdru0dHQAQsp
	KgmIVChHXq3KECSh3rWRWnonWNmUmi1rhvhBqOB/+Ds8n/7dpF9U/7HGs81fMoEqr03vg23c3pE+F
	4w0ngcIevFtu7eraRQ2ibiaYlPJ1HXyflhDGTwtKQ5gVJZ87/39DIvvcoj2gVnARIIKWZeXwCuYvF
	23x4RV88EGx3oxtQhhKmnmW4KG3Hjyn1tO7w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vykEU-00CJY2-19;
	Sat, 07 Mar 2026 13:29:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Mar 2026 14:29:46 +0900
Date: Sat, 7 Mar 2026 14:29:46 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-i2c - Replace hard-coded bus clock rate
 with constant
Message-ID: <aau3yuTMe67fgQvG@gondor.apana.org.au>
References: <20260223165737.342015-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223165737.342015-1-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_213001_989515_0D27F530 
X-CRM114-Status: GOOD (  10.10  )
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

On Mon, Feb 23, 2026 at 05:57:37PM +0100, Thorsten Blum wrote:
> Replace 1000000L with I2C_MAX_FAST_MODE_PLUS_FREQ.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

