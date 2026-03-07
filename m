Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9346BFC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 01:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Te6CQxafowcylD09FG2huxeGmtjrSZipVYPGxN3FkIo=; b=uQCCzdWqxZuq/VaVOEglqpYyit
	u1IHh+Avw68ShdA/cvcNP76EDu265OAqvC39vt/CX2KY0l1R4Az2XwfwuzroaXcEW1hyAdbW0eWGm
	f8ImjQmbg+BEsisOffR+Jgoz+5kFNNqd5MmEmG+k7jrupzkP9rNAXpYm6VWDk3rdi9HHr2CH47qQY
	usM2WZ3yFn5ZbN5Ht18aavV1DlXLx7bCVjt4MRPG8qRJ8G+lPxoSIsMbK8MhmJh02vXV8anruaQHZ
	cuqsK1zMe4YYwrsT56gwH/YCiGpCAct5cbvKrK53YJo+v0RximpVFvvXI2I8KUfsnFizWtjNHEiRS
	MePqtJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygAv-00000004l81-0FPw;
	Sat, 07 Mar 2026 01:09:49 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygAs-00000004l7c-2S2x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 01:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Te6CQxafowcylD09FG2huxeGmtjrSZipVYPGxN3FkIo=; 
	b=gSrRye6jMhDmrBiy4sl6ikG3D+zST7Vhs9mwH6fGMa8cgZNvbAvLurOgw1Tyt7kBJ5kyFXgZA+H
	HH4eJu8zEEIdO9DQX5bl4Nu+SKvfushwEwjVDq9XQYzmVSj9vuVQsZ0kmFjDW8obWSvAsq9wmlOeC
	bfcbQ9Wl20gWRbZSsw3ZWvttumLNgcaUMocDKf8n1s3a67jLOIQ1BTozfdRsICtj714h8Hn9ScwF9
	urfUJgzUD8jEDRUpDkKMvxTqL1lxlxmeKIutTbIpRwrCVoQaN/LDxevEBlEtCarxv4Ihxv6ducvkJ
	q+Fsszc0zo+cvTRBCTcVCUYaKzjXwEp6pHmQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vygAd-00CHOd-2J;
	Sat, 07 Mar 2026 09:09:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Mar 2026 10:09:31 +0900
Date: Sat, 7 Mar 2026 10:09:31 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Cheng-Yang Chou <yphbchou0911@gmail.com>, davem@davemloft.net,
	catalin.marinas@arm.com, will@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v2] crypto: arm64/aes-neonbs - Move key expansion off the
 stack
Message-ID: <aat6y_ppHGNlUWFH@gondor.apana.org.au>
References: <20260306064254.2079274-1-yphbchou0911@gmail.com>
 <20260306213502.GB9593@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306213502.GB9593@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_170946_628024_C27525DB 
X-CRM114-Status: UNSURE (   6.58  )
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

On Fri, Mar 06, 2026 at 01:35:02PM -0800, Eric Biggers wrote:
>
> I'll plan to take this through the libcrypto-fixes tree.  Herbert, let
> me know if you prefer to take it instead.

No objections from my end.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

