Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1593C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IO8nzfRzmQnremlogH0nyZ7Ud5v++zzdWBdmgNrSYY=; b=4BwonNccusONg7JAAtDH6fz2uP
	qeQtHrGJskS0C1ZnKwc0piinyNZ7q0NfGoiUzTrm/8bkGB0m1LcO2ypBu6ssfVnBwg25bLNXzFO05
	UVSqlTPmkW4hPuLV/CgXwD3C+3rvgHD4C5MJ2M/1citqQTte5ASwwmsDYpOTnGUeqYHkASB+OSblW
	tXBQnA9IPmjWxOErQzl8mdiTU5eseykuqFzC2iZsOPbN/T9O7MVpAPjvQ0wKZiDdl3POxRi6NKhkZ
	7ATbv8E4oQo8rfneSHIvMfpnVMecLf+wRE5BzwISLJsu+AZ3lIZ6b0s8/9p7Z4w8z4hhkF8RgRQWr
	XnGXBQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdkw-00000001bXN-1DJL;
	Fri, 17 Jul 2026 08:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdku-00000001bX8-3KZu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4IO8nzfRzmQnremlogH0nyZ7Ud5v++zzdWBdmgNrSYY=; b=jhxNfWrpzQbn43ADTNo/0xhDpr
	IY/TrwLxavz/Re85pK2/DSDvNffOH1lySzAHpN9C3HpeJEBV1hiD2P/c8fCsDZ9WU1ZEkw7gWSxV6
	4yqkGT8LX7CnOYtVxuBzwW0j9jssxJvgAK2vkkB3ZnxNCh7LK8R+KNj+n53jSszp57xy9XwBB8Mus
	+a0rZsurzwLP++irgYRs/YvO8pFizyCE9jGqYduRsxg33wYBujpWNw8Jhc4gXcjYYlUpqVGjDpaQ8
	X1Gb896ynWf1/wZ97wi3JJUOmCRrkujH/fBI1aQNWP9ZX1L9Zm8GEua9ky0JnY5kQwC9M1QD5iAAR
	Mc1ctl9A==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdkr-0000000Eeo9-2hiF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=4IO8nzfRzmQnremlogH0nyZ7Ud5v++zzdWBdmgNrSYY=; 
	b=Fe8PuOb7EfytiJ23sHrVKPY9FBnIGeDe2eQi33OoaZqIo00ez92nm/pK7KVs8KtRD4Zed9Hazy/
	hbEuotGynWyxLa/8eip29xmc1/I2wx1gIAEfio5a6zRDPTb5T9meu1EIi0+YwrGJ1a7J4Td99mgte
	BzBlBbLkoRy5eWR9hdW7OePXhuao9V7Fvi0zQqq6paV8DMr+O17fYM47J4AD595WYpQpUqOHsUlLv
	s9wKwImVu5aaiQTkmjQ7vHQl9l4/r3rT0Xoq2Ixv+/WzPBCI9NA5O5gQHRdgmHpK73NwSQGvnwSKV
	uxYyMzUHY8RfBhkVZLITf5i1K8EnbqKx9sgw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdkX-0000000EOBG-2UNf;
	Fri, 17 Jul 2026 16:16:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:16:49 +1000
Date: Fri, 17 Jul 2026 18:16:49 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Pan Chuang <panchuang@vivo.com>
Cc: Olivia Mackall <olivia@selenic.com>, Hadar Gat <hadar.gat@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	Deepak Saxena <dsaxena@plexity.net>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] hwrng: drivers - Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <alnk8UV-b2uTMsll@gondor.apana.org.au>
References: <20260710105318.376496-1-panchuang@vivo.com>
 <20260710105318.376496-2-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710105318.376496-2-panchuang@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091709_990107_BD75DC1B 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 10, 2026 at 06:53:06PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/char/hw_random/airoha-trng.c | 4 +---
>  drivers/char/hw_random/cctrng.c      | 2 +-
>  drivers/char/hw_random/imx-rngc.c    | 2 +-
>  drivers/char/hw_random/jh7110-trng.c | 3 +--
>  drivers/char/hw_random/omap-rng.c    | 5 +----
>  drivers/char/hw_random/xgene-rng.c   | 2 +-
>  6 files changed, 6 insertions(+), 12 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

