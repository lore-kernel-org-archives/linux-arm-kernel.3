Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF56FD172AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 01:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=; b=hczx+h9SY7uFQXSnhYKsh2vjph
	Ai9G+BEIk1gjJShgWn4+rlOg25m0y7WGIuAXjO6oQo+daeDz10Y4idGgD+ugr0RmF4JyeW4ARUBVn
	0UI7hy8hml2UYu+weKQl6JsArhJWCR4eJoi/A/0y80PT4+dgrVMgxBGydyERD1vlPJiVGz+jsBvt4
	dDDWu+FDNJMvZvvgoalSaKiGk6HiLzv5a0mBZsliR1oHSftWDECC32xL4fR/Qmn3kGPHr++Jnc4jG
	qNXbMSp6CpCcoo3GzElrbE9i9Ne+Ezs53k+hiPOKp2qHnKlYM+44QqK2g2XjBHNGBNbpEV34f+Rp5
	Q+fi9pnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjAV-00000004JyK-3lqr;
	Mon, 02 Feb 2026 01:55:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjAS-00000004JxR-3hxi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 01:55:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a76b39587aso109045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 17:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769997355; cv=none;
        d=google.com; s=arc-20240605;
        b=bQF34qI9IhYKO8dqjYSd4dLJb1xp4ngUCdqr9OUCeKLxEROqTDPJM32ewuOSNZyN10
         X/ikmWg4G95cCQNM1vOThyLe8Cp5cYyjH/dN7LJdCWmuFRPcQdmtefZkFxUnY8M2cIXq
         v8ErdVZUCg+OcpNKFLDP3gsprFMPBbhwh4x6QSP/AAnmuRQo4leQoNjbLmYnF5daA/hh
         iae9mfS7PSmll3LGicmBDjYDkRseioK88bnkH5CJtASF08PYp6sltP9/yz6MHLrk56zv
         h/0Hn+Xrq8/sQWAYMNey9qlqksPL6o50he+8wSaTusEgo/93Op/qyfPRuSCvM96jxGms
         0CfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=;
        fh=k+O917tSS5gv/kUcevvm54ErNNEoxHl/ll2Va5oKpc4=;
        b=dNXuMV/ZSusV628NovYsLSmFRcjgkHrXkMbOC5eliVhWs03G+FX4ABNtJwGyB6zvKj
         sqovQDUZ4yCRdNvomEaxbs1jQf4RvqSPNCBXlI4gaAoAcjHwhOO/VFUBbvODyxBuo0Sd
         0go3f3dWrpg/BDnKhXvgleJI17aK5lcTWoOGDTBQGxosK9OnofX1VFQQnPX4ro3k4gU1
         aeM7seHnseetk2SlY6RCRmHapzjC2zrj6FUCxcKm1qsSxovJjQYUDdU5XPcR2EgAkvHv
         QWa9VR5ivdByArdLbOhop1cZZ6S+vLR1nEEwmr5N7QZbHvBaX4jRtv5WT6XnbrO8CMaK
         9KNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769997355; x=1770602155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=;
        b=W7sz1F1nkoFRx+dFhb/TmJLif0cRg55RutcHCQpl8KWns2P3LMUrJTwm9dtBvaklYP
         777Q5RuhsSSznLfkJ1jWISGFIsi/R9YcVzYO3tQKmGgB+1WbUyQfWUquS2hTR9RqaY6a
         oQq6j4ysrWcyDK48JNg5snmlnCnYFjbL2THaYaQkTWYEBTu5kPBJFQV4hHTzBIOQ3B9u
         /XBCtZa52GgfGMYjkpyYjx65udI3RjCzn0S6H6HiKCyVagaqS9CnZzqQfYNBqL9GFKIj
         gMOUXPdyYm8VXgdDOuI/xuktFQVo/yuIGx3H+uOCzuz8S0LOYukgdlKZQSyw0PjIpK2n
         o+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769997355; x=1770602155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=;
        b=UOcxSVXB/zAeEaC/81fcs/88PU/7XlZa4WWH60k8x7TL8bMskwlgyEQJ8qtD0T7qkC
         /gU6NTjLZOAdM3u4txK6RCQfdGdkRXQQKbnuKWBlQdxDysLseYqEw0Hgya8a1rQ2IGQ7
         p/OaDtwyfZVh+1Bn06j6mUBoZSmAo8KUw3NeUnMjP0gX37RF1WI2fHolz2RpH7dbXDky
         Y1DNTMMIzs5ZSVU0VOWRVoFCKueqvGY9cHhmlUrLI5jgT1BMj3/FZcTw2wW38z4EKYnX
         MgRprJjvFoq1stfAW6xrXPqfFQJkKWkWrMgB1C3KNmQvhX/epvLAH4n9JIW1l/yXNQhX
         AD5A==
