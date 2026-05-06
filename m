Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966D5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 22:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDoZIe7cacwjgr2IgClnfQvj7kilI/Zh72g7ogapULs=; b=r40B9qa2IoKmkBKeAp3QkwnCLQ
	jng+g05EEId7VOaqYuXfl5u9NyQ4KV7aCiGYlmDeifFO8DnLCRbAqaEuJEzpZ0VmwcnEO90QmSL5L
	ulh4gwXjmR74eqyE4nnI0qQTBWg2N8vV9fFeBBg2wC6U+uFDW/K5H6apK8ICnBkRx5ffJcKcJ9w1J
	iWqXvc/dc2KYoTT65g70/jOmNxyJ3v5WSz3FCILebJS6XNT9uQJiJCJTBT0fdayICr7h7tQ7M9lpr
	+IatxVswMrT3Au4fGNmRPIm6ZRX1mJZILym2H3j/nD7gPvH/pWv+n2FLHv9hxfH5Qo/2W5NGOVAu0
	ztJffL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKlCW-00000002FBs-0tp0;
	Wed, 06 May 2026 22:58:44 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKlCU-00000002FBN-2Pz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 22:58:43 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g9rQl2TyWz9vCW;
	Thu,  7 May 2026 00:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778108319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDoZIe7cacwjgr2IgClnfQvj7kilI/Zh72g7ogapULs=;
	b=rk2TtR2SEO2oNt1Mhqh/TZQaAHEKk5x9u2Oy3WARJGQbfKEZu+9ubSIEmGwrRoQ/URnH7E
	qrwdFN40GZ5hvG4FBsRaOLDrbWqxo+9v0jbdpxcrrIWMB/jmEJ6WPJXK71whVJdmc6mtmO
	SXu1+XE5GN0Ns86v8Wo31EercEZ39oMgJNZOHzGojSpLbQtA1Lz1PROsfAnkFEP71b9Hvr
	7UBKRuFsPchRdatHNgIROxG6F/h0JI5vzMbUd/cpICHa/DvtmlZWNPjw6d8vGFwcj748RA
	FS4KahuuBDIaHm2nOGgmVHQHxSvQrLN63moWCMZs4eeOq8DUFjwX/1u1b27Ozw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=f0q+JUWO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778108317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDoZIe7cacwjgr2IgClnfQvj7kilI/Zh72g7ogapULs=;
	b=f0q+JUWOkGRmhBrE1hoMgtbuAvmQpMU9IKyiIGcxcgLfLHo5EKQRlqadplNqAyenizG/LO
	iOJuyDV9AUUUfheNeME1txDR3uTGo75oAjHLXIcgW+XYlCKQJCeeyRn55j7jqdj98URlYc
	4XXQDgvT0kli2p1FXd13OKiTLnXEDy9Nzzk6xVqCa3mKLp8BfUzF9jw01T97HXSxKND3Ie
	LYb5laSnP9VER6YA3+fuQAz74AGvtGc3wUSvAbmSQ3asCtKtChGVHlByGzUieWvFUFpziI
	ijoad+dGP2r6K24qf14NYrRVhkpGbO4n50rn59j2kdNIauxFrH5OJ2DeC2fvzA==
Date: Thu, 7 May 2026 00:58:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: y67k4gbrwjrropr38ftqiejbbiydm78h
X-MBO-RS-ID: 09b24947cb12ed1c575
X-Rspamd-Queue-Id: 4g9rQl2TyWz9vCW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_155842_783173_10DB7E14 
X-CRM114-Status: GOOD (  15.28  )
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

On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:

Hello Geert,

> +  '#power-domain-cells':
> +    description: |
> +      - The first power domain specifier cell must be either the Module
> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> +        datasheet,

I agree with this part.

> or a Power Domain number, as defined in
> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,

I do not understand this part, please see end of this email ...

> +      - The second power domain specifier cell must be the module number
> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> +        in the high nibble, and the Module Reset Destination bitfield index in
> +        the low nibble.
> +    const: 2

I am unsure about this part.

There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC 
block contains multiple Module Power Domain Gating registers (MPDGn) and 
multiple Module System RESet register (MSRES) .

I do understand and agree that the first power-domains-cells cell must 
be the identifier of power domain within the MDLC block.

However, I do not understand the second cell. The MDLC bindings already 
contain reset-cells, which should be used to refer to a reset within the 
MDLC block. Resets within the MDLC block are operated using the MSRES 
registers. Why are resets conflated into power-domain-cells ?

> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number (0x00-0xff).
> +    const: 1

[...]

> +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> +
> +/* R-Car X5H MDLC Power Domains */
> +
> +#define R8A78000_MDLC_PD_AON			0x40
> +#define R8A78000_MDLC_PD_SCP			0x41
> +#define R8A78000_MDLC_PD_APL			0x42
> +#define R8A78000_MDLC_PD_CMN			0x43
> +#define R8A78000_MDLC_PD_ACL			0x44
... what do these numbers represent ? Shouldn't those be register 
offsets from MDLC MPDG00 according to power-domain-cells ?

If those are power domain IDs, then I am unsure why e.g. for SCIF the 
domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts: 
renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?

Thank you !

