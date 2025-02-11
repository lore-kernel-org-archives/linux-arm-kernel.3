Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B225C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LJOvaQN1uD4Gb9j8aBY0XDTg/U6cKrEXmin878seh4=; b=Kcp1qHNySaeYOU7dSwWV/17t3x
	gtIQThGG6fmr0wcSCL+GgoA4hoY8uq/0yDqtty9xfsR56Qxsj34fyEuLY5GvVU2TPJnH0Gv40B/pM
	b/7wJEuODllDUUG1nQKDr985sHslav0Ufz5VfQvH67Wwv2EgAgBmFvLLuUlAD0CnyS6VR9RNn59n8
	/rl+LyifJ3iTc4oSvMJHHl9NFCiG2GO8es3wjR6qqP8AiOavFSsz1QWLz/IOGHu8U7aWLWB9VCPms
	pzM0qWCc5NhNmZamvoliTjSV4UZf7jgyo/VSeC/UD4qze38JEJL0jIE41fEWu47ORFaRMjleQYGKz
	ML0Xu1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thyri-00000005ULr-22sW;
	Tue, 11 Feb 2025 22:36:26 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thyqI-00000005UDS-1bOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:34:59 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d05815e89dso14545ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 14:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739313297; x=1739918097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LJOvaQN1uD4Gb9j8aBY0XDTg/U6cKrEXmin878seh4=;
        b=XCgC7zTZ1fqAdSSPXTTG+m7YDsyH7TYKkx10ZH7yGIMM5lxl9VmEx7rIo5/JAz5nYg
         la3JZyIb9rxQuj1BzlWJlbcaR07rvCRokjdht+7dMuWzfMl5zCIQsx9BUVF6X26aOwMV
         wZWTxwYbJcDI+NOrhpdgh5mQhG1wSrYi1ohW1pr9aVBfkMGZfjlXa65behTKuykznmSe
         hJMotGq9MaAoxpb72bskprlceSI1YrkOH2m57IGYQaaiPdiTsdWA5RI/fhIoXmeR0Mwb
         XbG2perFieY/ezwC/imqf5/V9L9vjqV4O7C1Dz3ak87CiqhhmtwIUXCH2XM+hCgoTlM4
         Whyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739313297; x=1739918097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LJOvaQN1uD4Gb9j8aBY0XDTg/U6cKrEXmin878seh4=;
        b=HHyj2ZKYkBQxeBCC3NhyxbFR7u5epd7h4ZgIpCod3XF3ZAzz0T6H9JhYhMXwbavlts
         yRaiaXP6KmO/DApNBbT9Y7xNcq0bvlREOo2WysjmCK7cahZytyDzH4lGuCVJ8h3MO0L9
         tg6+RRhC8QzwGdu+L0RgHYnIIdXlAlwIPiHuiuBJUP5nE6xki2lBk4MLoADNh1HwM1EP
         JcZUaOWCcWh9OSc7UnRFsgLlRgU7GD5bp0k8kj86PylpUG8mn3IzcKhfpr7BswKDZD9x
         gWLQOjIbTdW9wc6NChuFLpSS+DiubNK9Ahxq7uHEqqBJNY0PO+BE85ZrONTW5qPpF6TZ
         fZKg==
X-Forwarded-Encrypted: i=1; AJvYcCXaDWte4yeh0JQUxVJEIR5LXgQ6j9VLjSg3/WA4fAJqgX6aRthVGTy/YdgmnDNWDBsGH9EcPiyxTqabatUbPXKD@lists.infradead.org
X-Gm-Message-State: AOJu0YwEMc0Gq8srJLqoWNM9LC41FGpFVjW6A456drrw2guVrki8W7Fi
	oKZexognh00zKY1NaSx7VrNa27UwyBj53qnobJSDObhdo8GPyvq8QEMmg/rOxM96YVA4IGd2IiP
	tPkcxBxR/Cd56aDk0raVGj6WRL73teTS+Xix2
