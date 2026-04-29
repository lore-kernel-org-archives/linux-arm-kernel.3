Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C5FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbYrI48O/qFq1V/EIUwyOIOMF/g5HUVz8lJN5AfFujw=; b=sKSlxPB38eOl4rUuj2/17jLTSL
	83gKaVHXSNjcOT7JpbRcoOK0SEv/aqbFoONOJ8SZDigInq9GaRZtyLpPPK94dOViww/OXDeqmnqoj
	I2d+8WoaFbv+mcKocv7AVZFRSR8/wFxBmtdQR43vFMZlUd+cZHk77jKzQhrAlKfiI4VkvWUdLpdno
	mUEc27W2pWRJIKUv4akiWSWdcobHtw2cQmpQfSWx6CHJa+fV7dmymofGHZspq1rBPwXbOOZ8MgeiD
	S3pjPnh0NJv2wnMETJeI0WSf/PhzFlkGqZpn6RcCHTfp8i2MUvAguYmySHije2yHYvTCdabB8mCEw
	iW3F9PvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzuG-00000003DFt-1hNC;
	Wed, 29 Apr 2026 08:04:28 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHztQ-00000003DA2-0R7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:04:26 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38e935bd6e5so15137431fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 01:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777449813; cv=none;
        d=google.com; s=arc-20240605;
        b=bobELgMR/b4dVtKGRkltmYO3w78K0Y16h7OIRTO0G3kvziUGu0eYyZ5VowbVMQekbN
         zOGNtovp5xkiED2bnsKJRuyaFfUK050XpmD/cvDa+7hJIIhIZ1dBRp+FP/FGDvwXEW8T
         cBrMmf5x1a6j/bFBUOTeni5/UmIQMaB5SH54siNh01pseaa04sDYfjaX6KxPjAcWCyKa
         clRTHjIuSULeRXlzr7O6C4GyLW4UPN78Qt1vD/SLWrPRkt9CkGrHGBOzfaWNM6/pRRhr
         eIJOg9XsOhSOcY+NNElVnp9sRzxAHZMUB98GzR15GI1Fc0DKsURr3ejZMDrF6m+/ABoU
         mU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbYrI48O/qFq1V/EIUwyOIOMF/g5HUVz8lJN5AfFujw=;
        fh=opKlpYp1euvhzEyXRk9pHRCsGW2feYa/QG1Fvep1pkY=;
        b=QltTveNjjTvjvzixPNEXLPX5Tvexa/md2baxRehsHOu7UAcCpr2a13JCPrbv5DUHMZ
         8+sljnSmftEiTOYi9ZSb+gmJ9jOA3SWAn3qLdjQMlXg7JDi/qQS1GDPOcTq5gmGXbktb
         Y4HJkSDbQ0oXW7owKDfjMK6Ryd/Tlnhbsi/T4QpY4oJi/0BUGc7PhyMhm1ckmZnet/X+
         vAcE7Cd4bsEFnlLCvXKnbjHybsvx1Yil8TPEg0NTzr4sRf4RTeTkpCOKqXDMC4oEnQyq
         XsuyAbiDVlHmzm+7La51GO4kJOEIckqy17uTr06Ri4gTCFzXORhBKZEporu006IX6YUt
         VpVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777449813; x=1778054613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbYrI48O/qFq1V/EIUwyOIOMF/g5HUVz8lJN5AfFujw=;
        b=E5XdbzBbw4LCfqM1KpKeNU/gIixnB0tZF+11zANuzehq7/FtcckdLTDJNWXSCAodhh
         k9oFgOkH6Or8/O2CtN2ev6hy0J1wKKTh4TNERxfYtIOEwy8QO+r0xtxL8bQGFZz/zFJZ
         kupsvUfWHHJOOUhikNrMQrc9TeOy2K/7AzoPvM9OR07aiahK1zX5O2ktfFH0pGEeCyVe
         u0QpD4g5Ru8hwFhXHtGe76YZAfFyu4S7GdUFXwc4EZZrYCvqWbxhTCysSB6obpOJfROk
         7z9FopS6Uvtz7+RVrjjt1iiIKfCExR6/XX+xJr2/5uAAS6G7deMCPb1Wi7fpR6xmFpjJ
         k2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449813; x=1778054613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbYrI48O/qFq1V/EIUwyOIOMF/g5HUVz8lJN5AfFujw=;
        b=V3h4UgoOl5dZ1QfU2CrJgvTEOYAyfGqur7S/Fpzg867PiJGnMsFNByvihCSJWUiu1R
         wBJzm2agK6DaMfppQeabElXCQEVRB79JcFq1Lc2nu9CGPDDv6oyrBbublczkLAxGiqcj
         XWgsUIVgPfAuNvWuioPX+DN/P7MeAqAsFyzQ817n5IbphvefAYegG/Lbzoo3OcWCGIir
         ltbsXlZXuupxXMtfy4g4OHJcBIpe9s4OEtrx97awxQNVOjeEVQgGLHG0+rOLjV5q68nv
         rNmoVqly6hkSYNRBhbuheYHqE6fLKsUTQyaHQodT6AzNk6QNSLj5aDsEBNPIxsX26rMZ
         IT8g==
