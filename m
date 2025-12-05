Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8871D33980
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Jl0m8Q2V5g3LQDOEvjkPAq/fefrmzjS3LIO2hCIOK0=; b=yLmsajKlgXRmJCoC9g9Ztz6sxg
	b4360bH4hIaVkyWLYVBBfLN1TkXEsyDX1tziZkVnM8wcsyooGioeqKaKXtWAkTTcplhCuY9dk5JYR
	aB8Xe5p2VVKPTTMSi/iJ1BLo5okllZWexCH2/sWIQuKZtDnwu3KB7ldhq/7cnmF1VaKoMRx+IRELD
	hja2zs5cwJiT94JWeDVUYYeXg9eaDj/PMcQXQ/8f7Royj93KoG2RHlon4hk8UDwt3cp4jSkNw8nNA
	2RvGhvyxQVphrCNe0VrIQOFNFZPVrOIxGY00fQeIo5sFIAHZMT9ghr2eva/w7P6E0xACGE5PfwNyu
	x3apteWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXV6-00000009doO-1nLs;
	Fri, 05 Dec 2025 15:13:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXV3-00000009dnm-2HSs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 15:13:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B0A843EC2
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Dec 2025 15:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2F8C116D0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Dec 2025 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764947616;
	bh=gToDeN6Xc25jVYcui6qGpeppUtC7Whn5YW0S6Qumrkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pwywkSkOrM9W497oFGAp6bFMeHPHsAjetaQ83LHhMMByeP58M7PlIeS9uS/+7tSVH
	 kbrv4yuLV4F4i/vb3BpgP+xlgLcde2S2TWOz+WK6P6aB7DgSQG0Sk5irxZQKNehrWa
	 a0DKNRR6xFd55jAEh6d0ME2x9mPMrnIFeRPyqFYXb1Q53x97tscyjnATwpuXOxlSQn
	 Oug5c5Si0KpXD1n2c07GZukXOv0lpK9cOSfFGY/siQ5v7WUZRDkD+Oy6/ZkAi/2tFl
	 ngsOZZwhYcnGVmkdqem/UUJiqhxVb6mmL3K6IpAlYsdtOG7a4Rznje4JGIAK8J+GJu
	 aBxYg6z3ZIFbQ==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c75fc222c3so1086500a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 07:13:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7LFz8drf/FAkcF4RyPp+uU3+xqe0OHCuAGzuuGAn7aFWipQUD8OHr2rV8EAPwZdWHosVEhti5PCF+dwjrXXI9@lists.infradead.org
X-Gm-Message-State: AOJu0YyjiEln6Ng47qN06VFWVEbvTymor7WEWWLUI+R6jJogRfTG+rsO
	IqWPpLtoddaM1PmoLln4kd08V/J3ZMBnizgLl1eKADgVDlizGhiYHriy9YTTlnhOk+UQVHBZmEq
	H5NcNmfWzt6EIYY3wcF/+5fZoAd5DJng=
X-Google-Smtp-Source: AGHT+IHrXWrqtMGXJxmwV1GVuCRVKcQU0z6/rzwbxUJ6/BP2yyYwuq+UjnxGK8r3GeEdRUHh75+CQgXDFSasFrCHpBs=
X-Received: by 2002:a05:6830:719c:b0:7c5:3798:fa4e with SMTP id
 46e09a7af769-7c94dc0bf51mr8467872a34.17.1764947615507; Fri, 05 Dec 2025
 07:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com> <20251203032422.3232957-2-zhanjie9@hisilicon.com>
In-Reply-To: <20251203032422.3232957-2-zhanjie9@hisilicon.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Dec 2025 16:13:24 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jvk+gs+h+76__LLZDa=OGzLxQQsWEMDHXzeV8aV6UYsA@mail.gmail.com>
X-Gm-Features: AWmQ_bmOH7nN5gWZs3xRPWHos4wTiEv97BodDPulN0JnoJDgcE3MNy86R_44060
Message-ID: <CAJZ5v0jvk+gs+h+76__LLZDa=OGzLxQQsWEMDHXzeV8aV6UYsA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ACPI: CPPC: Factor out and export per-cpu cppc_perf_ctrs_in_pcc_cpu()
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: viresh.kumar@linaro.org, rafael@kernel.org, ionela.voinescu@arm.com, 
	beata.michalska@arm.com, pierre.gondois@arm.com, zhenglifeng1@huawei.com, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, 
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com, yubowen8@huawei.com, 
	lihuisong@huawei.com, zhangpengjie2@huawei.com, wangzhi12@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_071337_621306_3D2355C1 
