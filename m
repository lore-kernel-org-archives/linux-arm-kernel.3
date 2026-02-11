Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46087ECD6EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih56zx0ZL4YPL13TIkj/3bsoSC2hKtws4r0TaJHMPlU=; b=JqlM1NYLOxSi29Qvwymu5t+Ccu
	O8bmsokNAszIaM/jaNdtO7neftXJVpNVu10LUelZoiYz28wQX4QEyhR1L9P553bdsPqad0e0LOYDQ
	wHw3kNd3yuyR4F3jVyFWIPw1MJZwC9oX2WwyLVMPNI0QJUtey30bR+PmZ4rRbZVXiMKScAiw4UTlA
	Kk15wvfWYhxQl5h0nW1YFxIsh++fxNqR34O2kJlaqyFRwiC1DwyH7Kan2EAHEX5U40LQLbP7hoI2C
	ZpJjBceKwqsEo3nRugtZOl3c/QH/cLxI1F2Of7rYoqDYs8Nj623M0xmAppHVQ21Z/kFLA96xyuYQ6
	BwXz2HbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHDp-000000012fV-0k1i;
	Wed, 11 Feb 2026 20:54:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHDm-000000012f9-1tmR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 20:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D244243D69;
	Wed, 11 Feb 2026 20:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DCDC4CEF7;
	Wed, 11 Feb 2026 20:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770843240;
	bh=C4fSmQS1/v4DY2auUQM0mERpX0iAPLQEIrmOl7DFfdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVRXV0Ug9R/cLEODGVGo4nB6dunr0Yn0nzsRZgG0XJ2omurxmlKFzRm7KpEajUB3h
	 dTDUSSBUYQJhA6aEs2UJ24MbO+4kx5LUTyzcuz/NhRbIR+jl5XAa8mOW6Okb0wrS+0
	 CYhpx19GyRhtprbEo/OY0Cyz3UGhQUHyBQ29VmMqSsxMJce7qHpQoBZP5UTQibBP1p
	 uifAqfE5eOFdz0XVpwgU61Mqhk2PNuuL9c03IZthg5xyAZbFAR6MLb7CrqNCsWsfyu
	 V2Cn1OEVmzRTc+WTzPRF0v287JIe0zqE5XRz7WtOWv9qGSz9WWqglCwSyYvrAZpVZm
	 j0VW0ujuvCtBA==
Date: Wed, 11 Feb 2026 14:53:59 -0600
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20260211205359.GA3857648-robh@kernel.org>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-2-shenwei.wang@nxp.com>
 <177075649333.2817738.5507371747833844104.robh@kernel.org>
 <PAXPR04MB9185556E1A3DD990697E721A8963A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185556E1A3DD990697E721A8963A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_125402_555442_A67591BF 
X-CRM114-Status: GOOD (  23.01  )
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

On Wed, Feb 11, 2026 at 05:26:06PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: Tuesday, February 10, 2026 2:48 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bartosz Golaszewski <brgl@kernel.org>; dl-linux-imx <linux-imx@nxp.com>;
> > devicetree@vger.kernel.org; Linus Walleij <linusw@kernel.org>;
> > arnaud.pouliquen@foss.st.com; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> > linux-gpio@vger.kernel.org; Bjorn Andersson <andersson@kernel.org>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; linux-arm-
> > kernel@lists.infradead.org; linux-remoteproc@vger.kernel.org; Peng Fan
> > <peng.fan@nxp.com>; Conor Dooley <conor+dt@kernel.org>;
> > imx@lists.linux.dev; Jonathan Corbet <corbet@lwn.net>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Fabio Estevam <festevam@gmail.com>; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add
> > "rpmsg" subnode support
> > 
> > On Tue, 10 Feb 2026 11:08:11 -0600, Shenwei Wang wrote:
> > > Remote processors may announce multiple GPIO controllers over an RPMSG
> > > channel. These GPIO controllers may require corresponding device tree
> > > nodes, especially when acting as providers, to supply phandles for
> > > their consumers.
> > >
> > > Define an RPMSG node to work as a container for a group of RPMSG
> > > channels under the imx_rproc node. Each subnode within "rpmsg"
> > > represents an individual RPMSG channel. The name of each subnode
> > > corresponds to the channel name as defined by the remote processor.
> > >
> > > All remote devices associated with a given channel are defined as
> > > child nodes under the corresponding channel node.
> > >
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
> > >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
> > >  2 files changed, 108 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> > >
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > Warning: Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml references
> > a file that doesn't exist: Documentation/driver-api/gpio/gpio-rpmsg.rst
> > Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml:
> > Documentation/driver-api/gpio/gpio-rpmsg.rst
> > 
> 
> The .rst file mentioned in the description is included in this same patch set.

Then can't the .rst doc come first?

Really, bindings should not reference kernel docs as they are used 
outside the kernel. However, since there is no other definition of the 
protocol, I think it is fine here.

Rob

