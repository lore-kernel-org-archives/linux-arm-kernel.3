Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB7AD1950C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=; b=N65vgqyLu3xNpVlAh20wdCPNsR
	3Izcj675DLZUUJ8QvniS/tmzJGc6aT+DEP2BBZrgC0Xz3VyTYYPXynWYCrdBoDZPN4kb4QhpORai2
	Py4EfmRTcU6bPLOsjvdFOgTJ9huTPQBnkPezlpjAxkAAftV9V3gBCSbMIvpfZ3mb2WZyfvDl/y4wS
	P2qlW77HzSRuVNFJHV57NdAzdqexICC9esQp/yJOryx9FyxSqyYOs9ppUubi9I/uSXb4kvZuN3+Ow
	/SQTDg6AUR2eAkB8lejW6ZxK4ys5YpopOJcUH3cJVloK/hN6RnyYyy5DflFR7I+qPlGCHed+xDxHg
	UBXHQTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQGe-0000000CxUp-3F7Y;
	Mon, 26 Jan 2026 17:20:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQGc-0000000CxTq-0lPy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:20:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a76b39587aso136405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 09:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769448045; cv=none;
        d=google.com; s=arc-20240605;
        b=gHXuOAprvpIkbvt4llGZr85x39V34oMgXysQl1y9fc6aVOAe4BMTqBpGWkIfb6btRY
         wndLxIbSaBcajOgymLUUrZNjbaPu9gtQ9NIFAcS8XlD5iSNEsWWMqM8fbHoZfGa5puLI
         ljMEgcpvF8cy4TNotZp2Bh9fzALkp3wpMlrI4mDkLhdj8OchQqqiNgwxXvmQtoMBP0xB
         w6Wba2akox9MDzz6F16ULNlJw9JdE8SGkqwv4RFLnW96faP2AL+aZehK9V0S2PnQ6Bx8
         GpTd3zQtppAQUTzSyvZhZWcBqSWvFe9vwC3beMaLMkoHyv8X1lap4U+p00FZkPctvdAQ
         BwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=;
        fh=0txzeeiIX/6MheqpZTKOt4xY9tCim5sPwKatJkkDZeY=;
        b=YT6BsKwZpZSHts8pwBPwmiYgIH6klb07bD1igvIsdJPxT4IJABtOG2aZ4EbDQ25toe
         OdLzPQ9TRhp1+sYUtAs3jbZ3J6IJrzMq5Wj60Xt0Mijg8BbEHBys6O3cCed8LyASQD0q
         /r7nn3EZqa7ZP0EcZO5t1yQv/YIKk4ec14xI7SNTXWgsmrJbBuK7b9bzDVc+nlKpV/Ec
         HpHcAWASVQmkFIfsCf/d8GhILOzZ50ERmKYrZszV4vWiyOK89xTVQc9FPClDImMewtbY
         CSggWyNM5J1xpuOP04pn+2tDaHU9opUU1B/1Kyl8E8a0BsVfu1iG70RyAF2L4OmZcjgF
         0VIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769448045; x=1770052845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=;
        b=lJJ8VW72v+Wv9AspZ7941t/616JD3nS/mNIvtWOo8w9tbZFD9JdaiytsPhehGJiIVz
         yQFyjhspUpP4DoNmoZbuEBNqwFp6GOReq8JvV3uI8Nor2eKyfkljFOIA8SclrpX4oseO
         5umsrJ+8S7JFuraNkSoDHELE9cPiss4NaByiw0VieN+P2d8PA1u2JWst1yCCxAVKpqIg
         ZoQvQnEP8ibIIC8ohwMtRPVO3kZai/8DUSVcoX/5ifISeNKsJ7RW3Y6gGXcVzI5mcqrU
         sX5skVYvIHvxYtgnfLKN2T90Jcyuprmky2+kSf28b4yA3B9Af2LEFuzoIB9kLfvowFfn
         prCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448045; x=1770052845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=;
        b=bgm6hLZhEFWTD6obJrlp+7/cU9k3V32GiWPLcBLZ7Q51sUhb3FGzZ7GVhsguhUW89t
         4XReEDaRvmO2S6HhS2UOU/XYsJGuQ7x+Qo/sVCwPhssqAYWWUPqRBd98yFOFvZh/AumP
         GqKPPr4fIzZqCB9FBN81fL1tCuPUXjdS9tmHAop6VsCQoBPtqKVjU+72CUu0iwm7gtJ6
         BS3ZlatDxtMpTpchxntsTw0xzchjR5zcKAk4SAa8mO8GfPcMJSjczLuycri4j36EoNOO
         NfNJ14OymhZikvmwbCr5uI0lFylOT2N0IC3QXxp/EtmJLortsfOdXBbLNooPvc+FGEXy
         F9WA==
