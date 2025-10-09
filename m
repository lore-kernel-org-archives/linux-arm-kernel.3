Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E453CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZgk97je7BvnBwtTZvJvAprknS458qImb1v2YAT0hgU=; b=W/WvYIn2wOOgAAgoKMGoZhFUSB
	PdRyFcPsQbYtCC5aTGDwZEsXaV2+FfBKEaVh5/0GFPRi8U/TBEo8IXOm3f4zHxa+Vsm344YVlEnBf
	FU4ytCQfxPTearpkiRFno4nPmFmziws6+dySvV7FjlbTcYTeyKTSTS9x59oBxgaGGUuNFUZPK7ygq
	fN8Vo8cTbDhFCi+f8rtVAKHzSdFTkZRJ6WDFOODw/LBhZAn1CuTv/1c+1GLmy9g/w74HHzPw63mCy
	DKDtNGvcr48MQSIjzJ2J0xPZ18EqFUKakMolO34tRlkTPwoGp/XroCPPaw+9gQierSM2PoklTxvnT
	spq/JQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zaz-00000007Hwh-0Yzd;
	Thu, 09 Oct 2025 22:58:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zaw-00000007Hvr-3n1T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 22:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YZgk97je7BvnBwtTZvJvAprknS458qImb1v2YAT0hgU=; b=a8ct4zO2EH1bTh8uSTZ0eRMk29
	ClMuYBzuXEm/xC2ak0GE5naZl7uE8puV28N6Ru0JgmNQRpmNN8N3t49LKKCYEyF+oPoVHlVIVQVAR
	dNFG2Hr4SzTKZpsLQwCpyBmpcZqDsA/5gpTOM9O50vqjzaa70fIiSDxNXXYf2oc29c6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6zao-00AYxZ-PI; Fri, 10 Oct 2025 00:58:38 +0200
Date: Fri, 10 Oct 2025 00:58:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009222716.394806-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_155846_939548_A0D20CC9 
X-CRM114-Status: GOOD (  10.97  )
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

On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> On i.MX SoCs, the system may include two processors:
> 	- An MCU running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.

I've not seen the discussion on earlier versions of this patchset, so
i might be asking something already asked and answered. Sorry if i am.

Is there anything IMX specific in here? This appears to be the first
RPMSG GPIO driver. Do we have the opportunity here to define a
protocol for all future RPMSG GPIO drivers, which any/all vendors
should follow, so we don't have lots of different implementations of
basically they same thing? So this would become gpio-rpmsg.c and a
Document somewhere describing the protocol?

	Andrew

