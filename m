Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6A2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 01:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPhlc9bmrf/baBUYMBCbtsRt7KZ0PJ5cb4Ib6su88Rg=; b=AsAs9vttQ5oDj0LrrAdXcvyH5N
	3/5eANdYkfbkx1bJeVmK8QRoXqjIVHHdoCO3zNjMg7NWvfQaA4Br6joWP77+uuxnklAyDzfS6MoQZ
	zkn7ov6hZcAgrF3/h2REfU6drvvgdAPJXQUrn2jU/S04i4Y5RmaaCmuwz52Oytj0B7l8ciIIknNou
	1ilwdhcmoWVhcWsfd2cqx0ckRBT1FbO0J2B6f/Qfipn2kjwiJJqKlhIRb1P90FqtB4tYKoeeFaP0M
	vsMY4DmF2YB6gZKUJVMeU9TUtX6l4QMrNLpy2bgUokNmHu8QCOIAhDwsZSYOk09TD6lm1StW9O/ta
	fW9RH5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSNi-00000005sxO-0pWA;
	Thu, 27 Feb 2025 01:08:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSKy-00000005sa4-2aYA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 01:05:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22113560c57so6378625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 17:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740618316; x=1741223116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPhlc9bmrf/baBUYMBCbtsRt7KZ0PJ5cb4Ib6su88Rg=;
        b=sddcCz1i3SSOIEslLUNtB37x1roPKKATTNHqC15Dnqqr9X+nr90iqeq8tpxD4ajZPm
         MG8RWeKYrQGNrCk7+95elQ1FgNPkeADQUZ8h87LbkQx9FGi+TDeBPsVWpuWJEy7C/tTS
         aGxjPVCoWtkKXGA5haWdTtRA0wCLzBzMUJRSII8OM8sRjOgbMsIsM7RuRJbHknqKb6UW
         HtfNfOQ+aq9y8lHE8Z1q+ThZ5g3cww/SnlJs/hmbKF0Zoq4wM/GaTZ2L/hSNneEs6WxT
         vh6gTH9OB24iN4gt0kRIyPEEdGWv0QVH5GySx2YkA9sYZksQXeGw0HBPXKrzwbiJ/XQc
         a8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740618316; x=1741223116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPhlc9bmrf/baBUYMBCbtsRt7KZ0PJ5cb4Ib6su88Rg=;
        b=i1BpyzokOaKOPyswWqk1WGn9eS5s86yJsSUu7uyKKPclVWyK/YwTl7KzJtk4iIoLQg
         FLfqK0uBYw6BZQvO94RGbTmODE81dfMkllYkqn4CT+RI4hnhVjT6+U3qsst3ohOfVzSh
         xcdWYjkc6eyw4oOrMSnHduPpsehftOKkrLIinpz93JWvYNQe16hcirGNqkU9r57Mw2zS
         u5mZ2AVK1ExtXb5X801wvz6n0ms2VY118ZmKQ0WsvONrCQqxY8ZPmiDGoxZjyBFIZ66k
         JOi9qo7uh066z0RsJkc849MaiG7Ju+VutdJpYnNp7JkYSH29duxFnEZ1Ze4PLchBS+CR
         G4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVt8zA+wc7N18RJ/HVkReaqowLg6xkZZ4+d0RgPev5mJeZUv/1m6YeKTEK7TrzrvPp/CT+nUzNFpuesedNMmGF0@lists.infradead.org
X-Gm-Message-State: AOJu0YySReQzMIPXYRbPJPKV25tnrtW+HZ1bJCu4vC9kk/rmW5GmeTju
	G3HgkazVDmkMeYaIW7h4XvfmtThd8Ia+IKTEK6CIe0vfgsO0naeMs31YCOdpCPcfvIHbv3BHPII
	fak/itw/tooM12kA8CtKzISAl0MguBNTynNCAlw==
