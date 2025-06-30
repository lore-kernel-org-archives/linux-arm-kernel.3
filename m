Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B0C8302B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3GKh4o61b7jyIv0Cvm8DV094/Zex2HvCho/VCSf17U=; b=G6LBFnNzMPkDF60diJkKecaJdX
	CUAV2ER0TkgJWI0w5EVtGiYiQyiZPPHZxnT0PfPZ1X3QrmJ/8c9YpoAfhm1HQAlqtiLxHech5A6pt
	sMXIzRkaPeCGVUTnVEla9aTcIPC3lAnKwZkDAh2RYG87jnfusbrlWOZ4ZdYwzhADkQBPoYrIUCIzV
	qvi7Iq8m6t+vceRcLXLLKOnE9v49eS7HJGy5t/wpQyyU695AtFxBlTXX8N5YYWM5Llr2B7JlceRYR
	5jbYIp0IxKSXvJotYR+nvIUhw4T6dLUhIZym453ihZcg4my71QUG0RpmoDA3gmUX5YiF73V2iT5zn
	myNC7LqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAW-00000002rSE-0aGp;
	Mon, 30 Jun 2025 16:15:44 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGYm-00000002lve-3Z01
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:36:46 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3df371e1d29so258555ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 08:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297804; x=1751902604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3GKh4o61b7jyIv0Cvm8DV094/Zex2HvCho/VCSf17U=;
        b=rlZgCS3x4Byq5xzIcHRqsOB1b19ayP2MIFSJwSBUTf5pp6JJDTAZZMzTbGlgDRk6ab
         NmpUSyJwkvAyG6wCuY258Y2JHogCrh4WgDYGHU+MUN09XJuB1HsOr9TfHHCkXAgv768s
         0tfR3Ds8MawwTqum13Bv2Cvp34HCjtoCxCAjo2l0uqDUV42sKa7baORFisr+F1miEmdR
         NEnWyiF0kD58EeLCaoXWxiO9aC92w8/GVGBBoqyFd5eZ7F5I1b+vBzQc4HHxSTeY8cml
         WgkzgS+iFfaDj4dtyrrgmZSxv2cMEGmXOjSpOA5bs1aCR+9EUe1eIZNv4Lj6ovWXQcIV
         UpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297804; x=1751902604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3GKh4o61b7jyIv0Cvm8DV094/Zex2HvCho/VCSf17U=;
        b=M1/X4It6sLz13yFUD3S5X5jsn12uX7/7stL/PolNaD5aWQ3Yw0a+4Z3lGu/gwkYkGN
         8YdSZYqirWMiMQwN7CsDLHT/MlRmV85QeNS94s/RiwRM5gpsZ0GrTgrdbjsm3H+I01f2
         W/eyMLBowASIvdRLnariwLrRSQzUwrMew7kVqnihxJfiJcVUiJA4IGRU6Jexxg8dkyFd
         DLGMs7leez8NdFjXl0jGLk7Cr5FUtQBvwgJhMA7iaSsSlh98KzZWbCtDVJiXygz2t6GQ
         TyC3zWF+xHcwto4cYXIpG+fCwSaihQd9lArw/IRGWbP+vffj80BqQs1VebFstK49B1Fm
         w3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXz2/KMRDeMohH+JlI9ZFyxOSoKQ0Ut8cxNO7Qcj6WS8FmyG28nOnkTv6ODiVgImrizobqmuo+ncT9pqLqxLudV@lists.infradead.org
X-Gm-Message-State: AOJu0YyxG/zJv+A3pOKxJPi861PV3MPDq2gVY6V5UCU4pYSxQJ1gO/Nd
	qTI7ZZC6nEyUTihPt4yvzPvb+7XE0ebZBjOsALwnu4A+GGuf3qwagpq51IKbg6SD4UQA/a3aGBH
	qmhPRXFHfSLZeGV6O4ZZeWwwMYZGJM1NUhQqNJ3tW
X-Gm-Gg: ASbGncvdUnB0v9Ac/xGJ7YCd5UhkzdI4JT0iMhVg3/nEIfLbL8LN9MAKzHgE5XI6tSm
	5JoCfry5too/Vv+KJNFdnNvUHBIXlgAk5nwfjSYqJJHQM/G5xSNW3/Af55JtHw7p2+JfC0ThKLr
	sq/qvro8Zjjm0SGcLTgvICPR4lryMSYaqcNFF0MIyr8ZXD3f3yyv33HxTMXA+UVyLqVzIbecg=
X-Google-Smtp-Source: AGHT+IHCeL7uDDU5JOMczoHemzrfltO8zFE7mNOcumLGxZUSHGclDw+KN2fxow6X8OtdYvZ/ZfmsVer2qBLOgVRnCKc=
X-Received: by 2002:a05:6e02:11:b0:3dd:b59b:8da5 with SMTP id
 e9e14a558f8ab-3df55381c7amr8226995ab.0.1751297803769; Mon, 30 Jun 2025
 08:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org> <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:36:31 -0700
X-Gm-Features: Ac12FXzGjtf9e7aPdAU9e9fczw6vLUTz8vKdx9vV288aJS8GZ_7quQwpeJqa1_Q
Message-ID: <CAP-5=fWuKrtRy5NdPFivjSKx-fbw6P49QFepg1-1qUB=0guu_Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_083644_886331_8D27A20C 
X-CRM114-Status: GOOD (  16.34  )
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

On Thu, Jun 5, 2025 at 3:50=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> To pickup config4 changes.
>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/l=
inux/perf_event.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -382,6 +382,7 @@ enum perf_event_read_format {
>  #define PERF_ATTR_SIZE_VER6                    120     /* Add: aux_sampl=
e_size */
>  #define PERF_ATTR_SIZE_VER7                    128     /* Add: sig_data =
*/
>  #define PERF_ATTR_SIZE_VER8                    136     /* Add: config3 *=
/
> +#define PERF_ATTR_SIZE_VER9                    144     /* add: config4 *=
/
>
>  /*
>   * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +544,7 @@ struct perf_event_attr {
>         __u64   sig_data;
>
>         __u64   config3; /* extension of config2 */
> +       __u64   config4; /* extension of config3 */
>  };
>
>  /*
>
> --
> 2.34.1
>

