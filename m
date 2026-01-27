Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBBBD2F037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=; b=c5wXBz0Ei+jbuGH0dpzkxcevhR
	Tk7ofukm7xMTW0tRFz99rUHDnwUmwC3wLLYh4MMr/Oa0X3v082FoITZoDNiWC9H07Fa3YV6WDkah4
	ecLqHMFQMBcQosHR3tNtU0Z6Q64pl3yZWs4PpWEaLx9yMztgKey52ROey2quM0CqiruxuZnGaV9Wb
	krIeD4tTw28WweIo3uIMGaXWD7zLOq6WiRDlhKa7NS3SljZI1EexZHICsSWzzivsfczIVidEfbHJf
	ZWXHFWtTHJuYibgH9Ng50wWGyvFehT1Z+Thkr0dYyDcxjzE9fw4SWlgsIC6ynNiNSKzMUnRWNHfVf
	PHcHXF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk39-0000000EOOZ-00H6;
	Tue, 27 Jan 2026 14:28:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk37-0000000EONL-0N0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:28:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59de8860b94so4014145e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524087; cv=none;
        d=google.com; s=arc-20240605;
        b=bJu7TuGltbLVZJ1p8j5KVP/IzgyTG+tpCL/ehXDe4xGxLACwppZqXKDNbZqIjh7r3z
         R/gIXeaR4jxPcJUUzjtGfd404roRf9EkzMVxLI8a/5rtPd99TzR0K0dTbfsXVEMqYsL3
         bSTVkYIvJgcF8Pdik+S5fnv2gss297tezkMc4MeAw9FrAoBJzQ82Nk7mTLfaDVlHrpdx
         GDxAW741XC9UwQvxfhXiObKsWK6jULob57CBZK/fB1uMseuOxrdp+5qHfosjCPlkFDOK
         xY5ReqOvkj2lPRVRoJ4tYfWF7Mr72RNYhbgNBt6WcfZrSG3md/uXrhSpgoJyRVluO6OX
         1C1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=;
        fh=UgROonwdHNeQM4OSOO+Ca90gMNbEz/ufUx3e/iI8CBw=;
        b=HfJXMN2Jq97XBKjU1uLJRlWBzqmH8mZvq4aTOFg/xA/TOIJBPl7qlkRjvw3jD3UYFz
         zPmsLahbJuY3Q7xi3bW14+lEtUf2ewshXGXEcaQYs4MmIY4ntVs38GS0glzfsyRWlr+0
         g3X58KzwSOLqcxVKieOdpY37jbrq+L50AWpjVNFnvG+5T6cvsQXO9+LNF4cBYQdExXUB
         IbPVx/wlAz87n1WLZuRaoPOxFQGyhMsZRQq/CE50cYm2yIYXVXOsqIZKU83Vpkxb17u1
         9+Hxo2G7WEbkbB2YbC+91TNh6IgrnY4biDKOZEqWVnJM89i61O8JTwhmHEPkO0fAWm+T
         j2NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524087; x=1770128887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=;
        b=BE/4EQj+coGcPaohTdjcaqWRNbvvF8DpcGwgxl4fvO4C67ZUmJOWBKpws2bnt3tnqd
         B4RQWJEhqfvVkOplxvrGm04KPRehMd/u6jzAq4Qsv45a4TMCFiURmqIsNrrk2L6j9Dpb
         d2oDnUpYfwA14+OCal8c/HvEqTEIl7QWb8GdGtEXCxS5UPgG8ZouI7lFP6JA2OovG+mA
         ATMfy+OQ1M86AhP1mvaBaSHmYAX1WK4Gxgcc8Lmj0Bn03UGSRsZXNUlm07VTnrawJpLg
         YlhPHJFeYPEOyoPpwGm9weQnbxbpmYYurfQi1tMtHTedEJ5c0wEXKv0MikIOkUnautQw
         sZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524087; x=1770128887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=;
        b=f2G+6yhX6/JdMCU/jV2d+Mp1qX2t5OytdJjvl9THZxSU5tPsRBgiQ6ZvpQo7EBVQbK
         /XYlKUxgvLkCd4dEKKpIlqHxkVYhYV6I7lJnPhhd6uPECj+l/hHx+gySQZP/9goB/tO5
         5JJWxOkjcN01VIJLCSW17WB3QXwjxf4RMZ0tpnw4xMzLah0heru3Um/NDBGixy0N9eTV
         BFZbzWXlR4YO4/E5Rwq+ZQsHrHeuZfy4ErXiiNdxVHcKC2MJQozyRmvsv/IucftLKwPI
         LtpP3BXbX0ChM6Jd200y/W4M2PNbQR64+NkISifqQZYjESj3IXxCuKO+yWO4Nsu97Le9
         xKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrq0XWGnuThb+w+uETZZg6rnp3ohQI+Bb+Kc7ytehMdqt9k0lVZwXu6kHCWJ+hjuNUxmPRq5IMxcholPv8wNZH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4lurqSMB5i887Rf3lFZuDZGVkq/9JN4BhfVmkypQB0HkPfFdm
	eJottYMUIjhjZHoKC9fqIAVZXwu3mxLeNojE7EeK8QIUwn+CUU4EX8fgzl7ueLL3bnDxSHsLevB
	EpdVZ6UbPPDGR6dGACBr46gphvyq7CTLIZxzlSfRdWg==
