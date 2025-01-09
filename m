Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB44E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGnPH54LSRyFRjfMNErtUz4xKItKTGUTuqn1K88a/Xo=; b=JEKdG91V34JnLZ8tOHmdpWIVCs
	3rF6pZVRu8D2BSm3DsMD9WtbSDzW6BO3KqrjYBIUq0W75ElnN0Xut5LltJsVqA8hp3e9VKJWp5Gq9
	TH7e/vu0QFpW8AND7ksBpmw8DSKeRfvvQTHK0JhNDdxIFqlLu+1ieiYaoWByuWQREPeEpcOvaDBYj
	82AdaooOHsk5Df8wOiPo3vZLHeWXJv08Dlo68st6cOUJDrKcs/G7tazVW1pGabc/BSK6CXShpkAIy
	QpcgmRxa4zMpY3kDkNcf/UVNb5NwU84IKEdXv44/ftZmbzxtufPKwMuvGenkeC7Mvony7Gugkut7e
	i6c/bcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVj9g-0000000AZ8m-2uGU;
	Thu, 09 Jan 2025 03:24:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVj8T-0000000AZ1z-3HqW;
	Thu, 09 Jan 2025 03:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eGnPH54LSRyFRjfMNErtUz4xKItKTGUTuqn1K88a/Xo=; b=UriFXJdUkKSfWwAulEYfK4oOSS
	Dcs968TzMdF6P7h2ugIesWbgh4m+U7s84yhkCPE7YNtg7OBGGRjCgKiYyMIWaW5+Arbi4cU+ZLEkE
	0jkFbycWpXQvWG/chweiBXKy1vycWw03eJutXUgsHBe1gYR+WAkmkb6BiVLjPCYzqYLkwsTyLn5oH
	CBDVrupIqoWbnW0sZcCqH6OWj3rsU/u89hLdXQxXeZaniaisqLYlJtCNjRB52g1WnQxIr9xYEpKSw
	4rVUYfdsYsII5EvCmokCMUXd3aGB+JsoVQeDgoOycOFEM3c9xqdeOfGjH920hIox1McSLnXlc0s/M
	0dBAmbvA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVj8Q-00000009U0U-2gar;
	Thu, 09 Jan 2025 03:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2D5E5C5851;
	Thu,  9 Jan 2025 03:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3FCC4CEEC;
	Thu,  9 Jan 2025 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736392977;
	bh=UK4Z7qZ2n3DHOwfe1/RSpWrSJ+hABJq4TrbP8dFCHbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=my1iiEIXhKbbCPWnQayM2Jb/3gnxaDwAXkWHNpWKa+vWn0OkMn3IPlAS/cXTcFJEA
	 nMCEZBQhNKWHHygacyYEY/upkop0UkXwgrqtpm9pZ5kvcMewJSGZumqTNJi/5N070u
	 Y200NC0tYWn3yzZLCr4zNATvv0p9T9e3jxKqlWSAf3diWoxYt4QqEpDcKhz/qlaxII
	 2VQLz3AO4v6GZ9h54B6fZZfPzF6iL0xjqqCGJIoQPHcTDjdXzFQsfpuGbSbTXc88fK
	 wtuOvcgel2cecwFDrYKuTLknwbZOwMyXY/stJbNr7RhTuvPWkcNuxn6vhImsF7KkeY
	 3JNLFfyuMMrNg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso616885a12.1;
        Wed, 08 Jan 2025 19:22:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMB9PBSthPyP9jYsqo6/fRUE1TyzkIU3u2X8kkQPOJC9oou1mMUkCOL5SrBnKj7ADLlHY1wa60JhTszEM=@lists.infradead.org, AJvYcCXOFkSlNwl2Q8AFOSlmTaFRN6U10b5xMYmsvyjwFKcC50y/Y4o2F2EtgOhGgoxqt9RblhM4tXqNxylQ91A/7ixJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbUebOnAEMe7n2ZZfQtk2MgfpJ7O3+hvGQlNwuF1QhFMfKT9d+
	8AElS/vIEM4qJQjym8CgrYfUHE2m4prZ5uKWimI8Jv8/wOKGB27mhrciPr9Et6jRkzStcebPDBY
	hLgf51L4xH1tCgwrZAT7ARhECejI=
X-Google-Smtp-Source: AGHT+IF2vfwWk/hX1fppoOgb3+DWHmntV4ZAONyRFvI6o1pxOXRZKk7PnjDU1irlzVBy8ipamhJ7KiIEeYXxp0Ftx84=
X-Received: by 2002:a05:6402:3225:b0:5d3:bab1:513f with SMTP id
 4fb4d7f45d1cf-5d972e178cbmr4906639a12.18.1736392976133; Wed, 08 Jan 2025
 19:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com> <20250108-perf_syscalltbl-v6-3-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-3-7543b5293098@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Jan 2025 11:22:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQFq41rpBMsEodungBHPbzd2zn9F02fB6dJxnYAr81HJg@mail.gmail.com>
X-Gm-Features: AbW1kvaPnl9RqcyhYmWgfOMmK2I_eaC06_BB36DSFhf4vdK4RFvF9kDCvTmwHLc
Message-ID: <CAJF2gTQFq41rpBMsEodungBHPbzd2zn9F02fB6dJxnYAr81HJg@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] perf tools: csky: Support generic syscall headers
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032303_037359_31B52768 
X-CRM114-Status: GOOD (  16.30  )
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

On Thu, Jan 9, 2025 at 10:36=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> csky uses the generic syscall table, use that in perf instead of
> requiring libaudit.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
LGTM! Thx

For c-sky part.

Acked-by: Guo Ren <guoren@kernel.org>

> ---
>  tools/perf/Makefile.perf                              | 2 +-
>  tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
>  tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
>  tools/perf/arch/csky/include/syscall_table.h          | 2 ++
>  4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 44b9e33b9568f638ba12ad688833fdb661c16c16..3fe47bd21c0ea39473c584c82=
383ca5d4daf580f 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -311,7 +311,7 @@ FEATURE_TESTS :=3D all
>  endif
>  endif
>  # architectures that use the generic syscall table
> -generic_syscall_table_archs :=3D riscv arc
> +generic_syscall_table_archs :=3D riscv arc csky
>  ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
>  include $(srctree)/tools/perf/scripts/Makefile.syscalls
>  endif
> diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch=
/csky/entry/syscalls/Kbuild
> new file mode 100644
> index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb=
1aca890fe929a13
> --- /dev/null
> +++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +syscall-y +=3D syscalls_32.h
> diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tool=
s/perf/arch/csky/entry/syscalls/Makefile.syscalls
> new file mode 100644
> index 0000000000000000000000000000000000000000..ea2dd10d0571df464574a9c02=
32ada0ac1f79a3f
> --- /dev/null
> +++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +syscall_abis_32 +=3D csky time32 stat64 rlimit
> diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/ar=
ch/csky/include/syscall_table.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4c942821662d95216765b176a=
84d5fc7974e1064
> --- /dev/null
> +++ b/tools/perf/arch/csky/include/syscall_table.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/syscalls_32.h>
>
> --
> 2.34.1
>


--=20
Best Regards
 Guo Ren

