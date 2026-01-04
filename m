Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C260C2A061
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 01:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6D/2JrYUVoSp15zgf9Dc61E217j6/kk7jaW+0mt5Zw=; b=4oG13ZfDgeyL+G1Uy1vxxnOZQW
	12rvc9rJ4V/Y19+08Ox4F2Dj06wg0zimOPWOC190tyXJrEuqGQHsztHel+uyd0vZCK/IrjNhLgtJz
	slmEHJ5CjPsCSOuhQu3Qx9UWOdEuK6GKEqEiFygTd1/cVPI5Vp+RRhGsgKzADYgKsEfTFJFqyM5q3
	CUIDc6EUW67MeF/oJd24nxm/+SAF9E/D91Slt5iqdqM3IwxmRklbgymVpTV0f5WcI8zR6ywTXvCer
	311p/aN1lVFTr3MZBKUaB99mqpN5nbUn5fOvHN8LjjYrV3ItVa/43TsHhbJutHybYttCm0n3nTbLV
	are7J+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCud-00000009wBK-11NF;
	Sun, 04 Jan 2026 01:28:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCuZ-00000009wAv-3hhJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 01:28:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a1462573caso100055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 17:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767490082; cv=none;
        d=google.com; s=arc-20240605;
        b=SPJyf8+YFofgVMRjkRVfRGTuZkMwlMElM156lNo+d4/2BVr8UeF71xaODS5QY4T2mC
         ftwmEMLgjX1oXC9YQ55nyMiSTyMVYAXkQNgM50orMNJFOgwtug+E3bUandtT/8xIqmV2
         ELom1zYvhUePv9JVr4DeUkGOGje64bZ/s570xyyNhwFZqVKDoMal21AMkiGQtLfA3gbT
         +AyDz7D6Tr1pUf0YIq5sHV0jWhQwRZl4b3Ch3YLC3054zhewc1RKCU72aSh/rcz2+LaQ
         xnYmvCqKkIaXQ4XjJtj03KfuD8Mfe8R5xafblQm415b4qt+wyIf0KGsZ61Lm1V4jj4/m
         EcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W6D/2JrYUVoSp15zgf9Dc61E217j6/kk7jaW+0mt5Zw=;
        fh=XjIFheiB9bNxabSQXZc6sfLuzBV2+DLJvFda/sW1y1s=;
        b=hoGqaXLj7me8xru2BLftH1bU5PgP7MNNqCzJf1G1RTbOA7eXMxISbfM1P86ks8/sRf
         kXqb0gd1tIxyWiKaEntslYLsQVnEYrbcRkCvHx+sjcQaqfdH/+1rMxFHYEP6UyJXMsE4
         7kqnEF6nAoETa0fGrfeYbvhaOFgpPrrgTfKi62+NAjLsptpiqfrzXbO0mDW/jEmldqy0
         dG3tKG7ymxVgJW6HgJ0vsZrqQ2vhkuDogLlMDap26hIJiYUfBYdxOaysM1ikx/kSxrwo
         /iTbGsIQnYJPzItWZWkn361EgzJrZ28aCGP4/VXFbKyH0cgRHgxnpB91l1O/NDkmYjfW
         fUoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767490082; x=1768094882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6D/2JrYUVoSp15zgf9Dc61E217j6/kk7jaW+0mt5Zw=;
        b=aePShOYhW+MazMvCWXO+u4clE/IjumTeBVThPevGbRnJ53EOmzUEhUtVl+dh4zXTSY
         WBed7s2MmrHEiNJmAj1LDl6SqdH1RosCl00i7m4drMWiop8oF72KzF0n3ccwcIfkSFKi
         V65RpNNn22/LZGiPZ7QUdsd5nargDs8Rl8b7bmIXQcGG9Cv6nwbw7Cgi2AKv8aYol5J3
         czYMTo1YLBnyfEi03nFY4OagMrGG/WBf3GmECLUjl17IBT1YrTf+pmcBHBB8WWD3H3zD
         V461wNOZtStQVr+6w+JXURbJQX0EMbmqJtV8iyAbLC5pq9ZpfR8rjBZM3+Cesf7QT2KK
         qiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767490082; x=1768094882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6D/2JrYUVoSp15zgf9Dc61E217j6/kk7jaW+0mt5Zw=;
        b=VGIsCQgxG81O2Q3/dKaZERxD7WVSKcCGwO2jq1YzkmdHq4pCDEhMDs+her3zT2KviZ
         JixWvroIxBV0l7NwJ2CljpuG6no2cgBJ2Uw2i902vGHpUdydOh0SXiLOJKdNjsjveUyB
         lGOYzsua6kBYiBiiRrtlAt9VksCwzvq0VLuVyW6//IPIe+FQfTFxWWCJlcES4rL2VCgZ
         +I8S3uAL90tR8s7Jdk292L3Cd6Q7Yhs/53wwfOmeF9iBLp7q/SILtSAkBPYNWZahb3E4
         qncdDNHkPLeFj2dmzQ4sbjHkz/+6xHKJaAd6rHLWCD0w0HXxgzHLH4XNz8FYgssQYi8m
         p2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnVZPqqqU/EZjUqtD/B2N/JWAkGtzCcpLijS/kgM49gHiTXK5b4JFv19dcc1Yury/icHuFLmTPK116LMnAQ3Ww@lists.infradead.org
