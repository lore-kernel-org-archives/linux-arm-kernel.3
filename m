Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30711D6AB16
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI/ylvMa1BoJAUQITdb6p7FMvC5dED11hyWsQHArcRU=; b=Ay6yfQxKZqGQDjCsZTIQL7qIq9
	DqnvU+FqZgcYsNa98A/iBk1p0/0effsAuoJOx35ZYSszhZ9LvQM4SzXi5eZ0VMyDQyyXDgy4bXddC
	ffVE7FOrjFFqk11LC6g9rkXc2/H3IG3NKsktWx7WhXUvMTOx98haiXkEHrsEBnXYHhQqKByNs+spg
	0xM3VW5W+ZLO4qRPMwcKVDxrNVq0QydPhk3i23stwiKR0UizpH0Q8tXWGGnOu0nuV8Epm8v+uPHIU
	YsXsM5oxhsUKENhc+4TsL62R9fHDViqdGFyUzS6VvF3+DJGJnK1yS52RxrijKY6xxV9Tt//sPM9g7
	qRCEXzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RDN-00000000vMN-3fIQ;
	Thu, 02 Apr 2026 23:12:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RDL-00000000vLa-2Krl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 23:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7327343309;
	Thu,  2 Apr 2026 23:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF0EC116C6;
	Thu,  2 Apr 2026 23:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775171558;
	bh=4KoKXeuV+gv1aO4Hc4y0VUJ5jWRGUCNj0cNm6N4ZxKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaWifGZVegT9SpOETXhU9V6uvCm/vc1EoEXUbbs1dDKy6k83jfr2k8pXcTd5tPnLc
	 GJx5Gr9+Qxvu2BVupi5HhTXnXl9TFApco+3XYr4clHdfBKDSj/UaGDQ4eFlimH14c+
	 +P1jBqErFJJVw04wRB7aXRUvpcGuuDIUiITHjcE9LSRxXRwnTfG/VEOhLFoaB2HAuy
	 A9m1Ud9W77BQlEBfrNagbd9CvehzlmuzBYpghs9iBWTI1x7V5osQlxYoS0deas46vO
	 aW2ROXaWzvJXeGSeyfsvIN119EV3AVBOqFO2OIvjEqva++Ii8O3fa2unMG3ZYmBGAv
	 4Ee9KbmrNGJyQ==
Date: Thu, 2 Apr 2026 16:12:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] lib/crypto: arm64: Assume a little-endian kernel
Message-ID: <20260402231234.GE2910@quark>
References: <20260401003331.144065-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401003331.144065-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_161239_619077_2223363B 
X-CRM114-Status: UNSURE (   9.22  )
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

On Tue, Mar 31, 2026 at 05:33:31PM -0700, Eric Biggers wrote:
> Since support for big-endian arm64 kernels was removed, the CPU_LE()
> macro now unconditionally emits the code it is passed, and the CPU_BE()
> macro now unconditionally discards the code it is passed.
> 
> Simplify the assembly code in lib/crypto/arm64/ accordingly.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

