Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1CDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1p8G1qx/myCB1d4LebeVFWlONzgCOT5j0oP6baG9ro=; b=Ko4ElGecytF3bB2wWRlJNDfV4+
	NIoEK9GamYRNFA/6FJXkROfl28YIk/T7ZaMKkrSCQkG2w1zSCTfeTCRtOPJOtTDCcW6BTDb/P3+MZ
	eF1HAM9JUL3MVK+8mYl38Ho4tY2D9DSCAcbtVO3FVGWTGv3xW6T5iRbCAyr/BLEzIaXbBnDvUut09
	xFNUfi82SQfHb7H8i/G9g8swPe4a2XKmiRbuEAUHH3+p70ARk/ImqXNtxUOwLtDMkkLYs0tRwH75O
	1kb/Z1PKhs0uGaNEYoJxkdWqgxuJKN5itdKfSUS0lJJOunFgddGgbsCDOAJH5kN2TRxQLSKvKyzyi
	KbnXaITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuw9-00000007VPu-2z3L;
	Sun, 12 Jul 2026 14:13:41 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuw7-00000007VPR-1Xyg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 14:13:40 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoI6q5oLQg9sTSelF6Ka3g7qj1LUuE5XKSBQVday5r1II3N4sj95LjMv7c4/w56grCUTvqmaetxY3bXpaxwiWps@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783865616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1p8G1qx/myCB1d4LebeVFWlONzgCOT5j0oP6baG9ro=;
	b=Qgrh5W5xPCdW+gHcSBK7c9CpB829UAYH3TTLx7dztF22lwuMIvw2jAbfLQtZrZkv1dF29n
	OHe+A9jLhW9rAx3A02a9GBhcN/W0c/5sPYIDcygDTCZgimswWtwWlVegGjgiIFL2GvUbeX
	xBZA4NaQPdcmRcSNjdEnjw0q3E+UVSM=
X-Gm-Message-State: AOJu0Yzz+V4wzKUjsHQsxiPxrwxKOjsrVh1x3FpLfLdt1mlAAAWGbb24
	pGtyzkHN+PaWv8htb+NwQ0zNJ5ZtTAwRJagZAxg7ied/nOip7P1W4CEA3QXStFaJXCY2sI6dvLE
	Nqi9BxZkItYU7p3QaJ/6JdPYIxfP8Dpcy7OWnEwnn
X-Received: by 2002:a05:622a:2445:b0:51c:7a8b:c401 with SMTP id
 d75a77b69052e-51cbe52b8cdmr11059291cf.26.1783865588787; Sun, 12 Jul 2026
 07:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org> <20260709-kvm-arm64-sme-v12-4-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-4-d0301d79ef58@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 12 Jul 2026 15:12:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzVLnXu1E3guYVABoxLLE4foTM6j1fdew-phtFrBqJ2Fg@mail.gmail.com>
X-Gm-Features: AUfX_mw_6gUrHc1w-6H1pc7a-cqHr6VwfuBC29l_JPEHSqk3sPWCHZfRDSEVflg
Message-ID: <CA+EHjTzVLnXu1E3guYVABoxLLE4foTM6j1fdew-phtFrBqJ2Fg@mail.gmail.com>
Subject: Re: [PATCH v12 04/29] arm64/sve: Factor virtualizable VL discovery
 out of SVE specific code
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_071339_703201_8D7705BA 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Mark,

On Thu, 9 Jul 2026 at 19:40, Mark Brown <broonie@kernel.org> wrote:
>
> In preparation for reuising it for SME pull the code for discovering the
> maximum virtualizable vector length out of sve_setup() into a separate
> function.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 41 ++++++++++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index dc1ad10e39a2..5c156e2a47ea 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1114,6 +1114,29 @@ int vec_verify_vq_map(enum vec_type type)
>         return 0;
>  }
>
> +static int vec_virtualisable_vl(struct vl_info *info)
> +{
> +       DECLARE_BITMAP(partial_only_map, SVE_VQ_MAX);
> +       unsigned long b_min_partial, b_max_virt;
> +
> +       bitmap_andnot(partial_only_map, info->vq_partial_map, info->vq_map,
> +                     SVE_VQ_MAX);
> +       b_min_partial = find_last_bit(partial_only_map, SVE_VQ_MAX);
> +
> +       /* All implemented VLs are virtualisable */
> +       if (b_min_partial >= SVE_VQ_MAX)
> +               return info->max_vl;
> +
> +       b_max_virt = find_next_bit(info->vq_map, SVE_VQ_MAX, b_min_partial);
> +
> +       /* No implemented VLs are virtualisable */
> +       if (b_max_virt >= SVE_VQ_MAX)
> +               return 0;

nit: this is a reimplementation rather than a straight move, the
no-virtualisable case returns 0 (and drops the WARN_ON) where
sve_setup() returned SVE_VQ_MIN. No change for SVE (that case isn't
architecturally possible), and 0 is correct for the SME case this
helper now also serves. Might be worth a word in the changelog, since
"pull ... into a separate function" reads as pure code motion.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad



> +
> +       /* At least one virtualisable VL exists */
> +       return sve_vl_from_vq(__bit_to_vq(b_max_virt));
> +}
> +
>  void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
>  {
>         write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
> @@ -1125,8 +1148,6 @@ void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
>  void __init sve_setup(void)
>  {
>         struct vl_info *info = &vl_info[ARM64_VEC_SVE];
> -       DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
> -       unsigned long b;
>         int max_bit;
>
>         if (!system_supports_sve())
> @@ -1149,21 +1170,7 @@ void __init sve_setup(void)
>          */
>         set_sve_default_vl(find_supported_vector_length(ARM64_VEC_SVE, 64));
>
> -       bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
> -                     SVE_VQ_MAX);
> -
> -       b = find_last_bit(tmp_map, SVE_VQ_MAX);
> -       if (b >= SVE_VQ_MAX)
> -               /* No non-virtualisable VLs found */
> -               info->max_virtualisable_vl = SVE_VQ_MAX;
> -       else if (WARN_ON(b == SVE_VQ_MAX - 1))
> -               /* No virtualisable VLs?  This is architecturally forbidden. */
> -               info->max_virtualisable_vl = SVE_VQ_MIN;
> -       else /* b + 1 < SVE_VQ_MAX */
> -               info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b + 1));
> -
> -       if (info->max_virtualisable_vl > info->max_vl)
> -               info->max_virtualisable_vl = info->max_vl;
> +       info->max_virtualisable_vl = vec_virtualisable_vl(info);
>
>         pr_info("%s: maximum available vector length %u bytes per vector\n",
>                 info->name, info->max_vl);
>
> --
> 2.47.3
>

