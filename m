Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E634FC72C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TR5RyAMW7afQqyguOMIyPaHLXgPGUcb/ZSGixWj0Ook=; b=I92M7Aouih5lpLNmWIb0RQ//9H
	NARi6Hmr+pgI9Yq7hlL9BJFERQlECTkiijyFPlZSd2WmQCSlvj57JKwLVLKs8Yv0Tzi3MLcmda11r
	RSlNmkq3jkLbGUoWNuTr6EExnsWRKK4eyxsxShKuCA2rchvg6X0DG0ktcWgavHSycB3Ri7tgWew7Z
	QWagVRM69Zhx0YXC53tDaG8ZURU1ySzRXJ7XUfKxPu2wpEzkMyeawqc76uSJ05tMTppw38c1PoOcM
	hJNNxC+4Lq3Ij/4XKq8PXqEishe3xblwCNpe0PkPV/AlA6KgWbyevkYk5L40n3DqFQn4GNGn08wQl
	wMJuXUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4KQG-0000000FRK6-1hPo;
	Sun, 22 Mar 2026 15:09:00 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4KQE-0000000FRJj-2pZO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 15:08:59 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509062d829dso773361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 08:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774192136; cv=none;
        d=google.com; s=arc-20240605;
        b=PaxEuzsbRMbDW/q3FNjjShO5pdFp6pASotRLgpU8f8g0IcnQqD124g4EUSykLtrjJP
         4P11N3rIx7MDvb+1/khLPOzj887kxRb9rCzjXIi1/GZKDF2h/C6MbtZS/LqB448UrAJM
         hTPWhaZKRFbVcy+wDTz4lmRsLAP1AIAIpYO+1yI1vfDqPhW86pzoi7Y1YOqlVnKAGDr7
         A9JwOT9RXl6SQP4m8pJapfM0EEa+uv35l5OODYdc8BEAOk6ibVrJ/cfTtRulIqtQ3MBS
         grUhWWlVhogtSXTUkJrz8HjMYCkqdYB85/m/wzFryKcX1wKMdo6QgYDHG7oCj+JpaISA
         Fvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TR5RyAMW7afQqyguOMIyPaHLXgPGUcb/ZSGixWj0Ook=;
        fh=RwnQ6EJ5UmOHfex7ZJdl+EpkQGSZI0W+4fG+VpPRleo=;
        b=Pq85hkieAKvmcXM90QU5ocDP/v309deGznK8whRnDaKdye6VxWv9kBHB/vtFb0vQGb
         wZze3TciGN5BKyZBn6m0Y3/xE2kMZCxu5wY2lgHhEEAM6hZ9WpkQoDh1X1e/D7oBZrPl
         LAy40hENiXGD4rZKZrkWg8hz0P5ptoa867d6oTBcnzm5RRojj21QNc2n4kpF8gW7IlAu
         bUXpRWPaFbJKdpshF9Hwl4x+1QLYpCqSFhTP1kLGmuIpGnegxtZeL2vOkfjoyggC8ZHx
         nOUNzfP8cdnbk08ZLg7T0NDFKqoxnbD1VnmiJpRG38qNHDddaXD6LtoIWKvToY/M5+I0
         RH/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774192136; x=1774796936; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TR5RyAMW7afQqyguOMIyPaHLXgPGUcb/ZSGixWj0Ook=;
        b=n/WDAvKmJFMVI9tGOnUjvJXT5mJPnRDBZ1Qz6q5A8ZEGcWUN2rNhPcEUNInu4g+Fn+
         cKzquIufpMpxiE0YM7Wl+ywzDO0Tx2SWUIw20rSc7PyjwduYXmad/Nwigfx69svodJSl
         eW5o8evFp5CerUq+RrNoVnPuXYfiYLQNnXM8phA5NiSR1eX0Uz/JCfvblsvRMcuuzFL0
         bLpk6sw/TelQnZ1VHO25VkgqJgGL2/a6/g0ZydnL7uTmthMCoA1XEgCTgCyuqWf5jCte
         lGysKoL6GbmBO2MoMvstMXsCjzRjSqJnZywPdfDbiMsj2WGy28cw+i9BtrGLVpQue50I
         wA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774192136; x=1774796936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TR5RyAMW7afQqyguOMIyPaHLXgPGUcb/ZSGixWj0Ook=;
        b=EecCzAwT8Mn6w0kMT0fmgo6Kziu97AwIoYp7w+Y12LTiU58wr/g0JNss3Jq9MxP9/+
         FQQQWuYY3tsGZ7sm7+BGOaeM64HxKJcZ5Oau4WZ1/QOgEuFkJrXYE8W+zlb7JUwgggjJ
         U8rSmuEUkT02FfAaJ88078q+EWg5UntHKcf0GNXEfJIZpsKJxex6itJJzNirJm5HLyAO
         sypeuL7Of5BilH+09UdjIwtV632aW8bPWHZ4wyJnspDyVBSEW7j87QfEh5027+Z6fO0S
         yxRRDBU1tSHTHCLl/IslwQa963XGR/UgYeUBXSluQp3+iS4F+7XV5ndFWE4gU3DYADzE
         Qd1g==
