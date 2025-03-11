Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1C5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTuA7YSQf6BTENhRE44x2ahXNAujiJZaMhILjLcujAA=; b=Im3W0lNsgz3+SJEnNX/8I3VSr9
	Rv9ymWbF8pYDwUYrdBMiMJIItlkG1vjiH/k/qN3VqFPYD3phRf1pJfLhaZJET4KU1U0wFAl5KoWsa
	pjgf83dNXoQGwOmLmf78h+PLKRac68ykgjxZQ7VnEpKNJ6SNk8juCJZ5wH2tzFtLXtbwXuA6snrgd
	YPXBGZY4kZN+YHib0cTfHVSbWqGNcji6x6Q82GJ4e3d42imPrerJ+MeUrEABtYi0CT5OTXpJNQ8cl
	CvT7Fru2RHWtQwJVsOLT//oDCsPgxNBTGDFnmXSQlsaOIQsbdDPkLnjilyctvjNmtOapvsnQPaiLf
	/IOYZAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1IN-000000065vG-09Ty;
	Tue, 11 Mar 2025 15:13:27 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Gi-000000065hv-12iB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:11:45 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso5038604241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741705903; x=1742310703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTuA7YSQf6BTENhRE44x2ahXNAujiJZaMhILjLcujAA=;
        b=Q5SZXcfHhrCMlHXERbeyJvbfcHi5Yo1d/ZxTN+uK4Yr3xt5B2phZZxOjzJSu34g5GY
         xXD4ewnGYnUY5J0ZQji+n4a2ZtLMhLCppxPapHMx5d6lAtzwPq9HviYlybC3ogqpWmD6
         5svhkwL+bMbggfOatSdWFd2JuaggdwFESZuR1JDMuOc351+L36LhwmXZdsX0Put2I99t
         UnK9q44Gp+CT0SRSgnE5UwDUF1Dhh6q+8UnXrWi4QUXF5UFNRPXdkmWqztsaCkBq3wWK
         WwD5KUr1e1Ang2A8jzpuWSRDv1YvlcsYbjkVhIZIAj4yY1DmKEtMSZ5vl95am/eAZCtP
         gsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705903; x=1742310703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTuA7YSQf6BTENhRE44x2ahXNAujiJZaMhILjLcujAA=;
        b=nTdp+FCLzz79b6pyzk8mPFg6IPsMVA+0zwhfeUPXZpBGdV7xzZHXg00/gq/GgBwTuN
         BbKKB1O17qyaRTUAMim5bw1CsYUHUxWROliq8UxDEvaYhcTFiO0sukyx13ZBzBGG+6cY
         J9uoZEhfTdotG4BtCEhZiFJ59/NEghdjWt8iu28jQSSi3uvVPBlagNZsrO/eTvpeqYE5
         ScuxiNrDpjf4O4UamZ4b1SY1FaxuhDNLW90nRoAJgu5u2ixka8leIiwkZP5OeYOkG5bK
         v8nuHJc720hZw2Na3TF/JYq6C59p36JMUSDLB+RVW6pMiiJBWJTSf32nNJlrV14nT2Md
         KpKA==
X-Forwarded-Encrypted: i=1; AJvYcCUmDXT/BEK6+FK9dI2/WPTBkzcWZJprjhjckY/zKMBY8gwEhj9WguC3kXWDItY/8+NIbd1q3GLot7q+MAQpXiVr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz234LIJr2c78u25FKgtUwHTZTlZzSg5DNlLEIrouCNzuo3jINs
	Qdl8ZIW/nKG0fZKULk84uprzptXbpHgenYjoKZDb6XGhwVhroU6CMl/1zDXgHPLnz0L9q5uKkHe
	Tf0okezPJ0Vh7ZQu6zwoKYjxXxfg=
X-Gm-Gg: ASbGncvDeCJBbF+cjPw9b3qO6968aEDkn57nMhQOAAo8/lxe8EQuC7QJfLTeUXbW/j6
	26TdE5oTkCL1OVBegsC6YlynnPvPEGxKWEKi5nwZ7hmu8nvyCxQ3rHBhnt3EsC0Srg0ld6bKeNW
	/UdmPw4uItW9i1cD8hYRu8Ilw83Q==
X-Google-Smtp-Source: AGHT+IGrRBAfEL4AxUiuseuyI92pGLRtD/JII/C+DL6HvPbEkqygZtUt+JWnvwrEiMJgIWvk5rmcyl+90xCH5yInaRw=
X-Received: by 2002:a05:6102:5793:b0:4bb:e14a:9451 with SMTP id
 ada2fe7eead31-4c34d31add4mr3130230137.20.1741705902795; Tue, 11 Mar 2025
 08:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
