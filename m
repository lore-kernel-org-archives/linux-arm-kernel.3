Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B689C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTQ1sOp3emeRBHQnf/LKwayGmF56J10umRqQ1zOkHuo=; b=mQUZwPytDvA5VMk386mF7IFyhY
	1uZlbcS9Qjilx2LvVtbfh4ja6os8rnZKt7vZcCioLKDQggXU5bgIVpVnC29DP7Zm84q21KgoAyq/d
	0H/iKmNnob2SLAbVUaql0soFBdbk/wgWXOG8FzomogO04Z30oYGX+6pJQ00xZq3gJHnrT6Y4Yw9Pg
	4F1u7NOO/RsvKzlzT3Hi2HgLDRkM7ZpE9iE87pdbXO6cn59ZcnhhbN2bgQIzDSgxX33OwhwYxF8RY
	UDE3Kkte76nd522jQtQd8VdXsOw1TjU+SuyqWKn/MoFmFYWnemBpxvYyTWWku1CiqN/6SPAeoFn/+
	nz+vceBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBfH-000000022Cz-2d0l;
	Thu, 22 May 2025 19:33:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBbd-000000021nx-1cGv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 19:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VTQ1sOp3emeRBHQnf/LKwayGmF56J10umRqQ1zOkHuo=; b=Wdn2yLngvuVgmixf9KFkMs8vMc
	OhhR7A+tV3RKY7j24bt9quvqUdrTt1BQzRuLqVZNDVqckpGA5roZHt6PwMN0gbADBke6QOcSf+t00
	ztIEXFqFyraOVQRzesKzfQlayPO5Zg9Gq4HETwU0F2DnId6aJOYOSFsWnkwNZIjuQgjoKQ67qVaGU
	U6uZpVYjTHph84ZsG0PvTc6OY5SrvgoPuhpEo4zKB+lL1eAtsG1R+JUab+T/Kw5rlofdlHRDtWziZ
	N3F1J48FMRGhBXv8bKoftPIKcauQ2wAHVsuoKe7XASpmzFZhdlBKJqbQ5VQwmW15tk731fOfxAOWt
	qmrPFraQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIBbY-000000014MR-2qyy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F0EC44B12
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 19:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3E9C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747942157;
	bh=VTQ1sOp3emeRBHQnf/LKwayGmF56J10umRqQ1zOkHuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UF0ifT+yPGipUqRwatAPxXxUS1qjhektWWKkqXlvbMCdwDGPhEFenTgcA2AkMLKH2
	 0WClS46Pfb9QbGX9AM3JQlQ1OPS3Ixedi1cairenbBP6+fUYhVvDao6kdSTrXZVOgw
	 qRVmvfRLAn5IXoKIpOZXy26tVxwo066iCYFx5o70OFAOPQ4ZAz8YmJ6usEJ1TAU+4U
	 Gn4RE1ksvLCLLmpV8tq0ROhkX64Z5duoL5kQgsOBa24+VTeEOtIjLxim6Szdlo/opG
	 GKYw+IlQK5UPFBFL4F4uHtvBw79wIzHtpbZkft99XCiw/Vzqs30Op07BFVSQ9fcItV
	 iFn2QrjURlaJQ==
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47663aeff1bso78538741cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaG10KnxDn6xteCbEkKiKiEHR0TOPcqNRpgj4Xh6Wtk9Nz8RmS6m5TV+fjnUINRgu5fenDORaqlwIyy3BrMK5U@lists.infradead.org
X-Gm-Message-State: AOJu0YwXyc25nmoBGETePtkgEVzal/NnjnNCGvwRX9cGC5/Wn6GxO9Jx
	E7j+72EpFIKZghPuUL77OyEysdvksVyhGjGRweBpCD0TrSDJrQs08CCz6pcN2WX28UMeovxOfcs
	tpOSaCc4lnXhkfrJrmzI5suAnjXxpCgw=
X-Google-Smtp-Source: AGHT+IHxoucucHwQiQ5k+QlgHbE2CP5qSpkJS6DGAZHp8GwQn8AznRtvdzBRm9o3lXbC6hZ3zyegkI2oQ1ANI3VBptk=
X-Received: by 2002:ac8:714f:0:b0:494:b8bc:8adb with SMTP id
 d75a77b69052e-494b8bcca9emr317745361cf.5.1747942156330; Thu, 22 May 2025
 12:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250522184249.3137187-1-dylanbhatch@google.com> <20250522184249.3137187-2-dylanbhatch@google.com>
In-Reply-To: <20250522184249.3137187-2-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 22 May 2025 12:29:04 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6=kz5v2fBC2fwGXSG3orRPuDf4qdh1ZsLBfQNn6Zpi6A@mail.gmail.com>
X-Gm-Features: AX0GCFsoCb4olxuchinpzxOR6O-IyGNTRm4ViSFvjwWy9gpvmYeUfBQw7wSB5O8
Message-ID: <CAPhsuW6=kz5v2fBC2fwGXSG3orRPuDf4qdh1ZsLBfQNn6Zpi6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] livepatch, x86/module: Generalize late module
 relocation locking.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_202925_105695_7716AE1C 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 22, 2025 at 11:43=E2=80=AFAM Dylan Hatch <dylanbhatch@google.co=
m> wrote:
>
> Late module relocations are an issue on any arch that supports
> livepatch, so move the text_mutex locking to the livepatch core code.
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Acked-by: Song Liu <song@kernel.org>