X-Gm-Message-State: AOJu0YwLT5DrCrL/+x1Ltf5CBsEadygdL1rlzo16oa3QVwywtkfz7g3S
	tJWIgRQvL57H8Yx4kxXvG0581qgtKPizVxyf5XTw926IJasxKEOEHmsKsOUnOWn6aeLAEGJ/+Lo
	atukaXy+Dhb8Bka4ifZsEdhTWkMIODDTh7OYNM41Z
X-Gm-Gg: AY/fxX5360YUrKrNRIw1TjOMF3pTG0Ff6K7WRGjAk9tSk7GKECh+Y09kHhmEyggXcxM
	noJKNx1C2Kmn4yZ0VHuy1/zqr0/oTG3LgQa3FHB6CAKWgaZeWHZDdzxT1lvr3lNzwJHPmbZ5wcT
	jbfV/jsnCs75DTMnLrA+xO6dBdPYPpP12mD2hTiVNIKkworS/hy1RU1Yr2XlICxOElAlL3wWYXL
	Jp/yXT8bh+HcFFHgCTzWYYRC4aTXvhhr7CIt6igH81uOk1jZ6OGwnLVQsyEPDurzpcqvnfpAXQI
	QB/oR6Y=
X-Google-Smtp-Source: AGHT+IGR0CSdOd5Po/wNVWrEJqUZznOrS/jBm/GnLu5HAE6JT5lGfrjeB9BDoXGSjl8H9zT5JrqJbT2xoUKUsCO9Zig=
X-Received: by 2002:a05:7022:62a8:b0:120:5719:624c with SMTP id
 a92af1059eb24-121da89a169mr42938c88.19.1767490081402; Sat, 03 Jan 2026
 17:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
 <CAP-5=fUNJLoy25rS=diSXNR9h-h4m6EFPTy8M+KpTKxm6HtDSA@mail.gmail.com> <951f10c5-e1ac-45d4-b7ca-56aa32e57cd6@linaro.org>
In-Reply-To: <951f10c5-e1ac-45d4-b7ca-56aa32e57cd6@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 3 Jan 2026 17:27:49 -0800
X-Gm-Features: AQt7F2o5no2WckBB9YJGcdTGhjJumxJNEyTbpp6daTpOP-viEjkWjPdRLGjbC28
Message-ID: <CAP-5=fWQU59Vyb6y+W6ObOTh3nzFSofsn8sc6JzwZp7FiV+n6w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260103_172803_932284_249A79DF 
X-CRM114-Status: GOOD (  31.44  )
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

On Sat, Jan 3, 2026 at 8:38=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 02/01/2026 3:29 pm, Ian Rogers wrote:
> > On Wed, Dec 31, 2025 at 4:13=E2=80=AFAM James Clark <james.clark@linaro=
.org> wrote:
> >>
> >> These events are never countable by the PMU and are only intended to
> >> be used as external inputs to trace. Therefore showing them in 'perf
> >> list' is misleading so remove them.
> >
> > What does "trace" mean in this context?
> >
>
> CPU trace, Either ETE (Embedded Trace Extension) or ETM (Embedded Trace
> Macrocell). You can select PMU events as inputs to the trace block to
> make it do things like start and stop tracing.

