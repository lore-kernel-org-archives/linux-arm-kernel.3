Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8431CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gihya9xP0fAcqsxzSzES+1BCfKN/8rEUF3BTdeplS64=; b=iqyEBYZtsBNPqY4i8Q69f9W0I/
	2Jj4Ifcorss7ebFBOm/tkw3eToBIkotGStFaiiAdUkhel/eVAO3Fj/RLucNQfU/E5xa9Mr7TQtU2R
	/vqdpxo1VoXIY9Vlr/2TENvIUNS8H+6SkLn+nzrBOM9ydgvaZ88k12KG7t2vbClHYtf0+KBlvmOl1
	NqR8j6BEEeeYUWQPmaHj/5qAlC5Yj3FWVUkM6zRzr/Kh0t/2ci9DkvkCRxeLJixkiA0/7c+6sNUy0
	84eblE/yEFY2oQgrWsyjywxT9WW8kjkUcBqjtteGCuetnQfpZ2wz+rao5v5R1ZBwCxnyznTIWfezl
	5DP0jL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwdx-00000005K4o-0FUr;
	Sat, 20 Sep 2025 12:24:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwdu-00000005K4P-2LOn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 12:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:cc:to:subject:message-id:date:from:reply-to;
	bh=Gihya9xP0fAcqsxzSzES+1BCfKN/8rEUF3BTdeplS64=; b=mlutS17W7yGIqhdfi1idO6nGob
	czgsUB/fZ/9YSk0UXQNqq2kkv6rrIBIbqoFGHs5FsN70xtSIbNBx4wpbkLK34OGTcxKdk39f2ZHt4
	I/YFgc7KbUiJquNnJ5TO2teOt+hJGjAlDyvf6/0hKgQ0ES451eXDCw1/EfS5KQgz9/YGtocmNPrH2
	7Dy+NDITl0wVWEzhBdtLULqvyBoJ8WFuHOGxm5rccB0mMeydzP1ERdViZeOIcUcmsNniDLdG7Oue7
	3QRyu6ikDglunhBZt8ewIthuWYaULvRwph5QTKoTRhkpph1kXabfGyYmg/fiZSK4VwW/DwqHeWn4N
	q2b9FAyA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uzwdc-00704n-0p;
	Sat, 20 Sep 2025 20:24:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 20 Sep 2025 20:24:24 +0800
Date: Sat, 20 Sep 2025 20:24:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>,
	"David S. Miller" <davem@davemloft.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Johnny Huang <johnny_huang@aspeedtech.com>,
	Dhananjay Phadke <dphadke@linux.microsoft.com>,
	linux-aspeed@lists.ozlabs.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: aspeed - Fix dma_unmap_sg() direction
Message-ID: <aM6c-LsUNPN3CJ3m@gondor.apana.org.au>
References: <20250910082232.16723-3-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910082232.16723-3-fourier.thomas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_052442_594838_CAB7397A 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, Sep 10, 2025 at 10:22:31AM +0200, Thomas Fourier wrote:
> It seems like everywhere in this file, when the request is not
> bidirectionala, req->src is mapped with DMA_TO_DEVICE and req->dst is
> mapped with DMA_FROM_DEVICE.
> 
> Fixes: 62f58b1637b7 ("crypto: aspeed - add HACE crypto driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
> v1->v2:
>   - fix confusion between dst and src in commit message 
> 
>  drivers/crypto/aspeed/aspeed-hace-crypto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

