Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA88606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0mi82fcL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oWwWpHb7;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=h+pLiEv1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=; b=0mi82fcLsVV7fg
	Q4JTZD92eXxOspTOwYPgHXcWsOkbFXRGwQ9mb5amdW7Ad59nyQaf82/V4TlS8uKghThMaQKsLpwaU
	du/emaTQFjfGvPFl9Dp5FGrSiMv8kV67dhKvraBc0mpMJWWoBVMfaWQ4lGstyuKoOktOZk1Ri4DhU
	lnVaEkaJm6iclcBJOOBHCGO8YYZofz40NALpjTUHtysHRiH9d5ZTd+pXxqsv9c4UBxgxmc5PV+8WV
	3sOW/SwhTJDMuLEL/rnfpYstBZXs3p2a//y2zPAEu385f8xLgfcHiy6WokIAimvE9OHeViqR/rN9A
	YnuzVtpemfrx9OimbMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKV-0000000GWtD-19QU;
	Fri, 23 Oct 2026 14:33:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKQ-0000000GWnm-36FE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 14:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=; b=oWwWpHb7SehT1MgwOm/KC31Xy/
	l9vNPnkK7q9vZH/mvyujyMwJltGJRCRNQ09+tgvzD0ThUAO0cBdjlBsk/kF7jhO2L6UdDhfnPxmzq
	wTADO3nuiK6TwWMi+1FGxZMyZ0B6x2fJmpjFU+nec5EjnPId5RrIjK6OX/a5/JtcBTv8LgvfbNHP1
	BZdCFiPQyX8mjVDfdupH2sBF7s9Y/F7dDXQAXsWFdBaDfRJkRvh5aDZKHrq9oowXeSysDUAle4Bdq
	BNqbRgaC4keRZkeq3hf/TnU5cLKeSGmDFM3vvuKwXH9XPh6xG6nN4PT7ljSg4JukIekrxsEd5Dtvr
	5ZDtr56g==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKM-00000009qBm-2fn9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:33:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4956869750eso6351995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765981; cv=none;
        d=google.com; s=arc-20260327;
        b=flWt/Y4gMuHelv0L/PjMxQXfBtM5bh0WR1MIUbcEh9MIFUtm15K+rP/jrgUPwlFoC1
         QKlFKSor+5qAXQqejxG7ySOcQG87o2TizZtLHElFWulXtUCjR5O6uzEqlLkSF28xieXo
         uWH+owZxsUFz7EiIXXZ7QAKDskzz12CUmIkpeh/Xm5cXKn6wnSWrG8KW/EDYxsceQbUa
         NV381FNeWP4ydYRDZO/UCLupkgjF6+yg3Ec93KCnd4JILGMhQOjbR1D7bKoJKkEZkii+
         7O8D4Sn3h1CuvrhaN2NFQjVoe2iLxACtTxHTeyGIQHrapRUdDBEB8MDoksGkG1L0RYz6
         SIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
        fh=bXq0xUtgId2e9gNl88Htc14cm28EHHYoUvCGRHYTQl8=;
        b=DmFcU4aXGdPOKKOJMS7zN88rupaqlIL+8vxPjygjBPDvatDtcxF2nRyW00J9AwBPfq
         iHD4PJ/YQ+YY+uZieCAIoC2zUE8G+8VMDGbjqBFUT0alJtWk7Hb8r5rae9xofuwDXP5c
         YS2Stw+TKfPt46QYWtZX9ycOrcWRJivK2fAYAbtgYLA23baY1PWSlibkFfIE5njyjal3
         7PPS8/jqpYz8YgKB5taxw+IWo8XSMtz//QGm55nWkb8KOMm/mI3+R9Ssxb0vIo/yJ1iP
         DxEiZLLLb7khk7KrwyL/JlFy3hPLkYhbbRBfunnU9RhhmL4VN7VTI/+Fwb13cHg+Q84H
         wesw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765981; x=1793370781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
        b=h+pLiEv1DSGjdJdk8sxgZd8EjWYAdyWzte8lKw9oxw6h7yhtQcBtAs7kddrP2cjTw1
         hr+zajcinJvOXjErF7hJlLkCY8aZSDnbQBgK/9t/FT0ZuRLZT2+h4avXluhbyLC7YEwu
         XSIbHTBxAoNPiLtbU6jVK6tppYb13hTxuXgKvYdWWHseJ4rQ2nasI+wK3oT04VLvZ3sA
         bTc4PAinb6+AEMY2rRA991NaBvmqUhIEDGTZ89S/BM7L7YwTI26yiKw0n2NZegqug2v8
         hgZHEzJYegemFUvcE71x5qKYDE1VtGA8r4XmRpKNv1HzaQLjaloPcHQq/QZvHmMt3xO2
         LNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765981; x=1793370781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
        b=AzSZhRT0G9r/DuZmUzqFCsywhIKHIGBZTcLAb1n48Y8sJ2YTAGzfKoLqk13Ay6rV93
         z/h0drtrtXyRSmuWMCJZxwsmWvEGyV3C8YEzbLSVS5imit3MVHWzPcSFqLUI5rsQ111N
         eFBOBV1AQE0PuVbdePgUZ91/8kFO+jFKepP/+waB3KO+CRkbFLo2FIdkXVIZ4hb3HPGt
         5SabEH00jK2tEcl073BKsRga8FWSrNjQsPj69kKUSMfe7LgzWjM8WC/urYtNU8h7MyPV
         uMNoSA2eXGDo8njuazmyoG1kSZ4fTLzYx3ad7kHSQFj1lGur+gdA09tjXg+iIRa0jlPz
         po2w==
