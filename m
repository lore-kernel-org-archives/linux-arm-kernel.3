Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E4BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3kgZdZGe15qcgbvjAtESEFU8KlhQRc0to8H1amWHdU=; b=dUEwrlgfgiCsvCuNouxqL78KOH
	QyD8Cux0EKMeV4Q1HSj0qOPLVsJ/8CYpR2fUB+XBr3c8nJnT0FrmGm4LUJXqdWERknj8XcYZWKilD
	97Iywcgw8C6vhIqul7y1rAPC2a421Mdmtf9s3tXa3ZWOmuwSK/BI/enF0xR20pKhn6cSfjPZBqmrl
	n8wF6U2uQ6EOycTaOTAjjs+ZlEPeNLx9Mp8iIIUbBiL2ytHTT5uwEC/7DSJX4vAkrZvylNzlFHiSc
	6uSKXAWp5anx7WtDXf+t5qWxwYPCt8ThQVYPPQrTZ063pVJArSsOy4L0/Y4C+s6rtZ2JAMk6i5ok1
	o7xbkU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visDV-00000006u4i-1lZj;
	Thu, 22 Jan 2026 10:47:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visDU-00000006u4V-372z
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p3kgZdZGe15qcgbvjAtESEFU8KlhQRc0to8H1amWHdU=; b=CDc+yModpc6ZEnE0JsVTwlE3hB
	QzKwZkKE+8L/GRhUFyLCLuZTQjmsqlTBlla2gszfIM9cNtRaLJz3sTk6Nc6GkvDYQd/ULAK+e8fwq
	ilnMmQpcwMg4hxWlMcY0gOsGBmJ3ec7hr2sbB40hsI7n5+Et1/QW5pXJaFSTOGhQkD1Jn5Gubwsdg
	eGQG0ngRQVoETF/k965oQMLkfF/dPWjLgU/ASLfEn94thivR1j1s28OuGon+tYItRMxqRjwkuUObo
	G/A8AiR2biw73vlamo9r619NXTldRZiEVzk7olwEzjsgtm2Wql5kv6mMLbL97mbBbRC5SU6mX1NJw
	9yR3Sb2w==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visDR-00000000AsE-2FzD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:47:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fbc544b09so571544f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769078824; x=1769683624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p3kgZdZGe15qcgbvjAtESEFU8KlhQRc0to8H1amWHdU=;
        b=MzgCm7niM21Tf/N1gQAvCN6ZYiNM49m5izNq6V2RKP9VywgafyRVbEWiYOlhgR3JuH
         rptP4k2d7Ku3pCqQmmb8aB29oOAei9HPatzztQKq+uXunLsE7TeSeYgV26Z8pboYyPbp
         Cz3Nrs87vp4bVfc1AHHLD7m5SihgNAg/iVhxweGHf3LGlFeX1mhdWfOXK18NAWO8N58B
         KN30TMRaHL+Io6ond/3bAUz/bX1wawyW9iNZlGvlr1eK7SPtl2Rg1eQO7yv6unySVdcM
         NxLXksPzs0ObHeVQO1sJagvtgGnySmCJmVwSiCGQ8vSB4gaaEPNjaZnQHcCATeiMZRW9
         xbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078824; x=1769683624;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3kgZdZGe15qcgbvjAtESEFU8KlhQRc0to8H1amWHdU=;
        b=wI/P9axBDFTRvIH0vNiH0ble/i/wX+dyaEMhNwBVyB6jlGvAs+vM/C4q5a6AknG9FQ
         1xqD+4uXdqGlFyI5zdOuquBz1RnE/D02d8yEaxOlXDCicc6ket2pVEcXOplWUZsAUpTJ
         uQGduwTn7I+4vSZ0xwFTSQ7to0oqrMBR9ueaA1GOGtIjo0qepdnaaU+ifAPzMf/AAgl3
         A9R66wCrbBet4TZSWOwWVL7SDVKhshNSOvtUbW9Wwgjbdk+JwFfIUIa6k2ALVd83vMsC
         CyKF0h9fCQY0KHWc2PpGG4eOhVTM7BwmjGtMGWigg2AmaQn/xnr/iwJtrdkSmAG9eOn+
         AWsw==
