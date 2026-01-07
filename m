Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B6D0D16D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=; b=GTIjcXzCoEmmkH6tnDuNPaaT+x
	3dtOrZRqKEQUw2CHTWsOYuh9szy5ptes5KozF9eQ3hTw2ree+H0hKUkgxPpidZLH4Zn7Oy3KdLpou
	hFbAhhGFPqK7AqMRZnlhbxaec0so4Jj5rsgkqVE69ac8O3rWCoDQseu2Yyc5FRjUo95vBrum/NvJL
	YDRU1d31kfieG03TcHSXS++8RTTGzG2RqS2LCvUz/HoeqQGAXauDFZO2NBBPwI8EnntXPiIXkjOVD
	w6CDRWsLbYzik768dTg6BdF03mLqzD0jWKgJib5Lq/ZUxqsdeJoqRO3UpHxs5vi7MOgc/LEiZvQOJ
	qRa9JFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZAp-0000000FXZt-2CaZ;
	Wed, 07 Jan 2026 19:26:27 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZAn-0000000FXYh-0q2U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:26:26 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ee243b98caso481161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:26:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813984; cv=none;
        d=google.com; s=arc-20240605;
        b=F7G+sx7L8MwpDRbei7qXl+1ztHrEJpOHO8Va0La/HE+1n8AOus9deXxYStaBpc1Mwo
         jLD7nQJxueEptdJ0QDlDJkdDsqXL+PMQ/wRC8w52sWbDhQ0IsvZqA54ljeoaEY7Zc2t8
         eurE7hDDYY0N0ShDqNN2Db2QmPsYbTtM36oBqU6z8raDGfUOPtlfRMGlnGeS0WrbnMLs
         WVCKkL2qk1M96BDh4WWZenjqO3b9/xZhnHUMu3AgPHl6lDRQUHnG11LOsYCZZMPPAgDw
         ICqAGzZFSBwhQBuByRZx9R8dwTQQOziyFVXCGLOBNRIG9Tx0Taoc2KcEw7mXwFRMWWi8
         WLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=;
        fh=1D+qR31N4bKRDw8NVM61JwQ+l5wpHFRKQ1F308nUS+Q=;
        b=EiU4baXzuhZe+AK5PUPQBbvIb0yMEPQIsR23tcolmZCegnavMk9uzdAVyIultAvYRa
         WEd72EMO7R/BAZMVJGFoG2yJJJBZnQ358kJmPMe8QQms8b6FYhxMQRqNAMm4S9bdjqmj
         4WyVv8HF0bRW1mtcgWuiuZmJC2FcTf7h+ZpY+2eHjBS8Joh2iGv0VQh8yu0n2a9mpPY1
         wehflbFzNKGkalLVNWgNV8HrhbamSImfThQTHleEqoF2Z8ccknX7/OZtOYZrfu1Sptib
         QtTuO+L9jUREDYW9FFLElW4Wq/u6TUvVn0WmDeEbcsS6QaSoi6cLML/vz4mxrvBP0qFQ
         orWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813984; x=1768418784; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=;
        b=z0gIDBk8FL8jtBUCj7d/yjibMUeYfwoFvrcE61Mz3d+rR5E1xnGQNtgH8YYmN7qzxS
         jvhA07BE9ILT5L6JfBrLLmGS+Wxpkr7W4nvMXsWZsvVcF0JyOOxlmfznyBrRoXER7aPS
         i1iLNG4K8AYib/5AOqkA772UE+J0LAQQtiuvOngnmwiIzpEGD6GlGro2MzPvaFNwEnoG
         YA7MsCkDOVLCVM4D1OwuPdzGandgPiMAVZlS9pAckFo4vtuexNHJ2sgapbo39D+M/+f9
         NDTNCXtk6PMYoERSf92LfMiM0K360VaLpMznhBgARZJyQftwQZjjBgzv1ucwM+7TGrDM
         wfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813984; x=1768418784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=;
        b=LBVqf+rgyBCt3bkJ3q1Qmrph9yPotBgKEKromfX6eyWzjUVG4GdCYoo4T000RCpjzL
         n4THW5lZhLSKia8f6VbY6m3Uj/QBhqn/2Lb3VE7eCbIcGcCNDk4AjQ9BGEGfjn+Z//vI
         seGQVIdWtYT30OXBRWT4diSLeJqaPRdNrj038QlhBJ0W12bcIQcQzLBnMkP2JtFPeM1/
         roxKe8cz3wP88Ir5D6XzFprpL997tqVUjsFqcJGJhtYCivCTh4i2hZ1X1lWQaCpvOoFa
         19eYLxACm1XqQ6cygqO7NvmZOy41EQsMGuBUhUlS+/ckD8CGlF1T+keqHvyqDx5w9w/a
         eB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvEsqWHFLYtbksPiwx4Mz3rWcjm+6CtijMEQBfe77MAyMSOJ9doRx5WCtoO+uPf/TGJoXNKBtnrzb00M+07n3c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7GiPQm8x0i4RwG7lYRkEV0bqJ/9vIQ/CVF7jV3E+V2HSecPCI
	uEm5b2br0a2b8lkMA4jv9LzbP+GUB33dve5Z5Na9eRDtF4aV6AUcQeFPoHqsYDBVbgeEpuXWY/S
	5mJZIxu+0yhsXwayExPT5Vac6V3EjhTdN/oO1jPAF