X-Forwarded-Encrypted: i=1; AJvYcCUYQQQkTi595Dsr/x2sX1MZ+/0B3ReYgu20UhsY3J+UG7nY49+KyHxsxNw94Ayv6/qN4UkBORVyvtaFeDgMFVKA@lists.infradead.org
X-Gm-Message-State: AOJu0YyHjA5THWul/FZz/rDxaHMl5W/IY7FzrIy/DdeJYoT3dw9hT086
	oPLXZWvDSEcE4A5IH2NWHF50ivX+yxW9iW8g4Es66G1Ox+3U7xhbvWB20uIHyFjVOR9wBqBmQhF
	XPayhuOqIShNOZDr8ATvOU6/QamQh6q00PpRddLhG
X-Gm-Gg: AZuq6aLpaSWj5OaMimiHmMq0/JNbLVnbsbe68qZjTa5yJHS9qSNNr7iBEqHzfvPImuL
	GNgtFBrDlc6uB/5e1u0Pj742dnBmvfZdJdIVmkn+xPsQRtCX1+UzajM/g7G7+0owcr7XWvcSHvK
	ZsY9IKaUqlA4t1psTKzMQDB/Tmuo+d4aJQ4QpW/mWMFmfd4+5bkIR98m5runKt6HQRJhyBUTaLg
	hsELEO4GYXG7RN9+m6avjSjOQoAiedQiefiGVghEU60MPNXQvCsF5OJXK77f2Ij/LBppxYj1Ksc
	MrLlOhf1ykXzgDz5g+reVZNvoA==
X-Received: by 2002:a17:903:1b46:b0:295:3f35:a315 with SMTP id
 d9443c01a7336-2a8f508a028mr1388475ad.5.1769997354552; Sun, 01 Feb 2026
 17:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com> <20260131200224.1296136-3-irogers@google.com>
 <20260201170459.GA584@debian-dev>
In-Reply-To: <20260201170459.GA584@debian-dev>
From: Ian Rogers <irogers@google.com>
Date: Sun, 1 Feb 2026 17:55:43 -0800
X-Gm-Features: AZwV_Qhcem8Bk7pzFsCUDa55vlzfQf_z4Xlvnl5l4tr16HwWCArY51n37Nz_Lv8
Message-ID: <CAP-5=fXedkNLSWXVRJy7SDknx3Mb+BqUHPf7Oo7JSHshgoJ0qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] perf kvm stat: Remove use of the arch directory
To: Leo Yan <leo.yan@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_175556_962523_42280638 
X-CRM114-Status: GOOD (  25.29  )
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

