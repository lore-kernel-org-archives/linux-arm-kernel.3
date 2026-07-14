Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4203C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZnKgW+PTI85uwSvBTZx6tE/LVkjSY/LHRD2fDPNzO0=; b=m4OhxHJpn+yPKI5QNGG8OEZt9i
	RhVw/6RzUIs+4W0YPBAVG5sjGQHqO/H0XQEyQ7Ggly02+w1Vi/420yj+qFL4mfTJA+5qZFZT6RLOd
	Jc1cwTHPq+kIE2Ikmgo2qQSEbapNb3Ueyw953brAhMclhOBZFhFYWpC2eFbv8x0wN1Uvy+TAChMHS
	uqvWF0/1UHwpFRvhywHr7Y3MeTLtdCDmwDZ6t+As59pnuhUWQRv1eHs9ZAbGJf9VuUR7MDFmH384E
	w/u59n1VBrG70Y5IdXT7wN2wxoUceEN/YjodqVJY5RJYIe/76lqy6X/JDZZeCndjPW9S2//8JZ2rg
	6L4vr66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjVc-0000000DCYI-0G70;
	Tue, 14 Jul 2026 20:13:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjVY-0000000DCXG-2oJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GZnKgW+PTI85uwSvBTZx6tE/LVkjSY/LHRD2fDPNzO0=; b=pDJ4GOG290nNbD7p9pehUqbd6J
	liRP7KZdmFIUYrnPXVRorJ+btZrptsNhTyOE6IcMio8Z7W0/PkmCvK/jiRDtGbzxLi5Rm1ihsYGcP
	D6XqGXjWUEYD1ptZjY+ed8cKUhRvmUeZyVFvFrqTJk3NuFUrKT/o+vUrikzcxituPc94=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wjjVG-00CFLL-Bi; Tue, 14 Jul 2026 22:13:18 +0200
Date: Tue, 14 Jul 2026 22:13:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <680d0633-cdec-4545-9114-79bfd6eaac41@lunn.ch>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_131336_710530_8C2A4C31 
X-CRM114-Status: GOOD (  10.52  )
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

> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> 
> Interrupt masking and unmasking are handled entirely on the local processor.
> 
> When an interrupt occurs, the remote system masks the interrupt and then sends a notification 
> to Linux. After Linux processes the notification, it sends a SET_IRQ_TYPE message back to the 
> remote system, which then unmasks the interrupt.

Masking and unmasking an interrupt are orthogonal to the interrupt
type.

When the interrupt fires, the interrupt core calls the irq_mask()
operation on the interrupt. That should mask the interrupt. Once the
handler has finished, the interrupt core, will call irq_unmask() to
unmask the interrupt.

Edge, level, high, low, raising, falling has nothing to do with
masking. Please don't mix concepts which Linux keeps separate.

	 Andrew

