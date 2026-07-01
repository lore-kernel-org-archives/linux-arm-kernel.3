Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3992FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiOT6uiF3NGboaiFTBq263sYJRkFitWRNlZkqixnh6U=; b=zAo2PRf8fqLuFATGRdH/0uOIgi
	EyrWdQca47CthC3ax2kyPK6NERvqYhcSDuMi5Pcld8fZrbfptTU5dmVts8lFzrNDVXHon3T/1labL
	/3ZsACp5UegMzx6AqVVfb56abCD5jaCipuG/UEzuuF6z0pyX8doviwbTUG6DO3DUAaqB1+xdHoO36
	Gsvq3D85BEzcKO7iJ9E4HmWsZDicwULZZ+icoYN24bLhTiaA1UeWEWo9eI00Zp0Zgieqf3AWr9MB6
	AkdXqE2mw2KObcaaneX5Z3XrwlFamaacg9WqsMNIVtDStDxFBBV5VjXR8hqWe594hEh0h9882GZbW
	Whk4kblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wespn-00000001Qfp-3g5f;
	Wed, 01 Jul 2026 11:10:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wespl-00000001Qf4-1xqg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 11:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fiOT6uiF3NGboaiFTBq263sYJRkFitWRNlZkqixnh6U=; b=Mra6qpYKy00JCbqscUz5b3u1dm
	1bGugawwQ4WvrJbZbPKKzLQeYu3ae1bQIBzTpvbxKl3n9Pn0sdv8f4OSi3FTXyGu/gTjWLffBnei9
	0o+FZ7NsUF1IJWdRCnVJhIZPk1CuabhxyVB5rPXHuADWtOpfTA/j88i6ObbB4cG7geva9boYZtXgR
	TxHIqbmfaURgj7nUbGY2Cw3DV0WSFr5nx5lEovaIXU57RmB4gHMCYbaz4Oz7kfF/53GbwbB7kxohV
	z2yRa0rWo0Ua7h32SYNM+b7G1QAWjpGY+ocaCnnrww+yvhw9OR3BECVwZdTps1n8ECJW+TN2ihzIS
	JFB7nJ9g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32952)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wespc-000000008Vo-14Lm;
	Wed, 01 Jul 2026 12:10:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wespa-000000007iL-1NdZ;
	Wed, 01 Jul 2026 12:10:14 +0100
Date: Wed, 1 Jul 2026 12:10:14 +0100
From: Russell King <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	slipher <slipher@protonmail.com>
Subject: Re: [PATCH v3] ARM: breakpoint: CFI breakpoints only on demand
Message-ID: <akT1lr2iNzbnGEzH@shell.armlinux.org.uk>
References: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_041025_831809_2D5FB05A 
X-CRM114-Status: GOOD (  21.52  )
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

On Wed, Jul 01, 2026 at 12:42:09PM +0200, Linus Walleij wrote:
> This removes the stub hw_breakpoint_cfi_handler() from ARM, making
> it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
> CFI is actively used in the kernel.
> 
> When not instrumenting with CFI, we fall through to return 1 from
> hw_breakpoint_pending() "unhandled fault" so userspace can make use
> of this breakpoint.
> 
> This of course does not work if userspace want to use CFI and custom
> breakpoints at the same time, and CONFIG_CFI does exist as something
> users might want to select for their kernel. If this is not good
> acceptable we need to think about other ways for CFI to interfer, such
> as not using BKPT at all (rather something like BUG()) and back out
> the offending patch until the compiler behaviour has changed.
> 
> Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")
> Reported-by: slipher <slipher@protonmail.com>
> Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Trying to solve the CFI bug. Let's see of this first
> approach is acceptable for the reporter.

Looks fine to me, but will depend whether the reporter has CONFIG_CFI
enabled in their kernel build.

Have the LLVM compiler people responded to this bug yet? What is their
plan with the silly choice of BKPT usage for CFI failure?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