X-Gm-Gg: ASbGncu4TvCI6nSompMtLngpzRM9x6S4mcPxAxi/oYJ30PRb9y4YdF63Z+FiSlOr9u9
	qM2JOQEsyifwuCj/N1bKlZbDo3gYlQL9vC+gWPqKXbiRSrP8RPg6B6XIbk5ncdLj8/wgo8oeH/8
	sqDAVRig==
X-Google-Smtp-Source: AGHT+IEmzNz0icfWLpez1BUsW/bodw4yxi3kEJGu2T9c7GZ0fGiTA+k8NPv9fX34ISAbJbxPgbyIN7vFEs0p7/UvZxk=
X-Received: by 2002:a05:6a00:2445:b0:731:e974:f9c2 with SMTP id
 d2e1a72fcca58-73426af3a2dmr33707676b3a.0.1740618315744; Wed, 26 Feb 2025
 17:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-12-835cfa88e3b1@rivosinc.com> <586dc43d-74cd-413b-86e2-545384ad796f@rivosinc.com>
In-Reply-To: <586dc43d-74cd-413b-86e2-545384ad796f@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 17:05:02 -0800
X-Gm-Features: AQ5f1Jpcwi9qlqm9BYyz76VdGTMqDksYTZy-kqauaAcNToAAh7JyG1DiMAREibo
Message-ID: <CAHBxVyGAtZV8mJdcLtSHKHCrtrx3ygUG16onhpPRUUPk6_WJuA@mail.gmail.com>
Subject: Re: [PATCH v4 12/21] RISC-V: perf: Modify the counter discovery mechanism
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_170516_933637_38E378C7 
X-CRM114-Status: GOOD (  43.15  )
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

