Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133AC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6R6SWEsvDm+66dPzlD87SecGN7m0uU0XfqGXWlTaok=; b=uXRQjydKkq5ZqJLe4G5WIhLk2u
	m767IeWjb+chEqmTEbUHvuq4em1hGBz1RkN/266isngDi7LaCRDk8tc3impy2a0RxGgxZ5t6jf6y2
	GmpgN/sJkBHzdDORm23HC6ixITjehaZma8rCv5KRsPIGVc/3SoxD16WveZqsbiVGzrWQk5mLigsYx
	By/Ccp9d+8QzbdNIGgOHiLmifjjwgb0ybEMcb7PB951Jp/yT5Jj3nLn9Mjbo/NbQEPvGIpeuQ4KVI
	Cx5mYNH+qsiDStqkgfb/I4CmXpyevDM1HX+xjrypnPHRxEJTmFbt/4YJ/sVY5eyidoYdQLO+6KQjI
	Maue/S0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Vw-00000004HiI-0hWD;
	Mon, 16 Jun 2025 12:00:36 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7Ko-000000046gu-1OJ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:45:04 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so284615ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 03:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750070701; x=1750675501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6R6SWEsvDm+66dPzlD87SecGN7m0uU0XfqGXWlTaok=;
        b=iKftScDj85ePXKfQ94bDxI6/TPJsgNSs+mhUmFdsHdT4AwiKCa3sWbnaVCxTe+/cnM
         xtcPaIpV88R9GBjGjCVcO1NuAjJfHf5CqTcDoUmuuTHB656y74aAWG7jm2/dT3G09XiA
         wHdiQxsmUkXHHFMlfBgX9wax1xPYla4vEGzZZMZujjRotko5ivizauvMDnhympekZRdk
         AVIPYrnFFg+/AUVJjlZCiaBfjV30dXvAx9NZRY+XV+m+D0rncS6VzslrvfhC+16GdSag
         3Hys2tvFfq+M6pL4L8MQYmmJPl++WBfQE1JAw9cKTNrxB1wf7OgL/4B6AeZiJxtritQ5
         zeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070701; x=1750675501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6R6SWEsvDm+66dPzlD87SecGN7m0uU0XfqGXWlTaok=;
        b=YdKXn11O1OQlTFw4dAXblRkEP0/gVJDGzx5RxeNRzZf1miSp8MgEUypXVcxUzlJW3H
         NvtS6w4cWUK1WHRAoKdPVsaTu1JAog1C4SRWLsWy6C+a/iqjs1q5MGXCrugZ0WuCMDGJ
         7NT0njV//BlJtBGIEqy3MYdQpOssmUCcCBZYI+oGP86xblZ5S4AbFHZNaIBrLj41zxMQ
         pMUhLo3xoCzsqvOj7nV+3u/pD4vR1VaKXbSCdSHjL5nB++SKLedv6a3CqbMhDT7eNs/S
         1YVgiEiNga/8tgoWZTkpn7tddhkP/f0v2elYvGeiTjVaA2W3bSuyO4D77J+X1futzkIz
         pemA==
X-Forwarded-Encrypted: i=1; AJvYcCVanHGCRl6f8U0stK8n2czeRaFnmMPNd7b96e9nnCHIng6epTLYnqS7TKR/5XWG8ey/9//ep9Gq7wfuMB/CKBNo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgit4OGMHShT5FtpOIjwybkiKAERYps4L5w9GuKiFN9QZFIpt8
	IbsrHp3X20bR5NNs4NYDgGgTdwho/SNRFd1gN030jQdES8nIPe5nDPDijTC8Z2+qcGvhnz1KG1S
	g4CSyRVbVpe+dmZ28E3WQ7gn4BYye3yJRwNRLrvBy
X-Gm-Gg: ASbGncv2Wcn9zUBfPaJcIz6BmTMJusPKPWD0ktphUk1IPspmXG5kBZKK7DAFOyUdN+w
	MBCP45vDRPqRgB2LgSnRJTT0l034wnxBMs5qKssfVFuOhVwiijlRy4M3/nI3/kuN5iu9+ZJRjuz
	nHW0Ww7h+wDJm57HXWZQdsP7kkpBP9IgeCBKDfgKZiwkxz
X-Google-Smtp-Source: AGHT+IGZ5j8v3Ocn8ObEJWFaqu0zHRUBhHJbRBl19pWYIGlLXaQ5CvYChKdFLMs6JM1wUgSUPI1j2DL9dy/hVkqNSNo=
X-Received: by 2002:a05:6e02:1d9b:b0:3dd:a4b7:c737 with SMTP id
 e9e14a558f8ab-3de09fc2b9emr4525975ab.19.1750070701158; Mon, 16 Jun 2025
 03:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com> <20250616102945.GA17431@willie-the-truck>
In-Reply-To: <20250616102945.GA17431@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Jun 2025 03:44:49 -0700
X-Gm-Features: AX0GCFsxy4AselWH-HXbNdNUVS0F-38THElPX6b9gGbKXhJTBrfP3qqVF_lXcMI
Message-ID: <CAP-5=fVjJyV2eA1aDnk6cqAhJGc9FZVyHhP7-f=1OyWmzxjN8w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250616_034503_022334_D1F4D25A 
X-CRM114-Status: GOOD (  27.09  )
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

On Mon, Jun 16, 2025 at 3:29=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> > On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gmail.co=
m> wrote:
> > >
> > > This series adds support for the CPU PMU in the older Apple A7-A11, T=
2
> > > SoCs. These PMUs may have a different event layout, less counters, or
> > > deliver their interrupts via IRQ instead of a FIQ. Since some of thos=
e
> > > older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> > > be enabled by the driver where applicable.
> > >
> > > Patch 1 adds the DT bindings.
> > > Patch 2-7 prepares the driver to allow adding support for those
> > > older SoCs.
> > > Patch 8-12 adds support for the older SoCs.
> > > Patch 13-21 are the DT changes.
> > >
> > > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> >
> > Hi Nick,
> >
> > This is substantial work and it looks good to me. Do you know why
> > there's been little progress on landing these patches? Buggy Apple ARM
> > PMU support in the kernel has led to reworking the perf tool. It seems
> > best that we can have the best drivers possible.
>
> You reworked the perf tool to support these things? Why? These changes
> are targetting chips in old iPhones afaict (as opposed to "Apple Silicon"=
).
> I think that (a) most people don't particularly care about them and (b)
> they're not fully supported _anyway_ because of crazy stuff like [1].

I was meaning that we reworked the perf tool to work around the Apple
ARM PMU driver expecting to work as if it were an uncore rather than a
core PMU driver. More context here:
"[REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5"
https://lore.kernel.org/lkml/08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st=
/
But in general it would be nice Apple ARM PMU support were well loved.
I think we went 2 or 3 minor releases with the perf tool not working,
threats of substantial reverts to avoid the PMU driver bug being
exposed, etc.
As for which Apple ARM devices should have perf support, it seems the
more the merrier.

Thanks,
Ian

> Will
>
> [1] https://lore.kernel.org/r/20240909091425.16258-1-towinchenmi@gmail.co=
m

