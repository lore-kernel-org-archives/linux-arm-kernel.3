Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D651C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+UqBvaR81xAW+Yhur+fD3JqxwLyDew4ZK5ittw4x98=; b=M9VVdPnhH/P9xUF6rAU1i5Ai7p
	zcxc2gP7IA1i9ZybOJDHKnEuEMKqinoB2c+Ev0HVt34HRnB9WK3z6+yIxVe9uql5bUAQfsr4CmO0R
	0m7jJr5KpjWL+ysFgax3/z5bN6eb21MaDdYatkFaP5Bb3zR84QF67qz07lizVoRbKhllv1PUfrSWa
	8cLIkE5RMI1PYLItY3DpMIjJaOF10aiyxkiMFigfKnl5u1F/nfabvuu/ozlKKTSBAgg0tkFA5FSZD
	pmKliw8g3icSWEpNcBeFwJkLwXk9WKiCxPGav++I278zkUZMSpHe6OXWytx5cDNtnSROQ2+C2sJqJ
	8yam/l2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiawf-0000000BUr9-3RcZ;
	Thu, 13 Feb 2025 15:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiatq-0000000BUOb-0rLd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 15:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J+UqBvaR81xAW+Yhur+fD3JqxwLyDew4ZK5ittw4x98=; b=SqVxBWrwXy9auRROBW8REZJpgb
	66ctsjlTTXpuHRzSQ0XC4JJV5O3ReWmZTiQrMkIyNrIzSDD4YrML5QtVhyKMQpFG55wN6KEIVw5bt
	d5sPToS2gNcm31dixcdI0q/KPXFs50o/5y8vnApUojJUr/7zcCldkatxfcOBoWKfB1am2GdusIs55
	6XJ2W0hv5d53EiwjjeF8qwEw1NUth/1q1ehxGeDrYAKj4tv+n2hj/hMXn7V+C6gwf+bA3tUWYFgeb
	sKwidqm2KWRdxkkP/WPSdSSZRpO/0jY2j0xY+P+11lldr/iumj2OhjhPYjZEfRESai+2BhNvutSnp
	ONwvkilg==;
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiatm-0000000128x-472u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:13:08 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e5b29779d74so904290276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739459583; x=1740064383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+UqBvaR81xAW+Yhur+fD3JqxwLyDew4ZK5ittw4x98=;
        b=g2edWeNFpFiPxqD1M3TxTvMDLox9Uo8pgq/ZAQDEna8QQasLYlvilC08tLz9DC2idg
         mrL8CpfEZ0zo04dBum1y+J9vgkBkEYyCu6b/E9c4iej7dAB2JQ2/RhQXHRIDF7cCjHSe
         X4dZwKvudSSHKoQgDAidj7tJXgC9sf58RvW3Iz6kRfae+kO68lyD16Da5ZcnIyssGdEU
         nevC4a7JUm/9gBa+acNsobY2clEqYOClf92j4CTvFSRFfc7wXnuNRicvLGbYykPlOlax
         Y/O5DmhoeKZ7d1BpzxszKfEsmyJdiFgeRlGm12RnFKj79QTOOyGQ7vP9q6xYB73CtIa/
         6VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459583; x=1740064383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+UqBvaR81xAW+Yhur+fD3JqxwLyDew4ZK5ittw4x98=;
        b=kC6oKUo/QLlnXpDFNdMj/9B8ecfOBGidgrvqL0NIcpo6p8d8JAqUh0PFkeQvUkg0Mk
         lvdZ9TY8JKDSW9chJcqRw/bTuxgMcUD4SAklTksw418N3uIR5tzhZ9UaSB8xCew0CyY3
         Zcsxy6fdLfnv/dZByLmgR1jinXTmPJIMzssRkO6RqW6RxZy1YCcQO8ppJ3F3PwA93Q+Y
         DDVT51o1ggqUkm6VaYGA/Tgt2akATRVs3J7H25KBxYpbO6rdsOu82lBHi9xYP9017faX
         P3E1rDvE1usX1chg0GtmKz+s8uz+CihSBJgGs7C2nFAlvIxsSxOC/RR1vthcej0n4+YK
         USzA==
X-Forwarded-Encrypted: i=1; AJvYcCVPdgBjLEMsDc+LY1CTq7nLRlCY260jIfFjasOjqzH33aqhIN93bUYeSDaoLaWdxKgRLyp0+aQy/jspk9K5lN+G@lists.infradead.org
X-Gm-Message-State: AOJu0YzeO1Mqp5olhLW9p85fAHisqMfUDHJJ1e6Xv+nISjauU7CfuzR7
	trHbXxq0OszmEIZwGSTRSxefvNLVXTSVzDuGpxj1G2deLFU+4INrPQnvXeifOKxZF59o1graLVr
	xLRbl3zvEjr4GAGpfPhBHn/Y3vkk=
