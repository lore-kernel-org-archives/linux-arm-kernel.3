Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423CBFA1FE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9SxWuthTNtL60nN9SxOARfcWqRutKN+Nff359pIU1U=; b=HgOTZebchBRzkzNfiuAMEkOplE
	4v4zlRIuKtV0KHHXxPiz2rYdVtMxctetsJRdH9jGsyd7mtqPzkw9HoxZGQ5btvV8Hh0PUDXJCyWCL
	ZIPaXCVPI31DyVpgXJkwwVIiq/sO0NlqGUlxnm/BFdPAETFR5HS3sRw8bOgcRf8EwDdSWDVojnUpp
	PLbblvXIcMBr5QZrkeujayEK9iv0mv4CSqPX7MzbnM9qQxkQfBt1tc/mOgK/Lc4wo5QJcwERENJyS
	sUg286luhM6SFP1f3maArSWW26m24j6P+hxmEtk2e4BhSc8dd9b73liXM8WCfAw5kMmMD9jlb2qLv
	Bw4xOggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcaE-0000000Adr0-13CD;
	Wed, 22 Apr 2026 18:45:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcaB-0000000AdqR-13Rb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:45:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797ED1E8D;
	Wed, 22 Apr 2026 11:45:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F7BC3F641;
	Wed, 22 Apr 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776883549; bh=hkA5KjlIl5jwh4GkTXHA4vVNwgDxaznRvBx/RdhhKnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YR5vqQX1RwlqvU3irJVsmTCjnxjrT6BB9Mobx9TN8DuowUioHwsuy9oU1pnpwNL11
	 1dlH18U+1iqag2bVyl/WX8QGsNBDr23tbm4Y62yq+fUD39OYy8G20AUnr3jzLYs74m
	 6vfxb5Ccpxy/4VArdBH/MSuXTFo62aj6EQPD8FS0=
Date: Wed, 22 Apr 2026 19:45:38 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Message-ID: <aekXUvIPb8nkhdKu@pluto>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_114555_503461_4B4E1EC5 
X-CRM114-Status: GOOD (  20.87  )
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

On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.

Hi Geert,

Thanks for your patches....this is not a proper full review of the series,
BUT this patch catched my eye..

Indeed, yes, it is deliberate that the SCMI version information is NOT
exposed out of the SCMI world, since being the SCMI an attempt to
standardize a common FW interface (as in [1] of course), you should not
know what runs inside the black-box, it should be irrelevant...

...indeed the versioning is used inside the SCMI stack to deal properly
with different protocol versions implemented by the server OR to apply
proper quirks when needed, but all the rest should be standard....

...you should NOT really behave differently based on the underneath
protocol or firmare implementation version...it is the SCMI stack that
should behave properly, transparently...

Having said that...I understand that at least it could be useful to be able
to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
have been applied/activated at run time...but anything more than that it
seems to me dangerous and prone to a number of abuses of the SCMI stack
itself...

(Also...exposing the versions itself means also tracking that bit of info
in more than one place: the quirk framework and your drivers.)

> 
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.

...abuse like this indeed :P ... the SCMI server is supposed to be that
one entity remapping the IDs in the background if the same IDs happen to
be representing different physical resources across a number of distinct
platforms all supported by the same firmware blob...so as to present
a consistent set of contiguos IDs...

Also because this should be one of the selling point of the SCMI stack
in a virtualized environment: you can ship the same kernel drivers with
the same DT and you know that ID=<N> will always identify the specific
resource that is needed by your driver without worrying about the fact
that in reality in the backstage the effectively managed physical resource
could be different across different platforms, because that does not matter
if the SCMI platform server had properly remapped (at build time/run-time ?)
the resources to your expected ID...alternatively of course you can ship
with different DTs to describe different hardware...BUT remmapping stuff
in the drivers themselves guessing on the vendor/subvendor/impl_vers
seems a dangerous abuse...

I watched a bit of the LPC discussions around this (from Marek I think)
but sincerely most of those problems had one (not necessarily simple)
solution: fix your firmwares AND/OR apply quirks in the meantime...

Sorry, I am sure this not a welcomed answer :P ...thoughts ? 

Thanks,
Cristian

[1]: https://xkcd.com/927/


