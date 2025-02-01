Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C034AC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIefE9I0jaBGB4Y4mTk2FVVd4hcyxumz66eayz6AufQ=; b=SakbO8r5jBgEuTZmremES0N7kx
	A5u2X5Rvm54UG2a6ESOPZzWQUKWl5MZZBchWftdiSV0Y92l5bWYK16TP0ez8RYV3xrALql1eLOJOo
	yUxj7qWX0wy2HOnXIHQC44usiywQ2vm3mrM6QnIu25XpW8t/kyFmrTJXfpTa3SvvmKdL7IaSU8Zps
	RjPlWO8TAzpN0MMtQcyXs22PtxYA/uOjfEWcTEidIecyxn/RRgiHq5MlcljdJ7SVqXWgf2l1Oy7lZ
	HvGP8kEsYZWHEdKBqmQ3ri5jz43ljC6tocO9pdZzI2MVP99uwSoT/r7/gdfvtfAzGVCvVRSkmXh83
	6UBYxYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te9FN-0000000C3mm-0Ldb;
	Sat, 01 Feb 2025 08:53:01 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te9E2-0000000C3hv-0b2q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 08:51:39 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a814c54742so93665ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738399897; x=1739004697; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIefE9I0jaBGB4Y4mTk2FVVd4hcyxumz66eayz6AufQ=;
        b=VyrlkMtuijJQLN3Pk7yA3oOMDtEd83ScsR9oBaP65cQ49QTvrDmaeZxU2ckOebTFtT
         Y6nFaeOrlY/UYMYa/r/cLLT9wCr33snjqfx0abQW6hzQKOz5UOLmJKwcZMYI0j8ad42S
         EA7S6ltSv9P95wFRSC8lQf3ziUt2sMuU3JTAJvg7fXrY1OQEOzWNDQxKtWk7T4wZZf7I
         UyK8Po9naM2lnDgDChNSIXeysGUiEgmYFS0Ssw3LQMDUS2luHQqRzOySdb8TpKjC3tpI
         9j1hNUITeHMv1dZD2xvX8GtGD11/QJWiwMI414PaTET59dE1fpqk50L1Tpay+uv21WOl
         LZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738399897; x=1739004697;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIefE9I0jaBGB4Y4mTk2FVVd4hcyxumz66eayz6AufQ=;
        b=pynwlHVCBkKwxUr3by3T5SEr132XKSojstY8MqZWPEsVZiynORtmc8sn6OnjVHKILM
         DrRddfyMVvgtv6xa862uWhEX9+m7dKjedRZiz7hZNfTXSkJcaQqJIYXrs7ZcQDG6uEtH
         ILdJcagdiw2QqCkYruqPul4EtN9MO/BxDFTeZ/DqlSo6reHf85iDM9PW137Vcar3uzOh
         rDBVR1/BxVNwdd4zeqzPLg79Yf0M/cM29+AtosuCWzDabbOh4JEwLIvqFSisNX7yxMuu
         cHmYjOzavc5MH4G+FYJwRYkarz7T29XEb+sIyllxRQ+o2DfQCsjXa0jKz0KpdYeyVyCV
         ewYw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7osQMg+RMWzdqmC4lNcKL22Qbt4zatGte6F1I4U0RJ7D8nJ0bC96rly5UeOKcIXYa8mq6V20rw1c79Us4jqm@lists.infradead.org
X-Gm-Message-State: AOJu0YxXPws4nuZto5cmyxC/4Y4clW8SiA2wUe2zMIc/7yVrwSrUO3Lx
	8hbJHY6ZUGKqIfprFHfPWGc6NGhyNgbr/OhOrCRENKEvgpqVsg2uXmj3lOiRgUx7oYBCNqX9SZD
	/myhPzL1H6l9AKeYQNH2fGgjKu67uLgAA8D7v
X-Gm-Gg: ASbGncun8snQluW92IDjwQP36ZrkQqY1LF3xoVKUF5aTEzfsvnkcw5AiAhFlGknQCpQ
	aeIZORiGOSoNamWvdYqCBoI5VuGEcqgrYuGXQWui3KnUJI5g9S32O6iNky0EW4wqNVntuqxZUkw
	==
X-Google-Smtp-Source: AGHT+IFhoRz5P8nIkYHneDkKTVBakh7rtHG1dVw4obSdcvgjm+5z3V7T8nuKUGr47wUBBSm2PXOEjroFbF04NpvDEJE=
X-Received: by 2002:a05:6e02:1807:b0:3cf:c8b9:8826 with SMTP id
 e9e14a558f8ab-3d020178ad0mr2457485ab.10.1738399896951; Sat, 01 Feb 2025
 00:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com>
In-Reply-To: <20250201071455.718247-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Sat, 1 Feb 2025 00:51:25 -0800
X-Gm-Features: AWEUYZlh_7DpL4vGIxHF0oRogbUtw7xXXY8ZKrPktMrlaINtX7JtLXsF90u6VZI
Message-ID: <CAP-5=fVJPAEhvyV_dPHSHKJVeskCf_paFSP6V4EWmEyqACeA-w@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the build
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_005138_183185_51DD2905 
X-CRM114-Status: GOOD (  18.47  )
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

On Fri, Jan 31, 2025 at 11:15=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> This work builds on the clean up of system call tables and removal of
> libaudit by Charlie Jenkins <charlie@rivosinc.com>.
>
> The system call table in perf trace is used to map system call numbers
> to names and vice versa. Prior to these changes, a single table
> matching the perf binary's build was present. The table would be
> incorrect if tracing say a 32-bit binary from a 64-bit version of
> perf, the names and numbers wouldn't match.
>
> Change the build so that a single system call file is built and the
> potentially multiple tables are identifiable from the ELF machine type
> of the process being examined. To determine the ELF machine type, the
> executable's header is read from /proc/pid/exe with fallbacks to using
> the perf's binary type when unknown.
>
> Remove some runtime types used by the system call tables and make
> equivalents generated at build time.
>
> Ian Rogers (7):
>   perf syscalltble: Remove syscall_table.h
>   perf trace: Reorganize syscalls
>   perf syscalltbl: Remove struct syscalltbl
>   perf thread: Add support for reading the e_machine type for a thread
>   perf trace beauty: Add syscalltbl.sh generating all system call tables
>   perf syscalltbl: Use lookup table containing multiple architectures
>   perf build: Remove Makefile.syscalls

If you are looking for the improvement this series achieves, patch 6
has sample before and after output:
https://lore.kernel.org/lkml/20250201071455.718247-7-irogers@google.com/

Thanks,
Ian

