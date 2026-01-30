Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7291ED49C82
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B1Yalln+iXJXHDKO9R4SMtlHYiY3yHrwjpbwjLBBb4=; b=IRAiK9UYY5Ae1JQS5PRVrqXOuA
	9fybbo6C7BlMqkdCSWzJExfRHnPZ7S2MaiMJZIJTnVExsS2qvCKqPWD9/ZdO7aQ5XxMwm3VwPzsWY
	liOt/HMjs8RsBc8Cx08rYct/vD/2qNWmTEVoDxGq5y5DtuafQ5Hz2nNfDwNUq8QFmS5vifKwXNcDQ
	qc3qfKG8wVlB+3k+2j6eTy8wdQ/4pACESR9E3yFeA6KCNkcPJh1T1x4VOUVO3p5CiEG+yCzyPlu/N
	rPVILRu0MR3Ys454X+EGESC7B1OWSaSUE9YgnB8Yio3BIB+piePmM82oBPhNeiSYYzGauIRWOGaK7
	Kxq8tTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkTs-00000001FOm-2hp4;
	Fri, 30 Jan 2026 09:07:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkTq-00000001FOR-28zz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 09:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90F18441F6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 09:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB5CC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769764073;
	bh=0B1Yalln+iXJXHDKO9R4SMtlHYiY3yHrwjpbwjLBBb4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8+l+iHoDTbixe8W59bagjiZmxPTN1z+UFIT6QTnOPcYMAomeybQCsbbOwdMY3JdT
	 4FKx79MdT1ytHNajGtl7UGEhkIulK5N3f/JYk3KjWf2QPnS4DBwdu3wLCwQOAid/n/
	 06ZFcLeabOwIRN/E1Gm8Bn7H3wN4LoUXjKMpaSRnYNkjLU9ETiz9MK7trOcB0QYWP4
	 ccvPSfJjwqARC6xkSDr2J7S9c+PI6g4LfpxYQrQsZAXdpVDu4Zpc0FWVpHqCJtn7PU
	 T/9pLTGZEdATcX7YBW7RrJAe2FHnpi4rrUJrsSpvgOOgkhtC68WV+seKB1h8N0zhey
	 58+c7dBovIFhA==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6495d592b58so1807790d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 01:07:53 -0800 (PST)
X-Gm-Message-State: AOJu0Ywtvsknav80Tiy9w4mCHgUakwXNVHGLsVeYGxrYeod1+xy5MIG/
	P72XquHS6QNRz40y+2fud9OCwF+XK+0pw3glk7m73Sv2EJNLN3YY4O7TbNkyXxf1RaHEa8gJLOq
	adzELKQh9UVU5h5imq/qEqqQZhs87+HQ=
X-Received: by 2002:a05:690e:190c:b0:649:1d22:6c2f with SMTP id
 956f58d0204a3-649a8471a4fmr1591289d50.47.1769764072816; Fri, 30 Jan 2026
 01:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20260128203455.38569-1-stefandoesinger@gmail.com> <20260128203455.38569-2-stefandoesinger@gmail.com>
In-Reply-To: <20260128203455.38569-2-stefandoesinger@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 30 Jan 2026 10:07:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
X-Gm-Features: AZwV_QgIqRkRaJIYIk5yozVO51jXZD7E-SQ96a4egvzgryd6Jyh30pFArwQRnZw
Message-ID: <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linus.walleij@linaro.org, Jun Nie <jun.nie@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_010754_572105_DB093BA0 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Stefan,

thanks for your patch!

On Wed, Jan 28, 2026 at 9:35=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
> and sold by ISPs themselves. They are widespread in Africa, China,
> Russia and Eastern Europe.
>
> This SoC is a relative of the zx296702 and zx296718 that had some
> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
> platform"). My eventual goal is to enable OpenWRT to run on these
> devices.

This is a noble goal.

> +Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although =
they
> +run in aarch32 mode only. The CPU has support EL3, but no hypervisor (EL=
2) and
> +it seems to lack VFP and NEON.

The practice to run 32bit kernels on 64bit capable hardware has been
pushed back in the past. When you say "they run aarch32 mode only" this
sounds like a choice, not a mandatory demand from the hardware, i.e.
it *could* run in 64bit mode.

We can see why the vendor does this because the board has only 64MB
of memory, and 64bit code is known to take up more memory.

What we recommend is usually to run a 64bit kernel with a 32bit userspace,
so the userspace still isn't too demanding in memory.

Have you been able to try this?

If it seems hard we might need to bring people in who can help with
enabling 64bit mode for the kernel.

I think Arnd might have pointers to previous conversations on the topic.

Yours,
Linus Walleij

