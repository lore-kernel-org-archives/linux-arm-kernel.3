Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1E0CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otbxpskZQ2jszr6scN/t0l115iHPynAVTy5cD9xe/9s=; b=vWZcpGJyZIZ3U6jmmPJy2tjXuP
	Yp4WVmS26ebI5XuGfuUfXzJ9XJnZyvGFjwITwn/3g6HiZXgBwnpFRuMt8OqtK5s8K8M7vjf3PDVo6
	z7YCBFjLHO1GdgP9RZP1BSS2hL3IjhRMpIr2pk6LDEMTP1M/WwtNW9dSs35WGlO5pny5R/xGdgki2
	H0Hhe3MFF/Ak2a+2C41zqgY62lHOMOAfQLw6v4GJt65pC8w0hdEQoJK1hxilFA/Ivtettj0itwOvF
	1znNJUwQNRH98H/Pc7m1B0xQ/8qNztb3xwi49xAOIjEftMYRenBf1OSRFkYpds2EQgkQclCvyg9f7
	A2cjHHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wGE-0000000CXi5-1lld;
	Tue, 23 Sep 2025 06:12:22 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wGB-0000000CXfO-2KPu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:12:21 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-34049023e98so734967fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 23:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758607934; x=1759212734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otbxpskZQ2jszr6scN/t0l115iHPynAVTy5cD9xe/9s=;
        b=JTQpaf+VlZ+YkEzaOHOPPzk5jcwchgsUUskQiESCCTqlCZkjwR3S6e6MC1BhMDz+FA
         ibsxg22EAY4sRs489rZnDCjfmYN9/HXIXgIWT5IPiYKhygk51NFHG85AfP1Tx2w4nDRA
         BIcvMKOjQDKsIIVHJBTZOzNWNFJbrQIak9GeQ+bfy1J+nJ4xhUQMVHvG7clPiq5gXdAd
         1y7/8gTDUKrksi1Zv6o+fwSaiql2okY2QzWDZeZIRO4WcKgI2JLUjlvu3i4BwdkPN65j
         I58/jB2ieG6f5uinhN2i2m52jsbkAm+Ca6BO1iPHz62hkIhNXQ/F9MXhKFBKls6Um35s
         wdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758607934; x=1759212734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otbxpskZQ2jszr6scN/t0l115iHPynAVTy5cD9xe/9s=;
        b=UHokKdBISKSkpYqCqknxX9M0pOVqecMN/PjSMEkETu0Ng8ASTk8/wgo6nvI7mTJhpk
         sghAeWtnOfVRr/RqrLkeJXnFn/iPMGYFYs81ugQbUhuGFNyqYVKM23GvzDVUSHZMCREZ
         L3urY9VWVBjgRtbWpN9XW5hIaZtwDXONn3B6bWdsIM82QFqnsXV6frdVqTIkeYOkWXgW
         M3axK58t590l9c36ApKHq4/6njAqK3Cl6VMPfULy4q6KNg8XOfS13Cg7CR702iSYywj5
         xa1d/3t/arF0IMSqg+IEIgqZkacj7b54BsdbnT/LITVVslVZ4WmQrfvXi5VLWKnLZqd7
         qQjA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbgqyulXjTQ2Dcfzz0yGr0m+xoanyoAB9QBuXsCV4H/8uQnTJ63Tmd3rYImZhois/++abyOWWcZWlmrvE9v2l@lists.infradead.org
X-Gm-Message-State: AOJu0YwfYk1IhFP/BkiRejJKZjjNQMV16r53+1FS9T6+5aNKdHhmnQfi
	HDUUthUuQSroCB65t6qQ5MfJhlHvT8L3TQpULWeWqnuZnUpNAfRWUSQM1sQMoEo4VZ1zdoUM0UZ
	w9rq/benxbgYvJ2QBf4rwYimyeVFyEuAY/I7GZ/sGKw==
