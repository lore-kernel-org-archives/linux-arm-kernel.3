Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B974BC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=; b=BPXUE9FdXuQV2e8eXBhjx+6QTi
	WrhIEx+jP3h1//SRyn64ckwz72KDm6qoTVibYhNGl0dc2jWP9C3ukAu2KltMB/Gg89PFb5tWWGVy2
	N1Pos7rWVIEtG1ROMOkmJH7M4r+Oj6mgPRk2/7T2xTLMidht0UTJNgTvsylfc/y2t42LMS2vLOAw1
	amIJe19621yQP41dT+dP9QPwRq47zOJSZeN9Dl0vBPW4ZcNY9NwTmu8sb5G2W4daj/djYmBQsWwrY
	paRIRlcQzAtjHtDx5IG7XhbyoIJZZ8CyHMjPg2lkbUaCvr+v7UTbIrNf/6pf1hPbB0c/9GsivePLb
	AZVlpUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrF9-00000007Rbk-1YFn;
	Mon, 20 Jul 2026 16:53:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrF7-00000007Rb8-2CUW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:53:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c1601d552a8so1100523866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566403; cv=none;
        d=google.com; s=arc-20260327;
        b=kvg1/pndx0ANRxpPgrzJAjDho/04wVtlepsJ+SYcxLo8eiWV3V2xx5u6zdBBJL2Wwp
         m94VwddeW5enoBND6GQHiiR8qO5lLSs7pR9CGPtUlVVR93bcan5syPMQ07BuS1HMyptX
         lGNrrtPRKKoxEDUhaO2I78EADUzisDLZyQv+J527k3TZSF7CljemnmrHQotNTB6qdY1x
         IXQm0oGWh54QFteZPItpsR3M8WgXkCnFWaVxsfaDh2aXAHl4wwnG16qHiWU+sYVwetsx
         CPqhai7XgDYEP2xJoxhqA3uquXeRHCwBzQEIL89hQkefKbMRvjF6F388Wx6ad8SuJ2rA
         NUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        fh=1+nM4CGLPYl9YEr1D+hjJt7zvuPYYjMBlZX7SmtNRz0=;
        b=Oo2wVEXnDfVdBkml7V4zk2qaPITJuRUOhBZ8lHgvzem6I9Ar3FNnInaZe2G+YAk9YZ
         TVlA0+d7gI3BhwMsskOcSGCn1fket1qYkTXE4A6TU5Oy8WCCmtBMEp6Jydo9W0tOoQKS
         J6CsjGB/lxbxcDBfv9IQjtUwfchVGh3gdi1h7XJVSzWprR1stfzq04r0d4zqVW7CrazU
         xb0yttZrFuy8FdBHZUBt04WTgh/xnCvk/rwdDj5yZwmSwE+6CEMD3QyPvk41lcdI6HDz
         DPq2qlXv5Mbzifsv5oB90dyWqTtzl9P0Pws5giyYj99zmcfYgtdz/zFHehfh6KSr2leU
         JiJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566403; x=1785171203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        b=uyhlK/UuG6G1qtKUkum4/lKPso1W/dGPgztMQjnjr1bugkD3AOpNc0yxsVtykKS7p1
         fkLwmDD1oRHs8xW1SJQ/mKfBM6HyEUicsyB+a2juzZ9WgiHwIQgd8+OGjJsCP5bWSpEv
         0L3NEHollL1AGbwa6unYMVlXecdD62ORqjhKpcHugwXLclQiYOlwjgCLCUhPdtJ48lAt
         VvNOr7KszthJMfnSujIPqMBnPpHGWR6+PKijjfPKtmSfh89U18gzz3CJkMmn8g2uEexk
         iP/y7IDGqkB8T77GGbTOiq6lVaIIPDmDRho2sR6EqGyu4O5ud5JpOb5BUkjwRwnLlUAv
         8sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566403; x=1785171203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        b=edt+DW86EQoU5nsZLKl4vLtFxmtUzDpljUaNMp5gAyFLMIFb87uGmkCdIxtAUOipJ6
         HEWSK5izMTPc6iVyQf2lGPRJP5SUwht6pom8Z5toXJ5l9y675t4FkmnsWF0xkm6nQGnF
         E/8N6YKDwyeoD+acSmrdh/Hkvx6DQwVkrhwEgEOP1Jj1LOTi5TdQgRyUxdlf1K9X1quW
         JxmeHiebmKR8bGr4okvSHf/oFjPpHu7/7AD/9lo+YCii7lomIpCTZnkOkiR/Rrq35xpZ
         CzP5TS5DxC2s9R17sUB15/wk2ypJcxAxMviz1WxNhX3YAsbiNPdkHODXmHQ5hWhfTPCb
         wLsg==
