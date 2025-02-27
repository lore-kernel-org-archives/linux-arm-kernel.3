Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022B7C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAPQtpORN7wr4p40qn168BQ9TiQa9zRNnbg4X8SAfmY=; b=DxVcA9KXZTWuaYz8FKuz+RwzxI
	jJgJd7iR7hZHwucRUuLjKs9ppnJkeIpFrXB1gvk/rqkr+NzpBx2GChiPKQ1lzl1zZ+ZUPdnIotHuE
	NQQxOmibkfKZPsAzHpZqowdPztmqDRIMoefrWwnKIY427tg4a1QJqgmLpaQXQgpUBul8DEMJKCIwm
	46d4dFBIae71hD3nnhvToTaFax4nj2h5EOeJHxDo8Fvtr0Fdex4xikNgbsIXuD3PsLxJzdxnVcRZB
	IkCC4rLmc5DTn+s11uimFeuMjLRAjCegoy8yatbqXu21j1W2SI89F/fJzNJo8E6H5B9MEsa0pyZyq
	+Rykunrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnceE-00000007Hwh-3Opn;
	Thu, 27 Feb 2025 12:05:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc4j-00000007BZo-0ADf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:29:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnc4X-00058G-Bq; Thu, 27 Feb 2025 12:28:57 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnc4W-0037HX-2y;
	Thu, 27 Feb 2025 12:28:56 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnc4W-003Omf-2c;
	Thu, 27 Feb 2025 12:28:56 +0100
Date: Thu, 27 Feb 2025 12:28:56 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Message-ID: <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
 <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032909_073561_3866E70C 
X-CRM114-Status: GOOD (  21.17  )
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

Hi Laurentiu,

On 25-02-26, Marco Felsch wrote:
> Hi,
> 
> On 25-02-26, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > 
> > The AIPSTZ bridge offers some security-related configurations which can
> > be used to restrict master access to certain peripherals on the bridge.
> > 
> > Normally, this could be done from a secure environment such as ATF before
> > Linux boots but the configuration of AIPSTZ5 is lost each time the power
> > domain is powered off and then powered on. Because of this, it has to be
> > configured each time the power domain is turned on and before any master
> > tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
> 
> My question still stands:
> 
> Setting these bits requires very often that the core is running at EL3
> (e.g. secure-monitor) which is not the case for Linux. Can you please
> provide more information how Linux can set these bits?

Sorry I didn't noticed your response:

https://lore.kernel.org/all/a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com/

If EL1 is allowed to set the security access configuration of the IP
cores doesn't this mean that a backdoor can be opened? E.g. your
secure-boot system configures one I2C IP core to be accessible only from
secure-world S-EL1 (OP-TEE) and after the power-domain was power-cycled
it's accessible from EL1 again. This doesn't seem right. Why should a
user be able to limit the access permissions to an IP core to only be
accessible from secure-world if the IP core is accessible from
normal-world after the power-domain was power-cycled.

Regards,
  Marco

