Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0726ECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKd0rR0vYdw7TNYYE0+R6v5uU/CkiKwhomGx2lqxDSE=; b=wrxBqlO4KTU9Dn36csHU9fqllT
	E7g/o/rlJzAAYoHlhBi92QaIlvwpBu0VBlaqeutzTkMYroyLHQ7IwDw9SQfEgtrUNj5XR877zQtuU
	UovERsXAPtxIgG6WRtTmBjNK0AT8to1tV8w5XoOUSPHMygAmYgr8M5wWp0+nJ0gDOSU6W1wEAByns
	FcEHDzXVzwtf6zZN7GjDvKF8Yeu4bVgx2Mc6be2cRyigPkOpT3qZ6r8pZSexcUTc0wIXppKphslCe
	IvT1nsgMdlEF+0yz5IQ0Wt/FhHGEacWMjsrwTit6xUdeHCPFVyszd4zrHjpac6aBKClywIrouSfTk
	AJZaHI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIBV-00000007eUm-414r;
	Wed, 10 Jun 2026 12:37:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIBU-00000007eUg-3f75
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:37:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 452084199D;
	Wed, 10 Jun 2026 12:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6C51F00893;
	Wed, 10 Jun 2026 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781095048;
	bh=eKd0rR0vYdw7TNYYE0+R6v5uU/CkiKwhomGx2lqxDSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hWKqrVRwze2Xz+0rY8JQIX0p2Yox6UtVDfHF0lZwyPLxCGK94vGqaM6gA5HGNXiJ4
	 QTnbzaYmJcJGKE3YNCbejqJZVjWNLSCRbTQa1xYW8Nf231TVH82wxpWzGbkiSnVWNT
	 zkHQ9GdhUcdCNn5RzuoZ3l2GSp7gEq0lV0NPaK0Bhzgrn8/v77z/P2euPRkYgMaOhJ
	 2JazSTZq/ulXrTSjT1mrQoj9MXNct7F494dxeCyjzZ1kZ/a0Mli8umzDmdtydrY12z
	 ENHXQyWdMe6T/WUg0mHeDUOEEuV7ldm1NkBFMrUkdwBv2/G7EgMLbQefpVr2nQUrOP
	 7PHcVchNPKA/Q==
Date: Wed, 10 Jun 2026 13:37:22 +0100
From: Will Deacon <will@kernel.org>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, ckennelly@google.com,
	dvyukov@google.com, linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com
Subject: Re: [PATCHv2] arm64/entry: Fix arm64-specific rseq brokenness
Message-ID: <ailagpgcDGVoXgm0@willie-the-truck>
References: <20260508142023.3268622-1-mark.rutland@arm.com>
 <54ffcf73-dfc5-417c-b9d5-6dee551f8d39@huawei.com>
 <CAHnCjA1dGNH07YkWupg1THAmBhW=o4C+uhHbbcRX4edMj2rmEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHnCjA1dGNH07YkWupg1THAmBhW=o4C+uhHbbcRX4edMj2rmEg@mail.gmail.com>
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

On Tue, Jun 09, 2026 at 02:04:23PM +0200, Mathias Stearn wrote:
> Did the arm64-specific fix to rseq not get backportted to 7.0? We just
> ran our test suite against 7.0.10 which has the other rseq fixes and
> everything was fine on x86_64, but arm64 was frequently segfaulting.
> 
> I had an AI agent look into this and it reported:
> """
> The fix (commits b9eac6a9d93c, 82f572449cfe, 99428157dcf3,
> 411c1cf43039) first appeared in v7.1-rc1 and will be included in
> v7.1.0.
> 
> The three commits backported to linux-7.0.y:
> - 663121edad54 — "rseq: Revert to historical performance killing behaviour"
> - d242126fd21a — "rseq: Implement read only ABI enforcement for
> optimized RSEQ V2 mode"
> - fb742945d61a — "rseq: Reenable performance optimizations conditionally"
> 
> The arm64-specific fix (411c1cf43039 "arm64/entry: Fix arm64-specific
> rseq brokenness") was not backported to any stable branch — it will
> only appear in v7.1.0.
> """
> 
> Is it possible to get 411c1cf43039 backported to 7.0 or was it omitted
> intentionally?

You can send a backport to the stable maintainers:

https://docs.kernel.org/process/stable-kernel-rules.html#procedure-for-submitting-patches-to-the-stable-tree

(see option 3)

Will

