Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6780EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ae4izi0XcDSuyK6tFzNDCLHP0j8TgMhdJxpxNsC8Uk=; b=d729HnpllXyOrwhnvpPC5qcAPS
	ece9+7tw5M7HoBr0+FD2ZSoca4lWKrmoWLI+JOflZJGO4MH57VXu17gce7Mp5YYrUYzg4trXIqSiZ
	thp8hp3SR6rbkLw19wiw7N1s9t9h1M+VyQPjUwgIDVYM1wCaH20DjrKK2L3Pqdr82URLTtJTe0Ibj
	agLlcZNt7zG0gW+U0r8ucqtRnncgiXKRhlQeX/uLpsGdyvG3xP6CgPyTyG+TvY8yEhQmdDlxiA7id
	MFv9yVVOIrj5IxItKqDl0IriqPCZNZ3Q/vGWQ7gD/OG+aL9CKiqbuSNOH+fFjyP1CTob1eD9xsI5B
	tqC3OQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titWw-0000000Ebz1-2Co1;
	Fri, 14 Feb 2025 11:06:46 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titVQ-0000000Ebhk-0f9K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:05:14 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 25BD972C8CC;
	Fri, 14 Feb 2025 14:05:09 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 15DEF7CCB3A; Fri, 14 Feb 2025 13:05:09 +0200 (IST)
Date: Fri, 14 Feb 2025 13:05:08 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/31] ARM: Switch to generic entry
Message-ID: <20250214110508.GA19194@strace.io>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
 <20250214010325.GA12626@strace.io>
 <CACRpkdZJYFUhmPg3EWJeU42fzJMzWm7Sgn3XfELB2-PSCf6Ssw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZJYFUhmPg3EWJeU42fzJMzWm7Sgn3XfELB2-PSCf6Ssw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_030512_377216_02D7FD0D 
X-CRM114-Status: GOOD (  17.93  )
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

On Fri, Feb 14, 2025 at 11:47:30AM +0100, Linus Walleij wrote:
> On Fri, Feb 14, 2025 at 2:03 AM Dmitry V. Levin <ldv@strace.io> wrote:
> > On Wed, Feb 12, 2025 at 12:22:54PM +0100, Linus Walleij wrote:
> > [...]
> > > - Tested some ptrace/strace obviously, such as issuing
> > >   several instances of "ptrace find /" and let this scroll
> > >   by in the terminal over some 10 minutes or so.
> >
> > Could you also run the strace test suite, please?  Given that it used to
> > catch quite a few regressions in the past, it could be useful in this case
> > as well.
> 
> Sure, where can I find this test suite?

It's a part of strace, you can find it e.g. at
https://github.com/strace/strace

To build and run it one can roughly do
./bootstrap && ./configure && make -j`nproc` && make -j`nproc check


-- 
ldv

