Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40B8FC72A9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwMDzF2o2m81/v5dw831E3CHWbmSuwWgk63PblsZ1BE=; b=stgRIF9QU3B+4PfUOW/1057iBl
	HDzYx4pcFhcuuy3DtlQHLKHdEAc2WMmoCkO4pAZ6r4pT6gZ3fzweCQzNxgR4nV5OnDBwZGMYuGBnR
	oVuxuSKccxnc/cCjkiQ5DchBUiNmcpNpJ78yS57H0TqSlACNlOrUxMCz+v1jgtgfKBWIDztTECHoh
	/buf7OKauWDDkBlw6nkoAzDiPaSJKEURQf+/zaA1tITPTclglxpDX8Z/QJFARVT12HpiqAut0PkIk
	DnA28yoYrFr1ymRqY1ZyHccx2Pab1gdgB80BQiRkwmKsQM24NdwO9a2qbsEAp2tG23Rtj6gLqa5qF
	3MkTjdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4LAE-0000000FTf7-3OTw;
	Sun, 22 Mar 2026 15:56:30 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4LAC-0000000FTeg-3Es9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 15:56:29 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50b30d61be6so934381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 08:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774194987; cv=none;
        d=google.com; s=arc-20240605;
        b=RIvw+VycDVZSVLFjDdntgP8Sh0dHgV1E+HfG14c+sU2eZDjzJRPNApCdUgD9gSnkbC
         LttsrGa11ij298aK0snQH6QFeOC++oeIZTZGih/dCSDrz0pyhJURcehqE2CwtPb+IFWY
         0uWd6pTHS6IHNkc0ap848U1RqNOULZnTc/Yz6vrOHHB2axUz+Grpuj7sHp53Lc6/u0Pq
         O1Vn13oS9gTPQkIjQy835z/Pvh7PMe0JHHI49aOonhMtutv0ER10cZG0F8IC6aQk6y8h
         9OYKXs2Lkye6s281AfQO1zIGBtMnJPfhoBaX1eiKqKTEuby6Vi8+ajYYMSGztHy2VGLP
         pV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FwMDzF2o2m81/v5dw831E3CHWbmSuwWgk63PblsZ1BE=;
        fh=OQuuI5RMpQ7CSFtLHe8CXhWxI+x4q0sQcEv+qOfx7yA=;
        b=Km60qb8zIhRi34k2HZog26M650B8YyNFYFJiqUcpa3gwFGSGSw4cRhdI07EcgrdeiM
         DT1wX8nfFIn5a+AnXp8Xj6zHVomdFBm68TgolfSBvMAKKPdVLa6KZz3uzwxn6HoCNAQi
         VK/AcWlDH1UAEH4m8BL0ZXuSAQRd055/kH13fwHVWG6LTii1Ocy3CavePWqkwU8oZsRc
         cPIiU1m7TPmTomwxZPNftxD+q7bW6tF6d7K6jVyJcAQxi/rFHp2sa10vKG4NA1fFnqyT
         qp82p5/S5/DApnv2Umc1/P/jkH1voL29F/FrNeBEcsrmSo+S8sE2wo7degKyI6eZzRsV
         Hejg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774194987; x=1774799787; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FwMDzF2o2m81/v5dw831E3CHWbmSuwWgk63PblsZ1BE=;
        b=b8nBNL1QkRSaQNiB8m85MHL+sW/wwa4a7UV5g1a3AK8Nqot0Ntui2515Wuv+vjmIYt
         8+n/Jj2IEWNdVCi4xVUWu5U+hoy5AYaFrEAkBVYRlEEeVfsXncB5C2pkioRjODLh0A4T
         bu6hyfqd0leUC+QHhWYXd0ZyGh3GrctKQ1anvy80kXrB8k5qSmIhrQPjAiDaSODYMnby
         gCS9I17r/fqNwbcJgPZZX1UAN8wLkuaRrlv588DFTBzIerLMBJ4x7vwA/DivOUVZJrRe
         WAEqO+NlmBWR1y8sDnkaGeuXW0exE5EV290qz8vBG17Thvw1pYD+7SqoHUOidhMiseZ/
         Y4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774194987; x=1774799787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwMDzF2o2m81/v5dw831E3CHWbmSuwWgk63PblsZ1BE=;
        b=XCUEegOAVUFkjwPFaMwgFLLsvxAw6jaIJ3tD9nW5nwcMGsBefbu/2/Sw3MucJ4dt+i
         aCfsX/gu7ggRxCE93vp3cEVY+ccs+plCGwEXkyrt7n44KiHcx6T0A8g/qkUOQUBdxGMO
         I2D6xsVD4kqy5DbnXC/wl4j/AKXDc156Y7GTwbkPlsD5cbUgIY9vAUiOflIsWVlMALsR
         qJUPIHgwY5vWZvRnL/R/Jzs/ajcA9tWdSh6g7zpnKNpbS8qKGeYGLeNsiUyGDdnL7uQR
         PLiiVHAFIICWdAJxVYfoPvPwkgggrPDesaKFxKZEC765NbvfG3MLh/Hd2GMOrNwJqB0b
         VwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUDeUk4/SAycP8UvJpviWkMu2qCpSWAuirYc9qkJzUVrfJUwXz7lY1AhZxC1qgJkFPWKydhTIVd3bcJkqrSXSEQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2OHSW8NJXn9q1NezejmMVNSp7nt4hHsag9qvbmhriH/h+lBuW
	+yrArD6EPMJaqAW6BkpdEmWMj8qwZ1BVxrlrm/57Opqu2X6JKGLSd1MLjQ9gImDREqcxPpVMN+B
	NCxKL6QIzOqw8vrjuueq5lyqcPA5xKSdio1d2KKN4
