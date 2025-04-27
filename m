Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36A6C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jYBIW8eL1CHTTgYqVhOJdPq6bgjz5FSbg7i5wPZVhNg=; b=Kj5hcE4fX6Bl9x
	Fh0RwTJNryru4Kiy6HGMhY2q64PncAX5db8PtFJTGP2B7JwWPOIG++E4v43XqWu013/44j19Ygyj5
	UO0qxbBlRmZB8z/tqwVYHBuvbKadDq6M0go2DpqRem8VEaABmvdD65UpngSoHhwq0Le2for7VG+G2
	0PncZtf2cVfzHCgfp5Rqth6838aZzLox/JYfA/uWxqtUg1M6UvIQUgN62go591VcLci1+TWEFF4NC
	IzRCHYWOzKdKciHIRqJuiD5zNYqjATZa8raPRm1a3jGjQ2qq2nQBbYbOi0g/Sz+rVWO+WGRD2fc9V
	CI3nwvxjv7XNkMFgCY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qYO-00000002hkK-2dY0;
	Sun, 27 Apr 2025 01:11:32 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qTu-00000002hEW-23rz;
	Sun, 27 Apr 2025 01:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jYBIW8eL1CHTTgYqVhOJdPq6bgjz5FSbg7i5wPZVhNg=; b=ZBrOvF8Qo8J4cuQs3xdMmfCOmr
	a75wN5BWC+Ggi02u2OkOXrfsQ9WcEbBmShuNkPBIwY5k8gKcO64kwqMOWu5SPYtCvTaxpGgh1merV
	okY/E4Dc3UjeuouK5DAuujPEUKJfgmyff4qyX0PDfV+qHY82qO5T9bV8EaMigXon62TNK2EShmvTo
	ycU37GIkPwCW2lxYAvbAPFbfWsCtQGn/1V5XhZLm7Uc2ZJ/D0WP+sndPm7ZWFW45zCDDyvSMrD663
	EmNxoqe0ba9PaADtu/SUu+jI7XAmTYVSPafPQOTMCQhhe/7wTYd2mJVuiomGfs3Ucf7Lp5k0I/HvN
	DyF1yCTQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8qTr-001JP9-0H;
	Sun, 27 Apr 2025 09:06:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 09:06:51 +0800
Date: Sun, 27 Apr 2025 09:06:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065041.1551914-2-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_180654_529083_DA5AD8CF 
X-CRM114-Status: UNSURE (   6.07  )
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

Eric Biggers <ebiggers@kernel.org> wrote:
>
> +static int crypto_sha256_update_arch(struct shash_desc *desc, const u8 *data,
> +                                    unsigned int len)
> +{
> +       sha256_update(shash_desc_ctx(desc), data, len);
> +       return 0;
> +}

Please use the block functions directly in the shash implementation.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

