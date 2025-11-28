Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DF7D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwtFy12k7pcBtaBx7XCC7zsQfGXj2p1ui+rmNS8beZM=; b=NAFy+2bhm3HyCpGpdMS3vhOHX1
	vf214J7hTwEWJkHvJrtiRmAjI3BokSVftmvYKx1aoYMtMfJzmAuCs7wYx7z82iPRlsmE6abllosev
	5vDbjJSH7R7xLUOU12gbksWMjK435kp3fczKEQG6brOLeE0JsUN/BQCIGw1SAr2ZIUZjP7Mn97t6m
	M3cMu8AAWeawbjGUwBeFgsaLzIrkM2WSFF2uPn3/zhkPh4aT1uK311e3qsryuFg+3DkldayS9WSaw
	nw5s3ObPAmIRuW5pwqoT/7Ud17f3+7JqmD1lmajrPxLMhK8guW3uGJvj/LcYAJo8/T8zgljWu3/Iu
	juGamJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwQ4-00000000LUz-1J8d;
	Fri, 28 Nov 2025 11:13:44 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwQ1-00000000LUH-3p3l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:13:43 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vOwPu-00FkCv-PO; Fri, 28 Nov 2025 12:13:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=MwtFy12k7pcBtaBx7XCC7zsQfGXj2p1ui+rmNS8beZM=; b=IYm3uWpRmXV7UHhqz5wm5BUjq6
	17pwTdumu1ocLPSW1uNg4VOxp2lhbAvxGGL5rqAcIn5Jdj55SEis8SxHXIrmFuelaQwKSX9AuyLYa
	anAYbIfRmq+dZnxJ40adwB11kMZri7kQGksdsUKP/BZoc1lHHZjbtin097Qa+tPgerQY2q/96gQRe
	0HD/36PrsaBbvFZYsNHGy8+EmpiDCcZz1kiwe3kRU1cuQEAh8MGCqUCnzeeo9rmvUdIbhDwk0mCn2
	N7crtj9XFUhYNEVx5+9vwYK+v9RfcclTBD23Ym0yMGpRcp8+h5G65W9BsV4AwDfg0MxVi81wzVlAQ
	ioH1Qmxw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vOwPt-0004jg-Qx; Fri, 28 Nov 2025 12:13:33 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vOwPr-000RyT-Ab; Fri, 28 Nov 2025 12:13:31 +0100
Date: Fri, 28 Nov 2025 11:13:28 +0000
From: david laight <david.laight@runbox.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kees Cook
 <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon
 <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton
 <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC/RFT PATCH 5/6] random: Plug race in preceding patch
Message-ID: <20251128111328.68354182@pumpkin>
In-Reply-To: <20251127092226.1439196-13-ardb+git@google.com>
References: <20251127092226.1439196-8-ardb+git@google.com>
	<20251127092226.1439196-13-ardb+git@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_031342_115155_7DA65A85 
X-CRM114-Status: GOOD (  21.37  )
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

On Thu, 27 Nov 2025 10:22:32 +0100
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The lockless get_random_uXX() reads the next value from the linear
> buffer and then overwrites it with a 0x0 value. This is racy, as the
> code might be re-entered by an interrupt handler, and so the store might
> redundantly wipe the location accessed by the interrupt context rather
> than the interrupted context.

Is overwriting the used value even useful?
If someone manages to read the 'last' value, then they can equally read
the 'next' one - which is likely to be just as useful.
Moreover the zeros tell anyone who has managed the access the buffer
which entry will be used next - without having to find 'batch->position'.

There is probably more to gain from putting the control data in a
completely different piece of memory from the buffer.

	David

> 
> To plug this race, wipe the preceding location when reading the next
> value from the linear buffer. Given that the position is always non-zero
> outside of the critical section, this is guaranteed to be safe, and
> ensures that the produced values are always wiped from the buffer.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/char/random.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 71bd74871540..e8ba460c5c9c 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -547,6 +547,7 @@ type get_random_ ##type(void)							\
>  	next = (u64)next_gen << 32;						\
>  	if (likely(batch->position < ARRAY_SIZE(batch->entropy))) {		\
>  		next |=	batch->position + 1; /* next-1 is bogus otherwise */	\
> +		batch->entropy[batch->position - 1] = 0;			\
>  		ret = batch->entropy[batch->position];				\
>  	}									\
>  	if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {	\


