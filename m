Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1937C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5wRCC0mU/NbriydP8DlwWMqdbFD0Kyhuy6entsN1ak=; b=3wM1lM4JFyuIQ6ihNihiF605W5
	8GLPN7SwBzuimPb9ti2fY2vHrMKqDhvNKtiKh6VfU5iJubStJCKox/nCnrtLHbX2aRNznji4JUdCN
	T64n0+RYbpVLEBzIfI2dDbj+fcwOmxKx2WG4NlzL9QL5FECWMvjynAHkdJT77fbSS/PpRJeG3y3le
	dE0lCr67DEQ/uav8c3CEHzQSXgGS5XMlDcNRd6DnlX8JOlatgcLjkOyKiyO4GRFw0L+ISGSBTCj0B
	U+M4CkhE1bCLehimwOdMjz3jjsyOFthmD7C/io+Q8UnrBIiNakmb3Bv3gqzO/wHwzr289GyISxPY9
	/JPYMmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdZP-00000001YeH-15WO;
	Fri, 17 Jul 2026 08:05:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdZN-00000001Ydk-2mKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:05:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E715060204;
	Fri, 17 Jul 2026 08:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010A51F000E9;
	Fri, 17 Jul 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784275516;
	bh=d5wRCC0mU/NbriydP8DlwWMqdbFD0Kyhuy6entsN1ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AAYnRLYR5nSHilgjUq+StjglS3Z+PMb8Planx0U8fjwQeAHn4RuQzeoBuYVptnCay
	 hku53KZqFAbAVa7h4Ur35l9BwX3MzN2SZY5br4g07/43LCF+AmtuNeuuUooSE03UpF
	 3X9EBWBd2/Vqy1wnwGyJwPiGB4RSPotIGA0rNEMgCrMfoTRjsAGxYP7j0FTVcqqlhJ
	 levtY1yoCi31iphVl8xLgppZIvS7g2It7xNujZvWEL0FIjD6HN8Ryz/k5tJgxCGCrO
	 3GzAUHnZKNs09FbPeDvIOMIG+yF8vPhoO2eFPFCL8tFWBsG2cZDKTyEM5H7ky/b5oU
	 eASES6yHaGAiw==
Date: Fri, 17 Jul 2026 09:05:09 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
Message-ID: <20260715-greedy-ocelot-of-feminism-5be3bf@sudeepholla>
References: <cover.1783505329.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
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

On Wed, Jul 08, 2026 at 12:16:18PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> TL;DR:
> 
>     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> 
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
> 
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>   1. Core clocks and module clocks,
>   2. Module resets,
>   3. Power domains,
>   4. System power.
> The latter is not relevant for this discussion.
> 
> Using SCMI also has an impact on the board DTS: besides the addition of
> a firmware/scmi node with protocol-specific subnodes, devices using
> SCMI-abstracted system resources now have to refer to these resources
> using resource specifiers containing phandles to the SCMI protocol
> subnodes, and firmware-specific object IDs[1].
> 
> Unfortunately we encountered several issues with this:
>   - The clock, reset, and power domain IDs are not stable by design,
>     causing DT incompatibilities.
>     SCMI requires that the ID space exposed to an agent (i.e. Linux)
>     starts at zero and is contiguous.  Hence any change in system
>     partitioning (Application CPU core vs. Realtime CPU core,
>     virtualization, ...) may mean a renumbering of all SCMI IDs,
>     implying a massive change to the DT.

Yes it is well known fact. But where this is a feature or limitation
is debatable. Why would SCP firmware churn and re-number or re-assign
a differ domain ID everytime it is updated is questionable to me.

>   - There may be different SCP firmware lineages, e.g. proprietary and
>     certified variants, and FLOSS variants,

No sure if I understand the issue here.

>   - SCMI features may differ across firmware versions,

Again, features must be discoverable that is the advantage of DT vs this
firmware interface, so not sure what is the issue in this matter.

>   - SCMI may abstract the hardware in a different way, requiring changes
>     in (possibly existing) DT bindings and drivers to support the same
>     hardware with and without SCMI:
>       - E.g. the number of SCMI clocks inputs to a hardware block may
> 	differ from the actual hardware,
>       - E.g. hardware clock inputs may be abstracted as SCMI power
> 	domains (or vice versa), like on Qualcomm SA8255P[2].

True, the moment SCMI like interface is used in OSPM, the firmware
description hides real h/w details and provide what firmware thinks
OSPM must view hardware as(how VMMs virtualise things for VMs, firmware
can have similar effect with such interfaces).

>     Experience has taught that not describing the hardware in DT may
>     lead to major issues later.

OK, that's interesting. But the whole point with these interfaces is to
hide those, so just don't use such abstraction interface if you want the
hardware to be described as is to the OSPM.

>   - SCMI does not support the concept of a clock domain, so existing
>     drivers can no longer rely on Runtime PM, but need to be changed to
>     manage functional clocks explicitly,

Not sure what that means, you mean clock protocol is not good enough to
model the h/w clock domains on your platform ? If so, you are welcome to
improve the specification.

>   - U-Boot IPL (Initial Program Loader) needs a proper hardware
>     description in DT, not using SCMI.
> 

I am going to ignore that.

> This list deliberately ignores ID instability and the need for SCMI
> quirks during development of the SCMI firmware.  While upstream Linux
> must only support sufficiently mature firmware versions, vendor trees
> (e.g. renesas-lts) may still want to support development firmware
> versions.
> 

Fair enough, but the acceptance of such changes depends on maintenance
and possible absuse with such spec deviations.

-- 
Regards,
Sudeep

