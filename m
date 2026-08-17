Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36A6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 04:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=; b=gRSZ8b4kmCgOIXU/BqQ67CXlIo
	/KVjXUnp3lZlVHd0IzQ5aBZgCrH1u7KOPhCgQbcVGoMP5gsNOK3AP5yaHmk1of7ewVs/+j0Odkh0c
	KH7MJs/JTB1NzRJwx5QhiwsTJkbvC+ICbfzmTYPk3RTq+Gz7/1k1gQ4O5U3ZqpBly2q+PZNkBMX1+
	ZFsbsi9f82OQKmVjYTpfC0kN+tYJBAAMRepT38Uj0yTboADId5Ks4TllVkjjr/IkITzphy88NdIW6
	Mj6iScnym8/G6Z0DflYhrOg37pG7JxFxt7RM4dD3jAl/uxs7VpmVuePYjm/R3OtjjrqJiRniH5u5f
	YbkIAD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvojB-00000005OOp-1BVH;
	Mon, 17 Aug 2026 04:13:37 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvoj8-00000005OOH-4Afs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 04:13:36 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c10ed63c0so540351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 21:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786940013; cv=none;
        d=google.com; s=arc-20260327;
        b=iFiuTQ4e1kS8zQ7ZYkyRqTPHNKnq3GnO9nusCSCnIPRbMXPS/EPOzNc98lGgL4+LPJ
         S4yMVRMrPELAAJcgHALDKhrFd4mzKuoNW4oZHa327xCUOwsEXtOqa1AVKVyHA0+JlwJV
         z+uluj4+9SNs/9+sAxxAAcI2YHH9pkSVZtrpcPRTvoFN9iGzpvkrwHsFlBBpcNseIi78
         DNk+fROYgOVXJ3vunWQudjWb9T0Se83g7kEMFsWbFaRpuLllj6myS1YN/HBtrWOeUfej
         uR4zpMDdw/KwWYVRx6aCj/TLmZpLuNJbUPcRz1mVUYVM3He7GdR69s5vEAWRSS/BoqBn
         Mh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=;
        fh=J7prGsqIyJ2ai6gMdgcsLhulo1UOr468HHxbKh6LEto=;
        b=CtRrL7QpMvtvSgU5ooFtcwRpoMKFhXC3uLAT2QCUKppEzurXVLyUu+5pKPI/9fkcgv
         eQKlNH+jJE47eJp+mGVVHKaRH5qo4x/0oB7v+00uD/LkcQkRp6Vus3ZqDs6IladVNSqN
         gTTINfoI8ROBUjZmWkXOMKCOAoroTx+vDT5UdqbJzhtqG7vpBLgTNKwWiz0/AoNLwB2d
         aCSLdsTS+ALmJpuOupmDt2OuBQxBserLPttP3rya1csS9l919pMayODsviXcqTYSsbx4
         Bbgzc50kO2GrpYRyMLmkfY+GviOf1e0N/G2eqro3ESbJPm7aUUgXzSfjboCpsryQIpqH
         Lqfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786940013; x=1787544813; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=;
        b=sGM2rjTUiYwdQL7z8RpdOT52qmjaxHK9So5iFEjFb8HZadfIqbF6BV6mFWjqpPmJPi
         dJ9oYA2SrtzCZ28p7ftCma07yPjHc/gIU/Ka4qwYgNogI7ZL7daQyzkz3GTqqAvFvsZU
         /Fj4F3092XvcBN0gEtqhHC1D5UWiu70cvP9BwmrRL9uZYIzk7BmzWMIzfrajmcGFrEzt
         Mg+oK7gWAhYz9U/9/Ivddg7xKAFYqxkVAJU0EZ4wiBePX2gI6uqI90sZ/+66AylZL10y
         FV+ftxkkasrRXrfv8A/c0b/LKSRRpSrrJwoWd5/DYZLPeLsZ/ypmbcouSNg8yIVWRGSr
         Wpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940013; x=1787544813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=;
        b=ehPAXl3WFQg8/gmRkm9TgsIWLoY/p9ruaGNo3b3dK+V21CagIUihcMJkOQ+QJocE6d
         5SE33BwLprb/eC+xIQIdCVGJ+mfeqa2fFurnw6YCBfTCpbpT7jpFqmXat5VZLywmf77X
         T0ieBJ/Yigxs1BhtqPp3RbOUDWeH5XAqOEtLBcNzh7jMkR1+s82UCh6+cIEfxSHavutv
         1XnZaf3Yu4s5zhnjsPhFCS8qkNUgQvUWmHOW3QI55/hl5GTAuyKkVLcLkF3sMheTdr0a
         Bv31FMTIlVnk+HronWiYcf03JWuLTPnVfz/Xd90x6WrRUi9ov0q+kZqy884e9/E365rm
         zukA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0K2nBjUMOOshk8sSnPLbH3VlpKhvk6Stj3kKKAKcjd3oox8nQV5CXo6TytxwGsPmxdIcCmEkox94fwsV0R4wD@lists.infradead.org