X-Forwarded-Encrypted: i=1; AJvYcCWJSgVTyvqnMuTSu7/AdV3jHHH9X7XFodZ/gA5vFfdliqHJxt0pZM9qey/TwgMAD2kEZIUykXgGucTc74SRVmuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJCYmtRqyXa1ME5NQ1RJy9dbBc7c9QiWX6pijkTAFz5ZxXWT/O
	Ih5aqFhxS/FZikaBYobpIT4ne47m6eVx8sWqVDCdD7e4d52MREDAfqv+IlRsCVbRLWY=
X-Gm-Gg: AZuq6aIK7hopjf01aATBE7ibN57yE1eOmhob0+0m/6iSfnFCxyZwvZXPblIPy8xKKMo
	Y31EA7EP5KSld2aTL5uv+2VHa3dm+itTZCOW1QRPaLJV9R4Pzh3SR4ST8qQ+K9nCvExfvFkxagD
	PIjqSHOxHkQ4vUapS2KpzJo0awZ51/W13Dzrnr0An2qIK1pbA4vvpdUc5gcTgT1fEWazUT9U4t2
	lcMM2b6XW1grxgkGuOIWupAywQqWJADJdVKiQsGDg7FK33IoEiHE+tkTWJEsyTBoLBBMnwpsGPR
	LyX+RgYz+NV2EnpbpAIFXctO3wGVsv/MqORHLMzyNksFsX2gXoouqQUbAbWv3hyKekZRilhnYLP
	SJ4eDKGR3Xo15MBjJR9azqfgPlnT+3/WbPCSCf7Imar9KNEelmtM3tH38yOmseLfMXhY0W0/8Sa
	Fx5tchxljasJcWtfSB
X-Received: by 2002:a05:6000:2dc5:b0:435:8f1b:bb28 with SMTP id ffacd0b85a97d-4358fe9d0fcmr12333244f8f.0.1769078823855;
        Thu, 22 Jan 2026 02:47:03 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43597719d1fsm14789146f8f.23.2026.01.22.02.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:47:03 -0800 (PST)
Message-ID: <10c875e6-6cc2-4695-a0aa-01507541daf4@linaro.org>
Date: Thu, 22 Jan 2026 10:47:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] perf annotate arch clean up
From: James Clark <james.clark@linaro.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>,
 Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall
 <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>,
 Athira Rajeev <atrajeev@linux.ibm.com>,
 Aditya Bodkhe <aditya.b1@linux.ibm.com>, Howard Chu <howardchu95@gmail.com>,
 =?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Shimin Guo <shimin.guo@skydio.com>, Sergei Trofimovich <slyich@gmail.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260122073127.375139-1-irogers@google.com>
 <9fd8375c-2de7-4305-ac3e-42ff8f919964@linaro.org>
Content-Language: en-US
In-Reply-To: <9fd8375c-2de7-4305-ac3e-42ff8f919964@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104705_799161_5E9D6AA3 
X-CRM114-Status: GOOD (  21.95  )
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



