Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B1CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reS54wtQHBJnB6K8azXiapyA5fEgeenFU64t0v4P6Mw=; b=ASHeqBuAq4iG75yivFIMqetpF0
	Ne7plmCCleBLo71H5WLUFBESJLn9JLZ+C/vRdl5e6JB3gBA6BSYAh42jIfNVEjVw5IrGKUANLLEjQ
	5VSN2AEm/XeGzYuAVPFuNk9UWAEPWascWQNdhMDG9RSDLQ8hjiWKxFjZxnAPCq4IvWWU3Ao4jkFOd
	6VRg3n5u3g97D2uEMQSpmjlTP8vS10TxQNYVtp1AzWnDH/28O/j/PEhqY5wa5mC81G+dHf9GSPIOl
	vRo0k/fR2FEj1Xh1Pua0MWQQSS9AFo1vmXdFcrkweF7SInazXER4ho2VGCzn/LrLCy9RuKQMCuNK2
	k0YBvldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp6V-0000000DY1e-2Dzb;
	Mon, 20 Oct 2025 12:35:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4h-0000000DVIL-1fVs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=reS54wtQHBJnB6K8azXiapyA5fEgeenFU64t0v4P6Mw=; b=hODF8FVeaEKgdQEUE1+0Ys+of1
	N3HSRzYzQvbDK1UAaQK4AhDa14bC8RdmEKMQX7d1kIjHeQyLpAwKtMtw/Ld/VmmeHE+G4Cc3tUw05
	+5x2Iiu3I9+wtvEAGGrnmFkkqKl2PWGsEri/n1FtUSc3Vu67hEqp4JpO9eAetYt/RGbA9KVVptSmK
	6Q7Mso1qBT+CT/0WMzHzDVwMgyTASGMl2BRVH0M6YjoYTr2vxtxW3en4U9MPgMn8+K0PWtOkFpMFc
	+UA+Hf9w/15rmwwnnVNpZDvDr/CavCTyQmSZ4Bf0pjhUuUHVMClSmW0wEwGMQgAPShqTdOR3l6GZ0
	w4lIjIeQ==;
Received: from mail-m16.yeah.net ([1.95.21.17])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4a-000000077zR-3Qy4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=reS54wtQHBJnB6K8azXiapyA5fEgeenFU64t0v4P6Mw=;
	b=JJWBAiQVrg/NiYwkUfQZee3ahGKYJLfCd1hGqLyttCCXK4nvW1Ty+u40D4CG3V
	/2SJr+7SpgCVCbTnt7kqOUEyTcT50UIGkhz2ZLniW1e1J/LHkP8qt+eVh+3QF1ct
	UMKJBzJUg34+JEKCmZOtan3WcgAsg2Crst7aseJjkvxEw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3H1ncK_Zo3plVAA--.16314S3;
	Mon, 20 Oct 2025 20:32:30 +0800 (CST)
Date: Mon, 20 Oct 2025 20:32:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add USB
 vbus regulators
Message-ID: <aPYr3DRVerHvWN0i@dragon>
References: <20250916080635.1520551-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916080635.1520551-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgD3H1ncK_Zo3plVAA--.16314S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7JKsUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB7ZP2j2K94p1wAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133314_599178_B536B57E 
X-CRM114-Status: UNSURE (   6.02  )
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

On Tue, Sep 16, 2025 at 10:06:34AM +0200, Primoz Fiser wrote:
> Add USB vbus regulators to silence the following kernel warnings:
> 
>   usb_phy_generic usbphynop1: dummy supplies not allowed for exclusive requests (id=vbus)
>   usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)
> 
> Because generic USB PHY driver requires exclusive vbus regulators since
> commit 75fd6485ccce ("usb: phy: generic: Get the vbus supply").
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied both, thanks!


