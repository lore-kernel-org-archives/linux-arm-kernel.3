Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816EAC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zddzVVYS9F5PpJp+klwF/9jEg03r8YZTMRZfUZl45Bg=; b=ex/+ofeAi8fMnatWbaUscHv05S
	cfLvTFWKtK3FC28uLSz5fYkS78XEiqCQWcuUzISAE0dD3btM2sDtM7Na0X9nL7oxp67ErYEW1sPok
	RPucSFdybdessg6TuNOnpTRITRIwy8THRByfhRxni9LnyVdqhrBNm9CAoSqtuKl97ETnE1KZY3IgJ
	d7u70U4t0Zw7/JN/SVwrxKPVwhd8y2BUFNWV6F6BEm91LsIep/xzce3UYIC0F7FkzDkaJNnCENIaN
	ZV2zdcCD5N8CA1ixUW6Ll575G/JUbe+8//1npBgskqJ8Eau7hPIrySxMSWlvN6LshVT6PD2kz/rrd
	uWP338Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNss-00000008UGo-1q7U;
	Fri, 07 Aug 2026 16:57:27 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNsp-00000008UGS-38TA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:57:25 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso4146296a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121842; x=1786726642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zddzVVYS9F5PpJp+klwF/9jEg03r8YZTMRZfUZl45Bg=;
        b=bp4DRttVHzcrrDxXhHRDYkjnYvqs9g+FggH5Utc8vehLIDlt/Lm1BOkWCPpJsbatVs
         eAI9QL6AZh8FHK1p/ztmnvaILl9sDqyNX0x5o9fwj6Nh+IC16taC6xRcSbgI5IsKGD9h
         9tKtuzHEvAdqlxJ5MA6IVQ/pBf9z5rxzU2aGEVnPg/0euocYSVBtyBGrrqX7n7lIBQG/
         Prs4Vr6ioNigKfXCR7388L/Sgjfaomogv1yTInI7GibIcoqpUh4KU76KDGYNLJtloyOS
         OEltcXWRubzhfsEGkxJWbP8D8k+CZO5uJTzbghHyP+KQpcGPD5anrP9DuqnyhPK8I60v
         UlXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkdjhnQ5zNv9JrB7nDhczN0IMl6K9/P3jmN2R1s29HrGO94Tk8AAo6IjZa67rjWIcJ+KFdHIM1WlCuODtLRg0V@lists.infradead.org
X-Gm-Message-State: AOJu0YwfeUwWzs/M5d4HgMMZ57SVfp9BCmJtFddDd24B+bxkLUc7KQVj
	X5Jedq0t1xfMSbiV/NLVKPRNld/3MyEf1QiX/ZNQDO4+znVkDF6R3uthoyhTR3O+K7A=
X-Gm-Gg: AR+sD13FgYTQrRTJcprUnD4+B75L1L+x4a47LiBZpoEDdIQr/4nRRb406Lqmsb2qNOm
	iEBhpnQ2f/34L0JEJmaDEOPBDg4nIV6eM0ItO8bS7pHieJSMQT8WSPwM79wA4/EBLwj8A8rO3vf
	aGMW8S4eonMgo1kndq2RW4YVVHhAOUSF9HSC7GbgFUmfj/ubJs5VCxjIDK9Bn5c9TN8CZQBH/91
	Lw9e6W3rJd/Z9blbv6DRDl+922SCMqwuCj96NEoh8Cbde71fcrt9YdepzqYNieqjmFeIE7tNDuP
	X1ZAEZd/ixoG66ObVvWP0uJ6WmDvHzHg/PT0EsOxvJX+bc9whs4G4MFw6AZt4zcCipK7W9MNrfS
	HlBLMbI1o2Phhj4IK2jt+PeF1wAkR1h1mDgG7SejHN/kU7y9+nOxskelpasjU+2cbfiO1xfoTC6
	lVxKRy4FrkI61KLGs8cbHRs2yYdSM3LdKCx7d0SQOhJcLyr1ccQ2zHX7wO5d1qmcqoI/91SKPDI
	uG7G4Q7OeQ7BTIshp58JpoxYw==
