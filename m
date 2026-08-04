Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B13C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0HBsvNSf+XniMtk5iChumUQ45izTvg+qkU5Y0OMQJw=; b=uYSdXgGrWpEZ5tmP4/Ibx/kTG+
	WaLFR6hsJvDJwNhd35eWV2m6XW/c+Sum8vG3yPJ/nL2tRDk1Xq8PVEUHbpz5Hbtb+VsTNOGO2YYfr
	OQytfpUsPcCXQrLfb7odaS+VfTUjpzWmVv09KdGkMetc0c+U9xb479er4Z+1/5pzFspVZm+5BproF
	bXuswvQVlrGvGpLLGUBDw2vcf+mWNxGkLNV7j7KvBRLVDbKlgq2cdTQ1tZ7k//qYpj/p7k6DooFqg
	0fObtmEl5OCaK98jbVtiK+mK6k6LHpdfk3FIH2B0L24kRfn9oaZJS0/eHbe8onxQi4bnpaNzVSgNk
	Yqst9hxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr815-000000014Os-3N9T;
	Tue, 04 Aug 2026 05:48:43 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr813-000000014O9-1TxI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:48:42 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-977bbf2eb1dso1484687241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785822519; cv=none;
        d=google.com; s=arc-20260327;
        b=HgvVTa/qx8wxvA/vRDhb9whPF4nl/9llguIeQaZK2Pv1Q4gtWeOidCE7fnepb7xZ3b
         VTNbulNn+W+8/punBSIZf7hSYErTiQ5FRVcya8tRvhlScTC5r31Ll6tLCX1+IvDWIU/K
         VxXPMhHltHHcsmBloQz/BX8z9LQ80YyEh8OCAr/2ZKS148qtwsXff35tj0fQrc7JfMdf
         ZZJqJEOn0NpMpPsUbsX2rV0LsuewoWHYm2U1y9JaNb20uswnKdZjvhtBeyVzYVjWx9eY
         /z6tUyxl1IPGUIKwlKu/MdUSC5vCQrmSZNuxVxvRi6WeK7leqrhUSW03Ptnp1GsQAdBJ
         klxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H0HBsvNSf+XniMtk5iChumUQ45izTvg+qkU5Y0OMQJw=;
        fh=X112FfxJWe6JLgyYijlPXTu8Sse2a22QoqRT5bibujU=;
        b=Ojz6A8bT4c9sqIUcGduahPEhsLih5H71MVv4jYlIjxWnU86LihHNNl+hOJqRyus9+i
         XQYSaHHxydTkMAo2y6LHrVX1vGqI38roKJF4IaCwmwLhz12bl/PMRW32O86uJRvF1su7
         tPxDBB42pIcuBlreVwr8ypECtZTD9HX0uRnaxUOSNg7gWhBnh516c0iVi4iVN0aCu8rF
         JXLJOLbHHuQwlNdC7CYvfqMzIjvic1YycAgmKybWjIY5fDO0PnQ3Wn3B+XqfLx5WmrKB
         umRAVBMV1ICg0VntXq85DkQrPA3g/AeT6hufnlqs/U77TQeBqB2VmPOHCSaAJySFlCWw
         Uhow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785822519; x=1786427319; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H0HBsvNSf+XniMtk5iChumUQ45izTvg+qkU5Y0OMQJw=;
        b=c32ztdzIgIVgkUwGL38cJoMgrqq5b/ypQTDPiqMJ+42iXxAMX2BRUA7N2NletX+2P+
         lVENru4KsLQ88nF6m1dck7fS/AtZlNx4Sf8BJPmxL9N134XMYM6jtKx7dtfHSumudVAW
         aUoqfmqd+pdrpPmePgiXSq07WIsOv3LeZqaqNrLSZO5r/t/4J/I5oLyXqFhpcteExSeW
         gsIn0OTtMFedRfBd/PXGqFMoxBX3X8u02eE+CyO6ZvqRFoX9kJSWLrz7qX7uzSikByX4
         dZ5WQ3Pp1YfS62gsfCiYtagaFGhjKxJSb+yCrUJwUtQPTCqqbWfUetokaCUJd6URcrOU
         D8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822519; x=1786427319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0HBsvNSf+XniMtk5iChumUQ45izTvg+qkU5Y0OMQJw=;
        b=FLVVWJWwlbDjHO+ee2+mI9h+Tfv+5VWyUKWvIlP5VWbx+cyKhgbvhM5TpqnzxBQU23
         1Sj07/mWXCqEEC+nRWPLLR7MgvPDv8Ey7TWEYhj2A1xRYV5W3zDqMjvR110yk9kUySo9
         2ZAvWGRRKOKQWhIcxkjl9A7UVhO6CcFAdLjpzgwXWaV5B9S8+ouq/dI3garsmmTa7eBd
         DdanahWWtn/3bQ6wHDguPjoM9U2jww3FgEwCk5DwdF4YQDzRMHYPZcn8vPgKzKpi7LOo
         4fN1T4GTH3oRjdBvNPNJLYFWc0cjxp3eYzV8jEwsXBCEOPZAVoomqpdZ9GolXq2O8s3V
         1M0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqx2J9S2loI1uo1gS4ZonGAUg7KuhU7fnG8tiSznfbUXuJRUqoBW1JGt/JW/Ae338hKgoAl6e1Jwf+55su75U/a@lists.infradead.org
