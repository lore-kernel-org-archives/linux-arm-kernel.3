Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED24C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mda3/lxuFBmPENdZVts/4V3Xa5gfiA3vEnncLDtHU0U=; b=NIeNSW8Cl6BVpf
	qsnmTNJTZJtwUkLH7w4ZR/ultxjIpnIlm9vX0Xn2gEK8M8E6VGlrVZ23N2lg2nPoqbJzlo8vLO4lf
	Bd0URaF7CuXJnm5Q8ja1M2YLuQvnjwmUUPeJtXWW91qznK7vs5pIUHaao8BLw43HroH25p8Bjnanz
	fIP0PYkb0JCek2n+rQEz2SoCaJ1LrivEmJCuuP/ZCDzwnAAFpw5GAt3SURPhLJORmnxMNloh0IMNo
	VJUKcZILwzR0ByS9YJ+48lX/kHfhXyza/AxqiwPUvLd+MdCM5gaQOY6xccwMEEsEq3AiV3X8lQuEl
	sHI0apYpeKVal/lG3PxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm66a-00000008ryr-3Zsk;
	Tue, 21 Jul 2026 08:45:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm66Z-00000008ryd-1AkG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:45:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E09E60AA7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4B91F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623534;
	bh=mda3/lxuFBmPENdZVts/4V3Xa5gfiA3vEnncLDtHU0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H8xOtLEBeHw3D1Mgo66uUN9jrIvmZoVrTyRkEQWKZAN3qUCvcP/QbUx0yA74H1hS2
	 eVKtvEz9rsTjo73YA70F3ZVLjsMgQOn/g4FCGg8TlSnbfx1U/W7ia8ycZV6kLIICrC
	 lVTx00//c+91oD+xNXWtzkymz8Av9vkrjM6w/XKDa5QAh1mUfl1CGYMcRhPR0Pp7pZ
	 3B6aVbbesGKmWyaH78to8ih9vBn1GneqU98QH6zWLMIp6E+iKtdCyz6lhQix8OrIEs
	 J5AEZ5bW1o1OxNkeFZQKJRuTkGoxDRaWOZzbZ9DCoVOBmafKp+9hBZMrJSuDDzZRNr
	 BGk0y3dNcn/Jw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so840033e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RolB7xG8ke2YrQ91Fi/P6lDPlffwjyRb2rdX1ts5T+A/TcSK5IoZp0Zhmaf7AN45AOhhtzunBIC3/vN0f848KWm@lists.infradead.org
X-Gm-Message-State: AOJu0YymkbT5z8y8JbQD9HlLzG1e2kztB3jbxpu4DQY9EfUQ3w75bwDu
	wSiftZzdMbAi/7oP7aRAKDmIWgETFw9RJK/fQVIRdnN5n3NJaNxeJaM4FQ5grEUBqNnU9IkCf7l
	6vSMkVDHF7RbMUrUKCncKe0R29aMLFmk=
X-Received: by 2002:a05:6512:39c7:b0:5b2:a328:cdd5 with SMTP id
 2adb3069b0e04-5b2a328cef0mr1147687e87.49.1784623532800; Tue, 21 Jul 2026
 01:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-7-ruanjinjie@huawei.com> <CAD++jLmHw3ccWQj-AWvgrj7z6iwPk=MC0-UMaUqLeNpsbxW54g@mail.gmail.com>
In-Reply-To: <CAD++jLmHw3ccWQj-AWvgrj7z6iwPk=MC0-UMaUqLeNpsbxW54g@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:45:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLnEWP_Pf7VN86Hzb2MYTPJdisy3cET8vAf1AxBwh7sdyw@mail.gmail.com>
X-Gm-Features: AUfX_mxAPadijNGOw3KjbcQm4dql7ZsTZweXiQL_6HWNJOpSmXm_9tY3eS5UFxg
Message-ID: <CAD++jLnEWP_Pf7VN86Hzb2MYTPJdisy3cET8vAf1AxBwh7sdyw@mail.gmail.com>
Subject: Re: [PATCH v17 06/15] arm64: syscall: Rework the syscall exit path in el0_svc_common()
To: Jinjie Ruan <ruanjinjie@huawei.com>
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 10:43=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Tue, Jul 21, 2026 at 10:19=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.c=
om> wrote:
>
>
> > In preparation for moving arm64 over to the generic entry,
> > invert the nested conditional flags check within el0_svc_common().
> >
> > No functional changes.
> (...)
> >         if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ))=
 {
> >                 flags =3D read_thread_flags();
> > -               if (!has_syscall_work(flags) && !(flags & _TIF_SINGLEST=
EP))
> > -                       return;
> > +               if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
> > +                       syscall_trace_exit(regs);
> > +               return;
>
> What about just:
>
> if (...)
>   goto trace_exit;
>
> This is easier to follow IMO.
>
> With that:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Aha I see you refactor it again in patch 8, no big deal then.
This is fine, add the Reviewed-by.

Yours,
Linus Walleij

