Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B74D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaBaPbjRvnSlT5xuKPMaHPCMLrVAT3axwn7YGYLPHX8=; b=vRp3X4ub5/BA2mBCYfxcaY/WX2
	cxpPBjbyxtgrhVYnNt/y36VKWcT+4zg6Gbw/CwBA5lFY6SoNgZ2UZ1pN0oSt02iyZAeIbiqM5/ZoM
	YpnEP0lWeIDYax73vC/lErCxdU6QIhl2LBgBWPygydCR8svbUgqhV4WUxnoiIpA+5wz417hRIgf0V
	SEX9TQpH4vtsBj5ckdTN17wncyRHdftDw/tZcam+YMk4nipCASw2lYojHJz0ipFisxfAcqLW+TQUj
	ju/dNDlxMdV2dHgc9qKXqyIHABYQ8RO4UMCPuJgUbFCHb1B+bVIPuHKV4wtNEbf/ITjxorZVcSQ3G
	hEljGzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQnJ-0000000D1E0-3mBo;
	Mon, 26 Jan 2026 17:54:33 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQnH-0000000D1De-32tU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:54:32 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5014acad6f2so6691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 09:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769450069; cv=none;
        d=google.com; s=arc-20240605;
        b=C33bvGpIljy878+RBJ19R6lurHBjeCozm7mdrrLVeS7EZ6a4S+Vsii6+d1W7p0GRMs
         V8KZNtjCuSxz3ZmBxzA1iy4dCqvakyT50N+UHp57Ab9iQWVIauhJ31HHjE59SZOPP1IW
         b8xqBZ431a7ZKVMR6mOjCJZKCtw4j49mw6UZt/lwC4EJuwCO5tlWfwtaTCBsen5Rjzxp
         qc4zBosXomDY+hw0DOjgiYvpqZ3VoftHJguM1jDJcPk7IwAS3iWaT+5Pm/2ZVG+dkKfv
         UDpcXNN6u8dbZJT6XTPec1OTKyxkNFeZhzXzHBcuHRNNY1KyT6O9oIn0LhiFTk0ndzqY
         pFoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BaBaPbjRvnSlT5xuKPMaHPCMLrVAT3axwn7YGYLPHX8=;
        fh=ufez0UNOb21BA6GWsPJxVIWAIflZMCMFaibgJVw6zSI=;
        b=ilEZ7K3dGGosfOhu0cFHfjgGMEc91xIMahKnUmyJ3YAZoEXQnOT9aad7Ae2FE3iaNR
         QgKZRTuZ1gdTv7BwKQL75N6cC+U9PNsChHPT0Jv72AWBjJcp2m0mCYDfHVh3y0YeAHva
         MZNI6layG1nBSDKb2lzFeM9r5gvotzjx7qOcDK1GfcJubj0gtiFGP0YpmZrgKoNQsPKO
         njDWgEHSXgogO/icaemsD+syd8+P429i70W/uPjPPKhbKAsk31TICGPWVvwTCSmA3dah
         c4RJLVW4XgO81eHlRPXDVantN0vhKbj/angA3sgx5f0wD54izS7qCzzx+lDXtZuSCqzV
         eQjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769450069; x=1770054869; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BaBaPbjRvnSlT5xuKPMaHPCMLrVAT3axwn7YGYLPHX8=;
        b=lg/ffZG+zUjsizpMjdlwogCsqyXn/bF71GhDTQUAQaaanewqTpzgfvI+u7M8wYyF19
         56diww2G9/8NSF8jmJ3Y/z9j6ZiV9+iZnHFSPelm3pPX3AHKX3o2z2hlskZe+oRcy0GC
         kehHEZ8kEeTLO5ZD/l62Z1bWrf0fHQEwrQWBDg7ipmXlQaH0i+m6n6neCEemc7ZRgP89
         WL6jqlZXYEqfxQYDri75PEEHngwfZxEkh1QKZ+PsDzC9aFrwO/YOgHxzhQqDmqLKDv4U
         QW78kYVPfGctI1PzBA7Bs1VnFOFOfRK3tOxZCPuQNPWlqAFsD37BP7ZHCWukXT4uuN26
         Fkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450069; x=1770054869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaBaPbjRvnSlT5xuKPMaHPCMLrVAT3axwn7YGYLPHX8=;
        b=KaakEA5hB1wFBTe9H4wQRmCwu6sxW5kCTLJlxyXu2ntyucst3Dq+BFMqmwzFHAzz+k
         SEuq4q97rZPlGlYS2SOw9oSWZkofX9zbJuA1hffmGTucVy3Gif8UPEQJQVBeSY5032r0
         ge4Wl859VfoTb3Vv2qVE0su/4klDfVfjMDhmuSEbo9HdAD6t3GeZvD83hh6Iy2aECPmk
         /zqsrsk9WnPjmt+BHQbrJM6Uu0WwjXEKYchHQ69jj8YCBjHTgRi1RR1roN5Zr5mbjp7B
         G974sWcTAibHZdfGlM12dmmhQSNc+t7P0X1oeqSJWlRtwa6kkX8PNzZ81nluAUZcdjN+
         8etg==