X-Gm-Gg: ASbGnctzOlSk7gz9mq8XSv6LzO450Mc2Khqwc8oAmbbyqbSjPW7+M6S5G/Ojs7ZuH+t
	jVI33X1U5S3PC0XgcNDXfGMf0y4dOFFN4/lmy9kej9laf6VbKaQjiRBdJxuNPgq7FsNo1rKXicQ
	==
X-Google-Smtp-Source: AGHT+IF5hBCoP4Zie8IlrY0QFEqPLwp9JZSFE9LUSCL5GsS/DSPtxQHgXpyDUSTfwvH7z1LyEPIm9JT/vGqEJ4uA2qk=
X-Received: by 2002:a05:6902:1003:b0:e57:8814:1399 with SMTP id
 3f1490d57ef6-e5d9f185e88mr7417122276.44.1739459583330; Thu, 13 Feb 2025
 07:13:03 -0800 (PST)
MIME-Version: 1.0
References: <CAN5X4L9L2ught_h4M3_oe_aTMALki6nJPh9M-3KmdDx6WswffQ@mail.gmail.com>
 <20250213121738.GA11596@willie-the-truck>
In-Reply-To: <20250213121738.GA11596@willie-the-truck>
From: Junlong li <zhuizhuhaomeng@gmail.com>
Date: Thu, 13 Feb 2025 23:12:51 +0800
X-Gm-Features: AWEUYZkVQ8XXTZq7KUdyZjKf03H4u57h2cLDnVw5ubIGkarMWzwQlBbVcYmy4ks
Message-ID: <CAN5X4L_p-h+8mb7dvhJEuT04GjfXKt6MMGUU2ah9=ZnQCVomqQ@mail.gmail.com>
Subject: Re: [PATCH] ptrace: Fix error handling in ptrace_hbp_get_initialised_bp
To: Will Deacon <will@kernel.org>
Cc: oleg@redhat.com, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_151307_134810_F3EE83A5 
X-CRM114-Status: GOOD (  31.81  )
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

Thank you for your detailed explanation.
I misunderstood the meaning of the return value of the function
ptrace_hbp_get_event.


On Thu, Feb 13, 2025 at 8:17=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Feb 12, 2025 at 07:35:46PM +0800, Junlong li wrote:
> >    From b824aece318ed38666621610af7807e70831f964 Mon Sep 17 00:00:00 20=
01
> >    From: lijunlong <[1]lijunlong@openresty.com>
> >    Date: Wed, 12 Feb 2025 19:15:46 +0800
> >    Subject: [PATCH] ptrace: Fix error handling in
> >    ptrace_hbp_get_initialised_bp
> >
> >    The function ptrace_hbp_get_event() returns ERR_PTR(-EINVAL) on erro=
r,
> >    but ptrace_hbp_get_initialised_bp() was checking for NULL instead of
> >    using IS_ERR(). This could lead to incorrect error handling and
> >    potential issues when trying to create a new breakpoint event.
>
> Can you please give an example of how this goes wrong?
>
> >    Change the condition from:
> >        if (!bp)
> >    to:
> >        if (IS_ERR(bp))
> >
> >    This ensures proper error checking and maintains consistency with
> >    the error handling mechanism used by ptrace_hbp_get_event().
> >
> >    Signed-off-by: lijunlong [2]zhuizhuhaomeng@gmail.com
> >    ---
> >     arch/arm64/kernel/ptrace.c | 2 +-
> >     1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >    diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> >    index 0d022599eb61..3bf549b540b1 100644
> >    --- a/arch/arm64/kernel/ptrace.c
> >    +++ b/arch/arm64/kernel/ptrace.c
> >    @@ -414,7 +414,7 @@ static struct perf_event
> >    *ptrace_hbp_get_initialised_bp(unsigned int note_type,
> >     {
> >            struct perf_event *bp =3D ptrace_hbp_get_event(note_type, ts=
k, idx);
> >
> >    -       if (!bp)
> >    +       if (IS_ERR(bp))
> >                    bp =3D ptrace_hbp_create(note_type, tsk, idx);
>
> I think this change actually causes a problem.
>
> In the current code, ptrace_hbp_get_event() can return:
>
>  - An error if the note type is unknown or the index is out-of-bounds
>  - NULL if the relevant breakpoint has not yet been created
>  - The breakpoint pointer if it exists
>
> So, in the case of getting NULL back, we lazily create the breakpoint.
>
> Is it pretty? Hell no! But I'm not entirely sure it's broken, either.
>
> Will



--=20
-

