Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C067C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 04:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83O1oRzrZe3Tf7Tu6tuN/pr1ROh0NC7/xEo52yjes5Y=; b=nfc4OL0JDWJ8q2KpDAdaqZKg1Q
	TV3IZR2BC3WH7RM9unupojU6MDcU/FFtRI3ER+bRbv7x42eMir1x/Vn8+Zag3rbAU9SOK2ZF2AJ4b
	k+nrTZXWKZULqULzl7K4frI4bwVITNfBGH4hcFtd05fiDlH3I/20iEsKfAK4kBA4vD9OLbLzhuqOU
	0GEEzN3MVwrLgOUHrcAT6LHPewFcby+prIVGHhk8qHiDfGPLhYObBrc0MEW1LivgXX0PvjCsiJ6UM
	3oeGhQrEUUmKSxa+FEq7/KC6ufFjSPOgBNMZjVgZ4suOfwpJaFR01uNBRfKIS749pI9Oykp44sIeq
	ONzXzJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucd0M-0000000BgUd-2aUt;
	Fri, 18 Jul 2025 04:47:30 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccxs-0000000BgAw-2WSX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 04:44:58 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e2953dcaa1so3713175ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813896; x=1753418696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83O1oRzrZe3Tf7Tu6tuN/pr1ROh0NC7/xEo52yjes5Y=;
        b=naczrus1Tq87KIEJdd5IRl2AryXsqQCDtLqGkxOyl+uAol87k//LaBgDe3xtwuwD+i
         kO+zBZxwrYjIk60taZVtHutaovVy7aUx4Wl4w50sndIYjKcl65irNagwGldtY4zazukl
         Wk8lJTMp9QwMySpORkr0MccYNim/+pJSOldRrJLKtH/50ClULW1374VoRz5ySi5butMl
         4VbgvYr1gfwZhoPEC/d2xY7LtNFXwBqx3RpfYVUyDdzTdIZLoygLOoM+MV3ZIqVqUE4x
         +ikzyaSXEtElizXnxtPVjm4JoSwPZauijrMICd8Gov+75OXLllVDgCwRTG0ejEc6syGb
         uE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813896; x=1753418696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83O1oRzrZe3Tf7Tu6tuN/pr1ROh0NC7/xEo52yjes5Y=;
        b=kMJJ9IkzXM/MiMM1KnqgEuq4me1/yWypHqSC/i0bokVd7GgT5iZvJ6yI0McfvYrnoX
         qsmXJyzmq/E2jaK7QxKXhDj87ooaPKNej/ybCcVzyUJLoEgQvGBV/1amDHtTDsjOimSw
         MkGlCxIN7MLhSr2afbo16Dh97Vjl5fz5LcAhHG8YDau4bZp6DVe5tJfIovZK2+9BgPVG
         gVq168SwMWCbSr8UVVm/SiPuKnXdETejbfnHMGWVTyUi3aFDRogUbOctYLdtPOYj31tW
         dhAb14tHFbFoJkNmFuaI0vgQDE/FukFyj8bsLtnviF6rHUkfGZ04m4xpWz+wKBalYrb+
         5otQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmwhFX4GJUhdcVvWpwqwLGfAY//2jn1EtrNXAsWcSqd12FxsxBWqM8w1ac0VGRXOc802r2Gz0OB5kn3MzCfU1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4kdSaZLEaYZqt+0Jp64qQkMf65KwnPiG25Z9RWMQM5qW7QcXR
	9lQ0PusbLxmsy7wXGzO23rjZDanhrzjKdxFNixA+Fy93j+/amPC3t2oEjpgb1m5BkchC8I583wM
	T1DevXJ8So4okeZTrXHVFXI1TRzi4U/Z3+5cSutXWsQ==
X-Gm-Gg: ASbGncufXGfs/IGx94pb9mACVdkq69JehXJpCXaDxeZBqGE6MdrTexnADpHRCpFmT/R
	2zITqe2fijJTAgsa554E9fnKUQ1pi5H7bNpvCiDt+n52HG9B86J+T8zrllfRpNM348aeVh0DnUW
	DCMwbNWkI6E1tfs0wlCzIV7PGfhfk0jh9nqyu9EnFr7Tqsq4TsldSvDuGkRRRTVTZoWoXOf4cnz
	rUxAD1t
X-Google-Smtp-Source: AGHT+IEQ4otNtt6pp4gCO0IAJF0iXhgJzg+MtD1U6+aiOibg4+X80HGU1rRgRl9yQCkoPHu/mILJDq3l2KjWUtT69q8=
X-Received: by 2002:a05:6e02:3786:b0:3e2:9193:f37b with SMTP id
 e9e14a558f8ab-3e29193f441mr38720145ab.16.1752813895694; Thu, 17 Jul 2025
 21:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:14:43 +0530
X-Gm-Features: Ac12FXwDM51LcC52YMXP6x19jKkago_UCHpgC4vfOjbMUKEF0l7xeNYNTebWdEY
Message-ID: <CAAhSdy0t0UuLwBD5abY52dEaHtcai0uVDucY+vtrtxNj0uYQOw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to 3.0
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_214456_632992_899B12BC 
X-CRM114-Status: GOOD (  16.36  )
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

On Fri, May 23, 2025 at 12:33=E2=80=AFAM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> Upgrade the SBI version to v3.0 so that corresponding features
> can be enabled in the guest.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Extending the ONE_REG interface to allow KVM user-space select
SBI version can be done as a separate series.

For this series, we can go ahead with this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index 4ed6203cdd30..194299e0ab0e 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,7 +11,7 @@
>
>  #define KVM_SBI_IMPID 3
>
> -#define KVM_SBI_VERSION_MAJOR 2
> +#define KVM_SBI_VERSION_MAJOR 3
>  #define KVM_SBI_VERSION_MINOR 0
>
>  enum kvm_riscv_sbi_ext_status {
>
> --
> 2.43.0
>

