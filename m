Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=; b=4utrmOo1c2rX923LeXlXtfvp2W
	qzBJJQTHOwaxNkpqlxxCoSf22OOT8cY3HbwRm5nPZYBFzHS0vAjORk4r8Nvxp7cRuHRkdk6ViL80t
	kU8560kXe2M8uTA9jg+6Y+z2EGCTJHneTg/U9Bj5yC7I6JwhEGLmCAY6nC7u0qh/1f34bF0DVGXn0
	0o2KihNJHe0JlVb7QKFyNpx8SdoRTUhgZkXQld2VVYLjClLzIR6DiW5nXm8KM0H/A8t4K9Kjm9AfA
	tgMrc9Q9qiJqiBDiWno2jTn8svXyF1nZIbyO5coUv/rGLM2GJj+THdVGLYqyu8NIEVG/rQBLIS5X/
	/qgwU1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thczt-00000001oQG-3r5b;
	Mon, 10 Feb 2025 23:15:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thciX-00000001lFB-0GuZ;
	Mon, 10 Feb 2025 22:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=; b=GGkT3WPRYqVKVc/X4zfDnQEQg5
	yYFbxDH+B30D/kJ4J6Urt8Vv08NrgX+MDn+CvOyo3mZXzV4bJoPXRR9QL+S/I3k4Nceemv+AL33+P
	E+XLjycFkjYK2RR51W/+Re/DMyJNRXES9hph9pMZZErrD4e2a4W/IXk8l3fVTHOJ0Rlzkoxc2ya9/
	f+rAInkkY+btCOJFm7CXrJYBRvDdiz1f5+2Pt8No37IRJiBrjxuI14RBCNEXslM2iQ7TMjx2X9QdP
	lJ7OAmQZXKvm+H1Mf51lmmPGgeL+2APg64+aThU0VVxiACOIijB2BtHbpRPcLowwiZxdCVrd/9L8x
	cBUfOM+Q==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thciS-00000000LWh-15IZ;
	Mon, 10 Feb 2025 22:57:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43624b2d453so57473185e9.2;
        Mon, 10 Feb 2025 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739228241; x=1739833041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=;
        b=XKObD4IdLFpTEIhTgbCJxUwKXNsv8W8VZHLNh98VehVLCEPpcc35sV/En2+t5paHWY
         uCsjnIXHTAOPUrhxpS1hS/vnbSG6kwzq7ok7odQoNAADh5mHal0nXA3jKdGyMSVr4Zbq
         ErcMfOtSIKRA8ASxEy6NR20Fuzk/e0J5wByoDa/fvwIFLZ/awF+PrR5Gh7wTWuWuZrHW
         J1Iv7C3EJv6TuwkzlVdcw96Gzi4/M84QYPs7p8CqjdSNINF2x3F/dHKXGlun2Yg/1L+K
         EGom4rx88t5GbCC0b97aSPL1R0MPyv8nrBUKNPas2COVZYJ++6YwnLtiH+83AurP/yi9
         B8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228241; x=1739833041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=;
        b=avab+qcHERM8uX9ZWqADvaUCNxoNyFsNDqbRvCot673nB8JoRhBzdytwFAYT2sQDLP
         P4MOMx8I51LF/kolsryZo5L5LdlXXuS9CgztyLQAT+wiDL+rQFx5oW+k42hU/chZu0A9
         ukVRP8wABzC7exQUxAxQhHk8Qk8wsUEgff4+l69jL6tSjOBolyRiqd0xJvQ62t2zWu0H
         FCNFQqADV+/JSPivMJ64wdOGwP2o2Fjla/B+5UfanvqvO+co6F/LgSGUmR4AYw0omBMJ
         Y5kgsXJTnI2AelVA3w4VDB9MNsXM0xMcEbeznIyN7RUTp/YdWj0Qk5AI7MIyhjl3XE92
         r/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAlYae6gYuwpmYO1aMXj3UIQXoc7m9hFlqBB/YkXbhPaJd+5HSBwaVjRlyBpEx8pchb5VWAgGspXEOQCw=@lists.infradead.org, AJvYcCVeldBvUe1nM/+ZyjeIxQC/Z592YPC+/hoU+9GBxsG9S3Ckxe8IkUme2U3F4uZdTspckVHjXon3QfAyUMhjbQWz@lists.infradead.org
