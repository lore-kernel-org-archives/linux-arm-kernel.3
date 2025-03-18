Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FFEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huRWnbUSFIOrYn2QxkW4BG9y2bRatI4h8QE+NxAGfCE=; b=mOp3A+FaUaON8R7VKpEf9KMxJV
	lolUUc+1gK/zWXRAaYNtCo8W9uSo7GMfCc8PfD1T8U1sdVOswNP9ADGinBZLEDfyD/OIqUXamr2mG
	cDqFxvQIAUmjjeChf62W9ZlNnMKpuytwIMUo0/YzYrEWpPLDAJkPcGQhpffjBY/v+JHwKx6Vg7LvO
	LPkO2YnI3ZkIMOcMs1AK2ndPAD073jPIiKTKQCBOAY8O8ZNaRAcKNq3pkLTLFRgZdrsgmcbS1xqh0
	3m/KOg4++MS/8m7Wvs/w3T9bTImfJir1pCmB0zw46Ct/2YewtiXUTzlBPgfEqOSKtiSc3vZkarKU+
	XTQKTXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuenT-00000007A8r-2mgx;
	Tue, 18 Mar 2025 21:48:27 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tueh6-0000000795l-49Bd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 21:41:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso1472a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742334111; x=1742938911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huRWnbUSFIOrYn2QxkW4BG9y2bRatI4h8QE+NxAGfCE=;
        b=g0rg3e1wOXEJ8yHEnzk071XVpitdG9TDfV6ZSTh80m3CzV9BQAKzA/ZEqMEnlBm8qG
         Vc6TEGr2HTrmH30gPyddqCH9Q0M8eA5u0NmgvKi/GRZl6XEhTLFzti04e9ggPZOB4DqK
         ur1DYaGIjYMzFcS3wsL72P/QNjT/UpGUQITcUOcigzuYnZpthUI1/mLT9h+m/BpRHatq
         JNn9nafTkIA9QryP+HbZupqKJmWpuXVpq6N2iY0gxlr+oMfx39QUW2VAkvyQHSLIMXSz
         Y7zSb6ylOXaT+x0lPKh5JnC3DZZHOVqXs5NF6AgVmVmthAR+93fWInc9ShyvYunB9jSK
         gr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334111; x=1742938911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huRWnbUSFIOrYn2QxkW4BG9y2bRatI4h8QE+NxAGfCE=;
        b=FcMdfzvmRBz3DkH6pqw7lYr+5DfYDlSKhWb5rPDdsBKTdFRE+AFJ8bSuYMfqvhjF4k
         wWQq8AyoploeRPONf3nRcUMpCFN2rKiyMOLSTqCC3zmPPFlwQi3/wyMBRjxtYFG9O9vD
         KLi/W0wIEIq2zz8LXdhkJ8SysZEHSQDgG1lE3lJz1skNB3j9P49lHP/kO3ug40RGxIi2
         g+EIUHDLTlPF+YxlcJ8E00k2V0wzyEVHYHuaVNdpUnBitAnBxO5tuwk7G+RmRENJJkvX
         3zUVMKFHGbHin7hgQkhAzIYeRHPw0Bb0LNAxL22KZifs+G5LmUUwaPWM4VsnA5nwuD1x
         xjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnG/T0w+5/O2fqrPT8HRBhdCOP3BgiMIvDPCx/JHpiSGeHfmuGGLxPVMMOOXAcHp5qiZ4w37ZaA758U8try/Xu@lists.infradead.org
X-Gm-Message-State: AOJu0YzcotK7KGN17DTSJICXrGCoRNcmblktaDQPvrRF6IDWaNDSY0xo
	qSOIDWJkp6e1StFWPfX+HGSLPcGmlDPjNQpuqAOexZSsGy9SaNbMiANogWoHoSfsxSZCFL3uwy+
	Dh37gtRNMcHIGiiV7ierK57qmsTuqLxMZv5WW
X-Gm-Gg: ASbGncuH4AgDd17Np4u79fXARLN3ZwjcQftVTO1WzV2ERN3PvlTd2KXJozyJrUmMlMM
	A+TjkBph+qXlCP/3J1SuVvbM8kU4difWhBDLMACtqetyGVO/okYSodPhGPgPQ5OFV+2qCS2oiH5
	J1wnlbTCOhy6BBQYL/6r79NkD4Pw810e5QUCOHTRKYZcbiarcRZhZdMio=
