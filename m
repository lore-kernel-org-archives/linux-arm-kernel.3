Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0068CD39014
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmkX++zqRoXmQufKUjRGX+1ajYsTgPtGYI1EAO7VUfk=; b=Yao56m4trXDyXXxl/Pq2vbE2rZ
	REaVuGZJFcY+wRNAEjan9teQESLAq2cQFYAkyu3u4QimTrvsnXiqIjGV0+A2uL7/FlsAy1JbLDEV+
	UXhV1rVCGv9fx77elkLTEB9Frxs9Wrz/raDoCv6b3Hf3rzHAE7b/oanwL12bpSbXmP28c1aDBmHaD
	X1Z0v79yZPd66xINjTayTcU28MsP0rMcXwvurAiexiNcKju++MjeyAxofxaQM5zwZk8z/IxOTy3z2
	jSY/YPthQ0PlB4idQt8BlDV1JcQOgXq5oS3hd+8HqGBQTZwRnvSmaUNwP0fg01QkXYVM9hKI+l310
	xdyWytzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6ti-0000000AXeJ-3Apv;
	Wed, 14 Jan 2026 19:51:18 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6tf-0000000AXce-2xaU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 19:51:16 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-40423dbe98bso55891fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 11:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768420273; x=1769025073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmkX++zqRoXmQufKUjRGX+1ajYsTgPtGYI1EAO7VUfk=;
        b=aN47h6npK21eNOmf9IKfEIqINDdSLwRln3C+4NA3uLmaICbAfCqQIbmz+a0EHBgG5g
         HC2Futaa2bcx/JyOmkEGyr2Jju0E5NEh18keE5FU3eAIA2JwDZQa9KMKZAQdpRKigKuY
         EpGfuyRup+3dfEPwmV7tfs34bbTXTieoDcqLaw6fzU7hlXRUPX30LpJWKTv3wbuw0kBK
         ++ZRzuMnU3TbFP1kDLn00CIPsRpvyskx60jwXzm82qHhn+xs38d+MbgfF/DIYI1knkQZ
         K4kpQCx9BV3y/1qzQ6okoteGr8Hem2TavWHE1MieC5/iDwijgXdPMK5IdomuNGvB2R8B
         CxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768420273; x=1769025073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmkX++zqRoXmQufKUjRGX+1ajYsTgPtGYI1EAO7VUfk=;
        b=Gc+ProZPcYexw5SpreWuwERe5uq3inQBgbftFNC61zOjqABf8gvHny5pybSqJb3gIo
         +L5pY0Qu1IP4vTHuhu1yHkqbXQBR0nHHJERIdzbV7Xmd9KpIE/oF7YHKsWT9/qFD67h7
         Q9m+yxE3vjt1ws/BqjKl93XiyEupyfI/h+RNXUzhDSsyv0PMO7x98ddyWIz0W6friO+n
         AytLhdWNulFiNzetgL32vbFJJqzbObA09Q1JOwvSXOiVRPRexDIzGowpxgqpqOysXR6C
         P7yyV3ULX8auyKtBxOH1F2aCFsBcroXECSb4EjzaOebiMzZzlwewnnRJFcE0U1KodwVQ
         pguA==
X-Forwarded-Encrypted: i=1; AJvYcCVO+zFwj1MBnjOXQgoA+Pp4k+sO63MMRSSwNbeW5SvAL8IxtcqPp1MltQl8H2Kd0yTofCexM4fomQLyyvL9DX3q@lists.infradead.org
X-Gm-Message-State: AOJu0YwYr+AZcP5j8A8j6hsHgcJI6zD+4KbaCSKcaoDclAtxSoe8NM/e
	NZvnxPX7+SVUfPwEWb6KMl4JwpTdhhvTU/+L3WmdMoCj28FFQSsQA16YgMul8IkP6PKCU5zItZ+
	b7BtGVWFQ5rzTYOWrydh7D4oMh2JVQdk=
X-Gm-Gg: AY/fxX7enyXk/Z+5YzaFdueGNDhKKuTnddvZWxQIQEqs5ERp29F+R/1osFQATKgkMzG
	T9OpEFdUKAeFktOam9vo6flhFjAmUaZn8lZdiqC1SIQjc4l0DzQnnTPIM0kzXzTuGYb/qw7Y+cg
	o23pgoppl1yNUh/Fq+dRk876sJ9Ee12ZzBdEasjoyS5mYbhVlidFDiLqd6lnw4KpEkbmFKn+Ggm
	6AvK5cRvghoQ2/u+P3nCW+5cXOBHh6gR8e/zQ0aGyyk+zE0JH4uL87pz63saT2JQbv/FVJl2n6R
	HAOgRXzO20/9zwyu5oPJZluuMCA=
X-Received: by 2002:a4a:bb09:0:b0:65f:5b63:2bd with SMTP id
 006d021491bc7-661006092bemr2099962eaf.16.1768420273146; Wed, 14 Jan 2026
 11:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com> <8536413c-8687-4d75-befb-8f25e54838bf@rock-chips.com>
 <6934ae0d-16c5-436f-97f6-c11d304ca51d@rock-chips.com>
