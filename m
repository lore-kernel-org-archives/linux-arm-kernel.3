Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8372E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgz1pf59HhFQwhX+AoO9GXmTEj308CqbXM6bULf4Lzw=; b=Cm9q9k9OtvOGoGQarhwzEBO0kz
	mkfmV4+xKz46LJgeHlNG1zOCHxNKK8V9gnXj348+zhxv7eZPLK2/PHQaTT/s3ZdVbdR1X3Lv3TEZF
	B7zkJXvykvBDYZ/Sr9XAq9c7UoXmi1f+BAyiUw/EllaHo08HszSErZ2zspBnXmvaHGT9Dm27h/moN
	omGuhNgwzmvR1Gy+L7ZiiybJP/tNS6GJiknjKPICk4+t2yVbKUlqAVmFer0IkvVU0FPzCmvJU5P9W
	GUOULaAHnvQf5WsCSqUhgyXEeLrfz5J2u9hHVAS8o347NdVeVQtltNsI8mGFa88qLkCaDQ9zBcq1N
	VaZkm8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCL-00000005hrO-4Ase;
	Fri, 20 Dec 2024 17:54:02 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfx0-00000005Tgu-3que
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:34:08 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-467abce2ef9so318381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734712445; x=1735317245; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgz1pf59HhFQwhX+AoO9GXmTEj308CqbXM6bULf4Lzw=;
        b=IWVa4xk65cmxjnM7HrzV+5zRivQvmZGCgjpKyDC3bOA+RXb3i74LNp+kaAaiH9Bgj6
         WCUuNdktanuEiWQh0Mrf0zEztDgOf2yYbCyulU4SczVSRJzomOhMpnoSle13qxPJfZHd
         WP5Htr2BeCfIclxF8zRGyoSFwfcby+7r4SIRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712445; x=1735317245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgz1pf59HhFQwhX+AoO9GXmTEj308CqbXM6bULf4Lzw=;
        b=nWmjV6fGU+SvnpRl1MxYJ6EW2BEEhQZx7S15DLM5pniFJbYSo71uEDwKv/6msE3R+4
         pUsAONV8X4FWg1eQsLiCm7oTjp26gC15OrKTNtC/GEPhDWdtN9YYwIAYwJmV44PhdxZp
         4yen7HRTC94Fjit6PnweVv46hb4vcKdBzCIQRfz4xxxGL/PvsXtKS37cdHUagv6Mtj18
         QR2CU7+ynxKztkVGcbupUZqDSNw8xV+6TJqYcKixga46xNlZ6DumLZYmiexhf2MudIGm
         FQSUt20cFMJKRRzotjlAPbsXaG1EqgfV0Of/TR0MSjRMFbVw0huy6yV9C4rkHCfg4+Vt
         vB2g==
X-Forwarded-Encrypted: i=1; AJvYcCWcz/GO/E69kSIzggWYJ7LgyMrNPVppJaYKrrLJhWgag0i8IMGrHDwiqY0CImczK/v05TOWQzLB5UhwbiPVAn1G@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr3WpgqAIXALAYfA1MFIFLWrYrXiP9Qfxjv4kWnIuEJC2PyN7L
	NA9RRUTcYzAkAVI6D1hon9fngB3zdSoj8jIZRv8UCaYKFugYCk9mvATIQnXwR2WQNWW4COYstnj
	o67x/yP9m5c/6NAAuD4E8U2/H4blvLqXFLz/B
X-Gm-Gg: ASbGncu0rU0nli+qJdoyDM+TuDp9NjUgDthSLE0UGqqdmFlS21cC5X5pQrUrMxjIJ1p
	nteDvfdS0d/vgT4hj66/XG5xzGcOAJjKToUZjDgZkiBXVWROpjabZICWMaWuWpT7nhsT0fQ==
X-Google-Smtp-Source: AGHT+IEgZZs0znvBuNHG1EZaFB+UIey+thgVWIJFuk5hqk6kjp6faIRhF72ecybWNyHZ7j58TpZIfqHLBIotJLdkotM=
X-Received: by 2002:ac8:5ad0:0:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-46a4a9bebdfmr3988641cf.26.1734712444631; Fri, 20 Dec 2024
 08:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20241219205426.2275508-1-dianders@chromium.org> <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
In-Reply-To: <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 20 Dec 2024 17:33:53 +0100
Message-ID: <CAODwPW8bq8ev7gb4T=p7GeKsW8Q_7MNY1MpauZ9LOcmH3qVw1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Roxana Bradescu <roxabee@google.com>, 
	Julius Werner <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_083406_993568_83303CB3 
X-CRM114-Status: GOOD (  35.34  )
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

Reviewed-by: Julius Werner <jwerner@chromium.org>

