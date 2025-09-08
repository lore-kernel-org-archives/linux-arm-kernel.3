Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D98CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5100fgc6dG24IM2sWni8imeShu+6586F+2SnyRoG2QM=; b=IPaKrkyANVCJ3d7xNZQwMdcE/E
	QW0A5lyCG8yQ1gkiYfT0NU6cULHrS+niTdg4IkePKIT8k8MxPVU3s2poRcpgAnY/BhrJ7KaQjXAEy
	u8opt8+zUYoaPNiC1BXDNsdyG3NdxL02saOlUmO9uXjlLgWnFlqpQcxo1smqsEb92l84QCtXkUzoK
	icdjh2pJ2U4dE4hERVzUA/dMIYa7ORYuixlENXRa4BpmJFJhBp2SWVwOabVUcGnrUbDodl2OgwlzE
	cIJN6KE2Ny8Vqubg+5WFRP5bR0DX6E9zzUxPE4uRZyd1PZRq3YbKM4kcABuYW6Ts/toW3zC+4NAYj
	t41Skt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXmI-0000000Ft4Q-2G2H;
	Mon, 08 Sep 2025 09:03:10 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWtH-0000000FZng-0fns
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:06:20 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58886BF8009467;
	Mon, 8 Sep 2025 03:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757318771;
	bh=5100fgc6dG24IM2sWni8imeShu+6586F+2SnyRoG2QM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qCVR9ClpjJQu9QVcDplCWEXMZM6+VSGyNZRyzZ9Tfx9I3VLcDobIhc117PBYWVPMz
	 VUZFOqc8U2vqfgHV0fxKRM86qLVnMMEx/jjtXtA+91lUptuRcSTn0b3jTljOQ+/kk2
	 wtRtEyoU0+B7jjVmOxgWNZQ6qje5RrsQ/lzYHCi8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58886BHa3621244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 03:06:11 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 03:06:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 03:06:11 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58886AW6553673;
	Mon, 8 Sep 2025 03:06:10 -0500
Date: Mon, 8 Sep 2025 13:36:09 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <helgaas@kernel.org>, <kishon@kernel.org>, <vigneshr@ti.com>,
        <stable@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v3] PCI: j721e: Fix programming sequence of "strap"
 settings
Message-ID: <578e5125-21d8-40c8-aaeb-389599cdd32b@ti.com>
References: <b2fb9252-6bfc-45da-973a-31cdfcc86b3d@ti.com>
 <z3ubracmtlq23yicbrhqjgnzrfoqheffm6cvhfnawlvbu4cmmp@ddu2o7xhw5tz>
 <48e9d897-2cd3-48ef-b46a-635ae75f5ac6@ti.com>
 <3wc3t6y5gzzspgfeklsqo3bupfp6gsfy6mls6t66hflcqlqsfk@cu26wv3sow4y>
 <9d2bba15-52e4-432a-8f7f-a0f5d7c2e4ad@ti.com>
 <7hxdcjm7evlphkldct7seytno4is7rjkx5vquvtfhpdkzxdhu6@yocrjgzciwu3>
 <08b87b5f-838b-4f40-ae90-10ded134356e@ti.com>
 <whinfqhjgqbbvlnuzgbukklqi6gocjji4gakqyycovrse4qq6s@6xq5imqbzvux>
 <a0e1d273-239b-44e5-8ccc-0ba83b2b5839@ti.com>
 <wvrouqouhrpoexmggwbc6vjz4xflnylzxrb2ffw3ai7656ehrt@keb53gb2tm2o>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wvrouqouhrpoexmggwbc6vjz4xflnylzxrb2ffw3ai7656ehrt@keb53gb2tm2o>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010619_386399_B3A1AFDD 
X-CRM114-Status: GOOD (  30.58  )
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

On Mon, Sep 08, 2025 at 12:58:51PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Sep 04, 2025 at 11:33:00AM GMT, Siddharth Vadapalli wrote:
> > On Wed, Sep 03, 2025 at 06:51:14PM +0530, Manivannan Sadhasivam wrote:
> > 
> > [...]
> > 
> > > 
> > > I thought put_noidle() will just reduce the refcount and not invoke the
> > > idle/suspend callbacks, but I seem to be wrong here.
> > > 
> > > Anyway, I guess we have no option here other than to drop the
> > > pm_runtime_put_noidle() call. This will keep refcount as 1 and will prevent the
> > > parent (genpd) to not enter runtime suspend, but we have to live with it (this
> > > was also the previous beahvior as well).
> > > 
> > > Btw, pm_runtime_set_active/enable change belongs to a separate patch.
> > 
> > I will work on and post the v4 patch with the following change:
> > - The commit message and the comment in the code will be updated to
> >   indicate that the runtime PM APIs are used to cause 'genpd' to power off
> >   and power on the controller.
> > 
> > I assume that the driver changes can remain as they are in this patch given
> > that the existing behavior has to be preserved. As j721e_pcie_ctrl_init()
> > programs the strap settings, powering off the controller via
> > pm_runtime_put_sync() and powering it on via pm_runtime_get_sync() shall
> > be implemented within j721e_pcie_ctrl_init() itself leaving the rest of the
> > probe function as-is. To summarize, the driver changes will be:
> > 
> > 	j721e_pcie_ctrl_init()
> > 		...Existing code...
> > 	+	Add pm_runtime_put_sync() here to power off controller
> > 		...Existing code to program strap settings...
> > 	+	Add pm_runtime_get_sync() here to power on controller
> > 		...Existing code...
> > 
> > Please let me know what you think.
> 
> I would've preferred changing the runtime PM calls as I suggested initially, but
> still we would keep it incremented which brings the net effect to the same.
> 
> So you can drop my initial comment and post just this patch with improved patch
> description.

Thank you for the clarification. I will implement the above in the v4
patch.

Regards,
Siddharth.

