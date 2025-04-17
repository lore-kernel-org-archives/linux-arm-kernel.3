Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B469AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8Xvf44CIcjF/gcpwz3DXiuSv/K80GzZacd9PQxqWtiQ=; b=TW6bPl8YB3z0Gq
	poCL84h+iDnaDPgwX8kSlWuZJ3XNeNNRU9qroIvHHSeyzWtUv5m/pJgIsTBlwMi7jrfncfz26tyKF
	Y76RfFWDWeZys3AoMFOYwpAFVKqnSrv5bJkTnRwoD6qfPzcm84v2iO94kGT3HvWDSMwqD3xqagVy8
	4jleDR/96vckh9dRsdOhrVpnq/ZHPAox3XaFpZbcM3SRfRfnnKQE4cEujGp/FIiN05gqSljV+sbac
	tUqg7JUp1AqYnI5dd4S3Trm9K+togzkfgOLmKN9QPlwY+3Vd6zT6D1ogsdafqPtNL3uoRVeTC4ORs
	3e3G92sJcIxtZ45cD8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SVG-0000000Djqn-2dmU;
	Thu, 17 Apr 2025 16:54:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5STN-0000000DjQP-3E4l;
	Thu, 17 Apr 2025 16:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 085CC5C547C;
	Thu, 17 Apr 2025 16:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E678C4CEE4;
	Thu, 17 Apr 2025 16:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744908740;
	bh=Us5KGJ06EpniB9Lq8EokWDK/QvSzQfAUWxcm5rSlsLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gTtyo+yR7ipvHNpFgGtC0rJ0C7obiBFQy/2hOweKNa78SHw1xMChSfPjq0ku5R4Dl
	 nZEmNhITeZNFbB3imQka3GltevciNGZiW8rZ3V4JEEc/0nHvCs8LuNkERn1W2hDgr4
	 ssR6qKGmmp2I6O8rN6RX6Rvfwc/mbeG/nUZkveU6BgZrJS9UqZ3xOp+c13Lu8NUQGF
	 JCqnk7FL8fUP6vdlxy3NfIPIphVafLJuL915uDh1At6Y8muC1rdff7+XPkhOnDs2JT
	 0cxb5bW7V45t7oz0hjkE77COfGnkywwEaVQqFIEHJ5yxGD24ThUFE1yhd5M7AkIviY
	 cCaIg9TeuBhrA==
Date: Thu, 17 Apr 2025 11:52:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, Shawn Lin <shawn.lin@rock-chips.com>,
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <20250417165219.GA115235@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAC-VTqJpCqcz6NK@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095221_891012_11A8BE63 
X-CRM114-Status: GOOD (  26.67  )
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

On Thu, Apr 17, 2025 at 10:39:49AM +0200, Niklas Cassel wrote:
> On Thu, Apr 17, 2025 at 04:07:51PM +0800, Hans Zhang wrote:
> > On 2025/4/17 15:48, Niklas Cassel wrote:
> > 
> > Hi Niklas and Shawn,
> > 
> > Thank you very much for your discussion and reply.
> > 
> > I tested it on RK3588 and our platform. By setting pci=pcie_bus_safe, the
> > maximum MPS will be automatically matched in the end.
> > 
> > So is my patch no longer needed? For RK3588, does the customer have to
> > configure CONFIG_PCIE_BUS_SAFE or pci=pcie_bus_safe?
> > 
> > Also, for pci-meson.c, can the meson_set_max_payload be deleted?
> 
> I think the only reason why this works is because
> pcie_bus_configure_settings(), in the case of
> pcie_bus_config == PCIE_BUS_SAFE, will walk the bus and set MPS in
> the bridge to the lowest of the downstream devices:
> https://github.com/torvalds/linux/blob/v6.15-rc2/drivers/pci/probe.c#L2994-L2999
> 
> So Hans, if you look at lspci for the other RCs/bridges that don't
> have any downstream devices connected, do they also show DevCtl.MPS 256B
> or do they still show 128B ?
> 
> One could argue that for all policies (execept for maybe PCIE_BUS_TUNE_OFF),
> pcie_bus_configure_settings() should start off by initializing DevCtl.MPS to
> DevCap.MPS (for the bridge itself), and after that pcie_bus_configure_settings()
> can override it depending on policy, e.g. set MPS to 128B in case of
> pcie_bus_config == PCIE_BUS_PEER2PEER, or walk the bus in case of
> pcie_bus_config == PCIE_BUS_SAFE.
> 
> That way, we should be able to remove the setting for pci-meson.c as well.

Thanks, I came here to say basically the same thing.  Ideally I think
the generic code in pcie_bus_configure_settings() should be able to
increase MPS or decrease it such that neither meson_set_max_payload()
nor rockchip_pcie_set_max_payload() is required.

However, the requirement to pick a Kconfig setting makes it a mess.  I
would love to get rid of those Kconfig symbols.  I don't like the
command-line parameters either, but it would definitely be an
improvement if we could nuke the Kconfig symbols and rely on the
command-line parameters.

It's also a problem when devices are hot-added after the hierarchy has
already been set up because the new device might not work correctly in
the existing config.

It's a hard problem to solve.

For new platforms without an install base, maybe it would be easier to
rely on the command-line parameters since there aren't a bunch of
users that would have to change the Kconfig.

Bjorn

