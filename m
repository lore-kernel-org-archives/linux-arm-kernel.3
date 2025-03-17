Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D972C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdNCS/9xpAatRym4N52MXBKwvX2+E0sdkGs47955xoE=; b=g31QTWJeIFYQWPb5f3985Z2bg6
	nkefXBeBp4IXAThPo5v1VOWH90nZERcmfT1CBqk103Re3iRAXONPFD/pq1jQ+XtmfboieIN61cHXe
	Ft0yuITBqPIxTT6kr7dtCEGx/WSFGpGwDFmYQU8DPFoI/du8YE/4KuAYAkmthZfsO8L4vh8+rhNPH
	QUwmRIqLGQDv2yK7Pot4TatP7ADjhnWbHb0EfhxIaRT1iPHw69Jrz+cLl00N9Is1JNwmn+22+fxht
	dooA/htaqlcoysgWlChn2Q9LdCYOWf0uQeZUBW+Wv1Am2/O9G3G0Do7gtDSWY34cwGwRQ+3ezTXcg
	AWtmnTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCyP-00000003GHl-2jVW;
	Mon, 17 Mar 2025 16:05:53 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCvb-00000003FfW-3bLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:03:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2242aca53efso32505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742227379; x=1742832179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdNCS/9xpAatRym4N52MXBKwvX2+E0sdkGs47955xoE=;
        b=HdAiF5I/qO7ts5qst5Tju+4ktGvfOGdx66SxV8YH4ZYN8W5G0rvrxJ3K7uBDVpmjmP
         oRMd3OuT429RcKBAIvAhvbuJxNlyZS9hx3JU/doX+En1Mn9XQ+g+TSI/Q/YcTw104BxJ
         /p8yvPQ1VgbJEC2/N3XEkSMhmqnyjtYKlBu/x4AMkmUGZLFKlvLBJjw6dPk7NLIMKLOP
         14jaMT16qrel66LH8iTkXVf6hVtM9KjdtL5/uK3vUyxzZymZBxVqpPKNroKrD5ATDCOz
         yGmo3ITg9f/8LN7Hq5qDqUYlTZ7O/WwB5XRBscqNLWau11jiCS+66BiIuPp82YCFZpP4
         DiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227379; x=1742832179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdNCS/9xpAatRym4N52MXBKwvX2+E0sdkGs47955xoE=;
        b=ehOZ/dwH3fGDmLRSVTs+/suG2kkUKhIU2hRYcvRcbGBQE2jpkFb68ahOvCW75HemdI
         QakAll4+aM57FzDRjbubA+peHYjKTcEzRQMnN6a9iN2HVsB26gqPOWw0iGOROg3VkSKa
         JVfb+zZpTqwAIurLfoLi1WGvPp/A/9gij7X1tG0sGBARTF2VVEyOF6tU7hHvz/SFMI9k
         VhHy0GBC+oNWcR6OApXnEhBEphv/kHhFsrLi2P40kx0WF4TQZWfcbdUt3IYLXd+NCD1w
         Jw2Vob9F6yUlqEMoW1TFB9B55bXCvgOum3Ir/iGNoECw4rSjQBMh8hYlKbvsTLVJ6mC6
         jVbw==
X-Forwarded-Encrypted: i=1; AJvYcCVlW3ZQuH4VmnYDAWo+3pHpq5Knz7QtRHvAsDQ7JzjvuziFhezA3YMcg6aOSRH30JXiOROjMSiaV2xtp+6e6w5T@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9h4NlTK32OMCTe3Q40xhGCk9WvdFMyQ9dYrkLzWSHIlbgiEBG
	M0sJNC9V1kMoQvc4FZfeTF1YmQYenhSfItnfwFYB3j2TXT0QnBoShW9vfAQGAxj0IXYPA2vY+L3
	NLLzjcyYoH5noFR68Pcc+oLTGhKH7wpSQY8P1
X-Gm-Gg: ASbGncsit8bmZF5BX+FAWBitcG082c1c0NpnOva+XWuaxK9hkTBqYYjLdaZL+mCPG0/
	TrB2RIY/2R7uZiCa6ewdzrdaPnFTN8cP2TsyK6DERhEyrT7xta8LRJeEBB/Cz93OTkvIlB7kIPr
	dp2oycPQVKT8BVf1K6953kWIQU9pSsR0SVpts7oaDMJoV/yRPWD07n4lYTGRkLSZXJNQ==
