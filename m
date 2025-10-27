Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE24CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01IXpqC7TIZ5mj2iH0pdDn0rPqM6SOZi4vm8wKhQg+A=; b=EazP/STq9m5Gbor5W5+POgGbnv
	UyO1CZ3X3fkjHBGuWbEbqGRV1KgA+wRKrw5ZdAd6TLdIUEMiSgm36Us26HVS0muO2qsNzCCHAzi0G
	ZGruCFek1jfqfYGVmkmJQumSroMZVHX6aImgbmNgJk1HaTmFHm4wYUIof5CpwTq2kdrXWYRz83070
	stTigRwFj6m7Z4qjOHejHyQf97KEVJwKnjkYG4GC2zYQtVOuChjuyvKwoaS/X45eGGO4VimWQy+05
	IOAzWrCk6IoLlEz91NgClAv/tLIrfsYvHkiVluMU2StIobxk5wTKN6ja5bfpP/+YHtMhTseKOsoRq
	tS99PfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUGb-0000000El8c-1N9O;
	Mon, 27 Oct 2025 20:56:37 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUGY-0000000El7q-0hQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:56:35 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4eceef055fbso38256481cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761598592; x=1762203392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01IXpqC7TIZ5mj2iH0pdDn0rPqM6SOZi4vm8wKhQg+A=;
        b=fzj4t2PG7DOqe7PvVu5rp3TSHd4zRmGSdsQBUJDX1PuykHFyaSnLdFMO30r5O2hMxB
         W6RTMbF+NIGWMIBVDAIRQIb3Ms6Cwsw5yrl0vZ4xEl3/ZJHnTuy2VGBqgaM5fJLXGzKf
         HSkOo9oY4JCAWYmNtUJUF1PQoCgP5+M/2lM/dzZ3PlKIKXudL+9fLIzn71TS7EEoMc3R
         z81QAbWcvB52XEDoA1slh8OhDkDnryTlHwhAqic522SnNY3w4n4+4/FcbEnzARweFB45
         lrcZTqQN3HT2bpsgmbg4/BrGcF9ptJGSc2QyHdH6LFULNDDle7d/i5eF7EDNRFyj7Alg
         mfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761598592; x=1762203392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01IXpqC7TIZ5mj2iH0pdDn0rPqM6SOZi4vm8wKhQg+A=;
        b=JQ8gA+nUKJOlF7iLjejkUNM9FeHihS4wygJ8u/COMtZ6GRY12myUi3buXHIyjpGciu
         +/UBzb+PMC4ps7yfWu6ZcXDUZXYcvaOUbpEGvkPlHyihlSO54u3ZuIhavVM9ELUGqbo3
         VHNSkxLElJ9iTxy2pmbFA1N2Pc6FqWj3OzXb0d16qxLyOsx8zlT4PMkgRQFLzGf3kCfu
         6Mo6/rDa2Y0MDc5wYNMw6jnHRfJN1M7/AhrTg9e//d4ynWI6CkQga01GEet1tsZrNgx0
         4oUUSCHR2tYVPXg+N1JMvyAdJJLi1Qd6yRbPyWR339vVHjGj90setCQqCN9x5fhvbqNo
         nIbA==
X-Forwarded-Encrypted: i=1; AJvYcCUy8rvSEG/VHQ4hCsk2NrEszp1jmFyMP6Ig/hbv09b//SkbIxR42/jU74EHzGcZGtuPaAz8SANH8YowhUzk8NbS@lists.infradead.org
X-Gm-Message-State: AOJu0YziPN3uhnA4Jl3LDlyaIg3UBaAIWCKEnqK1mwpFB2va3NUhWzw3
	dhdaaJu14GVIheOLmuhWdArZpmq9PztpqAH2NhYxCT+7N7v+CZXt8iS+bvtkyPeF0l10PAjJgjY
	Di5RxY4nHaGmFCVgrUrWISvLC7CZWAP8=
X-Gm-Gg: ASbGncu0QwrtbHFtXsgpZdm1jldCoTCwz4ycyv0B3I45DCmntI9viYT8DFrmHMIpmX1
	YqNagHMVtlunHfi+zcP1hi1GMWihDWN2x5NLbEeBdV4zWW5oSdzAt4VGgVFWadQtk04LYWNrkIs
	P+ynliDvuYZ71GKRSPw6C4tvEVhlNUDjhUZTVBx29PebmMCwOQSJ6Jj8C/klPr7Cb+Pmyjo+1Jk
	9D9wCvCMoK2Z4krcDEAannsaR80v14i9kq7xcLOQ5yBxuaJ2iogt0/04isVxIQpb0Bmsoa/
X-Google-Smtp-Source: AGHT+IFNepnjW1ln2/qkUxgl+nTX/lKuWDuPuR+uSkSWvw1XDCRuJvbtDz+7gIkX9u2wG4O2TSxknsPpmxchsLm6W7Q=
X-Received: by 2002:a05:622a:56:b0:4eb:72a3:d700 with SMTP id
 d75a77b69052e-4ed07486220mr18468201cf.1.1761598591759; Mon, 27 Oct 2025
 13:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <d583ee43-38c4-40fb-b33b-ce3153c9723b@gmail.com> <20251027200213.1821809-1-dsimic@manjaro.org>
