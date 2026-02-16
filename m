Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FD1E83823
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=; b=UImyw1uotsTZBst4fbKEraWATm
	8VaNgSYweM3DgMUtsCUxmuKU2GHLZXTbKSpR8i6n24Qj2A8cwIJTHQqVdKzeIDY6DIDwTilKEs31J
	kq0Doy7NZM1ZJqupDTTcv6UggyBIaNzw8Qnew5RSLBWRjBjrURF6ReEOmtrMYLWMtAkryVi6F5npD
	bDFzLjX9wMjRez+npGoCzLU2/gloFKadpSSuL7njgYxLDD1LK41ADk89WE3wDtOZc7O4AlSoFTGMw
	WTghTFBr3sXHKbpF7pVP8xelwT9SiVP3VBC5BUpRq2jMXh9VRofjwvskEntlsv/FlH709IWq76O2w
	I3JNwEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs3X5-00000007A4Q-10wP;
	Mon, 16 Feb 2026 18:41:20 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs3X0-00000007A3W-1k55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:41:17 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1270adc5121so4541586c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771267273; cv=none;
        d=google.com; s=arc-20240605;
        b=WHcXj4BzreJ6lc0r8hQTyBlSCexai9hYj7VdA52Y5/kuBy3ZowTJaNgHXZRv2gyTWC
         Iy9ktjNldVgPdMEPg2e7sfXIsqgByaFYtcZNWc36x12eZ8ivSMXxu+Lv/RRoIzZzaz+J
         8jVs2TWshq6wnH7fsCWHurcw57WpF+9Gp21KiT23ElfWXEO/+ZDfJLh8BVhxJD60aMUi
         Ggp6g/ez4GQD4YdWh+OsHO4/Hce6tkH31rMgoBo3NhYv0k/Fo/SiekGCggEdhQGLIadS
         yXHAO2xv+p0La7fgu4XSWCooXI4jRJTMlv1nFO9FDFxG2t/8SXYrAaLo1BHPUXMMWLS+
         nI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=;
        fh=6buOkIs4fHUlnpLsumATQSB53VVn9SABGv3ZR06z++4=;
        b=S6r2Ghx5LDM5WC3D14OL7cr8gj5QQGW5UXt9mdkm4MVysHvryiHtUG4edfYHylOB8+
         U0v0ACsSeCRa+CArp+/7bu7zWIE2X+vLh+xAVEHxax6EbGwLVjxsJeiF2fCevpRhLLDk
         jHJQkqObu0gwqMP9sdCySqgi1IldasKJLkNzEOgLyxrDUavYkI4dpP3A4zgfnwGxyo4z
         VT4odexpnT5ZxxiQVm/f+pmgITKUM0zLEG3as+O5M0a/p+DOxngecYTgm7yo6zAFC6cB
         oROXzeMI27dS948yJ8dMNpynDHF8hb3jvjW7SKF/V/xtdLcx2jovl1PXhkScL6xaqvrY
         0GPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771267273; x=1771872073; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=;
        b=It3FcTX3Pi40J++XZjpgdDJv55E7XHsP+XeWxBT26xH/FPXyLNp6lhqPI+vo6ielmM
         QFn6rdog+8aJ5uh8xVyKTuedt//HhfjzYFa1IsjZu+fJooq9I2MRhQvHwFRCcUfUnC17
         YLaTtNXusCxn6SlzwEN1Db1rSvX0mq1Yvk7F5ENxNLvNf1PUug2N/hOKyLv3bXYglQzh
         h3LSnOhVsg6KuNyCqLr5W4UCYAAbzzyQwynre1ElPNX3I1Uqe2f8m4c54k7pMnKOtWi0
         CdydgQGRKxXZs5PZDhphmEFOEi1NzoAcv+Y8+0J179TMxcKlvwxIhT6Ks3CHobiYmhqf
         Iwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771267273; x=1771872073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=;
        b=sIXoRJrhQbvTd9NYaIBQ4ZuBKP9IA1ny9Yj+22GjAR2Gs8ufy3fSVtLvpWw/19Gkr6
         ZHp+kZNM8SdHpdAx+U8HMBiSnepAG0lNKBfIx4rowS4n/4kzxOUtADDwJhu7n7oNAFvd
         KEULH4Zq1NMCaSOhKi1IbX9w94OrqCcwv82vXcHr3U9Gq14ytk8++uEIxVVDCHGiT5+9
         pd92YGtqCCBN+MruBsdKsMGSB4TnFio0hAXui8bKcu5lqJWiJe1oWFY3uxPW/fYOgPFE
         bXxJ8gv8l5dSejzwBcGxpnwmF/iWj6uO0uwcJAMmY9FkICO2UQeUfIeGVOR/InxLJYY/
         9GjA==
