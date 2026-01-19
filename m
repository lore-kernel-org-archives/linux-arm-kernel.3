Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E659ED29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+OELfv/lSe+X7B8QTozmK9tBUL2XraVPMgbP8bDdws=; b=QhzOoA8vvwbA77A2d7h9Bzhksg
	2ONU5XpXpxdBqzGyojXtd0Jo1E4+ItrO1HRzFFvBtaNu0S4eRknADiPhTF2moTqYDyeyrnLdc06SR
	oLTsPIbhVdJGFQG4ZFqLKUpc1tx34vdNE9NdV9D+1iCGlp1ryEOm1pGq/nR5ElwL8P2RPquENxIDL
	Lt4MmlcNyI5A/DJdbMbeqtY6Izh3Y3i5L7d5tQDPZrDUQhn60Uth1syKtTd/rc7DIWFGk0p9zJhub
	jyiMkbeGQFMwAiGDiNCl7o/hvIl4xMQrgsUuuYeF9XbalR3OBHDjRU5/TJgSIqUkq6rvcqr1EJvoU
	g42VinPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs0Z-00000002SL1-0Pm9;
	Mon, 19 Jan 2026 16:21:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs0I-00000002SJ6-1edd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2+OELfv/lSe+X7B8QTozmK9tBUL2XraVPMgbP8bDdws=; b=N+cWp09GeFGKXDJL3aTP3hKBAk
	n8Htlvebwdxoj8buP2jHZaPhvYc+hyS6s6S3nH9u7hEj6Fko/0DjPve8eKf5XzJS6/wGZfYqq3zUZ
	ebS2Gv6j6Quofco0pGXMxgg1JvQzQiDicJav+GbunQzEtv28nfdVJq4kqiARvLG6/OvNEHVBO//DU
	aR8zZ26JbpZEJ1cShu1mYS6N/NPmfjbgCEs8Qt44OhdBki8+e6S8NlWhHp1lNPbZVtRBMa3CZd2sE
	kmFv76a3rmtg7UYjbvNLJkSYNwlZvxiNByj2mUjh7yHsHjt4NSy35o4/e34yg+DxP6uUTd6LonkZ+
	kcWL55Iw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs0E-0000000CUiL-30Vw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:21:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhrzu-0005Rt-JI; Mon, 19 Jan 2026 17:20:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhrzu-001Rdx-2x;
	Mon, 19 Jan 2026 17:20:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhrzu-003Qo8-0S;
	Mon, 19 Jan 2026 17:20:58 +0100
Date: Mon, 19 Jan 2026 17:20:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Schier <nsc@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: imx8mm: add wakeup-source for usb phy
Message-ID: <20260119162058.yar4igdkaj2zqzsl@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
 <20260118172208.h7yts2yuf2lkhd4n@pengutronix.de>
 <20260118172946.zsqokjhp76trijq3@pengutronix.de>
 <aW5VzffP2UNAvy51@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5VzffP2UNAvy51@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_162118_804137_57F9BE69 
X-CRM114-Status: GOOD (  20.58  )
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

On 26-01-19, Frank Li wrote:
> On Sun, Jan 18, 2026 at 06:29:46PM +0100, Marco Felsch wrote:
> > On 26-01-18, Marco Felsch wrote:
> > > On 26-01-17, Frank Li wrote:
> > > > From: Li Jun <jun.li@nxp.com>
> > > >
> > > > USB phy can be wakeup source to support wakeup system from USB.
> > >
> > > Was USB wakeup tested? That beeing said, marking the device as
> > > wakeup-src is fine.
> > >
> > > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > >
> > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> >
> > Just noticed that this targets the base soc.dtsi. IMHO this is board
> > desicion to make and therefore belongs to the real board.dts(i) or dtso.
> >
> > Therefore please drop my r-b.
> 
> wakeup-source is captiblity of hardware. The user need use echo 1 > wakeup
> to enable it. it is SOC's feature.

I know that but still if the your system doesn't want to have the usb
exposed as wakeup-source in the first place, the board.dts(i) files are
now forced to delete this property. Therefore IMHO it's still a board
decision to make.

Regards,
  Marco


> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> >
> > --
> > #gernperDu
> > #CallMeByMyFirstName
> >
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

