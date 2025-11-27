Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5795FD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8C/8vYpZ3lt1x50MRO8vehvZVw1jN1RA/JwkPqP+uE=; b=GR/uPNap7RX1FdK7DVKQPLbQv0
	DB9TpfQcicJJBYoaew/HLiCXIdTCVbTI1kTWB7mkkpVLoopkhwUyG2E7iLyEmi7NL9sY7Mup/SAM3
	krDrXrQCwLMaMcwnwpM2gaY7aIsPAjqQa6DNZbDgjVd/LzHeYRimgKRR6V40uLKX4qYSeHLJL6z1s
	+MIS9+FOONFXLLiVbChnrIDsDvpO5j3umq2cyE87uLP9LWpJlgt7NhELqh+t+WAFCTU8kdICYrIDi
	YyXcbPggCRl78B+ZhqhZ2ejJWmBCgBgQoUwAl52qIOXmlLS0OOfIMKIEzlFt2ovnuYydY8FO6618b
	2fiqriTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ0q-0000000GM9o-1w6r;
	Thu, 27 Nov 2025 10:14:08 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ0n-0000000GM8r-1SJ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:14:07 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-656d9230cf2so353782eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764238444; x=1764843244; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8C/8vYpZ3lt1x50MRO8vehvZVw1jN1RA/JwkPqP+uE=;
        b=kuLHn0clhVDfSFBl06KWglabY8vWj1buSPGQXjX5+afXP7bQW+gdf+U40CF4cTU6DE
         PCitYJ308p4YFjfs6vWKkAIouqawzQa4JiJ91WAO4d/WLJEzCU1fZq7Pg3tCfFDeAWBL
         o/sv9w1nWMU4FOnp9+dxSP9Slap3aUMep5s+p2ZLOIhopVmnsWS+/6fuHW26Uc4JrFPS
         QlTEDPnqhnYVf1PPzi4dYZsGRp6JJYsa64pejChW7WyndaHMHriIVlpJilBMVJfEY89q
         q5TQwsQaYoSzchwHPNVfSBX74lOmWZejaP2R8QzXF6fXJB4KqBx6BOKPPQgNPq5pBFfX
         mXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238444; x=1764843244;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8C/8vYpZ3lt1x50MRO8vehvZVw1jN1RA/JwkPqP+uE=;
        b=HyR8Mx8J9eJvCKj58OQvgNOIXCnnl92mySWV6z5PcRb6QLsmFzTBdlSKZJyOaI+rKy
         2ozAJDSiCAEHBlHN0FTGtEt48wfAmV3BYU1BcDZ21SV+0jmDZ/qcSh0MdLzz1y+5CjUG
         iRehVfVdHemR2EzBlwKAv0CGFx6rNlsZ1DU8N4HqJiUavK99ZT2bZKhmimByc+sfhPXZ
         R8pLbQiBqniWPzxOSuDyMmzqL5BLrM1incjBcf2rqZyBCMwN79y+KlgBNc+n0mtzTYwm
         e6IKqF+OZmPY7BMI1fCGYH9kSRbdQHWp+KFliy8GkpvNKbSzc8i9A5OG/n+utfMNh4PQ
         UJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Q2M/CXZBCtARArQcBlEXplwnH7BZKGhseayoA5QRbjlJVrhZYb+Q2FhOsQghgpSgtgttn7Rz6xstVJojcqnW@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4UGCN38ok4EIhNPgVZngmZLrldWK/JqODixKmJHz3VG6Cy50
	oTaGgj5vdFU0pxMFvPqpQx1GNuMW3moueSJuigtm5NwX1KvEACuGX5Xn9LiX9oGBinEMyv0DOpG
	V2dfBDrVv5HGcIf+K0/syf2pJmI3ow7ciw9viIY0ozw==
X-Gm-Gg: ASbGncsJFp/aWl04szCJDQu6o4QToXjvPfVYMOYl/Gmb9qhGON6B6B2GRNjg2ERqYbr
	otnt6MBrHiVkhacOBS6VemXGdcm7pw1UXJaczkALFcihQRVZqq0FuHlW8bRSTEa4Ik2N2X+6/xS
	1A9NVxxpOSSta59d0JK6mZP4Pmy83I9uDNXhfIeEG31FH8u9p9LpxTlkG512aZA0obEk1oSAR8u
	JHxwPrABYuUP2dJ520VJ3n0u75b3ayNi6C+dKpkVhVF2c7GnVaas+qfCaG+F8+XRbMTkN6YfhQq
	LTeHdOis
