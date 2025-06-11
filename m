Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6393FC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=; b=GMHkl8TbgDc28VRJ/3abJXjVvT
	J//tezCyJnDGtjL8GKNLEoVhyDUcIkwoVvLjkmb3Agqjqn3VG9HQzR3w9lUGy+tOj7NOOg/rPTwke
	SsyWpoi5AT5DyOaRVXfE6G8DuVNxgMk6ef1m9FV36kEB1AmBTERxUo3Onu5VqZ1e2aLNOFtNTRCyc
	ApyPOh2VzGtxrsFuZytz2fUiv1TPz+an94625QQArlS+vfL5aHxIJPE+FyZ9QSZkmDkWyFhw2WLC2
	r6ZIcarWxqW+XNS1PYQmprnDmRmGZlVnejOzXkAZbC6wyBLp6lEvA69fgGRf50DUQbehiIeTcrQGh
	lmQjsF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkd-0000000A9L9-3BCW;
	Wed, 11 Jun 2025 14:48:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHGv-00000009Odi-10uL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=; b=ldLW7GlL4pvBwH2vI9jHtPkej9
	rzgEDhpGFfyaolbj9Pib39WL6RpgEhQxoPNm40GOjskIQ0uy9sKkvW5+0wYc2L27daDLyq8TizcSu
	LVGnMuMQAoFnHzeNErQ3mkE0gS0x8FTyrSxmu6hGv1xCyPTlwi/9rdBt7i0nherf7no36rCueZpYb
	EQidx41Ft27Bn0SgBiVRk/i2YergiOffXS/qWHthD1zD4y3kvGH5WimkCZp3aZ8eUg/aonZaWa5Ji
	E1YKTT0P/Im73YW+SpfasuOog7A2aQfZHNiqSXzQydyZwcLqolV+dQyknj2tofC7Dlt7eUCFFWbKw
	bCmrTQXQ==;
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHGs-00000002DFD-1g9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:57:24 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4e7ade16082so507219137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632238; x=1750237038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=;
        b=QJ6wHPKF07ZDVj6a6+5QQgbIs0oLIOEEkRDPLnl6KCGJzHq7f5MWUdY3WcqV9x0q9c
         pi9Se6eaIdiweYllr4TPYpvVwHX7IAGMMV4gIXFahPRs9JSu20s67skp6WNIabk6D8Pj
         FxIA/970O5tMAp/4u0+xcujKXXrGRiKuj2KOR1B5mPFbIVxAzMv8HWQyCYjQ5CKOGz2n
         GWQqPJTzrpNVJ6U1V2T9soBBqpGFGMd0w6+NHbAka8pRxHpeza6+UfHMJIIsEkN8sGyC
         HUjpJp057959TI58i0GDeoUYsJejqV5HoTKTi+mZj7TDOVkKu1lclUaxQK8kMlzkQ8tM
         KJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632238; x=1750237038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=;
        b=amWgeXaZaBpxyVgp0G5yYwmM+K+eFRdtWg2PPl2Trw/+oQymLknBQeTDgGTFF551qY
         LwooLE6YPB+VMmVWzo98XGYK6JLTq/dp7DarhMsvdXYJe/MQNKCIH8+7WZt1dln2ryoH
         2s7dZGZQS3LXo0l/6+hbeIbVbin++VTZi7nXerCBGaHjDECG7vLZ9hALR9xAMeNw2Mtr
         mB7ABxE6WvTIKDgvsID0BtCie99VuzV1xnykWBijrU6x8aJFUGH9uTikY6GlS9L76Dzb
         vyr3eqcNJNbkHZuGVfBQ3elXffuednb2UmPS7jkZMAAagUYOwynO+V7Gjs0Mv8XUcxc+
         tuVA==
