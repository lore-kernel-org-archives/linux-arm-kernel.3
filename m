Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E2D1951B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 23:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=; b=LEY387NMRs/LhAhHa6zTql4cQw
	up1+QIZcdQZ0iptgNnBqpcpBxzqgitH2FXBiGDKRZ389O8qxxteJApAeztuTucLRWT8uGzawwc2Bn
	k0qmWzgvPUcDbF6VXMvoU4TGOUANUk30afv6O4om2KAzuUUuH2/KoAKstdO/rNlHe0wmnQ2LA/q1n
	imTjX960R1uJOgcRUnSeukJUS2HuAsdhBaqQo4sS0eESLaTCxLRK2X4IldKAkA5PiXrjqayZApf2A
	eJmvOzrbq/69rYltGnt9M0kjE/6CpjKNO1nZI+GkMS7g6xg3VupBj210ayCagotuVwRG3BCsK0A4W
	fov5n2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkVog-0000000DLFd-3acA;
	Mon, 26 Jan 2026 23:16:18 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkVoe-0000000DLFI-12dx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 23:16:17 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1248d27f293so4589620c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 15:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769469375; cv=none;
        d=google.com; s=arc-20240605;
        b=AJ0NbHBYJsEJhAF+5F1a+obD/BMAIyBywcA+qUYI9fHE7E4GwX2G2lOv3Z5EvGefZS
         kJL7y8uIYKh8T4Fx/ykQRGv0hePFEJXFCa+/96Tz0k8+QCuRaM+LcsijTfrsab2yfCMf
         EKHOPieemN11hZ7D41DivNF3JYg9M8m71gsXtlCHEAAd8SK8PfjxWOotfArh4Ppgqbdi
         4wkVRIuzi3+SlItiGau9t2t76vSHtTGZ0QDB6Bvqz96JZ0etIxeXkACp8r492pSrq58+
         aTxgu5ZO72UCMPi1idc2wIvsOfUU3xiFNQRH1PLx7V3bJgD0+XREXDZOc77PMBS9dTGk
         h43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=;
        fh=stCWPQM70Bo/b3h7i5Fu386DmGh6Chp2iLugh+QEp10=;
        b=S001b5DghqFCWZpdsypOwCGP/Nb6tGF/25hflTV7OjjMVBURX1uJ3JmEd29cjlZJOL
         iOEfGmAuO7qLryTRgneeUkjawz59l3bgGdbLZkJlCC+bZwQw22iyCtONPErx5QwUsc58
         /CnHYNDAkEgVlezW5izOPlOZL/5BEhMvSET67XKYOHyK+H3OGjRVdu6YfSyjB0qL/NGB
         /RggjDoTlWOQTASw+mH55urShxpeWElBABGrPhx004BXSp8YrXCsH2+iaaTKpTDpXyk1
         6Zskbty5vZjfNmc5YGFm73HXJLsuplJLkl3aGMPeZ3Bj82Bwc6a2i+DTkMuyqj27khi7
         didw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769469375; x=1770074175; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=;
        b=NpI72Oxkjihuya0MtSsMg6oeTzT/t9f0rZfZmuDnOWqC6y0Oo0JOn6pgkX3kP5iPtf
         pq9rd8aAzF22cu405zHRB5MgfTbKS4yEs2VA+1XOybW24n39OW4h5pjpT23t/eUVtHKE
         CE30JL+JRzhyf42kCr+UoM64ZC+YZJyZvcFCeDLWA5dFwTDU3PYe70QetR4uLjs4whEE
         QWii/QSgq0r3eHioiUQ5RMSEE+5s+934nvAJI+c3Z26V3FcMlXTd7F0kpaYjOYgozX48
         LMwLBbVzBfKZ1bYGMzpl0Vu+VXAOtPkUttP0SViYzgO+uwEbTIovzNs8v4+otzx5zsSE
         ZMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769469375; x=1770074175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=;
        b=YSgtlomcyRPNNqGJ85Gj8873SeMRHiFGmFY4JNxRdtUrOVVA6hYleVoq2bJOnyO3/N
         8ysJs4y+wqbsLMMQDVvuSDY6RrPaFRznnkEiccZPjtJ5lEPQzeR57dHr4/tq0JIRvED8
         djL+ZMULczm+edCjnGtns/BNqHt3wVckZipm/Gtk/tNrEZnPv2vBublQTDPm2OLKWduY
         JqNdonZ1XWarPy+w4n1DrOMCvaUsBkUGcVKZWjow1UUX/oaeqGkManRWs6jGa48kFSPS
         Ffv2wzPn+If+82haTqDp0jhGJ6OhiFdn4Xo9b+9i+o6O4dmlFDlMy8vx9QG0z+sz7Gd6
         jb1w==
