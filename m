Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9080C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=; b=Ypg2lXMASjZaXVJeaosG3MO19/
	r1wmaUq9yoZWcx6UCVR/6iKRvwEgYhUzjdpI8N0jqVVAt881/udYtY/BS6rLEFAV5SBx2qqPt66V9
	AKw5a9CinO7YHlnCajCvBJ5bFRAYpSt7PyvRcuLBHFtrKPCRWmyS29Tx9vI9LVMJ1pz95z8MRs2wY
	HiCVie5dQMHUvhYAHpbBB475PEjL7LWy2WH5+7L+XJUco5HIIMvNPfcD1jzVqfhbkL1nH1O51o70u
	7p4RlLqT9y3f5tQuOynUpTeFEV3tF7ZhgoLrZa+DeofZHKy11wBlGmzOIfkf4e8IBCDSg3p99+wgd
	Cc0MH+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGS-0000000EhLL-3EMw;
	Wed, 02 Sep 2026 12:40:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGP-0000000EhKr-3xNE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:40:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so120421066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 05:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788352824; cv=none;
        d=google.com; s=arc-20260327;
        b=PpMRi8iHjlWLpGKU2LZfaOlYFzA/l5jBDjwevupR4O7lCq2DqHC0s1fnCzjhJXYN5f
         gz+4bl0wKIXbCKZfWSBt/4dEcHCCjGUmL6IknV81zx2lGDH3RlduB1X5a3Kj/EaaScO8
         +1vw2PQlbI8BEeK01SRGAQ/xmGhlBfupJ50EpSf0TfBqN47xBjiLG+ah2cp5h64ROEuI
         SxRUmaRHqX8XBXNMYk+bhLbkZUxtB/Y8HCwf7JrsY8jQkilnipKZwLiJhb3kkrJx0SkU
         7+FwKYpdinp4tVXY652v3qNnFu3h935ytGI5F/lKngN8KR29mgE2Vo9lPPAG6b3lrTLB
         b1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        fh=n3NYPYmGzB1sU1KylcVe6s+6oe5zCR/PFHKGWkNbZfk=;
        b=piHIkc9L1zJMAd3zCB5gNwkeZvBsHWZKaiWeuQ8seyQAqeO2RDXSw7ATH40YuisVZQ
         A/loj4O2thvWKXbE0uLGXvha42T9kFPCoG7STeoZhT9DCV/PBveD2NQaLzucNYOdZdYq
         bw61G3bmFxxTRnV7Oe9dxMjNrcUF03J5cK0YnCYHkDRZqLX1DTfR6fr25l/grj1AXRZb
         0B8Uoao8fLPoorKyLtcOx7nKYRazQrjfu+t9O1I+tPJwGD2aRUi6Nqn+LoUfWXtTDVbD
         O6jUfluwtDmH63FeN4Nj1msEasjYGV9Pc/zt7UMD4oFbT31zLkAQ26ijIFOuzcMZCp1y
         dJhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788352824; x=1788957624; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        b=zebQvg3Na/+7+muN+HNJa6iE/QesVMa+Qf6IQdpvCKhviX5MKsGcRkheDUjRn1AJgD
         L+4sQbEwgRSe3ODxGu0ErMq1ztTELjyhwUswRc2hHbYb7jf4rRTg4UjP+vTNgH27wGsO
         9FLHnRBDs+vwYQ5LEmocby3dkxf0f2S36CjyVkwiX8VDZ0Uvmig1tor0eSlcghYryLSG
         882G92CY+SFZOr7EduJ9s00hTM0u3S3Fgc0WYxyfyMjUPUKE0uqchiYsjpocUQz3i7UG
         JrQJ2tiLBqITDKXs2tKqH5w9HZbyi9K7qvlcYe0Z117OK/mYmkF5L8rNTugUccFGRkBL
         1Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352824; x=1788957624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        b=XEj/E6JBmmQwqlaUNCTqe2PWA61ECwkXqwmvjsH6Y7RQxlYdbo1PdtLNHQEhiyVqTf
         EMTqwj2Sk6KLccnBaWFyzEO7r+Uv1sOko251YGYcQjMYfyGdmi6Iy+od69dG0KT4aaiG
         EUUmSjiegVk9CSlgnUHwSwJ27XE2Ha72ylWUz1xu5zF6rTd9D9eBqGQQC/PQadNzyeFP
         LQetgnlIYc/fFoCRBnXazCq8Kl4nfXhN/T9KnRTsuAGBdaHoBUq2qej/e0ZpvajiA/QY
         KClVDqLf4QFbncZfWqxsZ3TCxTzAjRq4Ki4GdGufyf2orgPaQ+Ms5XMpmviPCcBBfCJg
         VRJA==
