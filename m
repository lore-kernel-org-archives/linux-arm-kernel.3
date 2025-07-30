Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9CEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNJc0MhKyem6DJ9KMPfzr1zes3FYUQgDKGyo+jiBCKA=; b=QG9zVy7A4v4hAtmuONh+nC8eWR
	l8N6Cu5HpLmEtafz8PiIkm1Ui8LvkXIXq/aRQOyO7LFrYUN9qe7hi3hbn/M1yawpRiRpWSLnqM9MB
	Vmmvj+jyoK5K6Yg07v8WLCKFxKs2yzC8Ornb/+2jbMkj+mhNR2hZ1u6WEWToOuZy+6K2aiDDVdLgS
	tlxHWmVnyqAkrS7hyBmj/PeGfZWvzWgf3/x5WA6xSRPmg+ywmbEqRStAIMHBSg+Q1h+QX8owOIgGP
	KX5/QXVVD8O5tGbDkDMnXAHraVzNzvV/ml/vqq4/0h/VmblrJ+DwBrVMHeA7DGqIO1iEvkCM2DyxA
	HSK+f0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2Tn-000000011aS-2tcH;
	Wed, 30 Jul 2025 08:48:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2Qe-000000011G2-2Q4X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 08:44:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45619d70c72so4714185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753865090; x=1754469890; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pNJc0MhKyem6DJ9KMPfzr1zes3FYUQgDKGyo+jiBCKA=;
        b=mvT3NZ3fnYBj/Mw83ODma0r/+t0d+b5ssh38T0OpnxPZfDseY8tAofGVutbgoRqjXi
         1jHlDgB5soVBsxUVqnwb1k1Ha9TsZUG68FfWU3k+XimQEWpV3nxkT4xeuaDtMUha2Hel
         XCODI5nMH4CdCv/JMB9HUX5iLi47tjK/sIeJLgnTsfgTyGJ9zona6VdE8rc4BnnRrfg2
         1jL0gs4BmjzTo0Iqtd3Yz9SfP1Trtgl/DPYzkOTgQWstAYW2ml8TqqOlvwNkMV9NawlJ
         kqxdoxpe3y12p4r6kJ5jWencdz2RSuEckCB3LRjJ6f/jAi/X2/l8HxxsPzrzIM1njyXE
         HLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753865090; x=1754469890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNJc0MhKyem6DJ9KMPfzr1zes3FYUQgDKGyo+jiBCKA=;
        b=Ky0mZkD61gSPTgNno8jlx3ReNbHa3fpR2T81Bk9Noihp3fjSO03mwmGSKnU7ZCAIni
         eSRC1EkffaF6E80W3FacSamoJE1py+Y8AtCbhiMwD8nrFJ9n0WlkJ345qgofze1YsYCa
         5BmEEwhCLq37vLnp1QjHIwi69mzdtjhol5FryxwepZ/tZJJh3bevY6JsPAzSC+UNOcs6
         QWaMG/cb26uGR02GaZKqqzFVgxeZ6MxezAAvhKn57VspL7C3117RuPBigGMUCYMJMTMh
         DPtkd3kBLLjIimQf0b02fDDv++sN4D9HfidWHKVO43YuhjOHHk5LbR9txQeR7F5aEy8H
         A2iA==
X-Forwarded-Encrypted: i=1; AJvYcCVdhOP2ANyz50cvzq8ZNq4C+uK109dR2q6QO/gmSxva+9Dk1kI0vDD1Ugnky8xdX2bxf0eKfZJUx3Vklr4E/pxf@lists.infradead.org
X-Gm-Message-State: AOJu0YzHlSiU0MagdXnZWCCCdx0JnEnFzKp6/SRqMFEKq0hMFkgm4T72
	Kg78rp8/0BbfOMRgsYJ0/WMID0kIl7d+R+Vip6rVykwQr5uJ+3/iEuZEi3/u5SWQYsI=
