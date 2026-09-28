Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E33CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FVaKbDiYk4u7VSrQ05eP5FO1po2GZJQdT5CKehQq1w=; b=2/nPx/hLBdzUrv5F5KiAjYGLlR
	o8o3LE+29YSh6mXYi0zRkKVIkz1lXAk+GerIhYYCwGivyI7NidpjO9mdfCetWYZUrth/KKaMpQW3k
	rsSu6OV6n2tZf7kWwrIgop6lM2xoPF2RB14YgPQUEiJCfYR4SAYTjECkUNtvikt7Hi/DV1Q4ddzhS
	Ujg3yy7IEMTyJpy1l+oIzPE3sZrk8akehBUTueYxJCuo7H6e2brhHupCaVOt7Jybf2GRU0mZK7ehW
	TljAbM/JtB+DqaAZedo9+rGgnWrkVg2k+GV11w5rYbScRQvJmSUJxPI3Y4ErNY2I/fy6GhW6eEv5+
	YoPlKvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF0k-000000018RC-3lGA;
	Mon, 28 Sep 2026 17:19:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF0i-000000018KD-375W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3FVaKbDiYk4u7VSrQ05eP5FO1po2GZJQdT5CKehQq1w=; b=0dKAqV3NrfVvnDh614huaPuBfE
	RHJ6aVDujUvbOQkb2O6k85yZX3fIojrINSgvjP9XWsTSyCXOAZcVkCdWs0UbbxHskQYQY2+rXOxjK
	RYyTWvuwlEwCjBM6SwHRDPh95i7TL8Lf/SHelCNhyPxcYRAy5YwQo+MQkRtWAH/V6aZA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xBF0Y-007lHA-7P; Mon, 28 Sep 2026 19:19:18 +0200
Date: Mon, 28 Sep 2026 19:19:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk, vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Subject: Re: [PATCH net-next v2 1/2] net: axienet: use device_property and
 fwnode APIs for probe-time config
Message-ID: <f89024c3-0c71-4976-893d-656e154858d8@lunn.ch>
References: <20260928074256.462345-1-maimon.sagi@gmail.com>
 <20260928074256.462345-2-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928074256.462345-2-maimon.sagi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101928_791874_79F158AD 
X-CRM114-Status: GOOD (  20.59  )
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

On Mon, Sep 28, 2026 at 10:42:55AM +0300, Sagi Maimon wrote:
> axienet_probe() reads its configuration exclusively through the of_*
> API, so the driver can only be instantiated from a device tree node.
> 
> The ADVA TimeCard X2 is a PCIe timing card, driven by ptp_ocp, whose
> FPGA contains an AXI Ethernet MAC with an AXI DMA engine.  ptp_ocp is
> going to register the MAC as a child platform device described by a
> software node, so that this driver runs it rather than a copy in
> ptp_ocp.  That needs the probe-time configuration to be readable from a
> software node.
> 
> Convert only the lookups such a caller needs: "xlnx,rxmem", which probe
> requires; "phy-mode"; the MAC address; and the PHY connection, which is
> where phylink finds a "fixed-link" child.  On a device tree this is a
> no-op: device_property_read_u32() dispatches to the of_* implementation
> when dev->fwnode is an OF node, phylink_of_phy_connect() is a wrapper
> around phylink_fwnode_phy_connect(), and device_get_phy_mode() and
> device_get_mac_address() are thin fwnode wrappers around the same
> lookups.  device_get_mac_address() also keeps the "mac-address" nvmem
> cell fallback that of_get_mac_address() has.
> 
> Note that device_get_phy_mode() returns the mode as a positive value
> rather than through an out parameter, so the error test changes from
> "if (ret)" to "if (ret < 0)".
> 
> Everything else stays on the OF API.  "xlnx,txcsum", "xlnx,rxcsum" and
> "xlnx,switch-x-sgmii" are optional, and "xlnx,phy-type" is deprecated in
> favour of "phy-mode".  Without an OF node each of those lookups finds
> nothing, exactly as for a device tree node that leaves them out: no
> checksum offload, no runtime SGMII/1000BASE-X switching and a
> fall-through to "phy-mode".  The "dmas" test likewise selects the
> built-in AXI DMA engine.  The "axistream-connected", "pcs-handle" and
> "phy-handle" phandle lookups stay too: a caller without an OF node takes
> neither branch, getting its DMA registers from its own platform
> resources, and it cannot use the SGMII and 1000BASE-X modes, which need
> a PCS.
> 
> No functional change intended.
> 
> Tested on the X2 with a local ptp_ocp change, with CONFIG_OF disabled
> and enabled: the interface probes with its configuration read from the
> software node and passes traffic.  No device tree board was available,
> so the claim that this is a no-op for device tree users rests on the
> dispatch described above.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>

Lets see what the AI reviewer says about this, but it looks O.K. to me:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

