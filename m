Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B95CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl3OPaa+HqsVW3wENlJ/AzITxIxhv+o3/IRQF7Ihs4o=; b=T8TOMPfySQWCLzCMlve1PPAPfy
	ez1bd3lFF0s/BevGbVLruYXZPBsfzgZI2vbc+TdmOmzlXrKK0Yc9TtG4mP9C8YiWbwzpWhQEJ9Mjz
	XlWS1dzTsPIC7Ju6kCTku1pKGr5YhZoPuf3IaU5tnXY+umtxrt6OymfL54B5HnEJMIUpoIVPUd1jB
	/kb7QJA1IwHmcQvXE1TjzkrHVVUC6X3t2COmqYlUmFL07PVdWjQCxXG8/Yejj9wL/LuPemktHT8Jy
	ozajXsxYzmnoqC0OJjmBJvo6+eZ98hnxgWExUPsTeosWcJlQi1Ov1eCniDHWrXK1ZOLPewGl7fnoD
	mSlGHNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0lP-00000004D96-3Kqj;
	Thu, 07 May 2026 15:35:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0lN-00000004D81-0tnD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:35:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so97655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778168144; cv=none;
        d=google.com; s=arc-20240605;
        b=JVXd5vvwWaoaLX/hGvGnZpDS+0a1nAwCWKxBvkNZX4v27N99MWNjEWzQum9DathPcj
         kroKLAWmh6NlUu3+ai+o/mlXeOcT8ykiX4rjlRDJ9RTNMGeeb0ZZ8w3bY70UbjOVsXNq
         ep85Nuvq5BhOvIGfvYx55JMzr9RPt3NbwzIEcBSWML/dpiBqaBEFIC10P7t084opTEf1
         A5vgNmvQPEz0YtXd1foFJrD7GtRnOyGne+pn3L75D1RWng5zK1iICiXTeFz+w7dLn6Sr
         JktfynHR4vz3QRbT5nejTwULwrjP76FRNz6GwSHdMcM7O3Vo04uufy9rMqZyuv/WVNAZ
         AwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hl3OPaa+HqsVW3wENlJ/AzITxIxhv+o3/IRQF7Ihs4o=;
        fh=YHDiPpm/lQZ4Popk7BJczupleN078ci42sxlNJLgH2w=;
        b=VPMcvzMcKSqCd9dC7N5Dq805g/rN/cci0zJYXDSDrAtPMI79xa/oxO2sQYT/zb7d2p
         ehJqmeJo3DUFHPUFSudhXwhuDcBf41wC8XC13NUCIQR+mUwUjoiZtY+CqM7NDdHkigXN
         tcnk2sgBV8vvNCUWOTtM4udTBn89/d11EXqJOcBa3ri9/wmEay9sa0RzRHC60o09z4yi
         157gjVR19R/2WeH58Q0vqk0wYsa+EJG4CixHyrFOsuE6/h22Twb+Yfu4DU8uwxvvEtAv
         Hsjy4faYd9rlPyTkkGIZYUvY/2UbEerVgQNJ0uwlYoRvIsTPq6dRBF7okr0xn2ze2ps9
         K2Rw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778168144; x=1778772944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl3OPaa+HqsVW3wENlJ/AzITxIxhv+o3/IRQF7Ihs4o=;
        b=Tc4jSKDXXIdgy+bwFeBmhBYY62imvd4KAZT2Wnub5C5yPLSX8fXrzk3CEMI4udQA3W
         91efoKZmLkoVbjeVfEXwWyUr0v0JBLuKwCRjp8Lj5YivblFuBPs5wm93WrJpkkV94JoV
         5OU5KnEJ3C/MVl7BDV49JVYVtf833TtFT7C6gX2Kqer1meFXUKhEniYL6ee90hScdy47
         JaVU/W7nLdHf1+Ow65zI8d15cPJli8WywV9QsVnlWaPHI0+JXgJulCpbtvvU1gC4HY3Z
         ieclCCtSi9XzgHrA3GMK09/r1c4kQ1voRwRfgyu0eyyfRb9DnJ4wtPxVvt8KdH1HgD3C
         5+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168144; x=1778772944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hl3OPaa+HqsVW3wENlJ/AzITxIxhv+o3/IRQF7Ihs4o=;
        b=QNju40ksND6zsNTQidv50dvyHmSI2qoUsPMR54N6B/a4KlUwU6I4YxJGYZDuy2uOJI
         1DCUOTe7bY6AqdAoIbmeIBlp2FNQDtMGvOU7NCiH9p5LtQmXuKKlkSTs5VgZIoWcA0zh
         mQnBJ4TuC5aDMaZaMr1XAdtea21uwDsrT62slULMwxUwjhtBY7nkm1CvYv9Mzp07hKGI
         b8TyXOYMR61CCQQoWLZ/g4JgtTuflvvTxko5gIXii80jEQxOSWgefo0/GaJDDQyvqNE+
         xpF3of9Mnb1SBvukbItkiSHXrQ1aNKLFFgbHhWl5LgQC71VINWwjCsfrUfyMaCmVVZu9
         XPIw==
