Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3BAFD707A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2RW4KVNil49SIu/NNeaYb1g2miI7X8SXT04qh8IXUY=; b=BXJ5x9u/funYELFfZZQyuwb2iO
	sX0IONS6tWDa1L7qYXkj8SpMlO/Cl714XcIO9giPQ71QzTaMWsGeM5KjVrm2ynPJVNQx3xy6fzKQ6
	3IutPiQG1RqwSiU3g/AFZ/6k+N5c+5guAcETVjmSS8R6lZjl/cpXz0oO6MLl8YnusI+4jf02MEMi1
	0vS/u/aAHyMIGiV28C0qUT9ZwcpuipSwGbNyNyufxliYrzAFZ6HqgHTeG3LS71QoGLIlUiOXw3OmE
	pKnNzrPh+3QF/j4V3sQY8VvT2WjzUbX45LrK/cO2Mo3hlN4Bq7zxW605n8/I3IXngbHro0cLYKjFO
	fNU0q/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SJO-000000065pt-0WdO;
	Tue, 17 Mar 2026 11:10:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SJM-000000065pd-0FX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2427B60018
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FA5C4AF0B;
	Tue, 17 Mar 2026 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745806;
	bh=3WAjNRN04nQy+fv7l48vENykenWQ85FeesFLfakNvD0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=k0ErCAZJ8zmoZg+4jAZE1H8O8hMmyEozfmeMdbLbmVAall0SEZIe3FA+YWbvtHQnQ
	 KgA02E7hKovf5GLtZOT1WilHHHeweJSQVfdZpEhz4FET7RKVpD/KX6UDsCLDgOvuUr
	 l4bDiJus83VdYrOBjBpahT5qV0wec9NIe27Sy/7Z9Xrb+KfY0nxwt0VE7CoVutDUYv
	 Z5SNO/5IctR7zm2Y6eakeitQPuWwfyyKyTY5Cnm4ntBKf7+ukavS3VVRT0EzDPBXgo
	 6wcGZT6nOb0FKs6bdYQQX6pl9UzN8uOmYnbj4O9B4eJuJmO5AVM4c2u+cs1LN+ezr6
	 4+vwujiimJ2cQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6014EF40069;
	Tue, 17 Mar 2026 07:10:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 07:10:05 -0400
X-ME-Sender: <xms:jTa5ae9g9SOHeQqsa0qKDEkuoQZbIZvlKWRTWQkthYx7IlW2x5rDLA>
    <xme:jTa5aZjTcz6X_-Bpy-NLQTxX_nspsG3HbhKKFxTp5_nAl8wRP8GHoMh0X_7ZfExx1
    pkegiuYBy45x2_5_m5e1TneyDZIZmzNhLNF8Pp0ZNHxb3UIDbdIab8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    epudenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:jTa5achZyU1vLYIMGKbTt0dFFKmX5h6-484cf6PaICoRCjY3mVL96w>
    <xmx:jTa5aXTukjgbmF1dWzMMd88bsQI0KhA4xrG0utrPe_HLS9je8FSR0A>
    <xmx:jTa5aWWb_24DKbQVkjdwODOhSHtD9gYWDDlvG-Cj58hFnx1WgBMXBQ>
    <xmx:jTa5aTRWPU7t33hePwFFokMYAQF6cMx5xq_Ajh5-CiWQd2dluVouTw>
    <xmx:jTa5aYlANUOVa_XQ7Ut0cb4nw74QxgOExhOtO2Ob32WXqtANylhjtPSm>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 41604700065; Tue, 17 Mar 2026 07:10:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A3tCmaBtu5Tc
Date: Tue, 17 Mar 2026 12:09:42 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <7e88b710-2302-4b7b-8f11-4e25088bb3c7@app.fastmail.com>
In-Reply-To: <20260314175744.30620-1-ebiggers@kernel.org>
References: <20260314175744.30620-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crc: arm64: Drop check for CONFIG_KERNEL_MODE_NEON
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Sat, 14 Mar 2026, at 18:57, Eric Biggers wrote:
> CONFIG_KERNEL_MODE_NEON is always enabled on arm64, and it always has
> been since its introduction in 2013.  Given that and the fact that the
> usefulness of kernel-mode NEON has only been increasing over time,
> checking for this option in arm64-specific code is unnecessary.  Remove
> this check from lib/crc/ to simplify the code and prevent any future
> bugs where e.g. code gets disabled due to a typo in this logic.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is targeting crc-next
> (https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next)
>
>  lib/crc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
> index cca228879bb5a..52e216f397468 100644
> --- a/lib/crc/Kconfig
> +++ b/lib/crc/Kconfig
> @@ -46,11 +46,11 @@ config CRC_T10DIF
> 
>  config CRC_T10DIF_ARCH
>  	bool
>  	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
>  	default y if ARM && KERNEL_MODE_NEON
> -	default y if ARM64 && KERNEL_MODE_NEON
> +	default y if ARM64
>  	default y if PPC64 && ALTIVEC
>  	default y if RISCV && RISCV_ISA_ZBC
>  	default y if X86
> 
>  config CRC32
>
> base-commit: c13cee2fc7f137dd25ed50c63eddcc578624f204
> -- 
> 2.53.0