X-Gm-Gg: ATEYQzw59tr2tm7YT5fEzDax17Gmr8DmPpGA+8ncAHKDiybkf0AsnvekW+Vw4Wvk5NF
	uWVMjG/c7TuuOJSbx8axBVC8vqDZIxqCulr1Cl7s2gRhi+f+KWWQ3GM2la2DLJ2AwPet+2sNin5
	LTB8LbidJVL1y3Q+x3D6VqkUFkl/RInfMh27OF5DsFj77HTljSJP+sOAyLnooF9Tbsy7EmUhJQ9
	oD4wGxLSlllBbGHoQQ5VpX0VviGb/8TEbQ7qsNStvfGrplWsm+cBIa943/WyudEyiRMSKMZN2WZ
	El/guqpK
X-Received: by 2002:a05:622a:5597:b0:509:123c:f317 with SMTP id
 d75a77b69052e-50b46a6754emr18967271cf.0.1774194987102; Sun, 22 Mar 2026
 08:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org> <20260321212419.2803972-6-maz@kernel.org>
In-Reply-To: <20260321212419.2803972-6-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Mar 2026 15:55:50 +0000
X-Gm-Features: AQROBzB171gbCFjgkSVfN6aZYQOGmgdPg7i9k7vMUHnCAcyMTiTZr6INNRnWzgs
Message-ID: <CA+EHjTyRjYBn5UZyz79m4ULV4iW_FLZu7z1LaRwx9FdAQcbKhw@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: arm64: Remove extra ISBs when using msr_hcr_el2
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_085628_846447_89AD57BC 
X-CRM114-Status: GOOD (  19.43  )
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
> The msr_hcr_el2 macro is slightly awkward, as it provides an ISB
> when CONFIG_AMPERE_ERRATUM_AC04_CPU_23 is present, and none
> otherwise. Note that this this option is 'default y', meaning that
> it is likely to be selected.
>
> Most instances of msr_hcr_el2 are also immediately followed by an ISB,
> meaning that in most cases, you end-up with two back-to-back ISBs.
> This isn't a big deal, but once you have seen that, you can't unsee it.
>
> Rework the msr_hcr_el2 macro to always provide the ISB, and drop
> the superfluous ISBs everywhere else.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/el2_setup.h | 2 --
>  arch/arm64/include/asm/sysreg.h    | 6 ++----
>  arch/arm64/kernel/hyp-stub.S       | 1 -
>  arch/arm64/kvm/hyp/nvhe/host.S     | 1 -
>  4 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 85f4c1615472d..3e58d6264581e 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -50,7 +50,6 @@
>          * effectively VHE-only or not.
>          */
>         msr_hcr_el2 x0          // Setup HCR_EL2 as nVHE
> -       isb
>         mov     x1, #1          // Write something to FAR_EL1
>         msr     far_el1, x1
>         isb
> @@ -64,7 +63,6 @@
>  .LnE2H0_\@:
>         orr     x0, x0, #HCR_E2H
>         msr_hcr_el2 x0
> -       isb
>  .LnVHE_\@:
>  .endm
>
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index f4436ecc630cd..ca66b8017fa87 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1114,11 +1114,9 @@
>         .macro  msr_hcr_el2, reg
>  #if IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23)
>         dsb     nsh
> -       msr     hcr_el2, \reg
> -       isb
> -#else
> -       msr     hcr_el2, \reg
>  #endif
> +       msr     hcr_el2, \reg
> +       isb                     // Required by AMPERE_ERRATUM_AC04_CPU_23
>         .endm
>  #else
>
> diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
> index 085bc9972f6bb..634ddc9042444 100644
> --- a/arch/arm64/kernel/hyp-stub.S
> +++ b/arch/arm64/kernel/hyp-stub.S
> @@ -103,7 +103,6 @@ SYM_CODE_START_LOCAL(__finalise_el2)
>         // Engage the VHE magic!
>         mov_q   x0, HCR_HOST_VHE_FLAGS
>         msr_hcr_el2 x0
> -       isb
>
>         // Use the EL1 allocated stack, per-cpu offset
>         mrs     x0, sp_el1
> diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
> index 465f6f1dd6414..ff10cafa0ca81 100644
> --- a/arch/arm64/kvm/hyp/nvhe/host.S
> +++ b/arch/arm64/kvm/hyp/nvhe/host.S
> @@ -125,7 +125,6 @@ SYM_FUNC_START(__hyp_do_panic)
>         mrs     x0, hcr_el2
>         bic     x0, x0, #HCR_VM
>         msr_hcr_el2 x0
> -       isb
>         tlbi    vmalls12e1
>         dsb     nsh
>  #endif
> --
> 2.47.3
>