X-Forwarded-Encrypted: i=1; AKwUvByhn6bLZUJfswe3178ttbzLT6fI/5Oen8bLEaUd8447eNdA65nDggpSQ/3VbP5yOsLZZBtsXiOLv0A9B8Q9NWig@lists.infradead.org
X-Gm-Message-State: AFq9FYLffXg1A682aC/ThkkPX8m+Vmc/n6gO4KoowEePgs2vTk0gSK6y
	Nxz4ipMIxnZRqY9r43doHsnc8Sybr1KZMy2XWuT17iFR98v8GUKaTkehbRo+6xUU9hn8Cdh5nDJ
	gymwmYvLNqn1B7mzkZjYGcryyapGYWvlQH7gFD9Kouw==
X-Gm-Gg: AYBFou2dpNFidFGr00ciY8zNJGPyw7YFh8P/0ZB542/HTZcZpKP9scNdZ9ujbPCoLnm
	VXUptChOPs5gie1p7fTfBcBaeYLMz/b+tOH0YxZT8fL4WyQeXzR45vbOsd6rVRf7TIYVqPnq3wl
	Zlt8YZriEU0puLsDS7326m0VQpkISKP6k2wb7MgcnzGtbkC+p2jU44v47cWturhvOBr5OQkeAIT
	toLWmCWn/a/wZleIry/UzLz5yhXb9PUO6eyAF4WpV6Dipogw4GnH8KWTg/nUlDZD0KOo7iMcpp1
	ga+8Nn3zxoU2u+FQrIxGrMru5nWRJcw0AzRi2zHRGTtrMkVxBsGmILreN5lSLqXodw9I5qLgcEl
	et186dqpxlaxv82h1tGNMjjwoNuZfJk8odHjdrhoCcsnJMvTnLCTnswwRgXvuOpE/MqIF9oNy0l
	LtLdxgAWOaUL4/obSjwbS5SzL6zsTVN1q4/TLQQPMCYWGJLk5rb78vGWXp
X-Received: by 2002:a05:600c:3111:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4a211cd08b8mr40623715e9.5.1792765980770; Fri, 23 Oct 2026
 07:33:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-12-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-12-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:47 +0530
