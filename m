Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A1107529C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=; b=wVIfJIwkNw033P+4/8KVCgEqEh
	E5g2l3tRD6HSIeeH73fFRGvscun1SxN9vohRkraqE51KELpAJqKG/WvlFc0LfbLnN/UT2cMG+KHL6
	bBgSqN8h2hzBsppNvon1ysZ1zZyrftM0k4uoyCiBZQ202XlIpng9sPZEod+IDdl2QycDLRWZ8WX1F
	WshDMrSmWhxutD9JjkoqfHhRJqAfCNqlOKqolwo13fv7RRy1jRnopa/W4xzHAMC5ywZd+7wHr4fGR
	uFyYMQYE/JeieO1OnkW5B3KJYYhuuvlryrqdsbkL8KCpCb4dzllVdFtoYeaLxE7auIu2tTClFy/WD
	6VWBK2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AOW-0000000AO6l-0RUI;
	Thu, 19 Mar 2026 10:14:24 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AOT-0000000AO6P-1dgR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:14:22 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so1132989e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 03:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773915259; cv=none;
        d=google.com; s=arc-20240605;
        b=NOt3DkHiqHjGQUkRQzsvGhggC6Hk5LZcAJrksBfjCxP2Pgb9Pfn1TG5I1chBJFk2n1
         4aB1T17BVhvPEtcXRIZsRpT084KlZQnDZwPjGryKNaZU6cmGUI7HL+PpAzjJdgsmYdMx
         lFZq5jscdccWvMI/MWvup3CELTtwrSli5RmL8TwR+GPM5Y1nMNfd+17ghoN5fcDapflO
         o2qltFhHh3LDkibuszTyf1vF3mPmkleSw4rt7ky+Gqz4Dx2DPaig9/6o/E2xMV+g/T2l
         AwNfxbHCPFjC2zCCwOri2rm8npTXUeQRnEEcxrfCvDh1NVH86kkIFOdaBL9HZXgRxsy4
         6J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=;
        fh=J/a6eibg3ah6UlUXFK0N4Cq57fI5b5u6Ot5xfySQtWc=;
        b=gmgRF4cRSM/72KJvXBAKrEzBG4b1ur3gV2bUeOMwcB945wE8B5sRrMFewXRlZQ4CYA
         lItSfveQFTh8mOB9vuAIS4OUJeP9J4YM8BPzpyyMndnl8YeTqeLISCAct7bPbODySwyi
         FDPZTQXZKdXU60XZIBOF2QT6mUsOOAJIVgrRotPfrRiCZOBHQ/N3M1JLr9NejGpKV+9C
         EA/FN6y9xYLuPBi5qfJtn4B8kROpvni+QR7FTkxcvVGLsyOKQayczefZjaoWXrXiagZ9
         ujU+s+8DRRF7UYZGFr7cRXN8nzVfJvrIvx7fqB3oTdxGk5KRclGGaD3wTav4t6X8qDkA
         b/pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773915259; x=1774520059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=;
        b=TrAdl6EojVevIebN+BKkzJ8jKGt+YQmnTU55xRymD+0EO+LT9hsqcpW0KKdD7qI+zq
         ijD3jvPSwrwnlH7z0+kna8zaB83Yrc1pBYzwxB6sY+ZwKa1EP01mtv6BPePr9QoPhTVk
         QBbRKoqMOgAhGBxCWDcbTJUzbnJF53OA1LzVhXr/azsP0veoa4SPzGye3JjZM6B3iInh
         VevRgh2vPgPL3a8HIwXE0n2pcKRoy0S8Nz+i0rw/N5JG8JI31/G26AYksTB9qeDKGncI
         oNL1FJqaWAe9UKHxikcxp2rWC3lNWvZ4bwRd6coio/Be3m9A5hxZIGqbZDwSvBmuWmdM
         NKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915259; x=1774520059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=;
        b=SlT1yg7Anpcc1ffX4WYkDJYHRyBiPkPmlrwBwKVrzRbbBxwJ8a9PgDSGFUNDs7txmC
         2C00S8PWcjTpuHLJRiztd0FMqJeTf2RoNBosHs/ChmpEBn8U824XnT2mYohdVzKANsoS
         fgI7CQf4ye1OQTv4uNFM2HsqPb7A781UekGB0PDxSZV3c2EI/ycxxLnD/mmi8Wd3zSjZ
         d0pXaqr6SO5shj0RduRyjDUqkF6D8cKfI49sX5GyeVrPapigikcaqsT0WegYbq+hNwyf
         7ShnFtwYkyEAlD6ghtzcsjsDGHxOCaQFzsOJVWOUxMjh1SALmk5Xl4iCsc64fE0pHXP6
         BRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvz3fuKD0Ps0Ns8B4lM71ABdAhSMCCLzUQWTvWS8emC/EZ0SRBtbgsY/hJikitHeWmTihYQ7M2a85yHjGFpeln@lists.infradead.org
