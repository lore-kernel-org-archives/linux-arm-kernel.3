Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AB1F9935C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rapv8yS4wsNrL/SFFrRcNmZ3sk5XYZr49ZPPHAzwISk=; b=qc/jGQ5IzChRuFtYaiC0RUm1id
	r0Gym3zGEBV8aSRfqRROGpj5mMhohxKhgxHzaZgZO8NERhCkadxqSa92clUS0MteqAtb68ECxb1ZC
	SdQQh69cSNizR73XOJkq1Us0qKgV8iNY+dRFLYvufcggao6k7m8cnFiosMTfz3cY11OFStkezCLaF
	CIN2jyY5X5+30FSJNamo2XJ0lbVGOb5HwCGO09cML6ytHpC0GwyI/DvwIjSa/CVq+O9eB7LR5tFpF
	LSHWGf5gz/EUtz6RYI6qOCZuoTTNeAYAIX4Iov/mbQ0hUwxIbez1ott+P5fVmQWwvo7mT49fYVmF1
	ni7HO3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqLr-0000000BOd2-00Zq;
	Thu, 23 Apr 2026 09:28:03 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqLo-0000000BOc3-1YNg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Rapv8yS4wsNrL/SFFrRcNmZ3sk5XYZr49ZPPHAzwISk=; 
	b=HA9wc/emc847WK7O+aKLnmt0BhlhCK0MYcmdW6vRGEMeyTLXW9CJC8RcBJkslYEuLlIR2u3w5kz
	n86ExVfqvqESdiu/8aPZqq9vHSalykSnYBCKrTmDugKyiJCvxjS5inaYQ6nQdHgpsAZDt1GL/Y+EM
	DCaUT0teZAoMM1X/Ue0626b7/bV7ZvHyt7iqgUI6yOKmeg52DHCVM5+z3S1anLKWYWo2w8wUhw7ov
	y5ozTlTewymvmWNBr94PZwOMvPZNVIFe9wE/KpcuwBXBr5PzdjRqokNNDc9pfYw3SCd07XdScrjTK
	0zTxIgiBEJ7IFKnW3II+4asRTkJd8JQ17M0A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFqLZ-008C8s-36;
	Thu, 23 Apr 2026 17:27:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Apr 2026 17:27:45 +0800
Date: Thu, 23 Apr 2026 17:27:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Message-ID: <aenmEQNhhw9bnxEa@gondor.apana.org.au>
References: <20260423065600.2081989-1-arnd@kernel.org>
 <aenfmxOvtHaAODqH@gondor.apana.org.au>
 <1cd6ddc3-479c-4cbf-8315-78bc53ac3a54@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cd6ddc3-479c-4cbf-8315-78bc53ac3a54@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_022800_408018_627E6682 
X-CRM114-Status: UNSURE (   9.73  )
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

On Thu, Apr 23, 2026 at 11:25:19AM +0200, Arnd Bergmann wrote:
>
> Yes, I can rework the patch that way. I had considered this originally
> but decided this would end up less readable in this case because
> of the extra indentation level. The drivers already has a lot of
> #ifdef checks, so adding more of those felt more in line with the
> style used here.

If we're adding new code I prefer doing it inline instead of as
an ifdef so that we maximise compiler coverage.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