X-Google-Smtp-Source: AGHT+IGBVIdlBmUiqlH23Jgnqg+vCTkZchSIIr25/2FLye0Tk4Kz4LKKfhIVPsQEIjNUDRjnb1zBkemke4S1rnl41Nk=
X-Received: by 2002:a05:6808:250d:b0:450:7169:810e with SMTP id
 5614622812f47-45115b24dc1mr9824305b6e.41.1764238444270; Thu, 27 Nov 2025
 02:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20251118025015.42491-1-cuiyunhui@bytedance.com> <20251118025015.42491-5-cuiyunhui@bytedance.com>
In-Reply-To: <20251118025015.42491-5-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 27 Nov 2025 18:13:51 +0800
X-Gm-Features: AWmQ_bkhXe-IUa1j5RwqVU5YALRpKBW_makLPEfBh7aEKWFJIRg3x1qGcDHPwo8
Message-ID: <CAEEQ3wkpWExOg+xLEy18Le+89kowgu6LOj0HMCVcqJKG+7Wdhg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] riscv: smp: use NMI for crash stop
To: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, cuiyunhui@bytedance.com, 
	luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com, 
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, 
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	timothy.hayes@arm.com, lpieralisi@kernel.org, arnd@arndb.de, kees@kernel.org, 
	tglx@linutronix.de, viresh.kumar@linaro.org, boqun.feng@gmail.com, 
	linux-arm-kernel@lists.infradead.org, cleger@rivosinc.com, 
	atishp@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_021405_530727_73C3272A 
X-CRM114-Status: GOOD (  20.87  )
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

Hi All,

On Tue, Nov 18, 2025 at 10:51=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.co=
m> wrote:
>
> Use NMI instead of IPI for crash stop if RISC-V SSE NMI is supported.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/smp.c                | 14 +++++++++++++-
>  drivers/firmware/riscv/riscv_sse_nmi.c | 10 ++++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 669325e68a21a..07ccc28f52172 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -16,6 +16,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/percpu.h>
>  #include <linux/profile.h>
> +#include <linux/riscv_sse_nmi.h>
>  #include <linux/smp.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
> @@ -300,7 +301,18 @@ void crash_smp_send_stop(void)
>         atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
>
>         pr_crit("SMP: stopping secondary CPUs\n");
> -       send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
> +
> +       /*
> +        * IPI performs better than NMI, but attempting IPI first and
> +        * falling back to NMI on failure requires recording CPUs that fa=
iled
> +        * to stop. This adds complexity to cpu_crash_stop(). Since this =
operation
> +        * is rare and typically in the final phase, directly replace IPI
> +        * with NMI.
> +        */
> +       if (!nmi_support())
> +               send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
> +       else
> +               send_nmi_mask(&mask, LOCAL_NMI_CRASH);
>
>         /* Wait up to one second for other CPUs to stop */
>         timeout =3D USEC_PER_SEC;
> diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/ri=
scv/riscv_sse_nmi.c
> index 1763f43961ab6..e4c20dce40f9a 100644
> --- a/drivers/firmware/riscv/riscv_sse_nmi.c
> +++ b/drivers/firmware/riscv/riscv_sse_nmi.c
> @@ -10,6 +10,9 @@
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>
> +#define NMI_HANDLE(mask, func, ...) \
> +       do { if (type & (mask)) func(__VA_ARGS__); } while (0)
> +
>  bool nmi_available;
>  static struct sse_event *local_nmi_evt;
>  static atomic_t local_nmi_arg =3D ATOMIC_INIT(LOCAL_NMI_NONE);
> @@ -48,6 +51,13 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_typ=
e type)
>
>  static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
>  {
> +       enum local_nmi_type type =3D atomic_read((atomic_t *)arg);
> +       unsigned int cpu =3D smp_processor_id();
> +
> +       NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
> +
> +       atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);

Do not perform direct zero clearing on local_nmi_arg; instead, only
clear the processed bits. Otherwise, it may miss responses to some NMI
types.

> +
>         return 0;
>  }
>
> --
> 2.39.5
>

Thanks,
Yunhui