X-Forwarded-Encrypted: i=1; AJvYcCW57y1scsZsBsePAIXOEwmfihCl943+RbMWFQ4NwKfRcstS3lKvp6f5FTyOPoeg/iT054BA91BVKCvL0s6ylrgB@lists.infradead.org
X-Gm-Message-State: AOJu0YzG7+E/nMGJDLd3SgYJ5PpsHjT8/f4BwdhZs17z1VwpuRSne//Y
	efTZhI1kO3GUPx1o/r8qJnIiAwp/bmnbsqq9EN9ikcm15CmJ9JZLPNYzH1UizcoEWx3pvS9BvW7
	bExubpUTlOJbVyQy6lCqBXJeWCWqQXeLWKJnhH83t
X-Gm-Gg: AZuq6aI10KApm9qQzCHiHmHl/0xNLlq1Mr+iFnlybNOcOdf7mOXJN0ryYypSzOrI/I3
	rUyWvfj+ARFI+fYwya36Q1/Xl037/jU0GLYJDG3SwwalBZPdiYMDocRC3g8dppEdv0QrDLuXbur
	pYep8vRDOLibt0WO+K85olchUm0yssDOA7SwgUaonTDIfiiIOubBz3KQjzXh703AK0Thml/ieM8
	jBwbgWi5/W7i49alHIxXmIcZZLOgiWhgxtR2Fw+b83x3wxoWY61Iv0QYgWRI2zLJBmV7N5E+A3L
	5rwSRsT8gHno9mjEeSaxHisJ6iSY3bkSoqSmgz95GyNI59oMJw==
X-Received: by 2002:a05:7022:4583:b0:127:15cd:9f52 with SMTP id
 a92af1059eb24-1273adf07d4mr5466689c88.5.1771267273017; Mon, 16 Feb 2026
 10:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20260216142436.2207937-2-elver@google.com> <20260216142436.2207937-4-elver@google.com>
 <20260216180040.6a93807a@pumpkin>
In-Reply-To: <20260216180040.6a93807a@pumpkin>
From: Marco Elver <elver@google.com>
Date: Mon, 16 Feb 2026 19:40:36 +0100
X-Gm-Features: AaiRm52AgDWqeZgz46e-SxIU6FJBy1l6V8ecxUxIHqMxYd2sEoEiCIofE0fG1Z8
Message-ID: <CANpmjNOreeZxbUZC29-yFVd_XWAFn2+oJWhzAr_xXH2wogfOkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_104114_494152_F219E74D 
X-CRM114-Status: GOOD (  22.43  )
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

On Mon, 16 Feb 2026 at 19:00, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Mon, 16 Feb 2026 15:16:23 +0100
> Marco Elver <elver@google.com> wrote:
>
> > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > could see:
> >
> > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > |      976 |         spin_lock(lock_ptr);
> > |          |         ^
> > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > |          |      ^
> > |    2 warnings generated.
> >
> > Where we have:
> >
> >       extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> >       ..
> >       void futex_q_lockptr_lock(struct futex_q *q)
> >       {
> >               spinlock_t *lock_ptr;
> >
> >               /*
> >                * See futex_unqueue() why lock_ptr can change.
> >                */
> >               guard(rcu)();
> >       retry:
> > >>            lock_ptr = READ_ONCE(q->lock_ptr);
>
> Did you try adding OPTIMZER_HIDE_VAR(lock_ptr) here?
> That might force the TSA logic to use 'where lock_ptr points to'
> instead of trying to allow an unlock(q->lock_ptr) (or similar)
> which is clearly entirely broken.
>
> Testing a compile with the unlock() missing ought to generate the
> warning - if not you've just confused the code enough the it stops
> caring.

OPTIMIZER_HIDE_VAR() is not appropriate as it might pessimise real
codegen which we don't want - the warning/analysis happens way earlier
in semantic analysis. But we have 'context_unsafe_alias()' which could
be used for this purpose, so 'context_unsafe_alias(lock_ptr)' after
the READ_ONCE() would work for what you intended. Except that this
function wants to be annotated with __acquires(q->lock_ptr) so the
compiler needs to be able to resolve the alias properly for this to
work.

Overall we can't really expect the compiler to see through inline asm
during semantic analysis, so we need to trick it - codegen should not
be affected for any compiler that does a reasonable job of folding
these local variable accesses.

Note, it does work for all other architectures as-is, given most don't
use inline asm for READ_ONCE().