X-Gm-Gg: ASbGncttEVTSqAfU/wBfp9ovyxTRzmp7vPVT4NSsvuS4lx7iAPZ9MSyZA3HsLc22zYU
	gBYVxzW4wGZiiwnd5R4Pe5qd2SAT9G4lIfqYWFHSyOAkyLQRXkDviUtDcOu2C2KBCWENiGZyAxN
	/4CDWOUSplSKigDmiEwtE2Udfy4rx6O249hJ/sZ1KpSL7UQOmroqoaToueeJ62Pe1tV+A6u3rYT
	311lRaYZy+xW+1AZYWUx895nPc=
X-Google-Smtp-Source: AGHT+IEIzs7n1nl91TIN023GUF0KUu3vYki89SdmZKUjsJa36BUfXx8eHWGEvtkrF3jtxJ7k3zA0vEDE+kHUSzoN6S4=
X-Received: by 2002:a05:6870:6591:b0:2d6:245:a9b3 with SMTP id
 586e51a60fabf-34c7b236bfemr746748fac.6.1758607934210; Mon, 22 Sep 2025
 23:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com> <20250327-counter_delegation-v5-12-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-12-1ee538468d1b@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 23 Sep 2025 14:12:03 +0800
X-Gm-Features: AS18NWCpz0zRDa7TiIE6jd6ds8giKZBrxub6MRRgBhuLhQx-LIu9q4wyCfRpBus
Message-ID: <CAEEQ3wm-TGcRFjmb7cw5K-M13CicwgJSLZrgY1KMZA5SgUjziw@mail.gmail.com>
Subject: Re: [External] [PATCH v5 12/21] RISC-V: perf: Modify the counter
 discovery mechanism
To: Atish Patra <atishp@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250922_231219_628630_7E77B607 
X-CRM114-Status: GOOD (  40.44  )
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

Hi Atish,

