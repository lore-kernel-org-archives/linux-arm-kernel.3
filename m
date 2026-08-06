Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822DEC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERPAPKSxnpd0vSAax2oMcQVD/OrrkZRHuzs0BledQMs=; b=z1E0A9B5Q8BnAVaWOCqHx9U5rB
	KoqrCkkJzLi9JsKuTr4ItswanfD9l7Q6b2/trNEdnWrlVxbAHiyUMhB603/lVSDb2PY0GdA6JX1k3
	iN5MwSBfjJZY8wvOG2gphk5h8QaQXm80iE2XbleiMCFwVxYrUvlX5A2nnEMcE59mf6Ei9VH+zbgF2
	7iqcP6LEIWmSovPkHkB6UYtty6zA3U6KexE+rcX20JhKCc5UAMUU7/TLIhj8EtGXc/wRy97FwHn+O
	vOdvRtX0dVRil7Tr/3QLI5/xHP6IBDbsl0iuKz+y8Fk7XK7m6TrO4ofp9cwuMajmla2nA6bkFCd3F
	Z970p0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvmp-00000005au5-0JEQ;
	Thu, 06 Aug 2026 10:57:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvmo-00000005atu-1Qrg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:57:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC144363D;
	Thu,  6 Aug 2026 10:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4E01F000E9;
	Thu,  6 Aug 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013838;
	bh=ERPAPKSxnpd0vSAax2oMcQVD/OrrkZRHuzs0BledQMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPp3cDUeYthW9eFgy+ZxuPxn1z1C0iNeN+ZS+amHMCB5eIAjgAswzl3PJpsstV/jR
	 9iZLIioD3mlI5QAr7WNMvQUIZ5b0kEd6HPieGOj7XW03XR1m7HxSKRCA1CeuF6CENK
	 U7gWUKlJUuccmgA1AYoS281ONmuTxu4DiafcHjdkxbaCZvYZqilcSMRyR8UqrnBWKQ
	 LbOm5j1ZIvF2gUDY6VWNx/7NYqbll11RV9qobV1hfb2woOzsmdlkev6wskJpQBh3Pe
	 x/gC160PM72LCp8J5jkke/ZmQg2Gu/J9/EgnNDuDF79MYoBCd+MA6njivIQMAiusYk
	 B3B4qcH3ka04g==
Date: Thu, 6 Aug 2026 11:57:12 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE
 regsets
Message-ID: <anRoiIbOFVjj7qPN@willie-the-truck>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
 <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
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

On Wed, Aug 05, 2026 at 10:27:18PM +0100, Mark Brown wrote:
> On Sun, Aug 02, 2026 at 01:12:24PM +0100, Will Deacon wrote:
> > On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> > > sve_init_header_from_task() takes header as a pointer, so for the
> > > inactive mode
> 
> > Applied selftest update to arm64 (for-next/selftests), thanks!
> 
> > [2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
> >       https://git.kernel.org/arm64/c/bd290e7fc245
> 
> As noted in the changelog applying patch 1 as a fix and this only for
> -next blows up the fp-ptrace test rather impressively in any
> configuration which can generate headers only reports:
> 
>    https://lava.sirena.org.uk/scheduler/job/3075737#L3231
> 
> for the release.  Both patches really do need to go together.

By "blows up" you mean the test fails, right? That's the same behaviour
if anybody runs the test on a kernel without the fix. Both patches are
merged in for-next/core.

Will