X-Forwarded-Encrypted: i=1; AHgh+RpQ4v5Ql0ZHEc1eka0MuPpOzYuW/PtessuDd/5xkqa1UoM22Sy25n1bvhQ1l31Op+MiwwUILpRkIhaQsFg+LHzl@lists.infradead.org
X-Gm-Message-State: AOJu0YxRka0Tvl1ElgpUgoKETKI1KxR99HmBXVtkzkP9qFyXkubImRxt
	AjpxQro/8PvUE/yAGIfJRvQWqXFw72LJ43N0EdTYOASmIngxcvNDD5t70pzNAS0b3SeQGxtaKe/
	gRVTgUT+n9yiLy5ZOhW6h4z/mYlyMFMWbbiri/Qh5
X-Gm-Gg: AfdE7cnVuvbyGjn1wPG4gPvAxDcXbpwo1Yzl8XCEwwq0L+4uVeWawZSHDf8oqqzt8VH
	ydWwyZ32Z53qXgqMDUD9R2b1kOjgpic5N9VpV6tqjHdgPzMn25xNV3HHfc4BFe8TSIrZQtlAeZ/
	kpbwN2vlr/TWQYWEDWcZmQcpb7ZrhPLlejJ6JVpkkua+YYT7iklVDqRV6Q7B8AuE6ZwDmmFbM/y
	7ylijjY7RUe4aVWKwNfvNObIAUPs/wtdMGlx0Alr6NCC42i95eW+RE2pwF7ekF3Ese8PTfBlYo/
	Bx9g0yHuphEmkFEtzJi+xiW68iIrjKWRVHk0cZfo8dqSQdcXz687v6Vjb3TaTH/diji8lYT1HVc
	bRsH+DZyOnOs=
X-Received: by 2002:a17:907:6d14:b0:c15:e137:d57f with SMTP id
 a640c23a62f3a-c16b48678d9mr657987166b.54.1784566402947; Mon, 20 Jul 2026
 09:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com>
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:53:11 -0700
X-Gm-Features: AUfX_mw9O2p0DT6-W8ngt0co6elfl4BwN1-CYf_F0Yc57cKNxMjDlorSGTBkHkI
Message-ID: <CAKwvOd=eAC-Mz0kZhbHQMFOY=ba=WXDH6X_Zzh6KGfuq5PmJ4A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095325_589634_A6FB27BF 
X-CRM114-Status: GOOD (  24.71  )
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

On Sat, Jul 18, 2026 at 4:14=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
>
> To resolve this safely without reducing CFI protection scope:
> 1. Create a minimal wrapper function imx6_suspend_in_ocram annotated
>    with __nocfi to handle the unverified indirect call.
> 2. Remove the __nocfi annotation from the main imx6q_suspend_finish
>    function to preserve full CFI coverage for other indirect calls
>    in that scope (such as cpu_do_idle() and flush_cache_all()).
> 3. Mark global variables ccm_base, suspend_ocram_base, and the
>    imx6_suspend_in_ocram_fn pointer as __ro_after_init to prevent
>    them from being used as target vectors for CFI bypass exploits.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
> ---
> Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> Before this patch, suspending the device caused an immediate silent
> hang requiring a hard-reboot. With this patch applied, suspend and
> resume work successfully.
>
> Differences from v2:
> - Restrained __nocfi scope by adding a dedicated, minimal 1-line
>   wrapper function (imx6_suspend_in_ocram) for the OCRAM call,
>   avoiding disabling CFI checks for cpu_do_idle() and flush_cache_all().
> - Marked global pointers ccm_base and suspend_ocram_base as
>   __ro_after_init to fully neutralize Write-What-Where exploit bypasses.
>
>  arch/arm/mach-imx/pm-imx6.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498..3d5b960c5 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -61,9 +61,9 @@
>  #define MX6Q_SUSPEND_OCRAM_SIZE                0x1000
>  #define MX6_MAX_MMDC_IO_NUM            33
>
> -static void __iomem *ccm_base;
> -static void __iomem *suspend_ocram_base;
> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void __iomem *ccm_base __ro_after_init;
> +static void __iomem *suspend_ocram_base __ro_after_init;
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;

Are we able to just put __nocfi on the declaration of
`imx6_suspend_in_ocram_fn`, rather than bother with a wrapper
(imx6_suspend_in_ocram)? I don't know if that works, but surely you
can test that quickly?

>
>  /*
>   * suspend ocram space layout:
> @@ -360,6 +360,11 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>         return 0;
>  }
>
> +static void __nocfi imx6_suspend_in_ocram(void __iomem *ocram_vbase)
> +{
> +       imx6_suspend_in_ocram_fn(ocram_vbase);
> +}
> +
>  static int imx6q_suspend_finish(unsigned long val)
>  {
>         if (!imx6_suspend_in_ocram_fn) {
> @@ -374,7 +379,7 @@ static int imx6q_suspend_finish(unsigned long val)
>                 if (!((struct imx6_cpu_pm_info *)
>                         suspend_ocram_base)->l2_base.vbase)
>                         flush_cache_all();
> -               imx6_suspend_in_ocram_fn(suspend_ocram_base);
> +               imx6_suspend_in_ocram(suspend_ocram_base);
>         }
>
>         return 0;
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers

