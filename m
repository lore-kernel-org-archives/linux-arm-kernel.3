Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B035CF5367
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8ff/XPdu25+KctImXnG4HbCg/aVpT0E7wYLlC7DsHg=; b=WM2FF/rzGgYScFBhhrwRecCvMU
	kFLuyH105dEYJ8o0DNXKYTmrw7aVfyHlBaG1+m+egUECxEYoVKnNV3GtD54YtcU267ZRELqEep7yi
	9SN4jnH4g57a5X7Z8kLYu/wJ7+0/IKAegnWtw3oDSeqEL1cZgue9fN06kX6YY9Eo2u6Z+E13wlx1C
	c2pPZQzMtidnIFL+96jNXL43EGUIlpOKoYs2z+j2Q2QNdlap/b+aAu31TwpUnY+Mgi861iVmF3Vra
	uX7+T7/oCYvB0Zwc5+5v95KkaX7dD2ZAxYGl1RgLRfYwXJpTFyxDZfE9dyNKmLNzDIVPXbAPtlxCI
	JarvUMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLT-0000000EIQE-3EYd;
	Wed, 23 Oct 2024 12:20:11 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a5W-0000000EFxq-0HJt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 12:03:43 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e600add5dcso2571578b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729685020; x=1730289820; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8ff/XPdu25+KctImXnG4HbCg/aVpT0E7wYLlC7DsHg=;
        b=bygVeN7WNZZ08GAriUK/ZYR87uItySawACnbL5ZOrAVfj446CdWa/QtLsljMhV64Ry
         NKLhFYjzb2mf7a0YoSs0LtAcGtHKueNb+XhQwQG1CBf5+UAs5z1l+qRmQdPzsPmzD70L
         wiPgwYs6mGAirsUmEcWUO2g9rxBzKvxNCybYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685020; x=1730289820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8ff/XPdu25+KctImXnG4HbCg/aVpT0E7wYLlC7DsHg=;
        b=PJLmmTOhHQl0hqL+m6gnZqzrif3eX6Y9ad4WA7AaDURxJtytMX1tGmPWQbTiHqkOkp
         3kBuwGa8xbBwtLfJ5DPC6fpWty4vlOL7vw5oko1GrRBqU/x9VKNw71jjRsnf62UG3SHn
         WVx02Gh9X2tdvqqGFY6WklA3G5TZ30Tpn8SeeHUIZiIxXEN1eaWjEeX2CGJ8CbvfFBrV
         pldClBpZpoFyrwbD5eMXXpnLZaaAVPW0rf1RtnYUhaCGgfBbV+gjuqTso1q3+kiJPod4
         5TNXG/GfzcgUh8SBuv1uETkyRY+8Y2KzsZYrk+yTEfsq6H8BrpCo6nHyDhXdIZV/8zBA
         EGtw==
X-Forwarded-Encrypted: i=1; AJvYcCU9pLKfQq58ob4cQaie9rmkQUlhRY97CfHmm46iiDD7GSspNRwa4td0ZcBAxbZLB5Ap23n0vFg+pZDcndY1xcl3@lists.infradead.org
X-Gm-Message-State: AOJu0YxPThG85fngfzUmdc9jB9lOQL18x6IT6mSYKLRbNRmogNHfa/1a
	me+HUmHhpnP1kKISNoK7BiG7bCCjb40whojPKYWyJIPlspmrwmqfSnHE22oTqTfih7ZsW7lym8w
	=
X-Google-Smtp-Source: AGHT+IHEZrWxxCTrZYpWU1+0rU/YDHzR+7vycxqjGpoRoHM00UGlr1u417YHjDCMfdvQS+3ZbqPYbg==
X-Received: by 2002:a05:6808:1b87:b0:3e4:d744:4ed1 with SMTP id 5614622812f47-3e62458f9d6mr2442418b6e.34.1729685020155;
        Wed, 23 Oct 2024 05:03:40 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e610d10207sm1673753b6e.53.2024.10.23.05.03.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 05:03:39 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5f968230bso2554200b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 05:03:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWS+rQ84dCkfVUk6b+yBhY7fZmrtngZoXFunExzwUkJ8X3EyqCi3giI4V1jawL3NaL6xJqBmJ941hx+BIRcoqd@lists.infradead.org