X-Google-Smtp-Source: AGHT+IEAppDzcZL7Ur9e3WhyGOknJuCY0ReRk7mbdSSM7RQwqO4SXSEZA07LmyI7g7KSUW3hkf9jLmbIDMKxl1QjBCo=
X-Received: by 2002:a17:902:d4cd:b0:215:9ab0:402 with SMTP id
 d9443c01a7336-225f3eb40e6mr4553645ad.18.1742227378594; Mon, 17 Mar 2025
 09:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250313033121.758978-1-irogers@google.com> <Z9TT3tGq4TJ76Tm9@google.com>
In-Reply-To: <Z9TT3tGq4TJ76Tm9@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 17 Mar 2025 09:02:47 -0700
X-Gm-Features: AQ5f1JoehPZ6D2gVoX5jyHNVwuzvDD6lGQqw81zka_NheY0KMJFzGwsbZr_YsSk
Message-ID: <CAP-5=fVhd7=r+T6iL+ZgLi6YmDUzmDq-FEdZD1XHHYzm7KtBtw@mail.gmail.com>
Subject: Re: [PATCH v2] perf libunwind: Fixup conversion perf_sample->user_regs
 to a pointer
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yunseong Kim <yskelg@gmail.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Andi Kleen <ak@linux.intel.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, John Garry <john.g.garry@oracle.com>, 
	Leo Yan <leo.yan@linux.dev>, Michael Petlan <mpetlan@redhat.com>, 
	Tavian Barnes <tavianator@tavianator.com>, Veronika Molnarova <vmolnaro@redhat.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090259_898796_4C9295C4 
X-CRM114-Status: GOOD (  19.65  )
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

On Fri, Mar 14, 2025 at 6:12=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Mar 12, 2025 at 08:31:21PM -0700, Ian Rogers wrote:
> > From: Arnaldo Carvalho de Melo <acme@redhat.com>
> >
> > The dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs option=
al") misses
> > the changes to a file, resulting in this problem:
> >
> >   $ make LIBUNWIND=3D1 -C tools/perf O=3D/tmp/build/perf-tools-next ins=
tall-bin
> >   <SNIP>
> >     CC      /tmp/build/perf-tools-next/util/unwind-libunwind-local.o
> >     CC      /tmp/build/perf-tools-next/util/unwind-libunwind.o
> >   <SNIP>
> >   util/unwind-libunwind-local.c: In function =E2=80=98access_mem=E2=80=
=99:
> >   util/unwind-libunwind-local.c:582:56: error: =E2=80=98ui->sample->use=
r_regs=E2=80=99 is a pointer; did you mean to use =E2=80=98->=E2=80=99?
> >     582 |         if (__write || !stack || !ui->sample->user_regs.regs)=
 {
> >         |                                                        ^
> >         |                                                        ->
> >   util/unwind-libunwind-local.c:587:38: error: passing argument 2 of =
=E2=80=98perf_reg_value=E2=80=99 from incompatible pointer type [-Wincompat=
ible-pointer-types]
> >     587 |         ret =3D perf_reg_value(&start, &ui->sample->user_regs=
,
> >         |                                      ^~~~~~~~~~~~~~~~~~~~~~
> >         |                                      |
> >         |                                      struct regs_dump **
> > <SNIP>
> >   =E2=AC=A2 [acme@toolbox perf-tools-next]$ git bisect bad
> >   dc6d2bc2d893a878e7b58578ff01b4738708deb4 is the first bad commit
> >   commit dc6d2bc2d893a878e7b58578ff01b4738708deb4 (HEAD)
> >   Author: Ian Rogers <irogers@google.com>
> >   Date:   Mon Jan 13 11:43:45 2025 -0800
> >
> >       perf sample: Make user_regs and intr_regs optional
> >
> > Detected using:
> >
> >   make -C tools/perf build-test
> >
> > Fixes: dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs opt=
ional")
> > Cc: Adrian Hunter <adrian.hunter@intel.com>
> > Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> > Cc: Andi Kleen <ak@linux.intel.com>
> > Cc: Charlie Jenkins <charlie@rivosinc.com>
> > Cc: Ian Rogers <irogers@google.com>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: James Clark <james.clark@linaro.org>
> > Cc: John Garry <john.g.garry@oracle.com>
> > Cc: Kan Liang <kan.liang@linux.intel.com>
> > Cc: Leo Yan <leo.yan@linux.dev>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Michael Petlan <mpetlan@redhat.com>
> > Cc: Namhyung Kim <namhyung@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Tavian Barnes <tavianator@tavianator.com>
> > Cc: Veronika Molnarova <vmolnaro@redhat.com>
> > Cc: coresight@lists.linaro.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > Reviewed-by: Ian Rogers <irogers@google.com>
>
> I think you need to add your own Signed-off-by in this case.
> I'll change it for you, ok?

Sure.

Thanks,
Ian

