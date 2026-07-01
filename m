Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=; b=WQyrOEWe1jIZIkHs31gqbrMXFK
	9KqnDWCyly8mRCz8xRTtSwI7haF5bcaCRNiE0hgyeq+XPIiVE0Z7JV97kAxkK2ENPw9nKi6Vru8qW
	iEK7PGoRINeJ3ITDvF9b+/tkFDUdEi8ExI0taAS64bWyUecwsg51ve+K3THX6eUyH4aGfWPmOfpjR
	A7nFGBJV2AZiuteneh2oAkYFidqlafr5qA1bG3uTfB5qbNpDinFxM88YF00RGHWu1ZyPTD1vgMc+7
	49+k+b0GMA5f+X44VVriUAHmwr2YDP9S3BOhlCMh3j4eSG1o9JJlZqPrhDnvLrjMo1gblp1TjQ34t
	SvqiJPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzP-00000002kCn-2lK3;
	Wed, 01 Jul 2026 17:44:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzM-00000002kBX-1GgC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:44:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c81db32393so88845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927882; cv=none;
        d=google.com; s=arc-20260327;
        b=AjoqmkGWZwJIGzuRAxu+zsP+iEzE3tZ5qqS/hP2nFSvtiH2KIe0meEu9HOOCKUUPCn
         K+SHRwWc8vNpBL5dELinM6OJkPeUjOkhscEKIYJCCoDTCt6VDt9Sz5swLrhF3c0tURn+
         nHYdf6dXEmwOPgSQ9pWWVK/FZPy1oUWjhx9H1Db0rCTMAc0LjHWWJtnGX2LyQfi2BlG2
         ksFlHpebn+i+O1HK8/TvmIJjR/IzIJ36e+FRlZSu20YpuqwSLAoWbBOXDmHHZqbT0ebg
         Kpo3jgRpTWNcwJ3S7n1oIxRGlPfw443nm8qa9GSYfRinMWU2ux3x/WQ9e0ExUkjFyip3
         N2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        fh=yh9Xvgoyao85b272uDtHJ9ZAVsB7lzo+3PDMl2nyekM=;
        b=lM8Rzhw5QlXy/un3+5ijJRyCfdDqSS12eP1w0Nq0bqsZXpUziAo8/mzfmE8sc8tZcc
         8d/AfkVv5t6OQnoTES4gxt7deWYi2p0TmKbvITvlYevNQfloczM1coXfsF4hfpZvLWyO
         rb3YmAcpTrqPUtfvYUw3iWo8vF5FuvaQVlficT76/4g0ZuUZVC/DvRWgbPcvw9SlFZ/3
         VsG9hOW47cUEe3YyBKgcjmW+fJtoO0Ok4ZELdks3+hO63WvQvbg9mqi67GrofzhOKOSj
         PsGic4HEs7JvMvn/jwLNGys/bNT8Kr6YWmVHKDLi9g4l2PpD4RrpdSghbiFm7pMHAFb7
         CvJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782927882; x=1783532682; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        b=klXGz1bDO6QsHfn5NnBWmz1V9YF4MIAdJF5R44JRCfja1CLoaYdk9OrDwAZnbH3sj0
         ytT5sJxVMSJyRLm5vMxYqCubaMo3lsuS8h+ozbtavNPxGf03tez7FcJ5T/zw9nmzvgHh
         L6oV0PJEEB+BuMFZlmTpb4jnDFgvX7Heazn8JjUOLaRV/M393vmbaJ0dLZvm5lgkiEMH
         FLcnzHRwnxElJ/0bv8gitzsQXWSIQwO+cjwfL7+JE9u67gJovmy7Ndgldwp429rQnzrS
         4hlFhhLV1rQodxVUcuR9Dw7nOpI6tu595sZUJNQqeZvmVKa67U5dYGvBaSYbja/tDVi3
         YdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927882; x=1783532682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        b=f9VNwBuzi4oJWalEiRcA+yrGUv+NWRdjj5QNEbDimXmxUxz42daN6seHQQyRYDq325
         eZ+IkA6ezvN6iQJMb099Rxw0eQPz3EZYoZwVURLe+cSEl8kaZRkdM0YkYqdWsORjDO9h
         L0RHivjdIlZaQju0iWOoy/UhtZGJkU50JVwr8VqJpEh7WJhRR4ZNI2rmsdNFR0CNpuLr
         eb6t9corAUajWyolz61y+nuDejE2Ili8Sg11Eh+y6LDNwKY8GltbCCqLgRPA09L37Bjb
         RFA29FLPQ3WBGdNZn64VNZawsP5D+l2Cgi1Ti+yhJFuK+SC0BaTpSWn0QntAEFzFuWRY
         ZLRg==