On Fri, Feb 7, 2025 at 2:29=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@rivo=
sinc.com> wrote:
>
>
>
> On 06/02/2025 08:23, Atish Patra wrote:
> > If both counter delegation and SBI PMU is present, the counter
> > delegation will be used for hardware pmu counters while the SBI PMU
> > will be used for firmware counters. Thus, the driver has to probe
> > the counters info via SBI PMU to distinguish the firmware counters.
> >
> > The hybrid scheme also requires improvements of the informational
> > logging messages to indicate the user about underlying interface
> > used for each use case.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_dev.c | 118 ++++++++++++++++++++++++++++++++---=
--------
> >  1 file changed, 88 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.=
c
> > index 6b43d844eaea..5ddf4924c5b3 100644
> > --- a/drivers/perf/riscv_pmu_dev.c
> > +++ b/drivers/perf/riscv_pmu_dev.c
> > @@ -66,6 +66,10 @@ static bool sbi_v2_available;
> >  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
> >  #define sbi_pmu_snapshot_available() \
> >       static_branch_unlikely(&sbi_pmu_snapshot_available)
> > +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
> > +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
> > +static bool cdeleg_available;
> > +static bool sbi_available;
> >
> >  static struct attribute *riscv_arch_formats_attr[] =3D {
> >       &format_attr_event.attr,
> > @@ -88,7 +92,8 @@ static int sysctl_perf_user_access __read_mostly =3D =
SYSCTL_USER_ACCESS;
> >
> >  /*
> >   * This structure is SBI specific but counter delegation also require =
counter
> > - * width, csr mapping. Reuse it for now.
> > + * width, csr mapping. Reuse it for now we can have firmware counters =
for
> > + * platfroms with counter delegation support.
> >   * RISC-V doesn't have heterogeneous harts yet. This need to be part o=
f
> >   * per_cpu in case of harts with different pmu counters
> >   */
> > @@ -100,6 +105,8 @@ static unsigned int riscv_pmu_irq;
> >
> >  /* Cache the available counters in a bitmask */
> >  static unsigned long cmask;
> > +/* Cache the available firmware counters in another bitmask */
> > +static unsigned long firmware_cmask;
> >
> >  struct sbi_pmu_event_data {
> >       union {
> > @@ -778,35 +785,49 @@ static int rvpmu_sbi_find_num_ctrs(void)
> >               return sbi_err_map_linux_errno(ret.error);
> >  }
> >
> > -static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> > +static int rvpmu_deleg_find_ctrs(void)
> > +{
> > +     /* TODO */
> > +     return -1;
> > +}
> > +
> > +static int rvpmu_sbi_get_ctrinfo(int nsbi_ctr, int ndeleg_ctr)
>
> Hi Atish,
>
> These parameters could be unsigned I think.
>

sure. Changed it to u32.

> >  {
> >       struct sbiret ret;
> > -     int i, num_hw_ctr =3D 0, num_fw_ctr =3D 0;
> > +     int i, num_hw_ctr =3D 0, num_fw_ctr =3D 0, num_ctr =3D 0;
> >       union sbi_pmu_ctr_info cinfo;
> >
> > -     pmu_ctr_list =3D kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL)=
;
> > -     if (!pmu_ctr_list)
> > -             return -ENOMEM;
> > -
> > -     for (i =3D 0; i < nctr; i++) {
> > +     for (i =3D 0; i < nsbi_ctr; i++) {
> >               ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_IN=
FO, i, 0, 0, 0, 0, 0);
> >               if (ret.error)
> >                       /* The logical counter ids are not expected to be=
 contiguous */
> >                       continue;
> >
> > -             *mask |=3D BIT(i);
> > -
> >               cinfo.value =3D ret.value;
> >               if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW)
> >                       num_fw_ctr++;
> > -             else
> > +
> > +             if (!cdeleg_available) {
>
> What is the rationale for using additional boolean identical to the
> static keys ? Reducing the amount of code patch site in cold path ? If

yes.

> so, I guess you can use static_key_enabled(&riscv_pmu_cdeleg_available).
> But your solution is fine as well, it just duplicates two identical value=
s.
>

good point. I will change it. Thanks!

> >                       num_hw_ctr++;
> > -             pmu_ctr_list[i].value =3D cinfo.value;
> > +                     cmask |=3D BIT(i);
> > +                     pmu_ctr_list[i].value =3D cinfo.value;
> > +             } else if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW) {
> > +                     /* Track firmware counters in a different mask */
> > +                     firmware_cmask |=3D BIT(i);
> > +                     pmu_ctr_list[i].value =3D cinfo.value;
> > +             }
> > +
> >       }
> >
> > -     pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num=
_hw_ctr);
> > +     if (cdeleg_available) {
> > +             pr_info("%d firmware and %d hardware counters\n", num_fw_=
ctr, ndeleg_ctr);
> > +             num_ctr =3D num_fw_ctr + ndeleg_ctr;
> > +     } else {
> > +             pr_info("%d firmware and %d hardware counters\n", num_fw_=
ctr, num_hw_ctr);
> > +             num_ctr =3D nsbi_ctr;
> > +     }
> >
> > -     return 0;
> > +     return num_ctr;
> >  }
> >
> >  static inline void rvpmu_sbi_stop_all(struct riscv_pmu *pmu)
> > @@ -1067,16 +1088,33 @@ static void rvpmu_ctr_stop(struct perf_event *e=
vent, unsigned long flag)
> >       /* TODO: Counter delegation implementation */
> >  }
> >
> > -static int rvpmu_find_num_ctrs(void)
> > +static int rvpmu_find_ctrs(void)
> >  {
> > -     return rvpmu_sbi_find_num_ctrs();
> > -     /* TODO: Counter delegation implementation */
> > -}
> > +     int num_sbi_counters =3D 0, num_deleg_counters =3D 0, num_counter=
s =3D 0;
> >
> > -static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
> > -{
> > -     return rvpmu_sbi_get_ctrinfo(nctr, mask);
> > -     /* TODO: Counter delegation implementation */
> > +     /*
> > +      * We don't know how many firmware counters available. Just alloc=
ate
> > +      * for maximum counters driver can support. The default is 64 any=
ways.
> > +      */
> > +     pmu_ctr_list =3D kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list=
),
> > +                            GFP_KERNEL);
> > +     if (!pmu_ctr_list)
> > +             return -ENOMEM;
> > +
> > +     if (cdeleg_available)
> > +             num_deleg_counters =3D rvpmu_deleg_find_ctrs();
> > +
> > +     /* This is required for firmware counters even if the above is tr=
ue */
> > +     if (sbi_available)
> > +             num_sbi_counters =3D rvpmu_sbi_find_num_ctrs();
> > +
> > +     if (num_sbi_counters >=3D RISCV_MAX_COUNTERS || num_deleg_counter=
s >=3D RISCV_MAX_COUNTERS)
> > +             return -ENOSPC;
>
> Why is this using '>=3D' ? You allocated space for RISCV_MAX_COUNTERS, so
> RISCV_MAX_COUNTERS should fit right ?
>
Yeah. That's a typo. Thanks for catching it.

