Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8BAE77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvpdmlnbvNyjwHZf76pbDfjmJncAJiI50qIYmlkFWhs=; b=DuwMKZjjnFBvI+E/L9zqKoVmCG
	tAgxgDRfy7IIKAF7YUIbwYZlSPUS8ivWUIo6PULYOfCuRVqow5+qX/rBXgDQbrBmeAEm2RypvgKbm
	ckIFTc5OXcgwA59s1aICipQ1q3/Y5SQn7AYKFXWGw1XX14XVU3C/O4zrKOk8Kh4QkxNntHDCfkx9O
	QRoXi67W3iwSKZhXhbBF5a7EtzvclAct8Sukit4Axsahq8xyXCSQZVYfrmehhdQpz6JHzQ3WS+JXy
	9uH2nIM6D54sxTH5FWFrMv23kci8SOToCTbmGDQE9FELUhQ2AG+MuLLXx9HT+IlTPRc4zk3AmqXI6
	h+nz0kBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNiLj-0000000FFa0-2Rih;
	Wed, 18 Dec 2024 00:55:39 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNiKe-0000000FFTo-3A0c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 00:54:33 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a814c54742so37835ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 16:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734483271; x=1735088071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvpdmlnbvNyjwHZf76pbDfjmJncAJiI50qIYmlkFWhs=;
        b=uUQPz/nTld/dSEd/PyCo/iKIobLH/6j5BGYd579t89e2Ae1/8VUvTNkzUfth1+I8fK
         XUVBFYovLDnhaRsnnthXyQ4QgkpE7ywa/AbKmE3DLB3RWmgio9JY3+YsAmEkxzciPy+f
         BcwVjVHOe9Lubf5QyMC45Id4yybcU4L7+WF0e0TrIQ1RCAcMIRh1Z2k5qPfOSSzW1b32
         WpueOFuhRbHnMaUicdeq+bzM0QPCV0osBq1vS2dLo4bX8KK6Bbnovih5mH2JAbq+gJDj
         47EnZx7G+bWBbvLxIXWNuLygiKrTWIl8AdB/U6jyoV5ufYkGLQhSdELqp+kZqPlDQVN8
         1XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734483271; x=1735088071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvpdmlnbvNyjwHZf76pbDfjmJncAJiI50qIYmlkFWhs=;
        b=te+HFzY/kh39dtZSWJoSM2xAv82ThTT/ZWsfn8ZUW0TwNZirrJ7MdwODhB5X5yc37K
         hyxhOwZRSDr8cWgWg36gNMh/PuOdDyP6DIEdJ4rnP+2AHYP1z5hpzQiktMED4wWwZG0h
         6gT0M3OeUc7DyhDyQnqgmvk5qGQBBrmK+pQFk12Na/kviNryqgV5BZgcL+zbOlY1Z0FE
         PWPk1etZ78IWnjTodNITkCoIxd6LtmRstZ4Yd7xyGKoIIwQI0GmCU0mi3CXkfTmyU4Z7
         PCUD9Gk+KYAN3R82FalwFrKaiLeyJLm/OUC9O801pj9L9DBmz+jzwCCws5wXdeD3PTFY
         IowA==
X-Gm-Message-State: AOJu0YzHbgQyjsqZF4iN61f9/rS4sr+K2sSnpCDvHN4vf6cq0gI7UPv9
	JHPyFzur6OSoGcAU+boDkiZamcMS7RO2/uxLoyzYk8HasY4kD5aUTGQFmMVc0C+G2RC9aqx5UVC
	ZK0KcKjKJiEVoMpTW58bh7VpUwJ2nwd5RpNjO
X-Gm-Gg: ASbGncuaZXoaVNUOfL5mrJHu4GgO6h0Q/HkLMO+jloSR3tbyoVFrJfSX8N6YSkoONh+
	KmwULiqA6h+CgOJWUDXzb/9GXDvC2HjsbH26zokc=
X-Google-Smtp-Source: AGHT+IEoTRmSrfTLob8bBnU0BLl9Mr4cn15d1XMTSUV5F1B2wnA9XXGqLTQNrwEm5b7QOJKp0qMAP56nopgrXwZmSjc=
X-Received: by 2002:a05:6e02:3c88:b0:3a7:c962:95d1 with SMTP id
 e9e14a558f8ab-3be34c58afamr427125ab.5.1734483271260; Tue, 17 Dec 2024
 16:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20241217115610.371755-1-james.clark@linaro.org> <20241217115610.371755-6-james.clark@linaro.org>
In-Reply-To: <20241217115610.371755-6-james.clark@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Dec 2024 16:54:19 -0800
Message-ID: <CAP-5=fU7RNzvzxBcAQy3RT9Ge3YtqPhDonupNWS7Wgb8HGQkGg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241217_165432_785546_0A8E8F11 
X-CRM114-Status: GOOD (  20.00  )
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

On Tue, Dec 17, 2024 at 3:56=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Document the flag, hint what it's used for and give an example with
> other useful options to get minimal output.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/Documentation/perf-arm-spe.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Docum=
entation/perf-arm-spe.txt
> index de2b0b479249..588eead438bc 100644
> --- a/tools/perf/Documentation/perf-arm-spe.txt
> +++ b/tools/perf/Documentation/perf-arm-spe.txt
> @@ -150,6 +150,7 @@ arm_spe/load_filter=3D1,min_latency=3D10/'
>    pct_enable=3D1        - collect physical timestamp instead of virtual =
timestamp (PMSCR.PCT) - requires privilege
>    store_filter=3D1      - collect stores only (PMSFCR.ST)
>    ts_enable=3D1         - enable timestamping with value of generic time=
r (PMSCR.TS)
> +  discard=3D1           - enable SPE PMU events but don't collect sample=
 data - see 'Discard mode' (PMBLIMITR.FM =3D DISCARD)
>
>  +++*+++ Latency is the total latency from the point at which sampling st=
arted on that instruction, rather
>  than only the execution latency.
> @@ -220,6 +221,16 @@ Common errors
>
>     Increase sampling interval (see above)
>
> +Discard mode
> +~~~~~~~~~~~~
> +
> +SPE PMU events can be used without the overhead of collecting sample dat=
a if
> +discard mode is supported (optional from Armv8.6). First run a system wi=
de SPE
> +session (or on the core of interest) using options to minimize output. T=
hen run
> +perf stat:
> +
> +  perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/nu=
ll &
> +  perf stat -e SAMPLE_FEED_LD

Perhaps clarify this should be an ARM SPE event? It seems strange to
have one perf command affect a later one, the purpose of things like
event multiplexing is to hide the hardware limits. I'd prefer if the
last bit was like:
```
Then run perf stat with an SPE event on the same PMU:

perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
perf stat -e arm_spe/SAMPLE_FEED_LD/
``

Thanks,
Ian

