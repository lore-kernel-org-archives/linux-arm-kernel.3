Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B4ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBqtPpbnDUHvMwRHYxo4B5W/PSfEHv5J64H6u5012lI=; b=rXRF7DsPhLLGTtXuPFKlYMgyth
	9i8gk6y2qqg91fo3hF1a7dUL0vsrDvj2im8tVf8RNS++amlnAqdikvJ9+4+bV6G4gPkJ7fS4z8m9P
	o42qkZTUtZgbWJQcv1hngDx5CDS8BjA6VDbi3dGp+nUjNDH3dRfTrXGnfWd7Ow4H8let9hATvalRX
	rM7yzMMeTllHT9oEyQQElwbrRxK4o5B9N4GryTw/xJ0j3TBjcDdZJhwCrY/FprwIHb/dEMx40QJJQ
	cUpS2uYymFHHhqyIfmtuDjboK1+spFn3vz9/kW9LQRsOAiaUcLfKyhfpCcVkR2BnRKtp0nNa1ziCZ
	mmv0HTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyPhf-00000006xyW-4069;
	Tue, 16 Sep 2025 07:02:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyPhd-00000006xyB-0RbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 07:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69D1F44AB5;
	Tue, 16 Sep 2025 07:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C410DC4CEEB;
	Tue, 16 Sep 2025 07:02:09 +0000 (UTC)
Date: Tue, 16 Sep 2025 08:02:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMkLb6jPiSbzeRWL@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRQIeIdyiWVR8a0@arm.com>
 <aMfrR0vserl/hfZ3@e129823.arm.com>
 <aMhrscd1gz_syMtL@arm.com>
 <aMh4q4-xAPHnaOul@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMh4q4-xAPHnaOul@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_000213_181222_087F574E 
X-CRM114-Status: GOOD (  18.23  )
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

On Mon, Sep 15, 2025 at 09:35:55PM +0100, Will Deacon wrote:
> On Mon, Sep 15, 2025 at 08:40:33PM +0100, Catalin Marinas wrote:
> > On Mon, Sep 15, 2025 at 11:32:39AM +0100, Yeoreum Yun wrote:
> > > So I think it would be better to keep the current LLSC implementation
> > > in LSUI.
> > 
> > I think the code would look simpler with LL/SC but you can give it a try
> > and post the code sample here (not in a new series).
> 
> If you stick the cas*t instruction in its own helper say, cmpxchg_user(),
> then you can do all the shifting/masking in C and I don't reckon it's
> that bad. It means we (a) get rid of exclusives, which is the whole
> point of this and (b) don't have to mess around with PAN.

We get rid of PAN toggling already since FEAT_LSUI introduces
LDTXR/STTXR. But, I'm all for CAS if it doesn't look too bad. Easier
I think if we do a get_user() of a u64 and combine it with the futex u32
while taking care of CPU endianness. All in a loop. Hopefully the
compiler is smart enough to reduce masking/or'ing to fewer instructions.

-- 
Catalin

