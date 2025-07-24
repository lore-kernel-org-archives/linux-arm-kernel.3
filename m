Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBD3C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LtD83yV0v7LiBchRH3nBUPkIBG3lT/TsppCXu6L2cEs=; b=QdaAwI5abuJtPC
	EHn3gpxpFaQ1nC4U6vTCIGiXXapuPJ13nvvad1JF9arNlk8AAPWSQnvMxsOH+5E73PZ0kCH1d9Kzi
	7M8s9bWkzy8V9XhDUVnaymeDH+bVy2qtF++JKVSqV58aI2ASFEX1+AgxwFpEFKEj+EVtjH5fz0wX2
	2ZDcZ3lWeuAsuRt9Bs2wy9nZYD7ttX5OC1238htcoylP1nJU3dr3qWPYmUeZYi6CHPuwJU1Ug/YMN
	RzSIxbhMTo+JxJXHtAJCcVKHerGYEUfoWhCY/mJRGq9+4gshEI67FjSZFIxGHXIYMzp/XRRcPwBlT
	mjGOIo2pS7UxAlz2J50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf1i9-00000008KSv-2qzY;
	Thu, 24 Jul 2025 19:34:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uez1Q-000000080x6-2ygP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 16:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F1B2A56553;
	Thu, 24 Jul 2025 16:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01554C4CEED;
	Thu, 24 Jul 2025 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753375339;
	bh=YggnuFxZNDdHmkQCqIlbYBbAnZ7uCChcEN4xtDygVK4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=n4Ohsh4gBa2yZix3c5JN8VjoVhV+ZcFo4cc+r6Ctl3PAzduinkQK728TEo+5ZE/C3
	 Kau0wf8vxSu2aRty3POjjY2wx4bKL4b5E78tGinmdq5AbJlw60FBscfxJEasT9JrD8
	 n8herMmLUCb20787/6vnkt1JLOQJtQVxTlhyuElEOSr3Av6gWOqUuSx4pxZArcZesp
	 qA6BuQJFPHgKmeSNHHsBcZDaNEADvO2MTvy389q+9LHZbp4BJBlSdqT8cTg2MHGryJ
	 N3ifWDdKKeFWkXQqMALZcyt97kVzC7IAit1JP6w88ptLJjDUWXtqT9ZmGEE46GguN4
	 NdP1LukyR+qbA==
Date: Thu, 24 Jul 2025 11:42:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use devm_add_action_or_reset()
Message-ID: <20250724164217.GA2942464@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHsgYALHfQbrgq0t@pc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_094220_816465_3677F986 
X-CRM114-Status: GOOD (  15.67  )
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

On Sat, Jul 19, 2025 at 05:34:40AM +0100, Salah Triki wrote:
> Replace devm_add_action() with devm_add_action_or_reset() to make code
> cleaner.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/pci/controller/pci-mvebu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index a4a2bac4f4b2..755651f33811 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1353,11 +1353,9 @@ static int mvebu_pcie_parse_port(struct mvebu_pcie *pcie,
>  		goto skip;
>  	}
>  
> -	ret = devm_add_action(dev, mvebu_pcie_port_clk_put, port);
> -	if (ret < 0) {
> -		clk_put(port->clk);
> +	ret = devm_add_action_or_reset(dev, mvebu_pcie_port_clk_put, port);
> +	if (ret < 0)
>  		goto err;
> -	}

Looks OK to me (and already applied, so no action necessary).

But this is the only use of mvebu_pcie_port_clk_put(), which only does
the clk_put(), so I think we could also remove
mvebu_pcie_port_clk_put() completely and simply do this:

  port->clk = of_clk_get_by_name(child, NULL);
  ...

  ret = devm_add_action_or_reset(dev, clk_put, port->clk)

which would arguably make this more readable because clk_put()
corresponds with of_clk_get_by_name(), and it's clear that port->clk
is the target.

Also, and unrelated, the "err:" label only does a return, so I think
this function would be improved by removing the "err:" label and
replacing all the "goto err" cases with "return -ENOMEM" or whatever.

Bjorn