X-Gm-Message-State: AOJu0YxQTrjToIaliG9N3o0Y7ubsPmgtufTuuGyov0EuXP2GzKddENbK
	ysDo+KoBjPeENfJMH4cOfchr+lo4tMn3aMVwT6Ax7cxi1/sEHlb8COuQVMCsDk/9gZeisuS6C7U
	ysmkBL7sO5JigY+cS8HBLMS3A1odTPH4=
X-Gm-Gg: AR+sD10swJqhlfPdp5V/xiSJKpA4ESTFS2Eksnk5ldfAUwbdS7KkBzBt8Zp4UOHbw44
	Pk4J6k+ndrhaKvuUBEfUJCzEJGnO2I4uyf7hu4JwyO+ORBYPSVXoq/7je3H+lTKfgw9O/wGt/XU
	+PGL+jejffM1j7EiQ4S2ouGLVPLcRx8ehvaYNKVsdl9sYEPIoTfB9lsqQhZpfR8FApGMHqG/Bql
	dWTUabarkfmtk+Z5h9wpVSi2Gh+Ec5cAxi4yvTrVFps16SASxydIaDRqqbQb44sX/snax80BUwZ
	DmdhnDiRVKnH3YPrcimCawaSCot7E/enESqrBAaGjnNfdaFS8UFMsXmDVdV/ZWKuZvILUDfyMSy
	7U0qfjWFdOaZNDqPTYxVA6u+XU5Yaw2/Ocuvi+cWEJvv+m4MxNnlWuiV54GTUVCgOCl/uPn31yB
	JI20KY5SyhGGB+AYs3SM3mfn9aNEASkAm4bzxeiZrQdYlbLME=
X-Received: by 2002:a05:6102:4189:b0:631:2624:e5e7 with SMTP id
 ada2fe7eead31-75b2406ccc8mr10037359137.14.1785822519056; Mon, 03 Aug 2026
 22:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <aaec8809-8218-4412-a60d-931406dbf287@arm.com> <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
 <AGtA6uUwR9yJMX3xYVDz6g@gmail.com>
In-Reply-To: <AGtA6uUwR9yJMX3xYVDz6g@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 23:48:28 -0600
X-Gm-Features: AUfX_mxhHPuApHUGfzq3nw_M7rZ_cmIG7gn_EvyIREfo_U89cua7V0HqGENEc8s
Message-ID: <CADvTj4qBhiPczrP9YC2uTW3xss3W7ghoBzbctM45yUROfsgPhw@mail.gmail.com>
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_224841_416667_31C3925E 
X-CRM114-Status: GOOD (  57.90  )
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

