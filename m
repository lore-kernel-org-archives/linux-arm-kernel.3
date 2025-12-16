Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC4ED637B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSPWTH5LvhyX27MDxiyB/vR3lpYpOwI1LKp0PW+a/sI=; b=qUG8wvUWWtUQiA3khcWB/3B9vN
	MwVr2TL2krnr+00SQnS5TMtrOEWeKlIqYalajVFxwbtLVKrpueNvjpzYfXgMs/2HFBZgaPpk/ZQg5
	Cp3y6kGbbjMvB38kGKf0QFyrV6/EAGaDq5QLNC3DTDJRlQeS4GTT8RKFHfGXfL8pEV5h32AfbpdjG
	JiD/L0dz8mDrZyBw3ZKuwDie7lyccP2HjA4benE7vNu6YWzLHq8wALTRxOAisLUFKA1omHj3Xjkai
	CAX6dEg26qAIEOzJtbP8NnhDOtAtCfAwEdi/6eKn1UucHX3BEOi7ecLWRC+3Dn5nAX+R7OT3r9K0R
	dMTe0GtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcDH-00000005oy3-2iUr;
	Tue, 16 Dec 2025 21:04:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcDF-00000005oxY-3N5V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:04:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a1462573caso44875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765919045; cv=none;
        d=google.com; s=arc-20240605;
        b=JtelwZZALBap+QcTGZ4PfnAU+S8KKKc4kM8dRwJW2rzFeHJECneBvD823pRKmzO/0K
         tHrdBxpUd/caxFoRRjs2BZvOKY4C791bGIdXbEymYu1nUhhF6KnrFQF9LEMhABRXdNXA
         K834YqwIcGcIOmhA5VHOeIVgEoZwWcLj5WKoiyvXH3BUgP8Rj7ceXc8c0lsvkUR6vrsy
         HRLbIc+pUBgn53St13EGtcrmdGEmTJrYNtqTjZfq7uAdlroBZjexAR7A5Z9jz+u9LwLZ
         fDdWXm3CEH5uLfIdAb4cHaVAzLVcD0riB8PPDpYIflPrurn4+5FwQrkbH7IPu9zr6s/1
         KB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JSPWTH5LvhyX27MDxiyB/vR3lpYpOwI1LKp0PW+a/sI=;
        fh=Q1zxN1VP47CspIUP2v/W4SdUyMHuG07dDio+OfoyOC0=;
        b=SXQUOjdtkLpNcU8VIodTf7Rysdol1xxjgOm2YxVfR27dwE/U65bHqTS04nKPtrtbAz
         wav4oOayTJVKG35Rsf5F6DP8NDCbg79yn0UKp/BYe0T0xZGPtIPONL16aaOBDLXRzm6s
         2ae3W6/dPiKHGSKr2JUUpKZpv985uCxBO9tXQWrEJawPv/+uVoJiG+Ok8iKPMPNX8QD3
         pJ92LWp/o0EL4bz9m3dtqO4Z9AR0oTashBnbpuXQBrvsIORgSQV9UwTqpgkxKJ/uiUSz
         hCdgt5djJ6UB2Mw0vaOPyu/CCtIenO94OATkU4Zl3GcNFrV0P2DLg/7VEcw7r43YozYB
         mUtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765919045; x=1766523845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSPWTH5LvhyX27MDxiyB/vR3lpYpOwI1LKp0PW+a/sI=;
        b=grbx/GHU5f2cWkhQnl75hAYbfuCoZW5ulAlAcmWGbXOgLfMxe8L4EalYClCK4QYf3h
         IMYd//hyvjm//TzPEsUQmSGQRIcVemBZ/dvhALsZmmfUEGjh3UiLTn0HSceBzfCl146f
         nV0gt9/E+3Au9ZVEfbQCNZ4NxnIP1+iTKiPIqmkiJEASpqtNepozFIwOLgqOmwKiyL4p
         VjvLY95h0wR9j3rwEjFhd4f10WDva3ndRIE6dkQPf9qh09mLL5zdT40u4HCqN1gngflf
         CC53gbhWdJ5ffbmduWen6SyeBE8Z323VhP2i4Brtw4JqeSjR5ihxfvG2s5DfCTzNkXoS
         usIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765919045; x=1766523845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSPWTH5LvhyX27MDxiyB/vR3lpYpOwI1LKp0PW+a/sI=;
        b=Ugrv+Nydk9uXJhy4pm9Y9XPVil4ZoeTbct4OEzgJOw4/rt7OPEiY07Q/haS0o4YEv/
         Stz9DRc46i7aNbhLtUQrU2YLW/fOfptGLVb89N+oEBNUxeOceZWG8MGw2h8aTdK9OUe8
         ftH86ov+EMYngYFzSCkoxR4/1ewlkZyENCSeYBlIfbQEnZEn2RYtID1JQj49Ao4i61ET
         ykLGXyNZIztRlnCxnFULtleDGSsXNLlY42DK+hAVcREeuy2wKevqc8GmNxPqTHffhE0e
         VU0BosKSec9Z32Mzb24A0jlADbv2CcjnSfKZkZR3GVG1VZU0R7695698Jpei8ifkQ7lS
         gLVw==
