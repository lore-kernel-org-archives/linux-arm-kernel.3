Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D2BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSknzHorPhjTcfMcQKnv2MntcJIq2S43GpXuQPmNQgw=; b=TEUBP4ft2ds34Gd87dIUdRznpW
	309TOBAFgBxv/5r4UyWaPnYPb1rfvOcRqAqWqYTi77+pUtiAd7veQ4evXK9XSqF4vIPJ071yheLEC
	nAISfPPJ8UCg2JetSn1dI7PJ3Se52d4oLU9bwjNQE4jFToyxhgrJB3/zEKvy3AtRy9fKS+8N65E0q
	kqsFeEHE7ueR4Ca0nGkgat/azzEZoeXNdFtvFw9/wvhh9k7TDUaINuDlTyobkQmCd2KZnDVHQHnP9
	/2z1DJsu4ZL3naNQWMHYStH5vdJKxywjd3gQkpwco/jtY906BUCtpZdt0qbQi45dS1GjC0enIsTo+
	LsZJNYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh94W-00000001sXb-1Bhe;
	Wed, 30 Jul 2025 15:50:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8e3-00000001q9o-0G20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 15:23:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso67426235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753888985; x=1754493785; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FSknzHorPhjTcfMcQKnv2MntcJIq2S43GpXuQPmNQgw=;
        b=W/ZVApH8kxvJuCFbIAS+qytskdz2K6OIhkcGzuX/MLL9MqaCdAXaUa71+AKhjDrebQ
         Y0oafGVS/QGxLsadryYyrkPWcP/Zu1oQ0KaJDyqdlKuWST4o50v+rR0mv45M3Zpan8P6
         FRfqLNdzBDwGxH4RBQGs0puesHgBEVdOGfw3QWVA0p4XfyKEGmTFtiTMXTYYGSWhDX6L
         XaAou0rk/kf6Gr12lpjl+LQnxchVdMGB7cfUWyeqb6cK/O+TpmICq2MEYV2vYv+2jWAo
         M6/u/wR+Uli8Tcl8BS2UJOjnOC/o2dMsBo+a+EaOwHMlSEVRRLqE022VsQqwMv4oCUeM
         Snsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888985; x=1754493785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FSknzHorPhjTcfMcQKnv2MntcJIq2S43GpXuQPmNQgw=;
        b=PM48igjQsI+UVUPK+oUNE4L+n70bnMlpA3W1ymFQROPtjCxsGROVTcK9H8Hg3Bf8PO
         yojGzqIR40VCT0DHI9hK+RhfxJoSyWO8O9tM75OMIqvUO6oePLCkpLlNn7WJn1YrrsVu
         U08T22QztWcmtIhkoTYL1LfYfqRlOYcDBCw5hZsGmEwvG4YGiZJxnmR45MUCKxzSSWWN
         JlkuiGDOLSA2eBkA7j/spTdk9DYF38I82cVhkBJYf9abBRiZrFZs2IIJX+wxYzcndbuq
         6d6313KU5ONa+/RBvP+OMUV6iwAsFVpOAidH9OqZ7mqlZX96uAolhzlKvUfcDDsx+J13
         hThA==
X-Forwarded-Encrypted: i=1; AJvYcCXT+ODB7tDusFXXyZHy/MrBcApfX7lY7sb06loFzDPQQU1zUqcaOdTtwMlZ9Z8MXolhYPVPWOhUEETsaoo6/5aZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzdGgPT9pHV3TgS2mdvkA+qrBGtp0p0o/WFuHAVQzAh4AKcyGEY
	408fxZvkeXgbpiDbdIg4Ml4dh/rnfIsaDoH77jDX6cAdM/Pq2N2JqXYRIzXaEGIdF7Q=
X-Gm-Gg: ASbGncuTAt2HNoKj2R0JRXAf3I6vdsdlK8byz4GneEDch/yaxmHYgq2Bx0z9ke76kU7
	OFTF5ORwt2JK1pb/Ny6Q1kB/Qk7uju7fBJzutUhCk5Dxr6zn+Kea3pUkIqBl4hJ1ZwMgXvuPWYG
	KlZnx+68zQBq1wm+/wQ6MoO3kkQdkBtXIZXhxsDJbXIrYey4No0GhQxmEAT5ThzAFVozqGZpA/1
	tiiLxMsv6JPGj2K6RDuGGnGJE/ViYALd92z8b1xEmntRcxJ8HsDsBTF2GCTkVlrHTY18QOhQ0pR
	6VXSjTEPG7XkYK2pxn6m7PLNjf6GkMWJLfK34OCsz2X9PPG0skKG8PxzE4RI2lcuEn4+zWmDv/i
	3JHOB8m7ASWSbwjCzEU5fP89row==