On 22/01/2026 10:43 am, James Clark wrote:
> 
> 
> On 22/01/2026 7:31 am, Ian Rogers wrote:
>> 2 initial memory leak fix patches for perf annotate.
>>
>> Move the disasm.c #included arch files into a new util/annotate-arch
>> directory. Make the code compile standalone. Try to better encapsulate
>> architecture specific code within the files and with a
>> arch__new_<arch> function that allows additional data to be associated
>> with the struct arch using the standard container_of trick.
>>
>> Make the lookup of struct arch use the ELF machine gather from a
>> thread rather than an evsel. For example, the evsel can't determine
>> the difference between EM_386 and EM_X86_64 so generally the latter
>> has currently been used. This means the dwarf registers are off as
>> register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
>> change map_symbol is refactored to use a struct thread rather than a
>> struct maps, the maps being obtainable from the thread.
>>
>> To make in and out arguments clearer, for safety, etc. try to constify
>> struct arch and its related structs.
>>
> 
> Hi Ian,
> 
> I get this crash, not sure which commit causes it exactly but it 
> happened 2/2 times on both x86 and arm:
> 
>   $ perf record -- true
>   $ perf report
> 
>   < Select first sample >
>   < Select annotate >
> 
> perf: Segmentation fault
> -------- backtrace --------
>      #0 0x5df8f58ba973 in ui__signal_backtrace setup.c:110
>      #1 0x74373a642520 in __restore_rt libc_sigaction.c:0
>      #2 0x5df8f5963f0d in dso__kernel dso.h:532
>      #3 0x5df8f5965d0a in __map__const_kmap map.c:627
>      #4 0x5df8f5965a36 in map__rip_2objdump map.c:531
>      #5 0x5df8f58e5bef in symbol__parse_objdump_line disasm.c:1032
>      #6 0x5df8f58e498b in symbol__disassemble_objdump disasm.c:1503
>      #7 0x5df8f58e3852 in symbol__disassemble disasm.c:1621
>      #8 0x5df8f58c638d in symbol__annotate annotate.c:1055
>      #9 0x5df8f58c8628 in symbol__annotate2 annotate.c:2209
>      #10 0x5df8f58a36b7 in __hist_entry__tui_annotate annotate.c:1189
>      #11 0x5df8f58adf86 in do_annotate hists.c:2488
>      #12 0x5df8f58ad762 in evsel__hists_browse hists.c:3441
>      #13 0x5df8f58b78f2 in perf_evsel_menu__run hists.c:3556
>      #14 0x5df8f58adabc in __evlist__tui_browse_hists hists.c:3643
>      #15 0x5df8f58abf3b in evlist__tui_browse_hists hists.c:3691
>      #16 0x5df8f571ac3a in report__browse_hists builtin-report.c:688
>      #17 0x5df8f5719943 in __cmd_report builtin-report.c:1177
>      #18 0x5df8f57181bc in cmd_report builtin-report.c:1890
>      #19 0x5df8f57b5c3a in run_builtin perf.c:348
>      #20 0x5df8f57b53b3 in handle_internal_command perf.c:398
>      #21 0x5df8f57b5b2f in run_argv perf.c:445
>      #22 0x5df8f57b5091 in main perf.c:551
>      #23 0x74373a629d90 in __libc_start_call_main libc_start_call_main.h:58
>      #24 0x74373a629e40 in __libc_start_main@@GLIBC_2.34 libc-start.c:128
>      #25 0x5df8f56ead35 in _start perf[55d35]
> 
> 

Also the annotate test fails:

  $ sudo perf test 74
  74: perf annotate basic tests                       : FAILED!


