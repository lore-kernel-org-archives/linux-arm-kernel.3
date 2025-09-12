Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E55BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78rUm8cxq+LJJfG9N5KlRJZsUIMPmzq8mUjXRiVwA6A=; b=Nh/wCeL58luXWmh9VL/H6BjgSj
	xqPMikhlw5+iwvPa9pdwmkVQtfxAG2IjV03Idgs5vp+2B1bDuIPzcSH6Brmvzadm/v4/SpVhfckiI
	XhG/QkxwfAUQ8V7k//OxM57o9TlT/3qWRfibf8dW6jcMH4Phz0dRhNC8wKf9/JhEzm6G0tJWMMwff
	P+EGHIOvK2rPig1H6kIpBeMD75DMH/iV5NFBsHBImL9Ey/mS3FCuOof2mZwNHEp4ABKf1kHnX7Qtb
	5LFaAxTBH4KZhj+Gg5gskuv2/FNSaRgqARt2eMT2RLj3CPhGK8EE7h7+2sOhN0T61gIjxytibievN
	pYuL8kHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzSG-000000080wp-1w0P;
	Fri, 12 Sep 2025 08:48:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzSE-000000080wT-0kST
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:48:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwzRy-0002c5-Ds; Fri, 12 Sep 2025 10:48:10 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwzRx-000u5j-3A;
	Fri, 12 Sep 2025 10:48:09 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwzRx-002xL0-2o;
	Fri, 12 Sep 2025 10:48:09 +0200
Date: Fri, 12 Sep 2025 10:48:09 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dmaengine: imx-sdma: fix spba-bus handling for
 i.MX8M
Message-ID: <20250912084809.e6atdywisk4ywlr6@pengutronix.de>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
 <20250911-v6-16-topic-sdma-v2-2-d315f56343b5@pengutronix.de>
 <20250912030223.GB5808@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912030223.GB5808@nxa18884-linux.ap.freescale.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_014826_216347_D11029AB 
X-CRM114-Status: GOOD (  17.12  )
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

Hi Peng,

On 25-09-12, Peng Fan wrote:
> Hi Marco,
> 
> On Thu, Sep 11, 2025 at 11:56:43PM +0200, Marco Felsch wrote:
> >Starting with i.MX8M* devices there are multiple spba-busses so we can't
> >just search the whole DT for the first spba-bus match and take it.
> >Instead we need to check for each device to which bus it belongs and
> >setup the spba_{start,end}_addr accordingly per sdma_channel.
> 
> Could you please explain a bit why it is per sdma_channel, not per sdma_engine?

Well first, the sdma-slave/user defines which SPBA bus is used.
Furthermore not all users have to be part of the same SPBA bus or be
part of a SPBA bus at all. E.g. the i.mx8mm.dtsi sdma1 engine is used
by uart4 (not part of a SPBA bus) and uart1/2/3 (part of the
spba-bus@30800000).

I know that the use-case: "The SDMA engine can serve for multiple users
which are not part of the same SPBA bus" is not yet used but having the
code in place makes the driver more future proof.

Therefore I think having the SPBA addresses per user is correct.

Regards,
  Marco

> As I understand, all the channels belong to a sdma engine should use same
> spba_{start,end}_addr.
> 
> Thanks,
> Peng
> 

