Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D4810ED674
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxHajuKfUQES0XX2o1zU8mCoEkLzDO2fAuUTm7Lo5Bw=; b=wYWoQhxfiuaCXBufUlsu0yukLx
	E405rLv8q4p1kMRhC6vZMma8KLx6JJUvrxY/5l3uWRsLTjdUeqAux4HyDwrdAuGXeu1mS953G7VKJ
	Mc3PWKalyKKEFW7nGPuNeEfHMFK4zM5mVg/UjLjCzpqPckNj1OTs1bQJLCwq0XCoMTbwgZaiD0OP4
	E0bbStZM2c8UDESweZum9rc5HPb2a5iapV5xHL4E1ED/lH8BtGgpsegP2qJg+/YGNXI4Pnl4Pqdqx
	SwKiPj5gMpT9MJ6F/YQZHZ22cbayVSLBqQtFH1oe2mivE3SR20yeGwWdAFP49/hAmlniVpfT0qLj0
	mAhyvRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67ic-00000007V9k-0Ef2;
	Fri, 27 Mar 2026 13:59:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67ib-00000007V9W-16qK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6AC960132
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 13:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3D9C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774619960;
	bh=8xzdYoi3gi518bjSufdEEG4WtJrX0WYlJOv7k2yVMAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NZKNTyI/kBAnIR0HZvkBqOTDvrCbjhLEUS/OH0E+5lR+Fw4M4UKzhS87SAxD944QF
	 Zls3jH8x6EPxptfI+8vWACCOiBccBJbkMTp7utd0irXgITCxyauMELtC+u1H2XVFzx
	 wB1SdRI0gvIsrprLra9WIPbabuHAuDsAGz0VmyOtipr7WtCysuTeWO/O13xKx77Lf7
	 W5FFA6bjO5D3X2oC9Kzmd8pnb1lYs8uGFOjfOYD3lsSAF92ep+YKUVfBNF77w544Te
	 cPtUZfoUuH3xkUKxCp5/RJQE43CzZXibvnaISxkT6ZxSe8HU6EOAfAiaRe3mOGMLjl
	 42Tu60owotsGQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2ad56dbb2so464561e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVea1B8EbG3TQIRVpoLeRkAbUYcAPJYypZajx1k7smqdt8Xt4OhQgBVQCAZbOKZbeTqGgMxsmiOWKrXHxj1/Hey@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+QzdU1Ydks31w8CDFHUwYpv1ktW6THgcwDSebEMQnWsi4V2zg
	V9pi9OAKNuWwU65S9VALqCOBbjgtpXZWrPv0XZr2a7ZyVAzltVcA2+mHP4cCBdVzVf3YqSwFhai
	CRY9zeRgPQ924fatpLPdhrJxqQ6E8GH3lB6P/+dQyUQ==
X-Received: by 2002:a05:6512:318f:b0:5a2:8450:edad with SMTP id
 2adb3069b0e04-5a2ab93f8b8mr904034e87.45.1774619958969; Fri, 27 Mar 2026
 06:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
In-Reply-To: <acaMPgRALnoUIHMC@lpieralisi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Mar 2026 14:59:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfRWDava8jyT90ah1LBK3udAgcTCc7q-S_Kb4U3CR5smg@mail.gmail.com>
X-Gm-Features: AQROBzAnj1Wvu_HThCZA2lw78sbVKD9HXLQMgd3NlSn5WjYR9EmBsH-p5sQhJxg
Message-ID: <CAMRc=MfRWDava8jyT90ah1LBK3udAgcTCc7q-S_Kb4U3CR5smg@mail.gmail.com>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 27, 2026 at 2:55=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> > +
> > +static int __init psci_reboot_mode_init(void)
> > +{
> > +     struct device_node *psci_np;
> > +     struct faux_device *fdev;
> > +     struct device_node *np;
> > +     int ret;
> > +
> > +     psci_np =3D of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> > +     if (!psci_np)
> > +             return -ENODEV;
> > +     /*
> > +      * Look for reboot-mode in the psci node. Even if the reboot-mode
> > +      * node is not defined in psci, continue to register with the
> > +      * reboot-mode driver and let the dev.ofnode be set as NULL.
> > +      */
> > +     np =3D of_find_node_by_name(psci_np, "reboot-mode");
> > +
> > +     fdev =3D faux_device_create("psci-reboot-mode", NULL, NULL);
>
> Same comment as Bartosz (have you picked up his work and working towards
> a solution) ?
>

Hi Lorenzo!

Yes, I suggested creating an MFD driver binding to the "arm,psci-1.0"
compatible node which will have two cells: one for the existing
cpuidle-domain functionality and a second for the new reboot-mode
driver. This way we'll simply add a platform device as Greg suggested.

Bart

