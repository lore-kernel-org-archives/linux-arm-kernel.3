Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F125CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhFVRc1NfpOXTxJauWn9T+QK0y3Sx+B3L8yuuFsdMS8=; b=KhN/uomkzEKOjDew/h3gmXX6sP
	4Z3tHteFdUBTqpypwfIjh8yml7jXgRZTROJNao+ExqkdxNXMzbwgQlMrtErnZ0fgg8TeMMN6mbEgE
	oE0TxUAvqc6I59kALBsmbA4nk2Q4YmxKAGiJyW3pfOZ+MWSQmhlDVn0dRL+755iDcen8jSdSkbiFt
	dlABBI5l/U966Gfy+Yt8m1PtkxvGQzcgn3F8i0orEoMbtNLoWCjRTdW/WNqvC0OZBsZuUYGxtBaJg
	IM27GeXGPTb4JPFLFycDCeMOMiih+FyyLSu71ZjWfoY0QJ+fTIPNBbHAY3eJcP8UYQUVARhCRhnJ9
	HDmAjtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3j8-00000008BWD-1nwj;
	Mon, 18 Aug 2025 17:32:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo29S-00000007xbw-3Kx2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:52:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-242d1e947feso383655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755532321; x=1756137121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhFVRc1NfpOXTxJauWn9T+QK0y3Sx+B3L8yuuFsdMS8=;
        b=YZ7E1j6Z1kTE7piZIhKADtGzu06UTQR7N/IZUyTdBDsGw73YVXrIswtEW7chA6SzZy
         WvGkX3arPJ/ffSza2k+KDC3RULObUEnW6uxzScNKHyzIOlg2k5JQiLLBAL1mEjyTAbn8
         GQaEUPKvpVSh3AmSalmdkigZkBGk+sZMtSyLzP8hXM2pFmjOU/UrCR905pnKbyTjKFD8
         bOYX4Jup80UZ1b6iX5XfebUG7UmzX8kilUXzyZYriZcW53LQSwhfVFOujaPaMFYx2ngM
         IhDxTW0tI8EUexbKyFhUoh2/HByjwk7FhN3l/5q+TcKZq9LXZzP9cQ+lxwX0hAfTbDIf
         6CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532321; x=1756137121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhFVRc1NfpOXTxJauWn9T+QK0y3Sx+B3L8yuuFsdMS8=;
        b=ILYROUmyoexXFgQFd0whuy/QLxJ7pP35Qwtvkj2OYNOHZXJBJ3dqotbJ4/L4U2wdJa
         j8DNlY/zn09nkx93BTwptTceFSctDud+bKs7YhlRA4zOtnhQVjPCh3iZfwK1knwnkmty
         o5y3/Vcd3VpwPQCxXVlYimQrv3rHVSfHA49rgOz5OtzUe7lA/JX7SJBgEK2ZywvZUCn7
         yUsSyZmmchYMgO5jMH3l1hzUxBP22RkvMmJscFWm25zJhN7IYrDlwAjFLrkuT/oSsR2Y
         BpMvAvoL0A7VQ/DML9sBZm1XXS7sRhggcPsnrcsecm1o014ix6Wuis/hzar2t31GdRbG
         rR5A==
X-Forwarded-Encrypted: i=1; AJvYcCXWKhpkgl1TJbAomzX8aJvbVU5zdg1Seeg1nyChHBimnDIvBD1uIa3oZhfPHrIAtg5E360a8NQyIOkKdTGyd4s3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6OZ++MJF+s2cHGvRYK5moUeUH4grbDEWHsxQ6uRwZUGvzv18W
	rjNXB6xH41TaUoUWFz2xcH9yjr/UQduBxqHUgrCwKBiE0/puAWrxqtyQMzIfx+IYFHpBJhbyCKP
	Dilc2hU8LH4SmS6uHJdYscSQuQjQXM5JokAmvrvHq
X-Gm-Gg: ASbGncuiNjQUgQvDkTrDkp1rKldaxaCelYVhLynm1Hd2OOU42G/7jDYT3MAHCyGTcgV
	Ehabf0644wG2Yegl2H1KiTnf4hHVOwu9A3SklVfl049YAQWlmhyW2Hcww3TPdWBu7h7wsONPvU0
	rqSTkR7+lfkc46jS7HMkGyFKvbGDVDl0omuGNiY9+f5FB+MQaORVEm3IQP+f4IVHtqA7hMLikk7
	uWdgdv7F38FzWbtPSevZaRZvxs3QEe6M25CMkYup7PPbYg=
X-Google-Smtp-Source: AGHT+IFBH6QXJvRW18+gfLm+VEHNtKAKh4EWppvXhfmrKKXkPioVQ+b0Kd0ODwqL4Zd3to4i9UzRN7iKxM94h8uE8ug=
X-Received: by 2002:a17:902:e54e:b0:231:ddc9:7b82 with SMTP id
 d9443c01a7336-2447a77afebmr6549035ad.13.1755532321031; Mon, 18 Aug 2025
 08:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org> <20250814-james-perf-feat_spe_eft-v7-8-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-8-6a743f7fa259@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 18 Aug 2025 08:51:50 -0700
X-Gm-Features: Ac12FXyV1x2afpy-E2EhDR_cSfBMqeVdgvNI2wMfxjm0rwNa4JtVzwidrn9_Mpg
Message-ID: <CAP-5=fXBot2K0MR9t7o6J7-FihNXzKcotdF6p3bfL7DwqR9jfg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] perf: Add perf_event_attr::config4
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_085202_833438_01E255E1 
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

On Thu, Aug 14, 2025 at 2:26=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.

Somewhat off-topic, imo it would be nice if we could land:
https://lore.kernel.org/lkml/20250603181634.1362626-1-ctshao@google.com/
and show all the config values via fdinfo to better allow tools to
diagnose when PMUs are busy, etc. The patch there tries to be minimal
and just reveal config (even with being minimal the patch is stalled).

Thanks,
Ian

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_ev=
ent.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
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

