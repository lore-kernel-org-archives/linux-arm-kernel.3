Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE70CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=; b=pvOrvUQJ9QSeUC1CrwdBX72amG
	5J60kjFuRtoWu8B1C/eSOdf0AoO2r5B3zPnYXSgK/ZFv3Ja/m19fhsPFrVPMwdY/VGoxlMM9IXJ/L
	632BLrMhBpuSxA41yVHHehVs6JwDb7YfqKonWoMUbZhSVuzXqexU8sGW+E2wYgoeEDWJ5iFHfg7ur
	mhA74Qnc9SxDOE4UhaF23gPSfNqCCbnN3oNQVP0YAQqNSPeXKke3kHECkrZsGO9o5nlKAnSIU3HT/
	/hcV1a6aKqBNFLRAKx/CsDY0uJp3RXxs43QQR4MiJydVemznOm+xHxc5++5KTpQDCa5KryZ7swU+g
	x8wFUi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95UH-00000002Sq9-1jr7;
	Wed, 15 Oct 2025 17:40:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95UF-00000002Sp8-1yqR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 17:40:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-271067d66fbso65683505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760550031; x=1761154831; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=;
        b=YWltN+HgVRYhoHbw5p661sgJnOR1aIwp+4FI/yT4m2iPuMwl/lJw+nrUzeDJYD2Ine
         ReyeP/N83WLf8TmnDPQ8WZ6bzRCu1Z4DF3hGsu0zhdh/Ni7qZxqmyxYXjO20UkataH8Q
         XltP+lpbnSDLoETtoBySnHLa1aB1jOYgpQCVCLk27v+Ra6vzt7MfXO0f0cENoX7yCJk9
         DCJAyN8QJCBxpdslq8S+2yO3n0LoHCPeT/NNcMYrMWJ/Bn8HwdOUZpAGA9DcmjSErjAr
         D3nk4lu37u6Wt2dBs4QdWmCov2NkVxtOYdlEwvy37nMph7VzWYB8EjeCMttEyTKdacxd
         Bltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760550031; x=1761154831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=;
        b=OoKYlhRHViq/W7ZihqKCXu2myqZPeOCkLFEwRC3AVnVVzW98qTZ0nyPnVshF2oXRBI
         0jXFOQrTz/h6ASb/+d7Ej3b3uShIzvyid3xEKOcaKy2zqY5kDW3pw4LS5uUT59/3UP18
         ppJpodtAXGYoYRzRU5PDieskUiE4W127QcDXYgPdG0/XIaXAWRrxkfk81JPjfUwgjhye
         VG9HBFoHsb2t6SerIefA0CU4qAgi2Wt8d2h7wpbQCpPnO2h0HzlfwGRz8m6oA+66r6pz
         dqZqAU/wBNf8BkRWxxdAB8pItZ+69PHCIABHJa5LRMkTkHJ0iyAQRttpxJ7nI4IkHBWz
         XLig==
X-Forwarded-Encrypted: i=1; AJvYcCUd2gwSu1mH6ttO05IpM/AGDkCK6f09CRrBdguYA0f7hvmxHGeFA2EIiHXEvfQNQIWVLGJ6M/1GUAqyUDrxKVIk@lists.infradead.org
X-Gm-Message-State: AOJu0YzDnTCk0NSyYFnefpEzJHM4vFsf2lWL/jaEvzDYYdDMaEx73Aq7
	OAlIacYle5d1hpmymMh1ITEVOJlE4NUPK51jykWKvuDQAOvsB4OJG9h3WO0AGfqPIRfJ6jDXOac
	T5dTRvfNI16qypouBpGAKqywSbiinYZsU51eEbrgB
X-Gm-Gg: ASbGncufk0m+O3s8peA8k4d7YbfsxaQW3o0F7Hp+6Z0S5R6H9cDASRKEwlVxP8ehRKA
	o6vpSredbBnC3dXJngxzrRK8JzToxVJtMx3iF5h3DH4OxSlwsZYtvLyjedXLdFHno1ry8xbWK+I
	6JjR/yMebvEb6PpQFmToCX3vvXAqLws18wOWF5znXkaB2v0dkIrKpAxxw4G7dnKhp+sSaUnAHso
	Sh9AMhzvw93akNvt6xVrFEwpJPNgldg3gJFpXIuja6MOIL2S1Rs5UPeGZvZPk/F8Q==
X-Google-Smtp-Source: AGHT+IGtM8hvN4lqZlO0WHIvTbL3D48lIHd91NHDkSwH6JM5GHtQa8Pa5RXv0ZasuodiKcuODGfruyjdLC0lq/iK870=
X-Received: by 2002:a17:902:e94e:b0:279:daa1:6780 with SMTP id
 d9443c01a7336-2902741cf99mr376217665ad.52.1760550030102; Wed, 15 Oct 2025
 10:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-3-royluo@google.com>
 <20251015002744.sntua4kqidgusafo@synopsys.com>
In-Reply-To: <20251015002744.sntua4kqidgusafo@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 10:39:53 -0700
X-Gm-Features: AS18NWDkbrVxIDG8dAIZI0TtKFaXgEljVUvTQC724DiczltW9oPtD4sVlkXhIBk
Message-ID: <CA+zupgxbGjU_01JSFR_-2humZAyxwcVT5JR6h6mTVUT=3fFQ6Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_104031_513030_4B0367DD 
X-CRM114-Status: GOOD (  18.60  )
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

On Tue, Oct 14, 2025 at 5:28=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> Hi,
>
> On Fri, Oct 10, 2025, Roy Luo wrote:
> > +#endif /* CONFIG_PM */
> > +
> > +static const struct dev_pm_ops dwc3_google_dev_pm_ops =3D {
> > +     SET_SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_re=
sume)
> > +     SET_RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runti=
me_resume,
> > +                        dwc3_google_runtime_idle)
>
> Can we use the new pm_ptr() and *_PM_OPS macros to get rid of the ifdef
> CONFIG_PM guards?

Yes, will replace it with pm_ptr in the next patch.
P.S. The kernel test robot is also complaining about it. [1]

[1] https://lore.kernel.org/linux-usb/202510111335.oyOAs9MB-lkp@intel.com/

>
> > +     .complete =3D dwc3_google_complete,
> > +     .prepare =3D dwc3_google_prepare,
> > +};
> > +
> > +static const struct of_device_id dwc3_google_of_match[] =3D {
> > +     { .compatible =3D "google,gs5-dwc3" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
> > +
> > +static struct platform_driver dwc3_google_driver =3D {
> > +     .probe          =3D dwc3_google_probe,
> > +     .remove         =3D dwc3_google_remove,
> > +     .driver         =3D {
> > +             .name   =3D "google-dwc3",
> > +             .pm     =3D &dwc3_google_dev_pm_ops,
> > +             .of_match_table =3D dwc3_google_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_google_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
> > --
> > 2.51.0.740.g6adb054d12-goog
> >
>
> Give me some time, and I'll review the rest of this patch.

Thanks Thinh! and a heads up, I'm splitting this patset into
two separate series as Krzysztof suggested; one for the
controller and one for the phy, so the series title might
change in the next version.

Regards,
Roy Luo

>
> Thanks,
> Thinh

