Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6075D3943A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5haVRGC9b7QkQ0SSs9IjxxUXgTNuHV1w/UHzqTO5Ok=; b=lxVC5vsZMGtmmRLFkg730YTsjg
	Su+iu9eC06UAdMMEQEfUqxoGLtq1vrRtKXvSQmu5UdNCdW4LMGBlidurxG+eGQd35TTYqBRmwEZCa
	mF42sWV8sWqdhGcuFbX4k0XJqEbwdcNv9RVBYaS44p5t33Fgy2P9tWD5t5ncUAJeWsgBFN0GkWsRO
	2k3FY3zWteaasIKMHg9i8yJ/dEmzT0KTl4OkwzjBK88xVwnNEZTfsFXghGG5wtr42y6tmGpssUAa4
	HmxlAtthwXKqYnv03Nad9p8Cmputrveeg/ycTfk1dCqn2Zq7qu0Mc/SsoikGuNt3Dft1CM4FclL15
	eMXDN+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8K0A-00000000Rfy-45Sv;
	Thu, 02 Apr 2026 15:30:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8K05-00000000RfV-0vpX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 15:30:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b0b260d309so77345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 08:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775143828; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXJhXOT2MsoMpXq9YyKkOVdpwppqMeLoevSwj1O+3we7C5E2yfiR/FqoDKI4rTICFY
         1dgSUzM1eIcBZS0pSRU8Ah0gMeTSl/gp8eCok0JpOEGsMx9syPAOLkKI55/pMH5lIv09
         epFw1qCjhJYEXCoeKcSMfnZDFxBRi22jfRWVoizABuSX7MCL62nR+oEusjZ8HDLXFyop
         oou9FVRZ9J4z9V7s80CzDTxu6zUX/H+Yp2VYm2M6MtD8MAXq2LeBa8/xe1U4D/b83hN2
         tBpO3fR2oj0ADokR0eXVfjEf6Kyy5JHQNsyjohCNsd7HwBbxRK/MzdVrFJUnRHniq8Vn
         Pp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5haVRGC9b7QkQ0SSs9IjxxUXgTNuHV1w/UHzqTO5Ok=;
        fh=wGEA6kxVhvblu/arPl9I8e+sxvHFtaPCBVCTD1wPBj8=;
        b=cD/WDkPd+18yhDcHOVy1g9jB8ODQ7ZsoEyHPU5KTuZ/6RxtTzyZgW+KyiYrskjUxIN
         NqOCfSmef8NjJQXbI5wvC9fd/9V8y29r0ehI2U/VCcBflQBmwc6rf20nU7+EsxEN3SEt
         uPUG3H4FYDOKdU2il3iDX9G+F/gkKKKbkJVRzKyagQl+IXJXHqbRyZoOsZWIOrYwmrlB
         37z/9HFBWTW1Asduq7JbZ02niVlBg4EnISJxfUK82eTPsM1k60w2c4md61zdjnZPr1GZ
         P8xhGHNvJk3zMsr/lHyk+HGKc9koYvcjrZwHJiSomra9F+c5nOfhi7dfyt6ZXF+1+ECP
         Zt0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775143828; x=1775748628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5haVRGC9b7QkQ0SSs9IjxxUXgTNuHV1w/UHzqTO5Ok=;
        b=jTiLmXv06jUbCmahzeO8NXDTXEGg/16PF90pX/dQGDnMhtDMBHWqCMYu1IA7KYCTLj
         gsa1fjPAEgHS3rt/LPA9hRazTIsHTLz48+uJcYLiK1m6eowRjcKrJ0KKlr7Vife7ZSsU
         pcDbEEDeoa7MU47gC8/ulUkHLDSA1bp9sBr0ohx3xPMSZAws3meJdZr3ALKzxNXQuzq1
         32eZM9QE0lESeq4tgxEuTplo7SvQ/uzpfLfEMk4/WRTIROeR6IILUh5m+12dpd6HL/uq
         1q3MndrFjmUj/eBsX9ww/Q/kvUILlPulVVYL8CPgz0V0xWt2CeyK4F05fF/w8E2ixQUd
         qICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143828; x=1775748628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5haVRGC9b7QkQ0SSs9IjxxUXgTNuHV1w/UHzqTO5Ok=;
        b=AwjNb42QRJzarcBho5yiSxtVjw06Vh5EwKysIvf9T0CbDbsnfKghYbsrM2IMTDAwQN
         JzYgQIT/3gdqjy25q7dXjgOgvaTa2blR7E8UCzP3o4KCKWwAE9+we+qeaGZ0Imj9n396
         UMb/tQOOZNbFBWtWYV1V7oyFL5zxZxPzErNsVPdyOCpnrtO0rm+PZUQdB9daFt0n5N8t
         jTSEcZtlZIACuvdEwgfTKKtFfeRCfzKR8m45QqXLMYnlybbWeBo7CB5ZYzIjQaRPxGN7
         LL9a/XLnw3qIeCgFaGShJMSbXNGrMT8mcghT1naio+xXktkf8/2D6JuwnrF882g2bKlg
         YDZg==
