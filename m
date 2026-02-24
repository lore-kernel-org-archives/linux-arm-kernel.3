Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C50F4BB95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnTV6ZJVnwYW7iQf2SMUCiEq1bhIKlJyAv74L2EwgcA=; b=cHANNbGdYn0UHAxodXlFy0aEJI
	2HeXa+rpZxDu07EN/O0/r7KIXJjUMdSiJAjcXM4XTnbeNyMaAJKDniC5HN+fTq/H8MuddRry4vcoj
	Kk2e76GlAmCFYlQnvAlhtni2q+EmSxTft+CCyWFLdds/vwrKczIFhPTzuBlKLX8gz48ezH/8hnzYx
	1+6Nq7UZoLa6fz0qte89DOMQHC5z+sF/ZzShHaUbpsRPmxQMT4/HeOJAP31oJWZHiTOb3zBvIHhj4
	renV92RsGw5PQtNAt9AZCBUPg2BTybRQ+Rq7G2G3vhF9x5w0p0pPGzSZCDOsdAEvKYhL63gT+qIY9
	W7iytR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0o8-00000002rpb-3ZJf;
	Tue, 24 Feb 2026 22:23:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0o7-00000002rpG-05mP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RnTV6ZJVnwYW7iQf2SMUCiEq1bhIKlJyAv74L2EwgcA=; b=zJV5pPQJYab26RK+hLVBEgtPFb
	o1LBgVzoWwWkzkb/ch8dISjG/5HK9ndMRfsYHtdsUs2pa0YtacE/eVhtv6WMwHq4vm9uO3Xixxdzw
	BqTDHJsFV96dJLrAWOdUaKM7quT0BMPhYZVwJF9+53wMMTzSM4G7OUCKbDl65EO2Xi0I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vv0nw-008f4x-K6; Tue, 24 Feb 2026 23:22:56 +0100
Date: Tue, 24 Feb 2026 23:22:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
Message-ID: <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch>
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
 <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch>
 <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_142307_084108_4DE4D899 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

> > > + remote_cm33{
> > > +     rpmsg {
> > > +        rpmsg-io-channel {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          gpio@0 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <0>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };

> Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus in the example above?
> They are running on the same transport.

Doesn't reg indicate the channel number? gpio@0 is on rpmsg channel
0. gpio@1 is on channel 1? The reg value gets filled into struct
rpmsg_channel_info when the endpoints are created?

   Andrew

