Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C066C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2f0Ew4VnwGv7uuzAnw1sPE6xUF9+xquBOKAYfUD5tg=; b=gKrqh/N1ljpTixNBuu7hP8WLky
	uniBc1IBAU6EWkJ0xNHwc2PTW6gORmJtWh4uCEsoU0tSGGxIDJE1+FRMjYH99M5ksGMpEgVy6/A+/
	LEx39ZcOxsNXyWtWUMGoxH4Mi9BoXsJh952h2obtAyEY8drjKAj2T8FR8KPN6Gfpq4Ya3C30gFflq
	inno+VNzbXu6XTIPQ+J0L3MzwvvOniFP2djhm37+CYLtkoCqvfz9x0Y6U0NL9qr3NaSkDhTOOG9Op
	UROIBUljoPiRZovVCxNICEIltM2q7qgaIEbLQ53wz4v9S3M4Isx+V7fniEUwpvpIAykgkbdrLGMzk
	EDWQE3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whXOg-00000000DsU-3b1o;
	Wed, 08 Jul 2026 18:53:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whXOf-00000000DsI-1cmn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 18:53:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FB6A6001A;
	Wed,  8 Jul 2026 18:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4141F000E9;
	Wed,  8 Jul 2026 18:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783536804;
	bh=J2f0Ew4VnwGv7uuzAnw1sPE6xUF9+xquBOKAYfUD5tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z32NlhOLrT5aCPv93AAtFzGkVadz/SEFmDI4iV8BqBQjy8effTW4de966W2kC4yzx
	 Uep+PheJKmzD/bul7pU8Vqt9veub1TD+js1gcMqJ+FF4IG1iHpy4F5WKInWn4qNEyr
	 Sa2Qwee0m/Ddc9qogC/QK9gsmPvuADiqQVB/HgG0DWYqgzM0pE21QvRJw1tYQWbg7E
	 9kFJx6JRkX7NVOERsvFpE/EESMRDlRIG+gxa5syrFgaE5YeZkIyBwzJCD4OOliRGuY
	 iKcA4hV/W6Ut9+med7H4wOzoZzV8a1Cke74dsS/H39kX36asUxmEkKFZR2A6sLhxKV
	 DySpJgJZH0n1g==
Date: Wed, 8 Jul 2026 11:53:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	slipher <slipher@protonmail.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ARM: breakpoint: CFI breakpoints only on demand
Message-ID: <20260708185318.GA2718700@ax162>
References: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
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

On Fri, Jul 03, 2026 at 02:25:27PM +0200, Linus Walleij wrote:
> This removes the stub hw_breakpoint_cfi_handler() from ARM, making
> it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
> CFI is actively used in the kernel.
> 
> When not instrumenting with CFI, or when a breakpoint is issued in
> userspace, we fall through to return 1 from hw_breakpoint_pending()
> "unhandled fault" so userspace can make use of this breakpoint.
> 
> Tested with LKDTM and this command line:
> echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> still works as expected.
> 
> Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")
> Reported-by: slipher <slipher@protonmail.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

