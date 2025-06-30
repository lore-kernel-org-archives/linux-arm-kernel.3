Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C353C83036
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=; b=pGPk/co7PBTOHb0LGzBKIaf3Ck
	NsBWwtfdcL+d3puz9e8TL7zxOfrGR9/17Rrpbj1Oh6vGh+ba20CFsiSLbT+8YSklQicGLNy1JjAWh
	3y3PRsdTbhuWGjxhzSWQ2fCqBZLkjeAq1RbZi5DcS4pjkWwH3SjYpW9kHDpoZOA4e5LMA4GhR94q/
	nfmen7ULDoFRZ72hDVCyxWpmFWYct6N7T8ezK11+iPg/B/H5o3P1CBVOgrScNmePdkEPcpb8GAEHG
	KFpwHwTgzlyJwEY0ap6etmYFKJl1Ii/Qpaga3CkzzLL6TNflHKKEDsRciX7QdoNWZgKUhm+c0dkZl
	R7m80SXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAV-00000002rQA-0haz;
	Mon, 30 Jun 2025 16:15:43 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGXe-00000002lmc-0kD6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:35:36 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so488645ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297733; x=1751902533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=;
        b=uG+tjkNrVAnOBz76f2Q4sHntDHHb0HImeZZKvBJ06NTe+B2qieSww7EfvsDRLDTzTJ
         AlHGxBk2h2fIMGRgiaDYNE5tFhflVXnsOy7P7EtBkaA2ii03fOlmgdwEXQKnWOy/YXer
         Uq0+voIKf7I+l/+SknnNbrpw5usE3zNoPKSKAuPxww9Y+Uyu11BpbfIi3w9j3kDuFqBK
         5TdJyTS62BpGZF6oQFzOWWOOOprCtICt289gWyqS9Zepf4icksEYGhWf4Xi4SY9P332q
         mwRQsxsJxls2Be7bfvsDpHxohuG6FvjPkC5gNJVVr59nG0GqlVUDPGqGgcP/RJYzcS5D
         5F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297733; x=1751902533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=;
        b=osCUxDgmJfqwiZuVn/8/FFmTqUHthCa9H6A6FVrQpEMyInYfoZdCqzL3RGLyEQAUu3
         vOO2BGJQseHnJBwVdBpz02suZ1jNry9MpwiEYOpNyeXBHbDHM2SRq0zKZfXLpz0S1R9/
         MLRBx7/Sl7FyPQ+lfDURrJQ8TB5WUrE+8fUchBucYwk2//Rp0l5ZDrNeINV9lp/rwYNu
         7CH2TNx4RzijMb5R65LylAJzQ6n7zuFwOVDq376WyRySN/qyJE5Ugvn6fPL38lzyd0Sv
         FIwQfGXGYj78iBYL8FbRfPiy/fmEP+C77sWXYFKi1bTNH3aBlYMxti+Ka71kddITYZ2C
         W1yA==
X-Forwarded-Encrypted: i=1; AJvYcCVVkzBpVcs+Wd0ZTRn/hWAx6vK8Akij9fb0Ts9C9cUzs2OIf9IvTSSUS8uJVo8JGarv9eBu4BkfhMLZtCYjtTfz@lists.infradead.org
X-Gm-Message-State: AOJu0YwYnjrpQvSk4QZzpgpUZ4qw4caFE+swJ6Uf+EnWwNUk797mw50j
	TKh2jqZ9Uq78aXnekLlz9qOXI3Oj6rCxLC7uRrI5/Nyr1aOiOfGynfSey7tb02MdIjsJ6Ed3Hfb
	fQF3Er2RIjnwI8DGJbk6GCWIENNiM3OUFEtIsFnmf
X-Gm-Gg: ASbGncuPdMkJtat6l3JpzdVmVtZmUuUPeKNrKkE5SHwCSUuWWYwDvSIdus6kHp8ZXOg
	DEsGEQmN1Js+Tyhd+c/2whmV0Xk5fZy8MJdxyotoM3iZCJDcp9UAETtuQc8tuhfuQD2TzqpKWI9
	X5YvKOpCI9dkmot76MfyNXo1i7uK+kFUJ3hRQI6/bbUrWnC5WuyCwzXZ10xY4m9f8QLYSUFDWIj
	3nSR2Lbrw==
X-Google-Smtp-Source: AGHT+IHOX7kF7dn11PIYsXqc5Lvgd9CFgVl0JgQOIRErwaVxAn3VrCW+V5ML7ah9kVF847kUzTGbYaJQz6lAmBOdyCw=
X-Received: by 2002:a05:6e02:1a6c:b0:3dd:d664:7e0d with SMTP id
 e9e14a558f8ab-3df56d1d4famr6330985ab.25.1751297732904; Mon, 30 Jun 2025
 08:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org> <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:35:20 -0700
X-Gm-Features: Ac12FXyUBSBjSl_fXOEDXQ0KnLnvxPP2kraYhFsM6cPyGu_cMbUCD4cbUl7FD2s
Message-ID: <CAP-5=fVZjqapNHhZ_Gro39JmJ-57nEun-SQhM_rd=MkQbx3GLA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] perf: Add perf_event_attr::config4
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
X-CRM114-CacheID: sfid-20250630_083534_221983_4F4FC5FD 
X-CRM114-Status: GOOD (  18.62  )
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
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

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

