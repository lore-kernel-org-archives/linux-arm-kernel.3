Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD529D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=; b=K+2vPJlMVEwb8BPP1mTF/ZbEoi
	oNyUgPswH33mPhzwgOBEhyXY3jsNYEA2cKh1YOGV51EFCRoO60D17uyfaTDYkdlTkiXWBJFR2cQmj
	kJB2sCadgrsLlb8aXs/btgTNI3T4/azpfepCnH+oamB8BNxUoR6gkZiExDM9Xl60ZuMimjjEDkFxS
	6qwu8+7+sk69E4lsDpY4bn3L4nWXLwLDOaK4sPSTldILUiZnHi6KfB3bnmcpnXro4jMq+reDO+Gnx
	FL/RuSdjBU9b6S1T8dlSX2CoVRrG/R1uLAtoHGDuZZPOMvCn8MqjiOtPjHYfw+/MfMiWygJkuXssN
	5QbAYaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSM6-00000004zSZ-1NUo;
	Wed, 21 Jan 2026 07:10:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSM3-00000004zRl-2RoY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:10:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a76b39587aso60985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 23:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768979414; cv=none;
        d=google.com; s=arc-20240605;
        b=A3h8NnQRt4q1XvB7tl6ZMUdqQ1LnMi4Kj/m4HSLBYNqxrrQmje3uvjN7VNMId1uA0a
         m7NrWmJTcd3mIf6UO0foQS9qIy7rHrEeOqNEK1mJaRfKtdSWlXi3ObCYtpWFM8Dli5I+
         zcGwPu0/9pmofk3wwaF/asTYa53989qQu0pUJi/1O4m43SbXFhvIJxhNuPXY8L2jpKhl
         XfGa5Z5CkiCC3iRSsXQhREYDE96JuJK23a0wiG+XokK8w/BY+emLxRX3qqxJR+O/bjak
         sviisGlVY7tthJy2IZlMCPdv0OYv7yCslW+QjpgjD6ZWdjl0JXvomlckcmJwSyGdFBEr
         tzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        fh=zTt9z6AvVojXQpThASrZxdGKCtoV8TdWL5HQRDpEItU=;
        b=SfeuPOFECC8/uzIlbL3OqLcCa5RUQ723W1JnkGaJA2Qh6ldcvDb2qpRumF/6guvqot
         YtYknf2o+1x+ThIxvCpA+rwbKU2g+1RhwL6zpZUCkYz0MnYHQ2H/r3dPHGLWgaAX4LCQ
         FSDvGEkeF8V1B1+nrePgq7/UZvA4Y/7/MresPw/7ab4EiVv8mwzBjoSgq6cte8O4bqhv
         W4aRaSNvruWsSJwdtipUUppiBTFhNBzzb9tNh510upJArFcMI7rxQ5mjVA4ILxX8ogHZ
         z26B/P0uGKTAHlu1EuVIPwhbB+N/2IY+YpewlQ5dxvWAWj6D1siOeOZPhaTUZ5sJBZi1
         lCjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768979414; x=1769584214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        b=MoVzcfKf6Qf+qaNbDNbyTl2z4yD0Ck2LviL/gNLaqQ7+0nUg7TRVDMibg5nI/QtFuk
         Pvfh5S2IfUIy84+1FMv/cGjq7ogFedetCWqYkPzR15FFhqCn4abgxRXhOTgSXZeMTTRX
         cu0LDyfnl2Xm+RsOa281O76ZfyZjjHY9oobct4sYapz0xUlFhZjD8qo/o81JaFb6SZ2R
         HhABDwk1dphz5mYsH3IMcVYJP0XoowgoFDmk/e0VpHg1QLidAc4PORkaeRN1oGgMfFGq
         5uiXgQDmFLEDw/f1qI2VWyq1ze2/M4D5bTs0rBU0ytQX349PB+CD0V8OMTTA3tmr7pzN
         Ad7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979414; x=1769584214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        b=MPb65bfteBLS3T3uPBBpln38TN4eSsDNTdV66mt0rgDt9impVcRT8v64O+1pwp7ABG
         RFZws+Gaefaq4NpZslmdh3/XKs0C68IsgUi8zEe2OImO7dpyc1PVWMIeF1XVWFwbtAao
         ZMmeWegR9RB5O5yjiFrKzq87+c9pq1vFKw9kowyadV12ygfuC6xvGC+1Yi/F9wRZiy7q
         42sF+w4mfJ6OJ+ds5HSeiloAjCVnF05Zdpmx9vSn/CF1nP0DiJzHomRfW0jIPyip+oiW
         qoy/tfUJDHm9LJ4mOygcdjRIqLRpgkxxO/pz49pHvDGtwxQA2VQRHzh3wLbWcZptybHn
         npPw==
