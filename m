Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71D9CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT4hgzsRMKonUz0r7afTuTXPpo+Txgw6N/Uo97ww8Bg=; b=CZNyI9KvAzEbYAJpDNflCfytYx
	CHc1s+pTurACiiPUYPwtQAH3v/zwflu3l9xhOtgoyCVQ8FxDPyAHIuA/SA9E/EmBmAURy2i2Ou8/J
	jm16N55y2NX7GQJkmsFl4mxOIpRzkf5rQDBLATQs/IbfKHAW88ixwNGy9LfEq3H8fcYSUoDBpzj/+
	hdQoQcVUMCzKYdTZ7H6Azeiem0OL8ZX+CBmuN9uh8lvG+poHfYmzizkmzW2I21Vd4KXuksAzjrjYW
	VL4TYt/iMC2/V26H3uIG3lXhKhINv2Im2aNVXvRxPwZoFMiaWD2VrC54vpHbm5z3xQXmn3775bLsc
	n8/SanLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvWr-0000000HXfc-2ku0;
	Tue, 06 Oct 2026 03:07:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvWn-0000000HXfS-1J4u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9B041FB0;
	Tue,  6 Oct 2026 03:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A291F000FF;
	Tue,  6 Oct 2026 03:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791256060;
	bh=HT4hgzsRMKonUz0r7afTuTXPpo+Txgw6N/Uo97ww8Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E54qJJP28qC99NMZ0qdbLZhIg9vlRfrTPOR4d7Cb6K1eiSttfjFpIbEZJkioPJLyQ
	 q7IDB6EDOVNlYQDXr12O3myoiSIGc7B1BZED5b2/Ee/WoNkHcYNCDeTwm/chRL1OJW
	 oDuLTqzx7Kv1sk6k56EZ+X70uK9ENLVZEzY3hZ1NKBvJZ5GIeQ75ymDGvCO2zqb3oU
	 3OSvSRbu9vRoZdzW1mlxKzwXeVBZ0uNA7p8FGeuiNuIO6g07kqlMl6viI2Wengv3Bc
	 FhnmWHa2F8MayuOMNOs55uow6joWJzqCEnv767UbJlGDaZicYCNxi8kVvRn55z5xCr
	 75MR4aTQI4xYA==
Date: Mon, 5 Oct 2026 22:07:39 -0500
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
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
Message-ID: <20261006030739.GA3457522-robh@kernel.org>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
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

On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.

Sorry, but DT defines the names of nodes. If it's a gpio-controller, 
then 'gpio'.

I still don't understand where the unit address gets defined. 0 and 1 
look a bit made up. I'm sure you explained it before, but *this patch* 
needs to explain it. When you define a second protocol, the 0 and 1 
addresses are taken already, so you can't have 'clock-controller@0' for 
example.

Rob