In-Reply-To: <6934ae0d-16c5-436f-97f6-c11d304ca51d@rock-chips.com>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Wed, 14 Jan 2026 20:51:02 +0100
X-Gm-Features: AZwV_QhkpvCh021_8aZe2zj5NJEjyP2doG40Uc8dVAbqe8HO8DzZyH15qQIvC28
Message-ID: <CAGJh8eDXT43_PfmUbShL4Hysfkd21R=sCerRNe_AGQANbwvSPA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for
 NanoPi R76S
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	heiko@sntech.de, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_115115_842314_94819080 
X-CRM114-Status: GOOD (  21.63  )
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

Hello Shawn,

On Wed, Jan 14, 2026 at 9:08=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> Except for the patch mentioned above for fixing the hot-plug problem
> which you confirmed to work fine. I looked the code a bit and see
> a potential problem related to the runtime suspend + power-domain.
> Please check the patch to see if it fixes your problem:

I tested your patch and the issue is still present. For verification I did
add some debug statements and just to see what it saves and restores.

The symbols are there.
root@nanopi-r76s ~# grep dw_mci_rockchip_runtime /proc/kallsyms
ffff800080bf27a0 t dw_mci_rockchip_runtime_suspend
ffff800080bf29c0 t dw_mci_rockchip_runtime_resume

# dmesg output
[Wed Jan 14 20:13:46 2026] E220d: Restoring phases: sample=3D231, drv=3D180
[Wed Jan 14 20:13:46 2026] mmc_host mmc1: Bus speed (slot 0) =3D 400000Hz
[Wed Jan 14 20:13:47 2026] mmc_host mmc1: Bus speed (slot 0) =3D 198000000H=
z
[Wed Jan 14 20:13:47 2026] dwmmc_rockchip 2a310000.mmc: Successfully
tuned phase to 232
[Wed Jan 14 20:13:48 2026] E220d: Saving phases: sample=3D231, drv=3D180
[Wed Jan 14 20:13:48 2026] E220d: Restoring phases: sample=3D231, drv=3D180
[Wed Jan 14 20:13:48 2026] mmc_host mmc1: Bus speed (slot 0) =3D 400000Hz
[Wed Jan 14 20:13:48 2026] mmc_host mmc1: Bus speed (slot 0) =3D 198000000H=
z
[Wed Jan 14 20:13:48 2026] dwmmc_rockchip 2a310000.mmc: Successfully
tuned phase to 231
[Wed Jan 14 20:13:48 2026] E220d: Saving phases: sample=3D231, drv=3D180

Based on this, it makes me believe that power to the sd card is completely =
cut
and when it wakes up and knows how to continue, it still must go through th=
e
retraining phase.

> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -36,6 +36,8 @@ struct dw_mci_rockchip_priv_data {
>          int                     default_sample_phase;
>          int                     num_phases;
>          bool                    internal_phase;
> +       int                     sample_phase;
> +       int                     drv_phase;
>   };
>
>   /*
> @@ -573,9 +575,43 @@ static void dw_mci_rockchip_remove(struct
> platform_device *pdev)
>          dw_mci_pltfm_remove(pdev);
>   }
>
> +static int dw_mci_rockchip_runtime_suspend(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct dw_mci *host =3D platform_get_drvdata(pdev);
> +       struct dw_mci_rockchip_priv_data *priv =3D host->priv;
> +
> +       if (priv->internal_phase) {
> +               priv->sample_phase =3D rockchip_mmc_get_phase(host, true)=
;
> +               priv->drv_phase =3D rockchip_mmc_get_phase(host, false);
> +       }
> +
> +       return dw_mci_runtime_suspend(dev);
> +}
> +
> +static int dw_mci_rockchip_runtime_resume(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct dw_mci *host =3D platform_get_drvdata(pdev);
> +       struct dw_mci_rockchip_priv_data *priv =3D host->priv;
> +       int ret;
> +
> +       ret =3D dw_mci_runtime_resume(dev);
> +       if (ret)
> +               return ret;
> +
> +       if (priv->internal_phase) {
> +               rockchip_mmc_set_phase(host, true, priv->sample_phase);
> +               rockchip_mmc_set_phase(host, false, priv->drv_phase);
> +               mci_writel(host, MISC_CON, MEM_CLK_AUTOGATE_ENABLE);
> +       }
> +
> +       return ret;
> +}
> +
>   static const struct dev_pm_ops dw_mci_rockchip_dev_pm_ops =3D {
>          SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> pm_runtime_force_resume)
> -       RUNTIME_PM_OPS(dw_mci_runtime_suspend, dw_mci_runtime_resume, NUL=
L)
> +       RUNTIME_PM_OPS(dw_mci_rockchip_runtime_suspend,
> dw_mci_rockchip_runtime_resume, NULL)
>   };
>
>   static struct platform_driver dw_mci_rockchip_pltfm_driver =3D {

