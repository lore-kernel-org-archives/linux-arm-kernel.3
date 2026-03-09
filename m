Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD4CFCA18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=D8sePYJEXiCEGFxQXjefukfY12BWlHWLY6xeDtqW+Xg=; b=ozxKFZv+6Kax65
	4vTmAaFvss9YzV1fmc9eQZqMKn62k4aX5fWnDM5DLHV7lc6PsseYynDIL2nX5z5X0hFYOoFJ9TUhJ
	ep9GxY4h3WOM7++y5nQXgxI4BDyCOFcn/dZeOFnW/brQy2fpyckdRD5YL9mCJhqcam7NPuu8P0QsP
	KRpZfN4TukyQlNwuvjtwx7NW8j7EkmI0qv+gRjuLRBKYrVK3W4t2BpZDPFxfm2JGDhLMs901ur3+C
	eAqNMRSjQr6GNVkFXo1AVKb3ZfOVIdfPdCYlDEaaxdRVqcx59AKkizZUPM4cxfe0V7/PnjTU30LZD
	4AwRmJzPVA5ZR8EplSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhmo-000000089cI-3XKV;
	Mon, 09 Mar 2026 21:05:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhmn-000000089cB-0qbc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 21:05:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FF3560054;
	Mon,  9 Mar 2026 21:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD26C4CEF7;
	Mon,  9 Mar 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773090307;
	bh=Nq8FH4TTfSWeK3IqSHQXr18jc5JUXALz41xxYhKgNgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kdf6A65npBGYj/ybcEJCHuWvMf/VZj0Jj8ZaOAFs96ROtJKN3tNO6HP1MgrC1B6oy
	 EPz1UZwrSSC9JS6jVh8OFGGbTheePHMFWRYLgBv6QYovtZxwfOJIBlVIiFiT1GlRLD
	 gIb3m8jY9XsN+5f9e3VF1vUYbRS23+wDBhf1FUzktXUHwBjHU/K01iV5QYd4lJUqwT
	 Juq+UXeh/FdpGWKyQnG8gefrB2Wu+pXvMbGgRB3sIPoxuUO6Q4ct39W+i2TnSz6lEb
	 4iJj4AIMUzMPKu8qsjNoIlfsyAQcX/cq7D4MiOj4h7VwqN29Fg5h87eIkiuTTVEPZg
	 88YY2nPe8WVWw==
Date: Mon, 9 Mar 2026 16:05:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Message-ID: <20260309210506.GA589665@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
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

On Mon, Mar 09, 2026 at 01:03:36AM +0530, Vijayanand Jitta wrote:
> ...

> Charan Teja Kalla (1):
>       of: factor arguments passed to of_map_id() into a struct

Please make this subject line match the capitalization of those below,
i.e., "of: Factor arguments ..."

> Robin Murphy (2):
>       of: Add convenience wrappers for of_map_id()
>       of: Respect #{iommu,msi}-cells in maps