X-Received: by 2002:a17:907:9623:b0:c12:e178:9e68 with SMTP id a640c23a62f3a-c2073364351mr513255166b.19.1786121841351;
        Fri, 07 Aug 2026 09:57:21 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cff006sm77497166b.63.2026.08.07.09.57.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 09:57:19 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso4146223a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNygpUbGxPae7ES0jbXJs3fIJuo6bnXGEybizIDM4ONpMmi04OtdN766h86wj8S5k+EiHuoD4Eu0zUNdYQlMlr@lists.infradead.org
X-Received: by 2002:a05:6402:444a:b0:6a0:a4ce:1b8e with SMTP id
 4fb4d7f45d1cf-6a1b49ea41emr5538936a12.0.1786121839381; Fri, 07 Aug 2026
 09:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <20260715-greedy-ocelot-of-feminism-5be3bf@sudeepholla>
In-Reply-To: <20260715-greedy-ocelot-of-feminism-5be3bf@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 18:57:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD5eMuLBJWqLAt93M=8pSooBOFQ-H9jBM98N8HUwbRTA@mail.gmail.com>
X-Gm-Features: AUfX_mwo4EKqALTJkUcOqfKJfKUYp7ByWT2RwJWKEGja2YdKTdPuto8-gpxkDXo
Message-ID: <CAMuHMdXD5eMuLBJWqLAt93M=8pSooBOFQ-H9jBM98N8HUwbRTA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_095723_826623_A96765C3 
X-CRM114-Status: GOOD (  57.69  )
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

Hi Sudeep,

On Fri, 17 Jul 2026 at 10:05, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:18PM +0200, Geert Uytterhoeven wrote:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> >
> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
> > SoC/board combination that implements the ARM System Control and
> > Management Interface (SCMI).
> >
> > This means Linux can no longer perform various system operations (e.g.
> > clock, power domain, and reset control) by accessing the hardware
> > directly.  Instead, these operations are abstracted according to various
> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> > firmware running on a System Control Processor (SCP).
> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
> >   1. Core clocks and module clocks,
> >   2. Module resets,
> >   3. Power domains,
> >   4. System power.
> > The latter is not relevant for this discussion.
> >
> > Using SCMI also has an impact on the board DTS: besides the addition of
> > a firmware/scmi node with protocol-specific subnodes, devices using
> > SCMI-abstracted system resources now have to refer to these resources
> > using resource specifiers containing phandles to the SCMI protocol
> > subnodes, and firmware-specific object IDs[1].
> >
> > Unfortunately we encountered several issues with this:
> >   - The clock, reset, and power domain IDs are not stable by design,
> >     causing DT incompatibilities.
> >     SCMI requires that the ID space exposed to an agent (i.e. Linux)
> >     starts at zero and is contiguous.  Hence any change in system
> >     partitioning (Application CPU core vs. Realtime CPU core,
> >     virtualization, ...) may mean a renumbering of all SCMI IDs,
> >     implying a massive change to the DT.
>
> Yes it is well known fact. But where this is a feature or limitation
> is debatable. Why would SCP firmware churn and re-number or re-assign
> a differ domain ID everytime it is updated is questionable to me.

For an actual product, I tend to agree. But even then there might be
a need to reconsider partitioning during the long (e.g. automotive ;-)
lifetime, e.g. to counter a new attack vector.

For a development platform, the situation is different: the same board
will be used for various use cases, with different partitioning of
responsibilities, and will run various firmware versions.

> >   - There may be different SCP firmware lineages, e.g. proprietary and
> >     certified variants, and FLOSS variants,
>
> No sure if I understand the issue here.

Safety-critical products may require certified firmware, which may
be completely different from what is generally available.

