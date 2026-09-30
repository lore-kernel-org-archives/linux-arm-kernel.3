Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723B5CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oA1Wp5l/4pd5OBAEkVMacf5GMMfFrP8amVpkQqU9f7w=; b=JkO2N+2K3FNcXZ
	DB0y2eFqcRG+wYa7usROADmRKtnae+U9TrrDpHJxJku8UNgDluKJebJL+9DBVHK2sODUzDEskrcAZ
	6Wia6+kXBfF2vtD45lQ8UE8XRn2kpP7TlHnUDuDCCQiQkyYDpw3SnYBhORGwzChSpXiWgceNTJYwO
	iuKePY82t7LmOJKb63aeCVj3Wvr3yZ17AkOCRTMrDs9ztw/cbfr9rK4yoNVTS2Ga2ELv3TEP+VFiT
	8baVpr+Cyq2hhABFH3HKkDDssZI/vEeEOXnntfwCNb+ue8oo8vY2EW4wWGzgNmof2je5s3rZNY25I
	QhB322sPMFCGN/E7J29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ct-00000007Bu9-1ZxO;
	Wed, 30 Sep 2026 20:47:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Cs-00000007Bu2-27ea
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:47:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 024ED43E9A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71411F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801233;
	bh=oA1Wp5l/4pd5OBAEkVMacf5GMMfFrP8amVpkQqU9f7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JzOi+wBOJtDfK8od4CtYUyQkR9gufb/sROMOflfTNYH+NHkUKCNOduI9aS+v4uIZ1
	 t25YSIiLp+Ba6lJxh+n5HJ0U/gqRdnF3MlySrZ5XVEixPM+1s3RZ3VnssAB1om1kh2
	 DkHj31BqWnwFUhMNMft6Rwe1DrQYzSCpI3pEztTjC+Gg0l+dMNPnA1TEfQ2rAN4KtC
	 Fe9VX/BRbmHVfEkF6SBrtwLWlsQ46PA6jezo301PcUkH64Go+jbkMMRm5OyhT4Ig7x
	 zitNiSMPXfs1Ah8fBjER2Lv44cRLKxnI7VPDx4DSnS5ztZz6kmRWOfpnaG654wVC/a
	 +GQ+r3JeTzIEA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso5146199e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:47:13 -0700 (PDT)
X-Gm-Message-State: AFq9FYLFYtMS99uGrQFvaTyGecJpf7Ilf4smM5DFN7iL9oJ6m0y4o5Ql
	hXeQPgRki2vemd2WIjV6oWnHjQcMWq6Bdwg74hkOkvXthwv4kaeyH0zDVg2zfDeKl7TUBmuhxJd
	E5STfwDc4Q4PR3mxd0Ow8H4TnkYlF5cg=
X-Received: by 2002:a05:6512:3050:b0:5b5:edd1:471f with SMTP id
 2adb3069b0e04-5ba405e14cemr1100142e87.11.1790801232600; Wed, 30 Sep 2026
 13:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-2-will@kernel.org>
In-Reply-To: <20260918161407.2300-2-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:47:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=XkQuYGjDx7cGbyAbA3PZxASF=gUJtjF6rMaiWgt+dYQ@mail.gmail.com>
X-Gm-Features: AclHuK8OBD0wnlj_zeKgr2mdF8meUFnoNCcPdtioxRKpQrlc9trGZVWgmVL-ruo
Message-ID: <CAD++jL=XkQuYGjDx7cGbyAbA3PZxASF=gUJtjF6rMaiWgt+dYQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] arm64: entry: Defer setting of TPIDRRO_EL0 until
 exit to userspace
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Will,

long time before I had a chance to look at this.

I wrote a similar patch at one time so I like the concept.

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> In preparation for using TPIDRRO_EL0 to point at 'current' while running
> inside the kernel, defer its userspace initialisation from the
> context-switch patch to exception return. This has the added benefit of
> not having to worry about keeping the in-memory value and the register
> value in-sync during preemptible sections.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I would add some elaboration to the commit message as to what is going
on in the patch, and  correct me if I got it wrong!

- Userspace sees 0 in the TPIDRRO_EL0 when running native tasks
  so we just zero it when exiting to userspace for those.

- For compat mode, TPIDRRO_EL0 should contain
  current->thread.uw.tp_value, so in that case we just write that
  before exiting to userspace.

- Userspace can't modify the register so we don't care about
  saving it on entry.

These three seems to be what the patch is exploiting.

If this is correct, with the above description added:

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