>> Ian Rogers (11):
>>    perf maps: Fix reference count leak in maps__find_ams
>>    perf annotate: Fix args leak of map_symbol
>>    perf disasm: Constify use of struct arch
>>    perf disasm: Constify use of struct ins_op
>>    perf disasm: Constify use of struct ins
>>    perf disasm: Rework the string arch__is to use the ELF machine
>>    perf disasm: Don't include C files from the arch directory
>>    perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
>>    perf map_symbol: Switch from holding maps to holding thread
>>    perf disasm: Refactor arch__find and initialization of arch structs
>>    perf disasm: Minor layout tweaks for struct arch
>>
>>   tools/perf/arch/arc/annotate/instructions.c   |  11 -
>>   .../perf/arch/riscv64/annotate/instructions.c |  36 --
>>   tools/perf/ui/browsers/annotate.c             |   6 +-
>>   tools/perf/ui/browsers/hists.c                |   3 +-
>>   tools/perf/util/Build                         |   1 +
>>   tools/perf/util/addr_location.c               |   4 -
>>   tools/perf/util/addr_location.h               |   1 -
>>   tools/perf/util/annotate-arch/Build           |  11 +
>>   tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
>>   .../annotate-arch/annotate-arm.c}             |  48 +-
>>   .../annotate-arch/annotate-arm64.c}           |  59 +--
>>   .../annotate-arch/annotate-csky.c}            |  29 +-
>>   .../annotate-arch/annotate-loongarch.c}       |  57 ++-
>>   .../annotate-arch/annotate-mips.c}            |  29 +-
>>   .../annotate-arch/annotate-powerpc.c}         | 125 +++++-
>>   .../util/annotate-arch/annotate-riscv64.c     |  41 ++
>>   .../annotate-arch/annotate-s390.c}            |  59 ++-
>>   .../annotate-arch/annotate-sparc.c}           |  26 +-
>>   .../annotate-arch/annotate-x86.c}             |  89 ++--
>>   tools/perf/util/annotate-data.c               |  12 +-
>>   tools/perf/util/annotate-data.h               |   2 +-
>>   tools/perf/util/annotate.c                    |  88 ++--
>>   tools/perf/util/annotate.h                    |  10 +-
>>   tools/perf/util/callchain.c                   |  12 +-
>>   tools/perf/util/capstone.c                    |  18 +-
>>   tools/perf/util/db-export.c                   |   1 -
>>   tools/perf/util/disasm.c                      | 424 +++++++-----------
>>   tools/perf/util/disasm.h                      |  95 ++--
>>   tools/perf/util/event.c                       |   2 -
>>   tools/perf/util/hist.c                        |  18 +-
>>   tools/perf/util/llvm.c                        |   8 +-
>>   tools/perf/util/machine.c                     |  13 +-
>>   tools/perf/util/map_symbol.c                  |   5 +-
>>   tools/perf/util/map_symbol.h                  |   3 +-
>>   tools/perf/util/maps.c                        |   1 +
>>   tools/perf/util/sort.c                        |   2 +-
>>   tools/perf/util/unwind-libdw.c                |   2 +-
>>   tools/perf/util/unwind-libunwind-local.c      |   2 +-
>>   38 files changed, 752 insertions(+), 619 deletions(-)
>>   delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
>>   delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
>>   create mode 100644 tools/perf/util/annotate-arch/Build
>>   create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
>>   rename tools/perf/{arch/arm/annotate/instructions.c => util/ 
>> annotate-arch/annotate-arm.c} (59%)
>>   rename tools/perf/{arch/arm64/annotate/instructions.c => util/ 
>> annotate-arch/annotate-arm64.c} (70%)
>>   rename tools/perf/{arch/csky/annotate/instructions.c => util/ 
>> annotate-arch/annotate-csky.c} (67%)
>>   rename tools/perf/{arch/loongarch/annotate/instructions.c => util/ 
>> annotate-arch/annotate-loongarch.c} (66%)
>>   rename tools/perf/{arch/mips/annotate/instructions.c => util/ 
>> annotate-arch/annotate-mips.c} (59%)
>>   rename tools/perf/{arch/powerpc/annotate/instructions.c => util/ 
>> annotate-arch/annotate-powerpc.c} (73%)
>>   create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
>>   rename tools/perf/{arch/s390/annotate/instructions.c => util/ 
>> annotate-arch/annotate-s390.c} (70%)
>>   rename tools/perf/{arch/sparc/annotate/instructions.c => util/ 
>> annotate-arch/annotate-sparc.c} (85%)
>>   rename tools/perf/{arch/x86/annotate/instructions.c => util/ 
>> annotate-arch/annotate-x86.c} (93%)
>>
> 


