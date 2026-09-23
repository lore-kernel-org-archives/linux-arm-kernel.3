Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4E7C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhq8M0bpMaERJEmL5HHJ4uUb6lbtrmHobr4GrUUBw6Y=; b=2ImITAVPv3RZu3yy1okHS8IGZy
	C6ykSB2FAKDdSxmRlR+bbcqsh+X8ETltSZ3x3+2/4sI7pXpoKGGRSPE/Y6FjJH5yECrHgQG3NAmuv
	M3+uFj4xpegXZvQkx1lsI2aOT3SaF3ZKCnRB7yR5u+Ymyyrf6V82AtcDxsJuJbIh0kn7VYGdDDsK5
	BhOh4ExauBGsT5B1baTdWL1SGt6kUEe/DU8y8WFPLXXDmLu4dpfIeUASZ4GqbB7KvW/mBk+3nsBNq
	cVEIMqaaHbLLKQanvtgWgW2RsVZq0fEtsVCwuhmlkQos4ie6QryRqloV+oEYTgLBVzYqbUF/ASycQ
	DIjtYkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FLR-00000007AA3-18Dq;
	Wed, 23 Sep 2026 05:16:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FLQ-00000007A9x-15Zm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:16:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 652A8600AA;
	Wed, 23 Sep 2026 05:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88031F000FF;
	Wed, 23 Sep 2026 05:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790140595;
	bh=hhq8M0bpMaERJEmL5HHJ4uUb6lbtrmHobr4GrUUBw6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbjzkM/ajcnT1FwT6w33gdufHf1q3sl3qNUxReQNvImCjgoUQN/HuiQj/Q5aCcYBL
	 LWQjmSjBYQ4APRFTek0I4ncl0Hax3aqVu25b1TNnsYmrSmFrOzZkRYgN8/Uh08/G4E
	 lifY02K7QQIHgl4aMsQZedquCFjiNHQvg9MCx/kRUzRKnobTJNZFOqVvFXHQ1v5sH8
	 ePlcz/XBGnE0SbjEsEwKxoebT1On28FxGNF1NxPZ0qClR3ei1ouJOBvlhISoKKajh/
	 GDTG48rU+aEJr4raac2V9uU+AJXV4PzU2zqx0PQ/w3jgE3cIEKBE/CVW70EXXw7gMb
	 eV/kA/K0G6lEg==
Date: Tue, 22 Sep 2026 22:16:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v2] crypto: sa2ul - Fix stack overflow in
 sa_prepare_iopads
Message-ID: <20260923051633.GF42709@sol>
References: <20260831055141.1632832-1-s-vadapalli@ti.com>
 <aqpawGagrSvRkpTi@gondor.apana.org.au>
 <beba08cf-3e1d-4510-9498-d126482cdaa2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beba08cf-3e1d-4510-9498-d126482cdaa2@ti.com>
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

On Tue, Sep 22, 2026 at 06:33:51PM +0530, Siddharth Vadapalli wrote:
> On 9/16/26 2:30 PM, Herbert Xu wrote:
> > On Mon, Aug 31, 2026 at 11:21:38AM +0530, Siddharth Vadapalli wrote:
> > > 
> > > Since crypto_shash_export() writes 105 bytes into this 104-byte union, it
> > > overflows by one byte into the adjacent stack frame.
> > 
> > This should be converted to crypto_shash_export_core which exports
> > just the hash state without the partial block buffer.
> > > Changes since v1:
> > > - Propagated error from sa_prepare_iopads throughout the call chain.
> > > - Added missing check for authentication key size being within limits.
> > > Above changes are based on Sashiko review of the v1 patch at:
> > > https://sashiko.dev/#/patchset/20260819142357.3950463-1-s-vadapalli%40ti.com
> > 
> > Looks like Sashiko is still not happy:
> > 
> > https://sashiko.dev/#/patchset/20260831055141.1632832-1-s-vadapalli%40ti.com
> > 
> > Let's split this up.  Just do a one-liner to switch shash_export
> > to shash_export_core, that should fix the stack overrun.  Then
> > fix the long key issue in a separate patch.
> > 
> > I think you should support long keys properly by hashing them as
> > crypto/hmac.c does.
> 
> Thank you for reviewing the patch and providing your valuable feedback.
> 
> I will split the patch as you have suggested with the one-line fix patch
> posted first followed by an independent patch posted later for handling long
> keys.

https://lore.kernel.org/linux-crypto/20260923051116.92741-1-ebiggers@kernel.org
fixes both bugs properly by using the crypto library instead.  There's
really no need to even consider workarounds using crypto_shash here.

- Eric