X-Forwarded-Encrypted: i=1; AJvYcCVy/Xeat4FB8iIPeAFO3tTpufuJNEU0U2Oo8dEQMaKPSp2sOEX6Nuw9yZ7YqKt/pPE7dgEJ8UlGhiF0Y7FD0ssH@lists.infradead.org
X-Gm-Message-State: AOJu0YwIdQEJbfvDUBiC+Cm7nvbBQjQVsigetYwLNavQ2PHakvn5u5aY
	5ruEZr4onktlLiQ3v+3gpxMAuw7fYZq3bjaymaeg4rqSdHge1N71I/4THPVTtDYmKehfamGGWp0
	FuYgW4axRD57eoNS9ffhMYa2kH9FEHcD8Ss+iSUYk
X-Gm-Gg: AZuq6aJNkp4rbb+sYq/yUgYIrjk9+T+e8TmnFkFAjWzFVeEUOlDHRGGZByRxsDZGgd2
	1gHVT5AO40VdT56fPIr8+Pk0O0yYTDpMQlacHyvGGLIEoJ8XBU4sdfzJOYWrr1jAzf6vpa2SUzH
	O1HMzsG7qJ2vOoyAv0vsWPhZ/5Abms/kS1SG0v/VbGt1fGBp/6iqBFVWJsOSu22It2lDjMgUm8w
	VEQRod/UJ7yP+SuOLYJw7aUzuO5H/jaPNxsoaRRNSTGmsGK8tYcgSMuWVnuhcJH+Cr7mwMD
X-Received: by 2002:a05:622a:344:b0:501:4539:c81 with SMTP id
 d75a77b69052e-503142cc1d6mr14568201cf.2.1769450069071; Mon, 26 Jan 2026
 09:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-2-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 26 Jan 2026 17:53:52 +0000