On Mon, Aug 3, 2026 at 11:03=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne ponedeljek, 3. avgust 2026 ob 17:57:15 Srednjeevropski poletni =C4=8D=
as je James Hilliard napisal(a):
> > On Mon, Aug 3, 2026 at 7:26=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > Hi James,
> > >
> > > thanks for sending this to the list, but as Andrew already mentioned:
> > > this is quite a beast, and would need to be broken down.
> > > Jernej and I created some patches just for the AC200 PHY on the H6,
> > > which Jernej recently revived, and IIUC, wanted to send to the list.
> > > This would probably be a more workable route: start easy, then add
> > > support for more SoCs (H616 depends on the WIP PWM driver) and more
> > > variants (AC300) later.
> >
> > Well, I wanted to validate that the overall driver design is suitable f=
or
> > the H616 which has to support both PHY variants at runtime effectively
> > since that is the most complex use case, I also don't have a H6 board
> > to test with myself at the moment. I think being able to see a more
> > complete implementation like this is helpful as it can better inform ho=
w
> > we can tie the different control interfaces to the link PHY in a way th=
at
> > works for the more complex H616 case.
>
> No. AC200 and AC300 are separate chips.

I agree that AC200 and AC300 are separate chips. That does not imply
that their link-side PHY implementations are different, however.

The AC200 Datasheet V1.1 and AC300 User Manual V1.0 block diagrams show
effectively the same EPHY organization: MII/RMII, auto-negotiation,
Auto-MDIX, 10/100 transmit and receive PCS/PMA blocks, LED and
clock/reset logic, a PLL, and the EPHY analog front end. Both variants
also report PHY ID 0x00441400, and testing shows compatible link-side
paged registers and behavior.

What differs is the surrounding control path. AC200 is configured
through its RSB/TWI-backed MFD registers, while AC300 has a separate
non-PHY MDIO control endpoint. Separate control drivers combined with a
shared link-PHY driver reflect that hardware organization; they do not
model the complete AC200 and AC300 chips as one device.

> Just making some artificial connection in DT, because H616 wafer is once
> copackaged with AC200 die and at other time with AC300 is not correct.
> Let just have bootloader properly identify copackaged chip, enable it
> and be done with it.

I do not think the control-provider reference is artificial. It
describes a real functional dependency: the Clause 22 endpoint cannot
be accessed until the selected package-specific control block has
powered, calibrated and configured it.

I also do not think a bootloader fixup should be the only supported
selection mechanism. Boards using the same compatible have shipped with
either package, and the SID field provides an authoritative package
selector which Linux can read directly. Handling that selector in Linux
avoids making support depend on a particular bootloader implementation.

There is already upstream precedent for unresolved second-source
components in DT. drivers/i2c/i2c-core-of-prober.c handles alternative
components marked "fail-needs-probe" and enables only the populated one.
This case uses a deterministic SID value rather than probing addresses,
but the underlying DT situation is the same.

A bootloader fixup remains compatible with this design. If firmware
enables only the correct provider, the fixed-description path is used
and Linux does not need to change the tree. Runtime selection is used
when firmware leaves the package variant unresolved.

> I'm working on proper AC200 series as Andre mentioned. I researched all
> functionality because I don't want to miss anything in DT and to have
> good arguments why I did thing the way I did. This series doesn't care
> of anything else than AC200 EPHY, which isn't correct. Some things are
> even not properly modeled and it was already discussed in previous
> reviews. For example, MDIO PHY node should reference both, clock and
> resets.

I agree that the AC200 parent binding and MFD core must accommodate its
audio, TV encoder, RTC and EPHY functions.

I do not think every AC200 child driver must be developed or merged
atomically, though. MFD functionality is commonly added incrementally,
provided the parent binding and driver do not prevent the remaining
functions from being added later.

I also do not think clock and reset references alone fully model the
EPHY control dependency. Bringing the link PHY up requires calibration,
input-clock selection, interface configuration, PHY-address programming,
LED pad configuration, and an ordered power, reset and shutdown
sequence. AC300 additionally requires access through a separately
addressed MDIO control endpoint and validation of its package straps.

The common PHY is the authoritative source for the link address,
interface mode and suspend/resume lifecycle. AC200 must program the link
address through its control interface, while AC300 must validate the
relationship between its control and link addresses. Passing that
information from phydev avoids duplicating the PHY node's reg value in
the control node.

Likewise, the next revision removes phy-mode from the control nodes.
The MAC supplies phydev->interface, which the common PHY passes to the
selected control provider.

