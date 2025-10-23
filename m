Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EDCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWquFxQQ4MHJSF9//VvQ/C1WhYfIG1u7wl2C5TWDxwA=; b=a1B1/QWsfvn7xSd4SvFgi+PA0u
	zG+NR7g3H6CNVtU2KC8DR7/BIuzGwg6WQdIZ/9sPTqlBaamR7cf9UOeBR7op4wPZBhBHNyQNxFQ3W
	7JuZ+UgZ0QMEt9h1oDfn1qr1o2qcP6iW1KVS6c5OB9B/rhBj7vtSrLqCD2rWfq2tVgKVxyTsaQMDf
	QvQt0gDujI4TA/hiSXFRfZuWHQo6zMsXO+GhmHXyzI+FZIbJtw1zKZ97x9rAla85Xd+5xdDpSpE3V
	/+WCaHMUbnDcNEE8Yc2uDNiPt26h7rIHGl1R7A61Rapyf75BGAeHMqu9Vip7vsSESreVzmqDxEFfQ
	7KyaDZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsAJ-00000005ojU-2ba8;
	Thu, 23 Oct 2025 10:03:27 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsAH-00000005oir-1zE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:03:26 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63e3a7a67a4so685062d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 03:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761213804; x=1761818604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWquFxQQ4MHJSF9//VvQ/C1WhYfIG1u7wl2C5TWDxwA=;
        b=D4mSQkGepgxO7gsJZs7cQh/iGI9etwHkkpban6D/Ioyh2Wfn4AXmCWJLUJ7zr5c6Is
         spsIJPuvc7wZ4h1b8tHC7f5IRSBRuwK1/L8CDHJs2l7YkVrue4SosILVXJ45ozCHuwaU
         cs4SZ3Xg/T4MFYC8VNcwbVyrjhDA0wdoS3+mYsqF0FlHjrgj5Ofs/VToaO8gMKz4nh9i
         OEdiFhhFkIzuDUGB4I9fNMQS+tyU74tqG4xy4CwtwoVXDdcXgIwke5c0rzT6f/FccY8T
         ljJeQMn/2GNUY/JVLQFhD6wSwaU4nmjU2vSJ+JnSnTWxTlSE9jSR/7oI/yQqlqGEdSG/
         lU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761213804; x=1761818604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWquFxQQ4MHJSF9//VvQ/C1WhYfIG1u7wl2C5TWDxwA=;
        b=DXZ7SoZ3bewkDYrGhYxo5sUyJE7o91OmMujpRwGlyCGQpZdrAfal+dgi89QoIGzdym
         ZBvkIj+xOYaBBuAQ2ZlQ/+YWfM5VN6C0nnArjx9MQJ6xQOpQZgX41naLUgZYfb32KqIB
         Ahp9pZZVmxiWX16auv8sOk9OCrFlw00L4c/dplrY05xTfvMVRZ2zQt6aQs3pW0ZjpNmk
         6uAuRXYuNMHrnJSS0lQHIYoMFb3dAVP7yjI4eO043mfQH8tJSsL6lRRalt72qxMZDDw2
         y7P4lR48qUtFJ4bxOsR4jQJTLyMHVjNq9yyGTT0xdwJdd6I8/KK24tgNLMFjtPoUYUIV
         NPWg==
X-Forwarded-Encrypted: i=1; AJvYcCXBgRLPEs9QtsTVoTFEAzdnGzk5ExElD1B7leink8mgwPK9OaLXyXRQvvbb9LhqXM/rcfj3px62zDj4mVBUQ64x@lists.infradead.org
X-Gm-Message-State: AOJu0YzPKlQ2/Rp+XbihFTp5VMHahScmBV2I2GCOl3qMi75rHMah6rpx
	lucmFLpI5pkrFX+rFsZ6xZn0ymLV+M7YvauepsOKGmSrXYAW8nBALWx4hZYbeqspGuA3Tjt07mD
	WDgdmaTxz6J9RLKOOQ1XES+cz2+g1Uwezm15tBSB5wQ==
X-Gm-Gg: ASbGncsYlD5wF7yIrxhGbKn1DLCAYyTUWMybt/02+GNkASpXtFuF873bgme+F5rYZTu
	Wh5Ql88J2dzrQqvHw7ggYnxmM2FPOO94YOOcVbHNAex8JUBmnwT1eFXW8/1nEKxTzmTj+sPJ7mf
	rOXnp0GAo3G7wvHlUoNeAo8GjwG3mWptYxEBtcByjS3qPrcOcMOR/3GH29laRG4RVNWHGL058nu
	WgBqp1HjBniAWrPvI+gVQLPvfCdp7u9DfP7PK1MUw8JhBPR7fZOJ2LnbTkZog==
