Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35896CDC188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQZEDQv+DYGHiJeThn6idbNbtUS/DegVQcvXXoMYyPA=; b=bkKNkbTwj4KRUahmjUzFw9mXf6
	BWg2tcCISXlEDANklLHxqqWrLetPls2Ep3wbbSgEPyjSkSG/e16WlLnUemIvM0w3ilHuIFy37EMZj
	uAp+joQwVOMez2GEa4MugI6b4DfwYtmMeLlGbyQEF7Br8b8qDXKnvU786RISg2j6HgSV4TvYc2YYt
	XQ+CaltAhhmchnGhh8XSAFza3z39y4n/zTfiOPqk4/MiWVKAqCLuKGp9yc2FQDY032DjmXxTp0gRe
	O/cGcMYYsgDI8qFVqNg0KmvI8xu3f6/jz8afLCAMoz7gP6U7Q/Qr2ScbF7RipQCUV+f8coRonujDD
	7F+i7WVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Gp-0000000D0OI-3Ebh;
	Tue, 06 Jan 2026 12:34:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Gn-0000000D0Nx-24FT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:34:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D9AE44394
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 12:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBE9C2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702880;
	bh=4+orIZPsoech51NuQIOn2Zg7FT06+LCoqm268lCdbzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pzD/gsgzPaN2+8Vg6YMcHPXA+JBo6AqP8aE+V/hrryAm72KZBlyybKeOsk8GpCJLc
	 /OwwPgNuT+tr1MuTEcauYNO31PLU317uJTjPgSLYrvXktcI+h5f0Hs80lLOeKs9sGM
	 ciwXJAnTpx4Ol5ZhZ6LIYZmypDAe62kL9SHaCofqM7rgMj1r6GgZvqiUed+HFtVzmd
	 mEEwzbB1mbo7m+HZF5peJhAPf08lx5Ad92myryoGgW1ErlT94xACWRxOn07LYk9KSt
	 W6Kl2+jXiM5VKJsd0Nq1W5mJactRPGyTX9NOARLqxZ8qEjiMduLwWiU5+oNgRvgU3W
	 +z4UFsDnjXqxA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so11065681fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 04:34:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQ3L3wRqgiOSX2gFxWcM+/gFKbw18EnLBdHDDEwNmmAHyVpKHQcUPIYDv7tt5t5JWv0Z0F3rZsWt1G4xR8Xren@lists.infradead.org
X-Gm-Message-State: AOJu0YwIx4lsAlag3IiAFuz9qIXGyQ2Of9pjdOcv2K2dIFl9sKUqa9Sd
	LO4s4KZBGjwzB2f+tQbCGRPMJdnMVY3yJxWjfZdhALit+qhoewPdoLZgZdIVp2a9zJhMLnDM8fW
	J3EczIYYFQ416qIRjP9l2kz9I9gpZW2Trezw1bMGsIQ==
X-Google-Smtp-Source: AGHT+IFlaA7Jb0UAvj2/ADx9U7kF+/J52SI2sl5w+0mIAGkNff+OpGPevDWqlcbK5aCbGbh5tDkw5EZ2yIDJMwYezoc=
X-Received: by 2002:a2e:a543:0:b0:37b:8d78:e4bf with SMTP id
 38308e7fff4ca-382eaaff24cmr7493291fa.43.1767702879378; Tue, 06 Jan 2026
 04:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com> <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
In-Reply-To: <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 13:34:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
X-Gm-Features: AQt7F2ofSXIpLVNOI-neQtNGPzXdFSY34QulJ5QeYug3Q7OJAdE6o0yIqoiRcKk
Message-ID: <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_043441_592782_275FE218 
X-CRM114-Status: GOOD (  16.83  )
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

On Mon, Jan 5, 2026 at 7:06=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >> +static int __init psci_reboot_mode_init(void)
> >> +{
> >> +       struct faux_device *fdev;
> >> +
> >> +       fdev =3D faux_device_create("psci-reboot-mode", NULL, &psci_re=
boot_mode_ops);
> >> +       if (!fdev)
> >> +               return -ENODEV;
> >
> > This will always create this device for everyone who includes this
> > module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
> > call from probe() here instead and don't create the device if it
> > fails.
>
> Ack.
> Will move both calls to init before creating the faux device.
>
> psci_np =3D of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> and
> np =3D of_find_node_by_name(psci_np, "reboot-mode");
> --
>

On a second glance - and I may be totally wrong - would it be possible
to switch to using the auxiliary bus and create this device from
drivers/firmware/psci/psci.c? That would be even cleaner.

Bart

