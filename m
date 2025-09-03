Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A338CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XNf5/0MJV7kREAd04x9fYTARlNqLAp/5VDO0xJS12E=; b=O7HgmNMDcd2mRl8EKsecWnuven
	RL1+syKI7qvpP6YHXql7L4rF/Gr+5AhhJKyx0Xwu9sgm2SvyD1HM/g8A6cryA27s2GCUYpeJB5w3v
	4ty99u5jTSb4oFZQOfYz7eCC+73dlUWA3zBAROGxJ4FF5yYPi1OHbXpGN7hVu/fS7WDNJN44LyDOG
	dSDFDL2hUTCn0AoZ8KVgzvtijLwGVokn1bBSL+TZPptWrCr7D5rtNXxp+ejsAQTkDPIPZAJO4KjGp
	H7SVLWCGV56wXIRouAoOJYvPf8g5niyMJZA1Ksf4l+G2oMxfaEFF7TVtku/pZAixp7i+a00cHqfPz
	TOgm0g9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utuzv-00000007gK3-1Vcx;
	Wed, 03 Sep 2025 21:26:31 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrMT-00000007CJ5-3nSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 17:33:35 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id C54BCEC0398;
	Wed,  3 Sep 2025 13:33:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 03 Sep 2025 13:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1756920812; x=1757007212; bh=1XNf5/0MJV
	7kREAd04x9fYTARlNqLAp/5VDO0xJS12E=; b=BpPy2gUqB9aVf5uXHsQaXF1n1H
	Rz7jCUrhVcziqgZ2dwc/yv1S6HQA02ms9KtH4Y6LwShA1QZAs46m93l0ybNCUmXa
	dVztJ7uFBT0BOVGQMxzORwlXeANEUodBhb9eeLLLE22mHal/G4O6dwBLOIkAWJff
	qOcqqYVAz6WlqsnzmapRGJW8t91aZmFdhB7pcd2JvEKFIOJWz91DCalCNTChqY7k
	0eJhQ1FrzdOcP/opIqJQ4A0mTijQYZShiSwTxwBLiIWp+9vDxSSXU0knlEY1PIqa
	tT6qbkS7d5gJ5243xLecGNVfJtpA/sD6etWPoRXY24d/MhMjfbsvCjLT4bpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756920812; x=1757007212; bh=1XNf5/0MJV7kREAd04x9fYTARlNqLAp/5VD
	O0xJS12E=; b=VvNkCiz9s85LG7PTTvYBnR7hlmVj83MSdm8BS1ymnbALXLuUoHt
	ZyrSRz4vW7ZIYUmCOA9X5Z0Ks8udVThysof0bAvQwrM67uu9HIiDc6dqCzBh6/DI
	lhW6Qpx2Fqypcl4uc2Fshn2aDA81e93Nmt7w+qC36ppoyzdNaXcc3UtbdDOYL4Xz
	kCBRNyjDj/qbDHbEMfrjVqL4RZu+yLFFH7vPsD+9uoi1FEKBPLnfJ0PyZeXX4rD0
	H+iSvjmGP4CzapzeCejGCQgn5TM45oC3p+S1/Hshv/PwQXwGl8J0mJALGBvUf2t4
	JA3dWsmO6ZUTh2t36RP4dVVvN9BK1x3cw2Q==
X-ME-Sender: <xms:7Hu4aLTFTLuiWEfOPnWdBudGG7RZeFQF-7JKiMBVDqHq7SBamjPvjg>
    <xme:7Hu4aHPz2NzDKUuX-ZysFiPZuglL2EinF194MQkQK-Cbob-k2lp1Efnk3XbYNy5l_
    j6ICthyq01dWvsXxg>
X-ME-Received: <xmr:7Hu4aIV4h23v9Wca_czC-YYHxdQaKvYzNOqStKO5Zu4hu3ozQAzzve9ZnY43vR1uZ7JOY3dbjLQ2YVpFOdD1ZHjQc9msp_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujggfsehttdfstddtreejnecuhfhrohhmpeflrghnucfrrghl
    uhhsuceojhhprghluhhssehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epveehvdfhkefhueeitddtgffgfeetjefggfetleduvdeggffhueehgefhkeekkeffnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjphgrlhhushesfhgrshhtmhgrihhlrdgtohhmpdhn
    sggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhlrg
    hushdrkhhuughivghlkhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghs
    rdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgrlhhise
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhifihhltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehlihhnuhigqdhptghisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7Hu4aCjwgUbGTTqfgpsDrVz3DGUYa_G95wBr-xOfaR4mOJDw6JYPcg>
    <xmx:7Hu4aJjQZD3DzuqQgfaWyOskn4YLr6bu93Hp1LCL5ErxdAGINxj0nA>
    <xmx:7Hu4aIFrX2xIvocCAbMxC1rQTOjmFGRKcSs_8aJjIc5KqdMtVpWq9Q>
    <xmx:7Hu4aOD3zOUkfPh6xOQRTlbuly4rg4e9ZTrIkfUQszu8TBcInXPI5g>
    <xmx:7Hu4aDNhCzPnNJmwOw_RR1_8LWiGkDIyDn7nnMstHxqO_fwSsH0LB5SQ>
Feedback-ID: i01894241:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Sep 2025 13:33:32 -0400 (EDT)
Date: Wed, 3 Sep 2025 19:33:30 +0200
From: Jan Palus <jpalus@fastmail.com>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: mvebu: Fix the use of the for_each_of_range()
 iterator
Message-ID: <pedyo2xru5fmbh6ordly2o3gj63k2vakheqp75ri47mzuupi66@qchlw4pmwhny>
References: <20250902151543.147439-1-klaus.kudielka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902151543.147439-1-klaus.kudielka@gmail.com>
User-Agent: NeoMutt/20250510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_103334_010829_3A68FC9A 
X-CRM114-Status: GOOD (  12.86  )
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

On 02.09.2025 17:13, Klaus Kudielka wrote:
> The blamed commit simplifies code, by using the for_each_of_range()
> iterator. But it results in no pci devices being detected anymore on
> Turris Omnia (and probably other mvebu targets).
> 
> Analysis:
> 
> To determine range.flags, of_pci_range_parser_one() uses bus->get_flags(),
> which resolves to of_bus_pci_get_flags(). That function already returns an
> IORESOURCE bit field, and NOT the original flags from the "ranges"
> resource.
> 
> Then mvebu_get_tgt_attr() attempts the very same conversion again.
> But this is a misinterpretation of range.flags.
> 
> Remove the misinterpretation of range.flags in mvebu_get_tgt_addr(),
                                                               ^^^^

Just noticed the typo. Should be mvebu_get_tgt_attr().

> to restore the intended behavior.
> 
> Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"")
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> Reported-by: Jan Palus <jpalus@fastmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220479
> ---
>  drivers/pci/controller/pci-mvebu.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

