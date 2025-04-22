Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7ACC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 00:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/keifbzIEtVJlfmUO30vCgig+0LPOXWxdcUmaG38oY=; b=gOA/BYRa7R07cWtTHsL7eqC+l0
	kqivYU/iDcRz5hvOtS20lewgHJL0CR5045u/hUHxsJCF6PLcyX2KXsbuz7kxcUX3lHa6Hv+5ZAD06
	HhNbmgYNd4tViCpJyoH3XUqNL1uDI0Tjj2kHM7nKRVcmBQXqIQ9N3b9er2SMyRG49yuyQvjT4gcsu
	diML7MvIToXpAx/7OZ1gmb3O/gL+UZ/LyMrjH4+XGa2j44vH59eXwZQ/EP29IWOk3GUgE6TgdEL6c
	7SyBxCdX7jun5xfkk/LLZ/qO2g+PrR8D9/3+XStaGl6kR3F6fFcCc4TudnktAF0YjtUyxqZtTViZI
	9zxfrVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71dn-00000005ThJ-0Ape;
	Tue, 22 Apr 2025 00:37:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71bu-00000005Tab-49Ng
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 00:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 419524A769
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBDAC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745282138;
	bh=6/keifbzIEtVJlfmUO30vCgig+0LPOXWxdcUmaG38oY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uNKeNDyXmWliC0evfHfEB1zR5j9FXZmNXh77klHVuqpl2kXU9PzX4lwILlAAuw3SQ
	 TnmoTrwfud0pA6p7nx8qMgdWxq1/LnOPkxrjC8CClY+v83yTJsmhV8GQI9TA+CaSOt
	 D3tvcvfJTyeZCReN4CCeOz0OYki7oGC9Bn+aRSOVBrukhbd8bpRbQYLFHVkveofC1q
	 ppLqbs/l6ajR6fXzYh7nwr2lMlVcAjAabS85JlJ3w80hggGL6LEi0bU88wPkVO8Jty
	 x4zXNkJUw7EW2hIOTOeT/vv7qE49Bbm81k6RzM5Ie923lFGAMKK4ihj4lnbzV5Qd1m
	 KpMX3TZJ9khjQ==
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769b16d4fbso24603061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 17:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaVNrCCWlaM9OuGs/bYFzJKHIUT1yDku9LAZVQJRZVpjZUyFrxUjRwoHbzkHFnJnuuCbjr+75QBPKUGx36dmnP@lists.infradead.org
X-Gm-Message-State: AOJu0YxoaUG6Z4LY5V4+LdvU0t+Vz81pcX/MZMxPEMWWbTPdPuH9i625
	Pgts2jSFbHsmd2MDbEUsLsBgSpZUyQ0XssP1oNl4S9KK9w02eTJ6XCZqPcASyyjV2MrkLY/JsH8
	+6C8U3Ca2L/Dpw2XFSzb6Jb25QNE=
X-Google-Smtp-Source: AGHT+IG9u8G20E0oo1O9mluOh2KQ5PFLirBFpteAz/tNX7rHCsPVff3ugqByeJ5CuCdd1xWJ/UgHWfBF3qZBa+iM5lQ=
X-Received: by 2002:a05:622a:650:b0:476:8132:c556 with SMTP id
 d75a77b69052e-47aec4dbfcdmr175809431cf.48.1745282137768; Mon, 21 Apr 2025
 17:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-3-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-3-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 17:35:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
X-Gm-Features: ATxdqUF0eWQu3DIXlyOorPxXB9gWMbvA_2k01-Rt21URVsQ-cwGBXbzbfMHyhG8
Message-ID: <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250421_173539_043587_86410C5F 
X-CRM114-Status: GOOD (  12.43  )
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

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario, use the text-poking API to allow this, even with
> STRICT_MODULE_RWX.
>
> This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Acked-by: Song Liu <song@kernel.org>

