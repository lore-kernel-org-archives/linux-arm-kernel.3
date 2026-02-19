Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3339C531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noiWKa/1v8Q6bqZCF2OXtlNzBTobKJN1KyuavxRqTY0=; b=qfSnZgP1EkTmIRq6B7Fg5O3nbA
	hr32YQ2p7XNv1P+OifUEXO1DoUVtVJ/dOn2ko9EUiChzKSamSsAsWPAc0bqcun4T+Smj9KNF0jlAU
	e8DegFaDwJ2vA3fqmb/guTgo9mOUgYS0amtwryXRqnkxRhKL9OJGNg/7IM5jZtzlCyELm/wXxmfZP
	VaOD+2O7++hKnpyYj9UDs2s3O3lVtp5tfAO/WaJ2B08tY/FmhEmy8Jq2OgrUiY3TFfKl8mhDp+cii
	oQX0igqutWP8krpdT8gdX4cUIBfVTFAFGeanoPClXY3wzZ57PFDqzZJhhiL/OgOkDK5LUDwtwS2nc
	7YwbOE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBXL-0000000C5om-3BHn;
	Thu, 19 Feb 2026 21:26:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBXK-0000000C5o9-1To4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E65F60131;
	Thu, 19 Feb 2026 21:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FF7C4CEF7;
	Thu, 19 Feb 2026 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771536373;
	bh=k3eIOjmh31KGZ2V8juxtChJ2D5hufhrXBQDrTquxias=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8KM43XhU0arShApnLbNpQww9PEWG6/97TNtfrZH0HjUr+Z4brlGSTbbhezLDlMsp
	 7jRtxA5Rb4YgrJdXftmRS7RSuHwZjfCEaShZ5FtoJ0qqtroxhhFs1/HQflZDllFqPo
	 9nRUFgJP23iqKE7nTRZZ5tPo4o8sh6y7sVtPMyMLMxtHrHMDKpsI2kyWe1NJFem/hT
	 XNDR9844+LCMGcGqyKi6tFGesrq2mhy6kfLQrVZLi0Y3wUY7qGNdWilcEnfwkN2cwy
	 f2kW9UBgKQYQ+i4F9p5tDpmxIH8q86oGB2a2jQraPI0fjzf1YZxBUH6oNNqyKXrYL6
	 ROaXgwKdprhpA==
Date: Thu, 19 Feb 2026 13:26:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/15] crypto: arm64/aes - Fix 32-bit aes_mac_update()
 arg treated as 64-bit
Message-ID: <20260219212611.GA32578@quark>
References: <20260218213501.136844-1-ebiggers@kernel.org>
 <20260218213501.136844-4-ebiggers@kernel.org>
 <21d30582-9cb2-4e7a-9aa8-36e16aa45ff9@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21d30582-9cb2-4e7a-9aa8-36e16aa45ff9@app.fastmail.com>
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

On Thu, Feb 19, 2026 at 10:23:39AM +0100, Ard Biesheuvel wrote:
> On Wed, 18 Feb 2026, at 22:34, Eric Biggers wrote:
> > Since the 'enc_after' argument to neon_aes_mac_update() and
> > ce_aes_mac_update() has type 'int', it needs to be accessed using the
> > corresponding 32-bit register, not the 64-bit register.  The upper half
> > of the corresponding 64-bit register may contain garbage.
> 
> How could that happen? Setting the 32-bit alias of a GPR clears the upper half.

The ABI doesn't guarantee that the upper 32 bits are cleared.  Try the
following:

void g(unsigned int a);

void f(unsigned long long a)
{
	g((unsigned int)a);
}

Both gcc and clang generate code that simply tail-calls g(), leaving the
upper 32 bits unchanged rather than zeroing them as per the cast:

0000000000000000 <f>:
       0: 14000000     	b	0x0 <f>

So it's possible.  Now, it's certainly unlikely to happen in practice,
as the real code doesn't use truncating casts like that, and the
instructions that write to the 32-bit registers clear the upper 64 bits
-- as you noted and as I've noted before in similar fixes (e.g.
https://lore.kernel.org/r/20251102234209.62133-2-ebiggers@kernel.org/).

So does it really matter?  Probably not.  However, given that the
correct behavior wasn't *guaranteed*, I think that to be safe we should
continue to consider patches like this to be bugfixes.

- Eric

