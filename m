Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0355F46C66
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 19:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=; b=PjPYWNK7GywX0z5LBZ5WE493GH
	lo7UjXwLSd0mrhc4bH1YqDrFwDKdxSgxv9yKkheFXon/brQegqJkwP3+/gqmX6pnbBjLWMVdFxpbZ
	HSBvE0siHMO5jRviR3bgk+/zlx+Z4cnsmTWUFPK7smb82x723obqWD7Qqk0MQX1yzyKZypXdnPeDf
	D1wbsyz58M6Ztfiv8cMXbtsVOa+tFZLSH0z+4jI9DQtX9jiPG30ZVy/2YpFaFBmwqV63K7ZfWVUEs
	ZvlT/ICb3pUTn2Z/lK3kmR9daINauHijg4Xy1R+P6/qT8a2EUajMRxYhiDFy6+HZvNE+QfniVY/+P
	bAGD2pLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pCq-00000005R2l-3ozS;
	Mon, 06 Apr 2026 19:01:52 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pCm-00000005R26-44T8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 19:01:51 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2bd5658b901so258250eec.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=KmiRbYtYzxRw4VFdvOU5JGVTl9rcG5nEXZgP3Dgoyx1Zg6kFwkKvwX4+Gf4EEgPw9d
         GOgMInJ/pKz35Hj37VwlyKlwtNaKrV0oB9rZFbHX0KLjI7KFBoIHQGztqLJg9Jp7Baav
         KbAQvmr/ZCCUqj2frKsAC9ihmRc77PsRNrNYETSrajLAU82CGSJsK2YAOuMSfen/eerc
         yzG13hf2JwDrsOQJAlSs9wnfr8yixJ0KuxjlHGPyQ4Of56qOWCGEO1fCkiaSU6m5i7C2
         dk1Rlc6IhLwhU6BHK4cyi/FSiRCePRL9zSnzf3RnXn3Cfz8H/AIv2ZVpLavhohBKUvuu
         xMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=c2+NOC9+pET8VISmn9wekh7mrOtCT/G1qFz+gvNviww=;
        b=Dcq5kmTgHIVjhHk3YjIOKFT3j7GXv68FQo4lfMCcx7ICIoMZfKFjlQwI58+FcQ9YqA
         VYgxdxDlVSzMgSfarczbYw8jyY60D644T1fgzdbzISOW8D3d3ELD/UbKGonUP7Gq7uZH
         iZt9X2bggcBsh3sZ5c2pgEymI7cq/5xc8pdNAGCdWPRgEZ7B5j3G8x9ZHCQsf0Xs+q4X
         l/Ij7F080cu5BvLBhnKCtCt3eM02EAV8RdEZsC9IMEYIXM9p5ZF4z0dl0LWOEhNlnLBa
         K5iIf8B9VPMUnTfxIuWCxyZiQo71xCdZkwlWni89kwHoZeSy0cCp/mbQnc1T/Op9d85R
         SN/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=M02hHpfRNYB9wGqMBl6eFiH69oIJUpEFyrPQFyU3Gn7RVhvtYJtJJuXOxjNorrjJn1
         sDA3C5KPKtucz+DqnGSCG/k9f61MBQw/3ieb2ZwMUN0CaneVnmtu5h6fWq8i1fPHTYjm
         Xhj++iSuiXoCuD2icNsItDEO8eo08Ns+Gff0lILxIfigZxmss7yZ86p6NZGX+agPpG+u
         wMAGLcR83j1ZgDPgaUK1US9Jsh4pJMSzc86Um8GTGqEcznrd/61vKhuIc0HFQAtiVFAm
         RmA0QQbCgoh0phWB5IPN2/Gy/O6GJCuoGREED7gn9hdcAsQrgcNyIuyekh243+n9QTnW
         7ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=X+yocKKvdYC68apnYcCBvMCkaXldK7TjV/h6eUD0wuqAgbl6x93Haxezbzh0cESINn
         Z9kZfiflm5B6SrHeWh2NflJbCmqgnUQelw1Yoi7UyhhFw309hgxz6RvW6YXdzMtnSmq5
         TLfL8M9pUjTaBaLz5M88dwtOHDWDSUku2/0xj/l23Tl2pw3GGgB4y9XccyO0/9Tm3LPD
         qfmpjthVOiXbA6yANjmVa+co313GTJHQYPEIMOkUgusnnNhtlVjLs1rWRQ2k4miLOj0i
         QxOi/EGuoCWiH4ZubjZMIyXmTGziBAVaCJco1ICt/ot1qDvC+SLQ+OeuZOslwEsUcvvO
         tfLA==
X-Forwarded-Encrypted: i=1; AJvYcCXWph3Y7V0m3SsQpMwloMDnRMTL8V9rTnfYxvoOyl795IDkj6WVkTsAp0Aldo/2xSu67Lksm2YEA9zokMoC6GJm@lists.infradead.org
X-Gm-Message-State: AOJu0YwUDXOBNbkfEEGTPA5WywguE22zqweAR/tjemgHIrCjMy5b96uF
	4Pk/EPVGP5ee/eZNnIGai+y1GiNRj566AY5pILwI4OdGlF88Rv7cgVALEP2UEAPJDZjVcGzOM4D
	p5ORAoBZC48bRDzHf+C6DR8rKzX5QVLA=
X-Gm-Gg: AeBDiesMgcsN41nsWFIvT3N7Z5q3fJqiD3dYW2nv6w0W47ruiKatnvqpP5dep6WD7YB
	wPTnUK5c9nT/zsqCCUcj49FH2dKVxah0adyR4pYBW9ijioNOMJeGPXR2HiZdM5xNJpTjTBnSMYr
	FRC4jDjZ6cyZBoiFZZqq9R0nyKawrS9sbLD52S0hNkC0X5v8N6uFkVD+IPxED6Zbx708iKMC2r5
	Tf/KVfVGJpnFfWALjF5r87+a3+U6UFFojkzV1N3QUtb+VhFi0Mgx8Z0cAFqcwoaPi7OYnfdp72J
	k2K957rTHR85YsL4Z83K64YSGai6ShnYh1/gQw8/2VBJOTZXsU26qhx6e8vWjGYlp45hwvTZovq
	BTkGXmWZSepYRSTCUxt333r8=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_120149_049559_66D7B12D 
X-CRM114-Status: GOOD (  12.74  )
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

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel

