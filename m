Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95321FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AXtKqd4hursGhJ7ysYyzDvc1qaibPoD+s00h+TaKbc=; b=P5gf0hGx4jtDpAqffO4Z5vuns4
	zfDOTpx09vGa9IBIEyUSr43qvRZ7s9IKeR+ECqeU/4fGT7hKwdjx4XWH1a3z6UQQsyfEjXlh1X/5P
	O3OqsKpUt0cDnAbEnZib+LYqcUyL3T0vDaeTvn6fTCQFibXIJXAbILoxfDaTR8/s/1njyN7hNpo2J
	6F8YevhLKEYESgoNjr8JhMW6tY6MRpg8SLTWM+o8ohXssXEBGgVv4RSIN5EX14xVA1Ev9FLXqSqTE
	ToAe1puu6vC7nfMR/hK9Moc/tS8hGEnAsca35BEDuYP53VUK6xRWf5z0czCUNxdsfrI/r2NH9/Gpb
	/gq1GI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC3s-0000000FfND-38DB;
	Tue, 05 May 2026 09:27:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC3q-0000000FfMX-0Qoo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=+AXtKqd4hursGhJ7ysYyzDvc1qaibPoD+s00h+TaKbc=; 
	b=sG7AklXyvYyiQ8BjEyZUNeNRuNCC6x8wSTQp9Tm0d2USXuCdoLyN9JR1KpsDmk3DekpI78YI4SV
	6Vudpfk9UQe/BDZCJnaOy5WkC4CzHxVIENTeOI5Ht4f90U+4tQRxnvUX91NsoBZvwOxJZGFZM/6Kl
	UE2hee1Ft4vEOBv7UDxSNCQ+MZDl5dBKJ8ooyfgv0VITLu6Z3fsiKaWR53ORD/RehxswOGBsD9SBy
	AyBbLaOReKgF02y++3pxwn434vmaDUP9yhn2f5xWZM6w7p+5Xi9sajndJbSzHE7/fwFwucpDUkjqL
	QJjl84ERj25t0eQbpzt0vpU7oq4b6ocwVChA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKC3Y-00BNtc-10;
	Tue, 05 May 2026 17:27:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 17:27:08 +0800
Date: Tue, 5 May 2026 17:27:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: thorsten.blum@linux.dev, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] crypto: atmel-sha204a - fix blocking and
 non-blocking rng logic
Message-ID: <afm37IhzvsAQCZj1@gondor.apana.org.au>
References: <20260426212947.24757-1-l.rubusch@gmail.com>
 <20260426212947.24757-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426212947.24757-2-l.rubusch@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_022726_142114_E00A9D0A 
X-CRM114-Status: GOOD (  13.55  )
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

On Sun, Apr 26, 2026 at 09:29:47PM +0000, Lothar Rubusch wrote:
> The blocking and non-blocking paths were failing to provide valid entropy
> due to improper buffer management. Reading the buffer starting from byte 1,
> only fetch the 32 bytes of random data from the return message.
> 
> Tested on an Atmel SHA204A device.
> 
> Before (here for blocking), tests showed repeatedly reading reduced bytes.
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000020
> 
> After, the result will be similar to the following:
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
> 00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
> 00000020
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/crypto/atmel-sha204a.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

