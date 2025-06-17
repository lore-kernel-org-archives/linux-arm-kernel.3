Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4436FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=; b=fIIG7kNwytLNlmDsMDOCQjSKhh
	vTQZIDOzJ3l2bVafkHPOCNmZ3Lamo4qveOVanTWV+Txemb7Y6LAB8l+lmDGdtDNNykR5hI0oTv4iH
	S23ikMt0p4ML0ufS0mRL3L5ga280sqPtNOpYXfei6lIlxJELptdBTI8gNqkfx7wi0sfBS6H55WEqb
	rj27M0AaGHY2VuP3IfIiQm1XGMjlYPSDs/Zdc+DJoxhBPrCHlT7EFdPENl0SM2TfuR9nzLUIch0u6
	ad2NcLfKOXzRycfoHBtcWb9iapgGo8D8X6tGa5nveETNTVDUnnzrGkqeFwbFJSiQgMwNz4ANXzio2
	ZuaNzKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrg-000000080RY-3y0K;
	Tue, 17 Jun 2025 17:12:52 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZBI-00000007sbO-2I5X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:29:05 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ddc10f09easo1225ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750177744; x=1750782544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
        b=G6rdnHT9N90CUqCF30dWdnFUm+yc/hTQZ5mc19C06J+J8f+A4SxPnGfEw/j/NCY7oJ
         IUu0lQXN5gur+XNvZw1SIbBwDeNV5FmCMnMOGNbPBU0r7SQujB3xYNf3GUaM5SyrhLOi
         8MNE/HfNzdtDuDqJD1TxykPfgSMJXvrY+Nq3CBG2w0J6E03B/OKiv3s5qlSFGjowr1/f
         OzctpsWzFmFJaNL+045s9Njq24Gy1195s7YULW+MEc2disnr4GRy61ZqAjAHFMp7C7U+
         PeMWFPqyvfk8czg9iaQjmjR/qE1Md2Y4kCbiw8dWQiDk5UZyBQf660A6osUMvtjDTOMT
         bbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177744; x=1750782544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
        b=WcE7jYNVsOfQg09X8ZpEamczEuo7Oz+hhsHiJeEl7O5BfGGQDXwC03bP6KKXU3vHZ4
         WPIMAlUJWKkTfuB+BH/n91//teeNwMGQ0z4MGgAqGw2/2hOQHLWn5J5WlwRnb8Cyacqi
         a05KAylFDEWAq2i7HKP42R5U/jhz9kMJzGbRV9W9RFY7EgR5mpdbFJbBCNZMgkZFosN2
         W8B97/tONrXORJKSPEkrVcyvZVpwyUcvLyQ+efBx8kNpWiZOxAPu824mrzrWrcfTx0NS
         9nhB18aUZKzkIIEXch4dDIfdqMsplnm8M2CmnVICb9mrgnYbvQgR5qzPfCj1Xfiyl4Sb
         fTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNw1KBnOxI5ZN+6NWx1RgWQbrKAe2hs/VX6W7Mf33vIqzqr9AHJvOjFiUfgcZnfSBEYM0Si8nM+I+KbDKxNrX2@lists.infradead.org
X-Gm-Message-State: AOJu0YypU16ZSf45xUkqoW2zspX2tRQwchBPx3kQM3mHxtLrSjC9Gi5G
	9U6/RH+7PpHQx3JCJxpjYpRD+rAXKJZb1+WDtlbgnxwhoS+A8dZZQUArLIfzE4QAjBN/Cm2WvvF
	lv/qivw5ZnJ4OR3dMGHaLdair1UVHCxeUhjon+7mk
X-Gm-Gg: ASbGnctAsmbn6+TYRJsY4cRpqCb74cMgMAUWd4dq1o9cFumoP4FFZEYh1dE8vhAE/9w
	jsMhZA0oxLK7pB36nSWv0EHaKzShK5+nwBF6hfMZTgJeSsZMFkONJE22LHBlwy21Go2idchVO0z
	QkhxUiZFvcrcby6YQQddTKKHh+98fO2XzNtGaKgEGR6JxhnLPfxHXXaLyrgTn/b0r9x+k7RIAJ
