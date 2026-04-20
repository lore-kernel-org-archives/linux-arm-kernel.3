Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A68F557E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA0RugfwP71Dnuw8bsIljvtpxKBXfcuhfWG6uOrPjIA=; b=KtoJK0eE9hkpHwULSrXxJkDpHo
	aXk0lRaIQHYgcAUujelwZHUdfMcfH7IQ54KYS/4Pvrfkbk32bZeasNAc2NSjLsaKmvuSYfIp/wVRj
	rZHeW5yiEQThSzRL0eNT4/a1U7ftxtjjlFQaC+gluZ+XIFR0do5nsZ5SnxcZFUNKKqjTb3qrOyUgJ
	1inTne9Pn0ou1Uh1MGgg5rJdYEOazzAoAybx4Wt8NCW0NpUM5BowstAYsSuII5mo2C2VvwmzFsGZU
	vRihy9MwLuS5pQ7n81hCu5aJtGMDmvWzAM9/HSbBZ3ZuKf1RRGUeBdUVbcgKVucy3uffywSpEvQJB
	RU/Me0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkGc-00000006cLt-2exE;
	Mon, 20 Apr 2026 08:46:06 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkGY-00000006cKz-2VfK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=rA0RugfwP71Dnuw8bsIljvtpxKBXfcuhfWG6uOrPjIA=; 
	b=d63nZV8CMGGJBw1J9IuDxg4Uvo1yzQ5d+5TPIFN1o3B5t0WXgFg/RA52LTD5psbYsNRwNCaLn8L
	2Z3x/pxn0j/9rqom7zNXsg79fFttYhsa3BO1YtZI6j4Q6ocmMxGsRmx7we1HJKdacegx9mq60C099
	ZpLAoRBTsMnxbwS1fo6cj6RkxWWQih8BD90G+IxdDcupGRIlBNn+7n90/oZcOJ6nNERLsSq18X6O/
	OTEiGnfyOga/tVcZYla+H9eqSujdOVYsyzGPpjqTxEks1cmLt0YEvCTkVnvR7DEYs/MrJnlw2qMTe
	jUcDZkZEfugYKAe0Et7aPhYj+ceW23F3WE4Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wEkGE-007LzY-33;
	Mon, 20 Apr 2026 16:45:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 20 Apr 2026 16:45:42 +0800
Date: Mon, 20 Apr 2026 16:45:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jeff Barnes <jeffbarnes@linux.microsoft.com>,
	Paul Monson <paul.monson@capgemini.com>
Subject: Re: [PATCH] crypto: tstmgr - guard xxhash tests
Message-ID: <aeXntu0DVQdocakd@gondor.apana.org.au>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
 <adYNClYB6RY820Xl@gondor.apana.org.au>
 <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <aeCmk6LbLFT4Keo2@gondor.apana.org.au>
 <aeCnNsNrK5o2JcMu@gondor.apana.org.au>
 <aeJw9I38heQRbbe6@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeJw9I38heQRbbe6@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014603_355600_75D6B03A 
X-CRM114-Status: UNSURE (   9.87  )
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

On Fri, Apr 17, 2026 at 10:42:12AM -0700, Hamza Mahfooz wrote:
> 
> It appears that commit 6318fbe26e67 ("crypto: testmgr - Hide ENOENT
> errors better"), already does exactly that and it appears to resolve the
> issue that I'm seeing. So, is there any reason it can't be backported to
> stable?

Sure I don't see anything wrong with that.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