X-Forwarded-Encrypted: i=1; AJvYcCU87d1qQLwEvB/5SQmHjuZO8xMTjItnvdHWxeTws9Q/kmF9bK4a3B8bI2zP67pmhRJ3g3lSIEK5husungx9qTfm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2BVjt2wjV0Mhj+6AIj9qd03Sm+MUY3ztLKvo4SRLWenfXHnED
	Pq5RgwyCtFF1jN0AeukkrLC6yFEEhkWqxylCIkaHCQWy9Q5C7UslCguAdcuwDMn3/WiztIIyr7Q
	NdEYj7/Qj1hc4tr/rfwrTQwFAgJlAvV8/jydP0Adv
X-Gm-Gg: AeBDiev9VLqXzSCm+08NcRkaAg7UtTS/sCISKT3jrLG3GJSjXINpZwAWW7RwKEl/QFi
	p3RG25yFazx4M5fc0j0K1TNjCgho2P0eEpmUVeplEmZAJYtdv9oiRdmoW+498TBMy1cffGDBxhT
	Vvevwx0MbOkH5MbTKFb/SraK0nq3guknJ+uH0OwOSn5mjOOFTa+zM60wYU02qkL3eqCJafbbP3h
	CerxxK8wzaCgL81KAyP7KEXSxiUvz61lrrj1hSMZlH+bs+oUEHNe1FWAnXtx3RgZ4c8JyIarJ8T
	A9o6cqJ7xgx+MUhoUYnKqHQW53H2BrApzu5i
X-Received: by 2002:a17:903:b8d:b0:271:9873:80d9 with SMTP id
 d9443c01a7336-2b278455672mr2105515ad.7.1775143826015; Thu, 02 Apr 2026
 08:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org> <20260401-james-spe-impdef-decode-v1-2-ad0d372c220c@linaro.org>
In-Reply-To: <20260401-james-spe-impdef-decode-v1-2-ad0d372c220c@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 2 Apr 2026 08:30:14 -0700
X-Gm-Features: AQROBzAP6yKuK4YHefgxpwrxzp8Y2RKU7903BiEjJc1CooYruerIUT1QOmGlPIg
Message-ID: <CAP-5=fXxogy1-ZijUy1oWEjOM6JOzxE6erXEi0_uEzTc7M8vVQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] perf arm_spe: Turn event name mappings into an array
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_083030_878310_64F3B66F 
X-CRM114-Status: GOOD (  23.40  )
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

