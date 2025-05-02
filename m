Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07E6C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Emot1Htzetmhc9hYsA7C5Lev8H41HDZmzIfFRACzMi8=; b=fc1bezIdXGZBMKhyQgO2udtGsT
	cJe+YkUKRZSN8gau2XVsqeykLNjn5b/f8qnQPSKLlT9fCOqrSSSw8xqgbM2K8KO6AO125Z+rgSzc3
	okP3pJyk2idFcyOLKRhrouyZYmceAiYDZrFVAsR7yAq3CYOfPL0sg1na6Rr73yPSEt6nfazDaOnPd
	6YDM5x8qjBsRzHbNblEMmnNTstAn3gJF3Jd7nSZcCIc6QCQKdjvyJi7YNb+EbMil4efmqr1COaJdi
	nQLtr/aZb4PeqedUQIczDBm1UmTiiGIGcXndOkzZF59do0MBIOJkt8VoAab9kClp86xQy4B922AXQ
	/aKyUZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAv6S-00000002lZR-2OTj;
	Fri, 02 May 2025 18:27:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAv4U-00000002lQj-3fAi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:25:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2263428c8baso14195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746210314; x=1746815114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emot1Htzetmhc9hYsA7C5Lev8H41HDZmzIfFRACzMi8=;
        b=gE+9OOx5hbUMP0YYa0EU3AgFanmxwv3Sh4nev5/YtmqAV+vhdl+u4dxzmLKzIgoSQa
         3fP/FpXfYIvmoiEze0vpNZo39PtOF+cajvu5bU7Gok7urD524kK5FMS3PeW1+Im+cs6e
         M97nbca8iZzVzyTLHEwl8t772OU1yOU42JZP/zWg9ZKxoZEDmh62ZCbNhpdkNGWBlFq6
         EnAXibQqdh6QluWGcsH85YwGK3nbXIhtnWwGKOxl8Gx06dFa1Njb7xtrAwdX6HbqMfdE
         pVy+7ybjV/gHdvtpOB8QMZu5WH1qmyRkKSMjhzwBIafoRqMmGgu2qs4bXCvbokztAj1Z
         bVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746210314; x=1746815114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emot1Htzetmhc9hYsA7C5Lev8H41HDZmzIfFRACzMi8=;
        b=ZSYNF83Gvi6SjwvTLpKM3ZyOng9dQUxDl64X9u5MytGApLe6Q7B9wLF/ROTcNNtxdu
         eAkoFfNbjuhdjWU8yz1IM+mH/hDeOFtRAzkiqL4NeD3gJ+B5UL3xJWHU7q8hf6PYHFEP
         YiYzwNytIUUawhn3XO3XA9BzfR31eHqOik7jYJeW6XleYMLPMVyxI3vPdCFYnR2qAYxH
         keTjGGkFDKUxehVxKuhGzYdX/rqpUtfvLUOHLmd2es+BbqXInWQrWrdfow0OtM/TKTNM
         wUHx6XKflLO41+Bd3FNAXz2ML4iilXFTtnLG8hInN8sIU+0vYT0fV37unPEZTcaa+Kb9
         E73w==
X-Forwarded-Encrypted: i=1; AJvYcCUAutViLj0JnKKUQMdcF7w4RxJcdNHpykwQp0ijiIw9+e4g/ro55IS+80vkLhYmUfoL2LH/Xkl7T0dzLj6LpTbA@lists.infradead.org
X-Gm-Message-State: AOJu0YxR58IqexWs+f6+QrvMSdSzCyed8wUBl4Czr/s3TKFPGgaTagys
	wD3CJO3mZEX3p6qRBKyHnUAQW40rOqYVzIpnWY/h7vDxEPnf25q1Wo86kIeQ+MVc8YKDTXAOmdv
	0ukT2TcAbz4li9REGbwCYe1t4LDuRM10ncHsl