X-Gm-Gg: ASbGnctxx3RRRXB9oIuZ4pvBbt4fvVqANyuE9wu8lvj0d9xyngEpYQKsxhjTTTIYBMP
	LfrYILJesr7bCR5EqC32W1G4SfBRjbIZQ2HXCnvbkl+Lbv+fQIuGmGfdfgAZGoDUhd+Khu/pX4G
	CU7yYUjDVCzi7QISPRyj9hmIOu
X-Google-Smtp-Source: AGHT+IFpq/X6sl+JYhqIrdvJS3oHdPv0NT2XLFxyoKOkSWcjaLA3F0FA/5h+ObyGxJaY07ihxeweG2UjHT8idfOSfTE=
X-Received: by 2002:a05:6e02:1c03:b0:3cf:a4e4:8f89 with SMTP id
 e9e14a558f8ab-3d17cd5f2a3mr1050775ab.4.1739313297203; Tue, 11 Feb 2025
 14:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20250205121555.180606-1-leo.yan@arm.com>
In-Reply-To: <20250205121555.180606-1-leo.yan@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 14:34:46 -0800
X-Gm-Features: AWEUYZlxuKPWdrL07IcP7PrJXbaGbljBlIOoo18dt_4E8e3ScRzR3nTGDqPPcv8
Message-ID: <CAP-5=fUH6X2F5S5eH+iU+-hT0vNvMKPTqbGt=E9W06sG=MzxEg@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] perf script: Refactor branch flags for Arm SPE
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Graham Woodward <graham.woodward@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_143458_425484_DBC89710 
X-CRM114-Status: GOOD (  16.36  )
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

On Wed, Feb 5, 2025 at 4:16=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> This patch series refactors branch flags for support Arm SPE.  The patch
> set is divided into two parts, the first part is for refactoring common
> code and the second part is for enabling Arm SPE.
>
> For refactoring branch flags, the sample flaghs are classified as branch
> types and events.  A program branch type can be conditional branch,
> function call, return or expection taken.  A branch event happens when
> taking a branch.  This series combines branch types and the associated
> events to present a sample flag.
>
> The second part is to enable Arm SPE's sample flags for expressing
> branch types and events, and support branch stack.
>
> Patches 01 - 03 are to refactor branch types and branch events.
> Patches 04, 05 extend to support not-taken event.
>
> Patches 06 - 09 enables branch flags in Arm SPE.  This allows to print
> out sample flags for samples.
>
> Patch 10 supports branch stack for Arm SPE.  Patch 11 is an enhancement
> for PBT feature.
>
> Before:
>   perf record -e arm_spe_0/load_filter=3D1,store_filter=3D1,branch_filter=
=3D1/ \
>     -- ~/perf-c2c-usage-files/false_sharing.exe 1
>   perf script --itrace=3Di1ibl -F,+flags,+addr,+brstack
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                                   branch:   jmp                   ffffc0fa=
d9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                             instructions:   jmp                   ffffc0fa=
d9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                                   branch:   jmp                   ffffc0fa=
d98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                             instructions:   jmp                   ffffc0fa=
d98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                                   branch:   br miss                   ffff=
8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu=
/libnuma.so.1.0.0)
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                             instructions:   br miss                   ffff=
8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu=
/libnuma.so.1.0.0)
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                                   branch:   br miss                   ffff=
826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.s=
o)
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                             instructions:   br miss                   ffff=
826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.s=
o)
>    false_sharing.e  414489 [005] 775348.899298:          1               =
                             instructions:                                 =
       0 ffffc0fadaad6124 mas_walk+0x274 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899300:          1               =
                             instructions:                                 =
       0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899301:          1               =
                             instructions:                                 =
       0 ffffc0fad98c3dcc __sync_icache_dcache+0x5c ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899301:          1               =
                                   branch:   jmp                   ffffc0fa=
d9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899301:          1               =
                             instructions:   jmp                   ffffc0fa=