X-Gm-Gg: ASbGncug0BvbTCB10htsz/J1AgJGm8C9SH0xI0wtsINhdoFzZG1c99BYHeXCuP/aLvB
	EuNlQOfNgoSpHxNO2WzX92xNf60w3+98JgyDWTVP1zGkqo9FiBcTpn0szx1wCh5omgiZZBW+ZbJ
	e9RHlGJCBT+kjjcyQd3gzuJj/dTGPOapdudngwKGAWOvpABffTdgPjO+Eoy+RBzsSvf1RzxXdR9
	r05w0hzyCY2nD0YPTZTit+imxrOc01Day5h1aLrn1LM2EybQIH46UeDf0aryyQvolbA6WEKnxa3
	be57Dda8dkY/GwDpcpFB/Fbz5weaZZwqHFyMW+OCTnt9xKjknGDgbI6m5pocRgcSXFt6Jj0QioZ
	vMn3Cb4S4qynn4dlX2p85U/NVDg==
X-Google-Smtp-Source: AGHT+IFifdJ3RFvCYy7icV5bmFoBw6S3AjQmM0nH3OcGn2ldcETMHgAeTiCZi2wsWZ7N/6oYzxdvqw==
X-Received: by 2002:a05:600c:78f:b0:456:12ad:ec3d with SMTP id 5b1f17b1804b1-4588d17968dmr38218165e9.14.1753865090327;
        Wed, 30 Jul 2025 01:44:50 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b785258135sm11141357f8f.42.2025.07.30.01.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 01:44:49 -0700 (PDT)
Message-ID: <b45b157593f1865a402f4098cdeafc298a294c6d.camel@linaro.org>
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>,  Sebastian Reichel	 <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Sudeep Holla	 <sudeep.holla@arm.com>, Souvik Chakravarty
 <Souvik.Chakravarty@arm.com>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Yan	 <andy.yan@rock-chips.com>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio
 <konradybcio@kernel.org>, 	cros-qcom-dts-watchers@chromium.org, Vinod Koul
 <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Florian Fainelli	 <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha
	 <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
 Srinivas Kandagatla
	 <srini@kernel.org>
Date: Wed, 30 Jul 2025 09:44:48 +0100
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
	 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_014452_760181_7F5557B4 
X-CRM114-Status: GOOD (  33.27  )
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