> > +
> > +     /* cache all the information about counters now */
> > +     num_counters =3D rvpmu_sbi_get_ctrinfo(num_sbi_counters, num_dele=
g_counters);
> > +
> > +     return num_counters;
>
> return rvpmu_sbi_get_ctrinfo(num_sbi_counters, num_deleg_counters);
>
> >  }
> >
> >  static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
> > @@ -1377,12 +1415,21 @@ static int rvpmu_device_probe(struct platform_d=
evice *pdev)
> >       int ret =3D -ENODEV;
> >       int num_counters;
> >
> > -     pr_info("SBI PMU extension is available\n");
> > +     if (cdeleg_available) {
> > +             pr_info("hpmcounters will use the counter delegation ISA =
extension\n");
> > +             if (sbi_available)
> > +                     pr_info("Firmware counters will be use SBI PMU ex=
tension\n");
>
> s/will be use/will use
>
> > +             else
> > +                     pr_info("Firmware counters will be not available =
as SBI PMU extension is not present\n");
>
> s/will be not/will not
>

Fixed.

> > +     } else if (sbi_available) {
> > +             pr_info("Both hpmcounters and firmware counters will use =
SBI PMU extension\n");
> > +     }
> > +
> >       pmu =3D riscv_pmu_alloc();
> >       if (!pmu)
> >               return -ENOMEM;
> >
> > -     num_counters =3D rvpmu_find_num_ctrs();
> > +     num_counters =3D rvpmu_find_ctrs();
> >       if (num_counters < 0) {
> >               pr_err("SBI PMU extension doesn't provide any counters\n"=
);
> >               goto out_free;
> > @@ -1394,9 +1441,6 @@ static int rvpmu_device_probe(struct platform_dev=
ice *pdev)
> >               pr_info("SBI returned more than maximum number of counter=
s. Limiting the number of counters to %d\n", num_counters);
> >       }
> >
> > -     /* cache all the information about counters now */
> > -     if (rvpmu_get_ctrinfo(num_counters, &cmask))
> > -             goto out_free;
> >
> >       ret =3D rvpmu_setup_irqs(pmu, pdev);
> >       if (ret < 0) {
> > @@ -1486,13 +1530,27 @@ static int __init rvpmu_devinit(void)
> >       int ret;
> >       struct platform_device *pdev;
> >
> > -     if (sbi_spec_version < sbi_mk_version(0, 3) ||
> > -         !sbi_probe_extension(SBI_EXT_PMU)) {
> > -             return 0;
> > +     if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
> > +         sbi_probe_extension(SBI_EXT_PMU)) {
> > +             static_branch_enable(&riscv_pmu_sbi_available);
> > +             sbi_available =3D true;
> >       }
> >
> >       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> >               sbi_v2_available =3D true;
> > +     /*
> > +      * We need all three extensions to be present to access the count=
ers
> > +      * in S-mode via Supervisor Counter delegation.
> > +      */
> > +     if (riscv_isa_extension_available(NULL, SSCCFG) &&
> > +         riscv_isa_extension_available(NULL, SMCDELEG) &&
> > +         riscv_isa_extension_available(NULL, SSCSRIND)) {
> > +             static_branch_enable(&riscv_pmu_cdeleg_available);
> > +             cdeleg_available =3D true;
> > +     }
> > +
> > +     if (!(sbi_available || cdeleg_available))
> > +             return 0;
> >
> >       ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
> >                                     "perf/riscv/pmu:starting",
> >
>

