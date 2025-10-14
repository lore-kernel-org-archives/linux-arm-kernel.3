Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/pL/zxdRSQmOXjbLpYg7Bqaf8ZVOgkTsOIa+6v3KH/8=; b=TtyvBHAKmDez4k
	8cEHtYe3yGlmzVKtHNAPw1hXu2t3R4UfzC8SO4zywdn/FmC1lzRuxU+0Ftg7l0iyIX3CL8q37TFKV
	7Y3dX8sUNjFjboB+7UiYWfBek7YYXks5SkYz7VoRzj4qZD6rOI3uf1NqgGZ+cC+BTZ3+ohBTX9Eqa
	Z465w2YU4soCSVg4GCdVvfSvChV7WaFw5YBrvXE3ejXE+dfTwfd/cQe1ALE+Rcm72uLJOMYEJUHjf
	Z1SPaqwMSVewR0wAkC2duCdrZhySgRCSCNWvvjZmnAaqlLn/WXFilrtGAj03XgEfi26/yvlyp9xn8
	Qc54WaqjiwSwwQ4bfHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nWb-0000000HYYw-2Lhb;
	Tue, 14 Oct 2025 22:29:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nWY-0000000HYYb-35mG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E76944150;
	Tue, 14 Oct 2025 22:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE3BC4CEE7;
	Tue, 14 Oct 2025 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760480982;
	bh=fczDAyZtv8K84OVARqfM4KVFW127OZ6qLS5n/2jelD4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ALJ/lsQqPvS1w8tuSVW1Ed4tkZvVql++wrAdpO9Swuz+UMkzijiq3/iM7pvcK1L0b
	 sgKv7F3xEvA5fdwriXMZm4GfkPGOsn2gB1YyefpKNsm3TIwu/AFXlGoL8/H0UUbrea
	 oQY9E2SAI4cR8B5oD55ey5fVbl/2428JoA5Jm0wWMQjAxA2GUAo6N7VXLIl5gfx37D
	 wufVUF+IKM//asOyQnvOnv347aLoQoeCNHBEIvan0tnV8JZwFJhX7PZk7TB6qRXS2H
	 nkA8EqxylWTDf1H1YfB+mB2q0evZXAVeTMHuOj+2dxLXRRK0rBts3FVUmcvTXDbiCu
	 hERPkrLuMFqsA==
Date: Tue, 14 Oct 2025 17:29:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v2 1/4] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <20251014222940.GA913235@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014095845.1310624-2-lpieralisi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_152942_796849_AB3884D8 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, Oct 14, 2025 at 11:58:42AM +0200, Lorenzo Pieralisi wrote:
> In some legacy platforms the MSI controller for a PCI host bridge is
> identified by an msi-parent property whose phandle points at an MSI
> controller node with no #msi-cells property, that implicitly means

Looks like you intended to continue the sentence here?

> For such platforms, mapping a device ID and retrieving the MSI controller
> node becomes simply a matter of checking whether in the device hierarchy
> there is an msi-parent property pointing at an MSI controller node with
> such characteristics.
> 
> Add a helper function to of_msi_xlate() to check the msi-parent property in
> addition to msi-map and retrieve the MSI controller node (with a 1:1 ID
> deviceID-IN<->deviceID-OUT  mapping) to provide support for deviceID
> mapping and MSI controller node retrieval for such platforms.

