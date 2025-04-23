Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A98BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 04:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOFOSyt3fD36Z3ZzZZtsOicsp/6FBOZnTj3UQqN70yg=; b=BONw8OkXfQFO0FCa06oFxqTvUt
	H6UgHfuKTzW+cYpukXL4YIEhbazZY/WY0+io8NDtPBeDI1sY1aPpZTfUP4PZLiNdA5uOnUsej3Cok
	nJC7hTpqLFp1xd3s3hGCG4UhrGwgMZcpdWymxYVzT4d+RqFb6YLm2iUb/ZMcxfgwI8YxHmsvrX/xT
	+YY0BFXCJmLG0h8KX6Z/02EJzF0Cucir88K2nI2Js5q0C8Rn5p5Wrx/Htmnc+nZfGEETRuqkEb2ch
	p8W2jCqRX3vx0gNcX3lBPPRhpRRRH9cpJYfHJF7lEeKq1c+5Lg7rPKbnqdUtw8DkaXJ6wBi4KvoFt
	+BUirPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7S5k-00000009D51-2Pmz;
	Wed, 23 Apr 2025 04:52:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Rwa-00000009CFn-1k7S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 04:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B9EFA4C11D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD868C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745383361;
	bh=+P/38/XGylBbrnqHr4fmhFxUyNTi6UXbs8nHVB2Fpn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqXzynFpgpUJBC8Y/k/HHg7/gmTt6v0q0NItrSdZXAfYWWoKKqtJn/gWqjnUi7D+G
	 SGqD5Dd71qa0a+m/7QkzgQSDtfbLA83+bZLkkePiU94annKJwrLMXYgNNXr1dTlamT
	 gCwAX6i/U5ggTylSBTVDojRSDFh0EG0zhBKl35P45ShZl71uxrsSDy+bTrbrXrIVW6
	 g4MfhUaqjtet1y7nxQ0Ys/EI04kdtheuds2Xd7tvDNTbCQPmFKEJ1TIdiucIsaMlmD
	 Pna7lK52OhKvyWWZlJzTz9xHpeRL9ibnmXD1GsroliWuqxgqt2soHKJ0x2w1mZm6sj
	 Mdh6Sv/tyP9NA==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f8657f29so55283186d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 21:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvx6qoPCeLzSlaRbx/Gb5vgrkWmKyl0go69KgWdDY9af8hmnjHnrWPJRv5ZJNHuyqoT2dUkWsuEI7fSNF8+N60@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/TVDMVjMPEfdxUprtNieFjJdXy7IpWrQQOCO7Kbr2NcRJCbZ
	oHBSyy0lhDCF55trc98qMQeP+wUcYA0SG8nTtyhr/TvBRgIWR/oZpD0Q8bhpEtGHWpiWj+LNtnV
	6L7hizIRdQxKpk6RHB8MJ9auRKqg=
X-Google-Smtp-Source: AGHT+IG2iujGmrxmxGSApdKh0xQE22k8iMs1bF+5rk4Ii7hQjuZ4WUz3Udx35mdZ6VJ/yA0mcIltMuJefK87Efm8gQk=
X-Received: by 2002:a05:6214:23c6:b0:6ea:d393:962f with SMTP id
 6a1803df08f44-6f2c453aa96mr300370026d6.16.1745383360780; Tue, 22 Apr 2025
 21:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
 <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com> <CADBMgpzrM7PMePtWaZLaaNXt6z++V0rX2VXtWK4vzdTCS=BpQA@mail.gmail.com>
In-Reply-To: <CADBMgpzrM7PMePtWaZLaaNXt6z++V0rX2VXtWK4vzdTCS=BpQA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Tue, 22 Apr 2025 21:42:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7rMHdjzWdep1x-vZCvPW=vW2odS=VpA2ei8+QRxpE2wA@mail.gmail.com>
X-Gm-Features: ATxdqUHHlly3-QqUr3R7Aq6-RrjYz1OgoXfTzwDESgaWpIEF4419Kqd8nrEEBkM
Message-ID: <CAPhsuW7rMHdjzWdep1x-vZCvPW=vW2odS=VpA2ei8+QRxpE2wA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_214244_575859_893DAFCB 
X-CRM114-Status: GOOD (  23.77  )
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

On Tue, Apr 22, 2025 at 5:27=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> On Mon, Apr 21, 2025 at 11:25=E2=80=AFPM Song Liu <song@kernel.org> wrote=
:
> >
> > On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@goog=
le.com> wrote:
> > > >
> > > > To enable late module patching, livepatch modules need to be able t=
o
> > > > apply some of their relocations well after being loaded. In this
> > > > scenario, use the text-poking API to allow this, even with
> > > > STRICT_MODULE_RWX.
> > > >
> > > > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: =
Use
> > > > text_poke() for late relocations").
> > > >
> > > > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> >
> > Could you please share how you test this?
> >
>
> For context, we enable livepatch for arm64 by porting this RFC series
> (along with other internal patches) into our kernel:
> https://lore.kernel.org/all/20230202074036.507249-1-madvenka@linux.micros=
oft.com/.
>
> The way I tested this patch is: with STRICT_MODULE_RWX, load a module
> and a livepatch that touches that module (in either order), and
> confirm the kernel doesn't crash.
>
> Without this patch, a crash is caused in apply_relocate_add() if both
> a module and a livepatch that touches the module are both loaded. This
> happens through one of two code paths:
>
>   1. If the module is already loaded when the livepatch is applied,
> through the module_init() callback.
>   2. If the module is loaded after the livepatch is applied, through
> prepare_coming_module().
>
> In both scenarios, the livepatch module's text is already RX-only.

Thanks for sharing the information!

Could you please help test this set with [1]? This is a different approach
than the one by Madhavan. We were hoping to ship it soon.

Thanks,
Song

[1] https://lore.kernel.org/live-patching/20250320171559.3423224-1-song@ker=
nel.org/

