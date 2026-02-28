Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D35FEE4D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utVUTvkDaRFs1KjtJ8lUX61qZxYSAsEUcGdk9IgvdKo=; b=X6hv9RZJ5nXcQIoOR6pkamu54K
	oHdBjVemWxHvKSfniT6gk7GT4+oavuF2yVSBB/cUr1xFD7GmsJyroir2QxSWSLhbgeiGQFnja3aNU
	p+pDSIgjbeG9EjlxeFia7l3ST62E3xjPYcE9yRHc7MxduHNgQOg4/Why2EqalS3BYpjUbr8LzGBzC
	iPDSqRyx2Hr2KoG2ViCeFl9SRxIGN9fck8t9sSEtXGO3qjWyVROs0YUfZcbRStUj6807IekxHANvg
	soz8brl2vFDiwrcrWefZ+zsZqAXJXM0S3iYZ4yIzRmbfr8Ig8crmB7U0NIu3I2Fk6sysDAUZavPIx
	6JM/MRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwG0O-00000009fKS-1wnV;
	Sat, 28 Feb 2026 08:48:56 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwG0L-00000009fJX-2n0X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 08:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=utVUTvkDaRFs1KjtJ8lUX61qZxYSAsEUcGdk9IgvdKo=; 
	b=GXom2qhrf/Z/VBUOeUacG3CWnl3rCA7UtczjEoauWhPL+kktPg+HTcrFdB+mwOndHQ9rgi6KiF8
	maLMhjNeYhNCZ8A18edW8wsnZ9M9/EJNxEXiEc88y8svyDiAywgVzBwLnSX5PMClZKOrvF6RzCdVS
	8Fb1yGxqRRGtolrvslpDchyYw5vhdY64aJC+GuRWt573O5UDcpZ7Vwxf3OMoaLpnCWr1sL0E+eKYv
	PMrCFEi73FvIMVpwMsBVMbtOt8/0gqIappUjlRjIvlyPG2N35Duy+6JHWHoI5x6h8JuPaK6J8HnV2
	nOZKQ6FhiEnNB6jn/p7DK1dVezr2HEbrk+og==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vwG07-00ADsK-2Y;
	Sat, 28 Feb 2026 16:48:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 28 Feb 2026 17:48:39 +0900
Date: Sat, 28 Feb 2026 17:48:39 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lothar Rubusch <l.rubusch@gmail.com>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - Fix OTP sysfs read and error
 handling
Message-ID: <aaKr5_c7nFZnBDCI@gondor.apana.org.au>
References: <20260216074552.656814-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216074552.656814-1-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_004853_707200_6DDC75D2 
X-CRM114-Status: GOOD (  13.61  )
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

On Mon, Feb 16, 2026 at 08:45:51AM +0100, Thorsten Blum wrote:
> Fix otp_show() to read and print all 64 bytes of the OTP zone.
> Previously, the loop only printed half of the OTP (32 bytes), and
> partial output was returned on read errors.
> 
> Propagate the actual error from atmel_sha204a_otp_read() instead of
> producing partial output.
> 
> Replace sprintf() with sysfs_emit_at(), which is preferred for
> formatting sysfs output because it provides safer bounds checking.
> 
> Cc: stable@vger.kernel.org
> Fixes: 13909a0c8897 ("crypto: atmel-sha204a - provide the otp content")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
> 
> Changes in v2:
> - Return the total number of bytes written by sysfs_emit_at() after
>   feedback from Lothar (thanks!)
> - Link to v1: https://lore.kernel.org/lkml/20260215124125.465162-2-thorsten.blum@linux.dev/
> ---
>  drivers/crypto/atmel-sha204a.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

