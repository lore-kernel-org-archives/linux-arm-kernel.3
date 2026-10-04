Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65096CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxrMNZZf0uYmFShF93RemPPEWrIzfT8gXRg7Jp/sqWg=; b=H4O63K8yH25aGnBZSTx+rgjiuQ
	ZvvnzrkaN5TIlude3Uf3ZF4cBC3c0LClCHd+CVNa3QLUTy6IqrWaAKoi8V7/04niy1gh7DZIdf6TG
	mFHIW54Eli0mzzQ04rz8WZKJuS6/aeV2icoP1FMbTYCS2Huuuz17kNagWf5aefVLqQ2Z5jCaFE1uV
	yfBkbHWP/aklJLVNlVIC3Zsdffi0yHXH5hftzrzrJ0vzrUq74mox1e6yIAF9aGTHsJ3MpicV+w1NT
	6wWzu3Z6OyXL/22hPfyI6s0hWSD2N4Cgk4kO/VrEgfmiqr+sQDjU2o/zLSQAnueZ6gOSAabsy0hcO
	A9bygTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNPx-0000000Ew9w-3RRP;
	Sun, 04 Oct 2026 14:42:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNPv-0000000Ew9a-0KHJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EC2460120;
	Sun,  4 Oct 2026 14:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC4F1F000FF;
	Sun,  4 Oct 2026 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791124937;
	bh=jxrMNZZf0uYmFShF93RemPPEWrIzfT8gXRg7Jp/sqWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H3HqrvE4zEtzmEYvRqiUgJpInpC2o0qkiz5pGtNOBwR38g1jGRdJFSNEfxsZhXsA4
	 PbbF4Y8ilbs8RXzz60z7hTAb2taXmRtPC5wilbEeUBqmlko0vI/fbbdixDWrQJRFU+
	 Fu1VJbs2XTmnNOFCVczLT42yNaEm8IDoAdDLDT06w86EYgpUk0owc6VlSNBTRoG5Ey
	 4Is1aUVnxezmyvCwww9FNLlr/FmKLUGRkmFnQgKP+rAs1vjaYdaCF2ddNbdseCaSk2
	 yQQUrEI6aYp5eWkd6oFlDZFIkt1KWP0lju0LtxxMXNq1RMCNFrZ5iQ11nDBQv6TJV6
	 f+eMexcB8PEZA==
Date: Sun, 4 Oct 2026 15:42:13 +0100
From: Will Deacon <will@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ
 lookup
Message-ID: <asJlxV06xzDIgqW4@willie-the-truck>
References: <20260811041934.7609-1-phucduc.bui@gmail.com>
 <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck>
 <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
 <asISGdljsG86gUwb@willie-the-truck>
 <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
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

On Sun, Oct 04, 2026 at 08:49:07PM +0700, Bui Duc Phuc wrote:
> > Sorry, but how is failing the probe possibly better than continuing without
> > the optional interrupt? Add a diagnostic if you like, but aborting the probe
> > feels completely unnecessary to me.
> >
> 
> My understanding is that the driver is designed to be generic and
> support various hardware configurations, some with this resource (IRQ,
> GPIO, clock, ...) and some without.
> 
> If a configuration describes the resource, it means the board is
> designed to use it. For that hardware the "optional" nature of the
> driver no longer applies, so if we fail to get the resource the error
> should be returned.
> 
> A log alone is easy to miss, and the root cause still has to be found
> and fixed later anyway. Failing the probe makes the problem visible
> right away, when the board is being brought up.

If you're doing bring-up, you should probably pay attention to the logs.
If you're trying to use the device, you probably don't care about the
interrupt.

Will