X-Forwarded-Encrypted: i=1; AFNElJ80tyxUFR9ecA7DRU07xJ1kK6vsarZsIAnQZsmAlpaordLZ6wdsTgG/Kx+oF2tTHRu6fdRYRh0kIUzKPZkYzHAF@lists.infradead.org
X-Gm-Message-State: AOJu0YxvGLQv326Epaoh1KOxswrRVLrHC4y9SEmMd4rFvC4N2S9Qr8zF
	lspf/viaaRFIOSUF8eFeKppAe3g0vomT5mhxCVKNu79SkRw7hAs3b3IDaWj6R0mfQMPAEVvnVNM
	Jc+/24tZTfPw2APuOANdDtM5hDlMOjaQ=
X-Gm-Gg: AeBDies+lW1I9q8wcnmIa4cL9P3xV4jGIiTTG0OqYLJl529z054WmdSPDkmylQcapVA
	aJLUXO7e/P/hCqJ32hq+M/wz5t+NCzG6QJ446Fe65aQ1Rx2psUjZIjh+frrPYzxjK1PAqGPNZEl
	3ZHy7X+DkGe9Uyo8xdjj+y/VrWtRAVY8ZpcRDXBWg3tau92ufBkDv6XR/ABCZiUxfeDbwlb/Elw
	f7OPN5B6C+qPRpzMQ0LMpBQvvT+H5kC68BTm9yO5cKs8UjoedSQ8PgTrAMPfjisCv28SSQ9t7vG
	zv+NqwIOFFh3p4tRbS8=
X-Received: by 2002:a2e:b88d:0:b0:38e:83df:54e2 with SMTP id
 38308e7fff4ca-3923eb42010mr10993861fa.0.1777449811143; Wed, 29 Apr 2026
 01:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
In-Reply-To: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 29 Apr 2026 16:03:18 +0800
X-Gm-Features: AVHnY4ICRzO-bBPtB7_U09W9m3m1BKxCiKO13xVzbr3knzpNjbxmMKHHFaX92fw
Message-ID: <CAGWkznE8r6_XqY2g5VwzJ-DrmjhHEMczWbso0HdxjR1ZJG4t0A@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: fix KERNEL_SEGMENT_COUNT error
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com, shuo.tian@unisoc.com, 
	haiyan.liu@unisoc.com, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_010336_180868_315E2ECE 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, Apr 29, 2026 at 2:19=E2=80=AFPM zhaoyang.huang
<zhaoyang.huang@unisoc.com> wrote:
>
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> During debug of a kernel panic, we find that the pte_t of the final
> part of [data, end] segment got overflow to the next page of
> init_pg_end[1] which is the gap page before early_init_stack[2].
> This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
> which should be 6 as map_segment are called 6 times for the segments
> of (text, stext, rodata, inittext, initdata, data+bss)
>
> [1]
> crash_arm64_v9.0.1> vtop ffffffed00601000
> VIRTUAL           PHYSICAL
> ffffffed00601000  83401000
>
> PAGE DIRECTORY: ffffffecffd62000
>    PGD: ffffffecffd62da0 =3D> 10000000833fb003
>    PMD: ffffff80033fb018 =3D> 10000000833fe003
>    PTE: ffffff80033fe008 =3D> 68000083401f03
>   PAGE: 83401000
>
>      PTE        PHYSICAL  FLAGS
> 68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)
>
>       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> fffffffec00d0040 83401000                0        0  1 4000 reserved
>
> [2]
> ffffffed002c8000 (r) __pi__data
> ffffffed0054e000 (d) __pi___bss_start
> ffffffed005f5000 (b) __pi_init_pg_dir
> ffffffed005fe000 (b) __pi_init_pg_end
> ffffffed005ff000 (B) early_init_stack
> ffffffed00608000 (b) __pi__end
>
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include=
/asm/kernel-pgtable.h
> index 74a4f738c5f5..14dd1c52552a 100644
> --- a/arch/arm64/include/asm/kernel-pgtable.h
> +++ b/arch/arm64/include/asm/kernel-pgtable.h
> @@ -64,8 +64,8 @@
>  #define INIT_IDMAP_FDT_PAGES   (EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS, 0=
UL, UL(MAX_FDT_SIZE), 1) - 1)
>  #define INIT_IDMAP_FDT_SIZE    ((INIT_IDMAP_FDT_PAGES + EARLY_IDMAP_EXTR=
A_FDT_PAGES) * PAGE_SIZE)
>
> -/* The number of segments in the kernel image (text, rodata, inittext, i=
nitdata, data+bss) */
> -#define KERNEL_SEGMENT_COUNT   5
> +/* The number of segments in the kernel image (text, stext, rodata, init=
text, initdata, data+bss) */
> +#define KERNEL_SEGMENT_COUNT   6
>
>  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
>  #define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
I just noticed that the page just behind init_pg_end which I called as
guard page is designed as early_init_stack in vmlinux.lds.s. That
could explain why I find the strings of aliases within
idreg-override.c present in this page.

ffffffed005fe000 (b) __pi_init_pg_end
...
ffffffed005fec50:  77735f34366d7261 726c3d656876682e   arm64_sw.hvhe=3Dlr
ffffffed005fec60:  00003d633d723d3d 0000000000000000   =3D=3Dr=3Dc=3D......=
....
...
ffffffed005ff000 (B) early_init_stack

