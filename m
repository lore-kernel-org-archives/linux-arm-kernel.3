Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2596C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=; b=FgD7dHbS3UD3vlDDlU7ZUs55EC
	ZxhEQ46D6MCkKncxR4ns1BCzV5e/Xcy6G+P9L8ve4XgJ+PmGfMTa1kETPss22s422i8cOrMTK6/g3
	G0pb2kUDfN/ObvmIKLLCS8MC0T5OZbMguNMXk07OElIIxGOJd4YamGql5EweJpW1IfQZ5uMFqTU0b
	L+GDuixvnyoRB6HcY21dc685YIHFG/mPFmXAhF7UHSvNJ2Wva2KSuZ9p21X/C7gDvfIGdgnC7j0s5
	/ZTvzKEAlqydgsJ4gb70SiFneKNsZ7Y9hilE/IvJsfll9rQ3zqCbcjTdk8guG96xdQDRl2LpanCh9
	2aj8hoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5IG-0000000HV3i-1nut;
	Mon, 28 Sep 2026 06:56:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5ID-0000000HV36-0don
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:56:54 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b8c42da963so8991e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790578611; cv=none;
        d=google.com; s=arc-20260327;
        b=r50r37FdsCBRLWGNbwaqME8yX27rJNzwPidQmZIkuH2w6wouVOlSRmxjVfhpS1A3wV
         Q6Ej2C/GI2Imu+FxYllp5tCLi8botBwf5NGVzzQSQi6lYr6ozsXN+2FAMsWuhqkrsx5m
         75Bihk6R1bjB+xpmjM7J0MCsz0+PQSLOvvfDH5gP8cZDUW+vHXbHW+vJKDFWyw4oUZDL
         GUSPbws/unXLKKevShofIRdhHpcQKorg+x//uhU34HuGJf5p+thr4g3T7+9nwJQdH0j6
         PmyxsI/E2zBq7Ge2tYw0uCZZM4zS4XSYpJX9qrzkoniMXQ4YMzK6+lK71k46AFPsI6Pw
         rp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        fh=ycnpnbTenKZg59XWKeWcYftyCCb9R51ABQQyqtfuVtc=;
        b=sjxJoPUayI3y41iaQmoQhDycKe99VPF75tTGiE1NXcK2Wayl+5RitFhhIlD3R71eG/
         ORXcl1b4UmH+ieZ0Dtquvjs0aZBFk3VyH7JMWMPRbvCbm6bnPVsg9DuOwX2DkRs4v+3q
         58T5JjNGFA9Kpbm/eFI5HcjX4T1+1uq5QfLqk692VwaOgjBUSNbXLMFQwPYKNk0QqMWL
         eOOHSVXYclxM3WBs3XphXP5hmbX1BmQok34lcsaGuBIEgFAm7l0Tg9cx891FtbPJ+383
         qnSmivpGieCGytlKIEm6Imc5KqfT1QTOttBLZynAIGqZLh1x64ye97BQokcY3FpySt+3
         GxmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790578611; x=1791183411; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        b=IwQStIwDxf/DGnEgA+9rlzy+Z8+lZvrsVMJKx84y2nsxfB4X8mkduWBkL74oAGQv9k
         GOFihucuby/okNrEfO0ozc6HQsdMS9NBz284TFRXn8H1GjrvMjlXcbw0qtqeNAzeNAyd
         m1RMCTVjlPi7QiGjnu/V3a9kw/dJ9UPKNlpyfItcnM3GVkQ0IrmrbSAdREKjh/fH9WQ6
         HHMSGJpPitlM25a+MVHrmnR7Fw+/kIX1x5C/Fyie4MimKI186Fioe+rrrBze81+zf2Ax
         gWZ3PV/ziJ2nsvMY8Dw5Ya9HQMgIOAJHHqHviKoWYTu3sF4m11MOTfJcd0RqzNuCFY0N
         86fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578611; x=1791183411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        b=FTpmHoh6by5pjx1N/qw6mEirf5ODd4FqUbuKeDu09E1t56jJagVVJTgddudTchqYBk
         6zQa4SAcVbW4jKgLAgpamSOVRocyjfK+V9G1fS5sGXV2a4fBVBQtyKLaBr4yt9d3gfUZ
         fwcRemYQ0jJivGbRJ7cyCRr0Uy80DlPMNp7QfA289k+6LLghdt965+GgNyb1EpI2XGZs
         AjmvP1wAr5G77T6Hsbp2jVobdeL6z3N1nAD0IpOTmhGma13N9ZpnJc8qUMtF3wU6/MeB
         QiLnKnI8dpOueYQK2KwkGVDrhrngSEr9BleP8AiqJIuJOJ/MC4M47gDuCj5zdjbs+Cqs
         HR1A==
