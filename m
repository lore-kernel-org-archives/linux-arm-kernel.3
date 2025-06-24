Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA025C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAMDHm88X5DnFfTxjTMlZawEVZqAwKU/UMzX5RRrhEw=; b=4uPYSOxmr+hMOypz7AlPp3N0CF
	sUy/AFzYjTSkqxNKQSR8YWJNwfV83ehuxrgdxqMDdHiDFVuGdsMsmfr1M5X/+mISO/qUOIsj/kYdy
	gnxXkd+ID2VbxckjocEvqVMsxNeYd5VmKoCLk/bp1/GkhLVzrKbSdwISdHk4bpDVaVcsXbBXZWdlN
	Zsb8lBaFihu47ds5cab5fYmyBvmxmSs1JAXEstFuDLXOHCqDDA709wyHuHyt3glT9PZcUe7CN4dYw
	FsSkRTGfg7D4YEywRkdF8pm3s6Sl9SMZYNzfJp53n7zIL0Dvy0v6wh1XCN48DqlILO3XCLED0BE+h
	WjomHxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDJX-0000000789e-1NwZ;
	Tue, 24 Jun 2025 23:44:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD7C-000000076mf-3w4a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750807905;
	bh=wAMDHm88X5DnFfTxjTMlZawEVZqAwKU/UMzX5RRrhEw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Y6jvrWrI5GNZ8lXWo//Q5UUJUo0iIL68eNHWVPCv70YpSP9TgqLYIqrhLciejhrJ4
	 sr7IxwJDOYd14/Uvs+JF68Am0yAqaZfy2MqMB36oE1tNHNGmRA/3XoCLPqnM9Mif3O
	 g8GYNQ1O7JgeKupftTkehLa/o0vmjTAUa30cVSD827oJ3ezXewbD59Go4c7BycZDW2
	 PENUZQ9mEIVg1qqezl7FA93VIgUQ3gB2899NYCNjre75vK6P1yByCpAtVcCnrYYxJ3
	 8FsitDufw47hob7JSjlkvJUg23ARqKE8K3Qw44qXdJM7JAk283yaT8sihzjwLfCXyn
	 54yrE/oJjuR8A==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B1F7640CD;
	Wed, 25 Jun 2025 07:31:43 +0800 (AWST)
Message-ID: <c41c3dfc38c1adc5d544e365de355579d42f90b5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "ulf.hansson@linaro.org"
 <ulf.hansson@linaro.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 25 Jun 2025 09:01:42 +0930
In-Reply-To: <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
	 <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
	 <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_163147_167157_F133EE69 
X-CRM114-Status: GOOD (  18.03  )
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

On Fri, 2025-06-20 at 10:23 +0000, Cool Lee wrote:
>=20
> > > The timing phase is no more needed since the auto tuning is
> > > applied.
> > >=20
> >=20
> > I feel this is unwise: we're now ignoring constraints set in the
> > devicetree.
> > Auto-tuning is fine, but I think that should be a feature that new
> > platforms can
> > exploit by default. Older platforms that do specify the phase
> > values via the
> > devicetree can be converted at the leisure of their maintainers (by
> > removing
> > the phase properties).
> >=20
> > Support needs to remain in the driver until there are no (aspeed-
> > based)
> > devicetrees specifying the phases.
> The timing phase only works on AST2600 or newer platform which has
> added a delay cell in the RTL.
> The older platform AST2500, AST2400 doesn't support the timing phase.
> It supposed no effect on older platform.=20
> The old manner that a static timing value customized from devicetree
> is inconvenient because customer needs to check waveform associated
> with each delay taps. Once the emmc parts changed, a fixed timing
> value may not work. That's why auto tune here instead of a static
> value.

Sure, I understand that auto-tuning is more convenient, but in my view,
there's no reason to remove support for static phase values for now. On
the contrary, switching entirely to auto-tuning risks regressions for
existing platforms that do specify static values.

Can you please drop the patch for now? We can revisit removing static
value support in the future.

Andrew