X-Gm-Gg: ASbGncu/Ci2tSYHbWlnesdMKnqGSvmq/ZHa5plUpg8FUk8hgZjfCJz9JlO5/dcZl/aT
	OoIgYO2jRwGgirB9mUO+am/2qtEpgkyx2+tkHYf4fQNbYjOtjeynOvwRpj8iBO9bNQ4TZ3Y5PcI
	FWvDr38NnP+hSf2vBkbhwpEm0L1CW5ZJOQ/zv8d0ZJBO0K/j/bPNCv
X-Google-Smtp-Source: AGHT+IEnS0W1NZg6BUaKBaLsmGLWSW5k5kMx7vCqjZJE1BvXZ91WD0nASnnl5YMQZHiCSuFVgwr9C6f8WFlXw0DbnC4=
X-Received: by 2002:a17:903:1b68:b0:223:ff93:322f with SMTP id
 d9443c01a7336-22e18a3edc1mr240885ad.2.1746210313713; Fri, 02 May 2025
 11:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250410074721.947380-1-yeoreum.yun@arm.com> <20250410074721.947380-3-yeoreum.yun@arm.com>
 <aBT8BWqoljvcAU_w@arm.com>
In-Reply-To: <aBT8BWqoljvcAU_w@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 2 May 2025 11:25:01 -0700
X-Gm-Features: ATxdqUEsIDCdc1MXwbGpU0vqEfxYt1UlHJ7H90sjFz9gZvQP6g4z1_zIOkLmOYo
Message-ID: <CAMn1gO4Ft2R+_CN+XdTsO0YpUQZN7zShMSg-XT90U698Rnifjw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64/mm/fault: use original FAR_EL1 value when
 ARM64_MTE_FAR is supported
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, broonie@kernel.org, 
	anshuman.khandual@arm.com, joey.gouly@arm.com, yury.khrustalev@arm.com, 
	maz@kernel.org, oliver.upton@linux.dev, frederic@kernel.org, 
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com, 
	mark.rutland@arm.com, huangxiaojia2@huawei.com, akpm@linux-foundation.org, 
	surenb@google.com, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_112514_917321_1920E5F3 
X-CRM114-Status: GOOD (  29.46  )
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

On Fri, May 2, 2025 at 10:08=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> + Peter Collingbourne as he added the SA_EXPOSE_TAGBITS flag.
>
> On Thu, Apr 10, 2025 at 08:47:20AM +0100, Yeoreum Yun wrote:
> > Use the original FAR_EL1 value when an MTE tag check fault occurs,
> > if ARM64_MTE_FAR is supported.
> > This allows reports to include not only the logical tag (memory tag)
> > but also the address tag information.
> >
> > Applications that require this information should install a signal hand=
ler with
> > the SA_EXPOSE_TAGBITS flag.
> > While this introduces a minor ABI change,
> > most applications do not set this flag and therefore will not be affect=
ed.
>
> It is indeed a minor ABI in that a tag check fault resulting in a
> signal will report the bits 63:60 as well, not just 59:56 of the address
> (if the signal handler was registered with SA_EXPOSE_TAGBITS).
>
> I don't think user-space would notice but asking Peter.

On Android we don't set bits 63:60 on heap addresses when MTE is
enabled (and userspace programs aren't allowed to modify them in
addresses they get back from the heap allocator either) so the fault
handler should continue to see them as 0. Of course, a userspace
program could be breaking the rules and setting those bits anyway, but
in that case it looks like the only consequence would be that the
error reports from the heap allocator would sometimes be missing some
information (and this could already happen if the access results in a
non-MTE fault) which I think is acceptable.

Peter

>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/mm/fault.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index ec0a337891dd..f21d972f99b1 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, u=
nsigned long esr,
> >       /*
> >        * The architecture specifies that bits 63:60 of FAR_EL1 are UNKN=
OWN
> >        * for tag check faults. Set them to corresponding bits in the un=
tagged
> > -      * address.
> > +      * address if ARM64_MTE_FAR isn't supported.
> > +      * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
> >        */
> > -     far =3D (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_M=
ASK);
> > +     if (!cpus_have_cap(ARM64_MTE_FAR))
> > +             far =3D (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & M=
TE_TAG_MASK);
> > +
> >       do_bad_area(far, esr, regs);
> >       return 0;
> >  }
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

