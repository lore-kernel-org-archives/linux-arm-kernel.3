Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8947ED277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSxvsKP02jf1cnbkhlOj52mufxl6NmofMhFwuClP36I=; b=lPxLerPnO2hvbT39oOSVmnb9w1
	Wz03ZX+NTr7ykzUugdDE30NGHiOGiW4ElYWftmYPoBNey8e/FIDeh4sFxhLMYAj4ZU5XNbMtswFy4
	Qu6TnLIu4KLdv/l6En8ISuimdgI1Wh3WlyXBj0gfn8hLs8O6vPuiGGff0u48Cye39V74qBCf29F68
	dT0cufOioInGekSMHmuwhdIVuRolz9iTKGQ8mOzuKHq7Wxb1SWVwZrvcqXyDkeIEu7mixZQi3tI3Z
	f41gMCBf2ymDWkGWeO9co39/pzfEkNuqAI9dJ1QVLY+SUHs8M5tZc6Gu5ZtOTJofoZMLfkLDDCAl1
	hlun0zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMyT-000000038H3-42jo;
	Sat, 10 Jan 2026 00:37:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMyR-000000038G1-3Tnu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 00:37:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34c718c5481so2754449a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768005419; x=1768610219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSxvsKP02jf1cnbkhlOj52mufxl6NmofMhFwuClP36I=;
        b=OOfWpUgRAAIQqH6DIWXNiKsftfpr+MQxn6rJ7uh6EtCQftIUh3Sl6PTJuw5EaiKOCs
         RlPGhj25r17cO2UVadE2NyNWauDCGb4BJJ8PA6Ta1aadignP1LiqpGU4COfjVniiXI3a
         C4RH1df8RgYN62vYP58Gj7/bol5CxIDnUzkfLWMrHNyld/8DqL3s4QWyvAMEbkjMRbwP
         KFvQfiTqmK32LghKLZJnXgfcfab51qGVfkWAi0lKhD5Z3YPgNvoysrFVNm+4xK35IuAy
         WNdA9cn2yX6/bJOPyUqPvUZdvexeybYmgMboCcelezEgKdFGwSg9tOErbDOWskphh6uC
         J4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768005419; x=1768610219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSxvsKP02jf1cnbkhlOj52mufxl6NmofMhFwuClP36I=;
        b=rRhkHR4Qbvw1nB01BzVC8Xkbs062+meuZzXlz+ZRjI9WhbwGMGR2me1yaiw6RNtqJX
         06v6pxvdfxXa4zpawBmWYC1X925ZaF5eN2UZNhfWIbg3LHTKWpCehGWoFP4oaA/pMZho
         S+zXWzfTU59zbR2VGQTjBKPWkk6YituZI9GeqXAM29xJj1Eji6ngPhelD5Q5NO19YYK+
         5/KrPH52a+6FFgvl0HA86P0EgMx98FSUMsbGXNqyCglV8EZdId94P8baBaqA/I877meQ
         x9Bv/ZC9ri505mot2j+mL2+lY6FWQxSglyThoDV3lgljZB1RmALbM7eGJ6YbpyW0tJf6
         7ZkA==
X-Forwarded-Encrypted: i=1; AJvYcCUH0bxhJMEuVjUOfzokQ+G4umv9FUKfdfx8nO/WLnvchho0QJG+2voDnX6Sg0q/hhW248hHkYN4ZPnU5q5x9kcN@lists.infradead.org
X-Gm-Message-State: AOJu0YyKPVb5PQPdO0NY0vL1AP1IhnjTGXmzfavLvyqWR7otkiEeDr5G
	f4XCQqqC83fjOdK2lJfIHj9O0oVUDukeZ43JG7iejeFa7yAyElkKhlLI9Jo+Te5bMazN7asAwDJ
	7uHKHrSU7Da91uawUhhgIwfqHoLhoPus=
X-Gm-Gg: AY/fxX4tBlMAIIQvrAIcGY8rxQvruzNX0PDOvj2X8P1rDkf0oEEg3d3qqdpccjRi58G
	2ctsz3L7O+9RAGeedkiKHU43lFT5MPbWbasNVJNkyYRxRvZ52+fQni/5RZvfme9L8mRtnfnAO3f
	ofLBfgECXPXYt2Aj1rjAF6ngKWQ6qQyFVYI0mPrGyvmLXO+ylGPCPMmEyfvRa6ljeq9sP6qrttJ
	vCxj5OwwHzdJhs7c5cZBB0RiIAAd/Lit6ba6+9SzdWNhRJUSc694i/vYTc+b6GuNfahWRGojqsO
	cm+rMHnJPv70P+EuCZw=
X-Google-Smtp-Source: AGHT+IGM3SIsuNL3/dMuNpHCUQ1cqrUQQjji6eUGqvYpxJAa/wVfpCqyvAIs3ghIt9fdukZQ7mtDD7SDbuqV/HYZR7E=
X-Received: by 2002:a17:90b:2692:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-34f68c47243mr10186165a91.34.1768005418846; Fri, 09 Jan 2026
 16:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20251230145010.103439-1-jolsa@kernel.org> <20251230145010.103439-10-jolsa@kernel.org>
In-Reply-To: <20251230145010.103439-10-jolsa@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 9 Jan 2026 16:36:45 -0800
X-Gm-Features: AQt7F2pTOA8QTYmqFAVkFZ4-jcuY9II_x2OlDmi2JNLmaJvmLei8_Ech6tHhqpU
Message-ID: <CAEf4Bzay1q2oMYSDfdQi8LXt7HjFVXF+C+=+jLurp_GixWbD8Q@mail.gmail.com>
Subject: Re: [PATCHv6 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct calls
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_163659_869853_3076AE17 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, Dec 30, 2025 at 6:51=E2=80=AFAM Jiri Olsa <jolsa@kernel.org> wrote:
>
> Using single ftrace_ops for direct calls update instead of allocating
> ftrace_ops object for each trampoline.
>
> With single ftrace_ops object we can use update_ftrace_direct_* api
> that allows multiple ip sites updates on single ftrace_ops object.
>
> Adding HAVE_SINGLE_FTRACE_DIRECT_OPS config option to be enabled on
> each arch that supports this.
>
> At the moment we can enable this only on x86 arch, because arm relies
> on ftrace_ops object representing just single trampoline image (stored
> in ftrace_ops::direct_call). Archs that do not support this will continue
> to use *_ftrace_direct api.
>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
>  arch/x86/Kconfig        |   1 +
>  kernel/bpf/trampoline.c | 220 ++++++++++++++++++++++++++++++++++------
>  kernel/trace/Kconfig    |   3 +
>  kernel/trace/ftrace.c   |   7 +-
>  4 files changed, 200 insertions(+), 31 deletions(-)
>

As far as I can follow, everything looks reasonable

Acked-by: Andrii Nakryiko <andrii@kernel.org>


[...]