X-Google-Smtp-Source: AGHT+IHYTuBS5tdkgCmTIC44x/jualH/JELvua1Z+qzp00tin6cE2MKOBedS1C2f62vL4/dVJ0lyn45HjIoQ+rR7MQ4=
X-Received: by 2002:a05:690e:c42:b0:63e:33a7:cdf0 with SMTP id
 956f58d0204a3-63f377d2574mr1315040d50.14.1761213804328; Thu, 23 Oct 2025
 03:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org> <CGME20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21@eucas1p2.samsung.com>
 <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com> <57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com>
In-Reply-To: <57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Oct 2025 12:02:48 +0200
X-Gm-Features: AS18NWDk2cnwAbu5KPIINOVhITzbpKKTXME95wNCKMMbO1h01gk_WEP7weXC8KQ
Message-ID: <CAPDyKFrCS1PGwPeZd2ahZ=wKXCqPj93qAJ7V-ELELLA_OwgdSw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced sync_state
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_030325_526382_AC9D38A9 
X-CRM114-Status: GOOD (  34.16  )
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

On Wed, 22 Oct 2025 at 20:39, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> On 22.10.2025 13:06, Ulf Hansson wrote:
> > On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.=
org> wrote:
> >> Unconditionally calling of_genpd_sync_state() causes issues on
> >> platforms with child domains as the parent domain will be turned off
> >> before the child domain was even registered during boot.
> >>
> >> This in particular is an issue for the upcoming Google gs101 support -
> >> all operations on child domains registered after the parent domain
> >> misbehave.
> >>
> >> Add a flag to the probe data to be able to sync_state conditionally
> >> only, and enable that flag on the two platforms currently supported by
> >> this driver.
> >>
> >> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >>
> >> ---
> >> v2:
> >> * use bool for need_early_sync_state (Krzysztof)
> >> ---
> >>   drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pm=
domain/samsung/exynos-pm-domains.c
> >> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb=
681600d9415369fefd 100644
> >> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> >> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> >> @@ -20,6 +20,7 @@
> >>   struct exynos_pm_domain_config {
> >>          /* Value for LOCAL_PWR_CFG and STATUS fields for each domain =
*/
> >>          u32 local_pwr_cfg;
> >> +       bool need_early_sync_state;
> >>   };
> >>
> >>   /*
> >> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_d=
omain *domain)
> >>
> >>   static const struct exynos_pm_domain_config exynos4210_cfg =3D {
> >>          .local_pwr_cfg          =3D 0x7,
> >> +       .need_early_sync_state  =3D true,
> >>   };
> >>
> >>   static const struct exynos_pm_domain_config exynos5433_cfg =3D {
> >>          .local_pwr_cfg          =3D 0xf,
> >> +       .need_early_sync_state  =3D true,
> >>   };
> >>
> >>   static const struct of_device_id exynos_pm_domain_of_match[] =3D {
> >> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device =
*pdev)
> >>           * reset during boot. As a temporary hack to manage this, let=
's enforce
> >>           * a sync_state.
> >>           */
> >> -       if (!ret)
> >> +       if (pm_domain_cfg->need_early_sync_state && !ret)
> >>                  of_genpd_sync_state(np);
> > The call to of_genpd_sync_state() was intended as a temporary solution =
here.
> >
> > Potentially, if we would be able to distinguish what PM domain that is
> > causing the problem on the Exynos platforms, we could set
> > GENPD_FLAG_NO_STAY_ON for that genpd instead.
>
> Well, this of_genpd_sync_state() "workaround" has to be applied only to
> the power domain of the display controller device. It can be replaced by
> the following check on the legacy Exynos systems:
>
> if (IS_ENABLED(CONFIG_ARM) &&
> of_device_is_compatible(np, "samsung,exynos4210-pd") &&
> (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP")))
> pd->pd.flags =3D GENPD_FLAG_NO_STAY_ON;

Oh wait, perhaps better to just power-off these PM domains before
calling pm_genpd_init(), if that can be done safely?

At least that would guarantee the reset to happen before the display
driver gets probed. Instead of relying on genpd_power_off_unused()
(late_initcall_sync) to do it.

>
> I assume that this information cannot be coded in device tree to make it
> somehow generic...

Right, in principle we would need a new DT property for a power-domain
provider, like "broken-hw-reset", because we don't have a reset-line
to pull.

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

Kind regards
Uffe