X-Forwarded-Encrypted: i=1; AHgh+RqSvIMmWKUJ30lKqdnDnY9ht7Fomi3pyR0dB70YyrM4bunCEnLX6g0kGOExMgT5o6Oz1ZDgKpC6snNyX+RdxKHu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz7jCkNF2wWk+aLK7r4dURpKRbr1ipvGbQ1GRkqBqv5TI3EXLa
	UCfBDaSMSHsHhiCK+Q79pe+OkTv8iaLIgEW2QLcERVoK01kb2DqDy/fpGp5XjSlu/WjrDBw9jnV
	dBOCODO+Aiil8tK8eBjJZMk4xxzs7AXynatbPYjHZ
X-Gm-Gg: AfdE7clrU42sXR5BF3uXg0dXl+kbTMG+xWnhgC+2gRxfM0IUeAP6itxMgxS9x98v+TY
	rZ4eeMFdTlEJMeru0e5LsJGWOPYK6JibaEEPjHFzIa5Pw5RnOLsY/ojZLNP+/f5NvEzTCRF03lc
	cRAy/T0sVVDwds6at/fnZWr09pb9QY/CPmsKQPQwsl7rvCJbTtTsMsLtZCM+cHOFgN/3thPxoYF
	o5Ff+IFuo7lbbdW+N1Xv8aZNxSUbiZHuZRNJn4/jaTFM36ySW6A+Wx/P26+hk0qMlH37Z3sw5qs
	PQyX+WAi
X-Received: by 2002:a17:903:1c7:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2ca7092e3abmr2685955ad.18.1782927881605; Wed, 01 Jul 2026
 10:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Jul 2026 10:44:29 -0700
X-Gm-Features: AVVi8CfVI0-HeGb5BzxacOi52xTnZf0837ZLQ1Li6xufzgI5Rfn0UuYpoo0nJUs
Message-ID: <CAP-5=fX1wR0tKyTiLjpK5JKWUP8j=E4meaPG1eyzTwj1XuKmFw@mail.gmail.com>
Subject: Re: [PATCH v8 19/22] tools/perf: Support event code for arch standard events
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104444_340557_33EB5913 
X-CRM114-Status: GOOD (  22.98  )
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

On Wed, Jul 1, 2026 at 1:48=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> RISC-V relies on the event encoding from the json file. That includes
> arch standard events. If event code is present, event is already updated
> with correct encoding. No need to update it again which results in losing
> the event encoding.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
>  tools/perf/pmu-events/jevents.py                    |  9 ++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/=
perf/pmu-events/arch/riscv/arch-standard.json
> new file mode 100644
> index 000000000000..96e21f088558
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
> @@ -0,0 +1,10 @@
> +[
> +  {
> +    "EventName": "cycles",
> +    "BriefDescription": "cycle executed"
> +  },
> +  {
> +    "EventName": "instructions",
> +    "BriefDescription": "instruction retired"
> +  }
> +]
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jev=
ents.py
> index 3a1bcdcdc685..0cf9d26315b3 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -413,7 +413,14 @@ class JsonEvent:
>          self.long_desc =3D None
>      if arch_std:
>        if arch_std.lower() in _arch_std_events:
> -        event =3D _arch_std_events[arch_std.lower()].event
> +        # Inherit the arch-standard encoding only if this event defines =
no
> +        # explicit encoding of its own. Events with explicit EventCode,
> +        # ConfigCode, etc. may carry alternate encodings and appended mo=
difiers
> +        # that must survive.
> +        if ('EventCode' not in jd and 'ExtSel' not in jd and
> +            configcode is None and eventidcode is None and
> +            legacy_hw_config is None and legacy_cache_config is None):
> +          event =3D _arch_std_events[arch_std.lower()].event
>          # Copy from the architecture standard event to self for undefine=
d fields.
>          for attr, value in _arch_std_events[arch_std.lower()].__dict__.i=
tems():
>            if hasattr(self, attr) and not getattr(self, attr):
>
> --
> 2.53.0-Meta
>