X-Gm-Message-State: AOJu0YzkkJYZeXBET2JVSjR9ijnt0ePyDAwa8it/rUouPnHU2dPEHpaY
	4Hcotx+hEWlACOsT13PkVXlai/MblzRU2jrtA2YaKIFa1W5655CdsM82BPAJDCHvdVi4//0DnAk
	+vPErVKOLOp0+XwcF0nmt02ncG+1LHLd77LRbE2JD
X-Gm-Gg: AR+sD10rNYzwVSxezTKja2bDZMfW1LYjC74fcCDk7LlYCdxsSbIC0Q34YZWsTkOFMqy
	pb+K54NdaBGl/0xmfW9aqQic185lVNAvk31FOlH9/nOU5SZYpDUDXqu2eLvDDEdQyEy/HnvnebP
	l/5vqrVZxAoof6gdP9U8Ly1C6tbsFKjvN/91VYTpnF7vPM3wawX8+RCb/a5e+/+4aVMlVxjAEVS
	8mx5QjN4EEW8U9Qni4vUndYnhRimhEQse6+/adhZdcEdh0U+L9tfLvo9jVh6BYHan7ue5eRpCTH
	8IXModxZhszcW9a5L+dxWJsjms7jf58I9V4Z12/DxG40hg==
X-Received: by 2002:a05:622a:258b:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52db1f07d0cmr5546611cf.11.1786940012189; Sun, 16 Aug 2026
 21:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260813170155.1156593-1-bwicaksono@nvidia.com>
In-Reply-To: <20260813170155.1156593-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 16 Aug 2026 21:13:20 -0700
X-Gm-Features: AcwNN1VNLEZmh2YCuKGehmfZoT5-qHlv3AMCfSLe-X8oH-pX3c8TxAnfrF0rZHw
Message-ID: <CAP-5=fURdj7hsk50k-KyiNQD_23KQtAYcNTvKfC93uGEsM0e7w@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: Fix Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
	mike.leach@linaro.org, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	mochs@nvidia.com, sauravsc@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_211335_069267_4E94B240 
X-CRM114-Status: GOOD (  10.98  )
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

On Thu, Aug 13, 2026 at 10:02=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Fix two issues in the NVIDIA Tegra410 Olympus PMU event definitions:
>
>   - Correct the swapped MetricGroup assignments for the L1 data and
>     instruction prefetcher metrics.
>   - Correct the name and description of implementation-defined event
>     0x0197.
>
> Patch 1 resends the original patch from Saurav:
>   https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260511210=
832.91408-1-sauravsc@amazon.com/

For the series:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Besar Wicaksono (1):
>   perf vendor events arm64: Fix Tegra410 Olympus event 0x0197
>
> Saurav Sachidanand (1):
>   perf vendor events arm64: fix swapped MetricGroup for Tegra410 L1
>     prefetcher metrics
>
>  .../arch/arm64/nvidia/t410/metrics.json       | 28 +++++++++----------
>  .../arch/arm64/nvidia/t410/misc.json          |  6 ++--
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> --
> 2.43.0
>

