Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B23FA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IrNNLIVA6NEnoB6P01BW0NnGhVoH9ArZXFEJWghKfQ=; b=p+pcwuqZ4x2g3ZBsTWqqrzd8VG
	JIlobC0Y56uNcU8kXDosp+jlTD+KojtgV5W82asj28I2hwRyBRbvZg5pczkME51xtmFXWltiAsiBf
	cr0hmnuX25vP6Fhjw7BDnhLuWFs8HCaaXs6buccKDu4Hl73T2VKSKIhPzjI0ZfBexSMUlFko8OOq2
	smJG1+hxrKAXnDi5SxKv5d2pyL2LV3vpxmemgsnd1NZoBSuJereK8zVXYq8AmRzTb/9UtulhUKgSA
	sYQVmnnYNZGrg9zQpUyyWNjfU9K730yrJPpJL41oHFOIwy4sVZPPiOksrG9PfEWKT81rFC+BZWOB9
	cLGh6K/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbh5i-00000008R3V-3Izv;
	Fri, 02 Jan 2026 15:29:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbh5g-00000008R2Z-0l2t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:29:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a35ae38bdfso284885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 07:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767367761; cv=none;
        d=google.com; s=arc-20240605;
        b=X3HFcoG9Aonl9IyPG8zx7fKZgbdLUik9DIOcxyfWTFi6OJNSuDHVI53E8lPA87/wlR
         VvTYoO+dB2qfOtq4uig36pY4BY5YwhX0GjPM7PsnLGouUfim0REycyODpWPPvjfoP8aS
         OJbDgjnWEJDDQf56q42GylOq5mfk7krQI514/Wc6/yPwWISlH13ZEWs27/27FxsBV0k5
         VNBSRsNeDBjONfpOeMqbOYoTYjv7BqklJQ2TqQyhE9pVlllnQCIjPIrbA7YMOQAMGxPJ
         NMI4i2KmiU2B/DFo6d3dQUV5LE51zHz8m1f5OJANVNZql6ux+/gIOO7QNm5eedNkHwtk
         eN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1IrNNLIVA6NEnoB6P01BW0NnGhVoH9ArZXFEJWghKfQ=;
        fh=zhNacNkZuvRBbMWltkKNYRI+J5xh2sch+WG34v/RNAE=;
        b=cWD8spFmzrW2uthzBaip+5lHzE3H3zOA4K3sWaxdWrsY4XOppIb45OjLNHp0SxDcOv
         z53CxWkNK7+jeeAf8pk2lVidrdv6CYwdpbFyCsxGID2OXUyWUcdQAMRou5o1lM9utpkV
         Ase2JZ4vGxzbJiixtc7ArX9Wed5g79qlziN1g80mJaS+KXyHstLrgpWanydPdWeOI+Xi
         9nKGe5lDtpnYhgOoLR1R8CYu6jNSVDIA6JDxdUg1PDlXhmD+NorBVMEkcY2E8EU/WerC
         rnzrByLe6q+25El1JTPmc3L4CUdnNn6X5HKsirSLFnyg7QXnNrYxslWi8t351ubaNoAE
         E56A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767367761; x=1767972561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IrNNLIVA6NEnoB6P01BW0NnGhVoH9ArZXFEJWghKfQ=;
        b=WIM6SX0rzXif9OHutkGJbXI8CLlm598nLS8k+XHmQk2CW9m/g4T5H6Xaf+Ey5r9f0i
         fEXwpY/WrudIYulQuPWLs7QkmjA5hheg82P1rqi8mXVta2zi2nCa2ReDNaoj+hPS9IEK
         QfFcOx5TSlAvTv/S/ZPVjZfHUp7AoO5YmE+DzVe1s2DQLeE7DQEbhm08dMQExNVjs9pb
         lzIngtK41Wuy5dykq2GJ7dQQk2DjoAgRlbkPtjN8dTkbr3n7K+zv1/ZkhIA7VdWhsRRI
         yXYKcqLORPfujqF5cGmHO7G65OfoEn/lljPn4QB2Uj8mN15P38ddr1ZKO+s/lfCDYZuu
         UWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767367761; x=1767972561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IrNNLIVA6NEnoB6P01BW0NnGhVoH9ArZXFEJWghKfQ=;
        b=uw7Htt4Sy1yCDnqUemFzK0iqmRy7+Zmjwzw+AR6OYlhf+um8+wGrZ5Iv2niJbpQnwM
         NMTYyUnWg6FYbxXtwKD51aiY2YWTrITFVilC6NQAze64LWR2Rk6vJoezxhbJV+CMZ/XG
         +nERxUkFIVFI65J6IlwvbfsH+atSZ7WufoylfeeVQRo/1eFp4Bp8/HvfdqL8vtguskPG
         sQNXCFWZJvROrGDleaYzvE3o9qjt2cDzM6muPNwipParckSuRX+49GhoPB+594KOjWX5
         skMC+vhhRPPjl3eC+QiN6vykMTukNlLPW4S20YQXTCyhjISJ0qkiJErOG9oDrITtDuRl
         sE8g==
X-Forwarded-Encrypted: i=1; AJvYcCUsIxBZVHFTfiINnkzcFIK+KIT73HrAtbfqeoqVYO+RXsDyoeuluHz0M/54mA7XrSAVGrMGYaOhaGWn5N1a7j1I@lists.infradead.org
X-Gm-Message-State: AOJu0YzMrmSVB2QLPeAKk6yDS2XSHsY7/0SBwyWgR0czPBigK5VBVrsj
	lR+gbu9WqXhQ7eQjWaju7O51s5jvqTmEbOckH6sdW94/eOksZk1v8TdZwvyOc+BJtqd/Em2+19R
	dRqRGcBKXzwIV/tHPVCwZDdCG2nTSUuTYLwfFMwCm
