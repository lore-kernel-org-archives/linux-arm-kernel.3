Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E629EB48E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ldWFSho7cgvpQS3kw2NKCZEi+w6HLlHSMQtO3IQVz4=; b=jEBbx4wgxo8eumb5bTTsAxOAZr
	tIZd3n3crpTw4po4XY2XJhhVPbn3pCOUfkpsifwg879MfoWyBBvZN+3FHG4BiK3QqYc5GVLCj1pVa
	//NOGEP9d1vH48L68c6RDW/D1kkP8WRTVcmVzHrQY2eN67vt+I4puzsvFGGdSYTvnBxQ5G9lrPFvW
	D8zG4VpPDCJ6JJ8tGJVsNjlVNCqIGsA/2Zp+0kfQrNS5JJBaUy9BNBBjt1+gcl9+ftz+yxZ55mr+G
	AdKESf4Kmw0V4H+fiBHRNuZRIgBFByKZpUVrZ1mdd+u3gCXmwz+Onp8/cpWwZ5Lz3reacQFkxrjwd
	3J+2kCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSVJ-00000001mmZ-2i43;
	Thu, 12 Feb 2026 08:56:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSVF-00000001mix-49zn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 08:56:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1F244E40CB2;
	Thu, 12 Feb 2026 08:56:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95A38606CA;
	Thu, 12 Feb 2026 08:56:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9DAD11971525;
	Thu, 12 Feb 2026 09:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770886606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0ldWFSho7cgvpQS3kw2NKCZEi+w6HLlHSMQtO3IQVz4=;
	b=aae3UbguXIhpWxFQQi5HZqISIhQQGKUqxkIEuntQznrTF4HZSltGDmKmvpmLvY+vPwYccj
	5wAj/jFC3tDuBq+AZpd9eyHLMR0GZwpWGsKGyLGQbfQVu1BX4/+T54klACgBF1DLGxfWXw
	4AjJHrQpukpjOqwat6Moc7G1GVsUOn14tPwMtIt6A0ln3LgfKt9zAUNgx4rTqANZ9JHsd+
	ngJQkUf0qz0VfbQIb4hOEkwoddhYkBNNJMUAdzovu3syPptpSLabzi3WF10KLHwuHvwD4y
	GpLfs+Nw/CPeEbtDQ0u/IC+B6WM7setVLyWqh8ckdKSoWAfWx/TEsfGycX+SFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
	(Frank Li's message of "Wed, 11 Feb 2026 16:19:40 -0500")
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
	<20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 09:56:44 +0100
Message-ID: <873436z6er.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_005650_154377_1C25674A 
X-CRM114-Status: UNSURE (   6.77  )
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

On 11/02/2026 at 16:19:40 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Set #size-cells to 0 to align with nand-controller.yaml. Remove the
> redundant empty clock-names property from the NFC node.
>
> Fix below CHECK_DTBS warning:
> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yam
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Besides the prefix which misses an "A",

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