X-Gm-Features: AclHuK_Te3oHQWEvlM580gwTI1GU6fdT3Cr7_323gvlKeM0VV47C7yWnVu4KXHg
Message-ID: <CAAhSdy0PAGqhX2CaRDFKSVY45pQ-QAQ+Or8BWFY39N9bDBMmzA@mail.gmail.com>
Subject: Re: [PATCH v9 12/20] RISC-V: perf: Modify the counter discovery mechanism
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_153302_842014_1CA0B24D 
X-CRM114-Status: GOOD (  38.73  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Aug 7, 2026 at 1:40=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
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

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/perf/riscv_pmu_sbi.c | 151 +++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 116 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a8a197d341c3..1a1430059909 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -66,6 +66,20 @@ static bool sbi_v3_available;
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
>  static int sbi_pmu_event_find_cache(u64 config);
>  struct sbi_pmu_event_data {
> @@ -867,34 +884,44 @@ static int rvpmu_sbi_find_num_ctrs(void)
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
> -       pmu_ctr_list =3D kzalloc_objs(*pmu_ctr_list, nctr);
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
> +                       /* FW counters use SBI logical ids; skip any that=
 collide */
> +                       if (cmask & BIT(i)) {
> +                               pr_warn_once("SBI firmware counter %d ove=
rlaps a delegated hardware counter, ignoring it\n",
> +                                            i);
> +                               continue;
> +                       }
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
> @@ -905,7 +932,7 @@ static inline void rvpmu_sbi_stop_all(struct riscv_pm=
u *pmu)
>          * which may include counters that are not enabled yet.
>          */
>         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -                 0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +                 0, pmu->cmask | firmware_cmask, SBI_PMU_STOP_FLAG_RESET=
, 0, 0, 0);
>  }
>
>  static inline void rvpmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> @@ -1158,16 +1185,54 @@ static void rvpmu_ctr_stop(struct perf_event *eve=
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
> +       int num_sbi_counters =3D 0;
> +       u32 num_deleg_counters =3D 0;
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
> +       /* SBI PMU is only needed for firmware counters; delegation is in=
dependent */
> +       if (riscv_pmu_sbi_available_boot()) {
> +               num_sbi_counters =3D rvpmu_sbi_find_num_ctrs();
> +               if (num_sbi_counters < 0) {
> +                       /* Keep going if delegation already gave us count=
ers */
> +                       if (!num_deleg_counters) {
> +                               kfree(pmu_ctr_list);
> +                               pmu_ctr_list =3D NULL;
> +                               return num_sbi_counters;
> +                       }
> +                       pr_warn("Firmware counters unavailable (%d), cont=
inuing with %u delegated hardware counters\n",
> +                               num_sbi_counters, num_deleg_counters);
> +                       num_sbi_counters =3D 0;
> +               }
> +               if (num_sbi_counters > RISCV_MAX_COUNTERS)
> +                       num_sbi_counters =3D RISCV_MAX_COUNTERS;
> +       }
> +
> +       /* cache all the information about counters now */
> +       if (riscv_pmu_sbi_available_boot())
> +               rvpmu_sbi_get_ctrinfo(num_sbi_counters, &num_fw_ctr, &num=
_hw_ctr);
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
> @@ -1477,12 +1542,21 @@ static int rvpmu_device_probe(struct platform_dev=
ice *pdev)
>         int num_counters;
>         bool irq_requested =3D false;
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
> @@ -1494,9 +1568,6 @@ static int rvpmu_device_probe(struct platform_devic=
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
> @@ -1598,13 +1669,23 @@ static int __init rvpmu_devinit(void)
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
> +           riscv_isa_extension_available(NULL, SSCSRIND))
> +               static_branch_enable(&riscv_pmu_cdeleg_available);
> +
> +       if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_availabl=
e_boot()))
> +               return 0;
>
>         if (sbi_spec_version >=3D sbi_mk_version(3, 0))
>                 sbi_v3_available =3D true;
>
> --
> 2.53.0-Meta
>

