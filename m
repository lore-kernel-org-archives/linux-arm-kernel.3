Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B17DCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY9mo+Y8h0O2lN6yAwCDKjEzXs/Gvcp0k9ViL+GVNaM=; b=uim0RmQQkARDNPhay329CAOj/y
	iOpWD/Nr4TjcaJrwkgacpwDRw/wNR0d+Okh+v1ul/sse99cwOF9fahMnV4labbBCOyinxDK7zb0IG
	Vuj2cdT1j3Ci7TH02QQ1b1kiIvUdyffHgCexws98F7mte1X8wSaxSmTYHlIhPF5ml4kiHl0dmTQEE
	nN6vugPoD5hWnuQ7vJ+cFHr+MdTlhPEzxaGB0mECEbYMgEeOt+VaHIaFQ5zpIdjhTi6ItJphAtiKs
	hnnGKIX29x6YRtXKiEOmk80lbCViXJgsoTk44oV0slgaWkLyfFTTb5GWPp3MNi9ujFw3nmEqjaoN/
	hrXZNZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4FS-0000000Gst3-01GZ;
	Thu, 21 Aug 2025 12:18:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Ag-0000000GXhc-2lzi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:05:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1up2AP-0000TZ-AE; Thu, 21 Aug 2025 12:05:09 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1up2AO-001OXg-36;
	Thu, 21 Aug 2025 12:05:08 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1up2AO-007znM-2e;
	Thu, 21 Aug 2025 12:05:08 +0200
Date: Thu, 21 Aug 2025 12:05:08 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v18 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <20250821100508.sh35kuosczdhadpa@pengutronix.de>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
 <41909d9a-0ee8-460b-8c0a-1ceee0cf8723@kontron.de>
 <20250821095032.5o2trkwf6mdmyx4w@pengutronix.de>
 <PAXPR04MB845980CB4C7EDB091495DC058832A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845980CB4C7EDB091495DC058832A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_030526_698967_A124EA7D 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Peng,

On 25-08-21, Peng Fan wrote:
> Hi Marco,
> 
> > Subject: Re: [PATCH v18 0/7] firmware: imx: driver for NXP secure-
> > enclave
> > 
> > > Shawn mentioned for the v17, he wanted to test this [1]. Marco had
> > > some concerns on the general approach [2]. How can we move on?
> > >
> > > FWIW I have tested the v15 of this series with the ELE OTP driver [3]
> > > on
> > > i.MX93 and we use this currently in our downstream kernel.
> > 
> > From my pov, this series causes more confusions till the ELE FW fix is
> > available because you need to be really careful during the integration
> > in case of a verified-boot setup which are the most common setups
> > these days.
> > 
> > Not sure why NXP doesn't just add the OP-TEE support for the required
> > features e.g. eFuses, watchdog, HWRNG. The whole Linux part is mostly
> > in place.
> 
> You mean let OP-TEE handle eFuses, watchdog, HWRNG, then linux
> relies on OP-TEE to use the features?

Exactly, due to the FW issue only one MU can be used. OP-TEE could use
the secure MU and Linux uses the features via OP-TEE because these
features are not very timing critical and some features are _only_
available through OP-TEE, e.g. writing eFuses after the device was
locked-down.

Regards,
  Marco


> 
> Thanks,
> Peng.
> 
> > 
> > Regards,
> >   Marco
> > 
> > >
> > > [1]
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > patc
> > > hwork.kernel.org%2Fproject%2Flinux-
> > mm%2Fpatch%2F20250424111632.103637-
> > > 1-
> > lorenzo.stoakes%40oracle.com%2F%2326356782&data=05%7C02%7C
> > peng.fan%4
> > >
> > 0nxp.com%7C1ac2ac137e8a41d871c508dde098450d%7C686ea1d3bc
> > 2b4c6fa92cd99c
> > >
> > 5c301635%7C0%7C0%7C638913666802700666%7CUnknown%7CTW
> > FpbGZsb3d8eyJFbXB0
> > >
> > eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT
> > WFpbCIsIl
> > >
> > dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2FSC9WU4CoKtPrVuhjL
> > uLC7trQhAcbEkaCu
> > > xohN%2FIuM0%3D&reserved=0
> > > [2]
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > patc
> > > hwork.kernel.org%2Fproject%2Flinux-arm-
> > kernel%2Fpatch%2F20250619-imx-s
> > > e-if-v18-3-
> > c98391ba446d%40nxp.com%2F%2326443037&data=05%7C02%7Cpe
> > ng.fa
> > >
> > n%40nxp.com%7C1ac2ac137e8a41d871c508dde098450d%7C686ea1
> > d3bc2b4c6fa92cd
> > >
> > 99c5c301635%7C0%7C0%7C638913666802714776%7CUnknown%7C
> > TWFpbGZsb3d8eyJFb
> > >
> > XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
> > joiTWFpbCI
> > >
> > sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=B%2BUZWN6OjkEu27C
> > By1%2FFKte9Uw9NQ
> > > DA%2Be9EdPZhtAUk%3D&reserved=0
> > > [3]
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > patc
> > > hwork.kernel.org%2Fproject%2Flinux-arm-
> > kernel%2Fpatch%2F20250416142715
> > > .1042363-2-
> > frieder%40fris.de%2F&data=05%7C02%7Cpeng.fan%40nxp.com%7C1a
> > >
> > c2ac137e8a41d871c508dde098450d%7C686ea1d3bc2b4c6fa92cd99c
> > 5c301635%7C0%
> > >
> > 7C0%7C638913666802731697%7CUnknown%7CTWFpbGZsb3d8eyJFb
> > XB0eU1hcGkiOnRyd
> > >
> > WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy
> > fQ%3D%3
> > >
> > D%7C0%7C%7C%7C&sdata=RilSInf5N%2FfrF04qOubqT2yNjC%2FwAhy
> > Oe6GIEfwtIGs%3
> > > D&reserved=0
> > >
> 
> 

