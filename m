Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE9EECD998
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSSYkJlrbEPt5U5v9EB/8jk2+eRw0+NfeWP0evGajjo=; b=PCff9w5zm5nhVeQrKzQD62eGK0
	IWe8BWv0Nxzus1HvpJKJS9aF0YyWnWp94aaTF0CCT75yoy/SXjwcrbT5j1KZq9GvhXejLDw9uZy96
	HeRSd8tLJ01whkAuDXxLw/oeYZdiYFFnryW93l1uD2IAKvAKO4mt9YlaEUysy3UtXWYm7oU58tonq
	Y6PJ+9/iubvNgkAY7aWWTQ2b/8XS+Z3iWaqK83Ub53C523FCPuB5PrBtOfquVBaq/EAALcydhsmlx
	LTaZgq3HmjmJq3lkCe0Z1yHPexTPITD3sYbYvZxEpniticOj0VB0/q6G3cJHdkLeq1E43Swm893O/
	prS1iiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4x1-0000000AQp4-36J3;
	Thu, 05 Feb 2026 19:23:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4wy-0000000AQoe-0RBE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 19:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3908C4431B;
	Thu,  5 Feb 2026 19:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAC8C4CEF7;
	Thu,  5 Feb 2026 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770319414;
	bh=G1U9qmKeYw7srGWrHZGGnGjqRH6CMWDQPVKmIp3JezE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RJNwh4mO/IzcwBr//npGg7UaMqf+CpIBk1v1Eg26Sum57PvQyj8eZmy1mJGKak/uw
	 7YdiVZpidR8JBMEJWa9W/Ip2N96p6xmjUz5WyctsNQKDugg1lkculV0XaougDrVKGw
	 06vWWgCi/e18OoYwS1VUUGf8VsitfAmfJemc+8lUpj9TmMOwv7VcQdI3YMOpi2Nb+V
	 0i3KNvaozU/njDcWkzmHlfGCtBWcw7O5PXbh2OAvLSkTWs8zUavYuYim2sO4Lkiazr
	 WmyAGsac3x7Zspfm2Y8jRrMAvA7TyX2zo6TzXPSzvbJw5WynP9PJRD0okbYaiNmtUd
	 yR9HrJbF2iB7A==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 =?utf-8?q?J_=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Tom Rini <trini@konsulko.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Alice Ryhl <aliceryhl@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, David Sterba <dsterba@suse.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
 Nicolas Schier <nsc@kernel.org>, Petr Mladek <pmladek@suse.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster
 operations
Message-Id: <177031941047.2027657.11296594038346797555.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 12:23:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_112336_197915_27CC4200 
X-CRM114-Status: GOOD (  10.81  )
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

On Tue, 06 Jan 2026 09:27:30 -0700, Simon Glass wrote:
> This series updates 'make image.fit' to support adding a ramdisk to the
> FIT, provided as a parameter.
> 
> It also includes a few performance improvement, so that building a FIT
> from ~450MB of kernel/module/devicetree files only takes a few seconds
> on a modern machine.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/6] scripts/make_fit: Speed up operation
      https://git.kernel.org/kbuild/c/621fd65adc825
[2/6] scripts/make_fit: Support an initial ramdisk
      https://git.kernel.org/kbuild/c/26428e7dd6a51
[3/6] scripts/make_fit: Move dtb processing into a function
      https://git.kernel.org/kbuild/c/873c2836982e1
[4/6] kbuild: Support a FIT_EXTRA_ARGS environment variable
      https://git.kernel.org/kbuild/c/9a329df6e0041
[5/6] scripts/make_fit: Support a few more parallel compressors
      https://git.kernel.org/kbuild/c/fcdcf22a34b07
[6/6] scripts/make_fit: Compress dtbs in parallel
      https://git.kernel.org/kbuild/c/c7c88b20cd422

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


