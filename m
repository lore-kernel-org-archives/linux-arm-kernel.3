Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5EBCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9aEVym/RLd4tmR48YKaaHoFNY3l8U8s4kydBuwmD5E=; b=JB7oUlE0nd3D1xIY4ZWt4fgOs/
	1pRYQvfEh9HfRuXOiqr1EKT3Sk5ytz8+TVJNYKQc8iq3Dj8xiWd9PJbj/qTnizNxSDwCPfI/LXfUe
	QTC/TVEpdLhVhSEssuP40V9fjLRPO7H5evNO0vMD0jH+ZOy1y7ssH/nhZi3Fxs3C2RoRO/LxapwGX
	TE5xv/Xn2dKdjMxnb14EGp2GvUzUITTwUlm0VMUeGtPUN7AOm3DQaKUzMcMWABFrz4nm9dA5HNAg3
	VNHRqMoVefKWHJlD3AuBVhg849LUzT07jDirWUodtuUIzTYqhkEPiLIGaum700j0zgX++nylNDN/7
	CAuep9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXgA-0000000Br0B-2jww;
	Mon, 24 Nov 2025 14:36:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXg8-0000000Br05-3xFU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 14:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFE2060123;
	Mon, 24 Nov 2025 14:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A146C4CEF1;
	Mon, 24 Nov 2025 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763994990;
	bh=jv+kHE0CbbAmhUFnnaX4NXCqihvcaq32PQYDP3CMyI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lxfjr2T72UKaCpHYIhwm/V7poM7aGoLcwcP7CVLX2+F8oba3UvBNF/pqTl9RnpiFW
	 W0aWtEGve2b/7c9356hgf5jdkxNNgQDw1VbY02GqGQUBNkKWKLLQ2NWbp/a7Ajmiby
	 h63E/JG5HZP2jcANq5iqaMMToz4bIMnGBc/ygNq08beHtpZfmgL2MlaUQ3pNAV1Whh
	 DiIc+t8kIm6boix6bpi5vQ1ME1sUweNx1g83nDvMlbtA6Bk962XrwuLfvFaSdqAkfM
	 s9jqTjY4/7ntF1qbw42HQ+PkHSOZrJZkBLIOpvpqNUudmXvKg+rVJ8/I/8fRRdmF0o
	 2jtcxdw3YAQHA==
Date: Mon, 24 Nov 2025 14:36:25 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <aSRtaVjfNc11EtKg@willie-the-truck>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
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

On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> On 17/11/2025 11:30, Ryan Roberts wrote:
> > Could this give us a middle ground between strong-crng and
> > weak-timestamp-counter? Perhaps the main issue is that we need to store the
> > secret key for a long period?
> > 
> > 
> > Anyway, I plan to work up a series with the bugfixes and performance
> > improvements. I'll add the siphash approach as an experimental addition and get
> > some more detailed numbers for all the options. But wanted to raise it all here
> > first to get any early feedback.

FWIW, I share Mark's concerns about using a counter for this. Given that
the feature currently appears to be both slow _and_ broken I'd vote for
either removing it or switching over to per-thread offsets as a first
step. We already have a per-task stack canary with
CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
do something similar here.

Speeding up the crypto feels like something that could happen separately.

Will

