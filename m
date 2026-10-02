Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9667ACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=; b=dVJ+fXkvbN4UZFx6msEt/V+eq9
	p8/QkjzRvX8mPNgZOcKynxNyJ5KV4oWAXZ9PJcbLneuej7ooCX5wapAMU9B5BGepr8/ZTaD7wZKh/
	kUlXL+y5pFXLyjT3a1+PY//N/Y8Ncj5z4cy+XcTsNM1lQU4BXVNFGax52ssybtbQO9KsB3Gg6RmXX
	Gp26c3hYbDxmeuXGdlNk/Kg1yJTl27pQtoQCCFp0gxZYKOu0q9Yzf5BNHP3uV76giV7zU+wkESHrc
	qXRzgodxcKQa0d5wmKfLZdWpVLftAxOTsKWhu02hs6IJslHtGxk/MUmzMTlTLSBe7epw6jwsZ/zrS
	05Rg0+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbZm-0000000BUie-3TNl;
	Fri, 02 Oct 2026 11:37:18 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbZk-0000000BUhp-3HMb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:37:17 +0000
Received: by mail-qk2-x0e.google.com with SMTP id d75a77b69052e-5332048323bso61101601cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790941035; cv=none;
        d=google.com; s=arc-20260327;
        b=qkWVIESgqeBucdcY4FftYukYWG69XnEgWtqu8sNN6EacOASnkHI5JFzjFJwWlvWC8u
         ehlLkWFEuEeNK87OhkU3MUgokn6JnXLEayBMVBGsObxEaSDMouGRb/dqlktVRRsFU51Z
         q1Cfo2Lzbq1SBDYlly+ZcBNieFsjVixDD97IKdsK9p1eWyu+aD5yfmSGKQqZBjKQ7fjv
         y6bleMp0dDL3JGjtN4jMO9yNdmqlLhxioaGwAESo/dE4r7sXauA864sRaIuVl5Ah/C/z
         uSorbft/+hBVBqgstRdMEwL+3f4/bhgYkWmkORCj5Cddnn94A5mw8B/xNHEbcAuWkuCg
         N1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=;
        fh=FBQk/oI34/22rBa0bRR7J+L4tdzUc0murh4w/ilQmEo=;
        b=IXS6xyUJVNBmMLZLYxjpLq7Pg+A1kuIX22pLtHwL83//wu/WeQcoR00ch4wnYStxyR
         SRKM1jTT/70lnn309bOuiCDxSTIkCHrP+RnfJ4cPASBf4giwbx1/6VLJdzBo+IPUav0m
         Odn9KA7z231DC6br7FGExhlfiYvdw+pv+Ffy0ybBx6RaPQkPo9aS+JRe6L3AxwBhtoc7
         iFIZ0crzO6D884/Ir2m6whXLfPjmh8ERqUYL1jExaK/8dEuyJ7/92qwQAlFpiiIHUE3+
         5T5TWZQ4hQINXPu8pfNiCB21dsTG7n3vlSW70Vc2Pc/l8phDdS8CWYXi+w3bLSg0SDIl
         EeDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941035; x=1791545835; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=;
        b=aF+hImepICLLDpcodhgz6MilHSrkj3Q1nD5Bf//uU6STKiXIAJfCr+ZGd/tt2Yu82E
         SGHK0YnbBk816pHo3YSwb+vB30Hq9tc9M2ooaHWuU9hejE2QyLPNUlVFk4MiPZ/nPVfz
         WJLKwsyvtHx28KJRSWE60543/ZRiWZZHukuM6ZqGSq81bPjGSVBQdbio1VeeJB4Y1Dov
         IuhqkMd/fg2TnQdVgxzJdzeEZUxsMUduZEHV0KIcfr3Pis0+rG53YcJl6oXZhdJ8Mw3b
         LPo1leE2OpOYPEU8buMl+SXidyn0E/IBo1SJtAV8Djq3G4HD/nWMoni+uAby/btCIpMH
         jnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941035; x=1791545835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=;
        b=YPNAhrv66Ib25elihaJJVkwUqmYQxeaEMNhok5PVi7oRSpKlnDOTPXE78PGn0cMG+f
         BV5aGA0bJzDaB9OY5uWxwoM3PlMSqwkK1kmKPbblahCZFfCP9ubRMDxAnFUkNIZeQMnX
         bjuZcG1Id3l9KHRZEl8bcldA2jL1u47qCHPn3aay4dC6Hw8cSc9Buv1Ja0HQCp/kdCOg
         7sf95L1UkjO3qUI1K4RX6e8M3rp5kKCK02DkWc+OindyMD8sopPWO7aaCmos90uJJCgm
         CJTOkG+mo434211eFX43p+mMo/7rsB/tNEb7ana2r/sRhwwjWa48jvZ4+J0koAEmGAIu
         I7lg==
