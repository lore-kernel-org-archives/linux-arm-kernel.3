Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5870DCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw9RpSrpy3LQeF0T3TLjUcAEHYl7KsfPvPvrmgasn9M=; b=BbbF28VghqLnRpsyrs/Bl6WHt8
	q3K5RQjGiQL7X+95j2VLNgLqMxJL0xP+Nd3Zgf/WUY0aTz2b2ZFvU77xe+eiulguSsq5pWzNj5OhX
	HD5AgAOyLp+4g46ULjezm5ohblQs8ZqJqR6zihKJbvHI9EnKOG528dGxgUcF3US/4XYxAtq/mUtcD
	WX/dtQGsREggHb9jmdIsWLCUh+PaB0neHVMhjEzLBB9oKI/CxZyLQ8+ie5uAqNd5c1QfB8euRVaz8
	sY8bU+FFctzu6QUuwCz0AJRAasADSDqmmfxsrjcEwqtOprJID9XkKjx3UmNFcvbZEZePnTz3B5w68
	VbcRYDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVbr-00000002oPh-20DZ;
	Wed, 07 Oct 2026 17:39:19 +0000
Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVbo-00000002oOG-05p2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 17:39:18 +0000
Received: from L30177.local (unknown [78.242.246.191])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6F68C780371;
	Wed,  7 Oct 2026 19:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791394749;
	bh=O/57xv8xoLkRWnqnHdElm1MmZ+p6nyiKXa3vcY+o/wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpizUNvPtMKaEV4wbsM4GTgWFqsNqaTVu7N5L0esAWkEb+e5ReUKaWyb8H8YEr2cV
	 4zX97LdIRqgeQHy6I9etOl51HQDAz8g4F7Il8vnMlCqrwG2OLM/d4jNsxDJoDawAf9
	 vhBK+WmzR8lVlnjPHPrVR1/QX9UNnbT+Tqp5JfBmuHQ0oBVfQ39EkuxMZsnGPx+lc0
	 stFItnG0QDdJ2KYEoILf+D/8gyHD5co0NlQ74FZaWpcFf+xrGsVJpMwu2p73UjCTSj
	 uouTZgPP35jlREN1vVa+jQxJgUt8R1HiKEtRhqasJH59er3DPJnd4jKJofY0KQ/t3Q
	 pWq9tXUyZBiZQ==
Date: Wed, 7 Oct 2026 19:38:47 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>, Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: layerscape: async probe by default
Message-ID: <asaDp512mFdyCvXs@L30177.local>
References: <20260928-for-upstream-pci-layerscape-async-probe-v1-1-76412d887baa@free.fr>
 <arqSa0OwMd1Bx_Ex@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arqSa0OwMd1Bx_Ex@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_103916_492504_3EDB16E0 
X-CRM114-Status: UNSURE (   7.24  )
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

Hi,

A gentle ping on this one lin paatch: is there anything else you'd need from me
to have it applied for v7.4 ?

It has the Frank Li's Reviewed-by, Sashiko found no issue, and it still
applies cleanly on the current pci/next from today.

  https://patchwork.kernel.org/project/linux-pci/patch/20260928-for-upstream-pci-layerscape-async-probe-v1-1-76412d887baa@free.fr/

Best regards,
  Vincent

