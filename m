Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6DCCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zvAmP+JcSs4QXz7+a2fW6ihhQwddeMuvI7aJuAsdjg=; b=BJ6Ug/FOdWtCp2pTL7DAfpoV+Q
	+LmfEStXBj3JgRPLP+O20n37X00y5GNH/QjGmSPTcM+XxNzcYelbqtKLBTLRq/GgwOogBdJ7jZgX4
	Y/YXgpSVdxiQSry1n1/vjwslAPiJTooo4Vxnz21H7Q5K8WWXtFH4pHG4oNera5b2vgkQNfJUvnK/A
	m+mvSil+4wHVz4bg9Ae1r1NVhhWsGl5BjY0v/0XWKESCvAxJWOhmihwLe2YIZUTdmHBrdnupj3Z0V
	4ZE99BI84q/m2hx/W8A67M4GmSD4+7gh5N/0iatHkrzdtZO5hfpAlkQSoEhwaw1MfJ8E/0IsQ6IQ8
	7PHAPpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjZI-00000003t5C-1All;
	Thu, 08 Oct 2026 08:33:36 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjZF-00000003t3L-3HUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=7zvAmP+JcSs4QXz7+a2fW6ihhQwddeMuvI7aJuAsdjg=; 
	b=WyKwij8NRSTCL1T4GQpAmysAhtLGEhU0pjIleugYmmk+OmgJDiiWoAZvoaQyVtgyFpBt56x58zx
	TtMui7NP7rpXCFufwvT6xi8EFtyI5jcdqiiUO06HfYsBfPta8v0OZkU69sgDiDK6zMNAEhCS8Jlba
	OY99iw/JOhtV2/JyTV1oFgw4OvZnnDVWgrlPmaJxKdRY/KhycAdyUfVvSHQP5WUPFPlA4QL2BxSSR
	CW0h62s1WoLAg5WZsyAH1zv+/++/NCeS3OmaNupS4N8YHzPseNZGNobAzwdvOQnX3xY1TzTZL+/85
	Qdjm9+igWgyoa1Z4pE32aim2Khbvt71JyMGQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjZ6-00000001o4e-1Jbf;
	Thu, 08 Oct 2026 16:33:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:33:24 +1100
Date: Thu, 8 Oct 2026 19:33:24 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Can Peng <pengcan@kylinos.cn>, Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: stm32 - drop redundant initializations
Message-ID: <asdVVLPbRuD_96PZ@gondor.apana.org.au>
References: <20261002143556.43214-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002143556.43214-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013333_821920_E2F5B618 
X-CRM114-Status: GOOD (  10.62  )
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

On Fri, Oct 02, 2026 at 04:35:53PM +0200, Thorsten Blum wrote:
> The variables are reassigned before their initial values are read - drop
> the redundant initializations.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/char/hw_random/stm32-rng.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

