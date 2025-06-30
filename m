Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99CFC83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koSKvu+nJp3uxbt5cwdf0o3CkZhZBMZ1Z75ULUCsakk=; b=NIUOUbvY0ux1AmWx8iM4vHAvDI
	LsMkuEi37wuZjN23Ek2+GuM/EhfiJaIO2PRjBJ8jy9JZ03kL2nUZdErEHNbF9g7f2c8IvwGnGkZmt
	GdoyAAsaLhziifT3VM1RKUAloact/DiiU+T3RpLVULTgYwleyG8SFm5YKyLD8lStRZgNZXsg54mJE
	n4K4BsLNIEnZRV+9WV7TcJP58BYoN3PjIcSiFegJrdZApPuadq2SmCxHUe9xUHP4s9g7w7WiAxune
	iN+B7lB8RDfa2lcJgB2J1ZvtqUhPaX4KxVpmydu3F2HJUmt1gTTOLmk34Xtw0T0NUBuoJfbXkTFco
	sPwIDciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIlR-000000038EA-1ybC;
	Mon, 30 Jun 2025 17:57:57 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHl6-00000002zup-1tBA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 16:53:33 +0000
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so10685ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751302411; x=1751907211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koSKvu+nJp3uxbt5cwdf0o3CkZhZBMZ1Z75ULUCsakk=;
        b=IZVw6L6+fhxSZlgbKBKINITRfk5rWA7Sx/MOPtghat57T9djAdeORMadZ0BpOOkL8S
         6o+BZQvPJDoAJV1qeRPUGO8Hs9hTQS/CpfHGnoer+OpKb8lwW8h3MZov8CmVyltlPHjw
         Qo+Leo+8R2xHL/o0WDEldsmjpmb2n1rlcN9Q3es7P2N2mMHbVE/GSlOo9GzdPxrny6wJ
         j4dRs3rhEcV62qWcfc+HsHLQx+JA5qGHXrc1sFvhGp76dqnWRCR5mVf6CwegmAjYv/S8
         qEbmoDXVD3qHNFPlHt2H0EdlWRPIEiK9zPOm0L9ZMRoIJrDTmAZf1/ISKNwk8qdDJBUZ
         nflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302411; x=1751907211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koSKvu+nJp3uxbt5cwdf0o3CkZhZBMZ1Z75ULUCsakk=;
        b=CnI4wJroJgq+mCyDM/SBw8bbXE9arjGrNbqx+LLluOx69cMc48sRHoHBjOQjQA7jsy
         Eu7X0k++rcbyme+5LaRqVPEjJlXdxKkc/mI667HR/jwCVKCwROZNhZYA+4oHX5A9j7nS
         JYsTJXsMK62X5IB1zB1/RakESgEAUZU41YwaHKW1rjMK500im7vNUNh3crasiWGDRLuE
         6CKaThvijxSC4tMee7pmKjf54hOiq60WVk1XZ1EXVgtoZY0zq7o8sXPUTkbcLq8Sdk3W
         kLzSUVzdrQyxGlT5JxchDOCW0Uim9Ii6Dv22yR2kHKFqpcNRRqiCHFK5H2ohtEB4rDLe
         uC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWKbfnfpcYqpTa+zGpLvl0bz69Sgrnxv2+21WUanKYmt4loAeF92RaD26d2LO1SWEylt9WBBz+iD0VvcnSFqEh@lists.infradead.org
X-Gm-Message-State: AOJu0YzWsYJxr/PiF0reG+sNzK4KUReTkoRw8ydwTo25KALe2KFPDc2X
	mFCEWugKx2jZ8/CxQUv3EfiEaWZ7CoZkSd/KveMpy0O6kJVEwPGXsahDMiYQuJURTWcsXHHFQnU
	7DYk9MWPqNlOzosVPxD0MZIW5QK+V5AgXpg0Zz5vo