X-Google-Smtp-Source: AGHT+IEE7SnidIPRfD/tsQUEwB4S5fYvYHXaK7pjnnRSY2/bfQtUnICoMM+NMzU+Q4G5iu99RUJkJd34epkaV7xV8uM=
X-Received: by 2002:a05:6402:2072:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5eb81ca377cmr5954a12.7.1742334110577; Tue, 18 Mar 2025 14:41:50
 -0700 (PDT)
MIME-Version: 1.0
References: <20250308023314.3981455-1-pcc@google.com> <202503071927.1A795821A@keescook>
 <Z88jbhobIz2yWBbJ@arm.com>
In-Reply-To: <Z88jbhobIz2yWBbJ@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 18 Mar 2025 14:41:39 -0700
X-Gm-Features: AQ5f1JoCSww36ZPRvbJPagyRsMZce1-_UGQToveMTebIsOSwVuNrh895PUcBWPA
Message-ID: <CAMn1gO6Zy1W0M_JsHcX6pcOp8cb7=uWUScf3WGxKTRm=AjXKKA@mail.gmail.com>
Subject: Re: [PATCH] string: Disable read_word_at_a_time() optimizations if
 kernel MTE is enabled
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_144153_025367_E1C369B0 
X-CRM114-Status: GOOD (  36.82  )
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

On Mon, Mar 10, 2025 at 10:37=E2=80=AFAM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> On Fri, Mar 07, 2025 at 07:36:31PM -0800, Kees Cook wrote:
> > On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> > > The optimized strscpy() and dentry_string_cmp() routines will read 8
> > > unaligned bytes at a time via the function read_word_at_a_time(), but
> > > this is incompatible with MTE which will fault on a partially invalid
> > > read. The attributes on read_word_at_a_time() that disable KASAN are
> > > invisible to the CPU so they have no effect on MTE. Let's fix the
> > > bug for now by disabling the optimizations if the kernel is built
> > > with HW tag-based KASAN and consider improvements for followup change=
s.
> >
> > Why is faulting on a partially invalid read a problem? It's still
> > invalid, so ... it should fault, yes? What am I missing?
>
> read_word_at_a_time() is used to read 8 bytes, potentially unaligned and
> beyond the end of string. The has_zero() function is then used to check
> where the string ends. For this uses, I think we can go with
> load_unaligned_zeropad() which handles a potential fault and pads the
> rest with zeroes.

Agreed, strscpy() should be using load_unaligned_zeropad() if
available. We can also disable the code that checks for page
boundaries if load_unaligned_zeropad() is available.

The only other use of read_word_at_a_time() is the one in
dentry_string_cmp(). At the time that I sent the patch I hadn't
noticed the comment in dentry_string_cmp() stating that its argument
to read_word_at_a_time() is aligned. Since calling
read_word_at_a_time() is fine if the pointer is aligned but partially
invalid (not possible with MTE but it is possible with SW KASAN which
uses a 1:1 shadow mapping), I left this user as-is. In other words, I
didn't make read_word_at_a_time() arch-specific as in Vincenzo's
series.

I sent a v2 with my patch to switch strscpy() over to using
load_unaligned_zeropad() if available, as well as the patch adding
tests from Vincenzo's series (which had some issues that I fixed).

Peter

> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4=
bf98ada827fdf755548
> > > Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  fs/dcache.c  | 2 +-
> > >  lib/string.c | 3 ++-
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > Why are DCACHE_WORD_ACCESS and HAVE_EFFICIENT_UNALIGNED_ACCESS separate
> > things? I can see at least one place where it's directly tied:
> >
> > arch/arm/Kconfig:58:    select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNA=
LIGNED_ACCESS
>
> DCACHE_WORD_ACCESS requires load_unaligned_zeropad() which handles the
> faults. For some reason, read_word_at_a_time() doesn't expect to fault
> and it is only used with HAVE_EFFICIENT_UNALIGNED_ACCESS. I guess arm32
> only enabled load_unaligned_zeropad() on hardware that supports
> efficient unaligned accesses (v6 onwards), hence the dependency.
>
> > Would it make sense to sort this out so that KASAN_HW_TAGS can be taken
> > into account at the Kconfig level instead?
>
> I don't think we should play with config options but rather sort out the
> fault path (load_unaligned_zeropad) or disable MTE temporarily. I'd go
> with the former as long as read_word_at_a_time() is only used for
> strings in conjunction with has_zero(). I haven't checked.
>
> --
> Catalin