On Fri, Mar 28, 2025 at 3:42=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> If both counter delegation and SBI PMU is present, the counter
> delegation will be used for hardware pmu counters while the SBI PMU
> will be used for firmware counters. Thus, the driver has to probe
> the counters info via SBI PMU to distinguish the firmware counters.
>
> The hybrid scheme also requires improvements of the informational
> logging messages to indicate the user about underlying interface
> used for each use case.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_dev.c | 130 ++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 96 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
> index 6cebbc16bfe4..c0397bd68b91 100644
> --- a/drivers/perf/riscv_pmu_dev.c
> +++ b/drivers/perf/riscv_pmu_dev.c
> @@ -66,6 +66,20 @@ static bool sbi_v2_available;
>  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>  #define sbi_pmu_snapshot_available() \
>         static_branch_unlikely(&sbi_pmu_snapshot_available)
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
> +
> +/* Avoid unnecessary code patching in the one time booting path*/
> +#define riscv_pmu_cdeleg_available_boot() \
> +       static_key_enabled(&riscv_pmu_cdeleg_available)
> +#define riscv_pmu_sbi_available_boot() \
> +       static_key_enabled(&riscv_pmu_sbi_available)
> +
> +/* Perform a runtime code patching with static key */
> +#define riscv_pmu_cdeleg_available() \
> +       static_branch_unlikely(&riscv_pmu_cdeleg_available)
> +#define riscv_pmu_sbi_available() \
> +               static_branch_likely(&riscv_pmu_sbi_available)
>
>  static struct attribute *riscv_arch_formats_attr[] =3D {
>         &format_attr_event.attr,
> @@ -88,7 +102,8 @@ static int sysctl_perf_user_access __read_mostly =3D S=
YSCTL_USER_ACCESS;
>
>  /*
>   * This structure is SBI specific but counter delegation also require co=
unter
> - * width, csr mapping. Reuse it for now.
> + * width, csr mapping. Reuse it for now we can have firmware counters fo=
r
> + * platfroms with counter delegation support.
>   * RISC-V doesn't have heterogeneous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -100,6 +115,8 @@ static unsigned int riscv_pmu_irq;
>
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
> +/* Cache the available firmware counters in another bitmask */
> +static unsigned long firmware_cmask;
>
>  struct sbi_pmu_event_data {
>         union {
> @@ -780,34 +797,38 @@ static int rvpmu_sbi_find_num_ctrs(void)
>                 return sbi_err_map_linux_errno(ret.error);
>  }
>
> -static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> +static u32 rvpmu_deleg_find_ctrs(void)
> +{
> +       /* TODO */
> +       return 0;
> +}
> +
> +static int rvpmu_sbi_get_ctrinfo(u32 nsbi_ctr, u32 *num_fw_ctr, u32 *num=
_hw_ctr)
>  {
>         struct sbiret ret;
> -       int i, num_hw_ctr =3D 0, num_fw_ctr =3D 0;
> +       int i;
>         union sbi_pmu_ctr_info cinfo;
>
> -       pmu_ctr_list =3D kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL)=
;
> -       if (!pmu_ctr_list)
> -               return -ENOMEM;
> -
> -       for (i =3D 0; i < nctr; i++) {
> +       for (i =3D 0; i < nsbi_ctr; i++) {
>                 ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_IN=
FO, i, 0, 0, 0, 0, 0);
>                 if (ret.error)
>                         /* The logical counter ids are not expected to be=
 contiguous */
>                         continue;
>
> -               *mask |=3D BIT(i);
> -
>                 cinfo.value =3D ret.value;
> -               if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW)
> -                       num_fw_ctr++;
> -               else
> -                       num_hw_ctr++;
> -               pmu_ctr_list[i].value =3D cinfo.value;
> +               if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW) {
> +                       /* Track firmware counters in a different mask */
> +                       firmware_cmask |=3D BIT(i);
> +                       pmu_ctr_list[i].value =3D cinfo.value;
> +                       *num_fw_ctr =3D *num_fw_ctr + 1;
> +               } else if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_HW &&
> +                          !riscv_pmu_cdeleg_available_boot()) {
> +                       *num_hw_ctr =3D *num_hw_ctr + 1;
> +                       cmask |=3D BIT(i);
> +                       pmu_ctr_list[i].value =3D cinfo.value;
> +               }
>         }
>
> -       pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num=
_hw_ctr);
> -
>         return 0;
>  }
>
> @@ -1069,16 +1090,41 @@ static void rvpmu_ctr_stop(struct perf_event *eve=
nt, unsigned long flag)
>         /* TODO: Counter delegation implementation */
>  }
>
> -static int rvpmu_find_num_ctrs(void)
> +static int rvpmu_find_ctrs(void)
>  {
> -       return rvpmu_sbi_find_num_ctrs();
> -       /* TODO: Counter delegation implementation */
> -}
> +       u32 num_sbi_counters =3D 0, num_deleg_counters =3D 0;
> +       u32 num_hw_ctr =3D 0, num_fw_ctr =3D 0, num_ctr =3D 0;
> +       /*
> +        * We don't know how many firmware counters are available. Just a=
llocate
> +        * for maximum counters the driver can support. The default is 64=
 anyways.
> +        */
> +       pmu_ctr_list =3D kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list=
),
> +                              GFP_KERNEL);
> +       if (!pmu_ctr_list)
> +               return -ENOMEM;
>
> -static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
> -{
> -       return rvpmu_sbi_get_ctrinfo(nctr, mask);
> -       /* TODO: Counter delegation implementation */
> +       if (riscv_pmu_cdeleg_available_boot())
> +               num_deleg_counters =3D rvpmu_deleg_find_ctrs();
> +
> +       /* This is required for firmware counters even if the above is tr=
ue */
> +       if (riscv_pmu_sbi_available_boot()) {
> +               num_sbi_counters =3D rvpmu_sbi_find_num_ctrs();
> +               /* cache all the information about counters now */
> +               rvpmu_sbi_get_ctrinfo(num_sbi_counters, &num_hw_ctr, &num=
_fw_ctr);
> +       }
> +
> +       if (num_sbi_counters > RISCV_MAX_COUNTERS || num_deleg_counters >=
 RISCV_MAX_COUNTERS)
> +               return -ENOSPC;
> +
> +       if (riscv_pmu_cdeleg_available_boot()) {
> +               pr_info("%u firmware and %u hardware counters\n", num_fw_=
ctr, num_deleg_counters);
> +               num_ctr =3D num_fw_ctr + num_deleg_counters;
> +       } else {
> +               pr_info("%u firmware and %u hardware counters\n", num_fw_=
ctr, num_hw_ctr);
> +               num_ctr =3D num_sbi_counters;
> +       }
> +
> +       return num_ctr;
>  }
>
>  static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
> @@ -1379,12 +1425,21 @@ static int rvpmu_device_probe(struct platform_dev=
ice *pdev)
>         int ret =3D -ENODEV;
>         int num_counters;
>
> -       pr_info("SBI PMU extension is available\n");
> +       if (riscv_pmu_cdeleg_available_boot()) {
> +               pr_info("hpmcounters will use the counter delegation ISA =
extension\n");
> +               if (riscv_pmu_sbi_available_boot())
> +                       pr_info("Firmware counters will use SBI PMU exten=
sion\n");
> +               else
> +                       pr_info("Firmware counters will not be available =
as SBI PMU extension is not present\n");
> +       } else if (riscv_pmu_sbi_available_boot()) {
> +               pr_info("Both hpmcounters and firmware counters will use =
SBI PMU extension\n");
> +       }
> +
>         pmu =3D riscv_pmu_alloc();
>         if (!pmu)
>                 return -ENOMEM;
>
> -       num_counters =3D rvpmu_find_num_ctrs();
> +       num_counters =3D rvpmu_find_ctrs();
>         if (num_counters < 0) {
>                 pr_err("SBI PMU extension doesn't provide any counters\n"=
);
>                 goto out_free;
> @@ -1396,9 +1451,6 @@ static int rvpmu_device_probe(struct platform_devic=
e *pdev)
>                 pr_info("SBI returned more than maximum number of counter=
s. Limiting the number of counters to %d\n", num_counters);
>         }
>
> -       /* cache all the information about counters now */
> -       if (rvpmu_get_ctrinfo(num_counters, &cmask))
> -               goto out_free;
>
>         ret =3D rvpmu_setup_irqs(pmu, pdev);
>         if (ret < 0) {
> @@ -1488,13 +1540,23 @@ static int __init rvpmu_devinit(void)
>         int ret;
>         struct platform_device *pdev;
>
> -       if (sbi_spec_version < sbi_mk_version(0, 3) ||
> -           !sbi_probe_extension(SBI_EXT_PMU)) {
> -               return 0;
> -       }
> +       if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
> +           sbi_probe_extension(SBI_EXT_PMU))
> +               static_branch_enable(&riscv_pmu_sbi_available);
>
>         if (sbi_spec_version >=3D sbi_mk_version(2, 0))
>                 sbi_v2_available =3D true;
> +       /*
> +        * We need all three extensions to be present to access the count=
ers
> +        * in S-mode via Supervisor Counter delegation.
> +        */
> +       if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +           riscv_isa_extension_available(NULL, SMCDELEG) &&

Is there no need to check SMCDELEG (Machine-level) in the kernel, and
can it be done directly via SSCCFG or sbi_probe_extension?
The #define RISCV_ISA_EXT_SMCDELEG 98 also doesn't need to be defined
in the kernel.

> +           riscv_isa_extension_available(NULL, SSCSRIND))
> +               static_branch_enable(&riscv_pmu_cdeleg_available);
> +
> +       if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_availabl=
e_boot()))
> +               return 0;
>
>         ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>                                       "perf/riscv/pmu:starting",
>
> --
> 2.43.0
>
>

Thanks,
Yunhui

