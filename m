Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9956FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEIz13Q/pX/IO5J/PJ0QFTU3dk8boWRXFmG3LFxMs+o=; b=mD9JDOzcP1aQh/OXSKOGyNdO85
	j2cGdcaX36VJ8lbnrL+hkzwLiUmwJmXKskBP3EaOpoqt7cAB3e62EXu/dst6oAJ8zIYemgl65IXRf
	sp/saqORY7KIo/yyrTOqY6dcM4FjAtmJwc3TPXurDw4N91ZG0POORHg2/dKWHGLIBeSXh+UGrjnI5
	1pEHvNlikfV90YiQ7bKxRXlckiP75QUqzREDl+p2YayXSWOITAm+ux7T+htPbyKiRmkWt+X734PJE
	77My10QkIP5o3WVNnLd7POSuEc1r1chwhNoYbuh6ecWLAEFDhjmMj5WBOqbg7/X381DwIHcLivj5i
	xQLQSy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO0GL-0000000016G-133w;
	Wed, 18 Dec 2024 20:03:17 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO00w-0000000HZiJ-1mLh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:47:23 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so17065ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734551241; x=1735156041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEIz13Q/pX/IO5J/PJ0QFTU3dk8boWRXFmG3LFxMs+o=;
        b=THnVvqn9UaFA+8le8iKuiEIePWpgpBl4cHhQ9ZP3mOGCg0cjy4iGNMxKhPY/3htgFm
         8tBr50psb4/IPJYGKP+N5jtFTUGVMGK2JqXElzkGa8qhyfET3QpRZBs802g7h0FLGAfK
         er5JyjaTNoeCrvz8pYWpaNLdL5tHlwuNZTh8Apv7xv3IqOuukAKzwrsCrM7jpLWrq2B9
         3ZaT1CEE3447WR6eKYohTitxGJnt0f2tJocKn+2bPsZLcKIFsMTPoPtDqPm3gj6rtJhY
         uVutVSeslpk4AAskxJnymg39SBqJwvOTRjZYVJ4f4AUWnBMkyBt08ojjapER/h3pWn/o
         ScSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734551241; x=1735156041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEIz13Q/pX/IO5J/PJ0QFTU3dk8boWRXFmG3LFxMs+o=;
        b=cKw0F6Y/BPDxwvb48BNZouVZCQbLLkx7kvrxvgrQ57yTBfddPBwyMh8hQWivvy33KW
         xNghX6V5NrIGwGKLj6r+ganwLGS4NZ3SJedKvDr6U8TX/pPIaGYNpyokVtI1QMfqxy8F
         ODmfrUCSCFJy1ATv1uJ6MaMVL1O3qDRrq+O/i+BoSPwu4utXn8upc9a885T1d7CqYsYh
         ewr4bbxNT+WhvFWk5YWb2/OPoeAGsDcV3CvC+hZ9bBoljlJaWWT4JyBZYJ2pIG1zaK2T
         oOf4Iiu5FzvvZTnHqVaAuE5hPzPYRuoIkWixdlEoJtqM6zQou5R0eHPKrD4PGRPMESvr
         SEVw==
X-Gm-Message-State: AOJu0YyZQ0KCQtm/DUYVcIkceIVhMu1nMNE+rMIIsiN6bWbGD2kZ1INf
	jmXCG+pjjqYfsp8O5YrWEE2/0/1T4s0pSugQswb0IAHihwnkBC4V2zq1Nj5x/o2UKBFRzmwFWEy
	hrOYAMUz/kDXAjYwpVzmUhAaFQ/GS9EOCAsMs
X-Gm-Gg: ASbGncu6qQI5xMXXcTpTwxhWT7heylggech9Da4LQJW18s+BKR++4egI/3/oFKh7+Tv
	yO9T1NRmF4WTJ2q3LAL8rR9/jVeXQYphrOCCUW8w=
X-Google-Smtp-Source: AGHT+IG9HMLA2DZQdt0++217X1MrHCxsIDtlyjTzOXdQZIizZh8ClUQJQcagloMoINGz2IdswyylFE3OGbzaZct2+iQ=
X-Received: by 2002:a92:dc02:0:b0:3a7:28e3:268e with SMTP id
 e9e14a558f8ab-3c0579abc0amr359345ab.12.1734551240983; Wed, 18 Dec 2024
 11:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20241217115610.371755-1-james.clark@linaro.org>
 <20241217115610.371755-6-james.clark@linaro.org> <CAP-5=fU7RNzvzxBcAQy3RT9Ge3YtqPhDonupNWS7Wgb8HGQkGg@mail.gmail.com>
 <8c15786c-47b6-47ff-b1dc-ecbf32d582fb@linaro.org>
