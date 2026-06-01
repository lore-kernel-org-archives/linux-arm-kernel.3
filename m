Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0954FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=230brXIz/1I/P6fKDlh4upgsCSxJ34MkrrrfA/T/Ijo=; b=ITSBEMWpCvlvNqktHdk83DvGLt
	CjQvf1sciHaYAv0H6YQAQyB+L1MzcTaQ4yTaue2urBSEut/gFXj/Yt+ZItZTF0rQ+R0DqRNRqBrxM
	OXcD/ejuqu/UCMHhG4WRALC0RNkJqWo3gfPuuvdJXGK4I8RUajupGztLQOMZLhjbeOV3tVw6z5SEK
	fQMBWx8M1a83l2elZPIxBU69zddZkKtJJYGAI6ZwGoCNnCnbmMB4y6ZoH2jr1RSbF9h2NdgRNUY/U
	sM5duReTNDVTcopXNec4I6fxEZAFxiV63QLdSqUFVPMZ0nYOeyuyE+x+WZ2w1/WLh6S/Xidh2g40/
	rn7tFmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8G5-0000000BiXW-2TYx;
	Mon, 01 Jun 2026 19:25:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8G3-0000000BiWr-1Wsz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:25:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 349D7435E5;
	Mon,  1 Jun 2026 19:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2D61F00893;
	Mon,  1 Jun 2026 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780341906;
	bh=230brXIz/1I/P6fKDlh4upgsCSxJ34MkrrrfA/T/Ijo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GD4K50dfce5PduU9oUcGN46Z4x+5nHZyMPg8XIF+ZB3xXwKJtyOBNj5dejiu6Cwu7
	 F8RFUFkR4749uWNAKwGpGDyqNm/101I2ma9CzmuD89jzBSR/eTfzFNU1WKdArZa+1y
	 LQ71C8bIFHVwGPIcnn9MFGmXFw1d7zqO3b0sxgnVGUi1wrYjTWtWFEOCwitGc1+EBD
	 RVnnMjdHTYXwfh/VUdMgR0aseO6GRI3ov/N+6CnaI4Up+G44Nta7G2nfqd4gUHy9mP
	 VrVXuFr6sJ0d370dioWEcbSMnKiz2xK7jek8IdH58wrewz/rDOaCxacbNVZ5Nd7PxI
	 6rI4dtxgblBcA==
Date: Mon, 1 Jun 2026 12:24:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>,
	Han Shen <shenhan@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] kconfig: Remove the architecture specific config
 for AutoFDO
Message-ID: <20260601192458.GB965997@ax162>
References: <20260527214510.3907973-1-xur@google.com>
 <20260527214510.3907973-2-xur@google.com>
 <178010203121.3743687.8945076194906841190.b4-review@b4>
 <CAF1bQ=S4EaOQz6QLAUzXhiMqucTxPHvXiAQ6Rvfct18uXgPzYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=S4EaOQz6QLAUzXhiMqucTxPHvXiAQ6Rvfct18uXgPzYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_122507_424684_FBF8E90A 
X-CRM114-Status: GOOD (  21.85  )
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

On Mon, Jun 01, 2026 at 09:52:56AM -0700, Rong Xu wrote:
> On Fri, May 29, 2026 at 5:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, 27 May 2026 14:45:07 -0700, xur@google.com <xur@google.com> wrote:
> > > The CONFIG_AUTOFDO_CLANG option currently depends on
> > > ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.
> > >
> > > Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
> > > builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconfig
> > > and avoids potential confusion.
> >
> > It is worth noting that not all architectures support
> > '-fsplit-machine-functions' but I guess that does not matter too much
> > because it will only be used if a profile is provided, which would
> > require an architecture that is supported by the AutoFDO tooling? The
> > documentation is x86_64 focused but aarch64 works as well, any others
> > that the kernel supports?
> 
> Current support extends to x86_64 and arm64 architectures only.
> 
> We initially considered making arm64 to opt-in, Will suggests that users should
> be expected to verify AutoFDO/Propeller compatibility independently
> before using it.
> This approach allows for the removal of ARCH_SUPPORTS_..., which prevents
> potential confusion.

Right, in cases where the build does not break (i.e., this case), I
think it is fine to leave things open to selection and restrict them
when they become confusing or problematic for users based on real
feedback.

-- 
Cheers,
Nathan