X-Forwarded-Encrypted: i=1; AJvYcCX2St19742m61MD6ipAszeynM2m/wOKZBcrDZ7N2/cbWQFIbCpQ69Q+HTj4bG0JMCauzLo25MoAmKcmSGGK9iym@lists.infradead.org
X-Gm-Message-State: AOJu0YxDGqE6pK4jUD/N9+qZMi/l3N4qQIuDvMyYuGZN2tfeNh9nSiy/
	l2x/lgtWuUurRtprptxSzSMSV6RsDibPil9vDgWf7NPIfpgS+Chk+jG636kGunYg2DWCw4O9d1Z
	AtPvkfQ0bgMoVlgKAa98tYBLR2eg/c9qSuGr6e22daw==
X-Gm-Gg: ASbGnctVIqkrk5h8J+01b1lBg8ix54UMj7x0Fp9TMqA8d9rn+buXzXx1pUhuALJIQdQ
	KzntgKSkokV+nkWO5ymHxg/HHQDgOBHKzfYkEQUvRCMLVHZy8/KLq/QCLczzi6OibrfJaQS350B
	rFCWRKFSWxH+ZpLZNPuRA9LYDzXkNNnUP5g/ixWcBLomdgjnW4UJwzAnEh5JY3Jjzwn/IuhdhzA
	gNW
X-Google-Smtp-Source: AGHT+IFQXF+sKGFKqYzvIWVQbzE1S3LEQpj/qr+Mjs6PmUNCe9qyp66456X1HYoQ3EeWcUwMf1iYDwClQBMee+auP2M=
X-Received: by 2002:a05:6102:2b8b:b0:4e5:a2bf:4fd6 with SMTP id
 ada2fe7eead31-4e7bba95fc7mr1734093137.8.1749632238461; Wed, 11 Jun 2025
 01:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
 <15979303.uLZWGnKmhe@diego> <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
In-Reply-To: <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 11 Jun 2025 14:27:06 +0530
X-Gm-Features: AX0GCFuVYEyn4auVNPUyj-VnDVcIp7H9e0QdsmhpYhaxmLWCVhksJEW8y_9TvVE
Message-ID: <CA+G9fYvk7kBqDqPSxndxG2CxxVxhNrf4Easp-aYrR=UeTS1=eQ@mail.gmail.com>
Subject: Re: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_095722_575910_D9967AB2 
X-CRM114-Status: GOOD (  20.06  )
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

On Tue, 10 Jun 2025 at 17:07, Anders Roxell <anders.roxell@linaro.org> wrot=
e:
>
> On Tue, 10 Jun 2025 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> >
> > Hi Naresh,
>
> Hi Heiko,
>
> >
> > Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Naresh Kamboju:
> > > Regression while building arm64 with the Linux next-20250610
>
> [...]
>
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqD=
gmzjEl7VszYE9/build.log
> > > * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds=
/2yJ4IOQa1XxMqDgmzjEl7VszYE9/
> > > * Kernel config:
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqD=
gmzjEl7VszYE9/config
> >
> > thanks a lot for this notification.
> >
> > I'm surprised that overlay build at all when I built it yesterday.
> > But yeah, the dtbs_install target really broke with that change.
> >
> > I've amended the commit now [0]
>
> Thank you for the quick fix.
> I applied your patch and built it, it worked fine for me.
>
> I built it like this:
> tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> --kconfig defconfig dtbs
>
> Tested-by: Anders Roxell <anders.roxell@linaro.org>

Thank you for providing the fix patch.
I confirm that the reported build regression is no longer present in
today=E2=80=99s Linux next-20250611 tag.

- Naresh

>
>
> Cheers,
> Anders
>
> >, to change dtso to dtbo and ran the
> > dtbs_install target sucessfully with that change.
> >
> > So on the next linux-next creation, this should hopefully be gone.
> >
> >
> > Heiko
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac65=
754f445
> >
> >
> >
> > >
> > > ## Steps to reproduce
> > >  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> > > --kconfig defconfig
> > >
> > > --
> > > Linaro LKFT
> > > https://lkft.linaro.org
> > >
> >
> >
> >
> >

