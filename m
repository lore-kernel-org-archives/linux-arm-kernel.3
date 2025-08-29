Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31DDCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+72k6XyouLQSYtXaszDppE//LLPKyIQPoQS/8+bEmkE=; b=DCnRVAgIDq1qWo3oJCB4RgwYZu
	O3PPG3oJ+ja3VI9frB4q+NGWw4VyQ5S4iMYcGqtnyqqRwpeql/qipE8y5b7gRkOjUVjAsqdL4g2mm
	OYQMt0CiYwuvVaqvfakcC8iM6or9kK3QXibyKLxNSgnIWoqh5Rfa7EtonGJJpKasW10Xjw+g8nLUE
	lvGTX8W8wIasR2dBHofWKYYA1SAHZUVAKh15pSIwFXywAS6Exoe41HgsrcD98WNSz7fvuwi2wGv9L
	ZbubMoARR5w0qF6ZKhz4jUcvS1/KF/oCEKD7eoGodUTGcruvVht3XK6MAq1rILNoQghyvgapeGVa+
	tD/ORocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iz-000000077bK-1bI1;
	Sat, 30 Aug 2025 00:45:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0gr-0000000699v-2hwg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:06:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2818A4407A;
	Fri, 29 Aug 2025 15:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2838C4CEF0;
	Fri, 29 Aug 2025 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756480017;
	bh=0d8UuK8zHiUX85nUGp6oB76FtqUuTIyEA+Ua7Pj2hVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZv4R8T63sYSP22IGdTAfZk3RKBxXmcUCOcz1VWJYvkjQsx4JtMIk85tvw1zIfqIr
	 /M1Ms8Tn55fEUW6lbJfyuz4x5a8CHyPmuUVxhcVF4j+dvapp/GPmwaIinS7zattY8Q
	 GZsAEKNWkEYAzaHxPWvKLxJQeQ7cGZ2Eh/rPt3kHZtp1NZDYMsDNl1En5wZCisTUdn
	 8ptwDsWO+SgaXMixbXYLapFuCqzBpjb7xEmR0v63O3u77mzfnzcym/SwGxtDleB7lS
	 newQXL5VuHN3DTehzzxLRrCsRsBw4/djxdJaV15dxrvKl7GBC9ZjAX1StA42PPAfPC
	 +TmZnFdPBZkuA==
Date: Fri, 29 Aug 2025 10:06:55 -0500
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20250829150655.GA782291-robh@kernel.org>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-2-shenwei.wang@nxp.com>
 <20250826200904.GA375876-robh@kernel.org>
 <PAXPR04MB9185EAFBDF13143860910C3A8938A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185EAFBDF13143860910C3A8938A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_080657_727170_D3159C5E 
X-CRM114-Status: GOOD (  18.47  )
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

On Wed, Aug 27, 2025 at 02:49:54PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, August 26, 2025 3:09 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>;
> > Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx <linux-
> > imx@nxp.com>
> > Subject: [EXT] Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > Each subnode within "rpmsg" represents an individual RPMSG channel.
> > > The name of each subnode corresponds to the channel name as defined by
> > > the remote processor.
> > >
> > > All remote devices associated with a given channel are defined as
> > > child nodes under the corresponding channel node.
> > 
> > How is each channel addressed? Are they really grouped by type first (i2c, gpio,
> > etc.) then an address within the group? Or is there some flat channel numbering?
> > If the latter, then the addresses in the DT shoulc match the channel number.
> > 
> 
> Yes, the channels are grouped by type and identified by unique channel names assigned 
> by the remote processor.
> 
> The RPMSG bus dynamically assigns addresses to each channel at runtime. Because these 
> addresses are not static, they cannot be pre-defined in the dts.

But you did define addresses. How do you know which channel 'gpio@1' 
corresponds to if RPMSG dynamically assigns addresses?

Rob

