Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC4CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROlPwAIJGbJfBsO0apPxGhjJGdED1W7jzEjs7V+GPOo=; b=L4o3R0gA2avRjxuP56/Yls/jlc
	RhCTQxAJuA7op5ZFlLFwSviyYXB2roeFvYotunqXWvGLvRU4dCIkDFTxRfbtxSwoY0r6S80UqEXOb
	dXhjd4tBoTN+gBsAEtshbHBMvaXq8uBZkqGXfRZYw70enmEi0A/DUHOU8YlAymEdEf8ngoTQwzfS8
	oa0MKEG0VcMBxQLmSqK2KddX6FHQZtbx8ySdm7OLUUQGmfAWkmMXyVmOH6XJ8Ad5+EZOfgJKfKO6q
	8RCvKUjAb1DCPZ8Yryfghk+Z2lwsctrVYjLUenxOptHxXUNZGQWHU0fTgHpDuEqiytEyzht5Nbfsy
	nqd489/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Ya-00000001MzN-09ak;
	Tue, 25 Feb 2025 20:29:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1ID-00000001Jtu-173G
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=ROlPwAIJGbJfBsO0apPxGhjJGdED1W7jzEjs7V+GPOo=; b=rJByqWg3P2oQoheLyNkQY3eVWT
	+bo/nNXwqOivZXO45uQwEVyTXiKchM3jTd2FRFb1vkHjdY1OZSJBrMvKJ4+tNw9Kw7cyRDylZMRtb
	JGlggc6q7t1L2xzzOGZ1n4jBCl2J7g5SYzAMvhV+EB7hVYPq5V7F6hyxF2fGyoBWVfXwmM9WS0Jgv
	y+X5PBcwVWzANoBygxadZq9ICOTiinOfXyX/DEdQ6ghVFpk1lewKXLrwuDXRLLt3GNunZujN3L8Q5
	MJRR3AdT4TLMywxsdgws0pgOWb08Ev2eJwLytJ1gmo0iKactFeuktQC79l2XtcCBOP4a4gAKr6D8b
	ZJYkKGMQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1IA-00000003P2L-110F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:12:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA8335C4D48;
	Tue, 25 Feb 2025 20:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E3DC4CEDD;
	Tue, 25 Feb 2025 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740514352;
	bh=jkFZlDqbRxwvpb/csXsZpILkgeKZJ+LCenzb2959lCs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S8L2oxFuJZ076tqLRePqBT4wMo9eOqzMOB4Q1TcVSLoS7Zpqwu5YE2GH+sncwuhvC
	 3c+dyESCbHV1m4UFb/DIEwxeQ8ylalFEmT+DkxmSMG/5B6MdEMpSrrru4Q2wTFks/E
	 jczAjUFLX13PDqfxERqNb5wvfm1zEEZOusz0OFUJ32sWPyhRhZJwpiMfvLzS6OQBtK
	 a39dmCkae/21f9WjnAgOTdUj0oBc8aIMx61uvHlb446t9GoNU9KthYPNUccMvmnbkZ
	 jrdsAwa+mhrizWxrAFZnqsDK4loMbFOe+ZSaS3uK9PtI6f3F4yiwuaQ7z4sDosASsL
	 xsNva4+vPmXDg==
Date: Tue, 25 Feb 2025 14:12:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, Conor Dooley <conor+dt@kernel.org>, 
 imx@lists.linux.dev, Enric Balletbo <eballetb@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, Christophe Lizzi <clizzi@redhat.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alberto Ruiz <aruizrui@redhat.com>, NXP S32 Linux <s32@nxp.com>, 
 devicetree@vger.kernel.org
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
References: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
Message-Id: <174051414934.2971045.13322665811292325537.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_201234_663739_53A692E7 
X-CRM114-Status: GOOD (  11.79  )
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


On Mon, 24 Feb 2025 15:40:16 +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add FlexCAN[0..3] for S32G2 and S32G3 SoCs.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 52 ++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 56 +++++++++++++++
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 72 +++++++++++++++++++
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 48 +++++++++++++
>  4 files changed, 228 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com:

arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401b4000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401b4000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401be000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401be000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402a8000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402a8000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402b2000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402b2000: failed to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@401b4000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@401be000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@402a8000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@402b2000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@401b4000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@401be000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@402a8000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@402b2000: failed to match any schema with compatible: ['nxp,s32g2-flexcan']






