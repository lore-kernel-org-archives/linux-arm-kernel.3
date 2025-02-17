Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17756C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HorOPc/fpEMmI9E23OZib09LoAgUtm+JUQ6IrODWtrs=; b=GPmwNRJZ64WWi5egYvIBQBCfKi
	MqaMaXGprQ3HA98+V17Fyl+O1M1Sy5Gk7HkSaW5XyuC9M73YHBOm+yXbIoprPr41SplFRN4579Clb
	vWwXwuuwfludc9KhXh6yuhG6vYjOdeVqYa7xhunkfr8Z0ugy8E4iMSP5B0U/1jKS9R3fScL2MkKwZ
	/+PLVaP4yugj/nhY6BI51NqOzhZOrWE67CvRoFQMTtB0ps7MP7ZtMLqje+m8MctEAQB5UtjmrOPoR
	p39/HZn0LjkxFELar9WxckRj4gW+UYbN2q/Nk2fSawaaA3N5nA+A+xrOyxf2cJdpfEmPdUUqQyYil
	QTiHCwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5lG-00000005aYC-0r2M;
	Mon, 17 Feb 2025 18:22:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk56g-00000005ULi-41e9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 17:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F943A41A40;
	Mon, 17 Feb 2025 17:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ECAC4CED1;
	Mon, 17 Feb 2025 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739814033;
	bh=Dy/0GI1ft/U44yuy4Q2Na9V/ddLvYKKyiIq0KGW5S+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WNhfr3gvbgG7kEediEzqfjJ61dCny56DanKCmNYmeojo/ibXqv4tJuMGMZ+0jGf0J
	 wIhL0GJ+DU21zwz6EzFpJmP9FuZosVt4FztCzQ4rdkupYgOuCc6rXFrIcxyn6RYf49
	 i+kWLBaZYC2gEc5toYkq/WxuDabqk2BGBotwlrn7MTMX3JwV3pSoYhPF0xDuNQR9jy
	 0S1NHGCu3f6hB2wm9kg7OQZ7Wm68Ix6eQ97fFfwtB4O/zCqcmAKWHLo5iZ2NNDQagc
	 55814Y2qdrlL0XnmVoIWz0+cdSuQXmAznp1zvJAolcTdxfUYCatEYdwBBPcmn+jh4q
	 P75nMbAfJef3w==
Date: Mon, 17 Feb 2025 09:40:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev,
 linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Mikulas Patocka
 <mpatocka@redhat.com>, David Howells <dhowells@redhat.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using
 multibuffer hashing
Message-ID: <20250217094032.3cbe64c7@kernel.org>
In-Reply-To: <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
	<Z61yZjslWKmDGE_t@gondor.apana.org.au>
	<20250213063304.GA11664@sol.localdomain>
	<20250215090412.46937c11@kernel.org>
	<Z7FM9rhEA7n476EJ@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_094035_056198_FFEFE255 
X-CRM114-Status: GOOD (  10.16  )
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

On Sun, 16 Feb 2025 10:27:02 +0800 Herbert Xu wrote:
> On Sat, Feb 15, 2025 at 09:04:12AM -0800, Jakub Kicinski wrote:
> > Can confirm, FWIW. I don't know as much about IPsec, but for TLS
> > lightweight SW-only crypto would be ideal.  
> 
> Please note that while CPU-only crypto is the best for networking,
> it actually operates in asynchronous mode on x86.  This is because
> RX occurs in softirq context, which may not be able to use SIMD on
> x86.

Yes, that's true for tunnels and for IPsec.
TLS does crypto in sendmsg/recvmsg, process context.

