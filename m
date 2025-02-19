Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3571C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAzqPC29IHvgyz39uQQB0/lwy46uHwWuWRfVZjoMHr0=; b=YbcjRGdyU9edLrO2jZ7foX6WjV
	At3xOBxlYvwFN0XHAnq8CQXQOD29gkA7aHRyHe2FPnsPMGBLE8ZEJqdj+Lo/DvjRC9K3sC3sCV1MJ
	QJz2iJgj/Hy/GH/dZ24/3wmX4r9t624Qbl270+GosY3k24XydrPYQa4kkcK2jT0tjYdfpL9excW2A
	hq1zaGyMlsPMRNoM3SyiXHV3jfaQfu4eZC6WQDyKoOsDccFm0Rw8BcKZDmTS52JEaCmfqbkO5LRKs
	FoK0ODPPSFo14flkASzM7mO03CDhZm6uQszCY7FcBz01cCLXQZRzVj0jJROyhsce9o2cH1uA930Qh
	4t93fneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknoI-0000000E4xe-3cXA;
	Wed, 19 Feb 2025 17:24:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknmp-0000000E4eA-2G1c
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 17:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=aAzqPC29IHvgyz39uQQB0/lwy46uHwWuWRfVZjoMHr0=; b=JwIuIk7s6vqNuRxuNxahrq6uNM
	9NC7V8Zg5AjPzCfG8RRwlCof6sOMDSN0Mu7gtvnN1Gj7SHatqeZNGVrLSDrKEBEUH8WjZdt9iX2Yu
	csPqrd+hltie6sonh220K+ItK82NbCrcCc4Zdo9SKKtdxsYxDy5OF8AcRGvEFhp+41aVkzjxdvHms
	qCeTgzPUOAo1NLMpuo0Y9ZE+cKc0B6s8PDpyMhBjSQVCz3t9pZW5LQn3vwCN6ErAUJrmuBrMK3PH9
	RpWDgnTHQh7tdNPBqHphugrYFnaqeUFKEPW01bl0RHhJ2wPhtmRQiULrNVRn0yaUzoUVVWKn/MutC
	cALhZkeA==;
Received: from mgamail.intel.com ([192.198.163.11])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknmm-00000002Hjt-064U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 17:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739985780; x=1771521780;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=akhUxN+QxLEckZcxCpguN5EnjkBnD9oRnQSuFZ8ZKSM=;
  b=e1OTmSw/sD3sX6C5eBs3y3Bvv7fjSIYi5xHEce9qFMlcYdSe6xK8ds+Q
   n6UtRskgyGkrXjvF5cKKHk370fFvSf+MK8sboUSWHiXnvUvEZR9OKKipf
   SEfTL9tUTfWoCs4XiD6durrPRcFQKiyKn1penIYsBtWEYaMh8hfBln5Q1
   WULa06UGR7HpTNODy/GRd13cvQUO2FAukl2lQ6v+1DjFtM2tEfW6HZSsv
   kwkikgYZtrC1M9lBZ4kA61GSnn7LD1zDyHvaPyx1oPRIBV7bjKwb+DMIF
   qO5ZZ/mOfYFWKTsfKoq3RuXYCOTuACWdVRTQGR3iLros71HS05wCiRzAt
   g==;
X-CSE-ConnectionGUID: PaUkWP2pSiuipNjmijTSPg==
X-CSE-MsgGUID: sYKZuhACRkKOOY2qkWSHmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51354835"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="51354835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 09:22:49 -0800
X-CSE-ConnectionGUID: BRlidm1zTwmv/BO/vvlzuA==
X-CSE-MsgGUID: PHqqdaA9SB2DY4ysxBUtAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="115432705"
Received: from iherna2-mobl4.amr.corp.intel.com ([10.125.110.29])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 09:01:22 -0800
Message-ID: <4cf99d5f9b63aec22c24c445dea9a80d71f5f024.camel@linux.intel.com>
Subject: Re: [PATCH net-next v7 3/7] arch: x86: add IPC mailbox accessor
 function and add SoC register access
From: "David E. Box" <david.e.box@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Simon Horman <horms@kernel.org>, Jose
 Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Rajneesh Bhardwaj
 <irenic.rajneesh@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Richard Cochran
 <richardcochran@gmail.com>, Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
Date: Wed, 19 Feb 2025 09:01:20 -0800
In-Reply-To: <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
	 <20250206131859.2960543-4-yong.liang.choong@linux.intel.com>
	 <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_172300_621094_54017B49 
X-CRM114-Status: GOOD (  43.48  )
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
Reply-To: david.e.box@linux.intel.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 2025-02-06 at 08:46 -0800, Dave Hansen wrote:
> On 2/6/25 05:18, Choong Yong Liang wrote:
> >=20
> > - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> > - Add support to use IPC command allows host to access SoC registers=
=20
> > through PMC firmware that are otherwise inaccessible to the host due
> > to security policies.
> I'm not quite parsing that second bullet as a complete sentence.
>=20
> But that sounds scary! Why is the fact that they are "otherwise
> inaccessible" relevant here?

