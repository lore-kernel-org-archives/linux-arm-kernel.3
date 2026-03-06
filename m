Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A9FCB625
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WshcvYtkXXe1rUX6+z4QlVhkmQAJ3iSCBEssBtgD1BA=; b=1Ft3Sd7GwRmVT/7uCZuW8UyW/W
	6jOfuYtJPV3U/nQA0hmQxb0T0ak12+3B9FGMxKwUuHh90WgqQKZbIVAgOaWS9BuzshDn+anc54xOT
	sCov5C6axfRZN+uuAWJ9QOiaoeDwu6ylzX/NVfmnjDyxEraL3voHahJ5mCTFd8C+H4TamSKX1EPt5
	uGqTbJsrMP0UdkvJLQ0LYxxMLKqdKSjzv0l2RAJi8cqRSlg+vyJorJMmL+cVD+ngqQ8aLrSG8FTGN
	GQOkHEC7XUf6LUyfCzbMO/5n0Jkmqt7t33qvIZvyjKgcStGrRf9OrkJroW9rqCJXBM0Uz7cHyP+4t
	s1tJW2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYU1-00000004BtO-3cXM;
	Fri, 06 Mar 2026 16:57:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYTz-00000004Bsr-2Xlc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WshcvYtkXXe1rUX6+z4QlVhkmQAJ3iSCBEssBtgD1BA=; b=EnZ7nDp6Vhm1GkvWzTfn4nSwP4
	mvy9s71m8Cs6pMx1IfA1XvwYAqK6/kE2I9a2dvQEdd8snSHf7S6XwypDUc5YHR/HCEC/3cqhV3/Km
	tyZCeMQkwyu4NMLtloJ/XsLkhVXfb8//uCGLIMSr86y/atlcUay6U7O21y2nOUA0bPXI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vyYTl-00AVkK-Sf; Fri, 06 Mar 2026 17:56:45 +0100
Date: Fri, 6 Mar 2026 17:56:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
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
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <8f83ba5c-bda0-485c-bf9b-052f1fc33879@lunn.ch>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-5-shenwei.wang@nxp.com>
 <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
 <AS8PR04MB91764DFDA8D3BEF64F583969897AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB91764DFDA8D3BEF64F583969897AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_085659_649258_7D841D55 
X-CRM114-Status: UNSURE (   8.82  )
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

> Other vendors may add fixed up handlers in the same way to support
> their existing products.

But that is exactly what we don't want. Why bother adding a generic
protocol, if vendors then hack it around to make it compatible with
whatever their legacy systems have? We want to discourage such bad
behaviour.

How do we discourage this? We add the label 'legacy' everywhere we
can, so it looks bad. We put the legacy code into a module, behind a
symbol with LEGACY in its name, which is disabled by default.

The messaging i've seen from ST is that they will use the generic
protocol. We reward them for doing this by not bloating the code they
need with legacy support for other vendors...

     Andrew

