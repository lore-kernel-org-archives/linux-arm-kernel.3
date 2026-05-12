Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089B3CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvKbVldT7lqh9rjHZyY/TmTszO15Jbo4eHA0n9i6nw0=; b=ZqzNjP08ujHWfFtOwojKqlMleI
	UOc+NAsYuXwtbQQvKtnmWnV62UpYafxZJxvM4ekLfcw/oEf4AfN1/B60JRi6OMjOpo5/Kj9SlUeM6
	DmRoE99QGw0UWjrXTBY+pgKbrgq9ZP0mk+xzVbKDXVEJcCNHFMBpxGfGVROfPmEWrbTm5wTnX9Cil
	llwRB4ynGZhJH8mAnvfxgb1kIi2zLOx44Vk8juOaR59pAY9w9tTWgAcUtmIH51S5lZemCBxRNo6Tr
	IsgJyia6YYSavJtnJ0DRguAn1ozT7gVRlQn4cfwU8w1lkwqY5WmG4gaatTCmX6ZHqzFACsYGbs7G1
	fXHWc/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhKW-0000000Ft8f-0B3z;
	Tue, 12 May 2026 07:15:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhKU-0000000Ft7x-2NPj;
	Tue, 12 May 2026 07:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9014543F07;
	Tue, 12 May 2026 07:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345A6C2BCB0;
	Tue, 12 May 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778570097;
	bh=1Q4A1Q+QYp9tlNCUSo8+pB11jnBSTmWLxUPJejRy7uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+IycF6/JGxzaOmea/L7dX3YcYpWRMeQYigppxCWGK83fhXhnd68xPVSnAukYO+nx
	 KbpGO1P7ZrH95D5TyETTmw+U6JPP1+uCTHisELA/u85SDJ8aRbSYnQ0DecYxtisUTW
	 eJwSo+3seiEYf0ZkVDU4QcXChUJQffuvrri27Mxzt+hg7TjVQJ8EtE3xVEDd5brHNP
	 pJlIImkgCx1rQCJ8UmZOn3f7y+KalI/iVKA3nBVLjIajgnKeJHa6w3wtznloOnCIiz
	 G2tfifp1WmFmLEUE187xCIe37mjVZibLWJ0Z0HewQDTOHE87iunynKyKk25thuVd9Y
	 ljG+Hf52MbVXw==
Date: Tue, 12 May 2026 16:14:55 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, bhelgaas@google.com, 
	lpieralisi@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com, 
	thomas.petazzoni@bootlin.com, pali@kernel.org, ryder.lee@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <20260512071423.GB3606279@rocinante>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
 <6xcq6e6c2jc7wxhvv3kjwp5d2ik62ed7kukb3e62yogf3phtxk@6besox4h2v4n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6xcq6e6c2jc7wxhvv3kjwp5d2ik62ed7kukb3e62yogf3phtxk@6besox4h2v4n>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_001458_627912_32481669 
X-CRM114-Status: GOOD (  10.83  )
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

Hello,

> > > -	/*
> > > -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> > > -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> > > -	 * after Link training completes before sending a Configuration Request.
> > > -	 */
> > > -	if (pci->max_link_speed > 2)
> > > -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > > +	pci_host_common_link_train_delay(pci->max_link_speed);
> > 
> > This comment could move to the helper you added.
> > 
> 
> Not required, as the macro definition in drivers/pci/pci.h already has an
> elaborative comment with spec citation.

So it does, indeed.  Thank you for checking!

	Krzysztof