X-Forwarded-Encrypted: i=1; AJvYcCULAnrs8CWKa/EQPccfUBrnYwlbL+wWZ5DTyXpLSoTGDWuz4w9lhVJXeeB+xz8sh3uYGuly07X7FQREIfzfpzxh@lists.infradead.org
X-Gm-Message-State: AOJu0YyWAJHhZM5BxjDdrHGIW7itAbu3BVkz2wP6C/TK0RJWsZMt+q1F
	PNexzMLt4kE0zxzIQ4GHQ6FgISls5uW+H/E2/OCPkAt5LEmpF05rm3/jrylyb2kRDcUiB0IbZKy
	r39fM+iRsRDwmQyvh/1FunN6VX5u75m59jojBZSSP
X-Gm-Gg: AY/fxX7U33zTFWoew3y7mRwhb/Q2BPRjV7v8/1+lfWOlVObmQ6MivAd8pmKTde/PXjx
	NGsS/aPfUubihJBIiqVeHFhxYbhu5jlHXWF1b64DXYwvAIrysvYsRIhPbnjQec+LLd8NBylHsGk
	IKVAZMmRdZnJs+R/fr5Lr3Mpvxv4Aqs5jtqn/mL64f5cU3nKtbltQib0985akGiBk0Xn6v6pR2H
	ovWZs6PEi4Zhe6y5pf65MQ2PLXpsW2kQLxP6bBeikVhNNsRqiOC8w0nt72HWEn2HMSsJbaT0JtO
	a8RtTpzinMUqg4RVqD4BHyfZjg==
X-Google-Smtp-Source: AGHT+IG5ELEF7AzQOZVlYy0IUuQ462eAR+/pa+XIzVeTo/fmvpwfzQavCHWTXXEeE4o0TNRdX8Ioon4m9vaF1JMTRnE=
X-Received: by 2002:a17:902:e80c:b0:29f:181c:1f0 with SMTP id
 d9443c01a7336-2a2060db3f5mr21095ad.11.1765919044535; Tue, 16 Dec 2025
 13:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
 <20251212-perf_c2c_update_event-v1-1-29a26c7a949b@arm.com> <6a642215-2834-4c27-b716-477d5444ad9c@linaro.org>
In-Reply-To: <6a642215-2834-4c27-b716-477d5444ad9c@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Dec 2025 13:03:52 -0800
X-Gm-Features: AQt7F2rncr8NvM5nl7aWHc1gmXASdTJlpuNlkoAQFQxFwabBXixeogpD2unqQnc
Message-ID: <CAP-5=fWB7QxTvtEY6_9DBoQ23J471zvrRz+z6TYgNk3eJOWGRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf mem: Simplify Arm SPE event config
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_130405_849235_D7FD8398 
X-CRM114-Status: GOOD (  15.37  )
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

On Fri, Dec 12, 2025 at 7:18=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> On 12/12/2025 14:44, Leo Yan wrote:
> > Since configuration fields default to zero, the zero assignments are
> > redundant, remove them.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   tools/perf/arch/arm64/util/mem-events.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm64/util/mem-events.c b/tools/perf/arch/=
arm64/util/mem-events.c
> > index 9f8da7937255cc9b14c3c58a1119b40bd0c76f6b..eaf00e0609c6c1b7d939a02=
fe3794471d1ed119b 100644
> > --- a/tools/perf/arch/arm64/util/mem-events.c
> > +++ b/tools/perf/arch/arm64/util/mem-events.c
> > @@ -6,7 +6,7 @@
> >   #define E(t, n, s, l, a) { .tag =3D t, .name =3D n, .event_name =3D s=
, .ldlat =3D l, .aux_event =3D a }
> >
> >   struct perf_mem_event perf_mem_events_arm[PERF_MEM_EVENTS__MAX] =3D {
> > -     E("spe-load",   "%s/ts_enable=3D1,pa_enable=3D1,load_filter=3D1,s=
tore_filter=3D0,min_latency=3D%u/",      NULL,   true,   0),
> > -     E("spe-store",  "%s/ts_enable=3D1,pa_enable=3D1,load_filter=3D0,s=
tore_filter=3D1/",                     NULL,   false,  0),
> > +     E("spe-load",   "%s/ts_enable=3D1,pa_enable=3D1,load_filter=3D1,m=
in_latency=3D%u/",     NULL,   true,   0),
> > +     E("spe-store",  "%s/ts_enable=3D1,pa_enable=3D1,store_filter=3D1/=
",                   NULL,   false,  0),
> >       E("spe-ldst",   "%s/ts_enable=3D1,pa_enable=3D1,load_filter=3D1,s=
tore_filter=3D1,min_latency=3D%u/",      NULL,   true,   0),
> >   };
> >
>
> Reviewed-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

