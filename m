Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9821C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdyH+mHN8a2J7OlMEjFJZq3VZYV32+BYv7pNQsjlN00=; b=KwcvYRKg/gCO8wA6buOl5dqtuN
	AvuoeHm8d+7dqNpJujwe0TGo7dpcjua9dF7wrgaWoqQFgj50exHt+9Lf12kkugDLrGSYKGkr56Ok7
	JcinboZ7FQEQdHCjqEBdX86NZcfi6m003KwQTu4151NlgXVKbHSW7jRn9cXdKpRZBLs4djxd4fbNy
	T93Pdzgh+DqeEHjBgf4EuzE5oSXkNxoYL3vc3G997Uj/OSmZ7CZGRNjWVWeEdyxIShXB2QzV/OCf7
	efsyN1XioJvrLxvOJNYQxIMAv1jwjy5dMJmb2C/hUfSTtYkfTPExzRU89uQgq4L7RNpMogedfhcjz
	rH7cy2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdl7-00000001ba0-1n3K;
	Fri, 17 Jul 2026 08:17:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdl6-00000001bZg-0UZ1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HdyH+mHN8a2J7OlMEjFJZq3VZYV32+BYv7pNQsjlN00=; b=aGfHuFLwvLJ6GfXCxvb0yDa9h9
	wrYe9B80Er8AnBtHHynxzzvo4Yu2AVDITAZGHSKSxcB+6mgpx0697me3de3zXtlu13Le/0tgB6KMm
	U2+kDpqlyyaMUV9lGCzvsSE9O3O7TFeLQ2r4qKevM0GeHRZqSnc1kVEhSxhrfFPEUNtUc12U5XkN9
	3s9BydEf2bLkkhuq3Rur1KMPQiX8zNPdTOe3MA+EbOEb5bwd9t5g916c8p1J1jGJIIN6mERRNpJp2
	DqJwNZe9vydOjRvcMuK7X2TGaZCxKVNOsMTShGKPiVGMIKbpH3KsqMkVfF449EbU0HA5gPeapkAHl
	Mcf3G/vw==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdl2-0000000Eeon-3Huv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=HdyH+mHN8a2J7OlMEjFJZq3VZYV32+BYv7pNQsjlN00=; 
	b=ehmHWhUC43YfLnCGY64zhfR4L6qL2mTGmKkzRDJqIJ8bFUn6kOsN/ySdcXtqp7kLhViBRo7v3dE
	hGuY2ZwGabcpaBtZ4nM2Dh2lPa7HQmPZJHzb351k8M4qHqWVtaPbFq4iexT0zddwYwP7TzvnJ/TLO
	xDrwLJ+YuGYItrq7phyJZtj4ttL2tmvZRzWKm1I9RnzToU1HVC39HhadshyrVq44xdtJse1K/fkzj
	puBpRVteH5z955KPaSm0fsjXZ2auHx2Mozkcgka6KVlBxx8YYmiqfwblHY2S12DUi3jQDxCNDCMr6
	NdNat+wdSXAuzUnDOtGmWTi+G9WC6HCPRA8Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdkr-0000000EOC7-0wH2;
	Fri, 17 Jul 2026 16:17:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:17:09 +1000
Date: Fri, 17 Jul 2026 18:17:09 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	YueHaibing <yuehaibing@huawei.com>, linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: aspeed: Propagate platform_get_irq() errors
Message-ID: <alnlBV1PwFkfpPfr@gondor.apana.org.au>
References: <20260710110729.224090-1-ahmisaranrao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710110729.224090-1-ahmisaranrao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091721_026552_5385CE29 
X-CRM114-Status: GOOD (  11.53  )
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

On Fri, Jul 10, 2026 at 04:37:29PM +0530, Narasimharao Vadlamudi wrote:
> platform_get_irq() returns a positive IRQ number on success and a negative
> error code on failure. aspeed_acry_probe() and aspeed_hace_probe()
> already detect negative returns, but both convert every failure to -ENXIO.
> 
> Return the original error code so callers can handle errors such as
> -EPROBE_DEFER correctly.
> 
> Fixes: 2f1cf4e50c95 ("crypto: aspeed - Add ACRY RSA driver")
> Fixes: 70513e1d6559 ("crypto: aspeed - Fix check for platform_get_irq() errors")
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
> ---
>  drivers/crypto/aspeed/aspeed-acry.c | 2 +-
>  drivers/crypto/aspeed/aspeed-hace.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

