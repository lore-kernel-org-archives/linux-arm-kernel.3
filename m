Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095B8FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8aaaehgysH2hcfIZINOSwreJrwK4RdOvdUPlIC0mwY=; b=hHt9dSN3Z2wV5bujhTayN5dF4L
	d2LMBIAtXb5YxxePobH3hEMd/vQ5zJGcl9MLNMGYDQJA6Pon4qCQhqe4mzz3nZXMlI0vlzLJ4Zs/d
	5oF9evcigRZwZoLq2kUvtsG28hTaVSPoqvph3lvcCsZ8uphIQIAedP8EDdYvwJOAi++fM2Eo0v4Yi
	468Gd0XnX+EPoz9ntIdMET6BYUdv1VvWDPzWBqyOmmF+3Q+85GPX5x2zAIsJ3gIHnHwYGAWvTQbrX
	dDBH5FCP7Z/QYbY8wIJP8nK4UqP5KsZYa0YEsgTZopW8ivnFHIBOFhHvmZYTeUoDisrOB86rPafm9
	eu+tMHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANyD-00000008UwF-06Hw;
	Wed, 08 Apr 2026 08:09:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANy9-00000008UvJ-2JJj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=l8aaaehgysH2hcfIZINOSwreJrwK4RdOvdUPlIC0mwY=; 
	b=slUEtJ/asWbPK7wnHP/gklNlHvd8xYUVOgV7KqsctVF0ppZufBjaEoKrx4uKCIFoT0WdMnVKWh+
	bJAWhVlVJTOA2HTDu1xujmh/z0mzsLtscPH+w7p04GhBOG4vIVpWC43em4L/bs3MVLhwN2L8J8SDD
	repz4041mk82cl6wgKpsEeZ6FX6WL3UWSpv4kYaVUjqnQLkCk0+Gg/R9BK+mz4c4CLwahZtGZaFmS
	A+uTUvQhzSAR8Zjjo65NbuJaSYXxhjM/0tPbVstNxH5expWzTHbzCIX3xFDHfAxqIZzmlbFLLjFjW
	kzGcG3agrG34DXtK3DBleJ1Bz6moytH7I1Hw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wANYN-004dIK-1B;
	Wed, 08 Apr 2026 16:08:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 08 Apr 2026 16:08:42 +0800
Date: Wed, 8 Apr 2026 16:08:42 +0800
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
Message-ID: <adYNClYB6RY820Xl@gondor.apana.org.au>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_010902_240078_8B9C28C1 
X-CRM114-Status: GOOD (  11.66  )
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

On Tue, Apr 07, 2026 at 12:28:59PM -0700, Hamza Mahfooz wrote:
> If the kernel isn't built with CONFIG_CRYPTO_XXHASH and booted with FIPS
> mode enabled it will currently panic. So, only benchmark xxhash64 if
> CRYPTO_XXHASH is enabled.
> 
> Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> Cc: Paul Monson <paul.monson@capgemini.com>
> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
> ---
>  crypto/testmgr.c | 2 ++
>  1 file changed, 2 insertions(+)

Please show me the panic.  Normally it's not an issue if an algorithm
is not present while the test vectors are.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