In-Reply-To: <8c15786c-47b6-47ff-b1dc-ecbf32d582fb@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Dec 2024 11:47:09 -0800
Message-ID: <CAP-5=fXV6LXrUtvgRKuyurmu5SoSZLTf6MN=+BBXkqv7drvOjg@mail.gmail.com>
Subject: Re: [PATCH 5/5] perf docs: arm_spe: Document new discard mode
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Graham Woodward <graham.woodward@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_114722_473344_D887687D 
X-CRM114-Status: GOOD (  33.85  )
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

On Wed, Dec 18, 2024 at 2:07=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> On 18/12/2024 12:54 am, Ian Rogers wrote:
> > On Tue, Dec 17, 2024 at 3:56=E2=80=AFAM James Clark <james.clark@linaro=
.org> wrote:
> >>
> >> Document the flag, hint what it's used for and give an example with
> >> other useful options to get minimal output.
> >>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   tools/perf/Documentation/perf-arm-spe.txt | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Do=
cumentation/perf-arm-spe.txt
> >> index de2b0b479249..588eead438bc 100644
> >> --- a/tools/perf/Documentation/perf-arm-spe.txt
> >> +++ b/tools/perf/Documentation/perf-arm-spe.txt
> >> @@ -150,6 +150,7 @@ arm_spe/load_filter=3D1,min_latency=3D10/'
> >>     pct_enable=3D1        - collect physical timestamp instead of virt=
ual timestamp (PMSCR.PCT) - requires privilege
> >>     store_filter=3D1      - collect stores only (PMSFCR.ST)
> >>     ts_enable=3D1         - enable timestamping with value of generic =
timer (PMSCR.TS)
> >> +  discard=3D1           - enable SPE PMU events but don't collect sam=
ple data - see 'Discard mode' (PMBLIMITR.FM =3D DISCARD)
> >>
> >>   +++*+++ Latency is the total latency from the point at which samplin=
g started on that instruction, rather
> >>   than only the execution latency.
> >> @@ -220,6 +221,16 @@ Common errors
> >>
> >>      Increase sampling interval (see above)
> >>
> >> +Discard mode
> >> +~~~~~~~~~~~~
> >> +
> >> +SPE PMU events can be used without the overhead of collecting sample =
data if
> >> +discard mode is supported (optional from Armv8.6). First run a system=
 wide SPE
> >> +session (or on the core of interest) using options to minimize output=
. Then run
> >> +perf stat:
> >> +
> >> +  perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev=
/null &
> >> +  perf stat -e SAMPLE_FEED_LD
> >
> > Perhaps clarify this should be an ARM SPE event? It seems strange to
> > have one perf command affect a later one, the purpose of things like
> > event multiplexing is to hide the hardware limits. I'd prefer if the
> > last bit was like:
> > ```
> > Then run perf stat with an SPE event on the same PMU:
> >
> > perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/nul=
l &
> > perf stat -e arm_spe/SAMPLE_FEED_LD/
> > ``
> >
> > Thanks,
> > Ian
>
> Hi Ian,
>
> Confusingly this isn't an SPE event, it is a normal PMU event. The fact
> that one Perf command affects the other is because these events only
> count when SPE is enabled. When it's enabled it has an effect on a
> per-core level which is why in the example I made it simpler by enabling
> SPE system wide.
>
> SPE is an exclusive PMU like Coresight and some others so it can't be
> affected by multiplexing or anything like that. The SAMPLE_FEED_LD PMU
> would be, but as long as SPE stays enabled it will count the right thing
> regardless of multiplexing.

Thanks James, sorry for my SPE ignorance. I'm smiling about the use of
the word exclusive. When I was trying to make the tests run in
parallel I used a file lock - so shared and exclusive. There were a
lot of issues with that, hence switching to 2 phases in the test,
parallel then sequential but I kept the "exclusive" tag for want of a
better word. Perhaps the notion of an exclusive PMU existed previously
but maybe I've accidentally invented the term by way of a failed file
lock experiment :-)

Presumably the two PMUs side-effecting each other is a known thing. I
wonder if we can capture this in the documentation. When you say
"normal PMU event" you mean core PMU events?

Thanks,
Ian

