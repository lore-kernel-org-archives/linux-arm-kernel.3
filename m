Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88086D11190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1EPLUQLnNiNj3V4LPNcCt44lf5P2xAY1Wsqu02bF88=; b=zvYGzSpk8lnAS1X4W19YY/zGkU
	flUTKHd2gqbk6ic7T0KR4DoIz8lOZm2ZqnupXw9MB/Oxt7hi0OOOIbHHqNZt35VrPpr3GNPCac+fL
	lZ0ips/CuZMIWo+9hKhpzHDOEkVs4+SakmThpW3c4/ui9QCeYPEXBf7Th5v9fmazrBq4g6Q6g6d7U
	I/3Oj3/qw6kCOyS0rnQiTnqLw3ATeHZvnDYLh75VO1OIZpp5dv+q38FDHAspf3DDLVjpNUagstGS3
	Xod4yGe/VENk7glwPE9qoBI+lTuuTZkOKBzWcsyFW30mVWIP7aUuWk0dsTxPEwm895nLzlyKGGUjM
	IspPxi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hhg-0000000C1qF-1gcZ;
	Sun, 03 Nov 2024 21:00:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7heh-0000000C1c7-3FLi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 20:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86D5A5C26F3;
	Sun,  3 Nov 2024 20:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569F0C4CECD;
	Sun,  3 Nov 2024 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730667421;
	bh=kQwXeMRLlAue8MzM7s00R8H53UF6cT2XhjoFMQqxCkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZfCcs/tF9z6dJVI8kCfdAWIbtmZ93sOavb56I2SXMKj9D34RPhWU6lJGXLkoi9s1
	 hnWUWDui/i83Z5muJ32UcOA3ToCCVPl7KEVkWMEZe682ZFbKXw8uFwjOKH9lg7p57E
	 3gPbhhfdE7hhxIkQFoWz7qBcPWSsuonYzWvCsEK2qTQzI3lC5wRbdt1CHKNeAQks4I
	 u/nJcrwJzBraYbrUAqqhy/XpolIHbvkfjliSzhFnJjqcBpxoD1EhYoq/fIdXXiJbdy
	 BipbuemJxJzsGpkaTD3e50ny4WQVtH1fxWdZooPNsWmM1mI6PFsTo1fw3/PTewR49E
	 D8x4C9H2XQvFw==
Date: Mon, 4 Nov 2024 05:56:59 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: bhelgaas@google.com, lorenzo.pieralisi@arm.com, frank.li@nxp.com,
	mani@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241103205659.GI237624@rocinante>
References: <1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_125703_877147_6BEC6D97 
X-CRM114-Status: GOOD (  11.11  )
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

> The dw_pcie_suspend_noirq() function currently returns success directly
> if no endpoint (EP) device is connected. However, on some platforms, power
> loss occurs during suspend, causing dw_resume() to do nothing in this case.
> This results in a system halt because the DWC controller is not initialized
> after power-on during resume.
> 
> Change call to deinit() in suspend and init() at resume regardless of
> whether there are EP device connections or not. It is not harmful to
> perform deinit() and init() again for the no power-off case, and it keeps
> the code simple and consistent in logic.

Applied to controller/dwc, thank you!

[01/01] PCI: dwc: Fix resume failure if no EP is connected at some platforms
        https://git.kernel.org/pci/pci/c/ec008c493c25

	Krzysztof

