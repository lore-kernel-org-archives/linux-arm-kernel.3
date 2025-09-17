Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A26CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re9XiQwZHyoGrJmwBRzeNqQiLmgFq6r4H1Yj73RZIV8=; b=04x1IXxkWYDg8geqUxQ9nRE5ze
	4Zsxwm6zsKVI+mxSJbsN7U2RhAuz8I6BSeBX8zZD9bIzMGpeMTN18vsdw5K8PkupOXxZKgk6Xhvy0
	2ubxXw5kmPpEEx76uygq0/lzUqEoHck2OD17DOdlg3CYm9gMpjgIXzjRpBLmtbEof0wHZN6kQO/6n
	ka3dF5i/JJ1mvw3vCHSe/gS8C3KffohrgfsL/3SOtK/WPqFTPZhIaV1ea9QGiE4OAalYj1k100oMe
	/fdM4x+A7sl3poicj2OsA7vJrdJwEbBiDmwXFOS4KObzeKsa69RCLNRLxYCldwLNp9V2ARUbwRuPj
	h9wIKSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyw3D-0000000DcQs-0rpq;
	Wed, 17 Sep 2025 17:34:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyw39-0000000DcLl-0HZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=re9XiQwZHyoGrJmwBRzeNqQiLmgFq6r4H1Yj73RZIV8=; b=wr9Pzivg4eMg+afHKT1BIf6dDL
	Q4WjVxrBc0RMofwJb53n409SGCq035N3e91aPMXt47MwNYA9yEhewMvTDAR69hT5H45W1sktyPL4D
	nJqQM5Ze4peqVjOJYjvdLJhMaWb3Hk1GCpwyB9MeUYULC+lsqJag91Fo2goJ8S/nDlWnRFIRs2VwB
	OESogtTWXLz49g6qJ/ax/byne2afQNrq/7hNHyIxgElulMsYptKIy5JYhpyG62HfRP/fPgeKFMoGF
	B5lry83DH8O6pkJ0/3cNDFq0lNh25J6Zb7iZkW/R5ofgIx9J0tmY0STZe4bZNS5Rlna7AUq2QWlkf
	imnUJ98Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyw2u-000000005Pd-0r9U;
	Wed, 17 Sep 2025 18:34:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyw2p-000000000Nu-3wy6;
	Wed, 17 Sep 2025 18:34:15 +0100
Date: Wed, 17 Sep 2025 18:34:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
Message-ID: <aMrxF3AnFox0LH8V@shell.armlinux.org.uk>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk>
 <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
 <87y0qd89q9.ffs@tglx>
 <aMrREvFIXlZc1W5k@shell.armlinux.org.uk>
 <20250917171424.GB1457869@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917171424.GB1457869@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_103435_754149_7E0A2659 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, Sep 17, 2025 at 10:14:24AM -0700, Nathan Chancellor wrote:
> On Wed, Sep 17, 2025 at 04:17:38PM +0100, Russell King (Oracle) wrote:
> > For me, this produces:
> > 
> > get-user-test.c:41:16: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
> >    41 |         (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;                \
> >       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > with arm-linux-gnueabihf-gcc (Debian 14.2.0-19) 14.2.0
> > 
> > Maybe you're using a different compiler that doesn't issue that warning?
> 
> Maybe because the kernel uses -fno-strict-aliasing, which presumably
> turns off -Wstrict-aliasing?

Thanks, I'd forgotten to pick the -f flags for building the out of tree
test. Yes, that does work, but I wonder whether the powerpc 32-bit
approach with __long_type() that Christophe mentioned would be better.
That also appears to avoid all issues, and doesn't need the use of
the nasty __force, address-of and deref trick.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

