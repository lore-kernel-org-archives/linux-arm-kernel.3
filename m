Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A1C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPfF7tWGgIi6QwyGI04z66zIqd+2JEVIDkcPLUeXhus=; b=EJ1A6waEgjFiQMlX3bxK6MCzPL
	7irr4CX+kqDHbI88XklUvVLBB78j5IXvOPFGFs4ljo3Y8GzGUfRWbwuMLUeB9UxvooVay5OxGHeO0
	MCK6g3mF7AhlOVV+RGht9v2q399AP7xFDcd5cYo58pp1HnzjQL1zp2l1+kQZ6qD1Ki+Ak/n7KilzU
	G1dfS9bh0oYzMK5yCc4VM+2G8eN1TP3ov/GMkmkdSHNGhOOxng7kMb4VBKHBj1Tl3tYRI270D1cLO
	9ZLtRLePVK7EX44p6bkaDkG0NUm3xFQG3+LfrThNn1rx4vKZQ7q+MfEtSqRv6eHXc3gE4bGJZf6oP
	geUepylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7ij-00000006yDe-1djB;
	Wed, 29 Jan 2025 13:03:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7hO-00000006xzn-3lEt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bPfF7tWGgIi6QwyGI04z66zIqd+2JEVIDkcPLUeXhus=; b=cju5zJgvOX+7ImKdA5tVG6fcMz
	VdvaVvwCdT3YzfVtMA5mFgkhZ6L+XHXjMrz8yfSeZdi57m2QYhlCt2F/xZG3wctCrnZJovopUXnpK
	tVhmZW0PZUBfM9orfkgwdCfeFMOvL0ig7aMTVkxsH+PUHRMafWPsUJ9SXf5bzYMmC420=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1td7hD-00986o-0i; Wed, 29 Jan 2025 14:01:31 +0100
Date: Wed, 29 Jan 2025 14:01:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
	linux-fsd@tesla.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com, rcsekar@samsung.com,
	ssiddha@tesla.com, jayati.sahu@samsung.com,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v5 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <8b0f068c-26f7-455a-a546-65531cd7fe48@lunn.ch>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102732epcas5p4618e808063ffa992b476f03f7098d991@epcas5p4.samsung.com>
 <20250128102558.22459-3-swathi.ks@samsung.com>
 <63e64aa6-d018-4e45-acc7-f9d88a7db60f@lunn.ch>
 <002c01db722e$5abc8d10$1035a730$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002c01db722e$5abc8d10$1035a730$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_050142_936991_3FDC2B33 
X-CRM114-Status: GOOD (  10.25  )
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

> > It looks like you should be able to share all the clk_bulk code with
> > tegra_eqos_probe(). The stmmac driver suffers from lots of cut/paste code
> > with no consolidation. You can at least not make the tegra code worse by
> > doing a little refactoring.
> 
> Hi Andrew, 
> Just to clarify, you were referring to refactoring tegra code to use
> clk_bulk APIs, right?

Yes.

	Andrew