X-Gm-Message-State: AOJu0YzQHpZFbwrc994RkK7EOI+BQlocLpQIYjJMDV2KQlZ/BFfiHtHA
	+m5/rbTyi6Z1yZM2FuO9uDgu/h08R3j1QPhV0A2dBtdAOlnpP41jYEFeObT+tpMuuA4pXS493rm
	3ykBlPLxdAZxWOO01h2gFRnMNj4gvpvX4
X-Gm-Gg: ASbGnctKKuS+ESfadNKzenSDL884ThFmhGh4b9Lf7fJgog2aeVQPXj4KGOoOmEWyPaT
	zvOw4RdfwOaJg3S6S5Tgx98W1zmbrTR+9wwDPmmbyaUCsBF4l74u5jtEtHaf84D1igTyeYE8oCQ
	==
X-Google-Smtp-Source: AGHT+IEyUgh5hlQMy0mHMpjDyPnw+ddSs3VVjhhzfY77llj/hDQfGTz8SApwdafm8zv7xWDMgUXawi4NTtMIohvXxFk=
X-Received: by 2002:a05:600c:83ca:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-439249bcfc5mr154560525e9.29.1739228240742; Mon, 10 Feb 2025
 14:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl> <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
In-Reply-To: <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 10 Feb 2025 23:57:10 +0100
X-Gm-Features: AWEUYZn_arFHbmdvgRzow88RfNbJeiY3tjTfw66TROSp7YjMhPMT9KN4C9hXEgM
Message-ID: <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225724_511799_06EF3E34 
X-CRM114-Status: GOOD (  22.55  )
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

On Mon, Feb 10, 2025 at 4:53=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> On 2025-02-10 at 16:22:41 +0100, Maciej Wieczor-Retman wrote:
> >On 2024-10-23 at 20:41:57 +0200, Andrey Konovalov wrote:
> >>On Tue, Oct 22, 2024 at 3:59=E2=80=AFAM Samuel Holland
> >><samuel.holland@sifive.com> wrote:
> >...
> >>> +        * Software Tag-Based KASAN, the displacement is signed, so
> >>> +        * KASAN_SHADOW_OFFSET is the center of the range.
> >>>          */
> >>> -       if (addr < KASAN_SHADOW_OFFSET)
> >>> -               return;
> >>> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> >>> +               if (addr < KASAN_SHADOW_OFFSET ||
> >>> +                   addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size)
> >>> +                       return;
> >>> +       } else {
> >>> +               if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 =
||
> >>> +                   addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size /=
 2)
> >>> +                       return;
> >>
> >>Hm, I might be wrong, but I think this check does not work.
> >>
> >>Let's say we have non-canonical address 0x4242424242424242 and number
> >>of VA bits is 48.
> >>
> >>Then:
> >>
> >>KASAN_SHADOW_OFFSET =3D=3D 0xffff800000000000
> >>kasan_mem_to_shadow(0x4242424242424242) =3D=3D 0x0423a42424242424
> >>max_shadow_size =3D=3D 0x1000000000000000
> >>KASAN_SHADOW_OFFSET - max_shadow_size / 2 =3D=3D 0xf7ff800000000000
> >>KASAN_SHADOW_OFFSET + max_shadow_size / 2 =3D=3D 0x07ff800000000000 (ov=
erflows)
> >>
> >>0x0423a42424242424 is < than 0xf7ff800000000000, so the function will
> >>wrongly return.
> >
> >As I understand this check aims to figure out if the address landed in s=
hadow
> >space and if it didn't we can return.
> >
> >Can't this above snippet be a simple:
> >
> >       if (!addr_in_shadow(addr))
> >               return;
> >
> >?
>
> Sorry, I think this wouldn't work. The tag also needs to be reset. Does t=
his
> perhaps work for this problem?
>
>         if (!addr_in_shadow(kasan_reset_tag((void *)addr)))
>                 return;

This wouldn't work as well.

addr_in_shadow() checks whether an address belongs to the proper
shadow memory area. That area is the result of the memory-to-shadow
mapping applied to the range of proper kernel addresses.

However, what we want to check in this function is whether the given
address can be the result of the memory-to-shadow mapping for some
memory address, including userspace addresses, non-canonical
addresses, etc. So essentially we need to check whether the given
address belongs to the area that is the result of the memory-to-shadow
mapping applied to the whole address space, not only to proper kernel
addresses.

