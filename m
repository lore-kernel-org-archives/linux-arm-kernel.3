Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD8CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn1cf/2G1XAfRKst7JuV3s2fqRbOiLvk8GIPBUJjUtg=; b=oFTbgncPueAX+C158JiwugSesI
	cFkTv82rQuqeDXwreBMYY/zo/vF2DtAD03l21qxoTDZOKWvRMrjk4ddqWGeMxxloXSLEtLHyRcYwh
	e6MD3V1E4cZqrAELp1q+V35d/OhRjLKBTKO7CFEbMDrRj0FvqFOx7W1DxBclJH1dFnSKShR5CC34y
	rjDLZh2JM9LkN8rdOxbJF2VuAnTNAxOXQD+GFx/SxMrGQ07krS968cGqDN148W4UU96Bi8LEf9EEi
	ZSTEfAZcBI1OLrNBN4pGRu4j1VrIwjfq/zQ4X3e0AFGVCjikLQmkd481CrJV7K0q/QTofxo9czRvh
	y70H1m6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9Ut-00000001EvN-3Acp;
	Tue, 06 Oct 2026 18:02:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9Un-00000001Euw-3NmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 18:02:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43B8143C13;
	Tue,  6 Oct 2026 18:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE90D1F0089C;
	Tue,  6 Oct 2026 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791309753;
	bh=zn1cf/2G1XAfRKst7JuV3s2fqRbOiLvk8GIPBUJjUtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BA52giKoyHfyhpCln4903eug87nhQVCKX/PDe97zkg8DEB4R5rpHLlYnmv0t2GvBO
	 14OnGPEbXZhitW8AiOs3NBNAXGkyrR3coRIEnc9SJ9CL52M1rpG/OexOUUbFfjTF7M
	 3z+i8ewsimtJ/aThbzYtD00P/7xe8Vb4qgOJNLjZjG/NomsjxRgUtG2D+OlJja2ZAx
	 KGncZp8F7gyG/kHT3iRDTjhTlPGI0Y7sj6yUCdHMqc0llXONhqGoNJtO+GApmyFKKW
	 3uCKz6TB/SYBLBZj8q/8KQD+X9vdXVzmmO3fm0gq3BPnNKV7ssoeJBLfwlfUtDXc5K
	 5gxBj0lUizHKw==
Date: Tue, 6 Oct 2026 13:02:32 -0500
From: Rob Herring <robh@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20261006180047.GD2194299-robh@kernel.org>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
 <20261006030739.GA3457522-robh@kernel.org>
 <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
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

On Tue, Oct 06, 2026 at 09:18:23AM -0600, Mathieu Poirier wrote:
> On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > > From: Shenwei Wang <shenwei.wang@nxp.com>
> > >
> > > Remote processors may announce multiple GPIO controllers over an RPMSG
> > > channel. These GPIO controllers may require corresponding device tree
> > > nodes, especially when acting as providers, to supply phandles for their
> > > consumers.
> > >
> > > Define an RPMSG node to work as a container for a group of RPMSG channels
> > > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > > individual RPMSG channel. The name of each subnode corresponds to the
> > > channel name as defined by the remote processor.
> >
> > Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> > then 'gpio'.
> >
> > I still don't understand where the unit address gets defined. 0 and 1
> > look a bit made up. I'm sure you explained it before, but *this patch*
> > needs to explain it. When you define a second protocol, the 0 and 1
> > addresses are taken already, so you can't have 'clock-controller@0' for
> > example.
> >
> 
> I had a conversation with Krzysztof about this here in Prague.  We
> have decided to adopt the bindings proposed by Francesco in this
> thread [1].

Same question applies there. Where do the 0 and 1 addresses come from?  
Will reply on that thread.

Rob

> 
> [1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/
> 
> > Rob

