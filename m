Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C70D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkehlKcCR1BYoMHCxU7xjsLfV9z4pwK9DmBr0352rSU=; b=qoCcZ09fQvHd3I23mbOpYBMf59
	vfdsPB2Zx2E+peTFAf5oP0DKrEo8VWLn9fp62UV2GnGPz0t4XmDhY8BkQv0xfVm6cfkhV6tUZlTMK
	z/GMrpTrytycOWXbWj3f4tEJgGJZHyFPfDJt4Jv+w6VvsQLKgePOYRJuJ5EKtUY4nkmT8mWkhzFn2
	/0DgSKF2kbPQnz2vlYftNlHaqY0QeM7RBcYnhmowDes/HCSAylnkMrM3XXYIWAs6rr35T5ceTwttN
	R9ncT2a8ECkEwGDbry2f2wn6FL5gf/4sFUcCYfYM9C5Cj7+BWzKLjiTMOyPF8gG6+wAW4DWUNo9bf
	/ejJwH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIWU-0000000FJfH-3djd;
	Wed, 26 Nov 2025 16:37:42 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIWS-0000000FJeS-2Ndk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=UkehlKcCR1BYoMHCxU7xjsLfV9z4pwK9DmBr0352rSU=; b=jhl9ROt/82xQGJ0yT0VWBH5pIw
	erIJqQRRzkpzI1/5YD9+vuY3hD9EYmyJCJ7Hi7qRjKBfhtv3EKmWVTLvEzdtY/6kDiZvsPJshE+dn
	27IglqLSuTCqTdIOY5yIAz+Zf30C1UDVqkYKvwiRBRozbR4eZC1Gz8J8uWujZujRApbpvgXN6DUfw
	SKKDozh6O0MnfDCGwb3onoVzrdnkUGFyq4rKtWcoBlVmH2z5r5GZBk0/rW+bRar7K8onDJJ/bJ2Nr
	hVEb4f2vEJ5hSfsPOnhuDWfauXatt+7fB8FPA7Zezc9XN3jJEnN1e5r5IojbSHBd1m2XRn4grEMAe
	0XLecZ0A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vOIWL-004LSp-E3; Wed, 26 Nov 2025 16:37:33 +0000
Date: Wed, 26 Nov 2025 08:37:28 -0800
From: Breno Leitao <leitao@debian.org>
To: Marco Elver <elver@google.com>
Cc: glider@google.com, dvyukov@google.com, usamaarif642@gmail.com, 
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com, john.ogness@linutronix.de, 
	pmladek@suse.com, linux@armlinux.org.uk, paulmck@kernel.org, 
	kasan-dev@googlegroups.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <2qy6sn3zpe75q5fgasvr3amohtjbcckcjlsnln7pjf2kwk5i2a@2znsizshp6c6>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
 <k4awh5dgzdd3dp3wmyl3z3a7w6nhoo6pszgeflbnbtdyxz47yd@ir5cgbvypdct>
 <CANpmjNOsSmKUxrLxTWYMD3RKnzSw5dfM=7QNJ02GMFG7BMeOGA@mail.gmail.com>
 <l2tbxtfyjtu32wqv73hqc3loerzdshoq2mdkfpfnigtjjonrdc@3yacamzjcrti>
 <CANpmjNMnKJGvneNDOCFRfC8xUWq-uuXVjLRQZsPYo86Xau5UHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANpmjNMnKJGvneNDOCFRfC8xUWq-uuXVjLRQZsPYo86Xau5UHw@mail.gmail.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_083740_637472_9D30125D 
X-CRM114-Status: GOOD (  18.46  )
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

On Wed, Nov 26, 2025 at 05:08:59PM +0100, Marco Elver wrote:
> On Wed, 26 Nov 2025 at 16:54, Breno Leitao <leitao@debian.org> wrote:
> [..]
> > > > Alexander, Marco and Kasan maintainers:
> > > >
> > > > What is the potential impact of disabling KFENCE during reboot
> > > > procedures?
> > >
> > > But only if CONFIG_KFENCE_STATIC_KEYS is enabled?
> > > That would be reasonable, given our recommendation has been to disable
> > > CONFIG_KFENCE_STATIC_KEYS since
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4f612ed3f748962cbef1316ff3d323e2b9055b6e
> > > in most cases.
> > >
> > > I believe some low-CPU count systems are still benefiting from it, but
> > > in general, I'd advise against it.
> >
> > Thanks for your review and guidance.
> >
> > Just to confirm my understanding: You’re okay with me adding this
> > notifier specifically for CONFIG_KFENCE_STATIC_KEYS (which is what
> > I need), but you would not support adding it for the general case where
> > !CONFIG_KFENCE_STATIC_KEYS, correct?
> 
> Yes, correct. If there's a real issue with CONFIG_KFENCE_STATIC_KEYS,
> it's worth fixing if there are still valid uses for it.

Thanks for clarifying. I'll submit the patch with changes limited to
CONFIG_KFENCE_STATIC_KEYS.

--breno

