Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57194CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE9pjO3UpZdaA8ZHIvUnnEVbk9/ieWSHw5PejiTXCdM=; b=QxeE6rTxG0V2TAIj0knLUnq5zG
	5fItuQ5YS2FZ5QwjcF4BemDLi/w4wRwTIPfeav/CaxJ0mzqr6Ykmd8Ag0OdmXn3h7Y0sDeMlrefCl
	PtGVJeirDnQW7MZYjrHjAL6Ta+ZcbwS5IBIJow1bgPwz+l/mi5PoasZwkWzAEdp/lkVeLu3g9SueU
	7PcpbRE1BI19GOxpRl7CbSTH1xTe1YcUqYMcK97VRpMXtWqSA0JaNhg4k01cFilbAzLRxBgQxk6D9
	WDpLQzBA1Pj4NEZHXi+ASGVJCjZsiyIwDcSwiZLa8Krqc0dNG6lnKXjg6YJs3bARpHTkjSEwnVpo/
	GaAdTybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWm1-0000000BlSm-26rR;
	Mon, 24 Nov 2025 13:38:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWm0-0000000BlSX-0YNk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 13:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 028EA60167;
	Mon, 24 Nov 2025 13:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E929C4CEF1;
	Mon, 24 Nov 2025 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763991510;
	bh=B3XxBWJfthTej/qaAy/mzipRhOyNUi8ahgoYJf5vnms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3h78+Orb7KyZeoZDFEzQ1zvbY37167Fsft0+oJzz4aIL13eeiTC9HWmrsBRBAuWs
	 1wVM8MO2IjiT6G8UFXawUpHg4bSdnHkFaop6OI/ogGC1m9eWp2T5taMVQtBfAW8hXL
	 XBCRQxgQulHJcBg987zerjLNmBbEQVuAwBS55mSuoPX7F1aiW5vSUhpwdl6TCsqlfH
	 7356thh+tPjfglTqt0ArOsCBXZjRdYalxfIw5k0MyhXxmN9Kiovk/DIJPioRRra3Eq
	 1wHfsjUs9/mF+1YOQfsZu4AiECVUN3K50MNayLfP42to7xWlJ+8WPd6pmHnTvmrRnm
	 DLBFXCq+x810w==
Date: Mon, 24 Nov 2025 13:38:25 +0000
From: Will Deacon <will@kernel.org>
To: Luke Yang <luyang@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jirka Hladky <jhladky@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joe Mario <jmario@redhat.com>
Subject: Re: [PATCH] arm64: clear_user: align __arch_clear_user() to 128B for
 I-cache efficiency
Message-ID: <aSRf0doyqsnYk3RO@willie-the-truck>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
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

On Fri, Nov 21, 2025 at 12:04:55AM -0500, Luke Yang wrote:
> On  aarch64 kernels, recent changes (specifically irqbypass patch
> https://lore.kernel.org/all/20250516230734.2564775-6-seanjc@google.com/)
> shifted __arch_clear_user() such that the tight zeroing loop straddles
> I-cache lines. This causes measurable read performance regression when
> reading from /dev/zero.
> 
> Add `.p2align 6` (64-byte alignment) to guarantee the loop stays within a
> single I-cache boundary, restoring the previous IPC and throughput.

Hmm, but what's special about __arch_clear_user()? If we make this change,
anybody could surely make similar arguments for other functions on their
hot paths?

Amusingly, there's CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B to play around
with that and it sounds like the irqbyass change you cite calls into
the category of changes highlighted by the Kconfig text.

Will

