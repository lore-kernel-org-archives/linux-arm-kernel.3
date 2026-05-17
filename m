Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8D6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWKoQwmIedaJHH3J3jNdcHxghyKQKYZGQi30TFVISoI=; b=nPX+rOOx5ATJ1JKqXCyoL1V2gC
	bNInf/2ja5g6NFqZwBW+9sRQprOXeOLsApJ51F83p85pkXfG3LzY7TeJasVbaiP/sfiW5B592eEwA
	hV3XfR5cLFpoQ9q935fLq5rNQ3EtY+mkAeVNb8/uzrhbIfhDkUXIGHl8Ty1glxRYEu32gEnm5CuCo
	BqbFjr9v1xBdqimtSUAzO3lAj8ZX2hAhVzemCVR3+KrhqDFf00NRuDVOeYdLfnB4KO5lUj7LPLYNJ
	gG/lJyCCf4azHZ6f5FiMBSF1s6EeO3iPz55In2RZB/fm0hkz3O83fR2+pf5lZsPMnUsyjG+MDsle6
	ug608rwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiZ6-0000000DSHN-09qW;
	Sun, 17 May 2026 20:58:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiZ3-0000000DSGr-2mqW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 20:58:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96A1F19F0;
	Sun, 17 May 2026 13:58:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA24E3F632;
	Sun, 17 May 2026 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779051499; bh=8YdDtosc2yuBrzAdShLNX5Aura5/QzNzsydkW/hbS2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeT4EohVSdz0//AGj/+rybSIAktQFGsZBGx+b2XCfQ2fy4e0lQGswwBNToLuCEbRH
	 fL+pIcQYwVjShNYdxaFGLRo9FGopvFEV0yggvFZyd2UCOGu+uHALw+dejaixXxB1Fh
	 l59MX3c3/vu+4oE8sBj7+q0p9sMB92tUZlrBNv4k=
Date: Sun, 17 May 2026 21:58:12 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
Message-ID: <agor5HJ0JFBoX3sZ@pluto>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
 <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_135821_789276_EF79B329 
X-CRM114-Status: GOOD (  39.09  )
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

On Fri, May 15, 2026 at 05:39:45PM +0200, Geert Uytterhoeven wrote:
> Hi Christian,
> 
> On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > each SCMI provider implementation on the running system are.
> >
> > Thanks for your patches....this is not a proper full review of the series,
> > BUT this patch catched my eye..
> >
> > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > exposed out of the SCMI world, since being the SCMI an attempt to
> > standardize a common FW interface (as in [1] of course), you should not
> > know what runs inside the black-box, it should be irrelevant...
> >
> > ...indeed the versioning is used inside the SCMI stack to deal properly
> > with different protocol versions implemented by the server OR to apply
> > proper quirks when needed, but all the rest should be standard....
> 
> [...]
> 
> > I watched a bit of the LPC discussions around this (from Marek I think)
> > but sincerely most of those problems had one (not necessarily simple)
> > solution: fix your firmwares AND/OR apply quirks in the meantime...
> 
> So let's forward to the future, where the firmware is fixed, is fully
> compliant with the SCMI spec, and all IDs are stable, so no quirks are
> needed.
> 
> Where do we specify the SCMI IDs to use?  Unless when using the
> remapping driver proposed in this patch series, they must end up in the
> DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
> or in board-specific .dts.
> 
> The SCMI server is supposed to expose to an agent (e.g. Linux) a
> sequential and contiguous list of IDs that represent only resources that
> the agent is allowed to use.
>   - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
>     describes all hardware in the SoC, which is typically much more than
>     Linux can or even wants to use when running on a specific board.
>   - You would think we could put the SCMI IDs in the board-specific
>     .dts.  However, that would limit actual use cases later, which do
>     not necessarily depend on the board solely.
>       - E.g. when moving control of the CAN-FD controller from Linux to
>         the Realtime OS, the CAN-FD node must be disabled in the DTB (by
>         overriding status to "reserved", or by just deleting the CAN-FD
>         node, both of which can be done by the boot loader). However,
>         with SCMI, the IDs corresponding to CAN-FD resources must be
>         removed from the ID space, causing a full renumbering. Who is
>         supposed to update the IDs in the DTB?

As per my previous email, after such a breaking change I would expect a
new DTB describing the new HW to be needed anyway.

>       - E.g. when partitioning a single Linux system in multiple VMs,
>         and distributing hardware across these VMs, all VMs need
>         different DTBs, each describing a subset of the hardware.  With
>         SCMI, each VM needs different SCMI ID spaces, causing not a
>         simple partitioning of the devices in the DTB, but also a
>         renumbering of all IDs.

Ok now I am lost..why do you need a distinct IDs space for each VM ?

In a virtualized env, I would expect to leverage the SCMI stack to
realize the exact opposite: same set of IDs advertised to each VM (and
so same DTB potentially) by the server which in turn can decide to
assign the same device (and handle the sharing) to some ID or assign
different devices to the same or different IDs on each VM: i.e. you
have a set of virtual_IDs that is what the server exposes to each VM
SCMI agent, and then a bunch of real physical IDs, without any contraint
on their numbering, that the server uses in the backstage to refer to
the real resources and that it properly remaps to each per-VM set of
exposed virtual_IDs during the build and/or boot board configuration
phase....i.e. when the FW adapts and reconfigures to the specific
board that is finally running on.

Thanks,
Cristian