d9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899306:          1               =
                             instructions:                                 =
       0 ffffc0fad9b3f184 filemap_map_pages+0x178 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899307:          1               =
                                   branch:   jmp                   ffffc0fa=
d9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899307:          1               =
                             instructions:   jmp                   ffffc0fa=
d9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899307:          1               =
                             instructions:                                 =
       0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899308:          1               =
                                   branch:   jmp                   ffffc0fa=
d9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899308:          1               =
                             instructions:   jmp                   ffffc0fa=
d9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899310:          1               =
                                   branch:   jmp                   ffffc0fa=
d98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899310:          1               =
                             instructions:   jmp                   ffffc0fa=
d98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms])
>    ...
>
> After:
>   perf script --itrace=3Di1ibl -F,+flags,+addr,+brstack
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                                   branch:   return                ffffc0fa=
d9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms]) 0xffff=
c0fad98b2c68 ([kernel.kallsyms])/0xffffc0fad9ef3d68 ([kernel.kallsyms])/P/-=
/-/5/RET/-
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                             instructions:   return                ffffc0fa=
d9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms]) 0xffff=
c0fad98b2c68 ([kernel.kallsyms])/0xffffc0fad9ef3d68 ([kernel.kallsyms])/P/-=
/-/5/RET/-
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                                   branch:   jcc/not_taken/        ffffc0fa=
d98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms]) 0xffff=
c0fad98b3704 ([kernel.kallsyms])/0xffffc0fad98b3708 ([kernel.kallsyms])/PN/=
-/-/6/COND/-
>    false_sharing.e  414489 [005] 775348.899294:          1               =
                             instructions:   jcc/not_taken/        ffffc0fa=
d98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms]) 0xffff=
c0fad98b3704 ([kernel.kallsyms])/0xffffc0fad98b3708 ([kernel.kallsyms])/PN/=
-/-/6/COND/-
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                                   branch:   return/miss/              ffff=
8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu=
/libnuma.so.1.0.0) 0xffff8266dafc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.=
0.0)/0xffff8266da60 (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)/M/-/-/12/=
RET/-
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                             instructions:   return/miss/              ffff=
8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu=
/libnuma.so.1.0.0) 0xffff8266dafc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.=
0.0)/0xffff8266da60 (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)/M/-/-/12/=
RET/-
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                                   branch:   jcc/miss,not_taken/       ffff=
826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.s=
o) 0xffff826a44e8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)/0xffff826a44ec (/=
usr/lib/aarch64-linux-gnu/ld-2.31.so)/MN/-/-/23/COND/-
>    false_sharing.e  414489 [005] 775348.899297:          1               =
                             instructions:   jcc/miss,not_taken/       ffff=
826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.s=
o) 0xffff826a44e8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)/0xffff826a44ec (/=
usr/lib/aarch64-linux-gnu/ld-2.31.so)/MN/-/-/23/COND/-
>    false_sharing.e  414489 [005] 775348.899298:          1               =
                             instructions:                                 =
       0 ffffc0fadaad6124 mas_walk+0x274 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899300:          1               =
                             instructions:                                 =
       0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899301:          1               =
                             instructions:                                 =
       0 ffffc0fad98c3dcc __sync_icache_dcache+0x5c ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899301:          1               =
                                   branch:   jmp                   ffffc0fa=
d9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms])=
 0xffffc0fad9ba99c0 ([kernel.kallsyms])/0xffffc0fad9ba7f24 ([kernel.kallsym=
s])/P/-/-/8//-
>    false_sharing.e  414489 [005] 775348.899301:          1               =
                             instructions:   jmp                   ffffc0fa=
d9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms])=
 0xffffc0fad9ba99c0 ([kernel.kallsyms])/0xffffc0fad9ba7f24 ([kernel.kallsym=
s])/P/-/-/8//-
>    false_sharing.e  414489 [005] 775348.899306:          1               =
                             instructions:                                 =
       0 ffffc0fad9b3f184 filemap_map_pages+0x178 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899307:          1               =
                                   branch:   jcc/not_taken/        ffffc0fa=
