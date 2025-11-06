Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5868DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcMpoXUKVXMjYCvogzPOASfPfc3YpL4LMcc+GiU8eNE=; b=DA2c5V7JnMGIX04ajXehPcOBAY
	uSBx6bQDaZYLMENgqhYNbTa3HXFtQ+ACZMETFm9pqwqpQ/RQOQJf0mWJbW4UTnsKKSxrzcKuHbJz4
	2PjTeouSrFUV6Z6Z/STj25jPXMF4IS76j4Lbhi1IVlKCz46TEYiqNv8U61wrrZ/3K1u5cD6PPgXDx
	zyqPB4Da9JDQgbSg8M6BSjiAapKKDX9fP+vPWhc4MbLKeR7SEBIxof5rFosNaFpjmr5jA73sE0ZjF
	56xGDKwbEo/i7j7BQYS13A1HtrSJEIHKVAxu4FG/3UCatdMJIGFfDewNMKwa9p3samp1VvE8mn9a9
	roDpSoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH61K-0000000GBL7-3qJe;
	Thu, 06 Nov 2025 19:51:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH61K-0000000GBKx-1u9n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43DCD6022D;
	Thu,  6 Nov 2025 19:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C217C113D0;
	Thu,  6 Nov 2025 19:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762458705;
	bh=j1nqThs17GwNA3HQ/A0bAO+y61WfI0vCdvNcpIIVI0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ku8tjLpZn9OPHJbydRU7gLzhb71B7VOxwwhTuM+6D49u01Eypvvg5berXffNnTRSM
	 XrvByyKlFst/3LSbp27p2/zQTcMTdDrYl4b+8xn1WxRhCiyaYKUNFTXq+/CE+jvFw4
	 AJiRpUk0rWqEE8JaKHOLf6HK/bR+JzQSEDHrY5VZjS1JJ5Bgt51BtyNB8Zku7hhS0v
	 EIOT8kLgmaxP243njyF+UaPfj2OK1T1gvGRNrLREalCh4xbj9SjvFjLmfFX7MfuEDB
	 IhzJl2nZkQ7dHakk2z7neV839/0V+BGXiItOON8gu6ZCq6pxoFVz+YM5/wU/mHZ8w7
	 x9Mojx8MuyjZQ==
Date: Thu, 6 Nov 2025 11:51:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Harald Freudenberger <freude@linux.ibm.com>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/15] SHA-3 library
Message-ID: <20251106195142.GB3318@quark>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <20251103173404.GE1735@sol>
 <4188d18bfcc8a64941c5ebd8de10ede2@linux.ibm.com>
 <20251106043340.GC1650@sol>
 <20251106072233.GA117499@sol>
 <55ec60661fb672bdd0696a3bd92e21bd@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ec60661fb672bdd0696a3bd92e21bd@linux.ibm.com>
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

On Thu, Nov 06, 2025 at 09:54:59AM +0100, Harald Freudenberger wrote:
> > Also, I'm wondering what your plan to add support for these instructions
> > to QEMU is?  The status quo, where only people with an s390 mainframe
> > can test this code, isn't sustainable.
> > 
> > I already have s390 in my testing matrix; I run the crypto and CRC tests
> > on all architectures with optimized crypto or CRC code.  But most of the
> > s390 optimized crypto code isn't actually being executed.
> > 
> > - Eric
> 
> Well, there are no plans. However, there has been a decision some while ago
> that "we" may support this in the future. But as there are currently no
> human resources available and working there I suspect a qemu CPACF support
> in general will not come soon.

Great to hear that you might have someone work on this in the future.
It should be noted that this is a significant gap that puts s390 behind
all the major architectures (x86_64, arm64, arm32, riscv, etc.) and
makes it much more likely that s390 specific bugs be introduced.

We need to have higher standards for cryptography code.

As I've mentioned before, I don't plan to accept code that uses new
instructions without QEMU support.  The SHA-{1,2,3} code is allowed only
because the instructions were already being used by arch/s390/crypto/.

I see that Jason actually added support for CPACF_*_SHA_512 to QEMU a
few years ago
(https://github.com/qemu/qemu/commit/9f17bfdab422887807cbd5260ed6b0b6e54ddb33).
So clearly it's possible to support these instructions in QEMU.
Someone just needs to add support for the other SHA algorithms.

> Please note also that this is really an implementation of crypto
> algorithms then and as such it needs to apply to some regulations with
> regards of the EAR of the US Bureau of Industry and Security...

Like Linux, QEMU is an open source project, published publicly, and
which already contains many cryptographic algorithms.  Check out
https://www.linuxfoundation.org/resources/publications/understanding-us-export-controls-with-open-source-projects

- Eric