X-Forwarded-Encrypted: i=1; AKwUvByzkKCfFxCkHNdhb/JD5fT0GyDkGs109JTLiu/aHh31aLYxptllgQ66tEjIwh5K9M+oI1eRty6/7P3HIB5mG16h@lists.infradead.org
X-Gm-Message-State: AFuF++l6BwgV7omnGMmaolaQLo6mNm9XEQ28DNlDOagel2sFPKOgZbnA
	V2igXMMIUK/XWhzHR4fD5mWHzMNUy28C0OLfds7eZNE833lvAoPSxMapDXBmsngxYL1dURmx8I+
	EQs7bK2H7Nr25I4fop6iqnfPT+tKojC9uPhEHwxo9yQ==
X-Gm-Gg: AYBFou2m6Jzm6J0vtXRnWF7DiuUgrvZk1MAoWPk/qSgoApcb1BxKFw+9aFvxtYECjQU
	CDxUqC5F1P1zIup5ul+GFY02jGtB/bQUejVHTLqU3WTrq4vxlhmsfHAURwc64eGQ0fqHx5PhjcI
	dDzhtONokWk1Kq4OBcRp8duTRPm0IsYVodF2GywmX0XoSZjNbDJy7c58SAlSR08mR/W8XTyJwt3
	wIp9dZguXakNdHRWt9gNaHwHzUbZ6T5YlPSU8l4umMZy1edBquqYlBDGexl0x11PsJPA/NUCN+C
	cYbgpRubhEYBae6rRr+DsLDW0shcfB6Ol40KI5ex9A/skUKedAq0rN9ypF6MIFsXuEjFW8FPiS3
	A
X-Received: by 2002:a17:906:6a05:b0:c16:6a42:c7d6 with SMTP id
 a640c23a62f3a-c25d52b8474mr330582766b.9.1788352823968; Wed, 02 Sep 2026
 05:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
 <87ecfc81e9.fsf@bootlin.com> <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
 <87y0dk6jpn.fsf@bootlin.com>
In-Reply-To: <87y0dk6jpn.fsf@bootlin.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 16:40:16 +0400
X-Gm-Features: AcwNN1VSY-7_RTZXfxYPRP1gcisezSlmJy8fnVW71SAjcha9KevXuu7BcSLrowE
Message-ID: <CAKTNdwF_wY8JSoQs=auK_9YNGT+hwQ=dAhcRVsf1E1CVvFs-XA@mail.gmail.com>
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_054026_023075_C9F06E80 
X-CRM114-Status: GOOD (  26.08  )
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

On Wed, Sep 2, 2026 at 2:17=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 02/09/2026 at 13:24:00 +04, Alexey Charkov <alchark@flipper.net> wrote=
:
>
> > On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> >>
> >> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wr=
ote:
> >>
> >> > The OTP controller is driven through a single set of registers holdi=
ng a
> >> > state machine which has to be stepped through for every word read, y=
et
> >> > nothing keeps two readers out of each other's way. Concurrent reads
> >> > interleave, and the outcome is either a reader bailing out:
> >> >
> >> >   rockchip-otp 2a580000.otp: timeout during read setup
> >> >
> >> > or, worse, one of them silently taking delivery of the other's data.
> >> >
> >> > Reading two cells in parallel from userspace on RK3576 reproduces bo=
th
> >> > within 150 iterations - 53 read errors and 9 corrupted results, the =
latter
> >> > either losing their first word or, in one case, ending in the two by=
tes
> >> > which belong to the other reader's cell - whereas the same reads iss=
ued
> >> > sequentially never fail. Concurrency is not hypothetical here, as si=
x
> >> > thermal sensors source their trim values from the OTP and reach the =
driver
> >> > straight from asynchronous driver probing.
> >> >
> >> > Guard the read path with a mutex. Reads are the only way into the ha=
rdware,
> >> > as the driver registers no write callback, and they always run in pr=
ocess
> >> > context, so a plain mutex spanning the whole clock-enable, read,
> >> > clock-disable sequence is enough.
> >> >
> >> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>
> >> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > Thanks for your review Miquel!
> >
> > Sashiko complained about mixing a scope-based guard into a function
> > with goto-based error handling, so I am replacing the guard(mutex)
> > with explicit lock and unlock calls for v2. There won't be any
> > semantic change though, so if you don't mind I'd like to carry your
> > tag into the v2 version.
>
> Of course.

Thank you!

> I haven't seen Sashiko's answer but isn't the goal of guards to just be
> released whatever the actual return path?

I believe it's based on the guidance in [1]. In this particular case,
gotos don't jump outside the scope where I put the guard, so the
scope-based guard is still correct. However, stylistically, it is
indeed uncommon to see scope-based guards in functions using gotos.
Explicit lock/unlock is easy in this case, anyway.

[1] https://elixir.bootlin.com/linux/v7.2.2/source/include/linux/cleanup.h#=
L148-L153

Best regards,
Alexey

