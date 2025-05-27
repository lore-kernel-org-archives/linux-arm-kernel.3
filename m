Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E1FC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=; b=bomvRh3HDR/G+9JZ8bEu/58FnV
	8bOj073CA+JUEP2lIxRB2E1L47j4nzIi0TDkwF2h0kGtLFl6BpZE/MK3gwQX4b53N8aWcCBv/aezK
	/femGkxWvMv1i8lR0svFv3rGcIbWiLoSrScrRQF//dNPl+O8phriSz6hJrZXusS+I1e91oEqIyxb9
	qd6Td+HDUOEE32bzz4ixTRus49llwe99uf3ogHNt3c6PCf2SHG6tzdqwjxSO4YB7JPhM8dLX0IrzR
	g2Ug9Bu7JHZksjDPzyg6IHXuTRMULuzDrXUygrLjqH9vdj5ZdOplrYOYFcbEDHNeMe1BRasidjRtd
	ncjUHvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr93-0000000AQfL-2CYE;
	Tue, 27 May 2025 10:02:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr6C-0000000AQDz-0D34
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 09:59:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so3083681f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748339994; x=1748944794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=;
        b=Hv5Z3xJtBUKLC2LMyueQaBrgLBc1mSCjp7U0OZZHoRdtahKpO/3Q7lAQ7Ztr/tVKzZ
         sRtZd1VEny8OFmrgrFjj4XGP2gbYyCZj1+oGTd6WdOEhOp0E/eKdzv+gDk/ErvQnu1T5
         wrNiYWrv+hySOyryw0bc5XrVcZnBQjVCji6rSjZUlh+tvI458gKMBLm0TvnAj7CrbwWi
         NBqXdWYhwLJGw1PQz8Yh9NqH/TJNCqEcUSobET/LZidQMh/9VePrgiDigwgXojn453wT
         ptFllgBvqc8WibKYmyIreQ15hwA63NuXmTtrAjpFlKWhSIg5Q7DP6kWGJU67f8h5vdak
         0PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339994; x=1748944794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=;
        b=mbKjPzjGA7Qqzjj0r5kFPhPhosFJhNjBpkOBygJzeMRwn0RO1aIYTKEsAsd4GHqk6L
         nagrPyFsbZudED534wqqEJj7h5J2Tln6l+Mxjbb3lf8KEjHu5WUErpCYRhZTiPc4b5oj
         fpCk+qiSMSV4dWXSwSQpJQAvyU70VAW1pEXCRldriw6CvADZ31iAInq/+PPcd1ad4OoS
         YGX6Q4jiGzDyQKaZxegtw8/ocszZ3M666baq2WXqltUvbiq44a96HGU+SPtfdPIhub+u
         ChWWoxlbKbOB62GqrS+idT8wiISrowYo8AdRnhnvCLHzbP+9PyoCQkAGdNVSUO4ALOC6
         e5bg==
X-Forwarded-Encrypted: i=1; AJvYcCWZpEwOhALibcG/UDpie4iS8k94Cl0jL9fPsCI2vsrHoLprG4uAMc/sV0fwWXzO2QnuhO7n7R7z7JtJrnx460hR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz23YtKo+mkBohJLddR0NI+8YgTwsb9Db1m9DLTwCx9rkqEZrHC
	T/3Ndg2zWgzbQRzOlxuC417gmvhTwzWi/kPng0P7oLmR+AmDHqirvTaIryoKWgE8iARJmKvT7oD
	jNdEdaCRN2uWOlBFoN4RGD9LRuWnGrE6VOSAoGX9zkg==
X-Gm-Gg: ASbGncvQYPGec6D4+IYZtfm+1cJWmtX7m1MO8iSyCTbPJEVRGlrIqTJQiFvQGPRsMRo
	kZxCEHcBAXfOTsnPjfe4ODmdLm9S67ScWoTWdgXaLj6zAgziQBrBcoUVSPR1nVod7zMTFIPsO+P
	1h3XzuEmbgb7uGL6jKJlX+fizZcxEwMtw=
X-Google-Smtp-Source: AGHT+IEW4jiGzBYUUJeQ+hZ9q3VAC3c3XCEXdCJkYQj3sC6I500v3SraZXfwDAQYqmh+I1E3eL9qo1sRnEJZg8HQc9I=
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8e07 with SMTP id
 ffacd0b85a97d-3a4d6eda68cmr5556606f8f.32.1748339993821; Tue, 27 May 2025
 02:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com> <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Tue, 27 May 2025 10:59:41 +0100
X-Gm-Features: AX0GCFvLUhtMwBzFmk1b4gn3Tur4pK0okxD3qyqun7XWisCr-irbPglToM7Uhec
Message-ID: <CAECbVCvPCsHVvm5QKQrw+DDLsZGaHMgCHyJ=cp_gFcAyiFA4ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
To: ak@linux.intel.com, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_025956_358341_89B3D60F 
X-CRM114-Status: GOOD (  21.53  )
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

Adding Andi Kleen as this was originally written by him.

-Rajnesh

On Fri, May 23, 2025 at 12:26=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.c=
om> wrote:
>
> RISCV CTR extension supports a maximum depth of 256 last branch records.
> Currently remove_loops() can only process 127 entries at max. This leads
> to samples with more than 127 entries being skipped. This change simply
> updates the remove_loops() logic to be able to process 256 entries.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
>  tools/perf/util/machine.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index 2d51badfbf2e2d1588fa4fdd42ef6c8fea35bf0e..5414528b9d336790decfb42a4=
f6a4da6c6b68b07 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2176,25 +2176,32 @@ static void save_iterations(struct iterations *it=
er,
>                 iter->cycles +=3D be[i].flags.cycles;
>  }
>
> -#define CHASHSZ 127
> -#define CHASHBITS 7
> -#define NO_ENTRY 0xff
> +#define CHASHBITS 8
> +#define NO_ENTRY 0xffU
>
> -#define PERF_MAX_BRANCH_DEPTH 127
> +#define PERF_MAX_BRANCH_DEPTH 256
>
>  /* Remove loops. */
> +/* Note: Last entry (i=3D=3Dff) will never be checked against NO_ENTRY
> + * so it's safe to have an unsigned char array to process 256 entries
> + * without causing clash between last entry and NO_ENTRY value.
> + */
>  static int remove_loops(struct branch_entry *l, int nr,
>                         struct iterations *iter)
>  {
>         int i, j, off;
> -       unsigned char chash[CHASHSZ];
> +       unsigned char chash[PERF_MAX_BRANCH_DEPTH];
>
>         memset(chash, NO_ENTRY, sizeof(chash));
>
> -       BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
> +       BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
>
>         for (i =3D 0; i < nr; i++) {
> -               int h =3D hash_64(l[i].from, CHASHBITS) % CHASHSZ;
> +               /* Remainder division by PERF_MAX_BRANCH_DEPTH is not
> +                * needed as hash_64 will anyway limit the hash
> +                * to CHASHBITS
> +                */
> +               int h =3D hash_64(l[i].from, CHASHBITS);
>
>                 /* no collision handling for now */
>                 if (chash[h] =3D=3D NO_ENTRY) {
>
> --
> 2.43.0
>

