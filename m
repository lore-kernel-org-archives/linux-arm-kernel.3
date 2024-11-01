Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC68BE6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iMD2VDH4KqmQhj2qTVJT5B3fJlTVGPmtyIg2iQE/Vk=; b=0UqttSlfKjaAdkN8HCfAx5xkPr
	rV6R7N01RON7XQLj9zvTGRl/A1mSYRSkOzNGsELzflJUKVf2neT0LE6OsBxbE6lHeA3lpSqEkBFq7
	OHtcNrhz5P3McX5NWnYSTcT6pGufMIDVgeX0dFe7zAeXAcSpEna+y28LFFWweWnCUUZ4D813yJxT0
	MiaT0qJ6OVLwjPlTDucF0xK4kw7qANN0P1x2hKPJYlArl/RfNUTNnX2rYOMAk00lSIGQ5THdsHjtE
	hBhVfHpnomnXeJAwKRJP/1DtD6OQlmt664DOlL4i046/9nw1RNbfMpHj9h7jmM4dol9V02EMyJ9oi
	MC1inCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6v0s-00000007mmG-2tr9;
	Fri, 01 Nov 2024 17:00:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uyo-00000007m7U-20RG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 16:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7iMD2VDH4KqmQhj2qTVJT5B3fJlTVGPmtyIg2iQE/Vk=; b=AVFqSa0vyXfarWO4XCwy9fl2v+
	FucFyvHXFieGD1CWiItF7nzdefa5GAXSwn1GO7mmS5UfinV6IjkPUh96ARpgogntS9Feo6RCQgOmT
	NXCk8dWT6vPFu3z99+gEAE6FCWKqf0Sw+lkCTr/H+xs9C2/4wI9qvm6nkwUw66K96YfwdEVIYPkSr
	GR8/1UvKGryk7Y0Qzisel6toF9Sboaja5v5uwG/pHA4qS5cdNKe0XgYHVIH2MzFaHaNP364E00t5k
	a9RKdgBTUQNuJjAhiWyCw9XCt9jG8ZalxFmVjPR9ZaS1dRdoE0QfLvcq8H8f7jVqh9QrwI+W7BL9+
	BQCcCMTw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uyl-0000000AmDq-1tuF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E7C15C55F2;
	Fri,  1 Nov 2024 16:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7C1C4CED5;
	Fri,  1 Nov 2024 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730480308;
	bh=GVPNqWb/dknPmd6p+uZIGZMEUGgcHP7E/AKSLlgyl/E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K9Ar2Dcf0WfbH4pBzF8hWpplM6RzTAXWgzy0ylB018g4CzZFpaSNTJk6EOzZdDyaN
	 d998mKDc3DDzrOEviXB6UF5p2ucgmSxnz21UpVMy9By7DaASKlvs/zG0TDiY4gJZXu
	 T7LMparyz0S+6yfu3VWIGfZFB1OgXldJejdaWUyAzqEzk5o7YuhrxRtGdIlWrLHjGE
	 yWWCMZKzibotcjJf628ub5i8+Y9yFCiGG2RLsgkkUBGuT+JAOc6d26S86yLdu8tev4
	 2giPsnN1WcTxGWLTsSULAGYLInqh29lYHyJ5qVoKTVLHSnwv5JkuZwuKtzDoWFIwVr
	 LTZPKmhyfRDVw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t6uyg-008vzw-Fr;
	Fri, 01 Nov 2024 16:58:26 +0000
Date: Fri, 01 Nov 2024 16:58:26 +0000
Message-ID: <86ldy228nh.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Krzysztof =?UTF-8?B?V2lsY3p5?=
 =?UTF-8?B?xYRza2k=?= <kw@linux.com>,	Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,	Rob Herring <robh@kernel.org>,	Shawn
 Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,	Fabio Estevam
 <festevam@gmail.com>,	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,	alyssa@rosenzweig.io,	bpf@vger.kernel.org,
	broonie@kernel.org,	jgg@ziepe.ca,	joro@8bytes.org,	lgirdwood@gmail.com,
	p.zabel@pengutronix.de,	robin.murphy@arm.com,	will@kernel.org
Subject: Re: [PATCH v3 1/2] PCI: Add enable_device() and disable_device() callbacks for bridges
In-Reply-To: <20241030210043.GA1219525@bhelgaas>
References: <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
	<20241030210043.GA1219525@bhelgaas>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: helgaas@kernel.org, Frank.Li@nxp.com, bhelgaas@google.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org, broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org, lgirdwood@gmail.com, p.zabel@pengutronix.de, robin.murphy@arm.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_165831_896000_97F0D9C2 
X-CRM114-Status: GOOD (  26.37  )
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

On Wed, 30 Oct 2024 21:00:43 +0000,
Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> On Thu, Oct 24, 2024 at 06:34:44PM -0400, Frank Li wrote:
> > Some PCIe host bridges require special handling when enabling or disabling
> > PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> > Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> > to identify the source of DMA accesses.
> > 
> > Without this mapping, DMA accesses may target unintended memory, which
> > would corrupt memory or read the wrong data.
> > 
> > Add a host bridge .enable_device() hook the imx6 driver can use to
> > configure the Requester ID to StreamID mapping. The hardware table isn't
> > big enough to map all possible Requester IDs, so this hook may fail if no
> > table space is available. In that case, return failure from
> > pci_enable_device().
> > 
> > It might make more sense to make pci_set_master() decline to enable bus
> > mastering and return failure, but it currently doesn't have a way to return
> > failure.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Merge along with the imx6 change.

It'd be good to have this on a stable branch somewhere so that I can
refer to it when posting the conversion for the Apple driver to that
infrastructure, removing the need for a bus notifier.

Otherwise, I'll just cherry-pick that patch and post the whole thing.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

