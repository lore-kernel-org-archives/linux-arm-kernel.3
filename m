Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E28FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0peh9BPV0yzb2/7tAvDBxb+1fXYB7Zsg7ey2Fi9LQY=; b=XSwbL4HTBIfyMV4cjxyHBI4bhG
	dZowaiynKT5g5fLDLIoM7p2lUszeKDcWfey+tK9zSl7hWrvQuBwuZLNOgE68JB7R9BmUg/ljOxfcF
	sPuLkNrJZQLIAgc5XjJK9O7/L0JHkio+Xy1ndZ9flszMT8z5aI6YyQrwS2iz5sw1MyjT8Vl29WpHj
	KLIiLSAc3qcH21UnlyhkJFEsr1A747oMRLdb5xIB3eTF7PK9n2gdYTzMMWyAY2ZOH4YiKZ1O58xin
	edR7m9obZtNU2/ut+Dhu0W5tAGASIh/Etcn/0iKE6aCTM8AZH6/fv4fiI1ZSAfYBtWAz8vJCZMqTv
	iQH0alqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCZ0-00000006ts1-1rxf;
	Wed, 10 Jun 2026 06:37:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCYz-00000006trq-0dDh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 06:37:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FF4543EE4;
	Wed, 10 Jun 2026 06:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521781F00893;
	Wed, 10 Jun 2026 06:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073440;
	bh=i0peh9BPV0yzb2/7tAvDBxb+1fXYB7Zsg7ey2Fi9LQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QAYVMr3VL8i2R9MeuoZCwTDDw/WAweSOBhiktrpWJhL+hTPub+f2EIUM4Yv/U1+kL
	 dH14bFzLv0AZQc/ccBmiiqSs7Qf6QC5+ex30l4EaWXrhWBlRCmp6HYRgAUE4JaFuSz
	 KIGnTwNyPOtu4FwyPVeX0AVPu4q22k/Qzz3cRBFtzdznfuOysKgdbTfhw8kf297+R3
	 MvRB88EUQbQmKjLcGMZyr08CfxtxRP+grSU77RDkEvUulRhOcoFTJJxDEQzfhIvgH0
	 YSjrNDUrzvUtUXH2RGaGrwXJmA/NRwJEx0GRISOLETlqcLzcSNsJUa1H01VXxUqzvG
	 goTUKOfj3pH0g==
Date: Wed, 10 Jun 2026 08:37:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Andra-Teodora Ilie <andra.ilie@nxp.com>, 
	Larisa Grigore <larisa.grigore@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v5 4/8] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC
 support
Message-ID: <20260610-crouching-wild-mushroom-c8bf6a@quoll>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
 <20260609142954.1807421-5-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609142954.1807421-5-ciprianmarian.costea@oss.nxp.com>
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

On Tue, Jun 09, 2026 at 04:29:50PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add NXP S32N79 SoC compatible string and interrupt properties.
> 
> On S32N79, FlexCAN IP is integrated with two interrupt lines:
> one for the mailbox interrupts (0-127) and one for signaling
> bus errors and device state changes.
> 
> Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>

You cannot test a binding (in a meaning what "testing" means). Building
code is not testing.

> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

Not possible.

Best regards,
Krzysztof