X-Gm-Gg: AY/fxX7EmpyKWB1VWmcwteDBodwpRDFWzoisJp0g8WWiUSChxrvKwgl1z8dnWSUSq7/
	VkaWlhi6d/pCpGKVSNAz0YvsUVhfb2U23BX/Pu6FNvE8uDynz3VyJKJYbyTnlbXm//xw1FkUXH0
	jkf/Lu3biHajCgko9jsvwz1cyAOuyvLvFS0rqxYHh1R1IkJ57IzUeO32g+TfDvqbWH4BZqjmcHd
	US0Mkbmzr0umAP9YvN8fvs/EXrkDVITwOfXI4A3+Joai+QPDFOcM8lzP4XDI4qcX69Cez0V
X-Google-Smtp-Source: AGHT+IHkRM3nbQcOLPK48izIgmx+1XDVnVC8tPksDt2Q+LaV8kDbzbl+/fNpBXQmPomVnOxMH/Rg7BkIQtTEpzsiFbM=
X-Received: by 2002:a17:903:32cf:b0:2a1:35df:250f with SMTP id
 d9443c01a7336-2a3a48b30ebmr3054145ad.15.1767367761024; Fri, 02 Jan 2026
 07:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
In-Reply-To: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 2 Jan 2026 07:29:09 -0800
X-Gm-Features: AQt7F2rS--MzMnSf-RM3PcQkHgwOlcc1ZDooZ9mUFWMOcjVEabNgLf8roIrcl70
Message-ID: <CAP-5=fUNJLoy25rS=diSXNR9h-h4m6EFPTy8M+KpTKxm6HtDSA@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: Remove uncountable events
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>, 
	Yoshihiro Furudera <fj5100bi@fujitsu.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_072924_233547_F6B59C39 
X-CRM114-Status: GOOD (  27.92  )
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

On Wed, Dec 31, 2025 at 4:13=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> These events are never countable by the PMU and are only intended to
> be used as external inputs to trace. Therefore showing them in 'perf
> list' is misleading so remove them.

What does "trace" mean in this context?

Thanks,
Ian

> The generator script doesn't emit these events when used with the new
> telemetry-solution input files [1].
>
> 'perf list' should only show countable events because there are events
> that are sometimes implemented, sometimes countable and sometimes not,
> for example TRB_TRIG. If we always include any implemented events
> whether they are countable or not then it's not possible to tell whether
> they are usable in perf without going to the docs, defeating the point
> of 'perf list'.
>
> It's also not useful yet to display implemented events that are not
> countable (for help in using trace rather than perf stat), because
> PMU_OVFS and PMU_HOVFS are practically always implemented and TRB_TRIG
> is always implemented when there is TRBE.
>
> [1]: https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/tree/=
main/data/pmu/cpu
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json  |  8 --------
>  tools/perf/pmu-events/arch/arm64/common-and-microarch.json | 12 --------=
----
>  tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json   | 10 --------=
--
>  3 files changed, 30 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json b/=
tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
> deleted file mode 100644
> index d8b7b9f9e5fa..000000000000
> --- a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -[
> -    {
> -        "ArchStdEvent": "PMU_OVFS"
> -    },
> -    {
> -        "ArchStdEvent": "PMU_HOVFS"
> -    }
> -]
> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b=
/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> index 2416d9f8a83d..468cb085d879 100644
> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> @@ -432,24 +432,12 @@
>          "EventName": "TRB_WRAP",
>          "BriefDescription": "Trace buffer current write pointer wrapped"
>      },
> -    {
> -        "PublicDescription": "PMU overflow, counters accessible to EL1 a=
nd EL0",
> -        "EventCode": "0x400D",
> -        "EventName": "PMU_OVFS",
> -        "BriefDescription": "PMU overflow, counters accessible to EL1 an=
d EL0"
> -    },
>      {
>          "PublicDescription": "Trace buffer Trigger Event",
>          "EventCode": "0x400E",
>          "EventName": "TRB_TRIG",
>          "BriefDescription": "Trace buffer Trigger Event"
>      },
> -    {
> -        "PublicDescription": "PMU overflow, counters reserved for use by=
 EL2",
> -        "EventCode": "0x400F",
> -        "EventName": "PMU_HOVFS",
> -        "BriefDescription": "PMU overflow, counters reserved for use by =
EL2"
> -    },
>      {
>          "PublicDescription": "PE Trace Unit external output 0",
>          "EventCode": "0x4010",
> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json b/t=
ools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
> deleted file mode 100644
> index 65bd6cdd0dd5..000000000000
> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -[
> -    {
> -        "ArchStdEvent": "PMU_OVFS",
> -        "BriefDescription": "This event counts the event generated each =
time one of the condition occurs described in Arm Architecture Reference Ma=
nual for A-profile architecture. This event is only for output to the trace=
 unit."
> -    },
> -    {
> -        "ArchStdEvent": "PMU_HOVFS",
> -        "BriefDescription": "This event counts the event generated each =
time an event is counted by an event counter <n> and all of the condition o=
ccur described in Arm Architecture Reference Manual for A-profile architect=
ure. This event is only for output to the trace unit."
> -    }
> -]
>
> ---
> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> change-id: 20251230-james-perf-uncountable-events-28adfb93b73f
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>