X-Gm-Gg: ASbGncutx8Fw1cjb0cqk3VnBiOgesQxLJHWNQe3pILVUdFkb99EW2iqmxg6jVP9iVpd
	TwMORHyzCs2pxGAIDwP3USQhLfqfu6+BqcvYC/gA3gab6ge5aIPJeLXaRVM71jr/JZKrE4QwjpV
	rp+f98CtxriVxHss7Xi5u96FBTjr38ifodhIo1+OUonaCQSj9Y83S6atBfEP9M2s7/iZz4LgE=
X-Google-Smtp-Source: AGHT+IHf4Dw8AT09cTLDPz/Q487i7S0vAQhToyal3XnhCSdoAf6NiHqu4ggTYRi5WambGva/HYOXYgw+LKcaM0/XK40=
X-Received: by 2002:a05:6e02:1807:b0:3da:7c33:509c with SMTP id
 e9e14a558f8ab-3df56ce725bmr7175165ab.11.1751302410870; Mon, 30 Jun 2025
 09:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
 <20250630-arm_spe_support_hitm_overhead_v1_public-v2-11-2e1afab313b9@arm.com>
In-Reply-To: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-11-2e1afab313b9@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 09:53:18 -0700
X-Gm-Features: Ac12FXwouBTXnLdSPlYJcdiMXR08fBuompdMOwzk6okmpTBgNCFaF2SVe7qtqQg
Message-ID: <CAP-5=fUPfKB5Va_+sO25yf5Y-SjQTR6WsauqcmxirVzgjRNVAg@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] perf arm_spe: Refactor arm_spe__get_metadata_by_cpu()
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Clark <james.clark@linaro.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, German Gomez <german.gomez@arm.com>, 
	Ali Saidi <alisaidi@amazon.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_095332_500741_82108DA0 
X-CRM114-Status: GOOD (  22.95  )
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

On Mon, Jun 30, 2025 at 8:24=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Handle "CPU=3D-1" (per-thread mode) in the arm_spe__get_metadata_by_cpu()
> function. As a result, the function is more general and will be invoked
> by a sequential change.
>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/perf/util/arm-spe.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 3715afbe1e4713b5eebb00afbcb3eaa56ff1c49c..5b6699f192e5e58bab6b0d8e2=
e8df80fdf404a36 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -324,6 +324,19 @@ static u64 *arm_spe__get_metadata_by_cpu(struct arm_=
spe *spe, u64 cpu)
>         if (!spe->metadata)
>                 return NULL;
>
> +       /* CPU ID is -1 for per-thread mode */
> +       if (cpu < 0) {
> +               /*
> +                * On the heterogeneous system, due to CPU ID is -1,
> +                * cannot confirm the meta data.
> +                */
> +               if (!spe->is_homogeneous)
> +                       return NULL;
> +
> +               /* In homogeneous system, simply use CPU0's metadata */

Could this be derived from the spe's pmu_type? Something like
perf_pmus__find_by_type(spe->pmu_type)->cpus ?

Thanks,
Ian

> +               return spe->metadata[0];
> +       }
> +
>         for (i =3D 0; i < spe->metadata_nr_cpu; i++)
>                 if (spe->metadata[i][ARM_SPE_CPU] =3D=3D cpu)
>                         return spe->metadata[i];
> @@ -926,22 +939,7 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *=
speq,
>                 cpuid =3D perf_env__cpuid(spe->session->evlist->env);
>                 midr =3D strtol(cpuid, NULL, 16);
>         } else {
> -               /* CPU ID is -1 for per-thread mode */
> -               if (speq->cpu < 0) {
> -                       /*
> -                        * On the heterogeneous system, due to CPU ID is =
-1,
> -                        * cannot confirm the data source packet is suppo=
rted.
> -                        */
> -                       if (!spe->is_homogeneous)
> -                               return false;
> -
> -                       /* In homogeneous system, simply use CPU0's metad=
ata */
> -                       if (spe->metadata)
> -                               metadata =3D spe->metadata[0];
> -               } else {
> -                       metadata =3D arm_spe__get_metadata_by_cpu(spe, sp=
eq->cpu);
> -               }
> -
> +               metadata =3D arm_spe__get_metadata_by_cpu(spe, speq->cpu)=
;
>                 if (!metadata)
>                         return false;
>
>
> --
> 2.34.1
>