X-Forwarded-Encrypted: i=1; AJvYcCXz4EjQIeAB06RrTpF9JyFZob5SflzJM7eyffKXhp1OVsOXx+cMZNBWGKCLfDrpMCfv0gMd2IhylOXkDtrkMP6X@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3+qu27tvK61mgeQWlxDCSfKIOKTVwZQ/6X5G2LJbTMAuaKzzU
	Lzxzx/M0Y1sZshfeIVRGHeZZPA7Y1ioCYbnft2NcMCKMhiMvhZBAblFd38Bh4cN7WinNNzRWi8T
	pWAeQ8v3bhpb+s7/FFeJy9pA5+DIg58a+PLxHSMTS
X-Gm-Gg: AZuq6aLjsyKosqbzsS7jw16z0R4hWX2WLYJ57f7FBadczGS/iVYKFHns6imwcmn8RFU
	+WW4UJjGvIXKFEJWyHxs51kTpn3d9jbuGrFQnG/iNR+ZAyzGwmzuNr6CiIKhvpVNxAD5oGKVvjR
	LPZCiQmb8IOi2QOR1J9AuJSZ9Z4f58wg28RFTuL/l2GcvXFxMFRRBPxNM4Ykg83dCBy6aNlfITI
	UVeEbqNOu3OJ7KeMhcUTrZNosbppUj+2umscHxA9I/Vr9UZPkkkI5A5Oe/Sce2P5suNs+0ikpXL
	ZQ2nfnGxERR3bneXvIv33sD84V0mC4rA/NXM
X-Received: by 2002:a17:902:ef09:b0:2a0:89b0:71d7 with SMTP id
 d9443c01a7336-2a844e77f45mr2224565ad.13.1769448044951; Mon, 26 Jan 2026
 09:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20260126071822.447368-1-irogers@google.com> <363a4dd6-25c1-4bb4-8b53-64e00baa1a9a@linux.intel.com>
In-Reply-To: <363a4dd6-25c1-4bb4-8b53-64e00baa1a9a@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 26 Jan 2026 09:20:33 -0800
X-Gm-Features: AZwV_QiYFZrSRICCEHDlo9iaERVIgmWlIz5vZDkYKD-ocOUvTWQSdsXVMYftoaQ
Message-ID: <CAP-5=fV30XHi78SBHc=mJUK-7t9uiJb_YPHWZSG2g0Rm745pbw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] perf sample: Add evsel to sample and avoid passing
 as a pair
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, Anup Patel <anup@brainfault.org>, 
	Tianyou Li <tianyou.li@intel.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Derek Foreman <derek.foreman@collabora.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, tanze <tanze@kylinos.cn>, 
	Hrishikesh Suresh <hrishikesh123s@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Chun-Tse Shao <ctshao@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Blake Jones <blakejones@google.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092046_216160_5670F635 
X-CRM114-Status: GOOD (  21.26  )
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

On Mon, Jan 26, 2026 at 1:04=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 1/26/2026 3:18 PM, Ian Rogers wrote:
> > The perf_sample and evsel are typically passed as a pair. This creates
> > 2 arguments for the price of 1. It is also inconvenient if you wish to
> > rewrite a sample, as the evsel will need updating in all cases,
> > something similar to this currently happens for off-cpu output. Avoid
> > passing the evsel by adding it into the sample. So that two evsels
> > aren't being passed around, fix up functions taking a sample and an
> > evsel argument to only take a sample, the evsel now being able to be
> > read from the sample.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> > This is a fairly large and invasive change but doing something some
> > what mundane. Sending out as an RFC for early feedback.
>
> Nice cleanup. Better split this huge patch into several patches in the
> formal patch-set. Thanks.

Having several patches means having intermediate states where there
are 2 evsels (a parameter and one in the sample). Getting things
building with lots of intermediate states is one thing, having things
work and not break tests is another. I'll see what can be done, but it
was somewhat deliberate not to have intermediate broken states with
the albeit large patch.

Thanks,
Ian

