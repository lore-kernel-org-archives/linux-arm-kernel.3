Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13146CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqn5JrCHJ75qJ1M5wbwAacTEtJNDzbRenZ2g7NMAdTo=; b=PATihExgZHGSyJQ1mAaFeRv1SP
	PWgTpaSapMliTWZFIQ1JacB7Eg3N/eBcc0SqTs/w15SS848DTTvEgKLmQCkg8v5BBzYT2HaV63HPa
	KC615gQF59lVUO6lKmKK2+K3KYZWdrLxioaTkkicemSuF4wHmc3fjDvxEyB60ePhD3o+Y+jwTl3EF
	prhqXRN8ucb5zj+5J3NiolFtBZEo7cXNnSGXlLtifUH/cuZLfZo/Cv3EO8kIkYgZa1EvediX8+NNa
	9jDInjspRKObTQLEsY5g1cye3AS0d1nnnsSdC4lMk9VnDJrzJ6zr0AbOKd3IPNVHajKg787nFZO+l
	MTJRpB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydC8-00000009Can-311I;
	Tue, 16 Sep 2025 21:26:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydC6-00000009CYk-06wp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yqn5JrCHJ75qJ1M5wbwAacTEtJNDzbRenZ2g7NMAdTo=; b=UkeeZH1R0r6GOrXjtjlcsSa5hN
	8r+6U0ofsRSJ9AucuPYHXQzMKdjNxKG9u5u/jZOQNCywIy2T87K61FOpMLFjEyJToJr/Jaem6m5In
	X+xd99jiFR30B7SgjvPUV8Lj45/FSfTyOYMHlwI/iY4+ForcdbX8RTgKbAPni7CACH6V4vjEU1gYz
	uxp8waAl7HY4H/qmwJvxJqV7VTDCsWK9perGAzIvkFxMvHodG4Si/66CAIG1miuCohS/V4QpLGT9c
	CZS+hD3K1K8XJTWG5M/uE4MOSxOjLHwJfuXu/kdu20tGcCADvj73urgjIILfNfFJX14PWxqgocxXA
	/sjxZhnQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43032)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uydBv-000000006JJ-0Z5P;
	Tue, 16 Sep 2025 22:26:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uydBq-000000007za-2a30;
	Tue, 16 Sep 2025 22:26:18 +0100
Date: Tue, 16 Sep 2025 22:26:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
Message-ID: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.037251747@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916163252.037251747@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_142634_063412_CF4C7337 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 16, 2025 at 06:33:09PM +0200, Thomas Gleixner wrote:
> When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
> for no real good reason. This prevents using get_user(u64) in generic code.

I'm sure you will eventually discover the reason when you start getting
all the kernel build bot warnings that will result from a cast from a
u64 to a pointer.

You're not the first to try implementing this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

