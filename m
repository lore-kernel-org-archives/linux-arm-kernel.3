Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99CD116F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lEA07+/hkDJ8JJLpB7l06BYU/2a5Curlp04Uz301j4=; b=1hQV3TRhQUPdoJWyHJfWxY4lbF
	8jlCNQgV/U7pY4Ho+y19cKDlhD43ndqLXQx+Sh37WvIQuHfxE9E7ECPAjCj1uty3S8CM6qxmD93L3
	RaKwAgE8dqN3yBjm1BEa9jlwh84NAqKzxGVKnL2j905GEbjgDEuzHrXCi4fCgI7n8zkHFXvXxgayc
	srZ+zfVCtdjyc+XKYF3lbX3smarhCrcJa9FSNvR7ECybHhnbL+XBM4Yc8A223w3cuuJZKa1v0Mv5Y
	+Ul2nfsnXAYhvoSW45O6cCViKNsAsHwQCDrGJ6fc+0VEWTOR0Qihk8+gSCJs6vt+jxLrreZnzwRkg
	SuapW0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZlH-00000001hjs-40zi;
	Fri, 03 Apr 2026 08:20:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZlF-00000001hj3-47Zt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:20:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7DF884E428CA;
	Fri,  3 Apr 2026 08:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51CEB603C1;
	Fri,  3 Apr 2026 08:20:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F7671045013D;
	Fri,  3 Apr 2026 10:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1lEA07+/hkDJ8JJLpB7l06BYU/2a5Curlp04Uz301j4=;
	b=LZ7oUbaEToEHCxN6FYUkEf3my3laRHBinlvDgV4xdlrX8K+3GjBUPsQB9rlYaWP958Yxgo
	NZzqarCO2SP05QFWNYxgU/BT54wResKkf5ahC+kntJltW+vIXNrzqKd2NgMfuQO7IVU1T1
	DGa2C7nWnv9BdDHqEQFEjwGBgYgzeXtmnqOlyt/QiT4j82jdYqN9vLBufpBgQFSOjeSbfA
	GOrjauNWJ9k7m4NhYl4MJ0K34Kc6DRnUGrXknnKqCbta0P7l3/EhiA05Bjw01r9BAXiVB8
	6iKIZzPpj4vWxPVS9uDlpwCbtFNNzuxcMGLj07LqNBnm8aNDtTnYKar1sefn9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Daniel Baluta <daniel.baluta@nxp.com>,
  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS),  imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE),  linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 2/2] ARM: dts: imx25: remove empty clock-names for
 nand-controller@bb000000
In-Reply-To: <20260403074634.774234-2-Frank.Li@nxp.com> (Frank Li's message of
	"Fri, 3 Apr 2026 03:46:31 -0400")
References: <20260403074634.774234-1-Frank.Li@nxp.com>
	<20260403074634.774234-2-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 10:20:07 +0200
Message-ID: <87ika85ubs.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_012014_151534_D87DEAF3 
X-CRM114-Status: UNSURE (   5.41  )
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

On 03/04/2026 at 03:46:31 -04, Frank Li <Frank.Li@nxp.com> wrote:

> clock-names is empty in nand-controller@bb000000, which is wrong.
>
> Remove it to fix below CHECK_DTBS warings:
>    arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