X-Forwarded-Encrypted: i=1; AKwUvBxcMJZTOC7r2+QYzI4TgtS0ZKcutS1fm/L/qsDPSlsswstpjrT8aN0f3UI5RsFu9lQmpctBBpEvqi8GORef2IKB@lists.infradead.org
X-Gm-Message-State: AFq9FYKZOW2C55l8FnLgTc+xh/uxqXu7eP0xvoItFLhJzKGD7mw381Bj
	aDIl4cRnuO17+4R6tG5rKajCHKleCMGR5SNCZefGTJ945VPRcgHdxW1UOXlq6ZwgCo/tgu53MHL
	GsNNC4Zvv40D/+GNsgYMHO10GuB6VmTXvXnhiFWV4
X-Gm-Gg: AYBFou2SJgehVtlwSCPBfu22gI3avrQ0A57vPMl6gZXEvhvz+fN5YDeNgYomLc4mA4v
	JMvbGFj4QdA0OJ7JhxRbPiomM3Zf5vH1pP7YaXBO5+OQc4vmPUUnh5afa7ctZtVp7OMF9m0kka7
	ijFVj4lQW9CXlNdJ4H+xKZe14xfh/ZQ6B9wLGJtEfnKt/EvWnlFQPhBYbYe3ThyOCYb7I34WeDY
	CWgXl2u0vxsTRldT7Ad5Ml3CKQCBaXq7zKhUzdk5ozhT7crZfIlOBkH4DMjXTl2w87g4jUGIOSd
	FAWPXH6wmQInazhEfmEp5ECXHes4ePrtxLkwwTZ4vx+Ir91dOJBgTdGID6rn7UuLb41VYtghhk9
	/l6I+kxaZuUbEyP4X9LyPwlk=
X-Received: by 2002:a05:6512:3d8e:b0:5b8:c8f2:16c4 with SMTP id
 2adb3069b0e04-5b8ef255fa0mr155202e87.10.1790578610464; Sun, 27 Sep 2026
 23:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:56:14 +0100
X-Gm-Features: AclHuK9Nt0wxmbd5-RZTKhrKH6f7Mij28E53-dg3AuD8R3c5qE6gQbIJDKPoGaw
Message-ID: <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Marc Zyngier <maz@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_235653_229252_7D4CDDF4 
X-CRM114-Status: GOOD (  31.97  )
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

Hi Catalin, Will,

On Tue, 8 Sept 2026 at 15:56, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> MPAMSM_EL1, so what one guest writes reaches the next guest and the
> host. Nor can the kernel make the EL2 writes unconditionally: they trap
> to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> read below EL3.
>
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.

Gentle ping on this one; it has Ben's and Bradley's R-b. I think it
still stands regardless of the other cpufeature work going on now.
Anything else needed for it to go in?

Cheers,
/fuad

>
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>
> Notes:
>     Changes since v2:
>      - Add MPAMSM_EL1 to the registers a guest can reach (Ben).
>      - Carry Bradley's Reviewed-by, dropped at v2 and reaffirmed there.
>
>     v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
>     v2: https://lore.kernel.org/all/20260904103131.627392-1-fuad.tabba@linux.dev/
>
>  .../admin-guide/kernel-parameters.txt         |  3 ++-
>  Documentation/arch/arm64/mpam.rst             | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..e6d543de3cde5 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -575,7 +575,8 @@ Kernel parameters
>                         Set instructions support
>
>         arm64.nompam    [ARM64] Unconditionally disable Memory Partitioning And
> -                       Monitoring support
> +                       Monitoring support. Only for a machine that does not
> +                       boot without it. See Documentation/arch/arm64/mpam.rst
>
>         arm64.nomte     [ARM64] Unconditionally disable Memory Tagging Extension
>                         support
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 67fe515ed501c..e445f4078ee1a 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -87,6 +87,32 @@ The supported features are:
>    MBWU monitors can be exposed to the user after support for more monitoring
>    scopes is added to resctrl.
>
> +Command line parameters
> +=======================
> +
> +arm64.nompam
> +------------
> +Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
> +it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
> +CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
> +the MPAM system registers from the lower exception levels to EL3.
> +Firmware must clear it, or handle the trap and emulate MPAM as disabled.
> +Where it does neither, the CPUs still advertise MPAM in the ID registers,
> +the kernel's MPAM register accesses trap to EL3, and the boot fails.
> +``arm64.nompam`` exists for that firmware: it makes the kernel treat the
> +CPUs as not implementing MPAM, so no MPAM system register is accessed.
> +Set it only on a machine that does not boot without it.
> +
> +It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
> +the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
> +unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
> +guests but no longer enables the traps that stop a guest from using it,
> +so a guest may be able to read and write MPAM0_EL1, MPAM1_EL1 and
> +MPAMSM_EL1. KVM does not save or restore them, so what one guest writes
> +is still there when the next guest runs on that CPU, and when the host
> +does. With MPAMEN set, EL0 and EL1 requests then carry that PARTID and
> +PMG.
> +
>  Reporting Bugs
>  ==============
>  If you are not seeing the counters or controls you expect please share the
> --
> 2.39.5
>

