Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF29C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5wdSin+vp3AHo1kagh6xorR1bLSyQ86chFp/LPXx24=; b=0jZufAmd4VZ317xIDSmbQ3efdh
	KmPpaxXOXPH/5mnpQSxP6Oho0Jb/cDfYNCFWclLfVxbQxwRoOC7G5SIPRk9JnqbRjAVDaulCNQaVt
	XCQeJCv1/6XM7kgdi5MVQ2mzt4+yQb5uOqMq2b9WF+KOIyfcZixlQAFeMomyxRje3kMr67X9NMjXv
	1mvBVRAWbc9kWf+JwF3fp0OlsiC9DjAMU+NzcbX2KrDK0pWzFl01opqg8JDPySQP3e4G09O3r+YdA
	0iBQblr9R/aRtxpONtwNHC6NAoE9g3a8RojZvplqwktvl0IJc5QEbFpeq2gyXuTul6Ue4nIw+5bhu
	v9Vf63EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCXc-000000057xt-2Muu;
	Fri, 10 Jul 2026 14:49:24 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCXY-000000057xF-3iD5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:49:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 372F9200687;
	Fri, 10 Jul 2026 16:49:16 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wiCXU-00162F-0R;
	Fri, 10 Jul 2026 16:49:16 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wiCXU-00000000EZW-04xu;
	Fri, 10 Jul 2026 16:49:16 +0200
Message-ID: <6fd99dbdf7930a98d3dbbd44c0b39658c1d5efd4.camel@pengutronix.de>
Subject: Re: [PATCH v2 04/10] reset: Add reset_controller_get_provider()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla	
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Ulf
 Hansson	 <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney	 <bmasney@redhat.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>,  Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman	
 <khilman@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 10 Jul 2026 16:49:15 +0200
In-Reply-To: <c415dc5f468e62cd0e2a6b9639abb92a82c01324.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
	 <c415dc5f468e62cd0e2a6b9639abb92a82c01324.1783505329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074921_105233_63703D4D 
X-CRM114-Status: GOOD (  15.11  )
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

On Mi, 2026-07-08 at 12:16 +0200, Geert Uytterhoeven wrote:
> The reset subsystem differs from the clock subsystem in multiple ways:
>   1. It does not provide a public way to lookup resets from a reset
>      provider (clock has of_clk_get_from_provider()),
>   2. The xlate callback does not return a reset object, but merely an
>      index, which is converted to a reset object by the reset core.
>=20
> Hence add a public helper reset_controller_get_provider(), which just
> returns the provider, and will be used by the R-Car X5H Module
> Controller driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Please don't. Only the owning reset controller driver and the reset
core should interact with struct reset_controller_dev internals.

I'd be very uncomfortable with a driver reaching directly into another
drivers reset_control_ops, bypassing the core entirely.

I think it would be better to let reset-scmi export a specialized
scmi_reset_assert/deassert/reset(id) API, and add a possibility to
suppress registering the reset-scmi reset controller, so that there
aren't two conflicting paths into scmi_reset_proto_ops.

If you want to stack two reset controllers, the upper one should go
through the proper channels: request exclusive reset controls and use
them via the reset_control_*() APIs from the ops.


regards
Philipp