X-Gm-Gg: AY/fxX5j2BfoPJWm/Nvu9eAWxV4zK+pqXpphglZ6SbPBfjFPKp9L0gne+OK+/VCV7jW
	NRweFdsxX9aSWrZFwKDU3grqyzcKzznWNWEBoB5l+sqvekIhZw4FgJQhPEuGsF9H5c80UVLSpIY
	1UFH3Tnae4Ifn6Oct94KGD5Naqyl0+1w2D73cSdojPc+ZAx8X3RPMLjG1GlMJ/Rz/XbOSMvgRpm
	n9huVAGYbMsgMYHpcByz/F9W09/QM6fxIBwiKkAf62O0faP3cgs0Y/g0WBzvv4BXjla3diF
X-Received: by 2002:ac8:7d0a:0:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4ffbf94a082mr1122261cf.19.1767813983752; Wed, 07 Jan 2026
 11:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-5-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-5-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:25:47 +0000
X-Gm-Features: AQt7F2qO0uzZBb7qE9TqF-7WKMNBoVsC6m-23DUQhmoLKw26Bq83cmx6SM9OSu4
Message-ID: <CA+EHjTycP4Wz0V7S8hzWygpeXGzeehTL8RFfit7Eaq4rT+Eu+Q@mail.gmail.com>
Subject: Re: [PATCH v9 05/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_112625_249344_4F7995BF 
X-CRM114-Status: GOOD (  22.19  )
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> As with SVE we can only virtualise SME vector lengths that are supported by
> all CPUs in the system, implement similar checks to those for SVE. Since
> unlike SVE there are no specific vector lengths that are architecturally
> required the handling is subtly different, we report a system where this
> happens with a maximum vector length of -1.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index f4e8cee00198..22f8397c67f0 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1257,7 +1257,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
>  void __init sme_setup(void)
>  {
>         struct vl_info *info = &vl_info[ARM64_VEC_SME];
> -       int min_bit, max_bit;
> +       DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
> +       int min_bit, max_bit, b;
>
>         if (!system_supports_sme())
>                 return;
> @@ -1288,12 +1289,32 @@ void __init sme_setup(void)
>          */
>         set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
>
> +       bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
> +                     SVE_VQ_MAX);
> +
> +       b = find_last_bit(tmp_map, SVE_VQ_MAX);
> +       if (b >= SVE_VQ_MAX)
> +               /* All VLs virtualisable */
> +               info->max_virtualisable_vl = SVE_VQ_MAX;
> +       else if (b == SVE_VQ_MAX - 1)
> +               /* No virtualisable VLs */
> +               info->max_virtualisable_vl = -1;

I'm not sure about -1 as the "No virtualisable VLs" value. Unless I've
missed something, this value gets used without being checked,
potentially even assigned to an unsigned int:

> kvm_max_vl[ARM64_VEC_SME] = sme_max_virtualisable_vl();

Cheers,
/fuad


> +       else
> +               info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b +  1));
> +
> +       if (info->max_virtualisable_vl > info->max_vl)
> +               info->max_virtualisable_vl = info->max_vl;
> +
>         pr_info("SME: minimum available vector length %u bytes per vector\n",
>                 info->min_vl);
>         pr_info("SME: maximum available vector length %u bytes per vector\n",
>                 info->max_vl);
>         pr_info("SME: default vector length %u bytes per vector\n",
>                 get_sme_default_vl());
> +
> +       /* KVM decides whether to support mismatched systems. Just warn here: */
> +       if (info->max_virtualisable_vl < info->max_vl)
> +               pr_warn("SME: unvirtualisable vector lengths present\n");
>  }
>
>  void sme_suspend_exit(void)
>
> --
> 2.47.3
>

