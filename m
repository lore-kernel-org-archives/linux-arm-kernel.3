Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D7ECCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsnm71MsMkbjVMz1/ZzNbYFWVbK9wiZetauwinI26FI=; b=say+4ttJXPscVLCIiONbu4YzQs
	VqK0PYGufxlmbtENVIlp80xJErIoTHX5dVpq35ui21R3i7+zpRMg/LsZxit3M5u6PRkU6fhihF/xs
	5/wI/I1KNUsR7YhIUxxtJiSmW06VzNTQB28rDY32itVDfbikyFnukplN3mj4mtfvpKEPsfvZJiOnb
	3xTGumJ1/5uUMZZvozjBTTnz6TuRwvRZ1yspSBkQNcusSghD4HTg1i/fdeZhzThsrwE+v1lfhE8H+
	SqcRAWuIDDqKrgfhXXhshWIZzWMPHHcu6sfZx+GnNklCdaHzZubkviVNGcm02wwgFdCZDIhvAO6a8
	x7OO7a4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxJd-0000000F5OM-41Zt;
	Mon, 20 Oct 2025 21:21:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxJc-0000000F5NX-12Kc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 21:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FB7E62198;
	Mon, 20 Oct 2025 21:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A057C113D0;
	Mon, 20 Oct 2025 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760995260;
	bh=3iQtO3/kT4dQdze6I2jUqdxwmT21PUB21GiN34k5zuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJfb7WcbHlUO2BEDHBsJR6EKLKqG8NPDzL40eClZQ5mz8tqWZx5RcwwnI1n3IcyP0
	 WPRp4LqWfpBNFglRnrGKQTS4c4yPJR04wJ4Tn8DRV69i+ZkbsNZBQm7euYWIuROI0C
	 4o6qHZev+N4/UEzpExWxC0g3XE3h8qjBi47xgpPW0O/lCPUHzY23ViHODapCdaxS6G
	 iBp+AKOEmDAIgL2tPols+oykkzqt7n9mCZWPJG+g/fy6DWsE404wLDETrKAckzb17T
	 aSZt6uA6cxVlKI8FzNqBBOisFSE45rydlnsxwzHudMQnmD+qJ1TjQLKqKV1jzty35J
	 gI2DZtm1pIZ8Q==
Date: Mon, 20 Oct 2025 21:20:57 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH 16/17] crypto: jitterentropy - use default sha3
 implementation
Message-ID: <20251020212057.GA83624@google.com>
References: <20251020005038.661542-17-ebiggers@kernel.org>
 <20251020005038.661542-1-ebiggers@kernel.org>
 <1062228.1760956530@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1062228.1760956530@warthog.procyon.org.uk>
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

On Mon, Oct 20, 2025 at 11:35:30AM +0100, David Howells wrote:
> Why don't you take my approach and just call lib/crypto/sha3 directly rather
> than using a crypto/ object as an intermediary if that crypto/ object is just
> going to wrap lib/crypto?

We'll do that, and thanks for writing the patch already!  But that's
something to do in a later patch after adding the library API.  Your
patch description kind of raised a red flag:

    Make the jitterentropy RNG use lib/crypto/sha3 rather than
    crypto/sha3.

    For some reason it goes absolutely wild if crypto/sha3 is
    reimplemented to use lib/crypto/sha3, but it's fine if it uses lib
    directly.

That implies that your changes broke crypto_shash, so you *had* to
convert to the library right away as a workaround for that.

That shouldn't be necessary.  We should generally keep crypto_shash
working for now.  In which case, all jitterentropy should need for now
is a simple substitution s/sha3-256-generic/sha3-256/.

We'll convert jitterentropy to use the library API too.  It's better,
after all.  But it should be done later and because the library API is
better -- not as some sort of workaround.

- Eric

