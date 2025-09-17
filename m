Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DBFCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZnzYSDutUgh7o+CZnN+NC1YHS/1qR4hhMnn1z+BEVU=; b=2t9ANFioovpOH7QnKQLPbEgMOk
	eY6VEIENU+bJtf6ge0WalYc8TTyXY8NGz5d+67js866vnmFQ6n0Agy4K6COlo+sMoWJ+xVpsfWNua
	hRI86+yBWSSEH2DLIVTVT218Sw3fUcIx6zTQGXZh8Qh+W+dRChybljlmHQ9rBVwjacY45WMpf4HW6
	djzDrMyWvEA4oOxQwPbODXGmrd4s44dOSUY6kzAX9Saf9E5P95plOdpDy/RSDfOJ6jpqi1xEPrnSM
	SI1zls6mqZENdLd/7Vd8nD3Bd+02XrWCuoaDCdcPTaH+SwWA9pByBO4PjfjSmB6nYCbWNZTq15kpF
	Kp8Ow/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvjk-0000000DTLE-3OtY;
	Wed, 17 Sep 2025 17:14:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvji-0000000DTJj-3rBB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3391F40A54;
	Wed, 17 Sep 2025 17:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28E4C4CEE7;
	Wed, 17 Sep 2025 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129270;
	bh=tmdsQ+Xu5/oIWo6bRP1Mnp6X483CCjaQbZUxpCmtk14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8mTjvDTIvoAMnydYGhJ7895qPxNZclTPIRFnuKmk7B9Sszb3v9rKYQ6nv1m3Ph8L
	 HWydvAOhH4p0yh5ZfRbEcv/oVIRFdYrBKP1+0fUgyFRmC3qy1dAEvSisNGR4Wmmv+M
	 9yzivsDxdgXgurH8vgZjCSu+BZLIDP7lkFzRjjxICViHMqV/U2UBrweXvisOPHXsDg
	 om3vG1FeYTiM3Y7FSF2z+KktBvNXABNqdNfObsAA7DcUlDQ3yQXYrK8pWQphTxKSbb
	 M6goTtaWKHdh3QZPrsdcBFRPRI1D+Pnba4aZkXbeTnmtoO9aTyGfY+/Prr01xVdo/+
	 guQjLec6nE7Rg==
Date: Wed, 17 Sep 2025 10:14:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <20250917171424.GB1457869@ax162>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk>
 <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
 <87y0qd89q9.ffs@tglx>
 <aMrREvFIXlZc1W5k@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMrREvFIXlZc1W5k@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_101430_976668_D40632C6 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, Sep 17, 2025 at 04:17:38PM +0100, Russell King (Oracle) wrote:
> For me, this produces:
> 
> get-user-test.c:41:16: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
>    41 |         (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;                \
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> with arm-linux-gnueabihf-gcc (Debian 14.2.0-19) 14.2.0
> 
> Maybe you're using a different compiler that doesn't issue that warning?

Maybe because the kernel uses -fno-strict-aliasing, which presumably
turns off -Wstrict-aliasing?

Cheers,
Nathan

