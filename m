Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1260D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q78Gf8ey3PlNHaQFSeNbIKQ639y8O+joeYk6mwpkVco=; b=ufDkoalJh0Ha6COHY+Z93OSMUA
	6eOlIW93KbWIisFLrRoMi6Q0qUoZZB+fT6KVKA3NFJRzcXGYNhm1Di7luQBTc7emO2AjMCzsfqH1P
	k9O88UUD+MhSGREEnIqEW5XbpAmXE0+Q7fqJxKbLqqRzrkbnX6K7ERvzcvIJ1tcMaGRTjdiOW91ow
	86LuKN+G55QTPPX12WgEuV4XJatRsflJQSRZp7M/13NeuiwIMGOBJ77e4nl6tTqhz4rv/zRLuLzDk
	vOJYs4A+ssrv1eVjdHpcjW1/2xiYR3YlKqCETkyhvkDd1aOZCGQri+RHCivFSHd5aqqv1B2Z3Iggx
	6eF2FaHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkS5A-0000000D8JG-0fgN;
	Mon, 26 Jan 2026 19:17:04 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkS58-0000000D8Iu-0rmW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:17:03 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-501511aa012so57731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 11:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769455021; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2ujTcJ3LpQmC0SNRGgSN7XhBl/zSEuLs55W33SzbPlhrnVVp9nRXADk+LC7c/vMY7
         PN/Fcfle4qrXIfRMqA5wBfj4tOvb8T6J5MVxV6EdpfU0kl2q0p1XGjQh1UTotfDBTDWF
         0423ddp4kJYEHLgXhGdrPsicUDF+U/4FNaTxWy1Cd/usTuawlpH4FvorKAYbwFTrHEsv
         wQcJuP2uVo4aPPU7w8LJzhREAL+eNsBiVNpTgJR/l9oMbo9ojmFsKKdWuMMyGxmMwzt4
         nq1Ms1nqb3cLP91xD8MP2wlEsZYhQ5yM2pKyrg8IdKScASpBaqIWHCW8t0HzDkBj7olD
         UYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q78Gf8ey3PlNHaQFSeNbIKQ639y8O+joeYk6mwpkVco=;
        fh=YjH8S9AOxpxWtVDhhhnmqGpbCQuzRA+3jFogh4/jLFg=;
        b=GV62KMW+rLE9/m8PiBkgMt76X2zBC4cUQJ8JvKRJ3pUWTklFpu+RciBa7R1JKSRNf2
         exx6dQjtkV63p9ZCayNZfRbjYBBgds6kc270PSkfl0oQBQr8+aGNvrioZQVyXAJQ62ub
         HdPNa0Fh1oOEk02KTmRx9bKyI8NLdTOb1xMt2AQOOgkhx9IWBF7CwMTZ0KTDQ4yvaHSK
         25TxUZ6QvUf6WqhBCKAvlPW7MKpAJkZmfiiICLcLadrheTecuYuPU8CPX69I2DFWQnAf
         62uGiujYpzFT1mPqsBPZKOEOMGja4fWzZnDT9hhxqp98vlWUHCjkXm9xCojo00OkUXoY
         GiMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769455021; x=1770059821; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q78Gf8ey3PlNHaQFSeNbIKQ639y8O+joeYk6mwpkVco=;
        b=kRak8qANKtUKhjKV/uAfY/IMrgZzCkPQZ2WzDTZBG4WzBuyVpPcsxi/XgqC72rJHMw
         PI3wUdIxFLeBAyFgEMM5L5zezz4a+/EZR+HtvMXw2jYvyyA65lEcpw+LB+R0qSbbRaa4
         yGRGJ0cwzmxE1vNXq17JABSgJCClCGdfwjN56n8pqCGXDK9TDdoCrqDClTmPtWiLjnpx
         XiIIjuuo9l2kFu8N8c/loJ0TzY136UWMXKhZRDoudDlpzREGbV6RDzXueP63i1s2ypyy
         y2VOix9uZOPQrcFqqH3k6tgNoYq8qZlD+FJy2Cn+P7MJIDDcJHEO13rdqm2vHRhJvv0A
         3rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769455021; x=1770059821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q78Gf8ey3PlNHaQFSeNbIKQ639y8O+joeYk6mwpkVco=;
        b=THyGAJqDv8lLQUewKJXePTe4y0QVAJMgeS3UVF/pvxlxYE8CEvnp//Yp58kOFyTjx0
         fbjKbOPznZPr8ct8Yvigm+nuVPdPIRaxc1nBzs43ALlLZzcKrXC5aoTz2dYNAD7nuYnB
         TzGmoHspHRWLIxpG/pMZJpCA3Nqp7HMvLcBM6cNO2eIKUuSLwXvruYXt6Cj253BhQTUr
         a+QnBBJu+ndzNm9wTHDf/rib3LTH76PNA1enhL30D/+VVsx5sO8+kaFfsaFIAnkhGLfD
         b27Jw6cZ738swaHWRT8hz+v0P2AzBjPk6wRVWUfCC2/p0+uorGw0J6goeULZlFXZGYQ0
         ggWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu0C96edJwcQyV+tL8VM5DJcNiDjgmToiSaFQUccWhDZTWUV+pS9l7xY3BeD4GLDY42GmgZ+sVovonYQzs0wii@lists.infradead.org