X-Forwarded-Encrypted: i=1; AJvYcCWqTgDRxcTFWtVdlqp7PBUH6LJOUhFBJOat26Oo+G03TFUjiQa2u0Sb6N9QBaIhN5Kgau4d8GE+wobgV1WtBMrg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9G2dUlpCMAAkfgesSqLEGw8fQdXLmOtgv5tZ11KuDKLSID1R/
	kFUxzby1tCJcu1wtP9Kiw+Q1OtmRLYXDKrqnlL6ai6KD/HBi4la81ybyoKETmoK3XJN+XUwjw4l
	4ApqmsOR+n2P3W4IfFhSjSBulJzxPZnfacb2iRdhZ
X-Gm-Gg: AZuq6aJ7anx8UhpdTAxyV5BAvQwh80ZwxNI7AQIruTo3+EZpHIb0YYx3KrWMkL75qyl
	L6ZtNjmh/fjjghIGlZ3uZhvAolKaAdwkuP51Fpisn7QE7wFcA3iSZdrMNTOQy9aTUmIW9N3q+0A
	spZJ6AapD93H1EQ8f7mtgYwtUi0i8SOeTp31idqhRlkmD2EwC+jAVM18v8uZW31IMtCusglxaOx
	x7eJ7EsNVotIQ5psz/qkpugyq7cm6ZCrzLTYJVf4icfeAnmk7RPL6B+61QT+CC6CeFF5TtgzRVi
	nbQ18X0=
X-Received: by 2002:a17:902:e746:b0:290:8ecf:e9f9 with SMTP id
 d9443c01a7336-2a7a2443b58mr1503495ad.7.1768979413636; Tue, 20 Jan 2026
 23:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com> <20260117052849.2205545-9-irogers@google.com>
 <aW_OV72q5rAVrgRE@x1> <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
In-Reply-To: <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Jan 2026 23:10:01 -0800
X-Gm-Features: AZwV_Qg0iOIpO5Pzoy2b7YabxBnL-fqXhU8D44tCtQG-FBoEqke8sFeoam8z8tY
Message-ID: <CAP-5=fXUw=LLXX6Pzrab37TTrVrMdHJim1QOnvbP9gXsRQZFUg@mail.gmail.com>
Subject: Re: [PATCH v1 08/23] perf perf_regs: Switch from arch string to int e_machine
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Chun-Tse Shao <ctshao@google.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_231015_755392_82763822 
X-CRM114-Status: GOOD (  26.73  )
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

On Tue, Jan 20, 2026 at 10:58=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
>
> On 1/21/2026 2:49 AM, Arnaldo Carvalho de Melo wrote:
> > On Fri, Jan 16, 2026 at 09:28:34PM -0800, Ian Rogers wrote:
> >> The arch string requires multiple strcmp to identify things like the
> >> IP and SP. Switch to passing in an e_machine that in the bulk of cases
> >> is computed using a current thread load. The e_machine also allows
> >> identification of 32-bit vs 64-bit processes.
> >>
> >> Signed-off-by: Ian Rogers <irogers@google.com>
> >> ---
> >>  tools/perf/builtin-script.c                   |  17 ++-
> >>  tools/perf/util/evsel.c                       |  14 ++-
> >>  tools/perf/util/perf_regs.c                   | 105 +++++++++++------=
-
> > [ Include dwarf-regs.h to get conditional defines for EM_CSKY and EM_LO=
ONGARCH, not available in old distros ]
> >
> > - Arnaldo
>
> Seems the change would introduce the below building error.
>
> util/perf_regs.c: In function =E2=80=98perf_reg_name=E2=80=99:
> util/perf_regs.c:48:14: error: =E2=80=98EM_LOONGARCH=E2=80=99 undeclared =
(first use in this
> function)
>    48 |         case EM_LOONGARCH:
>       |              ^~~~~~~~~~~~
> util/perf_regs.c:48:14: note: each undeclared identifier is reported only
> once for each function it appears in
> util/perf_regs.c: In function =E2=80=98perf_arch_reg_ip=E2=80=99:
> util/perf_regs.c:114:14: error: =E2=80=98EM_LOONGARCH=E2=80=99 undeclared=
 (first use in
> this function)
>   114 |         case EM_LOONGARCH:
>       |              ^~~~~~~~~~~~
> util/perf_regs.c: In function =E2=80=98perf_arch_reg_sp=E2=80=99:
> util/perf_regs.c:143:14: error: =E2=80=98EM_LOONGARCH=E2=80=99 undeclared=
 (first use in
> this function)
>   143 |         case EM_LOONGARCH:
>       |              ^~~~~~~~~~~~
>
> It looks EM_LOONGARCH is not defined in the <elf.h> header file, not sure
> which one is better, include  dwarf-regs.h suggested by Arnaldo or direct
> add the define,
>
> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> index b58d59b84fb1..ce839df19fa3 100644
> --- a/tools/perf/util/perf_regs.c
> +++ b/tools/perf/util/perf_regs.c
> @@ -6,6 +6,10 @@
>  #include "util/sample.h"
>  #include "debug.h"
>
> +#ifndef EM_LOONGARCH
> +#define EM_LOONGARCH           258
> +#endif

Or #include <dwarf-regs.h> which I think is the fix Arnaldo is
carrying at the moment.

Thanks,
Ian

> +
>  int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
>                                  char **new_op __maybe_unused)
>  {
>
>
> >

