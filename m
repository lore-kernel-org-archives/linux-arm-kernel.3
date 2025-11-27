Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5E0D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+HGqQCZc4eTZBJ9S6jotkuvef/+Q9e4UGutZNIsM0k=; b=aSv9fGe5huVWtuY6AssdCrVlcQ
	icmC+ByhgQqOZGLx42EROSZE4y92yVSWyaJZO/wcFILbZa+VA7vHPC/Qjmqbol6Ve3VG14zFtVwv5
	/n25ojiiAk9gFyi47CfL8Neutc4/+NwZQdboFOp6gv0u6YSei4Oz7eV+KrlILRHyG02Yd37NNCslG
	U+hWvmWSDm6zDaUvG/Rb8PUkGGhg67z0IYFDNd3Yg06O5caJStSMz+XtX4zvn0j6bEGhhVBBZgXAh
	+jkLZedNuY2rNFwFH7RegpsYPvyH8I46VEu7zhRe7ttwbF4vd3DtoaqutHFvodU/U2YU+/1nEfQkj
	OKgMj1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYyc-0000000GLva-0Ju7;
	Thu, 27 Nov 2025 10:11:50 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYyZ-0000000GLuV-0SxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:11:48 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vOYyT-00CAuu-Mr; Thu, 27 Nov 2025 11:11:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=b+HGqQCZc4eTZBJ9S6jotkuvef/+Q9e4UGutZNIsM0k=; b=gleEvVb8YL3YCbwWkElFc3dyIE
	Bho6Zzifao6+XVQ3u1y7HfFoL9IPTQCfi2OP1SBZ4fITVbrZMZigVd0zXUH+3ZiLR0l+UQMI1KbG4
	RS1qbgRTzKI8Pi2TYR0gdURbDV9pGjFFSOiQSCwYUOpWAvxs/bO6zYJ0O6qbqPcNvw+5MOfy6aEuk
	oK8g6jUlfFxnXfxox9tj3xmLKyL5zSe2lct3Wv5Dxg45KTZKwqK921Fe76eROzzxjp8ijCmSDWuZj
	wTBIoy8WPAoPbkc87rEm3oRsPfRhtBA0kJ2/7fZkMA6ud3wE1maTh26BupWtyiphT+44azPZXnePY
	SJD/cZVg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vOYyS-0005Hs-Ie; Thu, 27 Nov 2025 11:11:40 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vOYyK-00FsJI-6T; Thu, 27 Nov 2025 11:11:32 +0100
Date: Thu, 27 Nov 2025 10:11:29 +0000
From: david laight <david.laight@runbox.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kees Cook
 <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon
 <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton
 <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC/RFT PATCH 3/6] random: Use u32 to keep track of batched
 entropy generation
Message-ID: <20251127101129.204c6c5a@pumpkin>
In-Reply-To: <20251127092226.1439196-11-ardb+git@google.com>
References: <20251127092226.1439196-8-ardb+git@google.com>
	<20251127092226.1439196-11-ardb+git@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_021147_311625_E9408EFF 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, 27 Nov 2025 10:22:30 +0100
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The batched entropy containers each have a generation field, to keep
> track of the base_crng generation from which it was last reseeded.
> 
> This use case does not require all bits of the unsigned long to be
> stored: storing only 32 bits is sufficient to determine whether or not
> we're at most 4 billion generations behind, which seems ample.
> 
> So use an unsigned int instead: this will allow a future patch to treat
> the generation and position as a single 64-bit quantity, which can be
> used locklessly in a compare-and-exchange() operation.

Probably best to use a u32.
While it will always(?) be the same as 'unsigned int' it is more
descriptive.

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/char/random.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index b8b24b6ed3fe..0e04bc60d034 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -507,7 +507,7 @@ struct batch_ ##type {								\
>  	 */									\
>  	type entropy[CHACHA_BLOCK_SIZE * 3 / (2 * sizeof(type))];		\
>  	local_lock_t lock;							\
> -	unsigned long generation;						\
> +	unsigned int generation;						\
>  	unsigned int position;							\
>  };										\
>  										\
> @@ -521,7 +521,7 @@ type get_random_ ##type(void)							\
>  	type ret;								\
>  	unsigned long flags;							\
>  	struct batch_ ##type *batch;						\
> -	unsigned long next_gen;							\
> +	unsigned int next_gen;							\
>  										\
>  	warn_unseeded_randomness();						\
>  										\
> @@ -533,7 +533,7 @@ type get_random_ ##type(void)							\
>  	local_lock_irqsave(&batched_entropy_ ##type.lock, flags);		\
>  	batch = raw_cpu_ptr(&batched_entropy_##type);				\
>  										\
> -	next_gen = READ_ONCE(base_crng.generation);				\
> +	next_gen = (unsigned int)READ_ONCE(base_crng.generation);		\

Isn't that cast pointless?

	David

>  	if (batch->position >= ARRAY_SIZE(batch->entropy) ||			\
>  	    next_gen != batch->generation) {					\
>  		_get_random_bytes(batch->entropy, sizeof(batch->entropy));	\