X-Gm-Message-State: AOJu0YzqHagojzsBfWNGSBFqXLkYT0GZMOnngCPmadTGLZsZnmMqnHXu
	n+FebR4YQzXfABwHhdxqjh0E1cHeEpxqwUG0qzFHB5oIxgq0JHtWwE1HY7mN8AX3M1c8IyCMcWl
	+IjBb/Z3d6YqArxqZklHeJdYuemsCNB1GAn1ge7sj
X-Gm-Gg: AZuq6aKQXiWD1/Kphr7A+bsaOb/ZJKxvpOnOF/gJpSuj2gc9g/N3OnxNv2H2/HMiepG
	4uGPXQlsHITEg4VhgZ8cs1ry24LAxMetQfzOCtkTEpwW6t3ZGIUrVAtMIxlhwT1L0yy7xXN+FZ4
	FtxidqMmgOtyOvkW1zAIPLZGTJgMY4DEffsQRmO/LTxq+t03b3r2QaH6MIEigD0aYFJpIW3swpu
	5Wi8EAha/JQrPujMGvCWyffu34U3+PXGbwqLCeIiss8PwubJRrTEINIfzc+t1sxxnQzJshw
X-Received: by 2002:a05:622a:1651:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-50314395914mr14193861cf.11.1769455020509; Mon, 26 Jan 2026
 11:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-6-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-6-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 26 Jan 2026 19:15:00 +0000
X-Gm-Features: AZwV_Qjj96yrEnieCy5TgVtfTcOY3xBDAy9jwhHwQBFe31riTdky8XYLoS7UhzA
Message-ID: <CA+EHjTzmr+479uxdQgnM6Ai5jcx1=L2-ufQPD67fvqsCL1gZ8A@mail.gmail.com>
Subject: Re: [PATCH 05/20] KVM: arm64: Extend unified RESx handling to runtime sanitisation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_111702_295289_4B86763D 
X-CRM114-Status: GOOD (  24.73  )
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

Hi Marc,

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Add a new helper to retrieve the RESx values for a given system
> register, and use it for the runtime sanitisation.
>
> This results in slightly better code generation for a fairly hot
> path in the hypervisor.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h | 13 +++++++++++++
>  arch/arm64/kvm/emulate-nested.c   | 10 +---------
>  arch/arm64/kvm/nested.c           | 13 ++++---------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index a7e4cd8ebf56f..9dca94e4361f0 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -635,6 +635,19 @@ struct kvm_sysreg_masks {
>         struct resx mask[NR_SYS_REGS - __SANITISED_REG_START__];
>  };
>
> +#define kvm_get_sysreg_resx(k, sr)                                     \
> +       ({                                                              \
> +               struct kvm_sysreg_masks *__masks;                       \
> +               struct resx __resx = {};                                \
> +                                                                       \
> +               __masks = (k)->arch.sysreg_masks;                       \
> +               if (likely(__masks &&                                   \
> +                          sr >= __SANITISED_REG_START__ &&             \
> +                          sr < NR_SYS_REGS))                           \
> +                       __resx = __masks->mask[sr - __SANITISED_REG_START__]; \
> +               __resx;                                                 \
> +       })
> +

This now covers all registers that need to be sanitized, not just
VNCR-backed ones now.

nit: wouldn't it be better to capture sr in a local variable rather
than reuse it? It is an enum, but it would make checkpatch feel
slightly better :)

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad





>  #define kvm_set_sysreg_resx(k, sr, resx)               \
>         do {                                            \
>                 (k)->arch.sysreg_masks->mask[sr - __SANITISED_REG_START__] = resx; \
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 774cfbf5b43ba..43334cd2db9e5 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2427,15 +2427,7 @@ static enum trap_behaviour compute_trap_behaviour(struct kvm_vcpu *vcpu,
>
>  static u64 kvm_get_sysreg_res0(struct kvm *kvm, enum vcpu_sysreg sr)
>  {
> -       struct kvm_sysreg_masks *masks;
> -
> -       /* Only handle the VNCR-backed regs for now */
> -       if (sr < __VNCR_START__)
> -               return 0;
> -
> -       masks = kvm->arch.sysreg_masks;
> -
> -       return masks->mask[sr - __SANITISED_REG_START__].res0;
> +       return kvm_get_sysreg_resx(kvm, sr).res0;
>  }
>
>  static bool check_fgt_bit(struct kvm_vcpu *vcpu, enum vcpu_sysreg sr,
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index c5a45bc62153e..75a23f1c56d13 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1669,16 +1669,11 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
>                              enum vcpu_sysreg sr, u64 v)
>  {
> -       struct kvm_sysreg_masks *masks;
> -
> -       masks = vcpu->kvm->arch.sysreg_masks;
> -
> -       if (masks) {
> -               sr -= __SANITISED_REG_START__;
> +       struct resx resx;
>
> -               v &= ~masks->mask[sr].res0;
> -               v |= masks->mask[sr].res1;
> -       }
> +       resx = kvm_get_sysreg_resx(vcpu->kvm, sr);
> +       v &= ~resx.res0;
> +       v |= resx.res1;
>
>         return v;
>  }
> --
> 2.47.3
>