X-Gm-Features: AZwV_QgKcivEy-Bh-scWxupdI_fJg4uVKAjUzJrjPt4iiSwWyjT8Fk2XVUt0Fj0
Message-ID: <CA+EHjTzToNnEV6Ow0WaVwpYwE3RBfLfvuzvDcnOjSmGB028vvQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] arm64: Convert SCTLR_EL2 to sysreg infrastructure
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_095431_801585_5F18AF7E 
X-CRM114-Status: GOOD (  17.30  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Convert SCTLR_EL2 to the sysreg infrastructure, as per the 2025-12_rel
> revision of the Registers.json file.
>
> Note that we slightly deviate from the above, as we stick to the ARM
> ARM M.a definition of SCTLR_EL2[9], which is RES0, in order to avoid
> dragging the POE2 definitions...
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Other than the deliberate deviation for bit 9, it matches the spec.

Of course, this changes the semantics of SCTLR_EL2_RES1, since now
it's 0. But I see you handle the consequences of this change later on.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/include/asm/sysreg.h       |  7 ---
>  arch/arm64/tools/sysreg               | 69 +++++++++++++++++++++++++++
>  tools/arch/arm64/include/asm/sysreg.h |  6 ---
>  3 files changed, 69 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 939f9c5bbae67..30f0409b1c802 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -504,7 +504,6 @@
>  #define SYS_VPIDR_EL2                  sys_reg(3, 4, 0, 0, 0)
>  #define SYS_VMPIDR_EL2                 sys_reg(3, 4, 0, 0, 5)
>
> -#define SYS_SCTLR_EL2                  sys_reg(3, 4, 1, 0, 0)
>  #define SYS_ACTLR_EL2                  sys_reg(3, 4, 1, 0, 1)
>  #define SYS_SCTLR2_EL2                 sys_reg(3, 4, 1, 0, 3)
>  #define SYS_HCR_EL2                    sys_reg(3, 4, 1, 1, 0)
> @@ -837,12 +836,6 @@
>  #define SCTLR_ELx_A     (BIT(1))
>  #define SCTLR_ELx_M     (BIT(0))
>
> -/* SCTLR_EL2 specific flags. */
> -#define SCTLR_EL2_RES1 ((BIT(4))  | (BIT(5))  | (BIT(11)) | (BIT(16)) | \
> -                        (BIT(18)) | (BIT(22)) | (BIT(23)) | (BIT(28)) | \
> -                        (BIT(29)))
> -
> -#define SCTLR_EL2_BT   (BIT(36))
>  #ifdef CONFIG_CPU_BIG_ENDIAN
>  #define ENDIAN_SET_EL2         SCTLR_ELx_EE
>  #else
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index a0f6249bd4f98..969a75615d612 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3749,6 +3749,75 @@ UnsignedEnum     2:0     F8S1
>  EndEnum
>  EndSysreg
>
> +Sysreg SCTLR_EL2       3       4       1       0       0
> +Field  63      TIDCP
> +Field  62      SPINTMASK
> +Field  61      NMI
> +Field  60      EnTP2
> +Field  59      TCSO
> +Field  58      TCSO0
> +Field  57      EPAN
> +Field  56      EnALS
> +Field  55      EnAS0
> +Field  54      EnASR
> +Res0   53:50
> +Field  49:46   TWEDEL
> +Field  45      TWEDEn
> +Field  44      DSSBS
> +Field  43      ATA
> +Field  42      ATA0
> +Enum   41:40   TCF
> +       0b00    NONE
> +       0b01    SYNC
> +       0b10    ASYNC
> +       0b11    ASYMM
> +EndEnum
> +Enum   39:38   TCF0
> +       0b00    NONE
> +       0b01    SYNC
> +       0b10    ASYNC
> +       0b11    ASYMM
> +EndEnum
> +Field  37      ITFSB
> +Field  36      BT
> +Field  35      BT0
> +Field  34      EnFPM
> +Field  33      MSCEn
> +Field  32      CMOW
> +Field  31      EnIA
> +Field  30      EnIB
> +Field  29      LSMAOE
> +Field  28      nTLSMD
> +Field  27      EnDA
> +Field  26      UCI
> +Field  25      EE
> +Field  24      E0E
> +Field  23      SPAN
> +Field  22      EIS
> +Field  21      IESB
> +Field  20      TSCXT
> +Field  19      WXN
> +Field  18      nTWE
> +Res0   17
> +Field  16      nTWI
> +Field  15      UCT
> +Field  14      DZE
> +Field  13      EnDB
> +Field  12      I
> +Field  11      EOS
> +Field  10      EnRCTX
> +Res0   9
> +Field  8       SED
> +Field  7       ITD
> +Field  6       nAA
> +Field  5       CP15BEN
> +Field  4       SA0
> +Field  3       SA
> +Field  2       C
> +Field  1       A
> +Field  0       M
> +EndSysreg
> +
>  Sysreg HCR_EL2         3       4       1       1       0
>  Field  63:60   TWEDEL
>  Field  59      TWEDEn
> diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
> index 178b7322bf049..f75efe98e9df3 100644
> --- a/tools/arch/arm64/include/asm/sysreg.h
> +++ b/tools/arch/arm64/include/asm/sysreg.h
> @@ -847,12 +847,6 @@
>  #define SCTLR_ELx_A     (BIT(1))
>  #define SCTLR_ELx_M     (BIT(0))
>
> -/* SCTLR_EL2 specific flags. */
> -#define SCTLR_EL2_RES1 ((BIT(4))  | (BIT(5))  | (BIT(11)) | (BIT(16)) | \
> -                        (BIT(18)) | (BIT(22)) | (BIT(23)) | (BIT(28)) | \
> -                        (BIT(29)))
> -
> -#define SCTLR_EL2_BT   (BIT(36))
>  #ifdef CONFIG_CPU_BIG_ENDIAN
>  #define ENDIAN_SET_EL2         SCTLR_ELx_EE
>  #else
> --
> 2.47.3
>

