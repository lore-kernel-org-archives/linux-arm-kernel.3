Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF83CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvfMbb9HmTo7d5CJi/mcWfE1VYq/wzSgaTHxLgl0XGQ=; b=vzaiV/n3WBvA9F
	a6HaJZBYVfhMAbrKEuK2cPPxDyZIo6Nq5cU4uwex7yTI6vKk76hFScKwPnhGB5RBNaIcKD+sBD0vg
	/xJnynVoguoClT6CQVWLu8VWlF70tlkS3X4+g6cwlRiTN3wGXunQM1shuBs8cTZgIoEcTKTKrQLsh
	4BySuXAZ2hTDVD6A0A8qU+gpZbLFWC7KNc/Fx8KsuZYQAPOkdRnLO0oLzwbHM64TAqS/fKaBtDOF7
	s4aU29VrMOJIeCRozqD3zpJ+s6UfFvN8+0gr/UmFr5wnSSMsoxgNUxQvnJ32pWx0ky6vbbNtMxwFM
	yV8lZwNorJ63UBOCCrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1O6-00000007DCx-1TZP;
	Wed, 30 Sep 2026 20:58:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1O2-00000007DC4-02D3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:58:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 234C0601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2681F0089A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801924;
	bh=zvfMbb9HmTo7d5CJi/mcWfE1VYq/wzSgaTHxLgl0XGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mjnNmnfJDxMia94Ym9Y0Y9IT6+Dy44UzIbaFSjXTWLp8uy3Vk5iYTvsjw8PcJMAn8
	 B8UIBgcxsyd4XdTVxGXrC/CTr+/dyqqrKS2GTTGsSzWrepNIxZebLcfUMYTmbJ+2LO
	 8OW17jn02oPcCMSPyQ2UBdyxaDYSbTcu68O9l6jtoElpbiQ2E+8782yF14b0xIzA3C
	 Y9jvjI/vrFVEuAx1auM9R92QXeUmM+cKfnF8EviyaJ2Nir54155plB7qTDLVCn83fO
	 bPGK39TcwihrYPIHWPeXOKJSYWQPx7XihWGwL7hmNnH7i7fpKdgyoJY6CkEWqIVLIa
	 i/SUZxEtQqSeQ==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a779b23f05so8708761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:58:44 -0700 (PDT)
X-Gm-Message-State: AFq9FYKXFZcxaL/J9ykBEFJOvB6WGALiPJc4EztG0W3t+ZVOlrBgdVsa
	aQJSQyc7WDbi9W+gNExkDHYSuMXVJR04E/T7sI8vyXcORopQWlUfNEojmFY1xlGbWwrBtiVHIBl
	83StOOcqfUdWtSzKz0+nGLkrej1wlqCE=
X-Received: by 2002:a05:651c:1509:b0:3a3:7682:49a1 with SMTP id
 38308e7fff4ca-3a7791fd5c0mr9557141fa.22.1790801923611; Wed, 30 Sep 2026
 13:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-7-will@kernel.org>
In-Reply-To: <20260918161407.2300-7-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:58:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkg14Hh4UNaQ+YiDr8-YOMp4ZvJekmpbh+vuhvgJ3heDQ@mail.gmail.com>
X-Gm-Features: AclHuK98rPoIJqzJs5n2eB6XOsyKo5-x6dITjL61dug9hHhjlZw3JiSQOV2iY_4
Message-ID: <CAD++jLkg14Hh4UNaQ+YiDr8-YOMp4ZvJekmpbh+vuhvgJ3heDQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of SP_EL0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> in the return-to-user path, we can otherwise use it to hold 'current'
> and update the various accessors accordingly.
>
> Move 'current' from SP_EL0 to TPIDRRO_EL0.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I just intuitively like this change, if for nothing else then for the
fact that SP_EL0 "stack pointer" was a bad register to use for
this and something named "thread/process ID register" (something)
is a more natural name for something that gets to contain
current.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

