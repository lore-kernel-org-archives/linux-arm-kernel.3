Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77791E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKKVyDU2xuf1bMkgmBiqdMGhmGzXB4tMJvT5e24/94o=; b=vNSDyNbgPvPYdvG8zctRShYTUz
	g1qcCR1Vb3+uvl/D0Fk9yhtbO3WKN7Pomz4pEOCC7G40LKlFpA81Iesu8kb5QUrQM1hQDNRsqEwMb
	PGZsfQEHTPvIuJLhZ3qVl5dafxcUnVLcPySH+8/7uaVjWcCK7mU8EX3tj4XQK0vfLA3Cpkmn8Fnzd
	0TFClEuSDqFB6R/RIlynei/qWnIcdGowXlGD+XfHQqoFYtH1E1bm6ywdKbmVnpcWx0/lWGl+8qZtf
	Quz1zyKCRHszJDaXSYvkiVV9lc3Zx9BVLbTJuJSYuqfZl50CgoNydZzre6Qky57fK1LZOqo0Qh/bl
	Ch2Cb88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM11L-000000035JP-3laU;
	Fri, 13 Dec 2024 08:27:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM10G-000000035DH-2HGk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 08:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92136A40E72
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E83FC4CED1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734078387;
	bh=MyzCSzas+3pO50YUo43cy2noIiPHM/lKqgN7GeflZ2s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rnZZzUxuv+UHTqe9KOqxZvL6fddGxECYoWMLqpgSWJyHCHp4782ROqddM+D0s74W2
	 EHgIdwD7vAcp3kRy1ylav4Iu1jyrojiZ4pOKquGsvW/go3W2Y/Ov1jpBzA1HzGUR0r
	 u+hUuSNdsdyGfvkintTKdGpF18e3XquyhGHnd9Axw4TCQ7dGGpDOBzcLTGzzA3HhsG
	 +Rt5/pbGSylX5oO9ADzt7lcp07eOX5YNpjdE3V/PMOfamyH/mkrl059DtA0BoCoLIQ
	 2lMgL+/JaNDBffQZuCTq3h7bXaXk+TqlKKVO/6hr3KQvQB31B6MeclCmA/vr5rvr1v
	 oWmOoRIfzXlyA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30037784fceso13545861fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 00:26:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKOhYMuhmbsG4udHPE+qp8pKT//gECCz8OxhNi53ndfgxpDBSQmPgmExvv3KU7Nm0HzF4DaPONY5Mb7/wIaL6R@lists.infradead.org
X-Gm-Message-State: AOJu0YxVXrHJgiyJsSqhQrv3Q5UabHeIlgwGdCxNmw3apKgHUw1ti50r
	2HY9poYC/zlheViA1mCZdBjTZX0oWGaH0uK0jx/yg48baZhSgUX5iOiznYoR/bsbjwWA4rveeCW
	boFazHuXcl5V4Sewl7gPWwywo3NE=
X-Google-Smtp-Source: AGHT+IHG/Qv2mrDmNDi2VehnKTnQ0OLfyW82xHerP4WoDxxA/je3nQ860VTOmHbJoMzPYM98V+mDWqXrXQxppXFbsEo=
X-Received: by 2002:a2e:a983:0:b0:300:1d45:871f with SMTP id
 38308e7fff4ca-302545669d2mr4741761fa.5.1734078385776; Fri, 13 Dec 2024
 00:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20241212082426.4110-2-shijie@os.amperecomputing.com>
 <20241213053049.7592-1-shijie@os.amperecomputing.com> <CAMj1kXF=1Hr9G4ZjnEVzJ1snn0V4L-=+bMU4bn=m0UbYLyBqGA@mail.gmail.com>
 <be0d7423-ca33-416d-a410-3ff303493261@amperemail.onmicrosoft.com>
In-Reply-To: <be0d7423-ca33-416d-a410-3ff303493261@amperemail.onmicrosoft.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 13 Dec 2024 09:26:14 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHXeiPiksuOabp-NXu0ORmmP1Jd1wZPmgAi09jsjaDAsQ@mail.gmail.com>
Message-ID: <CAMj1kXHXeiPiksuOabp-NXu0ORmmP1Jd1wZPmgAi09jsjaDAsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2 fix] arm64: refactor the rodata=xxx
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, will@kernel.org, 
	anshuman.khandual@arm.com, corbet@lwn.net, patches@amperecomputing.com, 
	cl@linux.com, akpm@linux-foundation.org, thuth@redhat.com, 
	rostedt@goodmis.org, xiongwei.song@windriver.com, inux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_002628_707654_BC3AECB4 
X-CRM114-Status: GOOD (  26.64  )
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

On Fri, 13 Dec 2024 at 09:23, Shijie Huang
<shijie@amperemail.onmicrosoft.com> wrote:
>
> Hi Ard,
>
> On 2024/12/13 15:30, Ard Biesheuvel wrote:
> > Hello Huang Shije,
> >
> > On Fri, 13 Dec 2024 at 06:32, Huang Shijie
> > <shijie@os.amperecomputing.com> wrote:
> >> As per admin guide documentation, "rodata=on" should be the default on
> >> platforms. Documentation/admin-guide/kernel-parameters.txt describes
> >> these options as
> >>
> >>     rodata=         [KNL,EARLY]
> >>             on      Mark read-only kernel memory as read-only (default).
> >>             off     Leave read-only kernel memory writable for debugging.
> >>             full    Mark read-only kernel memory and aliases as read-only
> >>                     [arm64]
> >>
> >> But on arm64 platform, "rodata=full" is the default instead. This patch
> >> implements the following changes.
> >>
> >>   - Make "rodata=on" behaviour same as the original "rodata=full"
> >>   - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
> >>   - Drop the original "rodata=full"
> >>   - Add comment for arch_parse_debug_rodata()
> >>   - Update kernel-parameters.txt as required
> >>
> >> After this patch, the "rodata=on" will be the default on arm64 platform
> >> as well.
> >>
> >> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> >> ---
> >> Add more descriptions for "noalias":
> >>    It is not a security feature yet.
> > Why did you add that?
> The following is the current status of "rodata=noalias" by checking the
> kernel page table in my machine:
>
>     1) the kernel code keeps read-only in both the "vmalloc area" and
> the "linear area".
>
>     2) But there is a read-only memory range which is read-only in
> "vmalloc area", but its linear alias is read-write in the "linear area".
>
>
> Maybe the "security" is not a proper word.
>

There is nothing wrong with the word 'security' as long as you are
clear about the fact that rodata=noalias decreases it.

>
> >
> > How do you envisage 'noalias' becoming a security feature? The point
>
> for the case 2) above, if its linear alias is also mapped as read-only,
>
> can we think it is safe as the original "rodata=full"?
>

No, it is not. Why would we bother with rodata=full (which is costly
in terms of TLB pressure) if rodata=noalias is equally safe?

