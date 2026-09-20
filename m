Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742FCC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EGif0kPteReu4FEo63SSbb6sEw1DT4Y1+qAgkau8gc=; b=vwbi30Pih6/JoSGTbKqPaEej7H
	fexg6FzZJ9Utmj2m0vnpJOQfqm7LaGev5Wg5FqT4jT2wsCeirQzKJZIiZJ0NBtohg4TO6vhdk8PZh
	/PbiqDclNVWF/iSOIJbYckecIQ2yh8jCYTZkn3ybu/NfPV458MtX4BjWLFaMvOlgn6664J85o57oR
	wdICf3GOXea2DJSUqNhJKNSISaiAzWxT+wF+ngO19fKh4lzmsgJqZKxSPmDV9/So1D8RxhIzuzyI2
	xn7OjgE24y9HWsnou4MyoiKE+o1WBBp2qjWGyfZP0H6j24oGpXoktOfJF5+6r3mmykN+vWBgmuXo9
	kJDkUXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NeQ-00000000L45-1q1e;
	Sun, 20 Sep 2026 19:56:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NeP-00000000L3y-0lpM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A5560E48;
	Sun, 20 Sep 2026 19:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE111F000FF;
	Sun, 20 Sep 2026 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934196;
	bh=5EGif0kPteReu4FEo63SSbb6sEw1DT4Y1+qAgkau8gc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RSzJUsV40uZ9OQ6MNASRkEc2xi9XfCzPzz9xY3MIRgjao1EXKWVvDeQDmIwJwV7m9
	 eCaJZfZhs7SI/98r5NVDjqfwPq1gXSAiaeMIycqXENN3007UG0BDt9kt+P664YD5KW
	 ZAw8bQJYAvNXhXK/tqhfWohhQBhS6qtqeJtpe2SZJFAsA4hgF0iKgY4kKldqCZ3lL+
	 EhsVUVdJ8Hg6GHsvJgZ8a/zDetTVHiwRBPTKDonhNbJ691Y0xghnUEE0axogVMEkR1
	 a9RNibsftC0xFVrs6iqpZfVAwkd8F5PE+JI+oTBXLIbfNHX5PxEWzVGUxAhCGKhADe
	 9MFGD+wn1jmqA==
From: Thomas Gleixner <tglx@kernel.org>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, Eric Biggers
 <ebiggers@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 01/13] selftests/arm64: Remove big-endian support
In-Reply-To: <20260918145217.1669-2-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-2-will@kernel.org>
Date: Sun, 20 Sep 2026 21:56:33 +0200
Message-ID: <87ld8v7l3i.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Sep 18 2026 at 15:52, Will Deacon wrote:

> Big-endian support on arm64 depends on BROKEN, so the arm64 selftests do
> not need to worry about testing this configuration any more.
>
> Remove the 128-bit byte-swapping helper from the fp-ptrace test and the
> big-endian definition of RSEQ_SIG_DATA from the rseq test.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Thomas Gleixner <tglx@kernel.org>