X-Google-Smtp-Source: AGHT+IFEfOPvUxFnjCIjvRgwT6HHnAVyMp877oB2unpoFPu/47jZPsMcKO0v1YP6b2RitUCQhVHLMQ==
X-Received: by 2002:a05:600c:4fcb:b0:456:a1b:e906 with SMTP id 5b1f17b1804b1-45892bdecacmr31613595e9.33.1753888985256;
        Wed, 30 Jul 2025 08:23:05 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589539e491sm32694905e9.26.2025.07.30.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 08:23:04 -0700 (PDT)
Message-ID: <34c52c88fd8fcbf68c453c1e94e4cd6294becff1.camel@linaro.org>
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
Date: Wed, 30 Jul 2025 16:23:02 +0100
In-Reply-To: <b92c164f-c6df-a2c0-1416-67652a01b179@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
	 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
	 <b45b157593f1865a402f4098cdeafc298a294c6d.camel@linaro.org>
	 <b92c164f-c6df-a2c0-1416-67652a01b179@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082307_116585_715CC6AC 
X-CRM114-Status: GOOD (  47.89  )
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

On Wed, 2025-07-30 at 18:33 +0530, Shivendra Pratap wrote:
>=20
>=20
> On 7/30/2025 2:14 PM, Andr=C3=A9 Draszik wrote:
> > On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
> > > SoC vendors have different types of resets which are controlled
> > > through various hardware registers. For instance, Qualcomm SoC
> > > may have a requirement that reboot with =E2=80=9Cbootloader=E2=80=9D =
command
> > > should reboot the device to bootloader flashing mode and reboot
> > > with =E2=80=9Cedl=E2=80=9D should reboot the device into Emergency fl=
ashing mode.
> > > Setting up such reboots on Qualcomm devices can be inconsistent
> > > across SoC platforms and may require setting different HW
> > > registers, where some of these registers may not be accessible to
> > > HLOS. These knobs evolve over product generations and require
> > > more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
> > > reset which can help align this requirement. Add support for PSCI
> > > SYSTEM_RESET2, vendor-specific resets and align the implementation
> > > to allow user-space initiated reboots to trigger these resets.
> > >=20
> > > Introduce a late_initcall to register PSCI vendor-specific resets
> > > as reboot modes. Implement a reboot-mode write function that sets
> > > reset_type and cookie values during the reboot notifier callback.
> > > Introduce a firmware-based call for SYSTEM_RESET2 vendor-specific
> > > reset in the psci_sys_reset path, using reset_type and cookie if
> > > supported by secure firmware.
> > >=20
> > > By using the above implementation, userspace will be able to issue
> > > such resets using the reboot() system call with the "*arg"
> > > parameter as a string based command. The commands can be defined
> > > in PSCI device tree node as =E2=80=9Creset-types=E2=80=9D and are bas=
ed on the
> > > reboot-mode based commands.
> > >=20
> > > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > ---
> > > =C2=A0drivers/firmware/psci/Kconfig |=C2=A0 2 ++
> > > =C2=A0drivers/firmware/psci/psci.c=C2=A0 | 57 +++++++++++++++++++++++=
+++++++++++++++++++-
> > > =C2=A02 files changed, 58 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kc=
onfig
> > > index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a37669=
9733e6bc5654d56a17f 100644
> > > --- a/drivers/firmware/psci/Kconfig
> > > +++ b/drivers/firmware/psci/Kconfig
> > > @@ -1,6 +1,8 @@
> > > =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> > > =C2=A0config ARM_PSCI_FW
> > > =C2=A0	bool
> > > +	select POWER_RESET
> > > +	select REBOOT_MODE
> > > =C2=A0
> > > =C2=A0config ARM_PSCI_CHECKER
> > > =C2=A0	bool "ARM PSCI checker"
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psc=
i.c
> > > index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..e14bcdbec1750db8aa929=
7c8bcdb242f58cc420e 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -17,6 +17,7 @@
> > > =C2=A0#include <linux/printk.h>
> > > =C2=A0#include <linux/psci.h>
> > > =C2=A0#include <linux/reboot.h>
> > > +#include <linux/reboot-mode.h>
> > > =C2=A0#include <linux/slab.h>
> > > =C2=A0#include <linux/suspend.h>
> > > =C2=A0
> > > @@ -51,6 +52,14 @@ static int resident_cpu =3D -1;
> > > =C2=A0struct psci_operations psci_ops;
> > > =C2=A0static enum arm_smccc_conduit psci_conduit =3D SMCCC_CONDUIT_NO=
NE;
> > > =C2=A0
> > > +struct psci_vendor_sysreset2 {
> > > +	u32 reset_type;
> > > +	u32 cookie;
> > > +	bool valid;
> > > +};
> > > +
> > > +static struct psci_vendor_sysreset2 vendor_reset;
> > > +
> > > =C2=A0bool psci_tos_resident_on(int cpu)
> > > =C2=A0{
> > > =C2=A0	return cpu =3D=3D resident_cpu;
> > > @@ -309,7 +318,10 @@ static int get_set_conduit_method(const struct d=
evice_node *np)
> > > =C2=A0static int psci_sys_reset(struct notifier_block *nb, unsigned l=
ong action,
> > > =C2=A0			=C2=A0 void *data)
> > > =C2=A0{
> > > -	if ((reboot_mode =3D=3D REBOOT_WARM || reboot_mode =3D=3D REBOOT_SO=
FT) &&
> > > +	if (vendor_reset.valid && psci_system_reset2_supported) {
> > > +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.re=
set_type,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vendor_reset.cookie, 0);
> > > +	} else if ((reboot_mode =3D=3D REBOOT_WARM || reboot_mode =3D=3D RE=
BOOT_SOFT) &&
> > > =C2=A0	=C2=A0=C2=A0=C2=A0 psci_system_reset2_supported) {
> > > =C2=A0		/*
> > > =C2=A0		 * reset_type[31] =3D 0 (architectural)
> >=20
> > I don't know the PSCI spec, but it looks like with this code it's not
> > possible to set=C2=A0a reboot mode (in DT) and at the same time instruc=
t
> > the firmware whether a warm or a cold reboot was requested.
>=20
> The code added in this patch is kind of dead, until vendor_reset.valid is=
 set to true.
> It can be true, only when both below conditions are true.
> =C2=A01. A SoC DT defines a psci->reboot-mode command say - "bootloader".
> =C2=A02. reboot sys call is issued using LINUX_REBOOT_CMD_RESTART2 and th=
e arg* as "bootloader".
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_M=
AGIC2, LINUX_REBOOT_CMD_RESTART2, "bootloader");
>=20
> With that in place, warm and cold reboot just work same as before until a=
bove conditions are true.
> There is no effect on regular reboots or the reboots with a "command" whi=
ch is not defined in
> psci->reboot-mode DT.
>=20
> Now lets take a case below, where a SoC vendor wants a combination of psc=
i->reboo-mode command and
> warm/cold to work in combination. For ex. a requirement below:
> =C2=A0- reboot command say - "bootlaoder" should do a cold reboot along w=
ith some extra HW reg writes.
> =C2=A0- reboot command say - "edl" should do a warm reboot along with som=
e extra HW reg writes.
>=20
> 1. For this, both commands will be defined in the psci->reboot-mode DT No=
de with the arguments that
> =C2=A0=C2=A0 are defined and supported by the firmware.
> 2. Further, such requirement will now be taken care by the underlying fir=
mware that supports
> =C2=A0=C2=A0 PSCI vendor-specific reset. When we call into firmware with =
vendor specific reset arguments,
> =C2=A0=C2=A0 firmware will take care of the defined HW writes and warm/co=
ld reset as per the mapping of the
> =C2=A0=C2=A0 defined arguments. Firmware and the Linux kernel here are in=
 agreement for executing the
> =C2=A0=C2=A0 vendor-specific resets.

So that means

    echo warm > /sys/kernel/reboot/mode
    reboot bootloader

and

    echo cold > /sys/kernel/reboot/mode
    reboot bootloader

can not be distinguished.

The firmware can not know whether or not cold or warm reboot was
requested in this case by the user.

More importantly, if e.g. an OOPS / panic happens after the reboot
notifier has run (and set vendor_reset.valid because a reboot mode
was requested),=C2=A0a panic handler changing reboot_mode to warm to
retain RAM contents will have no effect, because the the original
code above making those distinctions can not be reached anymore.

Above scenario with OOPS / panic after reboot notifier could e.g.
happen as part of device_shutdown() - see kernel_shutdown_prepare()


> >=20
> > Doing warm reboot is useful if e.g. RAM contents needs to be retained
> > for crash recovery handling, or other reasons, while in normal cases
> > doing a more secure cold reboot.
> >=20
> > On the other hand, of course it's useful to be able to specify the
> > reboot target for normal reboots.
> >=20
> > Is this a problem with the PSCI spec or with this specific change
> > geared at the Qcom implementation?
>=20
> SoC vendor should define a vendor-specific reset in psci DT only when the=
y support them in their
> firmware.=20
>=20
> Do we still think we are breaking anything in the spec or in the warm or =
the cold
> reset path? If so can we discuss such use-cases?

I don't know the spec, but see examples above.

Cheers,
Andre'