On Sun, Feb 1, 2026 at 9:05=E2=80=AFAM Leo Yan <leo.yan@linux.dev> wrote:
>
> On Sat, Jan 31, 2026 at 12:02:20PM -0800, Ian Rogers wrote:
>
> [...]
>
> > @@ -1666,7 +1661,7 @@ kvm_events_record(struct perf_kvm_stat *kvm, int =
argc, const char **argv)
> >               return ret;
> >       }
> >
> > -     for (events_tp =3D kvm_events_tp; *events_tp; events_tp++)
> > +     for (events_tp =3D kvm_events_tp(); *events_tp; events_tp++)
> >               events_tp_size++;
> >
> >       rec_argc =3D ARRAY_SIZE(record_args) + argc + 2 +
> > @@ -1681,7 +1676,7 @@ kvm_events_record(struct perf_kvm_stat *kvm, int =
argc, const char **argv)
> >
> >       for (j =3D 0; j < events_tp_size; j++) {
> >               rec_argv[i++] =3D STRDUP_FAIL_EXIT("-e");
> > -             rec_argv[i++] =3D STRDUP_FAIL_EXIT(kvm_events_tp[j]);
> > +             rec_argv[i++] =3D STRDUP_FAIL_EXIT(kvm_events_tp()[j]);
> >       }
>
> Nitpick: we can assign reuse events_tp throughout the
> kvm_events_record().  Something like:
>
>   events_tp =3D kvm_events_tp();
>   for (j =3D 0; events_tp[j]; j++)
>        events_tp_size++;
>
>   ...
>
>   for (j =3D 0; j < events_tp_size; j++) {
>        rec_argv[i++] =3D STRDUP_FAIL_EXIT("-e");
>        rec_argv[i++] =3D STRDUP_FAIL_EXIT(events_tp[j]);
>   }
>
> [...]
>
> > +int setup_kvm_events_tp(struct perf_kvm_stat *kvm)
> > +{
> > +     switch (EM_HOST) {
> > +     case EM_PPC:
> > +     case EM_PPC64:
> > +             return __setup_kvm_events_tp_powerpc(kvm);
> > +     default:
> > +             return 0;
> > +     }
> > +}
> > +
> > +int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid)
> > +{
> > +     switch (EM_HOST) {
> > +     case EM_AARCH64:
> > +             return __cpu_isa_init_arm64(kvm);
> > +     case EM_LOONGARCH:
> > +             return __cpu_isa_init_loongarch(kvm);
> > +     case EM_PPC:
> > +     case EM_PPC64:
> > +             return __cpu_isa_init_powerpc(kvm);
> > +     case EM_RISCV:
> > +             return __cpu_isa_init_riscv(kvm);
> > +     case EM_S390:
> > +             return __cpu_isa_init_s390(kvm, cpuid);
> > +     case EM_X86_64:
> > +     case EM_386:
> > +             return __cpu_isa_init_x86(kvm, cpuid);
> > +     default:
> > +             pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
> > +             return -1;
> > +     }
> > +}
>
> For a general solution, I'd prefer to use "install" + callback methods
> rather than the opened code.  E.g., each arch installs a structure
> with callbacks:
>
>   struct kvm_stat_arch kvm_stat_aarch64 {
>       .setup_events_tp =3D NULL;
>       .cpu_isa_init    =3D __cpu_isa_init_arm64;
>       ...
>   };
>
> Then at the init phase, we can install arch's structure:
>
>   switch (EM_HOST) {
>   case EM_AARCH64:
>       kvm_stat_arch_init(&kvm_stat_aarch64);
>       break;
>   ...
>   }
>
> Afterwards, it is no need to check EM_HOST anymore, it can simply
> invoke the arch's callback:
>
>   int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid)
>   {
>       if (!arch_kvm_stat || !arch_kvm_stat->cpu_isa_init)
>           return -1;
>
>       return arch_kvm_stat->cpu_isa_init(kvm, cpuid);
>   }
>
> As a result, we can avoid spreading "switch (EM_HOST)" everywhere.

So the use of switch(EM_HOST) is to just show the equivalence between
the before and after code. The EM_HOST has become an e_machine read
from the session/env by the end of the series. I agree there is naming
clean up, etc. that can be done to the kvm_stat code but I just wanted
to focus the series on the removal of the arch directory by way of
switching to using the e_machine value.

Thanks,
Ian

> Thanks,
> Leo
>

