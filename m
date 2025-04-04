Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6427CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDm+MM6eCH2JMsUCcDzuTNQcKYoavTfO59/wdP1NPA4=; b=M9Ss5qYpZZ9SPifI4Tda60nhsQ
	PMI+lTxOX+Xpk+c03qwfIcePFNZo3t863UMTxr83uua4VzXh63HPd/IFCHlCAq4q+/vk/gjs0OzRn
	CdXrepIWRGP9h54PMsC3SxR+eIrw+bQN5jOvijTmb5lnA5CfoCa+9/xztb84fyhB2HeItxMMdNllH
	TWORS40oICT65WmYIVauzaY0Z2InDqAhF1IOSqrNGwXxnpMtGaS8bTWlBV0+8T0HR4uTwzc7k69zD
	EpypPrQaf5PZTof4Srycg+nPa0iOEZlsvoTknuJGhygcjmw2duIIJovYlFICT9TBwXCoUtZu2Q+u5
	5clJ8nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ozi-0000000CvWk-0EU9;
	Fri, 04 Apr 2025 21:54:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0oxy-0000000CvL9-0Lte
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 21:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ECFB61135;
	Fri,  4 Apr 2025 21:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572D5C4CEDD;
	Fri,  4 Apr 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743803564;
	bh=zfKuyAqEThSpITUsQxukfzwj1EOtZMLMZc21pVrK58U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJLbDe1UWCik0+X07dueePSGryP67mZMHCTK2OzoZPKRioPAbyPo+4gCEfNLSf/eJ
	 6Qp/fWuBKrJZcXMd9IBvlrMC7FDFLvFwYuHitO3LfWNKxm4RJBKVnp7hMAQE+tzITt
	 69k+1zH8kTEd28hZmQfjiOn9K8j6bLQE+0Uvbs0+QcmhRs1SR11IH9Hmv0VB3QH/uW
	 FiuzBA7y52ebnEEM/TyOrp7u58pqPS7CqUwVi0vd5I9IXodxKzKb6QlvgMe121GNPr
	 j4sgKOfZ5dHAnqMYTvJHCltafWgeDABxruiSkEoUaAizrenp3zqr0t2kNnm9w/nyQ1
	 qeQkrB9FIcjRg==
Date: Fri, 4 Apr 2025 16:52:43 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20250404215243.GA412761-robh@kernel.org>
References: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
 <20250404-ep-msi-v16-4-d4919d68c0d0@nxp.com>
 <20250404201140.GA236599-robh@kernel.org>
 <Z/BB/Maq4253H7N2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/BB/Maq4253H7N2@lizhi-Precision-Tower-5810>
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

On Fri, Apr 04, 2025 at 04:33:00PM -0400, Frank Li wrote:
> On Fri, Apr 04, 2025 at 03:11:40PM -0500, Rob Herring wrote:
> > On Fri, Apr 04, 2025 at 03:01:05PM -0400, Frank Li wrote:
> > > Document the use of msi-map for PCI Endpoint (EP) controllers, which can
> > > use MSI as a doorbell mechanism. Each EP controller can support up to 8
> > > physical functions and 65,536 virtual functions.
> > >
> > > Define how to construct device IDs using function bits [2:0] and virtual
> > > function index bits [31:3], enabling msi-map to associate each child device
> > > with a specific msi-specifier.
> > >
> > > Include a device tree example illustrating this configuration.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change from v15 to v16
> > > - new patch
> > > ---
> > >  Documentation/devicetree/bindings/pci/pci-msi.txt | 51 +++++++++++++++++++++++
> > >  1 file changed, 51 insertions(+)
> >
> > Please don't add to .txt files.
> 
> where should put?

Where ever you are putting the schema for msi-map for endpoints... Looks 
like that's nowhere currently. The endpoint side is documented in 
pci-ep.yaml, so there I suppose.

What's in pci-msi.txt already has mostly moved to dtschema 
dtschema/schemas/pci/pci-host-bridge.yaml. 

Rob