In-Reply-To: <20251027200213.1821809-1-dsimic@manjaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 28 Oct 2025 00:56:20 +0400
X-Gm-Features: AWmQ_bn5rbspTLkQfy8fItkWXbaf0FPuu7U9ED3igS0nELLu-MdDWTDVKU7YnWg
Message-ID: <CABjd4Yzfx-4xBHVB=W_r6nEdbwNJKdpHYB6bN3Xsk8dZOegJWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
To: Dragan Simic <dsimic@manjaro.org>
Cc: sigmaris@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_135634_302645_5377B4A6 
X-CRM114-Status: GOOD (  42.67  )
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

On Tue, Oct 28, 2025 at 12:02=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Hugh and Alexey,
>
> On Mon, Oct 27, 2025 at 7:08=E2=80=AFPM Hugh Cole-Baker <sigmaris@gmail.c=
om> wrote:
> > On 27/10/2025 09:14, Alexey Charkov wrote:
> >
> >> Is there any downside to enabling this unconditionally in the board
> >> .dts?
> >
> > Only that it goes against the principle that the DT should describe the
> > hardware; the board .dts would describe a cooling device that doesn't
> > actually exist on the base board.
>
> Having a separate DT overlay is perfectly fine if we want to
> describe a board absolutely correctly: if the fan actually isn't
> present, the operating system shouldn't be made to think it is
> there, especially if there's no fan RPM feedback, which is the
> case on almost all Rockchip boards that support a fan.
>
> Preventing the kernel from managing a non-existent fan might even
> save some CPU cycles, ending up producing a bit less heat, which
> can only help in passively cooled setups.

Sounds like an overcomplication without real benefit. It's one thing
with overlays for functionality that can be software-incompatible
depending on whether an external attachment is connected or depending
on the type of attachment connected. Here we are looking at a plain
2-pin fan which cannot be software incompatible to anything really
(it's not like one could repurpose the fan connector for anything
meaningful if a fan is not in use, and noone gets hurt if a PWM output
is left running without load).

The CPU cycles spent parsing a slightly larger DTB at boot are likely
comparable to those spent activating a PWM output needlessly upon
hitting the active cooling trip point, and both are negligible for any
practical purpose.

> However, the practice so far has been to describe the fans in the
> main board dts files, if the board provides fan support, regardless
> of the fan being present in a particular board setup or not.
>
> > I guess then in theory, an OS might allow the SoC to reach undesirably =
high
> > temperatures if it's relying on the nonexistent fan to cool it down. Bu=
t I
> > don't think this would be an issue on Linux, at least, in practice.
>
> We're safe, a thermal runaway isn't going to happen when the fan is
> defined in a board DT but actually isn't present.  Thermal CPU and
> GPU throttling will prevent the overheating from happening.
>
> >> Overlays require more user configuration, and not all
> >> bootloaders support them directly (e.g. systemd-boot users would
> >> struggle). Compiling with overlays enabled also makes .dtb's a lot
> >> larger due to added symbols information.
> >
> > Nowadays (on Debian at least) using overlays is pretty easy, I'm using =
the
> > u-boot-menu package in Debian, I just copy the overlay(s) to /boot/dtbo=
/ and
> > it detects them automatically and adds them to extlinux.conf for u-boot=
 to
> > apply.
> >
> > Couldn't systemd-boot users just use rk3588-nanopc-t6-(lts-)with-fan.dt=
b as
> > their single DT to load, if it doesn't support applying overlays and th=
ey
> > want to use the fan addon?

Sure, but it's a manual configuration step, where otherwise the kernel
would just default to the correct dtb for the board that the firmware
told it about. The fan is not discoverable, so the firmware won't ever
offer the "-with-fan" variant, meaning users would need to supply it
manually in every instance.

> Yes, that's an option.  However, that in general doesn't resolve
> the issues arising from systemd-boot users wanting to apply more
> than a single DT overlay.
>
> > FWIW, I haven't noticed any problems with having a larger .dtb (using m=
ainline
> > U-Boot to load it) and several other RK3588 boards are also compiled wi=
th
> > symbols enabled already, and I haven't seen any issues reported with th=
em.
>
> After thinking a bit about it, I'd support the extraction of fan
> definitions into separate DT overlays.  As I wrote above already,
> not managing the non-existent fan might actually help a bit with
> passively cooled board setups, which is a good enough reason for
> me to support separate DT overlays.

Practical benefits sound far fetched here, while forcing users to
manually configure something that would have otherwise just worked.
Let's see what Heiko thinks.

> If we end up agreeing to accept this DT overlay, I'll have some
> comments on the way cooling maps are defined.  I think there's
> quite a bit of redundancy there.

Agree. Thermal governors can figure out the fan speed ramp-up without
specifying each and every temperature threshold manually. Two trips
seem to be enough for everyone (c) - as we've done e.g. on Rock 5B and
others.

Best regards,
Alexey

