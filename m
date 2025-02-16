Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B76C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 02:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2yG0zZeHrh41/HUvAcj64EieaWG1lDiLMI8ggvgcIQ=; b=PWqrgh6a1OsTXHN5LOHiuk8ZSh
	OiYSorsVQnilwC90ubBeyRTLyDYQplZH91SZTfXQskYNIeJqMCFrfaN/AQ4wZpCxohIa+DhmOPuwm
	vEgwbVs7tPuPxmn8H3yQCw2/8mKVIzTaggMcBvlE5kSZ31LC+rlnkfWgbw5pWD2MHDM7QIwmJmEO2
	2OwYRMYttyA+VWhA+Hs4nPR959Ff6QH3G71YcdGYwd2/xegAb8d9AkjouSnw311UVZVQS2X2+sEHv
	FfB8ZzMmh8yrpIoHENxMb3HMkp27dOnH2aU+5fexBHbNGg60X8HYoXtS5+JLXxIdSz+hynBmnb+k6
	x9IfTcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjUOj-000000014c3-3tUb;
	Sun, 16 Feb 2025 02:28:45 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjUNF-000000014Pu-3uu1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 02:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g2yG0zZeHrh41/HUvAcj64EieaWG1lDiLMI8ggvgcIQ=; b=GakgaZxUxo5UvoGCj6Z78b2nFR
	1ABLhDgqZLFZgRqbS0rm4ZExs1mSizKDwWXCTA3fzCQcZk3YZfu/U/T/YSE3lpWk23UTZquJie9Rr
	y9GW7PI+UrBYGz2ALDO+oDT5U9S53yGWlwaqk1AuOUKPSX8x1Ce1DIGpJdYhzkmYVsVYLZxZ4JgeH
	w7ryL7q86eqjgRawoHEnXijCTJjUIgFfefHus8xH0iEn8/lT28iuEzpdze0ET13c52a1OpSV5C+i+
	ntv7NPzqZvCzSaANwx9c1rHGc+4JDUdhrwn/YWzPb1d5E9bLgjPKVnqTszqbq7oU8enRZ9zhAgek6
	N+3nXd5g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tjUA9-000gJl-1j;
	Sun, 16 Feb 2025 10:27:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 16 Feb 2025 10:27:02 +0800
Date: Sun, 16 Feb 2025 10:27:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev,
	linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <20250215090412.46937c11@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215090412.46937c11@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_182714_094730_CA241921 
X-CRM114-Status: UNSURE (   7.74  )
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

On Sat, Feb 15, 2025 at 09:04:12AM -0800, Jakub Kicinski wrote:
>
> Can confirm, FWIW. I don't know as much about IPsec, but for TLS
> lightweight SW-only crypto would be ideal.

Please note that while CPU-only crypto is the best for networking,
it actually operates in asynchronous mode on x86.  This is because
RX occurs in softirq context, which may not be able to use SIMD on
x86.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

