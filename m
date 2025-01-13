Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32EEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INZ0B6iBklDeX2F+5IYxEoS6jrTc6xAI91JQU5/uctI=; b=RQ6ja6h5urBx+nj1aW7vz4hVI3
	ry5S3ICBEkE0BWKv6gHsJ36yUg9L+ms7BARqTC1uVObJUlVDM0p4bOcmNymdYcm3Pn9GZvpO6liio
	FDIj1MbvVodc/gIHKCEGNbwHXo4alaMnfn9isDPdWto24wQfTLQFQKgHGjoxDbbAZckvSrXTFH+lc
	WkfW1J7m6RiOXCewIQ9qshOPHTmmTqQrPuU+S22Iba24Q4icdxJEHgCSthiYWFh+AvPq0u/QKK55z
	X2xx0b7VngCw9dsGvlt8Kocnqs/kh2jpyxKNbS0QHIdcxATszMzsvBMWZxqQ29Fgl8tqWADaVzAbH
	m0NzAOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNDC-00000005pTj-3of0;
	Mon, 13 Jan 2025 16:22:46 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMiv-00000005j5L-1V7V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:51:31 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so340735ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736783487; x=1737388287; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INZ0B6iBklDeX2F+5IYxEoS6jrTc6xAI91JQU5/uctI=;
        b=a1xEUbO8NNDCrSUucY0fl/Fg5Bd2oGsAg0NpSCgoIK8Jqimp5mB4mBdna5iEc6uUfM
         zubfByJUA8jIWXXHFGM7dVHK47R8pLPhzoQQIe+uBGwzKagMXYcbLNBnEMYJOCdzplRC
         3/0gpfR2wCI18MNmdHxt3SupnKcjhX9Pt7edPCTW/WHsme0M/1+fA3wCGnPMHGAWPHuY
         5eaKMzkboFzLCefl6cZJqzY+FW/De+HkwMU1GjL9kmqlIfPfi25JlBfK3GpN5cOX7L5T
         MRa1/q8H6TwhvSo1D1JNLe88XzFXKhMPmzXogywSOAKSep+n0gS03lrhNuZKxXa9n+J1
         AslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783487; x=1737388287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INZ0B6iBklDeX2F+5IYxEoS6jrTc6xAI91JQU5/uctI=;
        b=HRz54tF6VqUg+2lNdww5unbV/kHNwPWRo0/S6zm6hz9HxpF42AXK2uZaTJzyPmwGxJ
         4CI4DI8YmD2SjechbDKcgwwUnINkP2gNjIz/y74xTqydPnOrSdErKvfEpOXNbvokUWwv
         42kF7L3D/zVRDtTi3WM6peUpViVZwd1nU6zAT7lA4g3L/4H0ewD5Cdd41eHcFDzE68x3
         d/b3E4LJdkCNZ/JS8QYWn0eZdVYDfiafEMajBt2W84o6UuSVjBjXt9owuXMlOWCxBbwA
         L+IpoV2iciXtfMlaqZsqXjnx3tTN77kjpQ5EQ4CFSI14mzmXTRKgoo9lI4l2te3yEf6A
         tRmA==
X-Forwarded-Encrypted: i=1; AJvYcCVvM5eVUjV/v+3UKcdIQCfZ1wiwwc+RNl/9JwaKugK0ttdE9cAgBFxaLUQwpbu/NwqjmGmygTATsFVF6zOG6Lpg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx786s51CbLrX5gkpzf0z/USRKnwKhqels7lbZMk8UiNUIDl6sx
	FkE2neIyXExyiAJQETexwF5Nw4/lQM1X7O0p9HlIIP8vubBOZ94k+pUX2fcjLHSUoD4q6/6dTZW
	IXqZchjIxoAKBk5bvs6ZosL4q/hiyrmLd9gXUSZl/uN4fkEwZuw==
X-Gm-Gg: ASbGncvzeSb2Lb60yb7vCTMV4TMj/4rewYpfvBzZL6hDbN0nK1mt8z8AExm+/O9YiPh
	x1rZaV9lkRkhKn4CbCyBlfZo1ZYtZmu4Qdr7cPe5YfrZpB102XJN4/8OEtK1wtg7SGRUTEg==
X-Google-Smtp-Source: AGHT+IFz8DLc5V3tpQN5NvmsIMT92IiGQbP2/vAb0j4DorUhoh9QalNbZkYCxgWQ1g7pdxxS+Ai2nY25JT8YyPyej/Y=
X-Received: by 2002:a05:6e02:20c6:b0:3a7:df79:71b3 with SMTP id
 e9e14a558f8ab-3ce589396d5mr9241005ab.19.1736783487009; Mon, 13 Jan 2025
 07:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20250110172006.680753-1-irogers@google.com> <da5792c3-8f53-4be8-8f53-e1cf6660feab@linaro.org>
In-Reply-To: <da5792c3-8f53-4be8-8f53-e1cf6660feab@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Jan 2025 07:51:15 -0800
X-Gm-Features: AbW1kvYBgR1Ge8kRNpf5x-KRRsTH8l00xG8qTvKhzBXVQx8QamgOWcH3rbBgrMk
Message-ID: <CAP-5=fXyVtZChi1fkochiyKw6AztdhEE_rfpJUsz_P9po5bhXA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] perf vendor events arm64: Add N3 events/metrics
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, Nick Forrington <nick.forrington@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_075129_401900_8982BF6E 
X-CRM114-Status: GOOD (  18.18  )
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

On Mon, Jan 13, 2025 at 4:35=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 10/01/2025 5:20 pm, Ian Rogers wrote:
> > Using the scripts at:
> > https://gitlab.arm.com/telemetry-solution/telemetry-solution/
> >
> > Generate perf json for neoverse-n3 using the following command:
> > ```
> > $ telemetry-solution/tools/perf_json_generator/generate.py \
> >    tools/perf/ --telemetry-files \
> >    telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n=
3
> > ```
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   .../arm64/arm/neoverse-n3/core-imp-def.json   | 930 +++++++++++++++++=
+
>
> I assume you got warnings about missing groups, if one is missing that
> results in everything being dumped in core-imp-def.json. I have an
> internal ticket open about it which is why I didn't post N3 and V3 jsons
> yet, I'll check on it again.

I was testing with JEVENTS_ARCH=3Dall. I'm not sure what the group
warning is, do you have a link?

> Up to you whether you want to continue with it like this and I can send
> a fix up later but there's also a conflict with the recent Fujitsu
> Monaka events.

I'm happy to let you push the updates. An alternative, that may work
around the group issue, is just to push the event updates. Any chance
on an ETA?

Thanks,
Ian

