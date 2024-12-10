Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F311EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SpK/8dWGRVQRZ2TZSjhGrQ8CvvMIy/6VRS+LeI89mo=; b=B8588zFohr+6RVAz4WAHKpOm9Q
	6pAnz6S1DzgC4lOeqYKGPWNeGQyQt/CNoKixAYGPiU9wTfmTWi0jwMG61rm4dbfeTDBNsNyvr2UGz
	Lj+XVhcOkikxff3AXxrSzDLVRqT6TcmfDmT5WEm8gyEkwIjqABin0X8lHrh2o56BZ95J7hc4P2dfE
	SatXEUsHKhj0jyX5bNp4eJcrp266odttxcwfsdQo/CcZSzy+30daKYb4WO2dBmmP0gBKMQDkYMViv
	m/GaP3XkewFeKaRxTp3mJTEQNKeEalsrw6+E2lrIiMp1lekDRmaeNBorMGkFaw1xW1SAZSXo11Hb/
	F96nJOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5ky-0000000CVao-05ls;
	Tue, 10 Dec 2024 19:18:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5ju-0000000CVOe-28G2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:17:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86BA1063;
	Tue, 10 Dec 2024 11:18:12 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF653F5A1;
	Tue, 10 Dec 2024 11:17:43 -0800 (PST)
Date: Tue, 10 Dec 2024 19:17:36 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: arm64: stacktrace: unwind exception boundaries
Message-ID: <Z1iT0AQqu5dqdCSg@J2N7QTR9R3>
References: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
 <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
 <Z1bWaGCvUrwrj2fZ@J2N7QTR9R3>
 <Z1gll87-TkAqFwUz@J2N7QTR9R3>
 <rxc57eg65sg4iayhj7gc7yl24w524lviedxnydl2mggqnatglq@iairj2ci7ioj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxc57eg65sg4iayhj7gc7yl24w524lviedxnydl2mggqnatglq@iairj2ci7ioj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_111746_588189_BD7A4E86 
X-CRM114-Status: GOOD (  22.18  )
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

On Tue, Dec 10, 2024 at 07:40:04AM -0500, Kent Overstreet wrote:
> On Tue, Dec 10, 2024 at 11:27:19AM +0000, Mark Rutland wrote:
> > On Mon, Dec 09, 2024 at 11:37:12AM +0000, Mark Rutland wrote:
> > > On Thu, Dec 05, 2024 at 01:04:59PM -0500, Kent Overstreet wrote:

> > Looking some more, I see that bch2_btree_transactions_read() is trying
> > to unwind other tasks, and I believe what's happening here is that the
> > unwindee isn't actually blocked for the duration of the unwind, leading
> > to the unwinder encountering junk and consequently producing the
> > warning.
> > 
> > As a test case, it's possible to trigger similar with a few parallel
> > instances of:
> > 
> > 	while true; do cat /proc/*/stack > /dev/null
> > 
> > The only thing we can do on the arm64 side is remove the WARN_ON_ONCE(),
> > which'll get rid of the splat. It seems we've never been unlucky enough
> > to hit a stale fgraph entry, or that would've blown up also.
> > 
> > Regardless of the way arm64 behaves here, the unwind performed by
> > bch2_btree_transactions_read() is going to contain garbage unless the
> > task is pinned in a blocked state. AFAICT the way
> > btree_trans::locking_wait::task is used is here is racy, and there's no
> > guarantee that the unwindee is actually blocked.
> 
> Occasionally returning garbage is completely fine, as long as the
> interface is otherwise safe. This is debug info; it's important that it
> be available and we can't impose additional synchronization for it.

Sure thing; just note that there's no guarantee that this is only
"occasionally" garbage -- this could be wrong 1% of the time or 99% of
the time depending on the specific scenario, HW it's running on, etc. As
long as you're happy to hold the pieces when that happens, that's fine.

I've pushed out fixes to the arm64/stacktrace/fixes branch on my
kernel.org git repo:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/stacktrace/fixes
  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/stacktrace/fixes

... and I'll get that out as a series on the list tomorrow.

Mark.

