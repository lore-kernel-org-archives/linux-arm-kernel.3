Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E737C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2F8UTbrQpHAZf8UnpKm16ni9iweS0yaca1Uv+SwEYc=; b=H12mIOZ7lTQXBG3lo4Fhy/II6N
	8nn3GQ8KkvR/uzjNIdmkuL2wufFFv9nLxFfePVzGom2TpwnFTKg1+QR7/6H8kSuUZ5+1m8gVSeUtR
	bIGW3RnY/lw0qlTY+PUd6mD6kpLH9XFTvlBJKZcLFOICgKJSv2kRz5SM1a8QSr7/RkikLgxZ4aKnt
	6ofvgvltyEjwh+ElwWVZX/YfTexIf4cNcdRhirVUxi3hIsVD2DdwGi48iI+oYtKXSX2Mu17LvY7aL
	lBJrAigomwGjbuIzoindOTgLca0uyvStomM66FWpTeMg3mPSIBN8Xb8ilzIkOv6jxQgJ2zfnmZTTW
	DKqFj6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVS1-000000001Tf-1vlM;
	Wed, 08 Jul 2026 16:48:45 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVRz-000000001TJ-0p5T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:48:44 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gwPDm6s9TzMlKN;
	Wed, 08 Jul 2026 18:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783529321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2F8UTbrQpHAZf8UnpKm16ni9iweS0yaca1Uv+SwEYc=;
	b=yY1xJQwbYy4eG2NsyWzBCVrlkg0EcBjFvdcuFovEC2IbWp3kU60JKjSAKSzLMciR1EsPdu
	ejjAFDe+JVF9Sr9+3QhhAur1hoqUsx/BwX/PDpB/e8Nwa0hOuypUuMHhL9Uwujrw7tbXNH
	/j35Zda5HbVnuqxQP84QRGA1FV25MuMpNgpXQAo9aBYw2ylltxz5DS3qGE2Xk/tripSQUp
	4rigneeHGxJ162cClnDzNhffDU/3Eo9bSvYV4qi7/wkQ7qcrWGAK6XA2NN2uE2+bIhKC0P
	Ov74Ct4qnnCl6FDRTICjToZjcoBT48/7DeD44GFkfO2C13KILjQU/E9XLhZq4w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="HyyEMk/D";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <1c072a8f-a854-4b72-be43-7fdb50b14653@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783529319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2F8UTbrQpHAZf8UnpKm16ni9iweS0yaca1Uv+SwEYc=;
	b=HyyEMk/DEMoJgPcxBr0Pq212SsCaf5NsNufZl8aXOfXzinVkcA2D20WAtT1qmT/1tWXXMm
	UH50YgTdA4l+ihaYZ8AdS5GPRPKEWGAfhLKMXCMjNamAB+octGR79OarG/cz3sMKyDkx1A
	szPV4dYYdC5rvgx5AsAU0aYRIKTDw8GV5rWRlZOBrOKKCq6a8ETtr4NOv7JDltLeNkzqFP
	htLjbKZpYH65f3a2eeCxEaLRBnkYPYfr7gjm6vahw3qM7uspJlzPtCdzwIAwcuWPBU7FOI
	s9p//CTQHqCgonVROF8iPyh9bmOz2wBDEdSqly1oBaTIk4J6CdcFB+d1/rb0jQ==
Date: Wed, 8 Jul 2026 18:48:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1783505329.git.geert+renesas@glider.be>
 <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
 <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 09e4c3dda12fcca6b00
X-MBO-RS-META: na9n8ju6zp3juk8qegttrip714c8zcby
X-Rspamd-Queue-Id: 4gwPDm6s9TzMlKN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_094843_417370_CA52364E 
X-CRM114-Status: GOOD (  10.60  )
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

On 7/8/26 6:04 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Wed, 8 Jul 2026 at 17:42, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 7/8/26 12:16 PM, Geert Uytterhoeven wrote:
>>> Geert Uytterhoeven (10):
>>>     firmware: arm_scmi: Add scmi_get_base_info()
>>>     of: property: fw_devlink: Add support for firmware
>>>     pmdomain: Make genpd_get_from_provider() public
>>>     reset: Add reset_controller_get_provider()
>>>     dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
>>>     dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
>>>     clk: renesas: r8a78000: Add SCMI remapping support
>>>     pmdomain: renesas: r8a78000: Add SCMI remapping support
>>>     arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
>>>       reset
>>>     arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
>>
>> I think 10/10 did not make it either to my inbox or lore.k.o , but the
>> remaining 9 patches look good. Thank you !
> 
> Thanks, I did something silly while sending.
> Lore now has it, b4 still seems to miss it, unless I specify the
> Message-ID of 10/10.

Thank you, it looks just fine.

-- 
Best regards,
Marek Vasut

