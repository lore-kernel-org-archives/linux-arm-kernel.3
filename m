Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BC3C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CgMYzN7u/XA+bnop2JDgsNdowKH5ww277Ab2jeFzYI=; b=NeF7UItTU4+MHGGAhnioFd2e6u
	CqvGgHJMcEj6LwSGrIM8HASWHYAz5Cvy/o3nrdhnFg53FV8c/kAtZ/wFTXX3lpLRbAJKt/kSp9Opd
	ItUyKY4Ne5DtU7aHqR+xp4vATUjS4ytNbV12Rdw6EzFmgkUbyl+OwzjhmVdz2DfubVesghpTgqx4I
	RKS1KKPZBMBgahxRLqHjO2EwSxji7bY3+hXIrSJoiWQ9AlEERIOPJO3XhlLwP2f4VQoceOIQ28txG
	m+xngSBn4fAu9EfW3sluuJ/g5/5eksvdQmWBTY22TPK2vrn9p334CmIIz6A/h+40NNQabu/Nzes1m
	IjXTI7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7paK-0000000G3mP-1Gfd;
	Sat, 19 Sep 2026 07:34:08 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7paH-0000000G3l1-3cXo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 07:34:07 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789803245;
	 b=sd1R9QAOgejbxNxNKy0nih87g5kMfTC1ZSudaVH08FkXGifgBMdoiCGefuD1xwpTLgS0N/rIgC
	  rCS05Wu8Li1U2F55ZHdSDvI9ZNhUF+3a9Z+ll9MLqX2Hxovmg3vjSehvuGnxz6BVzhmOQqwQAp
	  wmEzNUq8uMIArKl81/k/C2I62K3a6jdWbnNgIGHQJSaeWX3cON7Udm049AqVYA+/fWm/o0KVZo
	  jkNsCK1pger8NQytF/VQd1YlkCjKOOkYFLRtp8w/iBbyoWPvxfB/88ftuewDvx/TNw8r43dl8R
	  AMLhNh0Rih9cov0eqN3NBix9N4PteLWk0htyMd2WqLH9tw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789803245;
	bh=llg/PF8nMnnpezaHPpy9KBWeZf3PiiHR8A/GPkRQCtQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=2ULfYf+Tlgmed8TaYF/hLLyGaWn4/eleHCF0DZw+G7RWDbLJcry7NJ2vTQz5kYX1blEroTmBfz
	  uGwRR16ZjxDMPYzkyYgPyaCBVfgkh8YvJMu9oXOoGcwgr2nXhvVddOnF5+ctAb1B4wLzTBhR9C
	  RO2UEGXkNFdERFr4BR7IHCA+IFsgrQmTY6MQG9GDwqWy/1TIHisKwKCIw1UDo0csbc8RfC/nUG
	  K//kh7gYcym9ets3+KfdoTokvlF4RJ8VaRKNUpXZTkEJC3NWR3Vm5XZfzK8KCU7z9LZ7ZrqTbN
	  RDRPJeL6RZpxEBc5GVyb1prn7S1+94pNqhLB/uJCo00Arg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=1CgMYzN7u/XA+bnop2JDgsNdowKH5ww277Ab2jeFzYI=; b=wh16xtvzp5QttGwCuzm40ea4DV
	Ekt10JKVJwuV6RYTEO2qYT1TjfA4WblUs+E/se3Ef2rPXJPQiSAWrZFguOlOIEbEB4fVdW38F5TH/
	nY6RFxF1MZadloDjQoYCcYzLFtIY8IdLortpaWyVanH0r8VL3Vz0KTskNhr4IZY4qW1I=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x7pa8-0000000ErcP-2Msu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 07:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=1CgMYzN7u/XA+bnop2JDgsNdowKH5ww277Ab2jeFzYI=; b=UpO1qiOnq7xdcWjgHZmVoz6PH6
	qnX8EWkbIbCQnHos0YlsXjQrPVX98//3jAxv0fogZLwImFWx8HL4sgPGe3Cd6N7yD0LUfSxLJvPzr
	CCHTUlfULmZRgWrMaDWDzF0qYbREJFaOi177rp4/VFmpRK+nl7GD9XvXkPWjmtJwzthc=;
Received: from [95.75.45.71] (port=45394 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x7pZp-000000006o5-4BDY;
	Sat, 19 Sep 2026 07:33:38 +0000
Date: Sat, 19 Sep 2026 09:33:36 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
Message-ID: <aq453yukMHiNb1jp@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1sooGCYUiWbhMH@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3b0a30f31f0b661a21355790a15e251e
X-AntiAbuse: ID - 3b0a30f31f0b661a21355790a15e251e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x7pa8-0000000ErcP-2Msu-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_003406_125501_984A303F 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi Mathieu,

On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> Hi Francesco,
> 
> I have started reviewing this set but given the size and implications, it will
> take me a few days to get through.

I'm going through the review done by sashiko - would you prefer me
sending a v2 with the trivial errors already ironed out before doing
a complete review?

> 
> Thanks,
> Mathieu
> 

Thank you!

Regards,
Francesco