Individual clock gates and reset signals could still use their standard
frameworks where they behave as independent resources. Those interfaces
do not replace the complete package-control operation, however. Putting
calibration, addressing and I/O configuration into clock or reset
callbacks would give those operations unrelated side effects.

> I plan to post AC200 patches with at least audio codec included,
> alongside EPHY. TVE is also working but it has more open questions, so
> it won't be part of next submission.

I am happy to coordinate the common AC200 core and binding work so that
the two efforts do not conflict and the other AC200 functions remain
properly represented. I do not think the audio and EPHY child drivers
need to be coupled beyond their shared dependency on that parent,
however.

> > > Which also brings me to some attribution questions: If I understand
> > > correctly, this has been written mostly by some LLM? I think you woul=
d
> > > need at least to disclose that, if not even add an official tag?
> >
> > Some patches were, sure, my understanding is that it's not required to
> > explicitly call that out but I can add more info if that helps, this wa=
s
> > tested/validated using a heavily automated hardware in the loop
> > testbench setup on an AC200 and AC300 variant H616 board.
>
> Yes, you have to reveal AI involvement.

My reading of the policy is that it's recommended but not required.

https://docs.kernel.org/process/coding-assistants.html

>
> >
> > > Also I wonder how this relates to the patches floating around for a
> > > while already: https://github.com/jernejsk/linux-1/commits/ac200-v4.
> > > This branch is relatively new, but the ac200-v3 branch for instance i=
s
> > > much older.
> >
> > Yeah, parts of this are loosely based off of some existing patches that
> > were floating around like those, although it has diverged quite a bit a=
s
> > well since this series is designed to handle both phy variants.
> >
> > I guess I should link to some of the earlier work in the cover letter?
>
> However, what bother me more, is that obviously a lot of AC200 things
> were copied (even if only by LLM) from my WIP AC200 branch without any
> atribution to either Andre or me.

The AC200 code went through substantial refactoring and integration with
the AC300 path, and the provenance of individual parts became mixed in
the process. Could you and Andre clarify which parts should be credited
to each of you, and what form of attribution you would prefer?

> As Andre mentioned in other response, let do it separately for AC200,
> AC300 and detection between them (best in bootloader).

I can reorganize the submission around subsystem and merge
dependencies, but I do not agree that this requires separate link-PHY
implementations or bootloader-only package detection.

The common EPHY code, package-specific control providers, and runtime
provider selection address different parts of one initialization
dependency. Giving the variants separate firmware identities and two
phy_driver structures would only move package selection into firmware;
the two drivers would still need to share nearly all their link-side
implementation to avoid duplicating the same EPHY code.

>
> Best regards,
> Jernej
>
> >
> > > On 8/3/26 07:14, James Hilliard wrote:
> > > > The Allwinner H616/H618 secondary EMAC is commonly connected to a F=
ast
> > > > Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The =
two
> > > > packages expose the same link PHY ID and largely compatible link-si=
de
> > > > registers, but require different control paths before those registe=
rs can
> > > > be accessed: AC200 is initialized through its I2C MFD, while AC300 =
uses a
> > > > non-PHY Clause 22 control endpoint.
> > > >
> > > > Some H616-family products were shipped with either package under th=
e same
> > > > board identity.  For those systems, this series uses a SID NVMEM fi=
eld to
> > > > select the control provider at run time.  With CONFIG_OF_DYNAMIC, t=
he link
> > > > PHY enables only the selected fail-needs-probe provider, so an AC30=
0 board
> > >
> > > Just to bring that shallow discussion we had on IRC to the list: I
> > > wonder if this is the right solution? Alternatively I was wondering i=
f
> > > just patching the DT in U-Boot would simplify things, and also help
> > > other DT users like *BSD or U-Boot (proper) itself, to not boil the
> > > ocean, but just allowing them to follow a standard DT description.
> >
> > This can be used either way, CONFIG_OF_DYNAMIC isn't a hard
> > dependency with this design, aside from adding CONFIG_OF_DYNAMIC
> > support for mdio the dynamic enablement of the correct phy control
> > drivers is relatively simple with this architecture.
> >
>
>
>
>