d9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms]) 0xff=
ffc0fad9b3d7ac ([kernel.kallsyms])/0xffffc0fad9b3d7b0 ([kernel.kallsyms])/P=
N/-/-/15/COND/-
>    false_sharing.e  414489 [005] 775348.899307:          1               =
                             instructions:   jcc/not_taken/        ffffc0fa=
d9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms]) 0xff=
ffc0fad9b3d7ac ([kernel.kallsyms])/0xffffc0fad9b3d7b0 ([kernel.kallsyms])/P=
N/-/-/15/COND/-
>    false_sharing.e  414489 [005] 775348.899307:          1               =
                             instructions:                                 =
       0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
>    false_sharing.e  414489 [005] 775348.899308:          1               =
                                   branch:   jcc                   ffffc0fa=
d9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms]) 0xffffc0fad9ef3d=
70 ([kernel.kallsyms])/0xffffc0fad9ef3da4 ([kernel.kallsyms])/P/-/-/20/COND=
/-
>    false_sharing.e  414489 [005] 775348.899308:          1               =
                             instructions:   jcc                   ffffc0fa=
d9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms]) 0xffffc0fad9ef3d=
70 ([kernel.kallsyms])/0xffffc0fad9ef3da4 ([kernel.kallsyms])/P/-/-/20/COND=
/-
>    false_sharing.e  414489 [005] 775348.899310:          1               =
                                   branch:   jmp                   ffffc0fa=
d98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms]) 0xffffc0fa=
d98a159c ([kernel.kallsyms])/0xffffc0fad98a2158 ([kernel.kallsyms])/P/-/-/5=
//-
>    false_sharing.e  414489 [005] 775348.899310:          1               =
                             instructions:   jmp                   ffffc0fa=
d98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms]) 0xffffc0fa=
d98a159c ([kernel.kallsyms])/0xffffc0fad98a2158 ([kernel.kallsyms])/P/-/-/5=
//-
>    ...

Reviewed-by: Ian Rogers <irogers@google.com>

Built and tested (on x86). A little strange patch 5 adds a new bit not
at the end, but "Sample parsing" test wasn't broken so looks like it
is good. I was surprised the use of value in the union:
```
struct branch_flags {
union {
u64 value;
struct {
u64 mispred:1;
u64 predicted:1;
...
```
didn't get broken. Perhaps there's an opportunity for additional tests.

Thanks,
Ian


> Leo Yan (11):
>   perf script: Make printing flags reliable
>   perf script: Refactor sample_flags_to_name() function
>   perf script: Separate events from branch types
>   perf script: Add not taken event for branches
>   perf script: Add not taken event for branch stack
>   perf arm-spe: Extend branch operations
>   perf arm-spe: Decode transactional event
>   perf arm-spe: Fill branch operations and events to record
>   perf arm-spe: Set sample flags with supplement info
>   perf arm-spe: Add branch stack
>   perf arm-spe: Support previous branch target (PBT) address
>
>  tools/perf/builtin-script.c                   |  30 ++--
>  .../util/arm-spe-decoder/arm-spe-decoder.c    |  23 ++-
>  .../util/arm-spe-decoder/arm-spe-decoder.h    |  11 +-
>  .../arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 +-
>  .../arm-spe-decoder/arm-spe-pkt-decoder.h     |  12 +-
>  tools/perf/util/arm-spe.c                     | 135 ++++++++++++++++++
>  tools/perf/util/branch.h                      |   3 +-
>  tools/perf/util/event.h                       |  12 +-
>  tools/perf/util/trace-event-scripting.c       | 116 +++++++++++----
>  tools/perf/util/trace-event.h                 |   2 +
>  10 files changed, 307 insertions(+), 51 deletions(-)
>
> --
> 2.34.1
>