X-Google-Smtp-Source: AGHT+IGuaQHH5RnvKvS2kE5LJtsJIfjqrig7FhB3Xp0nL8VkPKaJwzzxDGo5xtnO5/xq+BKzkzCl2ghHE6EtLjDojGk=
X-Received: by 2002:a05:6e02:1aa5:b0:3da:7c33:5099 with SMTP id
 e9e14a558f8ab-3de09fa7317mr8962435ab.13.1750177743269; Tue, 17 Jun 2025
 09:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
 <20250616102945.GA17431@willie-the-truck> <CAP-5=fVjJyV2eA1aDnk6cqAhJGc9FZVyHhP7-f=1OyWmzxjN8w@mail.gmail.com>
 <20250617141649.GA19021@willie-the-truck>
In-Reply-To: <20250617141649.GA19021@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Jun 2025 09:28:51 -0700
X-Gm-Features: AX0GCFtUDjpPo9TijhacurqPBZmSpa7o8vMtplPwxsLKffdst7807Hbk9NO-1jU
Message-ID: <CAP-5=fXn_mr4k=fTYEuK7cCty4n8sofQaz1jNsrTn8U2icm_pg@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Will Deacon <will@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092904_585924_A3C96240 
X-CRM114-Status: GOOD (  37.37  )
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

On Tue, Jun 17, 2025 at 7:16=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 16, 2025 at 03:44:49AM -0700, Ian Rogers wrote:
> > On Mon, Jun 16, 2025 at 3:29=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> > > > On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gmai=
l.com> wrote:
> > > > >
> > > > > This series adds support for the CPU PMU in the older Apple A7-A1=
1, T2
> > > > > SoCs. These PMUs may have a different event layout, less counters=
, or
> > > > > deliver their interrupts via IRQ instead of a FIQ. Since some of =
those
> > > > > older SoCs support 32-bit EL0, counting for 32-bit EL0 also need =
to
> > > > > be enabled by the driver where applicable.
> > > > >
> > > > > Patch 1 adds the DT bindings.
> > > > > Patch 2-7 prepares the driver to allow adding support for those
> > > > > older SoCs.
> > > > > Patch 8-12 adds support for the older SoCs.
> > > > > Patch 13-21 are the DT changes.
> > > > >
> > > > > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> > > >
> > > > Hi Nick,
> > > >
> > > > This is substantial work and it looks good to me. Do you know why
> > > > there's been little progress on landing these patches? Buggy Apple =
ARM
> > > > PMU support in the kernel has led to reworking the perf tool. It se=
ems
> > > > best that we can have the best drivers possible.
> > >
> > > You reworked the perf tool to support these things? Why? These change=
s
> > > are targetting chips in old iPhones afaict (as opposed to "Apple Sili=
con").
> > > I think that (a) most people don't particularly care about them and (=
b)
> > > they're not fully supported _anyway_ because of crazy stuff like [1].
> >
> > I was meaning that we reworked the perf tool to work around the Apple
> > ARM PMU driver expecting to work as if it were an uncore rather than a
> > core PMU driver. More context here:
> > "[REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5"
> > https://lore.kernel.org/lkml/08f1f185-e259-4014-9ca4-6411d5c1bc65@marca=
n.st/
> > But in general it would be nice Apple ARM PMU support were well loved.
> > I think we went 2 or 3 minor releases with the perf tool not working,
> > threats of substantial reverts to avoid the PMU driver bug being
> > exposed, etc.
>
> It's unfortunate that you've had a torrid time with the Apple PMU driver,
> but I think it's important to realise that it's both unmaintained (it
> ends up with me via the catch-all for drivers/perf/) and was written
> based off whatever reverse-engineering people could be bothered to do in
> their spare time. It's frankly remarkable that it works as well as it
> does.
>
> Despite all of that, I still don't think that your concerns apply to the
> patches in _this_ series, which is about adding support for older Apple
> chips.
>
> > As for which Apple ARM devices should have perf support, it seems the
> > more the merrier.
>
> Easy to say when you don't have to maintain the driver!

Well I do send patches ([1] is based on a patch I sent and James
reworked), but yeah. It is a bit strange in this case that we have
something that is both unmaintained but not taking a patch series due
to the cost of maintenance :-) Hopefully it can land.

Thanks,
Ian

[1] https://lore.kernel.org/lkml/20230710122138.1450930-2-james.clark@arm.c=
om/

>
> Will

