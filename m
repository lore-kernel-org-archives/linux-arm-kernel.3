Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914AACD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYO62/oFjD0abSuq1/jy6x/O1dFV+Q8x1xWCOazlAO4=; b=rRnl+dnifKLuYezGlab2AzGeb0
	OvrquCf/zZ0KBnyeuD9xx43/VRh9CObkoSfaakKduDyVWaNFyjBejhTAJsiVr4uDyUANuVHeWPVIV
	4sg761cy62MWaxP1sGYwlJD2CmhZhnzCxzjzzBz/Z6/S+4z65n1xq3UKWtt+Eh1PpdI/4QINmEQuR
	MdrOxw7571bRPjTCy5y1C18pN3LmzqdAExuOLxrKhK4UMUfmUWRXIF0eddtbU9W8KbNm+0AbR+9Ox
	X6NeFY9n8+SNdSU9imcrIZ3GLObKAxfi302TL4wNNz7TlO/kjhG+/lRK8u5H2Or/ubNYks8kCWWmc
	2TKJ+ZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUao0-0000000E4MJ-24hz;
	Wed, 03 Jun 2026 01:54:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUanz-0000000E4MA-08FQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:54:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23572601F6;
	Wed,  3 Jun 2026 01:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9024E1F00893;
	Wed,  3 Jun 2026 01:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780451641;
	bh=KYO62/oFjD0abSuq1/jy6x/O1dFV+Q8x1xWCOazlAO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WavqzsYTNF5CF0f9tPKtjHExBLcwiGTWEfzrkVi+S+sOHj5OeXuiDdsf66NDMEbDv
	 ru8+pXG0x6BXMkr19TvhvPwXnjGxMK3aXlySJNSSqP606jdOfaqPZJ9ws/i+PJqr1K
	 +NdOUuThL68NVCtqCUsUsKfuI1XKRQp0YpHz+Lv2A0WybAb+TurHz77WelZkE/zMBy
	 vICgMDDf1xTxvAEEWW7YBk33OJ6ZhUfqv232cT80GTRJfPZn5xt/UuK1Cju4a4D+pq
	 ZSjkp9OoT0LBhZWuzMRwv5YzSKbltkYTGDV+Y//SVrJy8U19komqU043mjtIP3tPGe
	 /mAEKb/fUWfuw==
Date: Tue, 2 Jun 2026 18:53:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
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
Subject: Re: [PATCH v3 2/2] kconfig: Remove the architecture specific config
 for Propeller
Message-ID: <20260603015354.GD1940387@ax162>
References: <20260527214510.3907973-1-xur@google.com>
 <20260527214510.3907973-3-xur@google.com>
 <178010203122.3743687.12531843798236779880.b4-review@b4>
 <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
 <ah6ltnOk2ol8_2ly@willie-the-truck>
 <CAF1bQ=TfCAdxh64cSNeO5wiT8o02o6+bVooju1Bgy3odM1NYwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=TfCAdxh64cSNeO5wiT8o02o6+bVooju1Bgy3odM1NYwQ@mail.gmail.com>
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

On Tue, Jun 02, 2026 at 10:52:48AM -0700, Rong Xu wrote:
> On Tue, Jun 2, 2026 at 2:43 AM Will Deacon <will@kernel.org> wrote:
> > I still don't think it has anything to do with the arch. If the compiler
> > supports the option, then we can use it. The arch code in the kernel
> > doesn't need to do anything, right? So can you just check if the
> > compiler accepts the option using a 'depends on $(cc-option, ...)' line?
> 
> Yes, arch code in the kernel does not need to do anything—it is just a marker.
> 
> I understand your concern. I can use (cc-options,...) in PROPELLER_CLANG config.
> But I will not use -fbasic-block-address-map for backward compatiliby reason.
> I would use "-fbasic-block-sections=list=/dev/null".
> 
> I'll send the updated patch shortly.

Technically, an architecture needs to add the section generated by this
compiler option to their linker script to avoid an orphan section
warning (or error from CONFIG_WERROR) if enabled, as has been done in
this series.

I worry that moving to a dynamic check will cause build breakage if an
LLVM target gains support for Propeller without having their kernel
image linker script adjusted. Maybe that will not happen very often and
even if it does, I do not mind taking on the maintenance burden of
fixing it but there is a cost of moving to a dynamic check like this.

-- 
Cheers,
Nathan

