Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B150CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ojdKn/lOKMgAMWdudaRLs7ijZOQmGIm1euzqJpBPpw=; b=BkUS26Go7ehYQW73oNleL0W/TA
	eoCWfLsk1QTZ+MTWo07glPkufxqLRlKbjWuRFVGvHKbes2fzhq825agvkJtLknSLtRJ4dsYZ2/QoD
	UtR+wnGqDCKMg6UzIxzNhXVqjwhf+Fpu0xwCaZC26sJtFK4Mqnk6+NQCPKejpP3LhDWCBQSYNoRoQ
	nT96uyujYo1l7OXwTNO+9PD4BDWBioBM8UKbpFdZkGOX4Xl7BFGgvqy5eSDwMouFV6cX/VR9QZiP6
	XqyNLBDlyEhF88fKcYX/heBtXey/9uvU5jlYbWUgMPuIDONz5jWypVLP7DH02IPvY2pL+HmFw2G5k
	pHetnCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Jb-0000000GYxL-2QIu;
	Mon, 17 Nov 2025 17:46:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3JZ-0000000GYwn-1xHM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:46:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D295EFEC;
	Mon, 17 Nov 2025 09:46:48 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EE8E3F66E;
	Mon, 17 Nov 2025 09:46:54 -0800 (PST)
Date: Mon, 17 Nov 2025 17:46:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <aRtfabU9UaflfHYm@J2N7QTR9R3>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_094657_565170_237E7510 
X-CRM114-Status: GOOD (  19.43  )
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

On Mon, Nov 17, 2025 at 05:47:05PM +0100, Arnd Bergmann wrote:
> As I understand, the other architectures already just use the cycle counter
> because that is random enough, but for arm64 the cntvct runs on an
> unspecified frequency that is often too low.
> 
> However, most future machines are ARMv9.1 or higher and require a 1GHz
> timer frequency. I also checked Graviton-3 (Neoverse-V1, ARMv8.4), which
> is running its timer at 1.05GHz.

Note that 1GHz requirement is for the *effective frequency*, not the
underlying counter resolution. The 1GHz requirement means that the
counter must increment by 10^9 per second, but it doesn't mean that it
actually increments by 1 every 1 ns.

See ARM DDI 0487 L.b, page D12-6793, which says:

| Counter resolution
|
| The counter resolution is a representation of how frequently the
| counter is updated.
|
| For example, a counter might have an effective frequency of 1GHz, but
| the actual clock runs at 125MHz and therefore the counter resolution
| is 125Mhz.
|
| From Armv8.6, Arm recommends the counter resolution is not less than
| 50MHz in normal running operation.

... and note that (unfortunately) that latter point is a recommendation,
not a requirement.

> My M2 Mac is running at a slower 24MHz timer. Between two getpid()
> syscalls, I see cntvct_el0 advance between 20 and 70 cycles, which
> still gives a few bits of entropy but not the six bits we actually
> want to use.
> 
> How about we just check the timer frequency at boot and patch out the
> get_random_u16 call for a cntvct read if it gets updated fast enough?
> That would at least take care of the overhead on most new designs and
> hopefully on a large subset of the servers that are in active use.

As above, we cannot rely on the frequency for this, and I don't think we
should use the timer in this way.

To be clear, my objection here is purely about the timer. I don't want
us to rely upon something that doesn't actually provide the guarantee we
need. I'm more than happy with the mechanism for randomization being
changed.

Mark.

