Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A57F327C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgazJEZkLR2RR9P85vOggdwYHn9m50r4QYxa1yojzwc=; b=yb1TgJNA5GXIHbCE31Efji0Zwg
	c7A0pVpxhHXto5VxZUMH9+yHqF5Kx7PefQ7QsJeiY7CDxSqC6mCmod3rJShutk+SfS42MJPHJcGAm
	18Giw+KJZF1xCgcEJL+TA3np1AivzUa6XwUqosF+T+DYpRgr8vA6/dzwiFwAgu3pRLWw2i80RQKHB
	Lkhu60Untdwr5ed0qXgSkyB92P4bHNbQUABfFQvsiG43rLeGuRfeyEMJH4CFZOZGJ2V/yhI5PFQMC
	F2CXIY2KRi2zxw0Iw7CKlYM0EOC8EEbCf197rvkt+XAEKdRHMZI1vd8a7VjpSOFkfxv6KD38veFxH
	sUzwqbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6t8-00000008Hot-0x0v;
	Tue, 21 Apr 2026 08:55:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6t5-00000008HoP-27z5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A21A43A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E69C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776761718;
	bh=OgazJEZkLR2RR9P85vOggdwYHn9m50r4QYxa1yojzwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sPfJ4v5rQk7NRhtmFLUhYk8breUxXMZpHPtI5sd8Dy6bMIF5AryTNZ9QGpmj0DkKN
	 OBP75rR20KdNooG14b9wBbMFp4ob+tGKnfgi3VhO/A+YWnPxyzrVUqKWGfGjPUaT5h
	 1Z1/9DgnFYobHKA1d8RpKv9bzidk1+oXnsn8CeNXqVE6A3Tu/D3lIMrcPECMEd43Bu
	 oQ86Ll+i1mlwhZTUeKZivdOZ7rmy4flkxzhjn6X8vhNYJi9BX9eCnQODg7YatNyfxN
	 DNm6mj5PN6smXuPIOCNgKvIeMwCx8oi4Y0AaTNHGYPqnm1HsgbmoyyFthul5djlYv2
	 FQFPwXlMPD3uw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so3953301e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 01:55:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YyioTJ+pGVO6xfYUXDv5OR8tlIcYuy0OOIWZgWkiuPO+8XTmrkJ
	Y+6QLz6U6I6f+OBPDiEY8tYchs7JETquwC6H59mI3ZAC6uHy7GqsnPPVeQ4F1ABaW+ZbgbBMoEh
	v0embswOyr4/xcYapWBw+RElFMNHkiFM=
X-Received: by 2002:a05:6512:12c2:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a4172daaf5mr5889705e87.20.1776761716801; Tue, 21 Apr 2026
 01:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
 <20260414211215.152850-7-stefandoesinger@gmail.com> <CAD++jLkkV0h5R5=2sWNcPCV8h9vJHXCRsuaFxS7_bBZH0nZKUg@mail.gmail.com>
 <5075672.GXAFRqVoOG@strix>
In-Reply-To: <5075672.GXAFRqVoOG@strix>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Apr 2026 10:55:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkADFH9Hyd0Pmmmk4zq7rJ8V4v8uDubYSBG2Lc+=puVGg@mail.gmail.com>
X-Gm-Features: AQROBzCVfPMAPFgHC0n5jXdXztUHh0mOSSwnLWhq790t-P4kYF5aLkWWcpToUcM
Message-ID: <CAD++jLkADFH9Hyd0Pmmmk4zq7rJ8V4v8uDubYSBG2Lc+=puVGg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] ARM: zte: Bring back zx29 UART support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_015519_566576_F5902917 
X-CRM114-Status: GOOD (  16.69  )
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

On Mon, Apr 20, 2026 at 11:22=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> > Interesting with the AMBA pseudo-ID, but I kind of like the idea.
>
> It wasn't my idea. That's - as the description says - the code that was o=
nce
> upstream before it got removed in 89d4f98ae90d. This is also why the
> ZX_UART011_* defines still exist.

Aha!

> I re-checked if the device identifies itself in the mmio area in any way,=
 and
> that I maybe got the size wrong - but that was not the case, everything p=
ast
> the ZX_UART011_* registers is zero until the next device starts.

Yeah it's common that vendors just forget about this and set it all
to zero.

> Another idea I considered is using ZTE's 0x8c (assuming that "Microelectr=
onics
> Institute ZTE" is the same ZTE that made the board), but then I would hav=
e to
> invent a device number, ideally without clashing with an existing ZTE dev=
ice.

I think that's a great idea! At least that is what was supposed to be done,
maybe the ZTE HW engineers will get the message one day.

Yours,
Linus Walleij