On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
> SoC vendors have different types of resets which are controlled
> through various hardware registers. For instance, Qualcomm SoC
> may have a requirement that reboot with =E2=80=9Cbootloader=E2=80=9D comm=
and
> should reboot the device to bootloader flashing mode and reboot
> with =E2=80=9Cedl=E2=80=9D should reboot the device into Emergency flashi=
ng mode.
> Setting up such reboots on Qualcomm devices can be inconsistent
> across SoC platforms and may require setting different HW
> registers, where some of these registers may not be accessible to
> HLOS. These knobs evolve over product generations and require
> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
> reset which can help align this requirement. Add support for PSCI
> SYSTEM_RESET2, vendor-specific resets and align the implementation
> to allow user-space initiated reboots to trigger these resets.
>=20
> Introduce a late_initcall to register PSCI vendor-specific resets
> as reboot modes. Implement a reboot-mode write function that sets
> reset_type and cookie values during the reboot notifier callback.
> Introduce a firmware-based call for SYSTEM_RESET2 vendor-specific
> reset in the psci_sys_reset path, using reset_type and cookie if
> supported by secure firmware.
>=20
> By using the above implementation, userspace will be able to issue
> such resets using the reboot() system call with the "*arg"
> parameter as a string based command. The commands can be defined
> in PSCI device tree node as =E2=80=9Creset-types=E2=80=9D and are based o=
n the
> reboot-mode based commands.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
> =C2=A0drivers/firmware/psci/Kconfig |=C2=A0 2 ++
> =C2=A0drivers/firmware/psci/psci.c=C2=A0 | 57 +++++++++++++++++++++++++++=
+++++++++++++++-
> =C2=A02 files changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfi=
g
> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733=
e6bc5654d56a17f 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -1,6 +1,8 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0config ARM_PSCI_FW
> =C2=A0	bool
> +	select POWER_RESET
> +	select REBOOT_MODE
> =C2=A0
> =C2=A0config ARM_PSCI_CHECKER
> =C2=A0	bool "ARM PSCI checker"
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..e14bcdbec1750db8aa9297c8b=
cdb242f58cc420e 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/printk.h>
> =C2=A0#include <linux/psci.h>
> =C2=A0#include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/suspend.h>
> =C2=A0
> @@ -51,6 +52,14 @@ static int resident_cpu =3D -1;
> =C2=A0struct psci_operations psci_ops;
> =C2=A0static enum arm_smccc_conduit psci_conduit =3D SMCCC_CONDUIT_NONE;
> =C2=A0
> +struct psci_vendor_sysreset2 {
> +	u32 reset_type;
> +	u32 cookie;
> +	bool valid;
> +};
> +
> +static struct psci_vendor_sysreset2 vendor_reset;
> +
> =C2=A0bool psci_tos_resident_on(int cpu)
> =C2=A0{
> =C2=A0	return cpu =3D=3D resident_cpu;
> @@ -309,7 +318,10 @@ static int get_set_conduit_method(const struct devic=
e_node *np)
> =C2=A0static int psci_sys_reset(struct notifier_block *nb, unsigned long =
action,
> =C2=A0			=C2=A0 void *data)
> =C2=A0{
> -	if ((reboot_mode =3D=3D REBOOT_WARM || reboot_mode =3D=3D REBOOT_SOFT) =
&&
> +	if (vendor_reset.valid && psci_system_reset2_supported) {
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_=
type,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vendor_reset.cookie, 0);
> +	} else if ((reboot_mode =3D=3D REBOOT_WARM || reboot_mode =3D=3D REBOOT=
_SOFT) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 psci_system_reset2_supported) {
> =C2=A0		/*
> =C2=A0		 * reset_type[31] =3D 0 (architectural)

I don't know the PSCI spec, but it looks like with this code it's not
possible to set=C2=A0a reboot mode (in DT) and at the same time instruct
the firmware whether a warm or a cold reboot was requested.

Doing warm reboot is useful if e.g. RAM contents needs to be retained
for crash recovery handling, or other reasons, while in normal cases
doing a more secure cold reboot.

On the other hand, of course it's useful to be able to specify the
reboot target for normal reboots.

Is this a problem with the PSCI spec or with this specific change
geared at the Qcom implementation?


> @@ -547,6 +559,49 @@ static const struct platform_suspend_ops psci_suspen=
d_ops =3D {
> =C2=A0	.enter=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D p=
sci_system_suspend_enter,
> =C2=A0};
> =C2=A0
> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot,=
 u64 magic)
> +{
> +	u32 magic_32;
> +
> +	if (psci_system_reset2_supported) {
> +		magic_32 =3D magic & 0xFFFFFFFF;

I believe usual kernel style is to use lower case for
hex values.

> +		vendor_reset.reset_type =3D PSCI_1_1_RESET_TYPE_VENDOR_START | magic_3=
2;
> +		vendor_reset.cookie =3D (magic >> 32) & 0xFFFFFFFF;

dito.

Cheers,
Andre'

> +		vendor_reset.valid =3D true;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int __init psci_init_vendor_reset(void)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device_node *np;
> +	int ret;
> +
> +	np =3D of_find_node_by_path("/psci/reboot-mode");
> +	if (!np)
> +		return -ENODEV;
> +
> +	reboot =3D kzalloc(sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot) {
> +		of_node_put(np);
> +		return -ENOMEM;
> +	}
> +
> +	reboot->write =3D psci_set_vendor_sys_reset2;
> +
> +	ret =3D reboot_mode_register(reboot, np, "psci");
> +	if (ret) {
> +		of_node_put(np);
> +		kfree(reboot);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +late_initcall(psci_init_vendor_reset)
> +
> =C2=A0static void __init psci_init_system_reset2(void)
> =C2=A0{
> =C2=A0	int ret;

