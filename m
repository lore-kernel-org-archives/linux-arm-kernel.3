Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F36C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/hLED4bNtH5wzmW+TtCWIezWNfy9xRfoOM/HEBWOnk=; b=1sqf+MVmIvgdLwNG/eH8ehlT6s
	1iNZDXvyWP85hU700BPFWRCDHAmu+XR97uaRnhuToipR/0AyaLXK++3XqbRau46fiXA7IF4FacT9+
	IN19bQ003i/n69b7vJTZ/26BBPoi3MgMOAbKU1tJyt8KjpYMV3DtaEhporIVoMOfS4EGmEnWIpu4G
	1J5dQ1hfzry9JvHwdM00cKjyvyec2VA3FBBAE+2Nve7sLMXcBUV+mgjgQnZ3O7aDI/kj4wWctN15F
	qT/b44S0TzWoDyTxm1431ZYEIxJDPbExkDAUV1FF1GlTpzW/hd4IbH3csb41WUDbWQD6R3RWSwZwV
	VO0UW9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaV-00000005ETt-06EP;
	Mon, 16 Jun 2025 18:29:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRD0B-000000053DS-0era
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9824615F2;
	Mon, 16 Jun 2025 16:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51EAC4CEEA;
	Mon, 16 Jun 2025 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750092485;
	bh=vhZVzII3CTfFCsNaHspYbWSGDD/REfUZxPruFgTiNbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrLy4Y78WdF45DgIA04d6GzEjtLBdJOuzQzc8TS3cPBYJrqvdD4dQFjmAu31g9sjj
	 LElKFh4qj5gs6zQLqeNtg/LZNM8xpZZMDosfM3a/0yzIL+oPRsoyhb51Jn/kFadBXX
	 Bebo2KAm91G1jlgy63aDMYFC8qn4J4+lj8Rw/0rr4SZqB1mLQOI/Cjvg57bIK0ElAz
	 utaZ2+o6sCFUK+2HW2G7xhAxJ9FTDFKl/7sYwyO/Z/6YYo4+Mab1V7tfmjwSIoRHh8
	 XfinTPBQZknPAJK0LIOHLuUnwUWEku8xay8HtSK4Je5aDfJXhT5Twr+elRYzkKM8lL
	 bkKOrjBzNPQxg==
Date: Mon, 16 Jun 2025 17:47:57 +0100
From: Simon Horman <horms@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: Re: [PATCH v5 1/9] dt-bindings: arm: fsl: add i.MX91 11x11 evk
 board
Message-ID: <20250616164757.GC4794@horms.kernel.org>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
 <20250613100255.2131800-2-joy.zou@nxp.com>
 <20250614171642.GU414686@horms.kernel.org>
 <AS4PR04MB93869345F739436917920F59E170A@AS4PR04MB9386.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS4PR04MB93869345F739436917920F59E170A@AS4PR04MB9386.eurprd04.prod.outlook.com>
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

On Mon, Jun 16, 2025 at 07:42:39AM +0000, Joy Zou wrote:
> 
> > -----Original Message-----
> > From: Simon Horman <horms@kernel.org>
> > Sent: 2025年6月15日 1:17
> > To: Joy Zou <joy.zou@nxp.com>
> > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; catalin.marinas@arm.com;
> > will@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> > edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> > mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> > ulf.hansson@linaro.org; richardcochran@gmail.com; kernel@pengutronix.de;
> > festevam@gmail.com; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org;
> > linux-stm32@st-md-mailman.stormreply.com; linux-pm@vger.kernel.org;
> > Frank Li <frank.li@nxp.com>; Ye Li <ye.li@nxp.com>; Jacky Bai
> > <ping.bai@nxp.com>; Peng Fan <peng.fan@nxp.com>; Aisheng Dong
> > <aisheng.dong@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>
> > Subject: Re: [PATCH v5 1/9] dt-bindings: arm: fsl: add i.MX91 11x11 evk
> > board
> > 
> > On Fri, Jun 13, 2025 at 06:02:47PM +0800, Joy Zou wrote:
> > > From: Pengfei Li <pengfei.li_1@nxp.com>
> > >
> > > Add the board imx91-11x11-evk in the binding docuemnt.
> > 
> > nit: document
> Thanks for your comments!
> Will correct it!
> Will use codespell check the patchset.

Good plan. The --codespell option to checkpatch should work well here.

...