X-Forwarded-Encrypted: i=1; AFNElJ8wQZOHsZi/YBu2QxiHCZsBGJsf0rZuz0Yvv7bnd72r+27X/zbTpthIuENOANNJYaYdCM9HatR8bjam/azAKc0s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnezpe0YPfYJGRyFXB5/z5TY0QBxINlFDXYekRfDO8ubyDI6yC
	7N7lxng1z7YNFGctC2bEvs8/IbYjQ9zaGAy1pD9XZZSA9vtxSt9fQS2SsIWE8NdYnTCfiNbm5ng
	PziRf/R206EIc5LZ9m17+Xc5JtSLvvzPgiCgXDQba
X-Gm-Gg: Acq92OFRCSLpBwiYXNNYwdQ3IlAX9DG1Iuxa6Mb5tiri2QwCT2Hz+GHqZuN+B/Lkour
	wqksN/5Q0xARArSP0ONCX/NzNi7Z9oUhNeqWFuw22MavI2QrwJGn40htZs2HPEfFlR7vkqR0gGZ
	+if5EDTXtxiZX8DE+nQuuJM8ULhRS2HUkwHTFlo9VGjQK7IWHU2+NBBoH+7QN1/31qV5SvDAKYz
	QaxcaNxiApJBDjaxW6vkGKM6BwJD9kgTxOfIgCGC/t7Y4CK2/QcpN4yeHlk7S5kfWK074mAeywb
	EJNfn5OVwQlQF6hh1t48TQt+GB6QojmAhkqVA8yPFrLMqOOwHbntZpi3G9/mG+q9bo7Dew==
X-Received: by 2002:a17:903:f84:b0:2b0:b458:2dc3 with SMTP id
 d9443c01a7336-2bae5b14ae2mr373815ad.21.1778168143999; Thu, 07 May 2026
 08:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-4-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-4-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 08:35:31 -0700
X-Gm-Features: AVHnY4I9DKnPTVL3K0VhIs7W11tZTlL6bzHpAZiuhFaMk_dPdRFxYtcZFku_Z1A
Message-ID: <CAP-5=fV5WiyB3mghvns1ZW6ewS0=CP4nx+f_ggLgECkqv7VWww@mail.gmail.com>
Subject: Re: [RFT PATCH v2 3/7] perf-x86: iostat: Move iostat arch-specific
 implementation to util
To: Yushan Wang <wangyushan12@huawei.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@arm.com, 
	john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jic23@kernel.org, leo.yan@linux.dev, 
	robin.murphy@arm.com, linuxarm@huawei.com, hejunhao3@huawei.com, 
	prime.zeng@hisilicon.com, fanghao11@huawei.com, wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_083545_252111_AD48E8F1 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, May 6, 2026 at 11:37=E2=80=AFPM Yushan Wang <wangyushan12@huawei.co=
m> wrote:
>
> To support cross-platform iostat capabilities, like record/report on
> different platforms, architecture-specific implementation of iostat
> should be moved out of arch directory to get built. Build scripts are
> changed accordingly.
>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/arch/x86/util/Build                           | 1 -
>  tools/perf/util/Build                                    | 1 +
>  tools/perf/{arch/x86/util/iostat.c =3D> util/x86-iostat.c} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename tools/perf/{arch/x86/util/iostat.c =3D> util/x86-iostat.c} (100%)

To avoid cluttering up tools/perf/util, would it make sense to create
a "tools/perf/util/iostat-arch" directory similar to  annotate-arch,
dwarf-regs-arch, kvm-stat-arch and perf-regs-arch?

Thanks,
Ian

> diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Bu=
ild
> index b94c91984c66..358541beaa0f 100644
> --- a/tools/perf/arch/x86/util/Build
> +++ b/tools/perf/arch/x86/util/Build
> @@ -7,7 +7,6 @@ perf-util-y +=3D event.o
>  perf-util-y +=3D evlist.o
>  perf-util-y +=3D mem-events.o
>  perf-util-y +=3D evsel.o
> -perf-util-y +=3D iostat.o
>
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
>
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 70cc91d00804..c7e5ada3800d 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -127,6 +127,7 @@ perf-util-y +=3D thread-stack.o
>  perf-util-y +=3D spark.o
>  perf-util-y +=3D topdown.o
>  perf-util-y +=3D iostat.o
> +perf-util-y +=3D x86-iostat.o
>  perf-util-y +=3D stream.o
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
>  perf-util-y +=3D kvm-stat-arch/
> diff --git a/tools/perf/arch/x86/util/iostat.c b/tools/perf/util/x86-iost=
at.c
> similarity index 100%
> rename from tools/perf/arch/x86/util/iostat.c
> rename to tools/perf/util/x86-iostat.c
> --
> 2.33.0
>

