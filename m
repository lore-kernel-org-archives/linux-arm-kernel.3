Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89600CE9D47
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CgfdWSR+nxpCQEaoYJ8x+78//P4Vl68i6y0D9SpJk0=; b=zLF2p66tcgUyTr7J2Cczz0yTZX
	tlecvQNzHaGjFpe9PtHRjFJdtW4XYnyUt9PQjpPbt8BWTrxU5lSkSlKQj8OJVOECcoHg55Fq1YUSN
	TqPOCgX+n1zTfyyDOh7wUhEPGHCoP0zvpJaaAeuCVFis7JhM/luYdl+iwEnwiOYrnEmjZp9CKXk9w
	hcwL2BrpBKwVlf6Xskn0rqv2eeWjK2K/BuvVlXB/9/tv0/iOzQtK+q9c3B1kCZcETtD7AYnlnZlgg
	pyhq7dNqStNsqLSe/qffxHbWquGjeSi0GV0GeUcrJ2d+C3OCndGQ88CG6QF/IZEL0OdImiL5pI19B
	8opZxw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8eT-0000000DMQ7-0Rly;
	Tue, 06 Jan 2026 15:07:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8eR-0000000DMPG-1qZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 305106014A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 15:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5D3C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767712032;
	bh=IQu1Edy/HWKz08uAYzo3PsbrFyGQXi8NI559zIHsYyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LwpLZ4Gv/rLh9TOdLjDFrTwucroei2WbfyfQ748EF/Mixcf1SBZ7zGqZnvN3Cl67f
	 G3QK9601kjEphYjnk4vmdZbVf3k/2hTZdTTy+LNeVt5x3G++qme34VifB+NJICW3vJ
	 09c9JKB3N8bg1N+oyoE39OERHvzumzFiSIObvrQx+DaaND/DEPHGRZvAnPS/seHHSo
	 1+Pxa3g00WVBkt02qKeOUAugvQXcehMej7dfbRiaqJbD+thxrzi1yFRdv5sPnQpBjO
	 oI0Uiz8GA0cZx2M4JzwK1SkdfPms+hGSpML/mW9cUOjE9JxmPv5KeuXRQN9dP7cxp/
	 8acHsRKVIWusg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-596ba05aaecso1085662e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:07:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWnnsx1ZFqFTAgWAeCAE4sC5rcUC2Nyd2EAvIyA+x80ttGv+jbdITmvJFMFIpFLUWKXWGzWLmGDOWmFjauHSw3@lists.infradead.org
X-Gm-Message-State: AOJu0YxpruH32LDh9I3pRdBX75wf3EmwL6oaebzAaQ3+HlDK6Pc+YtSy
	XYRSnMBEDhlmS8Y+9MtIDZRaogvVULD8uY3neL8KXicETs/GIgcuoQDcDkfkxZWOeHmC/iUKCKj
	mE5uGFH8nSZya3+wxlaVf7bU2Dcq4y3YVmSUOFP2D3w==
X-Google-Smtp-Source: AGHT+IHAOfkiONe5tfkuIatWxpK+1+BQ2Mtd3EKyiolyupo7EAbMOL0eppnic2LZGQzoSV374+2boUr3vUjOlxckYmM=
X-Received: by 2002:a05:6512:3f0b:b0:598:eb13:c14e with SMTP id
 2adb3069b0e04-59b652cb22fmr1135214e87.35.1767712031036; Tue, 06 Jan 2026
 07:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
 <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com> <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
 <466fac7a-e16d-9c49-80bc-c07ba5a5f334@oss.qualcomm.com>
In-Reply-To: <466fac7a-e16d-9c49-80bc-c07ba5a5f334@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 16:06:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdNfW9pafvWy8L5iv5StR1b4_jghL7j-08cyPZVeO1Mag@mail.gmail.com>
X-Gm-Features: AQt7F2phEQiXdqhKlEbA_1Ii19T6QcgYifTgwXE_RDm9f9TtDMKssHYYLEX6HPY
Message-ID: <CAMRc=MdNfW9pafvWy8L5iv5StR1b4_jghL7j-08cyPZVeO1Mag@mail.gmail.com>
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

On Tue, Jan 6, 2026 at 3:45=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> On 1/6/2026 6:04 PM, Bartosz Golaszewski wrote:
> > On Mon, Jan 5, 2026 at 7:06=E2=80=AFPM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >>>> +static int __init psci_reboot_mode_init(void)
> >>>> +{
> >>>> +       struct faux_device *fdev;
> >>>> +
> >>>> +       fdev =3D faux_device_create("psci-reboot-mode", NULL, &psci_=
reboot_mode_ops);
> >>>> +       if (!fdev)
> >>>> +               return -ENODEV;
> >>>
> >>> This will always create this device for everyone who includes this
> >>> module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
> >>> call from probe() here instead and don't create the device if it
> >>> fails.
> >>
> >> Ack.
> >> Will move both calls to init before creating the faux device.
> >>
> >> psci_np =3D of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> >> and
> >> np =3D of_find_node_by_name(psci_np, "reboot-mode");
> >> --
> >>
> >
> > On a second glance - and I may be totally wrong - would it be possible
> > to switch to using the auxiliary bus and create this device from
> > drivers/firmware/psci/psci.c? That would be even cleaner.
>
> Till v17, device was being created in psci.c. Lorenzo wanted to move it
> outside psci similar to design of cpuidle-psci.
>
> https://lore.kernel.org/all/aRIfc9iuC2b9DqI+@lpieralisi/
>

Thanks for the link. Right, there's no actual psci driver binding to a
struct device, rather we only have a set of functions called very
early into the boot process.

Nevermind this comment

Bart