X-Gm-Message-State: AOJu0YwWBMMwWj1gJNRDzf3ZgJxzzZqBk2wHriZm9pQX+VV3YHJqgCGx
	na056o6wk6sX5uS82bLVLBcBTd7BwHhDPXarEpef4+loV4XUKsTLPWcEKWAuWUkdetGbMt3NIpK
	9Kfrb/a/vlffgYxnzQiAtzcYiheJ9keL8c4GTQE3Rhg==
X-Gm-Gg: ATEYQzyR36BBid72l5dL4pm689D/31dpXIvJf/ETpl/FVuO/CIixPjsdKF5gahs7lxi
	TbFCBc825CWZDFqw3TXSlid6fVe2IS9a8JwzVAokE0ksTzYtszo9An8eFTBdYOm7zNWumtgOomR
	C9lyFXmlpvQPmzLOU6/FeNlnTeBeqscP+GT2CF+AhBn3ote14rx4wAcOT7QE5gHHZXxrLvhL6IG
	zU2RodgsPzTh5cXB3/KJtX9ZUrGoCijRj5Te8RiHAd8RWYZWk18Z6lmrbV/4FwdSudRXU5bzN1z
	7sEryqO3
X-Received: by 2002:a05:6512:31d2:b0:5a1:db06:764c with SMTP id
 2adb3069b0e04-5a2796b6074mr2602865e87.40.1773915258920; Thu, 19 Mar 2026
 03:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org> <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Mar 2026 11:13:40 +0100
X-Gm-Features: AaiRm53xTSuLVdH9AhqcT-kXTsfPbIEbom5uTjkqz8fSS91buviGLW-90zzWxN8
Message-ID: <CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_031421_460801_E7343724 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, 18 Mar 2026 at 16:28, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On platforms such as Google gs101, direct mmio register access to the
> PMU registers doesn't necessarily work and access must happen via a
> regmap created by the PMU driver instead.
>
> In preparation for supporting such SoCs convert the existing mmio
> accesses to using a regmap wrapper.
>
> With this change in place, a follow-up patch can update the driver to
> optionally acquire the PMU-created regmap without having to change the
> rest of the code.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

[...]

> @@ -36,31 +35,42 @@ struct exynos_pm_domain {
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
>         struct exynos_pm_domain *pd;
> -       void __iomem *base;
>         u32 timeout, pwr;
> -       char *op;
> +       int err;
>
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
> -       base =3D pd->base;
>
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
> -       writel_relaxed(pwr, base);
> +       err =3D regmap_write(pd->regmap, 0, pwr);
> +       if (err) {
> +               pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
> +                      domain->name, power_on ? "en" : "dis", err);
> +               return err;
> +       }
>
>         /* Wait max 1ms */
>         timeout =3D 10;
> -
> -       while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) !=3D pwr) =
{
> -               if (!timeout) {
> -                       op =3D (power_on) ? "enable" : "disable";
> -                       pr_err("Power domain %s %s failed\n", domain->nam=
e, op);
> -                       return -ETIMEDOUT;
> +       while (timeout-- > 0) {
> +               unsigned int val;
> +
> +               err =3D regmap_read(pd->regmap, 0x4, &val);
> +               if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
> +                       cpu_relax();
> +                       usleep_range(80, 100);
> +                       continue;
>                 }
> -               timeout--;
> -               cpu_relax();
> -               usleep_range(80, 100);
> +
> +               break;
>         }
>

[...]

As a follow-up patch on top, please consider converting the open-coded
polling loop above into a readx_poll_timeout_atomic().

That said, the series looks ready to me, but I am awaiting an ack from
a DT maintainer on patch4 before applying.

Kind regards
Uffe

