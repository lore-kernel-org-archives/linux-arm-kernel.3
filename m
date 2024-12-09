Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FE6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFeocjNOUdIRJAXa/Rnba2ub2M7xywjcZC0gF4rAoMk=; b=eXm8quzILhdb8wZNPi0BP4ccX5
	VelO08AWXMKOa77xzKi75HnhWPpvICnwihD+xAgYjl3iChSxaFx08SJzaWH0yG+4rReliVq1FcW2o
	75pvZGNX/wZT+2Nwa1JGTaP/STIO6xGM5K4lM1Dd+iJmpvqgs6xjNdAx3aZB+Yk4GF8GW8EJl37h1
	wSVtEL/NGyELbkqZ1alIMlUevIs51jrL5RZcMmQ3AETMVxhSezUKdfV1aHkoqV9zkYDQb5IEnx+Ec
	ddO4yKJGFUBuS9zH42KhV39fCx3xl+R9MZERGYjgBX3H5dT716n1hC+La25wlgH5J6NhUlX+POgbT
	JQp2A1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZNz-00000006yLu-2HWH;
	Mon, 09 Dec 2024 08:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYH6-00000006jry-1x6p
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Dec 2024 07:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DFeocjNOUdIRJAXa/Rnba2ub2M7xywjcZC0gF4rAoMk=; b=JcuMZoBQQqmqMVnKrKwn5E7v4C
	dsXLkvWPMkRjXm3mi1YH1yo9I2xliCg7PLztczggHXAfb7IkqyaRPTxPS2c1CrxESnUelyF2qJva1
	GTO3Fg1f3qtj4HxMIV9NKudU2vmk0E+Q2uBzej4f/eRLegao6ZtLEZ0h3dJdRQA/tA3rmJhjexbAO
	o8cDuyvk9psE9FIhb3KrMPCYWVwNA/yI/HC6hYialeRrTIiNMqhfR5PY2tostD4d1lv39UHE9bxGN
	eNTTif7ExIWDX5KObsd93EwJLUXwCFXXXNQmuxucnK+ZmFx2FMvlmM6mLBvnkjvTiX/kp0wJxmBwc
	Vl/3jY9g==;
Received: from [220.197.32.19] (helo=mail-m16.yeah.net)
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYH2-00000003UpM-3BuY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DFeocjNOUdIRJAXa/Rnba2ub2M7xywjcZC0gF4rAoMk=;
	b=Hfayqua+CSqQlibYs6L8LzVaOkTNskyTk/hsL30DQNAY+UdzhKUb6IA9KyfpaV
	YrOXfh6CNUcVk6Kd9nM7/eMj9INb1NO0QoObb/JG8m248rS5u9vHcgW0VT7uZu75
	JPl3/pU5w0RFqF8w7O19h1wefCwXuC/0l/udP2qdJnIkM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnpl1CnVZnpINvBA--.46282S3;
	Mon, 09 Dec 2024 15:33:24 +0800 (CST)
Date: Mon, 9 Dec 2024 15:33:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-zii-ultra: remove #address-cells
 of eeprom@a4
Message-ID: <Z1adQsiNfYMuVgp+@dragon>
References: <20241018183117.740439-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018183117.740439-1-Frank.Li@nxp.com>
X-CM-TRANSID: M88vCgAnpl1CnVZnpINvBA--.46282S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Xo2UUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWeNqafwAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_073345_421296_0140F81E 
X-CRM114-Status: UNSURE (   6.32  )
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

On Fri, Oct 18, 2024 at 02:31:16PM -0400, Frank Li wrote:
> Remove #address-cells and #size-cells of eeprom@a4 because no children
> nodes under eeprom@a4.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