In-Reply-To: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 15:11:16 +0000
X-Gm-Features: AQ5f1Jpx2fGdbJPdj5FDcS5GoLqqOGLJlYzfmSg2SJ8trxO8w9qoL6dJAOW-mek
Message-ID: <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <nico@fluxnic.net>, Simon Horman <horms+renesas@verge.net.au>, 
	Kees Cook <kees@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_081144_286303_AE53200B 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Geert,

Thank you for the patch.

On Mon, Mar 10, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
> shmobile_smp_arg variables are not multiples of 4 bytes, secondary CPU
> bring-up fails:
>
>     smp: Bringing up secondary CPUs ...
>     CPU1: failed to come online
>     CPU2: failed to come online
>     CPU3: failed to come online
>     smp: Brought up 1 node, 1 CPU
>
> Fix this by adding the missing alignment directive.
>
> Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn, ar=
g}[] from .text to .bss")
I wonder if this fixes tag should go back a bit far as I was able to
reproduce this on 5.10-cip BSP kernel on RZ/G1E this was only seen
when CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE was enabled,

RZ/G1E failure logs:
--------------------------
[    0.006719] smp: Bringing up secondary CPUs ...
[    1.040749] CPU1: failed to come online
[    1.041014] smp: Brought up 1 node, 1 CPU
[    1.041038] SMP: Total of 1 processors activated (65.00 BogoMIPS).
[    1.041063] CPU: All CPU(s) started in SVC mode.
[    1.041904] devtmpfs: initialized
[    1.050811] VFP support v0.3: implementor 41 architecture 2 part 30
variant 7 rev 5
[    1.051143] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.051197] futex hash table entries: 512 (order: 3, 32768 bytes, linear=
)
[    1.060510] pinctrl core: initialized pinctrl subsystem
[    1.063139] NET: Registered protocol family 16

$ grep shmobile_smp_ System.map-notworking
c021caa0 t shmobile_smp_apmu_cpu_kill
c021cb20 t shmobile_smp_apmu_enter_suspend
c021cb54 t shmobile_smp_apmu_boot_secondary
c021cbc0 t shmobile_smp_apmu_cpu_shutdown
c021cc18 t shmobile_smp_apmu_do_suspend
c021cc60 t shmobile_smp_apmu_cpu_die
c021cc84 T shmobile_smp_hook
c021ccd8 T shmobile_smp_cpu_can_disable
c021d050 t shmobile_smp_continue_gen2
c021d0c4 T shmobile_smp_boot
c021d0e4 t shmobile_smp_boot_find_mpidr
c021d0fc t shmobile_smp_boot_next
c021d10c t shmobile_smp_boot_found
c021d114 T shmobile_smp_sleep
c021d380 T shmobile_smp_scu_cpu_die
c021d3b4 T shmobile_smp_scu_cpu_kill
c120a87c t shmobile_smp_apmu_prepare_cpus_dt
c120aab8 T shmobile_smp_apmu_suspend_init
c120aad0 T shmobile_smp_init_fallback_ops
c120b0f0 T shmobile_smp_scu_prepare_cpus
c1262778 t __cpu_method_of_table_shmobile_smp_apmu
c154d5fd B shmobile_smp_mpidr
c154d61d B shmobile_smp_fn
c154d63d B shmobile_smp_arg


> Closes: https://lore.kernel.org/r/CAMuHMdU=3DQR-JLgEHKWpsr6SbaZRc-Hz9r91J=
fpP8c3n2G-OjqA@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-fixes-for-v6.14.
> ---
>  arch/arm/mach-shmobile/headsmp.S | 1 +
>  1 file changed, 1 insertion(+)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/mach-shmobile/headsmp.S b/arch/arm/mach-shmobile/he=
adsmp.S
> index a956b489b6ea12ca..2bc7e73a8582d2b3 100644
> --- a/arch/arm/mach-shmobile/headsmp.S
> +++ b/arch/arm/mach-shmobile/headsmp.S
> @@ -136,6 +136,7 @@ ENDPROC(shmobile_smp_sleep)
>         .long   shmobile_smp_arg - 1b
>
>         .bss
> +       .align  2
>         .globl  shmobile_smp_mpidr
>  shmobile_smp_mpidr:
>         .space  NR_CPUS * 4
> --
> 2.43.0
>
>

