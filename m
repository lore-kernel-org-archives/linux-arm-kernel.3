Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3BED7495F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxzHXqeDqY9t/11gtGEbdQsLaIrr3yeQ/mgrsLtUM+A=; b=liwT6w5MOSYjzypjjoSP+K12/B
	le+FmLNHYghdyhjAhrt0SNa+O5IzjyR4MLrWNGUbZ5Zvkq9WLeR9EZ824On7eBahCnVWkaMXHme0E
	4Sa1Q5AWOMYJHPXBB5SLXwbRZBcLevL02vSplFJPD5ReYPGEnJekA6zVv/XAbtiCaVmhk8DU1HTXD
	+a78CT1KhloYjZjIXvRx/E/azzC3hI/HIXKcE3IWuSMEWY7S2UK70Zic8+ULiVqDD+UXkON4194jv
	4XlNduWN8DwccPYxdJGjfnonWA1Vsq3nH/b7SzS6TZNzya5Jajxnys5Gvp+793YibEFl8pHAeyPxq
	QtlmTUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60MB-0000000Gfj7-3gl2;
	Wed, 30 Oct 2024 04:30:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60KY-0000000GfcV-3bqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:29:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 089D5A43328;
	Wed, 30 Oct 2024 04:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDE5C4CEE4;
	Wed, 30 Oct 2024 04:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730262553;
	bh=I5QSLHyldsBrSOgK2QeLUkpFngdmQHYOQ/3tNOCCEdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BW66w1duAm8oxkGdkhZpeNU+ZyojHVFYlN8GfVwTBksZtjDeYKErxw75+UqfdQmfK
	 Ge2HAgPzVpQFtJJb23p/Dto/krsNrDPl1Ynp0wCA5t92GaoifQ3HbPFJk3VxZawdbh
	 mrSXU35bGOqA3/uImI5xCVB5bBRQ2TNzUxp4x3ycu8CGDk8O7+4G9yRVuZfwKreOei
	 7jnhxqrwvOkLPWPmblySSjmZYdHZEGJBF3Wt+TlknV5nXFYqah9OScRMgSWEzeRPOV
	 4ovvIFlts9F/lJj3hdL/EgtKi4UIPC7eP73yCvowpPpwOTHs0BQ18OmPSYpLACOG0l
	 bwVk37jhyKVsw==
Date: Tue, 29 Oct 2024 21:29:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 4/6] crypto: arm/crct10dif - Use existing mov_l macro
 instead of __adrl
Message-ID: <20241030042911.GD1489@sol.localdomain>
References: <20241028190207.1394367-8-ardb+git@google.com>
 <20241028190207.1394367-12-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028190207.1394367-12-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_212914_986785_81048B1C 
X-CRM114-Status: UNSURE (   9.28  )
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

On Mon, Oct 28, 2024 at 08:02:12PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm/crypto/crct10dif-ce-core.S | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