X-Forwarded-Encrypted: i=1; AKwUvBw2BTELd5pcH+6sQz0DPLGBr1vz15i2eFb0yAj0TrHe2keXwyFjbFqtXwMFULez1mogMvo3/NoBEM+ZVcnKvW9I@lists.infradead.org
X-Gm-Message-State: AFuF++kx/TPTR8hi9JP9kXWQNwjBuh+lYebhNOP7Hgi2BYsU3os4Z8NZ
	Yig0v1fDe2QDBvYcK4GkOdnJdjI0oYR/QgDNkF0UpWGJ2tW6MyeqfVZQfCZbImpagGTyrGg/WwK
	nOuqnuwJlo0uX4sMNesPs6vrGLzv1k6o=
X-Gm-Gg: AYBFou0znfLk7RXEZAfEe/r2S31u4moNKfQlCNu48db9/C3vyWl4OfjgaMSKNPSCT6R
	CIpUveS7pITkYPeyCUOzZw+Fx2OIw2W+EvORsCU4aOtshENJT7SfEzFliqwQh2d6nLZW/BMox75
	YzFK1ZwMtOkg7mUvwfp4Q9aikRxEoKb3Q85vpJ/yt5MCR1wcRyEu2lShJYYuZm5b+46MIV4rmYK
	CXGv9uJyNqbU1z4FwHhm2YssI7h5QD8gp1M7O4d+ERt50Xt4OhKQFh4IEdslw+43oFeIZTV4pWy
	P6Y9l6RJFuabqM6eJHAnh+Lp1Nuxi/Sni70XN78QfttEyLkTisWQEBHPisy3VRJ9ELwXVxY=
X-Received: by 2002:a05:622a:4d45:b0:533:96c9:7ab6 with SMTP id
 d75a77b69052e-533cbdb4c73mr39682471cf.54.1790941035224; Fri, 02 Oct 2026
 04:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261002044050.1277356-1-thepacketgeek@gmail.com> <DLUBA9JR5QHY.31UKYQQ9EYMDL@gmail.com>
In-Reply-To: <DLUBA9JR5QHY.31UKYQQ9EYMDL@gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Fri, 2 Oct 2026 12:37:01 +0100
X-Gm-Features: AclHuK_xXspU51eUha2NYmeyNcOU_aQLhOQFxxEdwFOzhD_cXYtGDGcItbka9NM
Message-ID: <CADvopvZPO1gDMDhDOPcArjRJ0cPpSUZ5suMg-1kwRi+_-Xeitw@mail.gmail.com>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_043716_841563_621E4537 
X-CRM114-Status: GOOD (  21.05  )
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

On Fri, Oct 2, 2026 at 12:21=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Oct 01, 2026 at 09:40 PM Matthew Wood <thepacketgeek@gmail.com> w=
rote:
> > +     /* pages of the bpf prog pack are shared between progs, so the
> > +      * set_memory_rw()/set_memory_ro() window below must be serialize=
d
> > +      * against other pokers too.
> > +      */
> > +     mutex_lock(&text_mutex);
> > +
> >       if (plt_target) {
> >               /* non-zero plt_target indicates we're patching a bpf pro=
g,
> >                * which is read only.
> >                */
> > -             if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), =
1))
> > -                     return -EFAULT;
> > +             if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), =
1)) {
> > +                     ret =3D -EFAULT;
> > +                     goto out;
> > +             }
> >               WRITE_ONCE(plt->target, plt_target);
> >               set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
>
> The lock hides the crash, but set_memory_rw() is the actual problem.
> The page is shared, so it makes 64K of other progs writable and
> executable at the same time.
> Use aarch64_insn_write_literal_u64(&plt->target, plt_target) instead.
> That's how ftrace_rec_set_ops() and arch_static_call_transform()
> update 64-bit literals in the text.
> It's atomic and writes via fixmap under patch_lock, just like
> aarch64_insn_patch_text_nosync() below.
> No need to change page permissions and no need to move text_mutex.
>
> pw-bot: cr

Thank you both for the quick review! This
aarch64_insn_write_literal_u64 makes sense,
I'll test and submit an update shortly.

Regards,
Matthew