On Thu, Dec 19, 2024 at 9:54=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> The code for detecting CPUs that are vulnerable to Spectre BHB was
> based on a hardcoded list of CPU IDs that were known to be affected.
> Unfortunately, the list mostly only contained the IDs of standard ARM
> cores. The IDs for many cores that are minor variants of the standard
> ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> code to assume that those variants were not affected.
>
> Flip the code on its head and instead assume that a core is vulnerable
> if it doesn't have CSV2_3 but is unrecognized as being safe. This
> involves creating a "Spectre BHB safe" list.
>
> As of right now, the only CPU IDs added to the "Spectre BHB safe" list
> are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
> looking for cores that weren't listed in ARM's list [1] as per review
> feedback on v2 of this patch [2].
>
> NOTE: this patch will not actually _mitigate_ anyone, it will simply
> cause them to report themselves as vulnerable. If any cores in the
> system are reported as vulnerable but not mitigated then the whole
> system will be reported as vulnerable though the system will attempt
> to mitigate with the information it has about the known cores.
>
> [1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
> [2] https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck
>
>
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side c=
hannels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Don't guess the mitigation; just report unknown cores as vulnerable.
> - Restructure the code since is_spectre_bhb_affected() defaults to true
>
> Changes in v2:
> - New
>
>  arch/arm64/include/asm/spectre.h |   1 -
>  arch/arm64/kernel/proton-pack.c  | 144 +++++++++++++++++--------------
>  2 files changed, 77 insertions(+), 68 deletions(-)
>
> diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/sp=
ectre.h
> index 0c4d9045c31f..f1524cdeacf1 100644
> --- a/arch/arm64/include/asm/spectre.h
> +++ b/arch/arm64/include/asm/spectre.h
> @@ -97,7 +97,6 @@ enum mitigation_state arm64_get_meltdown_state(void);
>
>  enum mitigation_state arm64_get_spectre_bhb_state(void);
>  bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,=
 int scope);
> -u8 spectre_bhb_loop_affected(int scope);
>  void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *=
__unused);
>  bool try_emulate_el1_ssbs(struct pt_regs *regs, u32 instr);
>
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-p=
ack.c
> index da53722f95d4..06e04c9e6480 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -845,52 +845,68 @@ static unsigned long system_bhb_mitigations;
>   * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before=
 any
