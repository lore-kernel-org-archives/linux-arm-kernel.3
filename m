Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3807C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6VckmbMeNSXle4zRhCa92H9M1awVcFui2HysraFMAs=; b=grcv126dy9ePnLFITxBXeyFnmp
	5XF7AVxqaLz8GHsaprt1gs4rdHNOALRXZsVlmZZfNPgXfamipeTK4YSfUzN9UmQmkzjDA1HaIoEbk
	anHgzsnwiRX3qKuNUbhznSk13BTWRopcRfefwm5lMFJusHNAaLCFcpu8fV8l8BifwA4GLnLW2m1cn
	+vP5Uc5ng8KeBM04kxVax3ZxY/JNz0qEnbnRwXHH65jbXI/zl1NIkybKwi75hGnYNNXp/9CLaJDNs
	5q+bfmqVTXFZ6z/YXkIzZ0zOnJm2k8hdQ5daYhisc8wCTnh1w28fGvCt5ccy62P6FyVDuaPGb5Fl5
	iv6BDIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR5Y-0000000AZoA-1yUa;
	Thu, 17 Jul 2025 16:04:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQTn-0000000AV9G-1pfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:25:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a51481a598so583459f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752765902; x=1753370702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6VckmbMeNSXle4zRhCa92H9M1awVcFui2HysraFMAs=;
        b=Ly/oD4q3sE7rUge+KTQOma0e9jGPh9jc+IxhTsFrjDtG2MR+8r/A8oHT99ZrqvNA1P
         GaPyiDVYEJmFn2Rmaw5rdpy3VAQWFDzwn7yZfbC3ukoWRU5LzSCOnbwbZwBahVMfRUM5
         U4X4TQHyZB0gO0SNqlVy0uG6IYwBxZpLY/aDrlHwRtP94sdisyrQDGkZx6v8zR6dASF2
         T8crXHgw8ZXkjf2MYW9IWSbHkyJnm1bMpilGAveczK8b0uO7mKUkWSGJ961tOd9UiAxM
         1zeI8wG+WGNUUkZVX6k7pxVf8lLRI/XV3PJxGGSPF7wCJbP7ga4n3dcOZ8NJ3OjcK1+b
         HIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765902; x=1753370702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6VckmbMeNSXle4zRhCa92H9M1awVcFui2HysraFMAs=;
        b=bgF3gfztes7HZ3o3skgrG+QgPoTEYg3ATIDbilfyUqa22rvIosJHt3McLfZVuEfOMq
         KHXU0nq54t5QfFImkAhps+ULOJbpXTGRCllObss5k0lh4vsnZIq+4AUz4XXlPqKg2q3m
         jEllI8275Dl7+Gsos/4XKY1Ppfq0IYo3JnHBIXHh1ZPitqv9DhXzjKOl2OCD5NkHlhKQ
         qBXG6/85UCboz2WLF1V06/uF8wZDuYw6PWOOH1mO9z9mruUNvYWWTt8QGJR87sMMshud
         wFqIsIFbFDOIOsE+GjGyRR3P7OM1vWnnqO4hDo2I0yc84O2kJ8MdEgY2+g93LkM/F/jk
         4djg==
X-Forwarded-Encrypted: i=1; AJvYcCUWytjQGm/kTHTA8h6xILEpwWAczTX80uQV5pGQ83b4zDZFjgqdE404Zt0FRNaEG/lsF4Lty8ZbgMXbdJCR/hns@lists.infradead.org
X-Gm-Message-State: AOJu0YzK7TafEno9T0xC9L82fbDVegyCwxJtH3NSpCv6np3Yvwp7q736
	ZKxznhgYif6OX8ppE9MepWV5yAym2MmJ7ebjL9Knkjb/JmkIJFYLFioOoYA43ZDMHozOSYv+Xcg
	0noHQwW/5IbVyZPaYrMTdNrV2KH9FnRM=
X-Gm-Gg: ASbGncvMmclZnTjqIpNMJpa0bId/UyuTv47cGl5WCaitYq/gMMLMuzbHu+QUkiH+ZIA
	cUBLonRNg2gky/RRKfIu55PEGoKyLVvuYtRSb24a99+phq7qi3OSepvg1X0nKVIFcU+P7RIuBlK
	mmCaBoYrWXhTLwEn4/CQ06iWiXww/ro2kf5lHH01tGZBaPQWs02Klyb4Bf3zyPUP2Eczln9t9zl
	A3p1yvRy/AiS05HGlndcNg=
X-Google-Smtp-Source: AGHT+IGeW++fImtoeS2B0SWaaDzKCqDG3PBDTK7fijr/paFUbpQ9Q2BBphVZE3USeT269JcqVLR3X4fwk0ujRPHOEEo=
X-Received: by 2002:a05:6000:144b:b0:3b5:dfc2:f0ca with SMTP id
 ffacd0b85a97d-3b60e53ea17mr6047409f8f.40.1752765901784; Thu, 17 Jul 2025
 08:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-vmlinux-mmap-v5-0-e8c941acc414@isovalent.com>
 <20250520-vmlinux-mmap-v5-1-e8c941acc414@isovalent.com> <g2gqhkunbu43awrofzqb4cs4sxkxg2i4eud6p4qziwrdh67q4g@mtw3d3aqfgmb>
 <CAN+4W8hsK6FMBon0-J6mAYk1yVsamYL=cHqFkj3syepxiv16Ug@mail.gmail.com>
 <CAADnVQ+WZsaDS-Vuc9AN7P3=xvX8TG=rY65A8wYdOARLtkt6Mw@mail.gmail.com> <CAN+4W8i+PqYDcJjWk+g63W4kdKvhFKSad61q-T=JJky5m7j79w@mail.gmail.com>
In-Reply-To: <CAN+4W8i+PqYDcJjWk+g63W4kdKvhFKSad61q-T=JJky5m7j79w@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 17 Jul 2025 08:24:48 -0700
X-Gm-Features: Ac12FXww1JBCS6XraoQajcOSXv0y_LFuMb7d0LFifqkes7LZtbikQbv87_xdbD8
Message-ID: <CAADnVQLJTmjt8nE-xoPhE=6Q+bDOWTTwQ9OqQjX+YKT5RPBNrA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/3] btf: allow mmap of vmlinux btf
To: Lorenz Bauer <lmb@isovalent.com>
Cc: Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alan Maguire <alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_082503_479563_E53FD3B0 
X-CRM114-Status: GOOD (  11.76  )
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

On Thu, Jul 17, 2025 at 8:15=E2=80=AFAM Lorenz Bauer <lmb@isovalent.com> wr=
ote:
>
> On Thu, Jul 17, 2025 at 3:49=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>
> > __pa_symbol() should work for start_BTF, but would be good
> > to double check with Ard that the rest stays linear.
>
> Alexei,
>
> This code in the arm64 setup does make me think we'll be OK.
>
> kernel_code.start   =3D __pa_symbol(_stext);
> kernel_code.end     =3D __pa_symbol(__init_begin - 1);
> kernel_data.start   =3D __pa_symbol(_sdata);
> kernel_data.end     =3D __pa_symbol(_end - 1);
>
> Using these as start and end only makes sense to me if the addresses
> are linear? See
> https://elixir.bootlin.com/linux/v6.15.6/source/arch/arm64/kernel/setup.c=
#L217

Thanks for checking. lgtm.