X-Forwarded-Encrypted: i=1; AJvYcCUA+bezK7yAB15biryXArNuysVI70qIUn+vDK80+s6MHSTmHiH3Vn6596R14nUbZaSPjSm9Yd7MDkwrgHZ5XJ2z@lists.infradead.org
X-Gm-Message-State: AOJu0YxNME6ZTW0rZdABjucbXbmPcGR3wrIjn5c6EXI62iZjy6WES8iC
	hqzrAoSI8wS7XwthvJWmSBJiQYVpZ8405rtD07oGM79e4PdkkyMXffviUvLkb0H8VJN7iiNDy8L
	Y1XUlStr13a9xBYqSHdcnFNc1uK6mbJE42/Yk7NUT
X-Gm-Gg: ATEYQzxlivjQxADhdc4ZK6N55iXoFtrw94eouwLxSHFr2Ln9nxjeIGW5UXrqUoI3X9b
	p8NR0ZiCgWBcgVpI3wPleoiplkkTZYpKWmtO3dD7cIAtDA1DVLWbKHH7jUVTXC/n8jqhfSgEUty
	DgTNjBVhVQc1hOK6+N5VJbYV053DvT4ajOpxOxhnMsVzeAeESftYvRorKV2DqFu0gMPEsCgxDo5
	gPpZJTCrPtSIyBRR1BTZJXgb1NvSp65ADAqRf9gHfhfGUOSfSvCJI8nR8wCDTciDUZ+cOrbk0c6
	+sH5KyNh
X-Received: by 2002:a05:622a:4a8f:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50b46cd0bbamr20546021cf.10.1774192135946; Sun, 22 Mar 2026
 08:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org> <20260321212419.2803972-2-maz@kernel.org>
In-Reply-To: <20260321212419.2803972-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Mar 2026 15:08:19 +0000
X-Gm-Features: AQROBzChkGh3Y5_KqgUzXigR7VJuZFDR7yUQIpecNEvPXr0n70MRqp06E-mDBgE
Message-ID: <CA+EHjTzkB9TXxjbSmWPW1T2HS=4tk5L=y-DLNv0hUFzqh7m7aQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: arm64: pkvm: Move error handling to the end of kvm_hyp_cpu_entry
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_080858_756766_19E54843 
X-CRM114-Status: GOOD (  18.58  )
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

On Sat, 21 Mar 2026 at 21:24, Marc Zyngier <maz@kernel.org> wrote:
>
> We currently handle CPUs having booted at EL1 in the middle of
> the kvm_hyp_cpu_entry function. Not only this adversely affects
> readability, but this is also at a bizarre spot should more
> error handling be added (which we're about to do).
>
> Move the WFE/WFI loop to the end of the function and fix a comment.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index 0d42eedc7167c..5d00bde092010 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -201,14 +201,9 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
>         /* Check that the core was booted in EL2. */
>         mrs     x0, CurrentEL
>         cmp     x0, #CurrentEL_EL2
> -       b.eq    2f
> -
> -       /* The core booted in EL1. KVM cannot be initialized on it. */
> -1:     wfe
> -       wfi
> -       b       1b
> +       b.ne    1f
>
> -2:     msr     SPsel, #1                       // We want to use SP_EL{1,2}
> +       msr     SPsel, #1                       // We want to use SP_EL2
>
>         init_el2_hcr    0
>
> @@ -222,6 +217,11 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
>         mov     x0, x29
>         ldr     x1, =kvm_host_psci_cpu_entry
>         br      x1
> +
> +       // The core booted in EL1. KVM cannot be initialized on it.
> +1:     wfe
> +       wfi
> +       b       1b
>  SYM_CODE_END(__kvm_hyp_init_cpu)
>
>  SYM_CODE_START(__kvm_handle_stub_hvc)
> --
> 2.47.3
>