>   * SCOPE_SYSTEM call will give the right answer.
>   */
> -u8 spectre_bhb_loop_affected(int scope)
> +static bool is_spectre_bhb_safe(int scope)
> +{
> +       static const struct midr_range spectre_bhb_safe_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
> +               {},
> +       };
> +       static bool all_safe =3D true;
> +
> +       if (scope !=3D SCOPE_LOCAL_CPU)
> +               return all_safe;
> +
> +       if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_safe_list)=
)
> +               return true;
> +
> +       all_safe =3D false;
> +
> +       return false;
> +}
> +
> +static u8 spectre_bhb_loop_affected(void)
>  {
>         u8 k =3D 0;
> -       static u8 max_bhb_k;
> -
> -       if (scope =3D=3D SCOPE_LOCAL_CPU) {
> -               static const struct midr_range spectre_bhb_k32_list[] =3D=
 {
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> -                       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> -                       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> -                       {},
> -               };
> -               static const struct midr_range spectre_bhb_k24_list[] =3D=
 {
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> -                       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> -                       {},
> -               };
> -               static const struct midr_range spectre_bhb_k11_list[] =3D=
 {
> -                       MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> -                       {},
> -               };
> -               static const struct midr_range spectre_bhb_k8_list[] =3D =
{
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> -                       {},
> -               };
> -
> -               if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k3=
2_list))
> -                       k =3D 32;
> -               else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k24_list))
> -                       k =3D 24;
> -               else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k11_list))
> -                       k =3D 11;
> -               else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k8_list))
> -                       k =3D  8;
> -
> -               max_bhb_k =3D max(max_bhb_k, k);
> -       } else {
> -               k =3D max_bhb_k;
> -       }
> +
> +       static const struct midr_range spectre_bhb_k32_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> +               MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> +               MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> +               {},
> +       };
> +       static const struct midr_range spectre_bhb_k24_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> +               MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> +               {},
> +       };
> +       static const struct midr_range spectre_bhb_k11_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +               {},
> +       };
> +       static const struct midr_range spectre_bhb_k8_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> +               {},
> +       };
> +
> +       if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
> +               k =3D 32;
> +       else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_l=
ist))
> +               k =3D 24;
> +       else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_l=
ist))
> +               k =3D 11;
> +       else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_li=
st))
> +               k =3D  8;
>
>         return k;
>  }
> @@ -916,9 +932,8 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_m=
itigation_state(void)
>         }
>  }
>
> -static bool is_spectre_bhb_fw_affected(int scope)
> +static bool is_spectre_bhb_fw_affected(void)
>  {
> -       static bool system_affected;
>         enum mitigation_state fw_state;
>         bool has_smccc =3D arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT=
_NONE;
>         static const struct midr_range spectre_bhb_firmware_mitigated_lis=
t[] =3D {
> @@ -929,16 +944,8 @@ static bool is_spectre_bhb_fw_affected(int scope)
>         bool cpu_in_list =3D is_midr_in_range_list(read_cpuid_id(),
>                                          spectre_bhb_firmware_mitigated_l=
ist);
>
> -       if (scope !=3D SCOPE_LOCAL_CPU)
> -               return system_affected;
> -
>         fw_state =3D spectre_bhb_get_cpu_fw_mitigation_state();
> -       if (cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIGATE=
D)) {
> -               system_affected =3D true;
> -               return true;
> -       }
> -
> -       return false;
> +       return cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIG=
ATED);
>  }
>
>  static bool supports_ecbhb(int scope)
> @@ -954,6 +961,8 @@ static bool supports_ecbhb(int scope)
>                                                     ID_AA64MMFR1_EL1_ECBH=
B_SHIFT);
>  }
>
> +static u8 max_bhb_k;
> +
>  bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
>                              int scope)
>  {
> @@ -962,16 +971,18 @@ bool is_spectre_bhb_affected(const struct arm64_cpu=
_capabilities *entry,
>         if (supports_csv2p3(scope))
>                 return false;
>
> -       if (supports_clearbhb(scope))
> -               return true;
> -
> -       if (spectre_bhb_loop_affected(scope))
> -               return true;
> +       if (is_spectre_bhb_safe(scope))
> +               return false;
>
> -       if (is_spectre_bhb_fw_affected(scope))
> -               return true;
> +       /*
> +        * At this point the core isn't known to be "safe" so we're going=
 to
> +        * assume it's vulnerable. We still need to update `max_bhb_k` th=
ough,
> +        * but only if we aren't mitigating with clearbhb though.
> +        */
> +       if (scope =3D=3D SCOPE_LOCAL_CPU && !supports_clearbhb(SCOPE_LOCA=
L_CPU))
> +               max_bhb_k =3D max(max_bhb_k, spectre_bhb_loop_affected())=
;
>
> -       return false;
> +       return true;
>  }
>
>  static void this_cpu_set_vectors(enum arm64_bp_harden_el1_vectors slot)
> @@ -1028,7 +1039,7 @@ void spectre_bhb_enable_mitigation(const struct arm=
64_cpu_capabilities *entry)
>                 this_cpu_set_vectors(EL1_VECTOR_BHB_CLEAR_INSN);
>                 state =3D SPECTRE_MITIGATED;
>                 set_bit(BHB_INSN, &system_bhb_mitigations);
> -       } else if (spectre_bhb_loop_affected(SCOPE_LOCAL_CPU)) {
> +       } else if (spectre_bhb_loop_affected()) {
>                 /*
>                  * Ensure KVM uses the indirect vector which will have th=
e
>                  * branchy-loop added. A57/A72-r0 will already have selec=
ted
> @@ -1041,7 +1052,7 @@ void spectre_bhb_enable_mitigation(const struct arm=
64_cpu_capabilities *entry)
>                 this_cpu_set_vectors(EL1_VECTOR_BHB_LOOP);
>                 state =3D SPECTRE_MITIGATED;
>                 set_bit(BHB_LOOP, &system_bhb_mitigations);
> -       } else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
> +       } else if (is_spectre_bhb_fw_affected()) {
>                 fw_state =3D spectre_bhb_get_cpu_fw_mitigation_state();
>                 if (fw_state =3D=3D SPECTRE_MITIGATED) {
>                         /*
> @@ -1100,7 +1111,6 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt=
_instr *alt,
>  {
>         u8 rd;
>         u32 insn;
> -       u16 loop_count =3D spectre_bhb_loop_affected(SCOPE_SYSTEM);
>
>         BUG_ON(nr_inst !=3D 1); /* MOV -> MOV */
>
> @@ -1109,7 +1119,7 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt=
_instr *alt,
>
>         insn =3D le32_to_cpu(*origptr);
>         rd =3D aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn=
);
> -       insn =3D aarch64_insn_gen_movewide(rd, loop_count, 0,
> +       insn =3D aarch64_insn_gen_movewide(rd, max_bhb_k, 0,
>                                          AARCH64_INSN_VARIANT_64BIT,
>                                          AARCH64_INSN_MOVEWIDE_ZERO);
>         *updptr++ =3D cpu_to_le32(insn);
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

