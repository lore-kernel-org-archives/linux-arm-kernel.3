Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF6CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAHSbDYm1NZrLM9grIFpy9kmngP/GC1SDlxv0XgKYm8=; b=Llsua6zaeNmq5jx/M0WJNRI24H
	BXJwars7UBjoQM3DQF9wuk199eTxsLyXz8FBeGLenkzTT8cQoVqAEw7e1ZJoYnl5rnHOx4g4KX5lL
	vSN2AqRzJjC5k3wl3733BWcZAq/rgGPIqAtZuR7qxEF/WlNe9+ETynUzUrymeKtWXOSsihn1R89EA
	fNMiTwxVVefJXsq2hjRtsBIHIFFIWOuZp0/Ou3DYjvwuO7E6eaJSKeuF3ap1ncshQiZs8C1Z75a2p
	nOla40PXLGZqwXiaQ0NzBmYIGDK5f24b2EC5Oe68apcRA6Kn0a5v9WssUG02t8mf38eTUFrarZ5JG
	vfskuUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNDJ-00000005DOL-1TW8;
	Tue, 02 Dec 2025 10:02:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNDH-00000005DNy-2hh1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:02:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8345A153B;
	Tue,  2 Dec 2025 02:02:17 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321853F73B;
	Tue,  2 Dec 2025 02:02:23 -0800 (PST)
Date: Tue, 2 Dec 2025 10:02:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across
 arches
Message-ID: <aS65LFUfdgRPKv1l@J2N7QTR9R3>
References: <20251127105958.2427758-1-ryan.roberts@arm.com>
 <20251127105958.2427758-3-ryan.roberts@arm.com>
 <CAMj1kXFY1RXk8T4f46bkm_sr0nJfBoO+ii68JK4+CsRiDwKdCg@mail.gmail.com>
 <9097505d-b18b-4f85-a02c-7f2865ad8bca@arm.com>
 <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
 <aS6ylpLIyDZOvBDB@J2N7QTR9R3>
 <CAMj1kXG=HDVso1xc6TGgSrBpV3Sq2YQLdPKg2dw5z9qdrbdWBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXG=HDVso1xc6TGgSrBpV3Sq2YQLdPKg2dw5z9qdrbdWBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_020227_722924_98A2C282 
X-CRM114-Status: GOOD (  19.03  )
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

On Tue, Dec 02, 2025 at 10:47:04AM +0100, Ard Biesheuvel wrote:
> On Tue, 2 Dec 2025 at 10:35, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Tue, Dec 02, 2025 at 10:15:22AM +0100, Ard Biesheuvel wrote:
> > > On Mon, 1 Dec 2025 at 19:20, Ryan Roberts <ryan.roberts@arm.com> wrote:
> > > > I've got bot warnings because this is being called from noinstr code. I guess
> > > > the best option is to just move add_random_kstack_offset() to after
> > > > instrumentation is enabled for the affected arches.
> > >
> > > Just put instrumentation_begin()/instrumentation_end() around the call
> > > to prandom_u32_state() - that seems to be the common approach for
> > > punching holes into the 'noinstr' validation.
> >
> > That silences the warning, but isn't necessarily safe, so please DO NOT
> > do that blindly.
> 
> Oops - sorry about that.

No problem! I just wanted to make sure we didn't start to gain broken
usage that'd need an audit and cleanup.

[...]

> Given that prandom_u32_state() does a fairly straight-forward mangle
> of 4 32-bit words, might it be better to make that __always_inline
> itself?

Possibly! I don't know whether it's better to have prandom_u32_state()
inline or out-of-line.

So long as prandom_u32_state() doesn't call out to instrumented code,
making it an __always_inline function will be safe.

Mark.