X-CRM114-Status: GOOD (  20.26  )
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

On Wed, Dec 3, 2025 at 4:25=E2=80=AFAM Jie Zhan <zhanjie9@hisilicon.com> wr=
ote:
>
> Factor out cppc_perf_ctrs_in_pcc_cpu() for checking whether per-cpu CPC
> regs are defined in PCC channels, and export it out for further use.
>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/acpi/cppc_acpi.c | 45 +++++++++++++++++++++-------------------
>  include/acpi/cppc_acpi.h |  5 +++++
>  2 files changed, 29 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 3bdeeee3414e..aa80dbcf42c0 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -1422,6 +1422,29 @@ int cppc_get_perf_caps(int cpunum, struct cppc_per=
f_caps *perf_caps)
>  }
>  EXPORT_SYMBOL_GPL(cppc_get_perf_caps);
>
> +bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
> +{
> +       struct cpc_desc *cpc_desc =3D per_cpu(cpc_desc_ptr, cpu);
> +       struct cpc_register_resource *ref_perf_reg;
> +
> +       /*
> +        * If reference perf register is not supported then we should use=
 the
> +        * nominal perf value
> +        */
> +       ref_perf_reg =3D &cpc_desc->cpc_regs[REFERENCE_PERF];
> +       if (!CPC_SUPPORTED(ref_perf_reg))
> +               ref_perf_reg =3D &cpc_desc->cpc_regs[NOMINAL_PERF];
> +
> +       if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
> +           CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
> +           CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
> +           CPC_IN_PCC(ref_perf_reg))
> +               return true;
> +
> +       return false;

Why not

return CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
          CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
          CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
          CPC_IN_PCC(ref_perf_reg);

> +}
> +EXPORT_SYMBOL_GPL(cppc_perf_ctrs_in_pcc_cpu);
> +
>  /**
>   * cppc_perf_ctrs_in_pcc - Check if any perf counters are in a PCC regio=
n.
>   *
> @@ -1436,27 +1459,7 @@ bool cppc_perf_ctrs_in_pcc(void)
>         int cpu;
>
>         for_each_online_cpu(cpu) {
> -               struct cpc_register_resource *ref_perf_reg;
> -               struct cpc_desc *cpc_desc;
> -
> -               cpc_desc =3D per_cpu(cpc_desc_ptr, cpu);
> -
> -               if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
> -                   CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
> -                   CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]))
> -                       return true;
> -
> -
> -               ref_perf_reg =3D &cpc_desc->cpc_regs[REFERENCE_PERF];
> -
> -               /*
> -                * If reference perf register is not supported then we sh=
ould
> -                * use the nominal perf value
> -                */
> -               if (!CPC_SUPPORTED(ref_perf_reg))
> -                       ref_perf_reg =3D &cpc_desc->cpc_regs[NOMINAL_PERF=
];
> -
> -               if (CPC_IN_PCC(ref_perf_reg))
> +               if (cppc_perf_ctrs_in_pcc_cpu(cpu))
>                         return true;
>         }
>
> diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
> index 13fa81504844..4bcdcaf8bf2c 100644
> --- a/include/acpi/cppc_acpi.h
> +++ b/include/acpi/cppc_acpi.h
> @@ -154,6 +154,7 @@ extern int cppc_get_perf_ctrs(int cpu, struct cppc_pe=
rf_fb_ctrs *perf_fb_ctrs);
>  extern int cppc_set_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls);
>  extern int cppc_set_enable(int cpu, bool enable);
>  extern int cppc_get_perf_caps(int cpu, struct cppc_perf_caps *caps);
> +extern bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu);
>  extern bool cppc_perf_ctrs_in_pcc(void);
>  extern unsigned int cppc_perf_to_khz(struct cppc_perf_caps *caps, unsign=
ed int perf);
>  extern unsigned int cppc_khz_to_perf(struct cppc_perf_caps *caps, unsign=
ed int freq);
> @@ -204,6 +205,10 @@ static inline int cppc_get_perf_caps(int cpu, struct=
 cppc_perf_caps *caps)
>  {
>         return -EOPNOTSUPP;
>  }
> +static inline bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
> +{
> +       return false;
> +}
>  static inline bool cppc_perf_ctrs_in_pcc(void)
>  {
>         return false;
> --
> 2.33.0
>
>

