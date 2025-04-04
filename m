Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ED7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 20:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2FeCktkfvPJkJ07OXOlNaEf7xOeMaTsjl/GEVqd+Gc=; b=1yzNrqHAKYSA23xeFBgLirhr1G
	tm74EMaGSexBiniB6an2gbES+29ipraHyV4kU8w/dM7bqfoLOuOfx3PC3wM5IavmnbMfUZGYvJRFT
	Ui+arSW0BOLRJ1cVmJSgVW+nIiY8wGB8K+aiWGUtSQIWHRkPXpof8YieIx9DMmbNhprLoQ6p5nwi5
	djTMX3b+iIyAnL5cGKHo/uaIJWbLbszIgpfl5VFCK7aRQ62pnwVEaM6ocTXyS3rtModB7/N3i2R6m
	wxQljy2ICKMsXoQkHnpmJzokF8lmCtV5WYByTdNGPPKsrUu1mQhG4XW2DkKaiMSwt1oKGAkTgYzVV
	8YBnZijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nPz-0000000ClIS-1foz;
	Fri, 04 Apr 2025 20:13:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nOE-0000000Cl2s-2Vzo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 20:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F44E61139;
	Fri,  4 Apr 2025 20:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B142C4CEDD;
	Fri,  4 Apr 2025 20:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743797501;
	bh=VHeRdeU1SaiFj8DJEwuhTtm9mNs5SIztyxEFxics7os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAmhRw7Nz52NW/mVabsCa688AdBJSVdZkV1u1WrVh4Ig1it56SoT6FD/MZv5N6aj2
	 Ttq1X3XOJkzXfty8JVHMdmJA7mfW8hangGrm80Ra7FDXShmQXXfpXZC2P8qgC5Jp+s
	 uT0vlIO1IWcTxTTQNffblOjXVclF9rOn9xkb5OLCMH3RRzgn11MwOHniYCR2wV4tLD
	 9dcXkPLT1uewh810i7xpoIW7iBxu+bSFZlLBfuG9AvUcgpbfmqRECY74Rm0HGT6GLr
	 Pvccpg3Vra1Bfv2lTc+sZHuctyRI/NFIZAKZjA1CL0P5GdvdS6Mw60hPa4pydOKfu/
	 EF9kclGKQM1QA==
Date: Fri, 4 Apr 2025 15:11:40 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v16 04/15] dt-bindings: pci: pci-msi: Add support for PCI
 Endpoint msi-map
Message-ID: <20250404201140.GA236599-robh@kernel.org>
References: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
 <20250404-ep-msi-v16-4-d4919d68c0d0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ep-msi-v16-4-d4919d68c0d0@nxp.com>
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

On Fri, Apr 04, 2025 at 03:01:05PM -0400, Frank Li wrote:
> Document the use of msi-map for PCI Endpoint (EP) controllers, which can
> use MSI as a doorbell mechanism. Each EP controller can support up to 8
> physical functions and 65,536 virtual functions.
> 
> Define how to construct device IDs using function bits [2:0] and virtual
> function index bits [31:3], enabling msi-map to associate each child device
> with a specific msi-specifier.
> 
> Include a device tree example illustrating this configuration.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v15 to v16
> - new patch
> ---
>  Documentation/devicetree/bindings/pci/pci-msi.txt | 51 +++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Please don't add to .txt files.

Rob