> >   - SCMI features may differ across firmware versions,
>
> Again, features must be discoverable that is the advantage of DT vs this
> firmware interface, so not sure what is the issue in this matter.
>
> >   - SCMI may abstract the hardware in a different way, requiring changes
> >     in (possibly existing) DT bindings and drivers to support the same
> >     hardware with and without SCMI:
> >       - E.g. the number of SCMI clocks inputs to a hardware block may
> >       differ from the actual hardware,
> >       - E.g. hardware clock inputs may be abstracted as SCMI power
> >       domains (or vice versa), like on Qualcomm SA8255P[2].
>
> True, the moment SCMI like interface is used in OSPM, the firmware
> description hides real h/w details and provide what firmware thinks
> OSPM must view hardware as(how VMMs virtualise things for VMs, firmware
> can have similar effect with such interfaces).

So you end up with multiple compatible values for the same hardware
blocks, depending on direct hardware access or SCMI, and on the
actual firmware.
What is the policy for naming such compatible values?  How many
different DT bindings are we willing to support for the same hardware?
What about driver changes? Maintenance of all these drivers?

> >     Experience has taught that not describing the hardware in DT may
> >     lead to major issues later.

E.g. one may miss one internal clock input when describing a device in
DT, where control of the clock turns out to be critical for a specific
hardware feature?

> OK, that's interesting. But the whole point with these interfaces is to
> hide those, so just don't use such abstraction interface if you want the
> hardware to be described as is to the OSPM.

How do you fix it when everything is hidden, e.g. behind a single
virtual clock?

> >   - SCMI does not support the concept of a clock domain, so existing
> >     drivers can no longer rely on Runtime PM, but need to be changed to
> >     manage functional clocks explicitly,
>
> Not sure what that means, you mean clock protocol is not good enough to
> model the h/w clock domains on your platform ? If so, you are welcome to
> improve the specification.

It is common on embedded SoCs (e.g. TI, Rockchip, Renesas) to not only
have power domains that can be powered down, but also a clock domain:
a clock controller provides a common way to put a hardware module into
standby mode by gating its clock inputs.

In Linux PM Domains, the following callbacks are used:
  - generic_pm_domain.power_{on,off}(), to power a power domain on/off,
  - generic_pm_domain.dev_ops.{start,stop}(), to start/stop a device
    inside a power domain.
Both are handled automatically through Runtime PM
(pm_runtime_{resume_and_get,put}(dev)), so drivers don't need to care
about the intricate details.

However, for this to work, the PM Domain needs to know which clocks are
meant for module standby.  Without this knowledge, individual drivers
must control these module clocks explicitly.  During the last two
decades, lots of drivers have been converted from explicit module clock
control to Runtime PM, and reversing this would IMHO be a step backward.

I already posted patches before [1] to add support for clock domains
using a quirk.  Without a quirk, the SCMI clock protocol should be
extended to advertize whether a clock is intended for power-management
of a hardware module.  One way to handle this, the SCMI CLOCK_ATTRIBUTES
could be extended with a new flag in the returned attributes as I
pointed out in the cover letter of that series.

> >   - U-Boot IPL (Initial Program Loader) needs a proper hardware
> >     description in DT, not using SCMI.
>
> I am going to ignore that.

And of course we like the DT used by U-Boot (IPL or not) to be as close
as possible to the DT used by Linux.

Thanks, and have a nice weekend!

[1] Series "[PATCH/RFC 0/9] R-Car X5H Ironhide pure SCMI proof-of-concept"
  - "[PATCH/RFC 4/9] firmware: arm_scmi: Add a flag for power-management clocks"
  - "[PATCH/RFC 5/9] clk: scmi: Add scmi_clk_is_pm_clk()"
  - "[PATCH/RFC 6/9] dt-bindings: firmware: arm,scmi: Document arm,clock-domain"
  - "[PATCH/RFC 7/9] pmdomain: arm: scmi: Add clock domain support"
  - "[PATCH/RFC 8/9] firmware: arm_scmi: quirk: Handle power
management clocks on R-Car X5H"
https://lore.kernel.org/all/cover.1781171705.git.geert+renesas@glider.be/


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