Ah ok, trace immediately makes me think of `perf trace` currently.
Presumably there's no perf integration for ETE and ETM that somehow
use these event encodings? Looks not and the changes make sense to me.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > Thanks,
> > Ian
> >
> >> The generator script doesn't emit these events when used with the new
> >> telemetry-solution input files [1].
> >>
> >> 'perf list' should only show countable events because there are events
> >> that are sometimes implemented, sometimes countable and sometimes not,
> >> for example TRB_TRIG. If we always include any implemented events
> >> whether they are countable or not then it's not possible to tell wheth=
er
> >> they are usable in perf without going to the docs, defeating the point
> >> of 'perf list'.
> >>
> >> It's also not useful yet to display implemented events that are not
> >> countable (for help in using trace rather than perf stat), because
> >> PMU_OVFS and PMU_HOVFS are practically always implemented and TRB_TRIG
> >> is always implemented when there is TRBE.
> >>
> >> [1]: https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/tr=
ee/main/data/pmu/cpu
> >>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json  |  8 ----=
----
> >>   tools/perf/pmu-events/arch/arm64/common-and-microarch.json | 12 ----=
--------
> >>   tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json   | 10 ----=
------
> >>   3 files changed, 30 deletions(-)
> >>
> >> diff --git a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json=
 b/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
> >> deleted file mode 100644
> >> index d8b7b9f9e5fa..000000000000
> >> --- a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
> >> +++ /dev/null
> >> @@ -1,8 +0,0 @@
> >> -[
> >> -    {
> >> -        "ArchStdEvent": "PMU_OVFS"
> >> -    },
> >> -    {
> >> -        "ArchStdEvent": "PMU_HOVFS"
> >> -    }
> >> -]
> >> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.jso=
n b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> >> index 2416d9f8a83d..468cb085d879 100644
> >> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> >> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> >> @@ -432,24 +432,12 @@
> >>           "EventName": "TRB_WRAP",
> >>           "BriefDescription": "Trace buffer current write pointer wrap=
ped"
> >>       },
> >> -    {
> >> -        "PublicDescription": "PMU overflow, counters accessible to EL=
1 and EL0",
> >> -        "EventCode": "0x400D",
> >> -        "EventName": "PMU_OVFS",
> >> -        "BriefDescription": "PMU overflow, counters accessible to EL1=
 and EL0"
> >> -    },
> >>       {
> >>           "PublicDescription": "Trace buffer Trigger Event",
> >>           "EventCode": "0x400E",
> >>           "EventName": "TRB_TRIG",
> >>           "BriefDescription": "Trace buffer Trigger Event"
> >>       },
> >> -    {
> >> -        "PublicDescription": "PMU overflow, counters reserved for use=
 by EL2",
> >> -        "EventCode": "0x400F",
> >> -        "EventName": "PMU_HOVFS",
> >> -        "BriefDescription": "PMU overflow, counters reserved for use =
by EL2"
> >> -    },
> >>       {
> >>           "PublicDescription": "PE Trace Unit external output 0",
> >>           "EventCode": "0x4010",
> >> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json =
b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
> >> deleted file mode 100644
> >> index 65bd6cdd0dd5..000000000000
> >> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
> >> +++ /dev/null
> >> @@ -1,10 +0,0 @@
> >> -[
> >> -    {
> >> -        "ArchStdEvent": "PMU_OVFS",
> >> -        "BriefDescription": "This event counts the event generated ea=
ch time one of the condition occurs described in Arm Architecture Reference=
 Manual for A-profile architecture. This event is only for output to the tr=
ace unit."
> >> -    },
> >> -    {
> >> -        "ArchStdEvent": "PMU_HOVFS",
> >> -        "BriefDescription": "This event counts the event generated ea=
ch time an event is counted by an event counter <n> and all of the conditio=
n occur described in Arm Architecture Reference Manual for A-profile archit=
ecture. This event is only for output to the trace unit."
> >> -    }
> >> -]
> >>
> >> ---
> >> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> >> change-id: 20251230-james-perf-uncountable-events-28adfb93b73f
> >>
> >> Best regards,
> >> --
> >> James Clark <james.clark@linaro.org>
> >>
>

