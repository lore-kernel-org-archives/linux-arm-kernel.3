Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A291C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/4PU6ql3rOySt5KicKXIt7AV1IpkBb2vzqjVBjyUR8=; b=aLp6ngVp8RMu1rSiUnkqgl8zgV
	dMuoLz7xHNDlpJzQD6McthdSq5YWO1zJQXYgs6sjaFugV09+zKloPtH9J+mY7g1qMhhuPBFfaLJ9U
	Yo1ImMPnpAUuzy2bKcpWI58jF8S+1fJa3LFQQJLL7DMDSAXUxyW6OiSQfkZNQ5NM9N/LPC8KMpCaW
	+BSkxXg4ao+cwcz/PJ6tT5jAuRQgLSuV76JvDdKLgGsDvqsIHO336tTG3k7gAyx3ESQqXHNvepwHs
	lEpy0mIHk/ZZaMkXCu6PKMhQpo0hAv9xbOQKJ1r5V4wga0r693L/PVefZi+xQKF2EdEmuoTQwqpWo
	2z6Nq2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKTp-0000000A7Nv-1UaF;
	Mon, 13 Jul 2026 17:30:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKTn-0000000A7Ni-3l78
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49A5843A99;
	Mon, 13 Jul 2026 17:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F4D1F000E9;
	Mon, 13 Jul 2026 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783963807;
	bh=N/4PU6ql3rOySt5KicKXIt7AV1IpkBb2vzqjVBjyUR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SQpHgpa6Bddqrt5e4wZBV5qUJS3Mhqs53xW1KXK4/OcQaWxYSrlffGG0+7RJ7Ff5P
	 Ilr/w47ByeZ1JoKIacFgU18uOHaDmXxfIFNJ2cipARFf8egODA7qnw8Yts2sakC5TK
	 esMNDaPE4rdcf/jk1JKik1hAZ/Kq1yhOKl+zjMl0=
Date: Mon, 13 Jul 2026 17:31:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <2026071320-encode-modify-6193@gregkh>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <2026071312-uncover-refining-8cac@gregkh>
 <20260713130745.GA2254@quark>
 <bd5821b9-7459-4db4-86ef-bd67fb645753@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd5821b9-7459-4db4-86ef-bd67fb645753@gmail.com>
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

On Mon, Jul 13, 2026 at 10:42:04AM -0400, Demi Marie Obenour wrote:
> On 7/13/26 09:07, Eric Biggers wrote:
> > On Mon, Jul 13, 2026 at 06:47:07AM +0200, Greg KH wrote:
> >> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> >>>
> >>> This driver is harmful:
> >>>
> >>> - It is much slower than the CPU [1] [2].
> >>> - It Has a history of bugs [2] [3].
> >>> - It does not have exclusive access to the hardware [4], causing races
> >>>   with the secure world.
> >>> - It register its implementations with too low a cra_priority for them
> >>>   to be actually used [5].
> >>>
> >>> Therefore, disable it to ensure that nobody builds it into kernels they
> >>> intend to ship.
> >>>
> >>> In the future, the driver will be used for processing restricted media
> >>> content.  However, the kernel does not currently support this.  Since
> >>> the driver will have future uses, allow building it if COMPILE_TEST is
> >>> enabled.
> >>
> >> Why not just delete it now, and then bring it back when it is needed in
> >> the future?  Otherwise this will just trip up the static code checkers
> >> who will attempt to "fix" things in it.
> > 
> > That makes sense to me, but Qualcomm pushed back on deletion:
> > https://lore.kernel.org/linux-crypto/20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com/
> > 
> > But I've still not seen any evidence that this driver is useful for
> > anything or has any users.  Even Qualcomm seems to be unwilling to make
> > such claims; they only claim that the IP is used (i.e., not in Linux)
> > and that new features are planned.
> > 
> > - Eric
> 
> Here is my reading of Qualcomm's statements:
> 
> QCE is currently used by the Arm secure world.  In the future, QCE
> will be used by the kernel as part of restricted content playback.
> Qualcomm wants to add the needed features to the existing driver.
> This will not use the crypto API.

Why is a crypto driver not going to use the crypto API?

> I would be fine with the driver being removed, but not if it means
> another out-of-tree Android driver.

It's not another out-of-tree Android driver if nothing in Android
actually uses it :)

thanks,

greg k-h