X-Received: by 2002:a05:6808:3190:b0:3e6:256a:31cb with SMTP id
 5614622812f47-3e6256a3200mr2294647b6e.7.1729685018925; Wed, 23 Oct 2024
 05:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241023102059.512352-1-fshao@chromium.org> <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
In-Reply-To: <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 23 Oct 2024 20:03:01 +0800
X-Gmail-Original-Message-ID: <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
Message-ID: <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050342_295163_559E7409 
X-CRM114-Status: GOOD (  28.33  )
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

On Wed, Oct 23, 2024 at 6:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/10/24 12:19, Fei Shao ha scritto:
> > Fix two minor issues in the comments.
> >
> > 1. We balance VSRAM voltage based on the target VGPU voltage, so the
> >     comment likely refers to VGPU.
>
> Function `mediatek_regulator_balance_voltage()` refers, as stated in the =
comment
> located at the top of its signature, to "GPU<->SRAM" voltages relationshi=
ps.
>
> So, we're taking into consideration only two regulators:
>                    VGPU and VSRAM
>
> The first comment says:
> "If we're asked to set a voltage (implicit: to VGPU) less than VSRAM min_=
uV[...]"
>
> ...so, I think that you've misunderstood what the comment says :-)

Let me make sure we're on the same page - VGPU never goes higher than
VSRAM (VGPU <=3D VSRAM), is that correct?

[ min VGPU, max VGPU ] ... spread ... [    min VSRAM  ,  max VSRAM    ]
 (min_uV)  (max_uV)                         (vsram_min_uV) (vsram_max_uV)

The longer comment is
"If we're asked to set a voltage less than VSRAM min_uV, set the
minimum allowed voltage on VSRAM, ..."
So VSRAM is the subject here I think? Because we "set voltage *on*
VSRAM" based on its own minimum allowed voltage? We never set either
VGPU min/max voltage to vsram_min_uV?
And it's attached to the line that decides vsram_target_min_uV, with
the maximum of (1) vsram_min_uV (i.e. minimum allowed VSRAM voltage)
or (2) min_uV + max_spread (min VGPU + spread)

That makes me believe VGPU is the correct candidate.
We manually configure VSRAM first (push the ceiling to higher), and
let the regulator core update VGPU afterwards.

In fact, IIUC, there should be other concerns here... it should be
"vsram_target_min_uV =3D max(vsram_min_uV, **max_uV** +
**min_spread**)", due to the same fact that VGPU <=3D VSRAM.

For max_uV, it's not causing any issues because min_uV =3D=3D max_uV since
there's only one consumer... I can update the code in v2 if you agree
with this.

For min_spread part, the reason is that VSRAM should be somewhat ahead
of VGPU, but not way too far, i.e. VGPU + min_spread <=3D VSRAM <=3D VGPU
+ max_spread.
This is required on MT8183 and MT8186 - the spread should be at
between 0.1V to 0.25V (VGPU + 0.1V <=3D VSRAM <=3D VGPU + 0.25V).
The problem is that we don't have a "regulator-coupled-min-spread"
property, so we use the -max-spread property for minimum spread... and
without considering the real maximum spread.
But this is probably not that terrible also, currently
vsram_target_max_uV never goes too far from VGPU.

>
> > 2. .attach_regulator() returns 0 on success and 1 if the regulator is
> >     not suitable. The context suggests a successful return value (0).
>
> The comment is on top of a "refuse" or "error" case - one that wants to r=
eturn 1
> and not zero.
>
> Besides, it clearly states:
> "The regulator core will keep walking through the list of couplers when a=
ny
>   .attach_regulator() callback returns 1"
>
> ...which is definitely true.

... I'm sorry, I guess I really need a dinner break - my brain
translated "when" as "until" so I read it the opposite way.
You and the original comment are both correct.

And I hope my first point still makes sense and it's not my brain
being lacking energy again...

Regards,
Fei



>
> drivers/regulator/core.c
> function `regulator_find_coupler()`:
>
>         list_for_each_entry_reverse(coupler, &regulator_coupler_list, lis=
t) {
>                 err =3D coupler->attach_regulator(coupler, rdev);
>                 [.....]
>                 if (err < 0)
>                         return ERR_PTR(err);
>
>                 if (err =3D=3D 1)
>                         continue;
>
>                 break;
>         }
>
> Is that clear now?
>
> Cheers,
> Angelo