X-Forwarded-Encrypted: i=1; AJvYcCVexdq8FDt86AhDPjNNLSaSlAO5FMKZ4V009JuPujE9gOqrevotWBRwDCrkQNSxrLYQubgqlLeppp0DYJjddv+r@lists.infradead.org
X-Gm-Message-State: AOJu0YytDvlNqwonUev2pDZopGbk+HXgwmqNc0K+fI83aa75jnyXAcr+
	UWHQINsmYfnSejkD3756HrwIVeKLo+ymxZAlcz+UI5yi4GbWOe7f+i360jl+hCP2/JFGWucLTXw
	ng4Svubs14tiutI0Sk+KYZMPQeEUMQZDwRaKqHi6N
X-Gm-Gg: AZuq6aLuneRd2hGN6Sq706dJcJ08k8oVeEC9IXk86QQWxk20wPPRrLop/3A9sFAQh5U
	7LkloGIfwbou3+mLtmYmZXFMMKdPC+U7rR6sjk0JEAj3a/rfzpbISjd1ZusD9B3+WIMNVXA45Vl
	XInDfqVJdeAiVCdEE8Y9YWYtVH+tBJyT7OxVsSjobQNWZQeDYMMYtK6uHEvTspwMyyu+GOTrNJ3
	AAtnNv7Ex/AJm+B9RzWhNcFkMOsHUh5yF+3t/0IQYZr1BKVwC7OJ2/P7Nw5PFP/pClWy87Ng0L7
	v2gAU9cY68jbIhT9/mKBd21GEuE=
X-Received: by 2002:a05:7022:4189:b0:119:e56b:c73d with SMTP id
 a92af1059eb24-1248ec0da9cmr2570569c88.2.1769469374916; Mon, 26 Jan 2026
 15:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com> <20260126002936.2676435-3-elver@google.com>
 <20260126111643.534c8274@pumpkin>
In-Reply-To: <20260126111643.534c8274@pumpkin>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 00:15:38 +0100
X-Gm-Features: AZwV_QiD3_ipngjN37zY3RtrCwuNKR0vaNI3HEz51trEIWvcYYXjpjyuf605hOE
Message-ID: <CANpmjNNUGzgLxSj78ptW-t5ux7WL7sq3q-h9acGEfJxC2u==hQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_151616_352336_7BB6D2F0 
X-CRM114-Status: GOOD (  25.88  )
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

On Mon, 26 Jan 2026 at 12:16, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Mon, 26 Jan 2026 01:25:11 +0100
> Marco Elver <elver@google.com> wrote:
>
> > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> >
> > 1. Replace the _Generic-based __unqual_scalar_typeof() with the builtin
> >    typeof_unqual(). This strips qualifiers from all types, not just
> >    integer types, which is required to be able to assign (must be
> >    non-const) to __u.__val in the non-atomic case (required for #2).
> >
> > One subtle point here is that non-integer types of __val could be const
> > or volatile within the union with the old __unqual_scalar_typeof(), if
> > the passed variable is const or volatile. This would then result in a
> > forced load from the stack if __u.__val is volatile; in the case of
> > const, it does look odd if the underlying storage changes, but the
> > compiler is told said member is "const" -- it smells like UB.
> >
> > 2. Eliminate the atomic flag and ternary conditional expression. Move
> >    the fallback volatile load into the default case of the switch,
> >    ensuring __u is unconditionally initialized across all paths.
> >    The statement expression now unconditionally returns __u.__val.
>
> Does it even need to be a union?
> I think (eg):
>         TYPEOF_UNQUAL(*__x) __val;      \
>         ...
>                 : "=r" (*(__u32 *)&__val)       \
> will have the same effect (might need an __force for sparse).

Unsure, but we might be treading on UB even with -fno-strict-aliasing
given all the inline asm around here.

> Also is the 'default' branch even needed?
> READ_ONCE() rejects sizes other than 1, 2, 4 and 8.
> A quick search only found one oversize read - for 'struct vcpu_runstate_info'
> in arch/x86/kvm/xen.c
> Requiring that code use a different define might make sense.
>
> I also did some x86-64 build timings with compiletime_assert_rwonce_type()
> commented out.
> Expanding and compiling that check seems to add just over 1% to the
> build time.
> So anything to shrink that define is likely to be noticeable.

The compiletime_assert_rwonce_type() is for the benefit of the
asm-generic variant, which is implemented like the 'default' case here
by default. This here is only the arm64 override of all that with LTO.