X-Gm-Gg: AZuq6aJ4d+ppibYU22S4HKsv5TZmIWaOiL2QLhjvlsTpoiQpkWv/AhXYz4WyOu8Qp5H
	GFgc/hvZXCqvzVY2jzS9fxOLwttODmQMpfT3HvVKn3iFKCFqtLxIhsuLdlxHknjywhf20JLozuc
	ISgEvP3puk43k13TsQVmS9BBq5Eh2OYPPugxNWbeEp+SR/y9sVtfZV9SlgwelDQir+VW3rLBMuN
	AAlY9jLbH772/tZa14OQc8ExhzJmRD9LBFHdhr1icacRdm4P5isQgVhKozz51IFYhi43Zt6
X-Received: by 2002:a05:6512:92:b0:59e:417:27fa with SMTP id
 2adb3069b0e04-59e041728cfmr750014e87.48.1769524086693; Tue, 27 Jan 2026
 06:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
In-Reply-To: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:30 +0100
X-Gm-Features: AZwV_Qjot6TJIfN7wNGu1pyiZ5mH2AbueFO2BcAtWkdlZPb-DGIO_mxVmpUYEnk
Message-ID: <CAPDyKFr9pLaZRBXypf-9cZWahJOMcBc6QB-udY46GEvb0tFyNg@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_062809_164699_1375C424 
X-CRM114-Status: GOOD (  22.46  )
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

On Fri, 23 Jan 2026 at 03:51, Jacky Bai <ping.bai@nxp.com> wrote:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power=E2=80=91do=
wn mode
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
>
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Changes in v3:
> - Fix the Suggested-by tag typo
> - Link to v2: https://lore.kernel.org/r/20260120-imx8mm_gpu_power_domain-=
v2-1-be10fd018108@nxp.com
>
> Changes in v2:
> - add prefix to patch subject as suggested by Krzysztof
> - refine the patch to move the GPUMIX ADB400 into GPU power domain
> - Link to v1: https://lore.kernel.org/r/20260119-imx8mm_gpu_power_domain-=
v1-0-34d81c766916@nxp.com
> ---
>  drivers/pmdomain/imx/gpcv2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index b7cea89140ee8923f32486eab953c0e1a36bf06d..a829f8da5be70d0392276bd13=
5fb7fc1bbf10496 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -165,13 +165,11 @@
>  #define IMX8M_VPU_HSK_PWRDNREQN                        BIT(5)
>  #define IMX8M_DISP_HSK_PWRDNREQN               BIT(4)
>
> -#define IMX8MM_GPUMIX_HSK_PWRDNACKN            BIT(29)
> -#define IMX8MM_GPU_HSK_PWRDNACKN               (BIT(27) | BIT(28))
> +#define IMX8MM_GPU_HSK_PWRDNACKN               GENMASK(29, 27)
>  #define IMX8MM_VPUMIX_HSK_PWRDNACKN            BIT(26)
>  #define IMX8MM_DISPMIX_HSK_PWRDNACKN           BIT(25)
>  #define IMX8MM_HSIO_HSK_PWRDNACKN              (BIT(23) | BIT(24))
> -#define IMX8MM_GPUMIX_HSK_PWRDNREQN            BIT(11)
> -#define IMX8MM_GPU_HSK_PWRDNREQN               (BIT(9) | BIT(10))
> +#define IMX8MM_GPU_HSK_PWRDNREQN               GENMASK(11, 9)
>  #define IMX8MM_VPUMIX_HSK_PWRDNREQN            BIT(8)
>  #define IMX8MM_DISPMIX_HSK_PWRDNREQN           BIT(7)
>  #define IMX8MM_HSIO_HSK_PWRDNREQN              (BIT(5) | BIT(6))
> @@ -794,8 +792,6 @@ static const struct imx_pgc_domain imx8mm_pgc_domains=
[] =3D {
>                 .bits  =3D {
>                         .pxx =3D IMX8MM_GPUMIX_SW_Pxx_REQ,
>                         .map =3D IMX8MM_GPUMIX_A53_DOMAIN,
> -                       .hskreq =3D IMX8MM_GPUMIX_HSK_PWRDNREQN,
> -                       .hskack =3D IMX8MM_GPUMIX_HSK_PWRDNACKN,
>                 },
>                 .pgc   =3D BIT(IMX8MM_PGC_GPUMIX),
>                 .keep_clocks =3D true,
>
> ---
> base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
> change-id: 20260113-imx8mm_gpu_power_domain-56c22ce012a1
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>

