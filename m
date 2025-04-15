Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC6AC369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 23:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1zwf8PAMQjv3doPZ9Wzl6LGujqGGPAhAfTza4Qw7gE=; b=3rPtxUpCZi9X/YNegLuvymwJ51
	j0P9453rDnnmGXlaxNmPuGqbgytX4P9UTYRmZrwmF/Y1oXd9+KfL2H5wIQfdYZ5F33DGL3wmEJfyX
	qRzMtKMmHCOqi/WT7NugkU+oGZwXDwdJ4KNmL3QqwQyKpHTj+WF6B218cl8ZvJi6amBRJYd/FgRgQ
	yBSIgDRrC3TWf9yZGyJrKuveQxe1WiLc6WyEMbNP13/AXzszEm24ehFoWnaf1TfVvubY3gsayR2kb
	Y9X6Q1Asp7/ZBx7k40rMZwTYS3MFavyYgD55dcMBzKlLu04HWsplUh5qsLYVQkcZWExnDE2UeP3uh
	fk4rbq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4piz-00000007U6A-3nfR;
	Tue, 15 Apr 2025 23:29:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ph7-00000007Tn4-0xKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 23:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 676815C542A;
	Tue, 15 Apr 2025 23:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5ACEC4CEE7;
	Tue, 15 Apr 2025 23:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744759676;
	bh=xFZThZAwd6sgcs4jLPlvefAr9HMS2oFrx8khX6DALzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s55FM5NHKn9UWkQGkkp3Lm71ct0k86m3v6URIEpcNFl91F7Um+aotyx9yOzTJEU/C
	 bCkdTGLxKsY6W+ndO+e6/hXMooFhnlfJY5LpwR1onOAYr0gBQ9DAV8V+Rr6jHBwZuC
	 X2W2XJ+xuH5aW8+bEM31KoE18yb94akbx2TcOPeuDe9V0PclQsAQqm1fnLMKy9FzFf
	 bmMiAYOSIqfORFs6S/iZaz5r3JImTARJzvxrhHxBZKVAOrOQyqBFmIg0S2CR9BAUAV
	 75QpbV+iJ8pN/TffgLnQF5hfJWho48CMjNbLQ4qrrjetIzhgLmvqhXgH4H97ZUpWms
	 aAp1Zzix7Hqcg==
Date: Tue, 15 Apr 2025 18:27:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, imx@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, dlemoal@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Cassel <cassel@kernel.org>, jdmason@kudzu.us,
	Shawn Guo <shawnguo@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v18 04/15] dt-bindings: PCI: pci-ep: Add support for
 iommu-map and msi-map
Message-ID: <174475967369.1016540.6220438967935307132.robh@kernel.org>
References: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
 <20250414-ep-msi-v18-4-f69b49917464@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-ep-msi-v18-4-f69b49917464@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_162757_323927_7107F5D9 
X-CRM114-Status: GOOD (  14.43  )
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


On Mon, 14 Apr 2025 14:30:58 -0400, Frank Li wrote:
> Document the use of (msi|iommu)-map for PCI Endpoint (EP) controllers,
> which can use MSI as a doorbell mechanism. Each EP controller can support
> up to 8 physical functions and 65,536 virtual functions.
> 
> Define how to construct device IDs using function bits [2:0] and virtual
> function index bits [31:3], enabling (msi|iommu)-map to associate each
> child device with a specific (msi|iommu)-specifier.
> 
> The EP cannot rely on PCI Requester ID (RID) because the RID is determined
> by the PCI topology of the host system. Since the EP may be connected to
> different PCI hosts, the RID can vary between systems and is therefore not
> a reliable identifier.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v17 to v18
> - mask max value should 0x7ffff
> - order according to property name
> 
> Change from v16 to v17
> - new patch
> ---
>  Documentation/devicetree/bindings/pci/pci-ep.yaml | 68 +++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


