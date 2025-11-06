Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB7CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHVpwSQIb4q6nngEnig8Xv2gBIL4ELmw4Ak6nVDC940=; b=cq3XSnBS0u6t+A3xLmRkFaKEeb
	VFR7kGWP74dUK/BGeHMk8jNbgc3UK5u6MJxoLVza4gUdGVs69KvQWpxLhJfjxfnoukqqYUdjJprIw
	yt+OuCcRYQuHOkwc3uDz4b++uGXeKFXfZJgKdCqc2provTvdAUuqu2IeGRZrRBe17ykkse4gLVCs4
	75cy7YtJ9k2m2p9mdhutVp015QBb18vphVSOhVs2Qj5/MBx5kmu2/AlQD1Apay8pIkuFuDZ8B8x14
	GajRBE++ZSc98uj2Da6XFTj6NNdsuk5j6QGUd7AB8bAUEhVka+AGenkgto/xYTKOpqTZ3VRWwVGyP
	vKel15Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4eC-0000000G5nO-1WPT;
	Thu, 06 Nov 2025 18:23:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4eA-0000000G5mn-1s8T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 18:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HHVpwSQIb4q6nngEnig8Xv2gBIL4ELmw4Ak6nVDC940=; b=j9d9o3Y07ktzUn6n29Y1ZcnV3a
	FnLSKV7cn77y2r+jS40bDPROLV4qkSLlKJe1N5ikg9SG8DmcIJ/S40thoWPxaJjgaFo1ZOOxpj1iB
	5sHsXmzY4o+UTG0kwtoedlUZNPEddEUFxiB5+9D5tHagI2P4ijcFzJiEM6lco3lHMnOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH4e3-00D99N-FT; Thu, 06 Nov 2025 19:23:39 +0100
Date: Thu, 6 Nov 2025 19:23:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <c034023e-94e0-4a64-9d9c-b463a6ab1e34@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
 <aQxUtqkvcH0ob2yq@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQxUtqkvcH0ob2yq@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_102346_481286_FD20743A 
X-CRM114-Status: UNSURE (   7.67  )
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

> >			rpmsg-i2c-channel {
> >				i2c@0 {
> >					compatible = "fsl,imx-rpmsg-i2c";
> >					reg = <0>;
> 
> i2c channel could be removed, it is not included in this patchset.

And i also expect a similar sort of generic driver for i2c. There
should not be anything IMX specific needed.

	Andrew