The PMC IPC mailbox is a host interface to the PMC. Its purpose is to allow=
 the
host to access certain areas of the PMC that are restricted from direct MMI=
O
access due to security policies. Other parts of the PMC are accessible via =
MMIO
(most of what the intel_pmc_core driver touches with is MMIO), so I think t=
he
original statement was trying to explain why the mailbox is needed instead =
of
MMIO in this case. However, I agree that the mention of security policies i=
s not
relevant to the change itself.

> ...
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 87198d957e2f..631c1f10776c 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -688,6 +688,15 @@ config X86_AMD_PLATFORM_DEVICE
> > =C2=A0	=C2=A0 I2C and UART depend on COMMON_CLK to set clock. GPIO driv=
er is
> > =C2=A0	=C2=A0 implemented under PINCTRL subsystem.
> > =C2=A0
> > +config INTEL_PMC_IPC
> > +	tristate "Intel Core SoC Power Management Controller IPC mailbox"
> > +	depends on ACPI
> > +	help
> > +	=C2=A0 This option enables sideband register access support for Intel
> > SoC
> > +	=C2=A0 power management controller IPC mailbox.
> > +
> > +	=C2=A0 If you don't require the option or are in doubt, say N.
>=20
> Could we perhaps beef this up a bit to help users figure out if they
> want to turn this on? Really the only word in the entire help text
> that's useful is "Intel".
>=20
> I'm not even sure we *want* to expose this to users. Can we just leave
> it as:
>=20
> 	config INTEL_PMC_IPC
> 		def_tristate n
> 		depends on ACPI
>=20
> so that it only gets enabled by the "select" in the other patches?

I agree with this change Choong. This can be selected by the driver that's =
using
it. There's no need to expose it to users.

>=20
> > + * Authors: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 David E. Box =
<david.e.box@linux.intel.com>
>=20
> I'd probably just leave the authors bit out. It might have been useful
> in the 90's, but that's what git is for today.
>=20
> > +	obj =3D buffer.pointer;
> > +	/* Check if the number of elements in package is 5 */
> > +	if (obj && obj->type =3D=3D ACPI_TYPE_PACKAGE && obj->package.count =
=3D=3D
> > 5) {
> > +		const union acpi_object *objs =3D obj->package.elements;
> > +
>=20
> The comment there is just not super useful. It might be useful to say
> *why* the number of elements needs to be 5.
>=20
> > +EXPORT_SYMBOL(intel_pmc_ipc);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Intel PMC IPC Mailbox accessor");
>=20
> Honestly, is this even worth being a module? How much code are we
> talking about here?

Yeah, this doesn't need to be a module either.

David

>=20
> > diff --git a/include/linux/platform_data/x86/intel_pmc_ipc.h
> > b/include/linux/platform_data/x86/intel_pmc_ipc.h
> > new file mode 100644
> > index 000000000000..d47b89f873fc
> > --- /dev/null
> > +++ b/include/linux/platform_data/x86/intel_pmc_ipc.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Intel Core SoC Power Management Controller Header File
> > + *
> > + * Copyright (c) 2023, Intel Corporation.
> > + * All Rights Reserved.
> ...
>=20
> This copyright is a _bit_ funky. It's worth at least saying in the cover
> letter that this patch has been sitting untouched for over a year, thus
> the old copyright.
>=20
> Or, if you've done actual work with it, I'd assume the copyright needs
> to get updated.
>=20
> > +struct pmc_ipc_cmd {
> > +	u32 cmd;
> > +	u32 sub_cmd;
> > +	u32 size;
> > +	u32 wbuf[4];
> > +};
> > +
> > +/**
> > + * intel_pmc_ipc() - PMC IPC Mailbox accessor
> > + * @ipc_cmd:=C2=A0 struct pmc_ipc_cmd prepared with input to send
>=20
> You probably don't need to restate the literal type of ipc_cmd.
>=20
> > + * @rbuf:=C2=A0=C2=A0=C2=A0=C2=A0 Allocated u32[4] array for returned =
IPC data
>=20
> The "Allocated" thing here threw me a bit. Does this mean it *must* be
> "allocated" as in it comes from kmalloc()? Or can it be on the stack? Or
> part of a static variable?
>=20
> > + * Return: 0 on success. Non-zero on mailbox error
> > + */
> > +int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf);
>=20
> Also, if it can *only* be u32[4], then the best way to declare it is:
>=20
> struct pmc_ipc_rbuf {
> 	u32 buf[4];
> };
>=20
> and:
>=20
> int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd,
> 		=C2=A0 struct pmc_ipc_rbuf rbuf *rbuf);
>=20
> Then you don't need a comment saying that it must be a u32[4]. It's
> implied in the structure.