On Wed, Apr 1, 2026 at 7:26=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> This is so we can have a single function that prints events and can be
> used with multiple mappings from different CPUs. Remove any bit that was
> printed so that later we can print out the remaining unknown impdef
> bits.
>
> No functional changes intended.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 88 +++++++++++-----=
------
>  1 file changed, 43 insertions(+), 45 deletions(-)
>
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tool=
s/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> index 5769ba2f4140..c880b0dec3a1 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> @@ -276,6 +276,48 @@ static int arm_spe_pkt_out_string(int *err, char **b=
uf_p, size_t *blen,
>         return ret;
>  }
>
> +struct ev_string {
> +       u8 event;
> +       const char *desc;
> +};
> +
> +static const struct ev_string common_ev_strings[] =3D {
> +       { .event =3D EV_EXCEPTION_GEN, .desc =3D "EXCEPTION-GEN" },
> +       { .event =3D EV_RETIRED, .desc =3D "RETIRED" },
> +       { .event =3D EV_L1D_ACCESS, .desc =3D "L1D-ACCESS" },
> +       { .event =3D EV_L1D_REFILL, .desc =3D "L1D-REFILL" },
> +       { .event =3D EV_TLB_ACCESS, .desc =3D "TLB-ACCESS" },
> +       { .event =3D EV_TLB_WALK, .desc =3D "TLB-REFILL" },
> +       { .event =3D EV_NOT_TAKEN, .desc =3D "NOT-TAKEN" },
> +       { .event =3D EV_MISPRED, .desc =3D "MISPRED" },
> +       { .event =3D EV_LLC_ACCESS, .desc =3D "LLC-ACCESS" },
> +       { .event =3D EV_LLC_MISS, .desc =3D "LLC-REFILL" },
> +       { .event =3D EV_REMOTE_ACCESS, .desc =3D "REMOTE-ACCESS" },
> +       { .event =3D EV_ALIGNMENT, .desc =3D "ALIGNMENT" },
> +       { .event =3D EV_TRANSACTIONAL, .desc =3D "TXN" },
> +       { .event =3D EV_PARTIAL_PREDICATE, .desc =3D "SVE-PARTIAL-PRED" }=
,
> +       { .event =3D EV_EMPTY_PREDICATE, .desc =3D "SVE-EMPTY-PRED" },
> +       { .event =3D EV_L2D_ACCESS, .desc =3D "L2D-ACCESS" },
> +       { .event =3D EV_L2D_MISS, .desc =3D "L2D-MISS" },
> +       { .event =3D EV_CACHE_DATA_MODIFIED, .desc =3D "HITM" },
> +       { .event =3D EV_RECENTLY_FETCHED, .desc =3D "LFB" },
> +       { .event =3D EV_DATA_SNOOPED, .desc =3D "SNOOPED" },
> +       { .event =3D EV_STREAMING_SVE_MODE, .desc =3D "STREAMING-SVE" },
> +       { .event =3D EV_SMCU, .desc =3D "SMCU" },
> +       { .event =3D 0, .desc =3D NULL },
> +};
> +
> +static u64 print_event_list(int *err, char **buf, size_t *buf_len,
> +                           const struct ev_string *ev_strings, u64 paylo=
ad)
> +{
> +       for (const struct ev_string *ev =3D ev_strings; ev->desc !=3D NUL=
L; ev++) {
> +               if (payload & BIT(ev->event))
> +                       arm_spe_pkt_out_string(err, buf, buf_len, " %s", =
ev->desc);
> +               payload &=3D ~BIT(ev->event);

Sashiko has a bunch of worries in these patches about 32-bit builds:
https://sashiko.dev/#/patchset/20260401-james-spe-impdef-decode-v1-0-ad0d37=
2c220c%40linaro.org
The one here is:
"""
Since payload is a u64, does using ~BIT(ev->event) unintentionally clear
the upper 32 bits on 32-bit architectures?

On 32-bit systems, BIT() evaluates to a 32-bit unsigned long. The bitwise
NOT operation creates a 32-bit mask, which is then zero-extended to 64 bits
during the compound assignment to the payload.

This would discard bits 32-63, contradicting the intent mentioned in the
commit message to preserve the remaining unknown impdef bits for later
printing.

Would using BIT_ULL() be safer here to ensure a 64-bit inverted mask?
"""

Thanks,
Ian

> +       }
> +       return payload;
> +}
> +
>  static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>                                   char *buf, size_t buf_len)
>  {
> @@ -283,51 +325,7 @@ static int arm_spe_pkt_desc_event(const struct arm_s=
pe_pkt *packet,
>         int err =3D 0;
>
>         arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
> -
> -       if (payload & BIT(EV_EXCEPTION_GEN))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " EXCEPTION-=
GEN");
> -       if (payload & BIT(EV_RETIRED))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " RETIRED");
> -       if (payload & BIT(EV_L1D_ACCESS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-ACCESS=
");
> -       if (payload & BIT(EV_L1D_REFILL))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-REFILL=
");
> -       if (payload & BIT(EV_TLB_ACCESS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-ACCESS=
");
> -       if (payload & BIT(EV_TLB_WALK))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-REFILL=
");
> -       if (payload & BIT(EV_NOT_TAKEN))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " NOT-TAKEN"=
);
> -       if (payload & BIT(EV_MISPRED))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " MISPRED");
> -       if (payload & BIT(EV_LLC_ACCESS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-ACCESS=
");
> -       if (payload & BIT(EV_LLC_MISS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-REFILL=
");
> -       if (payload & BIT(EV_REMOTE_ACCESS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " REMOTE-ACC=
ESS");
> -       if (payload & BIT(EV_ALIGNMENT))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " ALIGNMENT"=
);
> -       if (payload & BIT(EV_TRANSACTIONAL))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " TXN");
> -       if (payload & BIT(EV_PARTIAL_PREDICATE))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIA=
L-PRED");
> -       if (payload & BIT(EV_EMPTY_PREDICATE))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-EMPTY-=
PRED");
> -       if (payload & BIT(EV_L2D_ACCESS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-ACCESS=
");
> -       if (payload & BIT(EV_L2D_MISS))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-MISS")=
;
> -       if (payload & BIT(EV_CACHE_DATA_MODIFIED))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " HITM");
> -       if (payload & BIT(EV_RECENTLY_FETCHED))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " LFB");
> -       if (payload & BIT(EV_DATA_SNOOPED))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " SNOOPED");
> -       if (payload & BIT(EV_STREAMING_SVE_MODE))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " STREAMING-=
SVE");
> -       if (payload & BIT(EV_SMCU))
> -               arm_spe_pkt_out_string(&err, &buf, &buf_len, " SMCU");
> +       print_event_list(&err, &buf, &buf_len, common_ev_strings, payload=
);
>
>         return err;
>  }
>
> --
> 2.34.1
>

